/*
  Warnings:

  - You are about to drop the column `parentId` on the `child_sku` table. All the data in the column will be lost.
  - Added the required column `parent_id` to the `child_sku` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "child_sku" DROP CONSTRAINT "child_sku_parentId_fkey";

-- AlterTable
ALTER TABLE "child_sku" DROP COLUMN "parentId",
ADD COLUMN     "parent_id" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "child_sku" ADD CONSTRAINT "child_sku_parent_id_fkey" FOREIGN KEY ("parent_id") REFERENCES "main_sku"("sku_id") ON DELETE RESTRICT ON UPDATE CASCADE;
