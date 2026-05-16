'use static'

import { Entry, Text, Column, Component, Button, ClickEvent, Flex,
  FlexAlign,ItemAlign, Select, Color, Row, Font, SymbolEffectStrategy,
  SymbolGlyph, $r, Navigation, List, TextInput, AttributeModifier,
  NavigationAttribute, NavigationMode, NavBarPosition} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'


@Observed
export class MyNavigationModifier implements AttributeModifier<NavigationAttribute> {
  public isUndefined: Boolean = false;
  public mode: NavigationMode = NavigationMode.Split;
  public showMode: NavigationMode = NavigationMode.Split;
  public changeCount: number = 0;

  applyNormalAttribute(instance: NavigationAttribute): void {
    instance.onNavigationModeChange(this.isUndefined ? undefined : (modeChange: NavigationMode) => {
      this.mode = modeChange
      this.showMode = modeChange
      this.changeCount++
      console.log('ZJL mode状态变化:' + this.mode)
    })
  }
}

@Entry
@Component
struct Index {
  @State isUndefined: Boolean = false
  @State text: string = 'isUndefined: '
  @State modifier:MyNavigationModifier = new MyNavigationModifier()

  @State statusText: string = '导航栏状态：显示';

  @State minContentWidth: number = 150;
  @State navBarWidth: number = 100;
  @State testText: string = 'This is testText';
  @State mode: NavigationMode = NavigationMode.Split;
  @State showMode: NavigationMode = NavigationMode.Split;

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
            // 创建新的 Modifier 实例以触发重新应用
            let newModifier = new MyNavigationModifier()
            newModifier.isUndefined = this.isUndefined
            newModifier.mode = this.modifier.mode
            newModifier.showMode = this.modifier.showMode
            newModifier.changeCount = this.modifier.changeCount
            this.modifier = newModifier
            this.mode = this.modifier.mode
            this.showMode = this.modifier.showMode
          })
      }
      Column() {
        Text('changeCount:' + this.modifier.changeCount).id('changeCountText')
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
        Column() {
          Text('onNavigationModeChange_modifier: ')
        }
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
          .attributeModifier(this.modifier)
        }
      }
    }
  }
}