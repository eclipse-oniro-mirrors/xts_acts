'use static'

import { Entry, Text, Column, Component, Button, ClickEvent, Flex,
  FlexAlign,ItemAlign, Select, Color, Row, Font, SymbolEffectStrategy,
  SymbolGlyph, $r, Navigation, List, TextInput, ListItem, ForEach,
  NavigationMode, NavBarPosition, NavDestination} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct Index {
  @State isUndefined: Boolean = false;
  @State text: string = 'isUndefined: ';

  @State mode: NavigationMode = NavigationMode.Split;

  @State minContentWidth: number = 150;
  @State navBarWidth: number = 100;
  @State testText: string = 'This is testText';
  @State showMode: NavigationMode = NavigationMode.Split;
  @State changeCount: number = 0;

  build() {
    Column() {
      Row() {
        Button(this.text + this.isUndefined)
          .id('toggleButton')
          .fontSize(14)
          .fontColor('#182431')
          .fontWeight(500)
          .onClick(() => {
            this.isUndefined = !this.isUndefined
          })
      }

      Column() {
        Text('changeCount:' + this.changeCount).id('changeCountText')
        Text(`切换mode:` + this.showMode)
          .fontSize(20)
          .margin(20)

        Button('切换mode')
          .id('changeModeButton')
          .onClick(() => {
            // 只有在非 undefined 状态下才修改 mode
            if (!this.isUndefined) {
              if (this.mode == NavigationMode.Split) {
                this.mode = NavigationMode.Stack
              } else {
                this.mode = NavigationMode.Split
              }
            }
          })
      }
      .width('100%')
      .height('100%')

      Row() {
        Text('onNavigationModeChange: ')
      }
      Row() {
        Column() {
          Navigation() {
            Text('onNavigationModeChange')
              .height(50)
              .width('100%')
            Text('onNavigationModeChange')
              .height(50)
              .width('100%')
            Text('onNavigationModeChange')
              .height(50)
              .width('100%')

          }
          .title('mode状态监听')
          .mode(this.mode)
          .onNavigationModeChange(this.isUndefined ? undefined : (modeChange: NavigationMode) => {
            this.mode = modeChange
            this.showMode = modeChange
            this.changeCount++
            console.log('ZJL mode状态变化:' + this.mode)
          })
        }
      }
    }
  }
}