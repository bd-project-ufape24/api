import express from 'express';
import cors from 'cors';
import routes from './http/routes';

const app = express();

app.use(cors());

app.use(routes);

const port = 3000;

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});