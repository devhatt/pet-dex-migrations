import { PrismaClient } from "@prisma/client";
import { dogs } from "./dogs";
import { cats } from "./cats";

const prismaClient = new PrismaClient();

async function seedBreeds() {
  await Promise.all([
    dogs.map(async (dog) => {
      return prismaClient.breed.create({
        data: {
          name: dog.nome,
          type_of: "cachorro",
          size: dog.tamanho || "N/A",
          description: dog.descricao,
          height: dog.altura || "N/A",
          weight: dog.peso || "N/A",
          physical_char: dog.caracteristicasFisicas.join(",") || "N/A",
          disposition: dog.carater.join(",") || "N/A",
          img_url: dog.imgUrl,
          life_expectancy: dog.esperancaDeVida || "N/A",
          coat: dog.tipoDePelo.join(",") || "N/A",
          category: dog.FCI || "N/A",
          ideal_for: dog.idealPara.join(",") || "N/A",
          training_level: dog.nivelDeAdestramento || "N/A",
          housing_structures: dog.clima || "N/A",
        },
      });
    }),

    cats.map(async (cat) => {
      return prismaClient.breed.create({
        data: {
          name: cat.nome,
          size: cat.tamanho || "N/A",
          img_url: cat.imgUrl,
          description: cat.descricao || "N/A",
          height: "N/A",
          weight: cat.peso || "N/A",
          life_expectancy: cat.esperancaDeVida || "N/A",
          type_of: "gato",
          physical_char: cat.caracteristicasFisicas.join(",") || "N/A",
          coat: cat.tipoDePelo.join(",") || "N/A",
          category: cat.FIFE || "N/A",
          disposition: cat.carater.join(",") || "N/A",
          housing_structures: cat.clima || "N/A",
        },
      });
    }),
  ]);
}

seedBreeds()
  .then(async () => {
    console.log("Breeds seeded successfully");
    await prismaClient.$disconnect();
  })
  .catch(async (err) => {
    console.error(err);
    await prismaClient.$disconnect();
    process.exit(1);
  });
