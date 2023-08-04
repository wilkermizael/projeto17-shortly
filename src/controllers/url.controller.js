import { db } from "../database/database.js";
import { nanoid } from 'nanoid'

export  async function urlShorten (req, res){
    const {authorization} = req.headers;
    const {url} = req.body
    const shortUrl = nanoid(url.id) 
    const token  = authorization.replace("Bearer ", "")
    if(!token) return res.status(401).send('Unauthorized')
   
    try{
        //VALIDA O TOKEN
        const tokenDB = await db.query(`SELECT * FROM users WHERE token =$1;`,[token])
        if(tokenDB.rowCount === 0) return res.status(401).send('Unauthorized')

        //ENVIANDO A URL PARA O BANCO DE DADOS
        await db.query(`INSERT INTO "urlShort" ("shortUrl", url, "tokenId" ) VALUES ($1,$2, $3);`,[shortUrl, url, token])
        //const url1 ='VI4avUjErlrYSuWaT7Evx'
        const urlId = await db.query(`SELECT * FROM "urlShort" WHERE "shortUrl" = $1;`,[shortUrl]);
        
        delete urlId.rows[0].tokenId
        delete urlId.rows[0].visitCount
        delete urlId.rows[0].activ
       
        res.status(201).send(urlId.rows[0])
        
       
    }catch(error){
        res.status(500).send(error.message)
    }
} 
export async function listUrl(req, res){
    const {id} = req.params
    try {
        const list = await db.query(`SELECT * FROM "urlShort" WHERE id=$1`,[id])
        if(list.rowCount === 0) return res.sendStatus(404)
        delete list.rows[0].tokenId
        delete list.rows[0].visitCount
        delete list.rows[0].activ
        //console.log(list.rows[0])
        return res.status(200).send(list.rows[0])
    } catch (error) {
        res.status(500).send(error.message)
    }
}

export async function deleteUrl(req, res){
    const {authorization} = req.headers
    
    const {id} = req.params
    try {
        const token  = authorization.replace("Bearer ", "")
        const list = await db.query(`SELECT * FROM "urlShort" WHERE id=$1`,[id])
        if(list.rowCount === 0) return res.sendStatus(404)
        if(list.rows[0].tokenId !== token) return res.sendStatus(401)
       
        await db.query(`DELETE FROM "urlShort" WHERE id=$1`, [id])
        return res.sendStatus(204)
    } catch (error) {
        res.status(500).send(error.message)
    }
}


