const API_PATH = "http://localhost:3001/api";

export default {
    get: (url) => {
        return new Promise((resolve, reject) => {
            fetch(`${API_PATH}/${url}`)
            .then(data => data.json())
            .then(data => resolve(data))
        });
    },
    put: (url, data) => {
        return new Promise((resolve, reject) => {
            fetch(`${API_PATH}/${url}`, {
                body: data,
                method: 'PUT',
                headers: {
                    'content-type': 'application/json'
                }
            })
            .then(console.log)
            .then(res => resolve(res))
        });
    }
}