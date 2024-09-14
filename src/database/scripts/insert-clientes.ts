import sqlite3 from 'sqlite3';
import { open } from 'sqlite';
import { faker } from '@faker-js/faker';

const insertClientes = async (count: number) => {
    const db = await open({
        filename: './src/database/data.db',
        driver: sqlite3.Database
    });

    const insertSQL = `
        INSERT INTO Cliente (nome, pais, estado, cidade, rua, numero, complemento, limiteCredito)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    `;

    for (let i = 0; i < count; i++) {
        const nome = faker.person.fullName();
        const pais = faker.location.country();
        const estado = faker.location.state();
        const cidade = faker.location.city();
        const rua = faker.location.street();
        const numero = faker.number.int({ min: 1, max: 1000 });
        const complemento = faker.location.secondaryAddress();
        const limiteCredito = faker.finance.amount({ min: 1000, max: 10000 });

        await db.run(insertSQL, [nome, pais, estado, cidade, rua, numero, complemento, limiteCredito]);
    }

    await db.close();
};

insertClientes(100)
    .then(() => console.log('Clientes inseridos com sucesso!'))
    .catch((err) => console.error('Erro ao inserir clientes:', err));
