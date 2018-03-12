# Bagels
> A ticket creation and management platform for delivery drivers.

*Formerly known as Bagelr*

#### I'm a pro, just show me the docs
* [API Documentation (courtesy of Postman)](https://documenter.getpostman.com/view/3489528/bagels/RVnVELGx)

## Getting Started - Server
Bagels API is primarily a Rails 5 API server. While it includes a front-end client (WIP) built with `create-react-app`, the API itself is entirely front-end agnostic.

To get started with the _**server**_, you should `git clone` the project:
```sh
git clone git@github.com:/LMulvey/Bagels.git <your folder name>
```

After that, `cd` into the `server` directory and install our wonderful gems:
```sh
bundle install
```

Now you should be ready to launch the API. Start Puma with the `address` and `port` that you desire. The port that you choose is important here as we'll be using CRA to proxy requests to the server. We'll be using **Port 3001** here.
>NOTE: It is best to not use **Port 3000** for the API Server as it is the default port for `create-react-app`.
```sh
rails s -p 3001
```

## Starting the prototype client
The client is being built on `create-react-app`. It is merely a prototype to show how you could interface with the API. 

To get started with the _**client**_, `cd` into the `client` folder located in the `Bagels` root:
```sh
cd client
```

To start, open up the `package.json` file inside the `client` folder. Near the bottom you'll see a line that looks like this:
```javascript
"proxy": "http://localhost:3001"
```

This sets us up to automatically forward any `fetch` or `AJAX` calls from inside `create-react-app` to `localhost:3001` to we don't need to worry about prefixing our URLs. This is optional and if you wish to customize it, you can.
>The port number in this setting should match the port number of the **API Server** you used above.

After you've edited your `package.json`, simply start the `create-react-app` server and you're ready to go:
```sh
npm start
```

After the development server boots, navigate to [http://localhost:3000](http://localhost:3000) to view the `client`.

