import { Router } from "express";
import { urlShorten } from "../controllers/url.controller.js";
import { validadeSchema } from "../middlewares/validateSchema.js";
import schemaUrl from "../schema/url.schema.js";

const urlRouter = Router()

urlRouter.post('/urls/shorten',validadeSchema(schemaUrl), urlShorten)




export default urlRouter