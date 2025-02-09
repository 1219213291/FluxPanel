import request from '@/utils/request'

// 查询项目表列表
export function listProject(query) {
  return request({
    url: '/auto/project/list',
    method: 'get',
    params: query
  })
}

// 查询项目表详细
export function getProject(projectId) {
  return request({
    url: '/auto/project/getById/' + projectId,
    method: 'get'
  })
}

// 新增项目表
export function addProject(data) {
  return request({
    url: '/auto/project/add',
    method: 'post',
    data: data
  })
}

// 修改项目表
export function updateProject(data) {
  return request({
    url: '/auto/project/update',
    method: 'put',
    data: data
  })
}

// 删除项目表
export function delProject(projectId) {
  return request({
    url: '/auto/project/delete/' + projectId,
    method: 'delete'
  })
}