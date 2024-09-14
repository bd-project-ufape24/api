import { fakerPT_BR } from '@faker-js/faker';

export const faker = {
    ...fakerPT_BR,
    custom: {
        paises: ['Brasil', 'Estados Unidos', 'Japão', 'Inglaterra', 'Rússia'],
        categorias: [
            'Alimentos',
            'Brinquedos',
            'Calçados',
            'Cosméticos',
            'Eletrodomésticos',
            'Eletrônicos',
            'Livros',
            'Móveis',
            'Roupas',
            'Smartphone',
            'Suplementos'
        ]
    }
};
