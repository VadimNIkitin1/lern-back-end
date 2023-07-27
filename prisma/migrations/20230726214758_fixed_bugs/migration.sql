-- DropForeignKey
ALTER TABLE "Exercise_log" DROP CONSTRAINT "Exercise_log_workout_log_id_fkey";

-- DropForeignKey
ALTER TABLE "Exercise_time" DROP CONSTRAINT "Exercise_time_exercise_log_id_fkey";

-- AlterTable
ALTER TABLE "Exercise_log" ALTER COLUMN "workout_log_id" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Exercise_time" ALTER COLUMN "exercise_log_id" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Exercise_log" ADD CONSTRAINT "Exercise_log_workout_log_id_fkey" FOREIGN KEY ("workout_log_id") REFERENCES "Workout_log"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Exercise_time" ADD CONSTRAINT "Exercise_time_exercise_log_id_fkey" FOREIGN KEY ("exercise_log_id") REFERENCES "Exercise_log"("id") ON DELETE SET NULL ON UPDATE CASCADE;
