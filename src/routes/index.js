import { Router } from "express";
import acessRouter from "./acess.routes.js";
import urlRouter from "./url.routes.js";



const router = Router()

router.use(acessRouter)
router.use(urlRouter)

export default router