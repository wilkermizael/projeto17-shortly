import { Router } from "express";
import { listUsers, ranking } from "../controllers/infoUser.controller.js";

const infoUserRouter = Router()


infoUserRouter.get('/users/me', listUsers)
infoUserRouter.get('/ranking', ranking)

export default infoUserRouter