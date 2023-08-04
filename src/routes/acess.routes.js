import { Router } from "express";
import { login, register } from "../controllers/acess.controller.js";
import { validadeSchema } from "../middlewares/validateSchema.js";
import schemaLogin from "../schema/login.schema.js";
import schemaRegister from "../schema/register.schema.js";



const acessRouter = Router()

acessRouter.post('/signup',validadeSchema(schemaRegister),register)
acessRouter.post('/signin',validadeSchema(schemaLogin),login)



export default acessRouter