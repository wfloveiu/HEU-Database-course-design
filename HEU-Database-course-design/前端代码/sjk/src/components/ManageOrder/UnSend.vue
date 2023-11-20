<template>
    <div>
        <div class="header">
            未发货订单
        </div>
        <div class="body">
            <el-table :data="tableData" style="width: 100%" class="table" border>
                <el-table-column prop="order_id" label="订单编号" width="80" align="center">
                </el-table-column>
                <el-table-column prop="shop_name" label="店铺" width="100" align="center">
                </el-table-column>
                <el-table-column prop="price" label="订单价格" width="80" align="center">
                </el-table-column>
                <el-table-column prop="create_time" label="下单时间" width="200" align="center">
                </el-table-column>
                <el-table-column prop="orderway" label="订餐方式" width="100" align="center">
                </el-table-column>
                <el-table-column prop="cons_phone" label="订餐人电话" width="200" align="center">
                </el-table-column>
                <el-table-column prop="cons_name" label="订餐人姓名" width="100" align="center">
                </el-table-column>
                <el-table-column prop="cons_addre" label="取餐地址" width="200" align="center">
                </el-table-column>
                <el-table-column prop="operate" label="派发订单" width="127" align="center">
                    <template slot-scope="scope">
                        <el-button size="small" type="success" @click="show_dialog(scope.row)">派发此订单
                        </el-button>
                    </template>
                </el-table-column>
            </el-table>

            <el-dialog title="派发订单" :visible.sync="dialog" width="30%">
                <el-form ref="form" :model="form" label-width="120px">

                    <el-form-item label="选择送餐员：" prop="">
                        <el-select v-model="form.dispatcher_id" placeholder="请选择送餐员编号">

                            <el-option v-for="(item, index)  in disp_range" :key="index" :label="item.disp_id"
                                :value="item.disp_id"></el-option>
                        </el-select>

                    </el-form-item>
                    <el-form-item label="预计送货时间：">
                        <el-input v-model="form.deliver_time"></el-input>
                    </el-form-item>
                </el-form>
                <div style="text-align: center;">
                    <el-button type="primary" @click="add()">
                        确定派发
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
            dialog: false,
            form: {
                dispatcher_id: '',
                order_id: '',
                deliver_time: '',
            },
            disp_range: [],
        }
    },
    methods: {
        getdata() {
            this.$axios.get("/api/manager/unsend").then((res) => {
                console.log(res.data);
                if (res.data.status == 200) {
                    this.tableData = res.data.tabledata;
                    this.disp_range = res.data.disp_range;
                }
            })
        },
        show_dialog(row) {
            this.form.order_id = row.order_id;
            this.dialog = true;
        },
        add() {
            this.$axios.post("/api/manager/unsend", this.form).then((res) => {
                if (res.data.status == 200) {
                    this.$message({
                        message: res.data.msg,
                        type: "success"
                    })
                    this.dialog = false;
                    this.getdata();
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

    width: 91%;
    margin: auto;
    margin-top: 30px;
}
</style>