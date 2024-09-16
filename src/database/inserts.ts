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

    let i = 1;
    let filePath = path.join(insertsPath, `${i}.sql`);

    while (fs.existsSync(filePath)) {
        const sql = fs.readFileSync(filePath, 'utf-8');
        await db.exec(sql);
        filePath = path.join(insertsPath, `${++i}.sql`);
    }

    console.log('Inserções finalizadas! ✅');

    await db.close();
};
