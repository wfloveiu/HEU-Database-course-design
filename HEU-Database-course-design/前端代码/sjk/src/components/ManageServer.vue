<template>
    <div>
        <div class="header">
            服务员管理
        </div>
        <div class="body">
            <el-table :data="tableData" style="width: 89%" class="table">
                <el-table-column prop="service_id" label="服务员编号" width="200" align="center">
                </el-table-column>
                <el-table-column prop="service_name" label="姓名" width="200" align="center">
                </el-table-column>
                <el-table-column prop="fastfood_shop_name" label="所属店铺" width="200" align="center">
                </el-table-column>
                <el-table-column prop="operate" label="操作" width="200" align="center">
                    <template slot-scope="scope">
                        <el-button size="small" type="danger" @click="showdia_dlt(scope.row)">解雇
                        </el-button>
                    </template>
                </el-table-column>
                <el-table-column width="120" align="center">
                    <template slot="header">
                        <el-button icon="el-icon-plus" size="small" type="success" @click="showdia_add()">添加服务员
                        </el-button>
                    </template>
                </el-table-column>
            </el-table>

            <el-dialog title="添加服务员" :visible.sync="dia_add" width="30%">
                <el-form ref="add_form" :model="add_form" label-width="120px" :rules="add_form_rules">
                    <el-form-item label="服务员编号：" prop="service_id">
                        <el-input v-model="add_form.service_id"></el-input>
                    </el-form-item>
                    <el-form-item label="服务员姓名：" prop="service_name">
                        <el-input v-model="add_form.service_name"></el-input>
                    </el-form-item>
                    <el-form-item label="所属店铺：" prop="fastfood_shop_name">
                        <el-select v-model="add_form.fastfood_shop_name" placeholder="请选择店铺区域">

                            <el-option v-for="(item, index)  in shop_range" :key="index" :label="item.shop_name"
                                :value="item.shop_name"></el-option>
                        </el-select>
                    </el-form-item>
                </el-form>
                <div style="text-align: center;">
                    <el-button type="primary" @click="addserver()">
                        添加
                    </el-button>
                </div>
            </el-dialog>


            <el-dialog title="解雇服务员" :visible.sync="dia_dlt" width="30%">
                <div>
                    确定解雇此服务员吗？
                </div>
                <div style="text-align: center;">
                    <el-button type="primary" @click="deleteserver()">
                        确定
                    </el-button>
                </div>
            </el-dialog>
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
            tableData: [],
            dia_add: false,
            dia_dlt: false,
            add_form: {
                service_id: '',
                service_name: '',
                fastfood_shop_name: '',
            },
            want_delete: '',
            add_form_rules: {
                service_id: [{ required: true, message: '必填项', trigger: 'blur' }],
                service_name: [{ required: true, message: '必填项', trigger: 'blur' }],
                fastfood_shop_name: [{ required: true, message: '必填项', trigger: 'blur' }]

            },
            // 所属店铺的选择范围
            shop_range: [],
        }
    },
    methods: {
        getdata() {
            this.$axios.get("/api/manager/server").then((res) => {
                console.log(res.data);
                if (res.data.status == 200) {
                    this.tableData = res.data.tabledata;
                    this.shop_range = res.data.shop_range;
                }
            })
        },
        showdia_add() {
            this.dia_add = true;
        },
        addserver() {
            this.$refs.add_form.validate(valid => {
                if (!valid)
                    return;
                else //验证通过再发送请求
                    this.$axios.post("/api/manager/server", this.add_form).then((res) => {
                        console.log(res.data);
                        if (res.data.status == 200) {
                            this.$message({
                                message: "添加成功",
                                type: "success"
                            })
                            this.dia_add = false;
                            this.getdata();
                        } else {
                            this.$message({
                                message: res.data.msg,
                                type: "error"
                            })
                        }
                    })
            })


        },
        showdia_dlt(row) {
            this.want_delete = row.service_id;
            this.dia_dlt = true;
        },
        deleteserver() {
            this.$axios.delete("/api/manager/server", { data: { want_delete: this.want_delete } }).then((res) => {
                if (res.data.status == 200) {
                    this.$message({
                        message: res.data.msg,
                        type: "success"
                    })
                    this.getdata()
                    this.dia_dlt = false;
                }
            })
        }
    }
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

    width: 80%;
    margin: auto;
    margin-top: 30px;
}
</style>