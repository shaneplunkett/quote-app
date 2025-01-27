function Login() {
  return (
    <div className="bg-purple-200 flex items-center justify-center min-h-screen">
      <div className="bg-white flex-col justify-self-center w-100 p-20 outline-2 outline-gray-200 rounded-xl shadow-lg">
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
        <div className="flex-col justify-self-center mt-2 mb-2">
          <p>E-Mail</p>
          <input
            className="outline outline-gray-400 rounded min-w-60 py-0.5 px-1"
            type="email"
          />
        </div>
        <div className="flex-col justify-self-center mt-2 mb-2">
          <p>Password</p>
          <input
            className="outline outline-gray-400 rounded min-w-60 py-0.5 px-1"
            type="password"
          />
        </div>
        <div>
          <button
            className="m-5 flex justify-self-center bg-purple-600 hover:bg-purple-800 text-white py-2 px-2.5 rounded-md font-medium"
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
