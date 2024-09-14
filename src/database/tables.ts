import sqlite3 from 'sqlite3';
import { open } from 'sqlite';
import fs from 'fs';
import path from 'path';

export const createTables = async () => {
    const db = await open({
        filename: './src/database/data.db',
        driver: sqlite3.Database
    });

    const sqlFilePath = path.join(__dirname, 'schema.sql');
    const sql = fs.readFileSync(sqlFilePath, 'utf-8');

    await db.exec(sql);
    await db.close();
};
