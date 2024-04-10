import { PrismaClient } from "@prisma/client";

const prismaClient = new PrismaClient();

async function seed() {}

seed()
  .then(async () => {
    await prismaClient.$disconnect();
  })
  .catch(async (err) => {
    console.error(err);
    await prismaClient.$disconnect();
    process.exit(1);
  });
