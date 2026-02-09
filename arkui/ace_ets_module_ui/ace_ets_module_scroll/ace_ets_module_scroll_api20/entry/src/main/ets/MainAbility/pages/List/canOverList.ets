/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { curves, LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct canOverScrollList {
  scroller: Scroller = new Scroller;
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  @State isArr: number = 0

  build() {
    Column() {
      Text('List canOverScroll测试')
      Row() {
        Button('COS:true')
          .id('canOver_list_true')
          .margin({ right: 10 })
          .onClick(() => {
            let curve = curves.interpolatingSpring(0.5, 5, 10, 15)
            const yOffset: number = this.scroller.currentOffset().yOffset;
            const xOffset: number = this.scroller.currentOffset().xOffset;
            this.scroller.scrollTo({
              xOffset: xOffset - 30,
              yOffset: yOffset - 30,
              animation: false,
              canOverScroll: true
            })
          })
        Button('COS:false')
          .id('canOver_list_false')
          .onClick(() => {
            let curve = curves.interpolatingSpring(0.5, 5, 10, 15)
            const yOffset: number = this.scroller.currentOffset().yOffset;
            const xOffset: number = this.scroller.currentOffset().xOffset;
            this.scroller.scrollTo({
              xOffset: xOffset - 30,
              yOffset: yOffset - 30,
              animation: { duration: 1000, curve: curve, canOverScroll: true },
              canOverScroll: false
            })
          })
      }
      Row() {
        Button('null')
          .id('canOver_list_null')
          .margin({ right: 10 })
          .onClick(() => {
            let curve = curves.interpolatingSpring(0.5, 5, 10, 15)
            const yOffset: number = this.scroller.currentOffset().yOffset;
            const xOffset: number = this.scroller.currentOffset().xOffset;
            this.scroller.scrollTo({
              xOffset: xOffset - 30,
              yOffset: yOffset - 30,
              animation: { duration: 1000, curve: curve, canOverScroll: true },
              canOverScroll: null
            })
          })
        Button('undefined')
          .id('canOver_list_ude')
          .onClick(() => {
            let curve = curves.interpolatingSpring(0.5, 5, 10, 15)
            const yOffset: number = this.scroller.currentOffset().yOffset;
            const xOffset: number = this.scroller.currentOffset().xOffset;
            this.scroller.scrollTo({
              xOffset: xOffset - 30,
              yOffset: yOffset - 30,
              animation: true,
              canOverScroll: undefined
            })
          })
      }

      List({ space: 10, initialIndex: 0, scroller:this.scroller }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('' + item)
              .id('canOverScroll_list_' + item)
              .width('100%')
              .height('20%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(Color.Pink)
          }
        }, (item: string) => item)
      }
      .id('canOverScroll_list')
      .width('90%')
      .height('70%')
      .friction(0.6)
      .listDirection(Axis.Vertical)
      .edgeEffect(EdgeEffect.Spring)
      .fadingEdge(true,{fadingEdgeLength:LengthMetrics.vp(80)})
      .scrollBar(BarState.On)
      .backgroundColor('#DCDCDC')
      .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {
        console.info('XXXonDidScroll scrollOffset' + scrollOffset.toString())
        console.info('XXXonDidScroll scrollState' + scrollState.toString())
      })
      .onScrollStart(() => {
        console.info('XXXonScrollStart' + 'List1 onScrollStart')
      })
      .onScrollStop(() => {
        console.info('XXXonScrollStop' + 'List1 onScrollStop')
      })
    }
  }
}