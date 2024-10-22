import { ViewStateConstant } from '../../../constants/ViewStateConstant'
import { HomeModelIssueListItemList } from '../../../model/HomeModel'
import { RoutePath } from '../../../route/RoutePath'
import { Router } from '../../../route/Router'
import { CategoryRouteParams } from '../../../route/RouterParams'
import { RankViewModel } from '../../../viewModel/RankViewModel'
import { HomeListItemComponent } from '../../home/component/HomeListItemComponent'

@Entry
@Component
export struct RankPage {
   private rankType:string = "weekly"
   private positionIndex:number = 0
   @State viewState:string = ViewStateConstant.VIEW_STATE_LOADING
   @State rankList:HomeModelIssueListItemList[] = []
   private hasInit = false
   private viewModel = new RankViewModel()

  aboutToAppear(): void{
     this.viewModel.getRankList(this.rankType,(result)=>{
       this.rankList = result
     })
   }



  build() {
    Stack() {
     List({space:10,initialIndex:0}){
       ForEach(this.rankList,(item:HomeModelIssueListItemList,index:number)=>{
         ListItem(){
            HomeListItemComponent({item:item})
         }.onClick(()=>{
           Router.push(RoutePath.DetailPage, {
             "id": item.data?.id,
             "playUrl": item.data?.playUrl
           } as CategoryRouteParams)
         })
       })
       ListItem(){
         this.ItemFooter()
       }
     }
     .listDirection(Axis.Vertical)
      .margin({left:10,right:10,top:10,bottom:50})
      .divider({
        strokeWidth: 1,
        color: $r('app.color.color_f5f5f5'),
        startMargin: 10,
        endMargin: 10
      })
    }
    .height('100%')
    .width('100%')
  }
  @Builder ItemFooter(){
     Row(){
       Divider().strokeWidth(2).color($r('app.color.color_999')).width($r('app.float.size_50'))
       Text("我是有底线的")
         .margin({ left: 15, right: 15 })
         .fontColor($r('app.color.color_999'))
         .fontSize($r('app.float.size_text_15'))
       Divider().strokeWidth(2).color($r('app.color.color_999')).width($r('app.float.size_50'))
     }.height($r('app.float.size_50'))
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .width('100%')
  }
}