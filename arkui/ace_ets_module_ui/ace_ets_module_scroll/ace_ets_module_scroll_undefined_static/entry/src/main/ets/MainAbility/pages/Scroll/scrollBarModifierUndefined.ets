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
  FadingEdgeOptions
} from '@ohos.arkui.component'
import { AttributeModifier, CommonAttribute , ListAttribute} from '@ohos.arkui.component'
import { State, Observed, Track } from '@ohos.arkui.stateManagement'

// ===================== Modifier 定义 =====================
@Observed
export class ListModifier implements AttributeModifier<ListAttribute> {
  @Track public barState: BarState | undefined = BarState.On;

  applyNormalAttribute(instance: ListAttribute): void {
    instance.scrollBar(this.barState)
  }
}

@Entry
@Component
struct ScrollCommonExample {
  @State arr: String[] = ['0', '1', '2', '3', '4', '5', '6'];
  @State listModifier: ListModifier = new ListModifier()

  aboutToAppear() {
    this.listModifier.barState = BarState.On
  }

  build() {
    Stack() {
      List() {
        Column() {
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
        }.width('100%')
      }
      .scrollBar(BarState.On)
      .attributeModifier(this.listModifier)
      .id('common_scrollBarModifier')

      Column() {
        Button('切换 barState → ' + (this.listModifier.barState === undefined ? 'undefined' : 'On'))
          .height('5%')
          .onClick(() => {
            this.listModifier.barState = this.listModifier.barState === undefined ? BarState.On  : undefined
          }).margin({ top: 5 } as Margin)
          .id('changeButton')
      }
    }.width('100%').height('100%')
  }
}