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
  ]
}

let mainViewModel = new MainViewModel();

export default mainViewModel as MainViewModel;