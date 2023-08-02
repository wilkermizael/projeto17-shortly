import { Router } from "express"
import { receiveUrl } from "../controllers/pathUrl.controller.js"

const pathUrl = Router()

pathUrl.post('/urls/shorten',receiveUrl)


export default rentRouter