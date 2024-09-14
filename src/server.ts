import express from 'express';
import cors from 'cors';
import routes from './http/routes';
import { createTables } from './database/tables';
import bodyParser from 'body-parser';

const app = express();
const port = 3000;

app.use(cors());
app.use(bodyParser.json());
app.use(routes);

createTables()
    .then(() => {
        app.listen(port);
        console.log('Criação de tabelas finalizada ✅');
    })
    .catch((error) => {
        console.log('Erro na criação de tabelas ❌', error);
    });
