import sqlite3 from 'sqlite3';
import { open } from 'sqlite';

const sqls: string[] = [
    `CREATE TABLE IF NOT EXISTS Cliente (
        ID INTEGER PRIMARY KEY AUTOINCREMENT,
        nome VARCHAR(100) NOT NULL,
        pais VARCHAR(75) NOT NULL,
        estado VARCHAR(50) NOT NULL,
        cidade VARCHAR(50) NOT NULL,
        rua VARCHAR(100) NOT NULL,
        numero INTEGER NOT NULL,
        complemento VARCHAR(100),
        limiteCredito REAL NOT NULL,
        dataCadastro DATETIME DEFAULT CURRENT_TIMESTAMP
    )`,
    `CREATE TABLE IF NOT EXISTS Fornecedor (
        ID INTEGER PRIMARY KEY AUTOINCREMENT,
        nome VARCHAR(100) NOT NULL,
        pais VARCHAR(75) NOT NULL,
        estado VARCHAR(50) NOT NULL,
        cidade VARCHAR(50) NOT NULL,
        rua VARCHAR(100) NOT NULL,
        numero INTEGER NOT NULL,
        complemento VARCHAR(100),
        tipo VARCHAR(50) NOT NULL,
        documento VARCHAR(20) NOT NULL
    )`
];

export const createTables = async () => {
    const db = await open({
        filename: './src/database/data.db',
        driver: sqlite3.Database
    });

    for (const sql of sqls) {
        await db.exec(sql);
    }

    console.log('Tables created or already exist.');
    await db.close();
}
