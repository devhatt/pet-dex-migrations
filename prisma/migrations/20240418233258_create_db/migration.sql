-- CreateTable
CREATE TABLE `users` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(128) NULL,
    `account_type` ENUM('user', 'legal_person') NOT NULL,
    `birthdate` DATETIME(3) NULL,
    `document_id` VARCHAR(14) NULL,
    `avatar_url` VARCHAR(255) NULL,
    `email` VARCHAR(128) NOT NULL,
    `password` VARCHAR(100) NOT NULL,
    `phone_number` VARCHAR(12) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,
    `deleted_at` DATETIME(3) NULL,

    UNIQUE INDEX `users_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `legal_persons` (
    `id` VARCHAR(191) NOT NULL,
    `user_id` VARCHAR(191) NOT NULL,
    `twitter` VARCHAR(191) NULL,
    `facebook` VARCHAR(191) NULL,
    `instagram` VARCHAR(191) NULL,
    `website` VARCHAR(191) NULL,
    `opening_hours` LONGTEXT NOT NULL,
    `adoption_policy` LONGTEXT NOT NULL,

    UNIQUE INDEX `legal_persons_user_id_key`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `addresses` (
    `id` VARCHAR(191) NOT NULL,
    `user_id` VARCHAR(191) NOT NULL,
    `address` VARCHAR(191) NOT NULL,
    `city` VARCHAR(191) NOT NULL,
    `state` VARCHAR(191) NOT NULL,
    `latitude` DECIMAL(65, 30) NULL,
    `longitude` DECIMAL(65, 30) NULL,

    UNIQUE INDEX `addresses_user_id_key`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `breeds` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `type_of` VARCHAR(191) NOT NULL,
    `size` VARCHAR(191) NOT NULL,
    `description` TEXT NULL,
    `height` VARCHAR(191) NULL,
    `weight` VARCHAR(191) NULL,
    `physical_char` VARCHAR(191) NULL,
    `disposition` VARCHAR(191) NULL,
    `ideal_for` VARCHAR(191) NULL,
    `coat` VARCHAR(191) NULL,
    `img_url` VARCHAR(191) NULL,
    `housing_structures` VARCHAR(191) NULL,
    `training_level` VARCHAR(191) NULL,
    `life_expectancy` VARCHAR(191) NULL,
    `category` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pets` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `breed_id` INTEGER NOT NULL,
    `gender` VARCHAR(191) NOT NULL,
    `size` VARCHAR(191) NULL,
    `weight` DOUBLE NULL,
    `height` DOUBLE NULL,
    `adoption_date` DATETIME(3) NOT NULL,
    `birthdate` DATETIME(3) NOT NULL,
    `special_care` BOOLEAN NOT NULL DEFAULT false,
    `special_care_description` LONGTEXT NULL,
    `neutered` BOOLEAN NULL,
    `available_to_adoption` BOOLEAN NOT NULL DEFAULT false,
    `user_id` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pets_image` (
    `id` VARCHAR(191) NOT NULL,
    `url` VARCHAR(255) NOT NULL,
    `pet_id` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `vaccines` (
    `id` VARCHAR(191) NOT NULL,
    `pet_id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `date` DATETIME(3) NOT NULL,
    `doctor_name` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `legal_persons` ADD CONSTRAINT `legal_persons_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `addresses` ADD CONSTRAINT `addresses_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pets` ADD CONSTRAINT `pets_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pets` ADD CONSTRAINT `pets_breed_id_fkey` FOREIGN KEY (`breed_id`) REFERENCES `breeds`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pets_image` ADD CONSTRAINT `pets_image_pet_id_fkey` FOREIGN KEY (`pet_id`) REFERENCES `pets`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `vaccines` ADD CONSTRAINT `vaccines_pet_id_fkey` FOREIGN KEY (`pet_id`) REFERENCES `pets`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
