/**
 * 首页底部Tab显示数据
 */
import { TabItem } from '../model/TabItem'

export class MainViewModel{

  tabTitle: Array<TabItem> = [
    {
      index: 0,
      title:'首页',
      icon_selected:$r('app.media.icon_sel_home'),
      icon_select:$r('app.media.icon_unsel_home')
    },
    {
      index: 1,
      title:'发现',
      icon_selected:$r('app.media.icon_sel_find'),
      icon_select:$r('app.media.icon_unsel_find')
    },
    {
      index: 2,
      title: "热门",
      icon_selected: $r('app.media.icon_sel_hot'),
      icon_select: $r('app.media.icon_unsel_hot')
    },
    {
      index: 3,
      title: "我的",
      icon_selected: $r('app.media.icon_sel_mine'),
      icon_select: $r('app.media.icon_unsel_mine')
    }
  ]
}

let mainViewModel = new MainViewModel();

export default mainViewModel as MainViewModel;