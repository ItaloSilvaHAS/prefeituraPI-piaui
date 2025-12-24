-- CreateTable
CREATE TABLE "Teste" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Teste_pkey" PRIMARY KEY ("id")
);
