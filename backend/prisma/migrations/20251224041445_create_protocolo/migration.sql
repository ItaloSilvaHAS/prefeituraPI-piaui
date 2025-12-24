-- CreateEnum
CREATE TYPE "StatusProtocolo" AS ENUM ('ABERTO', 'EM_ANALISE', 'CONCLUIDO');

-- CreateTable
CREATE TABLE "Protocolo" (
    "id" TEXT NOT NULL,
    "numero" TEXT NOT NULL,
    "assunto" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "status" "StatusProtocolo" NOT NULL DEFAULT 'ABERTO',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Protocolo_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Protocolo_numero_key" ON "Protocolo"("numero");
