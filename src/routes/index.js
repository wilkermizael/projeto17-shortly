import { Router } from "express";
import acessRouter from "./acess.routes.js";
import pathUrl from "./pathUrl.routes.js"


const router = Router()

router.use(acessRouter)
router.use(pathUrl)


export default router