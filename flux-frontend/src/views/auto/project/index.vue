<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">


            <el-form-item label="项目名称" prop="projectName">
              <el-input
                v-model="queryParams.projectName"
                placeholder="请输入项目名称"
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
          v-hasPermi="['auto:project:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['auto:project:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['auto:project:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['auto:project:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="projectList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />

          <el-table-column label="创建人" align="center" prop="createBy" />

          <el-table-column label="创建时间" align="center" prop="createTime" />


          <el-table-column label="项目描述" align="center" prop="projectDescription" />

          <el-table-column label="项目id" align="center" prop="projectId" />

          <el-table-column label="项目名称" align="center" prop="projectName" />

          <el-table-column label="更新人" align="center" prop="updateBy" />

          <el-table-column label="更新时间" align="center" prop="updateTime" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['auto:project:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['auto:project:remove']">删除</el-button>
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

    <!-- 添加或修改项目表对话框 -->
    <el-dialog :title="title" v-model="open" width="800px" append-to-body>
      <el-form ref="projectRef" :model="form" :rules="rules" label-width="80px">

                <el-form-item label="创建人" prop="createBy">
                  <el-input v-model="form.createBy" placeholder="请输入创建人" />
                </el-form-item>

                <el-form-item label="创建时间" prop="createTime">
                  <el-date-picker clearable
                    v-model="form.createTime"
                    type="date"
                    value-format="YYYY-MM-DD"
                    placeholder="请选择创建时间">
                  </el-date-picker>
                </el-form-item>

                <el-form-item label="逻辑删除" prop="deleteTag">
                  <el-input v-model="form.deleteTag" placeholder="请输入逻辑删除" />
                </el-form-item>

                <el-form-item label="项目描述" prop="projectDescription">
                  <el-input v-model="form.projectDescription" type="textarea" placeholder="请输入内容" />
                </el-form-item>

                <el-form-item label="项目名称" prop="projectName">
                  <el-input v-model="form.projectName" placeholder="请输入项目名称" />
                </el-form-item>

                <el-form-item label="更新人" prop="updateBy">
                  <el-input v-model="form.updateBy" placeholder="请输入更新人" />
                </el-form-item>

                <el-form-item label="更新时间" prop="updateTime">
                  <el-date-picker clearable
                    v-model="form.updateTime"
                    type="date"
                    value-format="YYYY-MM-DD"
                    placeholder="请选择更新时间">
                  </el-date-picker>
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

<script setup name="Project">
import { listProject, getProject, delProject, addProject, updateProject } from "@/api/auto/project";

const { proxy } = getCurrentInstance();

const projectList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");
    const daterangeUpdateTime = ref([]);

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    projectDescription: null,
    projectName: null,
  },
  rules: {
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询项目表列表 */
function getList() {
  loading.value = true;
      queryParams.value.params = {};
      if (null != daterangeUpdateTime && '' != daterangeUpdateTime) {
        queryParams.value.params["beginUpdateTime"] = daterangeUpdateTime.value[0];
        queryParams.value.params["endUpdateTime"] = daterangeUpdateTime.value[1];
      }
  listProject(queryParams.value).then(response => {
    projectList.value = response.rows;
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
        createBy: null,        createTime: null,        deleteTag: null,        projectDescription: null,        projectId: null,        projectName: null,        updateBy: null,        updateTime: null  };
  proxy.resetForm("projectRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
      daterangeUpdateTime.value = [];
  proxy.resetForm("queryRef");
  handleQuery();
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.project_id);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加项目表";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const autoProjectProjectId = row.projectId || ids.value
  getProject(autoProjectProjectId).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改项目表";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["projectRef"].validate(valid => {
    if (valid) {
      if (form.value.project_id != null) {
        updateProject(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addProject(form.value).then(response => {
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
  const _project_ids = row.project_id || ids.value;
  proxy.$modal.confirm('是否确认删除项目表编号为"' + _project_ids + '"的数据项？').then(function() {
    return delProject(_project_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}


/** 导出按钮操作 */
function handleExport() {
  proxy.download('auto/project/export', {
    ...queryParams.value
  }, `project_${new Date().getTime()}.xlsx`)
}

getList();
</script>