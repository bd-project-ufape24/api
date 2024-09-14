import { Database } from 'sqlite';
import { faker } from './helpers/faker';

export const insertClientes = async (database: Database, count: number) => {
    const values = [];
    const placeholders = [];

    for (let i = 0; i < count; i++) {
        const nome = faker.person.fullName();
        const pais = faker.helpers.arrayElement(faker.custom.paises);
        const estado = faker.location.state();
        const cidade = faker.location.city();
        const rua = faker.location.street();
        const numero = faker.number.int({ min: 1, max: 1000 });
        const complemento = faker.location.secondaryAddress();
        const limiteCredito = faker.finance.amount({ min: 1000, max: 10000 });

        values.push([nome, pais, estado, cidade, rua, numero, complemento, limiteCredito]);
        placeholders.push('(?, ?, ?, ?, ?, ?, ?, ?)');
    }

    const insertSQL = `
        INSERT INTO Cliente (nome, pais, estado, cidade, rua, numero, complemento, limiteCredito)
        VALUES ${placeholders.join(', ')}
    `;

    try {
        await database.run(insertSQL, values.flat());
        console.log('Clientes inseridos com sucesso! ✅');
    } catch (error) {
        console.error('Erro ao inserir clientes ❌:', error);
    }
};
