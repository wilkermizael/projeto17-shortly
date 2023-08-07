import { db } from "../database/database.js";
import { nanoid } from 'nanoid'

export  async function urlShorten (req, res){
    const {authorization} = req.headers;
    const {url} = req.body
    const shortUrl = nanoid(url.id) 
    const token  = authorization.replace("Bearer ", "")
    if(!token) return res.status(401).send('Unauthorized')
   
    try{
        //VALIDA O USERID
        const tokenDB = await db.query(`SELECT * FROM users WHERE token =$1;`,[token])
        if(tokenDB.rowCount === 0) return res.status(401).send('Unauthorized')
        //ENVIANDO A URL PARA O BANCO DE DADOS CASO ELE AINDA NAO ESTEJA LA
        const sendUrl = await db.query(`SELECT * FROM urlShort WHERE url = $1;`,[url])
        if(sendUrl.rowCount !== 0) return res.status(401).send('Unauthorized')
        await db.query(`INSERT INTO urlShort ("shortUrl", url, "userId" ) VALUES ($1,$2, $3);`,[shortUrl, url, tokenDB.rows[0].id])

        const dataSend = await db.query(`SELECT * FROM urlShort WHERE "shortUrl" = $1;`,[shortUrl]);
        
        delete dataSend.rows[0].userId
        delete dataSend.rows[0].visitCount
        delete dataSend.rows[0].createdAt
       
        res.status(201).send(dataSend.rows[0])
        
       
    }catch(error){
        res.status(500).send(error.message)
    }
} 
export async function listUrl(req, res){
    const {id} = req.params
    try {
        const list = await db.query(`SELECT * FROM urlShort WHERE id=$1`,[id])
       
        if(list.rowCount === 0) return res.sendStatus(404)
        delete list.rows[0].userId
        delete list.rows[0].visitCount
        delete list.rows[0].activ
        delete list.rows[0].createdAt
        //console.log(list.rows[0])
        return res.status(200).send(list.rows[0])
    } catch (error) {
        res.status(500).send(error.message)
    }
}
export async function urlRedirect(req, res){
    const {shortUrl} = req.params
    
    try {
        //CASO A URL ENCURTADA NÃO EXISTA
        const url = await db.query(`SELECT * FROM urlShort WHERE "shortUrl"=$1`,[shortUrl]);
        if(url.rowCount === 0) return res.sendStatus(404)
        
        //ADICIONA URL ENCURTADA NA TABELA RESPECTIVA
        //SE A URL JA FOI ADICIONADA, ADICIONA MAIS UM NA CONTAGEM
        const findUrl = await db.query(`SELECT * FROM urlShort WHERE "shortUrl" =$1`,[shortUrl])
        
        if(findUrl.rowCount !== 0){
            
            await db.query(`UPDATE urlShort SET "visitCount" = $1 WHERE "shortUrl"=$2;`,[findUrl.rows[0].visitCount + 1, shortUrl])
            return res.redirect(url.rows[0].url)
        }

        /*await db.query(`INSERT INTO contUrl (urls, "shortId") VALUES ($1, $2);`,[shortUrl, url.rows[0].userId])
        return res.redirect(url.rows[0].url)*/
    } catch (error) {
        res.status(500).send(error.message)
    }
}
export async function deleteUrl(req, res){
    const {authorization} = req.headers
    
    const {id} = req.params
    try {
        const token  = authorization.replace("Bearer ", "")
        const list = await db.query(`SELECT u.id , u."userId", u2.id as "idImagem", u2."token"
        FROM urlshort u 
        JOIN 
        users u2  on u."userId" = u2.id
        WHERE u.id=$1;`,[id]
        )
        //CASO O TOKEN NÃO EXISTA OU NÃO SEJA PASSADO
        if(list.rowCount === 0) return res.sendStatus(404)
        if(list.rows[0].token !== token) return res.sendStatus(401)
       
        //CASO O USUARIO NÃO SEJA O DONO DA URL 
        if(list.rows[0].userId !== list.rows[0].idImagem) return res.status(401).send({message:"Voce nao pode apagar esse arquivo"})
         //CASO O USUARIO SEJA O DONO DA URL 
        await db.query(`DELETE FROM urlShort WHERE id=$1`, [id])
        return res.sendStatus(204)
    } catch (error) {
        res.status(500).send(error.message)
    }
}


