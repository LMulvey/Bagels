const API_PATH = "/api";

export default {
    fetch: (type) => {
        return new Promise((resolve, reject) => {
            fetch(`${API_PATH}/${type}`)
            .then(data => data.json())
            .then(data => resolve(data))
        });
    }
}