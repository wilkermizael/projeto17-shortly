import { db } from "../database/database.js";
import bcrypt from "bcrypt"
import { v4 as uuid } from "uuid"

export  async function register (req, res){
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

export async function login (req, res){
    const {email, password} = req.body
    const createToken = uuid()

    try{
        //USUARIO E SENHA COINCIDEM?
        const user = await db.query(`SELECT * FROM register WHERE email= $1`,[email])
        if(user.rowCount === 0) return res.sendStatus(401)
        const validateSenha = bcrypt.compareSync( password, user.rows[0].password)
        if(!validateSenha) return res.sendStatus(401)

        
        
        const userId = await db.query(`SELECT * FROM users WHERE email= $1`,[email])
        if(userId.rowCount ===0){
             //ADICIONA O USUARIO NA TABELA DE USUARIOS SE ELE NAO EXISTE AINDA
            await db.query(`INSERT INTO users (email, token) VALUES ($1, $2) `,[email,createToken])
            return res.status(200).send({token:createToken})
            
        }else{
           //SE EXISTIR UM USUÁRIO RETORNA O TOKEN DELE
            return res.status(200).send({token:userId.rows[0].token})
        }
        
        
        
        
       
    }catch(error){
        res.status(500).send(error.message)
    }
}