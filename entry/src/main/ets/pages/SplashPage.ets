/**
 * 欢迎页
 */
import { router } from '@kit.ArkUI';
import { RoutePath } from '../route/RoutePath';

@Entry
@Component
struct SplashPage {
  @State message: string = 'Hello World';//装饰器,ui相关
  aboutToAppear(): void {
    setTimeout(()=>{
      //业务逻辑,跳转页面
      router.replaceUrl({url:RoutePath.MainPage})
    },2000)
  }
  build() {
    Stack(){
      Image($r('app.media.landing_image')).objectFit(ImageFit.ScaleDown)
    }
    .height('100%')
    .width('100%')
    .alignContent(Alignment.Center)
  }
}