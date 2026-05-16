'use static'

import {
  Entry,
  Component,
  Column,
  Row,
  Text,
  Margin,
  Builder,
  Flex,
  HapticFeedbackMode,
  FlexDirection,
  FlexAlign,
  ItemAlign,
  ForEach,
  Image,
  Alignment,
  Divider,
  $r,
  Button,
  Menu,
  MenuItem,
  ResourceStr
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct MenuExample {
  private iconStr: ResourceStr = $r('app.media.startIcon')
  @State isShown: boolean = false;
  @State isBindMenu: boolean = true;
  @State isBindMenu2: boolean = true;

  @Builder
  MenuBuilder() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      Text('MenuBuilder')
        .fontSize(20)
        .id('Text_MenuBuilder')
    }.width(100)
  }

  @Builder
  MenuBuilder2() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: '菜单选项' }).id('menuItem')
      MenuItem({ startIcon: this.iconStr, content: '菜单选项' })
      MenuItem({ startIcon: this.iconStr, content: '菜单选项' })
    }
  }

  build() {
    Column() {
      Text('bindMenu')
        .id('Text_bindMenu')
        .fontSize(20)
        .margin({ top: 20 } as Margin)
        .bindMenu(this.isBindMenu ? undefined : this.MenuBuilder)
      Text('bindMenu2')
        .id('Text_bindMenu2')
        .fontSize(20)
        .margin({ top: 20 } as Margin)
        .bindMenu(this.isShown, this.isBindMenu2 ? undefined : this.MenuBuilder2)

      Button('show')
        .id('Btn_show_Click')
        .onClick(()=>{
          this.isShown = true;
        })
      Button('btnBindMenu : ' + this.isBindMenu)
        .id('Btn_bindMenu')
        .onClick(() => {
          this.isBindMenu = !this.isBindMenu
        })
      Button('btnBindMenu2 : ' + this.isBindMenu2)
        .id('Btn_bindMenu2')
        .onClick(() => {
          this.isBindMenu2 = !this.isBindMenu2
        })

    }
    .height('100%')
    .width('100%')
    .backgroundColor('#f0f0f0')
  }
}