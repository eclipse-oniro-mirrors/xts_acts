'use static'
import {
  Stack,
  Entry,
  Component,
  Column,
  Row,
  Button,
  ForEach,
  Text,
  TextAlign,
  BarState,
  List,
  Color,
  Margin,
  ListItem,
  Resource,
  Scroll,
  NestedScrollOptions,
  NestedScrollMode
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct ScrollPage {
  @State arr: String[] = ['0', '1', '2', '3', '4', '5', '6'];
  @State isChange: boolean = true;

  build() {
    Stack() {
      Scroll() {
        Column() {
          Text('Scroll Area')
            .width('100%')
            .height('20%')
            .backgroundColor('#0080DC')
            .textAlign(TextAlign.Center)
          List() {
            ForEach(this.arr, (item: string) => {
              ListItem() {
                Text('item' + item)
                  .width('90%')
                  .height('20%')
                  .borderRadius(15)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .focusable(true)
                  .focusOnTouch(true)
              }
            }, (item: string) => item)
          }
          .scrollBar(BarState.On)
          .nestedScroll(this.isChange ? {
            scrollForward: NestedScrollMode.PARENT_FIRST, // 必需属性
            scrollBackward: NestedScrollMode.SELF_FIRST   // 必需属性
          } as NestedScrollOptions : undefined)
          .height('100%')
        }
      }
      .backgroundColor('#DCDCDC')
      .width('100%')
      .id('common_nestedScroll')

      Column() {
        Button('切换 nestedScroll → ' + this.isChange)
          .height('5%')
          .onClick(() => {
            this.isChange = !this.isChange
          }).margin({ top: 5 } as Margin)
          .id('button_nestedScroll')
      }
    }.width('100%').height('100%')
  }
}