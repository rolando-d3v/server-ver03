import { Router } from "express";

// controllers
import * as CtrlUser from "./user.controller";

const router = Router();
router.post("/", CtrlUser.createUser);
router.get("/", CtrlUser.getAllUser);
// router.get("/cripto/:id", CtrlUnidad.getIdCriptoUnidad);
// router.get("/:id", CtrlUnidad.getIdUnidad);
// router.delete("/:id", CtrlRegistro.deleteRegistro);

export default router;
