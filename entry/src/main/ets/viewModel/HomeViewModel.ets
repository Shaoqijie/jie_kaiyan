import { getHomeListAxios } from '../http/ApiService';
import { HomeModelIssueListItemList } from '../model/HomeModel';
import { BaseViewModel, ResultCallback } from './BaseViewModel';

export  class HomeViewModel extends BaseViewModel{
  /**
   * 获取首页列表输出 -axios 客户端请求
   */
  async getHomeList(resultCallback?: ResultCallback<HomeModelIssueListItemList[]>) {
    await this.httpRequest()
      .promise(getHomeListAxios())
      .then(result => {
        let items = result.issueList[0].itemList
        let list = items.filter((item) => item.type == 'video')
        let bannerList:HomeModelIssueListItemList[]
        let bannerBean:HomeModelIssueListItemList = {}
        bannerList = items.filter((item) => item.type == "banner2")
        if (bannerList.length > 0) {
          bannerBean = {bannerList:bannerList,type:"banner"}
          list.unshift(bannerBean)
        }
        resultCallback?.(list)
        this.splitDate(result.nextPageUrl)
      })
  }
  private splitDate(nextUrl:string){
     let split = nextUrl.split("?")
    let split2 = split[1]
    let split3 = split2.split("&")
    let split4 = split3[0].split("=")
  }
}
let homeViewModel = new HomeViewModel()

export default homeViewModel as HomeViewModel