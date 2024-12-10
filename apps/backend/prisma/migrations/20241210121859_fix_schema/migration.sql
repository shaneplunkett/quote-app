/*
  Warnings:

  - You are about to drop the column `skuId` on the `child_sku` table. All the data in the column will be lost.
  - You are about to drop the column `references` on the `main_sku` table. All the data in the column will be lost.
  - You are about to drop the column `skuId` on the `main_sku` table. All the data in the column will be lost.
  - You are about to drop the column `childSkuId` on the `vendor_sku` table. All the data in the column will be lost.
  - You are about to drop the column `skuId` on the `vendor_sku` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[sku_id]` on the table `main_sku` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[vendorId,sku_id,region]` on the table `vendor_sku` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[vendorId,child_skuid,region]` on the table `vendor_sku` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `sku_id` to the `child_sku` table without a default value. This is not possible if the table is not empty.
  - Added the required column `sku_id` to the `main_sku` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "child_sku" DROP CONSTRAINT "child_sku_parentId_fkey";

-- DropForeignKey
ALTER TABLE "vendor_sku" DROP CONSTRAINT "vendor_sku_childSkuId_fkey";

-- DropForeignKey
ALTER TABLE "vendor_sku" DROP CONSTRAINT "vendor_sku_skuId_fkey";

-- DropIndex
DROP INDEX "main_sku_skuId_key";

-- DropIndex
DROP INDEX "vendor_sku_vendorId_childSkuId_region_key";

-- DropIndex
DROP INDEX "vendor_sku_vendorId_skuId_region_key";

-- AlterTable
ALTER TABLE "child_sku" DROP COLUMN "skuId",
ADD COLUMN     "sku_id" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "main_sku" DROP COLUMN "references",
DROP COLUMN "skuId",
ADD COLUMN     "refs" TEXT,
ADD COLUMN     "sku_id" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "vendor_sku" DROP COLUMN "childSkuId",
DROP COLUMN "skuId",
ADD COLUMN     "child_skuid" INTEGER,
ADD COLUMN     "sku_id" INTEGER;

-- CreateIndex
CREATE UNIQUE INDEX "main_sku_sku_id_key" ON "main_sku"("sku_id");

-- CreateIndex
CREATE UNIQUE INDEX "vendor_sku_vendorId_sku_id_region_key" ON "vendor_sku"("vendorId", "sku_id", "region");

-- CreateIndex
CREATE UNIQUE INDEX "vendor_sku_vendorId_child_skuid_region_key" ON "vendor_sku"("vendorId", "child_skuid", "region");

-- AddForeignKey
ALTER TABLE "child_sku" ADD CONSTRAINT "child_sku_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES "main_sku"("sku_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "vendor_sku" ADD CONSTRAINT "vendor_sku_sku_id_fkey" FOREIGN KEY ("sku_id") REFERENCES "main_sku"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "vendor_sku" ADD CONSTRAINT "vendor_sku_child_skuid_fkey" FOREIGN KEY ("child_skuid") REFERENCES "child_sku"("id") ON DELETE SET NULL ON UPDATE CASCADE;
