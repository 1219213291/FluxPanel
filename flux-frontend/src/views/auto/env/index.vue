<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">

      <el-form-item label="环境名称" prop="envName">
        <el-input
            v-model="queryParams.envName"
            placeholder="请输入环境名称"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>

      <el-form-item label="键" prop="key">
        <el-input
            v-model="queryParams.key"
            placeholder="请输入键"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>

      <el-form-item label="值" prop="value">
        <el-input
            v-model="queryParams.value"
            placeholder="请输入值"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
            type="primary"
            plain
            icon="Plus"
            @click="handleAdd"
            v-hasPermi="['auto:env:add']"
        >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
            type="success"
            plain
            icon="Edit"
            :disabled="single"
            @click="handleUpdate"
            v-hasPermi="['auto:env:edit']"
        >修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
            type="danger"
            plain
            icon="Delete"
            :disabled="multiple"
            @click="handleDelete"
            v-hasPermi="['auto:env:remove']"
        >删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
            type="warning"
            plain
            icon="Download"
            @click="handleExport"
            v-hasPermi="['auto:env:export']"
        >导出
        </el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="envList" @selection-change="handleSelectionChange"
              row-key="id"
              :tree-props="{ children: 'children', hasChildren: 'hasChildren' }"
              :default-expand-all="isExpandAll"
    >
      <el-table-column type="selection" width="55" align="center"/>

<!--      <el-table-column label="id" align="center" prop="id"/>-->

      <el-table-column label="环境名称" align="center" prop="envName"/>

      <el-table-column label="键" align="center" prop="key"/>
      <el-table-column label="值" align="center" prop="value"/>
      <el-table-column label="备注" align="center" prop="remark"/>
      <el-table-column label="创建时间" align="center" prop="createTime"/>
      <el-table-column label="更新时间" align="center" prop="updateTime"/>


      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Plus" @click="handleUpdateEnv(scope.row)" v-hasPermi="['auto:env:edit']"
                     v-if="!scope.row.parentId">新增
          </el-button>
          <el-button link type="primary" icon="DocumentCopy" @click="handleCopyEnv(scope.row)" v-hasPermi="['auto:env:edit']"
                     v-if="!scope.row.parentId">复制
          </el-button>
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['auto:env:edit']">
            修改
          </el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)"
                     v-hasPermi="['auto:env:remove']">删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
        v-show="total>0"
        :total="total"
        v-model:page="queryParams.pageNum"
        v-model:limit="queryParams.pageSize"
        @pagination="getList"
    />

    <!-- 添加或修改环境表对话框 -->
    <el-dialog :title="title" v-model="open" width="800px" append-to-body>
      <el-form ref="envRef" :model="form" :rules="rules" label-width="80px">

        <el-form-item label="环境名称" prop="envName" v-if="!form.parentId">
          <el-input v-model="form.envName" placeholder="请输入环境名称"/>
        </el-form-item>

        <el-form-item label="键" prop="key" v-if="form.parentId">
          <el-input v-model="form.key" placeholder="请输入键"  />
        </el-form-item>

        <el-form-item label="值" prop="value" v-if="form.parentId">
          <el-input v-model="form.value" placeholder="请输入值" />
        </el-form-item>

        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入备注"/>
        </el-form-item>


      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Env">
import {listEnv, getEnv, delEnv, addEnv, updateEnv,copyEnv} from "@/api/auto/env";

const {proxy} = getCurrentInstance();

const envList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");
const daterangeCreateTime = ref([]);
const daterangeUpdateTime = ref([]);
const isExpandAll = ref(true)

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    envName: null,
    key: null,
    value: null
  },
  rules: {}
});

const {queryParams, form, rules} = toRefs(data);

/** 查询环境表列表 */
function getList() {
  loading.value = true;
  queryParams.value.params = {};
  queryParams.value.params = {};
  if (null != daterangeCreateTime && '' != daterangeCreateTime) {
    queryParams.value.params["beginCreateTime"] = daterangeCreateTime.value[0];
    queryParams.value.params["endCreateTime"] = daterangeCreateTime.value[1];
  }
  if (null != daterangeUpdateTime && '' != daterangeUpdateTime) {
    queryParams.value.params["beginUpdateTime"] = daterangeUpdateTime.value[0];
    queryParams.value.params["endUpdateTime"] = daterangeUpdateTime.value[1];
  }
  listEnv(queryParams.value).then(response => {
    // envList.value = proxy.handleTree(response.rows, 'id')
    envList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
  console.log(envList)

}

// 取消按钮
function cancel() {
  open.value = false;
  reset();
}

// 表单重置
function reset() {
  form.value = {
    createBy: null,
    createTime: null,
    delFlag: null,
    envName: null,
    id: null,
    key: null,
    parentId: null,
    remark: null,
    updateBy: null,
    updateTime: null,
    value: null
  };
  proxy.resetForm("envRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  daterangeCreateTime.value = [];
  daterangeUpdateTime.value = [];
  proxy.resetForm("queryRef");
  handleQuery();
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.id);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "新增环境";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const autoEnvId = row.id || ids.value
  getEnv(autoEnvId).then(response => {
    form.value = response.data;
    open.value = true;
    if (form.value.parentId){
      title.value = "修改";
    }
    else {
      title.value = "修改环境";
    }

  });
}

/** 新增key/value 环境 */
function handleUpdateEnv(row) {
  reset();
  form.value.parentId = row.id
  console.log(form.parentId)
  open.value = true;
  title.value = "新增";
}
function handleCopyEnv(row) {
  copyEnv(row.id).then(response => {
    proxy.$modal.msgSuccess("复制成功");
    open.value = false;
    getList();
  });
}
/** 提交按钮 */
function submitForm() {
  proxy.$refs["envRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateEnv(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addEnv(form.value).then(response => {
          proxy.$modal.msgSuccess("新增成功");
          open.value = false;
          getList();
        });
      }
    }
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _ids = row.id || ids.value;
  proxy.$modal.confirm('是否确认删除环境表编号为"' + _ids + '"的数据项？').then(function () {
    return delEnv(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {
  });
}


/** 导出按钮操作 */
function handleExport() {
  proxy.download('auto/env/export', {
    ...queryParams.value
  }, `env_${new Date().getTime()}.xlsx`)
}

getList();
</script>