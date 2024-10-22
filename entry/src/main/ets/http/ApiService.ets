import { AxiosHeaders } from '@ohos/axios'
import { FocusModel } from '../model/FocusModel'
import { HomeModel } from '../model/HomeModel'
import { TopicModel } from '../model/TopicModel'
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

/**
 * 获取关注接口
 */
export function getFocusData(){
  return axiosClient.get<FocusModel>({
    url:baseUrl + "api/v4/tabs/follow",
    headers: commonHeader
  })
}

/**
 * 获取视频详情接口
 * @param id
 */
export function getRelationList(id: number) {
  return axiosClient.get<HomeModel>(
    {
      url: baseUrl + "api/v4/video/related",
      params: { "id": id },
      headers: commonHeader
    }
  )
}

/**
 * 获取专题接口
 */
export function getTopicData(start: number = 0) {
  return axiosClient.get<TopicModel>(
    {
      url: baseUrl + "api/v3/specialTopics",
      params: { "start": start },
      headers: commonHeader
    }
  )
}

/**
 * 获取排行榜
 * @param rankType "weekly" "monthly" "historical"
 * @returns
 */
export function getRankList(rankType: string) {
  return axiosClient.get<HomeModel>(
    {
      url: baseUrl + "api/v4/rankList/videos",
      params: { "strategy": rankType },
      headers: commonHeader
    }
  )
}