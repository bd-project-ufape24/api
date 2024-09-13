import express from 'express';
import cors from 'cors';
import routes from './http/routes';
import { createTables } from './database/tables';
import bodyParser from 'body-parser';

const app = express();

app.use(cors());
app.use(bodyParser.json());
app.use(routes);

createTables().then(() => {
    const port = 3000;
    app.listen(port, () => {
        console.log(`Server is running on port ${port}`);
    });
}).catch(error => {
    console.error('Error creating tables:', error);
});
