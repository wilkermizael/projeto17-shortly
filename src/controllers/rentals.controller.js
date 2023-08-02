import { db } from "../database/database.js";
import dayjs from "dayjs";

export async function insertRentals (req,res){
     const {customerId, gameId, daysRented} = req.body //customerId: 1,gameId: 1,daysRented: 3
    
     try{
       
     }catch(error){
         res.status(500).send(error.message)
     }
     
}

export async function listRentals (req,res){
    
    try{
       
    }catch(error){
        res.status(500).send(error.message)
    }
   
}

export async function returnRentals(req, res){
   
    try{
       
        
    }catch(error){
        res.status(500).send(error.message)
    }
    
}

export async function deleteRentals(req,res){
    
    try{
       
    }catch(error){
        res.status(500).send(error.message)
    }
}