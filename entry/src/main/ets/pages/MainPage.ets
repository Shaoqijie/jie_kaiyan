import { print } from '@kit.BasicServicesKit';
import { PrintTag } from '@ohos/hypium/src/main/Constant';
import { CommonConstants } from '../constants/CommonConstants';
import { TabItem } from '../model/TabItem';
import  MainViewModel  from '../viewModel/MainViewModel';
import { FindPage } from './find/FindPage';
import { HomePage } from './home/HomePage';

/**
 * 首页
 */
@Entry
@Component
struct Index {
  @State selectedIndex: number = 0
  @Provide homeTabSelected: number = 0
  @State loadingTips: string = "加载中..."
  @State loadingShow: boolean = false
//第二次提交
  build() {
    Column() {
      Tabs({index:this.selectedIndex,barPosition:BarPosition.End}){
        TabContent(){
          HomePage()
        }.tabBar(this.TabBottom(MainViewModel.tabTitle[0],0))

        TabContent(){
          FindPage()
        }.tabBar(this.TabBottom(MainViewModel.tabTitle[1],1))
      }.barMode(BarMode.Fixed)
      .barWidth('100%')
      .scrollable(false)
      .barHeight($r('app.float.tab_bar_height'))
      .onChange((index:number)=>{
        this.selectedIndex = index
        this.homeTabSelected = index
      })
    }
    .height('100%')
    .width('100%')

  }
  @Builder
  TabBottom(item:TabItem,index:number){
    Column(){
      Image(this.selectedIndex == index ? item.icon_selected : item.icon_select)
        .height($r('app.float.tab_image_size'))
        .width($r('app.float.tab_image_size'))
        .margin({
          top:$r('app.float.tab_margin_top'),
          bottom:$r('app.float.tab_margin_bottom')
        })

      Text(item.title)
        .width(CommonConstants.FULL_WIDTH)
        .height($r('app.float.tab_text_height'))
        .fontSize($r('app.float.tab_text_font_size'))
        .fontWeight(CommonConstants.TAB_ITEM_FONT_WEIGHT)
        .fontColor(this.selectedIndex === index ? $r('app.color.color_red') : Color.Gray)
        .textAlign(TextAlign.Center)
        .margin({
          bottom:$r('app.float.tab_text_margin_bottom')
        })
    }.height(CommonConstants.FULL_HEIGHT)
    .width(CommonConstants.FULL_WIDTH)
    .justifyContent(FlexAlign.Center)
    .backgroundColor($r("app.color.color_f5f5f5"))
  }
}