'use static'
import {
  Builder,
  Stack,
  Entry,
  Component,
  Column,
  Row,
  Alignment,
  Tabs,
  BarPosition,
  TabContent,
  NestedScrollMode,
  Refresh,
  Button,
  List,
  RefreshStatus,
  ForEach,
  LazyForEach,
  ListItemAlign,
  ListItem,
  NestedScrollMode,
  ScrollState,
  Text,
  Scroller,
  TextAlign,
  BarState,
  Scroll,
  Edge,
  ContentClipMode,
  CrownSensitivity,
  EdgeEffect,
  Color,
  ClickEvent,
  Margin,
  ScrollDirection,
  ScrollSource,
  LengthMetrics,
  FadingEdgeOptions,
  NestedScrollOptions
} from '@ohos.arkui.component'
import { AttributeModifier, CommonAttribute , ListAttribute} from '@ohos.arkui.component'
import { State, Observed, Track } from '@ohos.arkui.stateManagement'

// ===================== Modifier 定义 =====================
@Observed
export class ListModifier implements AttributeModifier<ListAttribute> {
  @Track public isChange: Boolean = true;

  applyNormalAttribute(instance: ListAttribute): void {
    if (this.isChange) {
      instance.nestedScroll({
        scrollForward: NestedScrollMode.PARENT_FIRST, // 必需属性
        scrollBackward: NestedScrollMode.SELF_FIRST   // 必需属性
      } as NestedScrollOptions)
    } else {
      instance.nestedScroll(undefined)
    }
  }
}

@Entry
@Component
struct ScrollCommonExample {
  @State arr: String[] = ['0', '1', '2', '3', '4', '5', '6'];
  @State listModifier: ListModifier = new ListModifier()

  aboutToAppear() {
    this.listModifier.isChange = true
  }

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
          .attributeModifier(this.listModifier)
          .height('100%')
        }
      }
      .backgroundColor('#DCDCDC')
      .width('100%')
      .height('30%')
      .id('common_nestedScrollModifier')

      Column() {
        Button('切换 nestedScroll → ' + this.listModifier.isChange)
          .height('5%')
          .onClick(() => {
            this.listModifier.isChange = !this.listModifier.isChange
          }).margin({ top: 5 } as Margin)
          .id('changeButton')
      }
    }.width('100%').height('100%')
  }
}