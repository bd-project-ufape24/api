import { Router } from 'express';
import path from 'path';
import { executeSQL } from '../database/execute-sql';

const routes = Router();

routes.get('/questao1', async (req, res) => {
    try {
        const sqlFilePath = path.join(__dirname, '../database/queries/1.sql');
        const result = await executeSQL(sqlFilePath);
        res.status(200).json(result);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to execute SQL file' });
    }
});

routes.get('/questao2', async (req, res) => {
    try {
        const sqlFilePath = path.join(__dirname, '../database/queries/2.sql');
        const result = await executeSQL(sqlFilePath);
        res.status(200).json(result);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to execute SQL file' });
    }
});

routes.get('/questao3', async (req, res) => {
    try {
        const sqlFilePath = path.join(__dirname, '../database/queries/3.sql');
        const result = await executeSQL(sqlFilePath);
        res.status(200).json(result);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to execute SQL file' });
    }
});

routes.get('/questao4', async (req, res) => {
    try {
        const sqlFilePath = path.join(__dirname, '../database/queries/4.sql');
        const result = await executeSQL(sqlFilePath);
        res.status(200).json(result);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to execute SQL file' });
    }
});

routes.get('/questao5', async (req, res) => {
    try {
        const sqlFilePath = path.join(__dirname, '../database/queries/5.sql');
        const result = await executeSQL(sqlFilePath);
        res.status(200).json(result);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to execute SQL file' });
    }
});

routes.get('/questao6', async (req, res) => {
    try {
        const sqlFilePath = path.join(__dirname, '../database/queries/6.sql');
        const result = await executeSQL(sqlFilePath);
        res.status(200).json(result);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to execute SQL file' });
    }
});

routes.get('/questao7', async (req, res) => {
    try {
        const sqlFilePath = path.join(__dirname, '../database/queries/7.sql');
        const result = await executeSQL(sqlFilePath);
        res.status(200).json(result);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to execute SQL file' });
    }
});

routes.get('/questao8', async (req, res) => {
    try {
        const sqlFilePath = path.join(__dirname, '../database/queries/8.sql');
        const result = await executeSQL(sqlFilePath);
        res.status(200).json(result);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to execute SQL file' });
    }
});

routes.get('/questao9', async (req, res) => {
    try {
        const sqlFilePath = path.join(__dirname, '../database/queries/9.sql');
        const result = await executeSQL(sqlFilePath);
        res.status(200).json(result);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to execute SQL file' });
    }
});

routes.get('/questao10', async (req, res) => {
    try {
        const sqlFilePath = path.join(__dirname, '../database/queries/10.sql');
        const result = await executeSQL(sqlFilePath);
        res.status(200).json(result);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to execute SQL file' });
    }
});

export default routes;
