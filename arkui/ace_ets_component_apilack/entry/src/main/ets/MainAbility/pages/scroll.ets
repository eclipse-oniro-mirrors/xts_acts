/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Log from '../common/Log.ets';
const TAG = 'ets_apiLack_add';

@Entry
@Component
struct ScrollOnScrollBegin {
  scroller: Scroller = new Scroller()
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear ScrollOnScrollBegin start`)
  }

  aboutToDisappear(){
    Log.showInfo(TAG, `aboutToDisAppear ScrollOnScrollBegin end`)
  }

  build(){
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center,justifyContent:FlexAlign.Center }){

      Text("scroll-OnScrollBegin")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("onScrollBeginText")
      Scroll(this.scroller) {
        Column() {
          ForEach(this.arr, (item) => {
            Text(item.toString())
              .width('90%')
              .height(150)
              .backgroundColor(0xFFFFFF)
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .margin({ top: 10 })
          }, item => item)
        }.width('100%')
      }
      .scrollable(ScrollDirection.Vertical)
      .onScrollFrameBegin((offset: number, state: ScrollState) => {
        console.info('offset=' + offset)
        return { offsetRemain: offset }
      })
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Gray)
      .scrollBarWidth(30)
      .onScroll((xOffset: number, yOffset: number) => {
        console.info(xOffset + ' ' + yOffset)
      })
      .onScrollEdge((side: Edge) => {
        console.info('To the edge')
      })
      .onScrollEnd(() => {
        console.info('Scroll Stop');
      })
      .onScrollStart(() => {
          console.info('Scroll Start');
       })
      .key("Scroll")
      .width("100%")
      .height("100%")
    }.width("100%").height("100%")
  }
}

