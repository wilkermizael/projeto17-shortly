import { Router } from "express";
import signUp from "../controllers/acess.controller.js";
import { validadeSchema } from "../middlewares/validateSchema.js";
import schemaRegister from "../schema/register.schema.js";



const acessRouter = Router()

acessRouter.post('/signup',validadeSchema(schemaRegister),signUp)



export default acessRouter