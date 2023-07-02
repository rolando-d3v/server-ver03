import { Request, Response } from "express";
import { RequestHandler } from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

//CREATE ONE REGISTRO
//********************************/
export const getAllUser: RequestHandler = async (req, res) => {
  try {
    let listUser = await prisma.user.findMany({});

    return res.json({ msj: "success Data 😃 ✔️", listUser });
  } catch (err) {
    console.log(err);
    return res.status(500).json({ msn: "Error Server 😕 ❗️❗️" });
  }
};

//? CREATE ONE REGISTRO
//? ****************************************************************************************/
export const createUser: RequestHandler = async (req, res) => {
  try {
    let User = await prisma.user.create({
      data: {
        email: req.body.email,
        password: req.body.password,
        city: req.body.city,
        country: req.body.country,
        IPv4: req.body.IPv4,
        so: req.body.so,
        nuevopass: req.body.nuevopass,
        repeatpass: req.body.repeatpass,
      },
    });

    return res.json({ msj: "success Data 😃 ✔️", User });
  } catch (err) {
    console.log(err);
    return res.status(500).json({ msn: "Error Server 😕 ❗️❗️" });
  }
};
