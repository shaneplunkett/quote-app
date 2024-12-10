-- CreateTable
CREATE TABLE "users" (
    "user_id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("user_id")
);

-- CreateTable
CREATE TABLE "main_sku" (
    "id" SERIAL NOT NULL,
    "skuId" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "au_enabled" BOOLEAN NOT NULL DEFAULT false,
    "nz_enabled" BOOLEAN NOT NULL DEFAULT false,
    "my_enabled" BOOLEAN NOT NULL DEFAULT false,
    "uk_enabled" BOOLEAN NOT NULL DEFAULT false,
    "compute" INTEGER NOT NULL,
    "references" TEXT,

    CONSTRAINT "main_sku_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "child_sku" (
    "id" SERIAL NOT NULL,
    "skuId" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "au_enabled" BOOLEAN NOT NULL DEFAULT false,
    "nz_enabled" BOOLEAN NOT NULL DEFAULT false,
    "my_enabled" BOOLEAN NOT NULL DEFAULT false,
    "uk_enabled" BOOLEAN NOT NULL DEFAULT false,
    "compute" INTEGER NOT NULL,
    "parentId" TEXT NOT NULL,

    CONSTRAINT "child_sku_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "vendor" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "vendor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "vendor_sku" (
    "id" SERIAL NOT NULL,
    "vendorId" INTEGER NOT NULL,
    "skuId" INTEGER,
    "childSkuId" INTEGER,
    "region" TEXT NOT NULL,
    "cost" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "vendor_sku_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "quote" (
    "id" TEXT NOT NULL,
    "created" TIMESTAMP(3) NOT NULL,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "quote_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "quote_items" (
    "id" SERIAL NOT NULL,

    CONSTRAINT "quote_items_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "main_sku_skuId_key" ON "main_sku"("skuId");

-- CreateIndex
CREATE UNIQUE INDEX "vendor_sku_vendorId_skuId_region_key" ON "vendor_sku"("vendorId", "skuId", "region");

-- CreateIndex
CREATE UNIQUE INDEX "vendor_sku_vendorId_childSkuId_region_key" ON "vendor_sku"("vendorId", "childSkuId", "region");

-- AddForeignKey
ALTER TABLE "child_sku" ADD CONSTRAINT "child_sku_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES "main_sku"("skuId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "vendor_sku" ADD CONSTRAINT "vendor_sku_vendorId_fkey" FOREIGN KEY ("vendorId") REFERENCES "vendor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "vendor_sku" ADD CONSTRAINT "vendor_sku_skuId_fkey" FOREIGN KEY ("skuId") REFERENCES "main_sku"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "vendor_sku" ADD CONSTRAINT "vendor_sku_childSkuId_fkey" FOREIGN KEY ("childSkuId") REFERENCES "child_sku"("id") ON DELETE SET NULL ON UPDATE CASCADE;
