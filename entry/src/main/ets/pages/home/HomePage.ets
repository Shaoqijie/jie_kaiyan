import { ViewStateConstant } from '../../constants/ViewStateConstant'
import { CommonSkeleton } from '../../skelton/CommonSkeleton'
import { CommonTopBar } from '../../views/CommonTopBar'
import { StateComponent } from '../../views/StateComponent'

@Entry
@Component
/**
 * 首页
 */
export struct HomePage {
  @State viewState:string = ViewStateConstant.VIEW_STATE_LOADING
  @State isRefreshing: boolean = false
  @State showLoading: boolean = false

  loadNet(){

  }

  build() {
    Column() {
      CommonTopBar({title:"首页",backButton:false,alpha:1}).align(Alignment.TopStart)
      Stack(){
        StateComponent({
          viewState: this.viewState,
          showSkeleton: true,
          retryCallback: ()=>{
            this.loadNet()
          }
        }){

        }
      }.layoutWeight(1)
    }

  }
  @Builder skeletonContent(){
     CommonSkeleton()
  }
}