import { AxiosHeaders } from '@ohos/axios'
import { HomeModel } from '../model/HomeModel'
import { HomeViewModel } from '../viewModel/HomeViewModel'
import axiosClient from './AxiosRequest'

let baseUrl = "https://baobab.kaiyanapp.com/"
const commonHeader:AxiosHeaders = new AxiosHeaders()
/**
 * 请求首页数据 - axios客户端请求
 */
export function getHomeListAxios(){
  return axiosClient.get<HomeModel>({
    url:baseUrl + "api/v2/feed",
    headers:commonHeader
  })
}