import { db } from "../database/database.js";

export  async function listUsers (req, res){
    const {authorization} = req.headers
    try{
        const token  = authorization.replace("Bearer ", "")
        const id = await db.query(`SELECT * FROM users WHERE token =$1`,[token])
        if(id.rowCount === 0) return res.sendStatus(401)
        
        //INFORMAÇÕES DO USUARIO
        const infoUser = await db.query(`SELECT register.id, register.name,  SUM(u."visitCount") as "VisitCount" 
        FROM urlshort u 
        JOIN register ON register.id = "userId"
        WHERE u."userId" = $1
        GROUP BY u."userId", register.name, register.id;`,[id.rows[0].id])

        //INFORMAÇÕES DAS URLS
        const infoUrl = await db.query(`SELECT u."id", u."shortUrl",  u."url", SUM(u."visitCount")  AS "visitCount"
        FROM urlshort u
        WHERE u."userId" =$1
        GROUP BY u."id",u."shortUrl", u."url"
        ;`,[id.rows[0].id])

        const array ={...infoUser.rows[0],
            shortenedUrls: infoUrl.rows.map(item => item)
        }
        res.status(200).send(array)
       
    }catch(error){
        res.status(500).send(error.message)
    }
} 

export async function ranking( req,res){
    try{
       
        res.status(200).send(array)
       
    }catch(error){
        res.status(500).send(error.message)
    }
}
