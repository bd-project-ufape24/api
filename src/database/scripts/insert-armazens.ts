import { Database } from 'sqlite';
import { faker } from './helpers/faker';

export const insertArmazens = async (database: Database, count: number) => {
    const values = [];
    const placeholders = [];

    for (let i = 0; i < count; i++) {
        const nome = faker.company.name();
        const pais = faker.location.country();
        const estado = faker.location.state();
        const cidade = faker.location.city();
        const rua = faker.location.street();
        const numero = faker.number.int({ min: 1, max: 1000 });
        const complemento = faker.location.secondaryAddress();

        values.push([nome, pais, estado, cidade, rua, numero, complemento]);
        placeholders.push('(?, ?, ?, ?, ?, ?, ?)');
    }

    const insertSQL = `
        INSERT INTO Armazem (nome, pais, estado, cidade, rua, numero, complemento)
        VALUES ${placeholders.join(', ')}
    `;

    try {
        await database.run(insertSQL, values.flat());
        console.log('Armazéns inseridos com sucesso! ✅');
    } catch (error) {
        console.error('Erro ao inserir armazéns ❌:', error);
    }
};
