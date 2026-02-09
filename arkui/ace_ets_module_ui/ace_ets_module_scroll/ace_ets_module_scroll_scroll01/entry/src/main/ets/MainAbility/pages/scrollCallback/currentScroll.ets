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
@Entry
@Component
struct scrollerOffsetUn {
  scroller: Scroller = new Scroller();
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  @State private hasShow: boolean = true;
  @State private text: string = 'init';

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Text(this.text).id('offset_un_text')
        .zIndex(2)
        .fontColor(Color.Blue)
        .margin({ top: '10%', left: '10%' })
      if (this.hasShow){
        Scroll(this.scroller) {
          Column() {
            ForEach(this.arr, (item: number) => {
              Text(item.toString())
                .width('100%')
                .height('30%')
                .backgroundColor(0xFFFFFF)
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .margin({ top: 10 })
            }, (item: number) => item.toString())
          }
        }
        .width('90%')
        .height('60%')
        .scrollable(ScrollDirection.Vertical)
        .scrollBar(BarState.On)
        .scrollBarColor(Color.Gray)
        .scrollBarWidth(10)
        .friction(0.6)
        .edgeEffect(EdgeEffect.None)
        .onWillScroll((xOffset: number, yOffset: number, scrollState: ScrollState) => {
          const current = this.scroller.currentOffset();
          console.info(`Current offset - X: ${current.xOffset}, Y: ${current.yOffset}`);
        })
        .onScrollEdge((side: Edge) => {
          console.info('To the edge');
        })
        .onScrollStop(() => {
          console.info('Scroll Stop');
        })
      }

      Button('show Scroll')
        .id('offset_un_show')
        .height('5%')
        .onClick(() => {
          this.hasShow = !this.hasShow;
        })
        .margin({ top: '20%', left: '10%' })
      Button('print offset')
        .id('offset_un_print')
        .height('5%')
        .onClick(() => {
          const current = this.scroller.offset();
          if (current == undefined){
            this.text = 'undefined';
          } else {
            this.text = String(`Current offset - X: ${current.xOffset}, Y: ${current.yOffset}`);
            console.info(`Current offset - X: ${current.xOffset}, Y: ${current.yOffset}`);
          }
        })
        .margin({ top: '35%', left: '10%' })

    }.width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
  }
}