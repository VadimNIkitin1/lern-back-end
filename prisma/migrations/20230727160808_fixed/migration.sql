/*
  Warnings:

  - You are about to drop the column `exercise_log_id` on the `Exercise` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Exercise" DROP CONSTRAINT "Exercise_exercise_log_id_fkey";

-- DropForeignKey
ALTER TABLE "Workout_log" DROP CONSTRAINT "Workout_log_user_id_fkey";

-- AlterTable
ALTER TABLE "Exercise" DROP COLUMN "exercise_log_id";

-- AlterTable
ALTER TABLE "Exercise_log" ADD COLUMN     "exercise_id" INTEGER;

-- AlterTable
ALTER TABLE "Workout_log" ALTER COLUMN "user_id" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Exercise_log" ADD CONSTRAINT "Exercise_log_exercise_id_fkey" FOREIGN KEY ("exercise_id") REFERENCES "Exercise"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Workout_log" ADD CONSTRAINT "Workout_log_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;
