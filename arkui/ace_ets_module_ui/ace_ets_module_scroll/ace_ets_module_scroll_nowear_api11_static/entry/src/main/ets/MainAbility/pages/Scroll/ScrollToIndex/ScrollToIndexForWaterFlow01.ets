'use static';
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

import { Entry, Column, Component, Flex, FlexDirection,ClickEvent,Scroller,Color,Builder,Visibility,
  Alignment, Stack,WaterFlow,LazyForEach,FlowItem, Image,TextAlign,ImageFit, Position,
  ItemAlign, FlexAlign, Text, Button, FontWeight, ButtonType, Margin,BorderStyle, Search, ButtonAttribute } from '@ohos.arkui.component'
import router from '@ohos.router'
import { WaterFlowDataSource } from './WaterFlowDataSource'
import { State } from '@ohos.arkui.stateManagement';
function buttonStyles(this: ButtonAttribute) {
  this.borderRadius(8)
  this.backgroundColor(0x317aff)
  this.width(200)
  this.height(50)

  return this
}
@Entry
@Component
struct ScrollToIndexForWaterFlow01 {
  @State minSize: int = 80
  @State maxSize: int = 180
  @State fontSize: int = 24
  @State moreItem: boolean = false
  @State colors: Array<int> =  new Array<int>(0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F)
  private scrollerForWaterFlow: Scroller = new Scroller()
  @State isSmooth: boolean = false
  datasource: WaterFlowDataSource = new WaterFlowDataSource()
  private itemWidthArray: Array<number> = new Array<number>()
  private itemHeightArray: Array<number> = new Array<number>()

  // 计算flow item宽/高
  getSize() {
    let ret = Math.floor(Math.random() * this.maxSize)
    return (ret > this.minSize ? ret : this.minSize)
  }

  // 保存flow item宽/高
  getItemSizeArray() {
    for (let i = 0; i < 100; i++) {
      this.itemWidthArray.push(this.getSize())
      this.itemHeightArray.push(this.getSize())
    }
  }

  aboutToAppear() {
    this.getItemSizeArray()
  }

  @Builder
  itemFoot() {
    Column() {
      Text(`Footer`)
        .fontSize(10)
        .backgroundColor(Color.Red)
        .width(50)
        .height(50)
        .align(Alignment.Center)
        .margin({ top: 2 } as Margin)
    }
  }

  build() {
    Column(){
      Text('have smooth...').fontSize(16).width('100%').height(30).backgroundColor(Color.Orange)
        .visibility(this.isSmooth ? Visibility.Visible : Visibility.None)
        .id('isSmooth').position({x:10, y:10} as Position)
      Stack({ alignContent: Alignment.TopStart }) {
        WaterFlow({
          scroller: this.scrollerForWaterFlow
        }) {
          LazyForEach(this.datasource, (item: number) => {
            FlowItem() {
              Column() {
                Text("N" + item).textAlign(TextAlign.End)
                  .fontSize(16)
                  .width('100%').id("ItemTextWaterFlow01_" + item)
                Image('res/waterFlowTest(' + item % 5 + ').jpg')
                  .objectFit(ImageFit.Fill)
                  .width('100%')
                  .layoutWeight(1)
              }
            }
            .onAppear(() => {
              // 即将触底时提前增加数据
              if (item + 20 == this.datasource.totalCount()) {
                for (let i = 0; i < 100; i++) {
                  this.datasource.AddLastItem()
                }
              }
            })
            .width('100%')
            .height(this.itemHeightArray[(item as int) % 100])
            .backgroundColor(this.colors[(item as int) % 5])
          }, (item: number) => String(item))
        }
        .columnsTemplate(!this.moreItem ? "1fr 1fr" : "1fr 1fr 1fr 1fr")
        .columnsGap(10)
        .rowsGap(5)
        .backgroundColor(0xFAEEE0)
        .width('100%')
        .height('100%')

        Button('30', { type: ButtonType.Normal, stateEffect: true })
          .fontSize(25)
          .buttonStyles()
          .onClick((e:ClickEvent) => {
            this.isSmooth = false
            console.log('跳转到30')
            this.scrollerForWaterFlow.scrollToIndex(30)
          }).margin({ top: 10, left: 10 } as Margin)
        Button('-1', { type: ButtonType.Normal, stateEffect: true })
          .fontSize(25)
          .buttonStyles()
          .onClick((e:ClickEvent) => {
            this.isSmooth = false
            console.log('跳转到-1，没有动画')
            this.scrollerForWaterFlow.scrollToIndex(-1)
          }).margin({ top: 100, left: 10 } as Margin)
        Button('66-true', { type: ButtonType.Normal, stateEffect: true })
          .fontSize(25)
          .buttonStyles()
          .onClick((e:ClickEvent): void => {
            this.isSmooth = false
            console.log('跳转到66，有动画')
            const yOffsetStart: number = this.scrollerForWaterFlow.currentOffset()!.yOffset;
            this.scrollerForWaterFlow.scrollToIndex(66, true)
            setTimeout(()=>{
              const yOffsetEnd: number = this.scrollerForWaterFlow.currentOffset()!.yOffset;
              console.info('yOffsetStart==>' + yOffsetStart + 'yOffsetEnd==>'+ yOffsetEnd)
              this.isSmooth = (yOffsetStart == yOffsetEnd) ? false : true;
              console.info(this.isSmooth + 'isSmooth')
            },1000)
          }).margin({ top: 200, left: 10 } as Margin)
        Button('u-99-false', { type: ButtonType.Normal, stateEffect: true })
          .fontSize(25)
          .buttonStyles()
          .onClick((e:ClickEvent) => {
            this.isSmooth = false
            console.log('跳转到99，无动画')
            this.scrollerForWaterFlow.scrollToIndex(99, false)
          }).margin({ top: 300, left: 10 } as Margin)

        Button('moreColumns', { type: ButtonType.Normal, stateEffect: true })
          .fontSize(25)
          .buttonStyles()
          .onClick((e:ClickEvent) => {
            this.scrollerForWaterFlow.scrollToIndex(0, false)
            this.moreItem = !this.moreItem
          }).margin({ top: 400, left: 10 } as Margin)
        Button('nextPage', { type: ButtonType.Normal, stateEffect: true })
          .fontSize(25)
          .buttonStyles()
          .onClick((e:ClickEvent) => {
            this.getUIContext().getRouter().pushUrl({url:"pages/WaterFlowDomo1"})
          }).margin({ top: 500, left: 10 } as Margin)
      }
    }
  }
}
