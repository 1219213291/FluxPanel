import request from '@/utils/request'

// 查询环境表列表
export function listEnv(query) {
  return request({
    url: '/auto/env/list',
    method: 'get',
    params: query
  })
}

// 查询环境表详细
export function getEnv(id) {
  return request({
    url: '/auto/env/getById/' + id,
    method: 'get'
  })
}

// 新增环境表
export function addEnv(data) {
  return request({
    url: '/auto/env/add',
    method: 'post',
    data: data
  })
}
// 新增环境表
export function copyEnv(id) {
  return request({
    url: '/auto/env/copy/'+id,
    method: 'get'
  })
}

// 修改环境表
export function updateEnv(data) {
  return request({
    url: '/auto/env/update',
    method: 'put',
    data: data
  })
}

// 删除环境表
export function delEnv(id) {
  return request({
    url: '/auto/env/delete/' + id,
    method: 'delete'
  })
}