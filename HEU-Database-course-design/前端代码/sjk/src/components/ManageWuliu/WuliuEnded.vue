<template>
    <div>
        <div class="header">
            已完成物流
        </div>
        <div class="body">
            <el-table :data="tableData" style="width: 100%" class="table">
                <el-table-column prop="order_id" label="订单编号" width="200" align="center">
                </el-table-column>
                <el-table-column prop="cons_phone" label="顾客电话" width="200" align="center">
                </el-table-column>
                <el-table-column prop="disp_id" label="送餐员编号" width="200" align="center">
                </el-table-column>
                <el-table-column prop="deliver_time" label="送餐时间" width="200" align="center">

                </el-table-column>

            </el-table>


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

        }
    },
    methods: {
        getdata() {
            this.$axios.get("/api/manager/wuliu?id=1").then((res) => {
                console.log(res.data);
                if (res.data.status == 200) {
                    this.tableData = res.data.tabledata;
                }
            })
        },

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

    width: 62%;
    margin: auto;
    margin-top: 30px;
}
</style>