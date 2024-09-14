import { Database } from 'sqlite';
import { faker } from './helpers/faker';

export const insertFornecedores = async (database: Database, count: number) => {
    const values = [];
    const placeholders = [];

    for (let i = 0; i < count; i++) {
        const nome = faker.person.fullName();
        const tipo = faker.helpers.arrayElement(['Pessoa Física', 'Pessoa Jurídica']);
        const documento = faker.string.numeric({ length: tipo === 'Pessoa Física' ? 11 : 14 });
        const pais = faker.helpers.arrayElement(faker.custom.paises);
        const estado = faker.location.state();
        const cidade = faker.location.city();
        const rua = faker.location.street();
        const numero = faker.number.int({ min: 1, max: 1000 });
        const complemento = faker.location.secondaryAddress();

        values.push([nome, tipo, documento, pais, estado, cidade, rua, numero, complemento]);
        placeholders.push('(?, ?, ?, ?, ?, ?, ?, ?, ?)');
    }

    const insertSQL = `
        INSERT INTO Fornecedor (nome, tipo, documento, pais, estado, cidade, rua, numero, complemento)
        VALUES ${placeholders.join(', ')}
    `;

    try {
        await database.run(insertSQL, values.flat());
        console.log('Fornecedores inseridos com sucesso! ✅');
    } catch (error) {
        console.error('Erro ao inserir fornecedores ❌:', error);
    }
};
