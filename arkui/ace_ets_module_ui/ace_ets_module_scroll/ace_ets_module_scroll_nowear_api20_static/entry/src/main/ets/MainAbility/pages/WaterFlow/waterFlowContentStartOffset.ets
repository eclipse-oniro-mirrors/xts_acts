'use static'

import { Entry, Text, Column, Component, Button, ClickEvent, Color, Scroller, Scroll, ForEach, TextAlign,
  WaterFlow, FlowItem, Divider, TextAlign, HorizontalAlign, FontWeight, Divider, TextAlign } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct WaterFlowContentStartOffset {
  private data: number[] = (() => {
    let arr: number[] = [];
    for (let i = 1; i <= 30; i++) {
      arr.push(i);
    }
    return arr;
  })();

  @Builder
  private ScrollWaterFlowWithOffset(offset: number | undefined, tip: string, id: number) {
    Column() {
      Text(tip).fontSize(14).fontColor(Color.Gray)
      WaterFlow() {
        ForEach(this.data, (i: number) => {
          FlowItem() {
            Text(`${i}`)
              .fontSize(20)
              .textAlign(TextAlign.Center)
              .width('50%')
              .height(80)
          }
        }, (i: number) => i.toString())
      }
      .height(200)
      .backgroundColor(0xFFF8F0)
      .contentStartOffset(offset)
      .id(`waterFlowContentStartOffset_00${id}`)
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Scroll() {
      Column() {
        Text('contentStartOffset 可滚动场景 - Scroll版本')
          .fontSize(20).fontWeight(FontWeight.Bold)
        this.ScrollWaterFlowWithOffset(60, '正常值：60', 1)
        this.ScrollWaterFlowWithOffset(0, '零值：0', 3)
        this.ScrollWaterFlowWithOffset(undefined, '显式 undefined', 4)

        Divider()
      }
      .padding(16)
    }
    .width('100%')
    .height('100%')
  }
}