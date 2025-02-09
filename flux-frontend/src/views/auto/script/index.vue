<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">

      <el-form-item label="脚本编码" prop="scriptCode">
        <el-input
            v-model="queryParams.scriptCode"
            placeholder="请输入脚本编码"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>


      <el-form-item label="脚本名称" prop="scriptName">
        <el-input
            v-model="queryParams.scriptName"
            placeholder="请输入脚本名称"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>


      <el-form-item label="脚本类型" prop="scriptType">
        <el-input
            v-model="queryParams.scriptType"
            placeholder="请输入脚本类型"
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
            v-hasPermi="['auto:script:add']"
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
            v-hasPermi="['auto:script:edit']"
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
            v-hasPermi="['auto:script:remove']"
        >删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
            type="warning"
            plain
            icon="Download"
            @click="handleExport"
            v-hasPermi="['auto:script:export']"
        >导出
        </el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="scriptList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>


      <el-table-column label="脚本ID" align="center" prop="id"/>

      <el-table-column label="脚本编码" align="center" prop="scriptCode"/>

      <el-table-column label="脚本内容" align="center" prop="scriptContent"/>

      <el-table-column label="脚本名称" align="center" prop="scriptName"/>

      <el-table-column label="脚本入参" align="center" prop="scriptParameters"/>

      <el-table-column label="脚本类型" align="center" prop="scriptType"/>


      <el-table-column label="更新时间" align="center" prop="updateTime"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['auto:script:edit']">
            修改
          </el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)"
                     v-hasPermi="['auto:script:remove']">删除
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

    <!-- 添加或修改Auto Script 表对话框 -->
    <el-dialog :title="title" v-model="open" width="800px" append-to-body>
      <el-form ref="scriptRef" :model="form" :rules="rules" label-width="80px">

        <el-form-item label="脚本编码" prop="scriptCode">
          <el-input v-model="form.scriptCode" placeholder="请输入脚本编码"/>
        </el-form-item>

        <el-form-item label="脚本内容" prop="scriptContent">
          <MonacoEditor v-model="form.scriptContent" language="python"></MonacoEditor>
        </el-form-item>

        <el-form-item label="脚本名称" prop="scriptName">
          <el-input v-model="form.scriptName" placeholder="请输入脚本名称"/>
        </el-form-item>

        <el-form-item label="脚本入参" prop="scriptParameters">
          <el-input v-model="form.scriptParameters" type="textarea" placeholder="请输入内容"/>
        </el-form-item>

        <el-form-item label="脚本类型" prop="scriptType">
          <el-input v-model="form.scriptType" placeholder="请输入脚本类型"/>
        </el-form-item>

        <el-form-item label="更新人" prop="updateBy">
          <el-input v-model="form.updateBy" placeholder="请输入更新人"/>
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

<script setup name="Script">
import {listScript, getScript, delScript, addScript, updateScript} from "@/api/auto/script";

const {proxy} = getCurrentInstance();

const scriptList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    scriptCode: null,
    scriptContent: null,
    scriptName: null,
    scriptParameters: null,
    scriptType: null,
  },
  rules: {}
});

const {queryParams, form, rules} = toRefs(data);

/** 查询Auto Script 表列表 */
function getList() {
  loading.value = true;
  listScript(queryParams.value).then(response => {
    scriptList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
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
    id: null,
    scriptCode: null,
    scriptContent: "",
    scriptName: null,
    scriptParameters: null,
    scriptType: null,
    updateBy: null,
    updateTime: null
  };
  proxy.resetForm("scriptRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
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
  title.value = "添加Auto Script 表";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const autoScriptId = row.id || ids.value
  getScript(autoScriptId).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改Auto Script 表";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["scriptRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateScript(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addScript(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除Auto Script 表编号为"' + _ids + '"的数据项？').then(function () {
    return delScript(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {
  });
}


/** 导出按钮操作 */
function handleExport() {
  proxy.download('auto/script/export', {
    ...queryParams.value
  }, `script_${new Date().getTime()}.xlsx`)
}

getList();
</script>