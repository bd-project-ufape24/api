import sqlite3 from 'sqlite3';
import { open } from 'sqlite';
import path from 'path';
import fs from 'fs';

export const runInserts = async () => {
    const db = await open({
        filename: './src/database/data.db',
        driver: sqlite3.Database
    });

    const insertsPath = path.join(__dirname, '../database/queries/inserts');

    const files = fs.readdirSync(insertsPath);

    const sqlFiles = files
        .filter((file) => file.endsWith('.sql'))
        .sort((a, b) => {
            const numA = parseInt(path.basename(a, '.sql'), 10);
            const numB = parseInt(path.basename(b, '.sql'), 10);
            return isNaN(numA) || isNaN(numB) ? 0 : numA - numB;
        });

    for (const file of sqlFiles) {
        const filePath = path.join(insertsPath, file);
        const sql = fs.readFileSync(filePath, 'utf-8');
        await db.exec(sql);
    }

    console.log('Inserções finalizadas! ✅');

    await db.close();
};
