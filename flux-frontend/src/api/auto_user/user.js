import request from '@/utils/request'

// 查询用户信息表列表
export function listUser(query) {
  return request({
    url: '/auto_user/user/list',
    method: 'get',
    params: query
  })
}

// 查询用户信息表详细
export function getUser(userId) {
  return request({
    url: '/auto_user/user/getById/' + userId,
    method: 'get'
  })
}

// 新增用户信息表
export function addUser(data) {
  return request({
    url: '/auto_user/user/add',
    method: 'post',
    data: data
  })
}

// 修改用户信息表
export function updateUser(data) {
  return request({
    url: '/auto_user/user/update',
    method: 'put',
    data: data
  })
}

// 删除用户信息表
export function delUser(userId) {
  return request({
    url: '/auto_user/user/delete/' + userId,
    method: 'delete'
  })
}