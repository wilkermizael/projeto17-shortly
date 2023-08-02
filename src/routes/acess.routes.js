import { Router } from "express";
import { singIn, singUp } from "../controllers/acess.controller.js";


const acessRouter = Router()

acess.post('/signup',validadeSchema(schemaCustomers),singUp)
acess.post('/signin',singIn)


export default customersRouter