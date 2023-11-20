<template>
    <div>
        <div class="header">
            个人信息
        </div>
        <div class="body">
            <el-form ref="form" :model="form" label-width="20%" id="selectForm">
                <el-form-item label="用户名：" prop="dispatcher_id">
                    <span>{{ form.user_name }}</span>
                    <!-- <el-input v-model="form.user_name"></el-input> -->
                </el-form-item>
                <el-form-item label="真实姓名：" prop="dispatcher_name">
                    <span>{{ form.real_name }}</span>
                    <!-- <el-input v-model="form.real_name"></el-input> -->
                </el-form-item>
                <el-form-item label="年龄：" prop="dispatcher_phone">
                    <span>{{ form.age }}</span>
                    <!-- <el-input v-model="form.age"></el-input> -->
                </el-form-item>
                <el-form-item label="性别：" prop="dispatcher_phone">
                    <span>{{ form.sex }}</span>
                    <!-- <el-input v-model="form.sex"></el-input> -->
                </el-form-item>
                <el-form-item label="电话：" prop="dispatcher_phone">
                    <span>{{ form.phone }}</span>
                    <!-- <el-input v-model="form.phone"></el-input> -->
                </el-form-item>
                <el-form-item label="邮箱：" prop="dispatcher_phone">
                    <span>{{ form.mail }}</span>
                    <!-- <el-input v-model="form.mail"></el-input> -->
                </el-form-item>
            </el-form>
        </div>
    </div>
</template>

<script>
export default {
    created() {
        this.getdata()
    },
    data() {
        return {
            form: {
                real_name: '',
                sex: '',
                age: '',
                mail: '',
                phone: '',
                user_name: '',
            }
        }
    },
    methods: {
        getdata() {
            this.$axios.get("/api/user/usermsg").then((res) => {
                console.log(res.data);
                if (res.data.status == 200) {
                    this.form.age = res.data.data.age;
                    this.form.mail = res.data.data.mail;
                    this.form.phone = res.data.data.phone;
                    this.form.real_name = res.data.data.real_name;
                    this.form.sex = res.data.data.sex;
                    this.form.user_name = res.data.data.user_name;
                }
            })
        }
    },
}
</script>

<style scoped>
.header {
    width: 100%;
    height: 10%;
    text-align: center;
    line-height: 64px;
    font-size: 20px;
    font-weight: 800;
    border-bottom: 1px solid #e3e3e3;
}

.body {
    width: 40%;
    /* margin: auto; */
    margin-top: 30px;
    margin-left: 30px;

}

#selectForm>>>.el-form-item__label {
    font-size: 18px;
}

span {
    font-size: 18px;
}
</style>