/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import router from '@ohos.router'
@Entry
@Component

/*
 * scrollToIndex 属性测试
 * */

struct ScrollToIndexForGrid01 {
  @State numbers: string[] = []
  private scrollerForGrid: Scroller = new Scroller()
  @State moreItem: boolean = false
  @State isSmooth: boolean = false

  aboutToAppear() {
    for (let i = 0;i <= 199; i++) {
      this.numbers.push(i + '')
    }
  }
  build() {
    Flex() {
      Column() {
        Text('have smooth...').fontSize(16).width('95%').height(20).backgroundColor(Color.Orange).textAlign(TextAlign.Center)
          .visibility(this.isSmooth ? Visibility.Visible : Visibility.None)
          .id('isHaveSmooth_Grid01').position({x:12, y:10})
        Column(){
          Flex({ direction: FlexDirection.Row, wrap: FlexWrap.Wrap, justifyContent:FlexAlign.SpaceBetween }) { // 子组件在容器主轴上行布局
            Button('30', { type: ButtonType.Normal, stateEffect: true })
              .borderRadius(8).backgroundColor(0x317aff).width(150).height(40)
              .onClick(() => {
                this.isSmooth = false
                this.scrollerForGrid.scrollToIndex(30)
              }).margin(5)
            Button('66-true', { type: ButtonType.Normal, stateEffect: true })
              .borderRadius(8).backgroundColor(0x317aff).width(150).height(40)
              .onClick(() => {
                this.isSmooth = false
                const yOffsetStart: number = this.scrollerForGrid.currentOffset().yOffset;
                this.scrollerForGrid.scrollToIndex(66, true)
                setTimeout(()=> {
                  const yOffsetEnd: number = this.scrollerForGrid.currentOffset().yOffset;
                  console.info('yOffsetStart==>' + yOffsetStart + 'yOffsetEnd==>'+ yOffsetEnd)
                  this.isSmooth = (yOffsetStart == yOffsetEnd) ? false : true;
                  console.info(this.isSmooth + 'isSmooth')
                },1000)
              }).margin(5)
            Button('10-false', { type: ButtonType.Normal, stateEffect: true })
              .borderRadius(8).backgroundColor(0x317aff).width(150).height(40)
              .onClick(() => {
                this.isSmooth = false
                this.scrollerForGrid.scrollToIndex(10, false)
              }).margin(5)
            Button('99-true-Start', { type: ButtonType.Normal, stateEffect: true })
              .borderRadius(8).backgroundColor(0x317aff).width(150).height(40)
              .onClick(() => {
                this.isSmooth = false
                const yOffsetStart: number = this.scrollerForGrid.currentOffset().yOffset;
                this.scrollerForGrid.scrollToIndex(99, true, ScrollAlign.START)
                setTimeout(()=> {
                  const yOffsetEnd: number = this.scrollerForGrid.currentOffset().yOffset;
                  console.info('yOffsetStart==>' + yOffsetStart + 'yOffsetEnd==>'+ yOffsetEnd)
                  this.isSmooth = (yOffsetStart == yOffsetEnd) ? false : true;
                  console.info(this.isSmooth + 'isSmooth')
                },1000)
              }).margin(5)
            Button('128-true-end', { type: ButtonType.Normal, stateEffect: true })
              .borderRadius(8).backgroundColor(0x317aff).width(150).height(40)
              .onClick(() => {
                this.isSmooth = false
                const yOffsetStart: number = this.scrollerForGrid.currentOffset().yOffset;
                this.scrollerForGrid.scrollToIndex(128, true, ScrollAlign.END)
                setTimeout(()=> {
                  const yOffsetEnd: number = this.scrollerForGrid.currentOffset().yOffset;
                  console.info('yOffsetStart==>' + yOffsetStart + 'yOffsetEnd==>'+ yOffsetEnd)
                  this.isSmooth = (yOffsetStart == yOffsetEnd) ? false : true;
                  console.info(this.isSmooth + 'isSmooth')
                },1000)
              }).margin(5)
            Button('22-false-center', { type: ButtonType.Normal, stateEffect: true })
              .borderRadius(8).backgroundColor(0x317aff).width(150).height(40)
              .onClick(() => {
                this.isSmooth = false
                this.scrollerForGrid.scrollToIndex(22, false, ScrollAlign.CENTER)
              }).margin(5)
            Button('55-true-auto', { type: ButtonType.Normal, stateEffect: true })
              .borderRadius(8).backgroundColor(0x317aff).width(150).height(40)
              .onClick(() => {
                this.isSmooth = false
                const yOffsetStart: number = this.scrollerForGrid.currentOffset().yOffset;
                this.scrollerForGrid.scrollToIndex(55, false, ScrollAlign.AUTO)
                setTimeout(()=> {
                  const yOffsetEnd: number = this.scrollerForGrid.currentOffset().yOffset;
                  console.info('yOffsetStart==>' + yOffsetStart + 'yOffsetEnd==>'+ yOffsetEnd)
                  this.isSmooth = (yOffsetStart == yOffsetEnd) ? false : true;
                  console.info(this.isSmooth + 'isSmooth')
                },1000)
              }).margin(5)
            Button('moreColumns', { type: ButtonType.Normal, stateEffect: true })
              .borderRadius(8).backgroundColor(Color.Gray).width(150).height(40)
              .onClick(() => {
                this.isSmooth = false
                this.scrollerForGrid.scrollToIndex(0, false)
                this.moreItem = !this.moreItem
              }).margin(5)
          }
        }

        Grid(this.scrollerForGrid) {
          ForEach(this.numbers, (day: string) => {
            GridItem() {
              Text(day)
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('90%')
                .height(80)
                .textAlign(TextAlign.Center)
            }.id('gridIndex01_'+ day)
          })
        }
        .columnsTemplate(!this.moreItem ? "1fr 1fr 1fr" : "1fr 1fr 1fr 1fr 1fr")
        .columnsGap(10)
        .rowsGap(10)
        .width('95%')
        .backgroundColor(0xFAEEE0)
        .height('50%')
        .margin({
          top: 20,
          bottom: 20
        })
        .id("GridID_Grid01")

        Text("Next page")
          .width("100%").height("10%").backgroundColor(0X330000FF)
          .fontSize(16).textAlign(TextAlign.Center).onClick(() => {
          router.pushUrl({url:'pages/GridDome01'})
        }).margin(5)
      }
    }.width('100%').height('100%').backgroundColor(0xDCDCDC).padding(20)
  }
}