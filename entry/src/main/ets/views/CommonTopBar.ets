import { router, window } from '@kit.ArkUI'
import { LogUtils } from '../utils/LogUtils'

/**
 * 自定义App顶部TopBar
 */
@Component
export struct CommonTopBar{
  @Prop title:string
  @Prop alpha:number = 1
  @State statusBarHeight:number = 0
  private backButton:boolean = true
  private onBackClick?: ()=>void

  aboutToAppear() {
    this.setSystemStatusBar()
  }

  setSystemStatusBar(){
    let context = getContext(this)
    window.getLastWindow(context,(error,data)=>{
      //1.设置系统状态栏
      let avoidArea = data.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
      //这里自己设置高度,因为系统返回的高度太高,并不能正确的返回系统状态栏高度,自己二次设置一个接近值
      avoidArea.topRect.height = 50
      this.statusBarHeight = avoidArea.topRect.height
      LogUtils.debug("顶部状态栏的高度",`${this.statusBarHeight}`)
      let bottomHeight = avoidArea.bottomRect.height
      LogUtils.debug("底部系统导航栏的高度", `${bottomHeight}`)
      //2.设置系统状态栏颜色
      const  systemBarProperties: window.SystemBarProperties = {
        //顶部状态栏颜色
        statusBarColor:"#d81e06",
        statusBarContentColor: "ffffff",
        isStatusBarLightIcon: true
      }
      data.setWindowSystemBarProperties(systemBarProperties,(err,result)=>{
        LogUtils.debug("设置状态栏结果码",`${err.code}`)
        if (err.code == 0) {
          LogUtils.debug("状态栏设置成功")
        }else{
          LogUtils.debug("状态栏设置失败",`${err.message}`)
        }
      })
    })
  }

  build() {
  Column(){
    Blank()
      .backgroundColor($r('app.color.color_red'))
      .opacity(this.alpha)
    Stack({alignContent:Alignment.Start}){
       Stack()
         .height($r('app.float.size_50'))
         .width('100%')
         .opacity(this.alpha)
         .backgroundColor($r('app.color.color_red'))
      Flex({direction:FlexDirection.Row,alignItems:ItemAlign.Center}){
         Text(this.title)
           .flexGrow(1)
           .textAlign(TextAlign.Center)
           .fontColor(Color.White)
           .fontSize($r('app.float.size_text_16'))
           .align(Alignment.Center)
           .maxLines(1)
           .textOverflow({overflow:TextOverflow.Ellipsis})
      }.height($r('app.float.size_50'))
      .margin({left:$r('app.float.size_50'),right:$r('app.float.size_50')})
      .alignSelf(ItemAlign.Center)

      if (this.backButton){
        Stack(){
          Image($r('app.media.ic_action_back'))
            .width($r('app.float.size_16'))
            .height($r('app.float.size_16'))
            .align(Alignment.Center)
            .onClick(()=>{
              this.onBackClick?.()
              router.back();
            })
        }.width($r('app.float.size_50'))
        .height($r('app.float.size_50'))
      }
    }.height($r('app.float.size_50'))
    .width('100%')
  }.height(this.statusBarHeight)
  }
}