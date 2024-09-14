import sqlite3 from 'sqlite3';
import { open } from 'sqlite';
import { insertArmazens } from './insert-armazens';
import { insertCategorias } from './insert-categorias';
import { insertClientes } from './insert-clientes';
import { insertFornecedores } from './insert-fornecedores';

export const runInserts = async (count: number) => {
    const db = await open({
        filename: './src/database/data.db',
        driver: sqlite3.Database
    });

    for (let i = 0; i < count; i++) {
        await insertClientes(db, 100);
        await insertArmazens(db, 50);
        await insertFornecedores(db, 50);
        await insertCategorias(db);
    }

    await db.close();
};
