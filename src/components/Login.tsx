function Login() {
  return (
    <div className="flex min-h-screen items-center justify-center bg-purple-200">
      <div className="w-100 flex-col justify-self-center rounded-xl bg-white p-20 shadow-lg outline outline-gray-200">
        <div>
          <img
            className="flex justify-self-center"
            src="../../public/Logo.svg"
            alt="Quotimator Logo"
          />
          <h1 className="justify-self-center text-2xl font-medium">
            Quotimator
          </h1>
        </div>
        <div className="mt-2 mb-2 flex-col justify-self-center">
          <p>E-Mail</p>
          <input
            className="min-w-60 rounded px-1 py-0.5 outline outline-gray-400"
            type="email"
          />
        </div>
        <div className="mt-2 mb-2 flex-col justify-self-center">
          <p>Password</p>
          <input
            className="min-w-60 rounded px-1 py-0.5 outline outline-gray-400"
            type="password"
          />
        </div>
        <div>
          <button
            className="m-5 flex justify-self-center rounded-md bg-purple-600 px-2.5 py-2 font-medium text-white hover:bg-purple-800"
            type="submit"
          >
            Login
          </button>
        </div>
      </div>
    </div>
  );
}

export default Login;
