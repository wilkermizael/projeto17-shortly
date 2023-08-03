import { db } from "../database/database.js";
import bcrypt from "bcrypt"

export default async function signUp (req, res){
    const { name ,email,password,confirmPassword } = req.body
    const passwordCrypt = bcrypt.hashSync(password,2)
    console.log(passwordCrypt)
    if(password !== confirmPassword) return res.status(422).send({message:"As senhas não são iguais"})
    
    try{
        //CASO O USUARIO JA ESTEJA CADASTRADO
        const registroResponse = await db.query(`SELECT * FROM register WHERE email =$1; `, [email])
        if(registroResponse.rowCount !== 0 ) return res.sendStatus(409)
        
        //INCLUINDO O USUARIO NO BANCO DE DADOS
        await db.query(`INSERT INTO register (name, email, password) VALUES ($1,$2,$3);`,[name, email, passwordCrypt])
        res.sendStatus(201)
        
       
    }catch(error){
        res.status(500).send(error.message)
    }
} 
