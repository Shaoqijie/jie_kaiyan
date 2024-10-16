import { print } from '@kit.BasicServicesKit';
import { PrintTag } from '@ohos/hypium/src/main/Constant';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
//第二次提交
  build() {
    RelativeContainer() {
      Text(this.message)
        .id('HelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })


    }
    .height('100%')
    .width('100%')
  }
}