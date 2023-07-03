import express from "express";
import cors from "cors";
import morgan from "morgan";
import dotenv from "dotenv";


import userRoutes from "./api/user/user.routes";



dotenv.config();

//server app
const app = express();


const port = process.env.PORT || '4010'
app.listen(port, () => {
  console.log(`🔥  🚀  server personal runn port ➡️ ... ${port} 😃  ✔️`);
});

//middlewares
app.use(morgan("dev"));
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

// static files
// app.use(express.static("Data"));

//routes
app.use('/user', userRoutes)







