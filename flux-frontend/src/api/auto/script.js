import request from '@/utils/request'

// 查询Auto Script 表列表
export function listScript(query) {
  return request({
    url: '/auto/script/list',
    method: 'get',
    params: query
  })
}

// 查询Auto Script 表详细
export function getScript(id) {
  return request({
    url: '/auto/script/getById/' + id,
    method: 'get'
  })
}

// 新增Auto Script 表
export function addScript(data) {
  return request({
    url: '/auto/script/add',
    method: 'post',
    data: data
  })
}

// 修改Auto Script 表
export function updateScript(data) {
  return request({
    url: '/auto/script/update',
    method: 'put',
    data: data
  })
}

// 删除Auto Script 表
export function delScript(id) {
  return request({
    url: '/auto/script/delete/' + id,
    method: 'delete'
  })
}