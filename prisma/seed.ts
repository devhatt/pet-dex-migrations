import { PrismaClient } from "@prisma/client";
import { faker } from "@faker-js/faker";

const prismaClient = new PrismaClient();

async function seed() {
  await prismaClient.user.create({
    data: {
      account_type: "user",
      email: faker.internet.email(),
      password: faker.internet.password(),
      name: faker.person.firstName(),
      address: {
        create: {
          city: faker.location.city(),
          state: faker.location.state(),
          address: faker.location.streetAddress(),
          latitude: faker.location.latitude(),
          longitude: faker.location.longitude(),
        },
      },
      avatar_url: faker.image.avatar(),
      birthdate: faker.date.past(),
      document_id: faker.number.int({ max: 1000, min: 1 }).toString(),
      phone_number: "1234567890",
      pets: {
        create: {
          adoption_date: faker.date.past(),
          birthdate: faker.date.past(),
          name: faker.animal.dog(),
          size: "small",
          weight: 10,
          breed_id: 1, // Talvez seja necessário mudar de acordo com sua necessidade
          available_to_adoption: false,
          neutered: true,
          vaccines: {
            create: {
              date: faker.date.past(),
              name: "V8",
              doctor_id: "1",
            },
          },
        },
      },
    },
  });
}

seed()
  .then(async () => {
    await prismaClient.$disconnect();
  })
  .catch(async (err) => {
    console.error(err);
    await prismaClient.$disconnect();
    process.exit(1);
  });
