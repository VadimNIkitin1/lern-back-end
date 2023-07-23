import express from 'express'
import authRoutes from './app/auth/auth.routes.js'
import 'colors'

const app = express()

async function main() {
	// if (process.env.NODE_ENV === 'development') {
	// 	app.use(morgan('dev'))
	// }

	app.use(express.json())
	app.use('/api/auth', authRoutes)

	const PORT = 4200

	app.listen(
		PORT,
		console.log(
			`Server running in ${process.env.NODE_ENV} mode on port ${PORT}`.blue.bold
		)
	)
}

main()
