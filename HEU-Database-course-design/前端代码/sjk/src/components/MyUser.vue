<template>
    <div>
        <div class="header">
            &nbsp;&nbsp; 哈尔滨工程大学外卖平台|网站作者：吴方
        </div>
        <div class="body">
            <!-- 左侧导航栏 -->
            <div class="liner">
                <el-menu default-active="1" class="el-menu-vertical-demo" background-color="#545c64" text-color="#fff"
                    active-text-color="#ffd04b" @select="handleselect">
                    <!-- <el-submenu index="1">
                        <template slot="title">
                            <i class="el-icon-location"></i>
                            <span>导航一</span>
                        </template>
                        <el-menu-item-group>
                            <template slot="title">分组一</template>
                            <el-menu-item index="1-1">选项1</el-menu-item>
                            <el-menu-item index="1-2">选项2</el-menu-item>
                        </el-menu-item-group>
                        <el-menu-item-group title="分组2">
                            <el-menu-item index="1-3">选项3</el-menu-item>
                        </el-menu-item-group>
                        <el-submenu index="1-4">
                            <template slot="title">选项4</template>
                            <el-menu-item index="1-4-1">选项1</el-menu-item>
                        </el-submenu>
                    </el-submenu> -->
                    <el-menu-item index="1">
                        <i class="el-icon-menu"></i>
                        <span slot="title">逛店铺</span>
                    </el-menu-item>

                    <el-submenu index="2">
                        <template slot="title">
                            <i class="el-icon-setting"></i>
                            <span>个人订单</span>
                        </template>
                        <el-menu-item-group>

                            <el-menu-item index="3">已完成订单</el-menu-item>
                            <el-menu-item index="4">已发货订单</el-menu-item>
                            <el-menu-item index="5">未发货订单</el-menu-item>
                        </el-menu-item-group>

                    </el-submenu>

                    <el-submenu>
                        <template slot="title">
                            <i class="el-icon-s-home"></i>
                            <span>个人中心</span>
                        </template>
                        <el-menu-item-group>

                            <el-menu-item index="6">个人信息</el-menu-item>
                            <el-menu-item index="7">修改密码</el-menu-item>
                        </el-menu-item-group>

                    </el-submenu>

                </el-menu>
            </div>
            <div class="main">
                <div id="usershop" v-show="active == 1">
                    <usershop></usershop>
                </div>

                <div id="userfinished" v-show="active == 3">
                    <userfinished></userfinished>
                </div>

                <div id="usersending" v-show="active == 4">
                    <usersending></usersending>
                </div>

                <div id="userunsend" v-show="active == 5">
                    <userunsend></userunsend>
                </div>

                <div id="indimag" v-show="active == 6">
                    <indimsg></indimsg>
                </div>

                <div id="changepwd" v-show="active == 7">
                    <changepwd></changepwd>
                </div>

            </div>
        </div>
    </div>
</template>

<script>
import usershop from '@/components/UserShop.vue'
import userfinished from '@/components/UserOrder/UserFinished.vue'
import usersending from '@/components/UserOrder/UserSending.vue'
import userunsend from '@/components/UserOrder/UserUnsend.vue'
import indimsg from '@/components/UserMsg/IndiMsg.vue'
import changepwd from '@/components/UserMsg/ChPwd.vue'
export default {
    components: {
        usershop: usershop,
        userfinished: userfinished,
        usersending: usersending,
        userunsend: userunsend,
        indimsg: indimsg,
        changepwd: changepwd,
    },
    data() {
        return {
            active: 1,
        };
    },
    methods: {
        handleselect(index) {
            this.active = index;
        }
    },
}  
</script>

<style scoped>
.header {
    width: 100%;
    height: 10vh;
    /* text-align: center; */
    line-height: 10vh;
    font-size: 25px;
    font-weight: 800;
    background-color: #e3e3e3;
    /* padding-left: 100px; */
}

.body {
    width: 100%;
    height: 648px;
    display: flex;
    justify-content: space-around;
}

.liner {
    width: 15%;
    height: 100%;
    background-color: #545c64;
}

.main {
    width: 85%;
}
</style>