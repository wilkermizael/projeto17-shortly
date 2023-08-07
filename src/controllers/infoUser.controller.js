import { db } from "../database/database.js";

export  async function listUsers (req, res){
    const {authorization} = req.headers
    try{
        const token  = authorization.replace("Bearer ", "")
        const id = await db.query(`SELECT * FROM users WHERE token =$1`,[token])
        if(id.rowCount === 0) return res.sendStatus(401)
        console.log(id.rows[0].id)
        //INFORMAÇÕES DO USUARIO
        const infoUser = await db.query(`SELECT register.id, register.name,
        SUM(conturl."cont") AS "visitCount"
        FROM conturl
        JOIN register ON register.id = conturl."shortId"
        WHERE contUrl."shortId" = $1
        GROUP BY contUrl."shortId", register.name, register.id;`,[id.rows[0].id])

        //INFORMAÇÕES DAS URLS
        const infoUrl = await db.query(`SELECT contUrl."id" , conturl."urls" AS "shortUrl",u."url", SUM(conturl."cont") AS "visitCount"
        FROM conturl
        JOIN register r ON r.id = conturl."shortId"
        JOIN urlshort u ON u."shortUrl" = contUrl."urls" 
        where r.id =$1
        GROUP by contUrl."id", u."url";`,[id.rows[0].id])

        const array ={...infoUser.rows[0],
            shortenedUrls: infoUrl.rows.map(item => item)
        }
        res.status(200).send(array)
       
    }catch(error){
        res.status(500).send(error.message)
    }
} 
