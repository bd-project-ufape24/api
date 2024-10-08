import sqlite3 from 'sqlite3';
import { open } from 'sqlite';
import fs from 'fs';

export const executeSQL = async (filePath: string) => {
    const db = await open({
        filename: './src/database/data.db',
        driver: sqlite3.Database
    });

    const sql = fs.readFileSync(filePath, 'utf-8');
    const result = await db.all(sql);

    await db.close();

    return result;
};
