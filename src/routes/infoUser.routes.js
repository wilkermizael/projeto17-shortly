import { Router } from "express";
import { listUsers } from "../controllers/infoUser.controller.js";

const infoUserRouter = Router()


infoUserRouter.get('/users/me', listUsers)

export default infoUserRouter