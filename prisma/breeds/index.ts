import { PrismaClient } from "@prisma/client";
import { dogs } from "./dogs";

const prismaClient = new PrismaClient();

async function seedBreeds() {
  await Promise.all(
    dogs.map(async (dog) => {
      return prismaClient.breed.create({
        data: {
          name: dog.nome,
          img_url: dog.imgUrl,
          description: dog.descricao,
          height: dog.altura,
          weight: dog.peso,
          size: dog.tamanho,
          life_expectancy: dog.esperancaDeVida,
          type_of: "cachorro",
          physical_char: dog.caracteristicasFisicas.join(","),
          coat: dog.tipoDePelo.join(","),
          category: dog.FCI,
          ideal_for: dog.idealPara.join(","),
          training_level: dog.nivelDeAdestramento,
          disposition: dog.carater.join(","),
          housing_structures: dog.clima,
        },
      });
    })
  );
}

seedBreeds()
  .then(async () => {
    await prismaClient.$disconnect();
  })
  .catch(async (err) => {
    console.error(err);
    await prismaClient.$disconnect();
    process.exit(1);
  });
