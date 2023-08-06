import { Router } from "express";
import { deleteUrl, listUrl, urlRedirect, urlShorten } from "../controllers/url.controller.js";
import { validadeSchema } from "../middlewares/validateSchema.js";
import schemaUrl from "../schema/url.schema.js";

const urlRouter = Router()

urlRouter.post('/urls/shorten',validadeSchema(schemaUrl), urlShorten)
urlRouter.get('/urls/:id', listUrl)
urlRouter.delete('/urls/:id', deleteUrl)
urlRouter.get('/urls/open/:shortUrl', urlRedirect)



export default urlRouter