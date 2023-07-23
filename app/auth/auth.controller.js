// @desc   Auth user
// @route  POST/api/auth/login
// @access Public
export const authUser = async (req, res) => {
	const { email, password } = req.body
	res.json({ message: 'You are authenticated! ' })
}
