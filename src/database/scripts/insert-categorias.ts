import { Database } from 'sqlite';
import { faker } from './helpers/faker';

export const insertCategorias = async (database: Database) => {
    const values = [];
    const placeholders = [];
    const categorias = faker.custom.categorias;

    const categoriasBanco = await database.all(`SELECT * FROM Categoria`);
    const novasCategorias = categorias.filter((nome) => !categoriasBanco.some((categoria) => categoria.nome === nome));

    if (novasCategorias.length === 0) {
        console.log('Nenhuma nova categoria para inserir.');
        return;
    }

    for (let i = 0; i < novasCategorias.length; i++) {
        const nome = novasCategorias[i];
        const descricao = 'Descrição de ' + nome;

        values.push([nome, descricao]);
        placeholders.push('(?, ?)');
    }

    const insertSQL = `INSERT INTO Categoria (nome, descricao) VALUES ${placeholders.join(', ')} `;

    try {
        await database.run(insertSQL, values.flat());
        console.log('Categorias inseridas com sucesso! ✅');
    } catch (error) {
        console.error('Erro ao inserir categorias ❌:', error);
    }
};
