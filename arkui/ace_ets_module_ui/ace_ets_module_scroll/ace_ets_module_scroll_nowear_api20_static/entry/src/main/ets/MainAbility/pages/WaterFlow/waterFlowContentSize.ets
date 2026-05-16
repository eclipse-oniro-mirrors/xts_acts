'use static'

import { Entry, Text, Column, Component, Button, ClickEvent, WaterFlow, Scroller, HorizontalAlign,
  FontWeight, Divider, Color, FontWeight, ForEach, FlowItem, TextAlign } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct WaterFlowContentSize {
  scrollerForList: Scroller = new Scroller()
  @State arrIndex: int = 10;
  @State editFlag: boolean = false
  @State contentWidth: double = -1;
  @State contentHeight: double = -1;
  private data: number[] = (() => {
    let arr: number[] = [];
    for (let i = 0; i <= 1; i++) {
      arr.push(i);
    }
    return arr;
  })();
  build() {
    Column() {
      Button('GetContentSize')
        .id('GetContentSize')
        .width('20%')
        .height('10%')
        .onClick(()=> {
          this.contentWidth=this.scrollerForList.contentSize().width;
          this.contentHeight=this.scrollerForList.contentSize().height;
        })
      WaterFlow({ scroller:this.scrollerForList }) {
        ForEach(this.data, (i: number) => {
          FlowItem() {
            Text(`${i}`)
              .width('200vp')
              .height(50)
          }
        }, (i: number) => i.toString())
      }
      .width('200vp')
      .height('50%')
      Text(''+ this.contentWidth)
        .fontColor(Color.Red)
        .key('WaterFlowContentWidth')
      Text(''+ this.contentHeight)
        .fontColor(Color.Red)
        .key('WaterFlowContentHeight')
    }
  }
}