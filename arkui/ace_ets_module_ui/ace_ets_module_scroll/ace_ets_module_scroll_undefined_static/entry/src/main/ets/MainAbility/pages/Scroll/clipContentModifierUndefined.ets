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
import { AttributeModifier, CommonAttribute , ScrollAttribute} from '@ohos.arkui.component'
import { State, Observed, Track } from '@ohos.arkui.stateManagement'

// ===================== Modifier 定义 =====================
@Observed
export class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  @Track public clipEnabled: ContentClipMode | undefined = undefined;

  applyNormalAttribute(instance: ScrollAttribute): void {
    instance.clipContent(this.clipEnabled)
  }
}

@Entry
@Component
struct ScrollCommonExample {
  @State arr: Int[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  @State scrollModifier: ScrollModifier = new ScrollModifier()

  aboutToAppear() {
    this.scrollModifier.clipEnabled = ContentClipMode.SAFE_AREA
  }

  build() {
    Stack() {
      Scroll() {
        Column() {
          ForEach(this.arr, (item: Int) => {
            Stack() {
              Text('item' + item)
                .width('90%')
                .height('20%')
                .backgroundColor(Color.Red)
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .focusable(true)
                .focusOnTouch(true)
            }
            .width('80%')
            .padding(20)
            .borderRadius(15)
            .backgroundColor(Color.Blue)
            .margin({ top: 30, bottom: 30 } as Margin)
          })
        }.width('100%').backgroundColor('rgb(213,213,213)')
      }
      .backgroundColor('rgb(213,213,213)')
      .scrollBar(BarState.On)
      .attributeModifier(this.scrollModifier)
      .id('common_clipContentModifier')

      Column() {
        Button('切换 clipContent → ' + this.scrollModifier.clipEnabled)
          .height('5%')
          .onClick(() => {
            this.scrollModifier.clipEnabled =
              this.scrollModifier.clipEnabled === undefined ? ContentClipMode.SAFE_AREA : undefined
          }).margin({ top: 5 } as Margin).id('changeButton')
      }
    }.width('100%').height('100%')
  }
}