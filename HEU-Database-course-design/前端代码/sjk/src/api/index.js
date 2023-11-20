import axios from "axios"
// import { Store } from "vuex";

const aaxios = axios.create({
    // baseURL: "http://192.168.192.1:5000",
    baseURL: "http://127.0.0.1:5000",
    timeout: 5000
})

//在发请求之前：请求拦截器可以检测到，加入token

aaxios.interceptors.request.use((config) => {
    let access_token = localStorage.getItem('token');
    // console.log(access_token);
    if (access_token) {
        config.headers.token = localStorage.getItem('token')
    }

    return config;
});
//对外暴露
export default aaxios;