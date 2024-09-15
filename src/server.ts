import express from 'express';
import cors from 'cors';
import routes from './http/routes';
import bodyParser from 'body-parser';
import { createTables } from './database/create-tables';
import { runInserts } from './database/scripts/insert';

const app = express();
const port = 3000;

app.use(cors());
app.use(bodyParser.json());
app.use(routes);

app.listen(port, () => console.log(`Servidor rodando na porta ${port} 🚀`));

createTables()
    .then(() => {
        console.log('Criação de tabelas finalizada! ✅');
    })
    .catch((error) => {
        console.log('Erro na criação de tabelas ❌', error);
    });

runInserts(1);