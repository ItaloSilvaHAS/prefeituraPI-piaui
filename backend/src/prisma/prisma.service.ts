import { Injectable, OnModuleInit, OnModuleDestroy } from '@nestjs/common';
import { PrismaClient, Prisma } from '@prisma/client';
import { Pool } from 'pg';
import { PrismaPg } from '@prisma/adapter-pg';

@Injectable()
export class PrismaService
  extends PrismaClient<Prisma.PrismaClientOptions, never, never>
  implements OnModuleInit, OnModuleDestroy
{
  constructor() {
    // No Prisma 7, é necessário fornecer um adapter ou accelerateUrl
    const pool = new Pool({ connectionString: process.env.DATABASE_URL });
    const adapter = new PrismaPg(pool);
    super({ adapter } as Prisma.PrismaClientOptions);
  }

  async onModuleInit() {
    try {
      await this.$connect();
      console.log('🟢 Prisma 7 conectado com sucesso');
    } catch (error) {
      console.error('🔴 Erro ao conectar no Prisma:', error);
    }
  }

  async onModuleDestroy() {
    await this.$disconnect();
    console.log('🔴 Prisma desconectado');
  }
}
