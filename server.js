import express from 'express'
import authRoutes from './app/auth/auth.routes.js'
import userRoutes from './app/user/user.routes.js'
import dotenv from 'dotenv'
import morgan from 'morgan'
import 'colors'
import { prisma } from './app/prisma.js'
import { errorHandler, notFound } from './app/middleware/error.middleware.js'

// dotenv загружает переменные из файла .env в файлы process.env
dotenv.config()

const app = express()

async function main() {
	// morgan для логирования запросов
	if (process.env.NODE_ENV === 'development') {
		app.use(morgan('dev'))
	}

	app.use(express.json())
	app.use('/api/auth', authRoutes)
	app.use('/api/users', userRoutes)

	app.use(notFound)
	app.use(errorHandler)

	const PORT = process.env.PORT || 4200

	app.listen(
		PORT,
		console.log(
			`🚀 Server running in ${process.env.NODE_ENV} mode on port ${PORT}`.blue
				.bold
		)
	)
}

main()
	.then(async () => {
		await prisma.$disconnect()
	})
	.catch(async e => {
		console.error(e)
		await prisma.$disconnect()
		process.exit(1)
	})
