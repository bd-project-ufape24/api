import path from 'path';
import { Router } from 'express';
import { executeSQL } from '../database/execute-sql';

const routes = Router();
const queriesPath = path.join(__dirname, '../database/queries');

const createQuestionRoute = (number: number) => {
    routes.get(`/question${number}`, async (req, res) => {
        try {
            const sqlFilePath = path.join(queriesPath, `${number}.sql`);
            const result = await executeSQL(sqlFilePath);
            res.status(200).json(result);
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: 'Failed to execute SQL file' });
        }
    });
};

for (let i = 1; i <= 10; i++) {
    createQuestionRoute(i);
}

export default routes;
