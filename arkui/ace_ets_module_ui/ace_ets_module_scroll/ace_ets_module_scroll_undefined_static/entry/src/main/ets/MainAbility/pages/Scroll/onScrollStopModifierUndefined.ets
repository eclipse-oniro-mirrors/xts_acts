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
  WaterFlow
} from '@ohos.arkui.component'
import { AttributeModifier, CommonAttribute, WaterFlowAttribute } from '@ohos.arkui.component'
import { State, Observed, Track } from '@ohos.arkui.stateManagement'

// ===================== Modifier 定义 =====================
@Observed
export class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  @Track public change: boolean = true;
  @Track public count: Int = 1;

  applyNormalAttribute(instance: WaterFlowAttribute): void {
    if (this.change) {
      instance.onScrollStop(() => {
        this.count += 1;
      })
    } else {
      instance.onScrollStop(undefined)
    }
  }
}

@Entry
@Component
struct ScrollCommonExample {
  @State arr: Int[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  @State waterFlowModifier: WaterFlowModifier = new WaterFlowModifier()

  aboutToAppear() {
    this.waterFlowModifier.change = true
  }

  build() {
    Column() {
      WaterFlow() {
        Column() {
          ForEach(this.arr, (item: Int) => {
            Stack() {
              Text('item' + item)
                .width('90%')
                .height('10%')
                .backgroundColor(Color.Red)
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .focusable(true)
                .focusOnTouch(true)
                .id('scrollItem' + item)
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
      .attributeModifier(this.waterFlowModifier)
      .height('80%')

      Column() {
        Text('Count' + this.waterFlowModifier.count)
          .id('common_onScrollStopModifier')
        Button('切换 onScrollStop → ' + this.waterFlowModifier.change)
          .onClick(() => {
            this.waterFlowModifier.change = !this.waterFlowModifier.change
          }).margin({ top: 5 } as Margin).id('changeButton')
      }
    }.width('100%').height('100%')
  }
}