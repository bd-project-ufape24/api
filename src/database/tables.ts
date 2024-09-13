import sqlite3 from 'sqlite3';
import { open } from 'sqlite';

export const createTables = async () => {
    const db = await open({
        filename: './src/database/database.db',
        driver: sqlite3.Database
    });

    await db.exec(`CREATE TABLE IF NOT EXISTS Cliente (
        ID INTEGER PRIMARY KEY AUTOINCREMENT,
        nome VARCHAR(100) NOT NULL,
        pais VARCHAR(75) NOT NULL,
        estado VARCHAR(50) NOT NULL,
        cidade VARCHAR(50) NOT NULL,
        rua VARCHAR(100) NOT NULL,
        numero INTEGER NOT NULL,
        complemento VARCHAR(100),
        cep VARCHAR(9) NOT NULL,
        limiteCredito REAL NOT NULL,
        dataCadastro DATETIME DEFAULT CURRENT_TIMESTAMP
    )`);

    console.log('Tables created or already exist.');
    await db.close();
}
