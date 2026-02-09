/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

//onAreaChange、onVisibleAreaChange禁用
@Entry
@Component
struct areaChangeEnabled {
  @State enable: boolean = true
  @State text1: string = 'Text'
  @State testTextStr: string = 'Text'
  @State text2: string = 'Text Visible Change'

  private arr: number[] = [0, 1, 2, 3, 4, 5]
  scroller: Scroller = new Scroller()

  build() {
    Column({ space: 20 }) {
      Column(){
        Text(this.text1).key('aCanEnable')
          .margin({top: 20})
          .onAreaChange(() => {
            this.text1 = 'onAreaChange 已触发'
          })
          .enabled(false)

      }.width('100%').height('20%').backgroundColor('#F1F3F5')


      Column() {
        Text(this.testTextStr)
          .fontSize(20)
      }
      .height(100)
      .backgroundColor(Color.Gray)

      Scroll(this.scroller) {
        Column() {
          Text(this.text2).key('vCanEnable')
            .margin(30)
            .onVisibleAreaChange([0.0, 1.0], (isVisible: boolean, currentRatio: number) => {
              console.info('Text isVisible: ' + isVisible + ', currentRatio:' + currentRatio)
              if (isVisible && currentRatio >= 1.0) {
                console.info('Text is fully visible. currentRatio:' + currentRatio)
                this.testTextStr = 'Text is fully visible'
              }

              if (!isVisible && currentRatio <= 0.0) {
                console.info('Text is completely invisible.')
                this.testTextStr = 'Text is completely invisible'
              }
            }).enabled(false)

          ForEach(this.arr, (item:number) => {
            Text(item.toString())
              .width('90%')
              .height(150)
              .backgroundColor(0xFFFFFF)
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .margin({ top: 10 })
          }, (item:number) => (item.toString()))

        }.width('100%')
      }
      .backgroundColor(0x317aff)
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Gray)
      .scrollBarWidth(10)
    }.width('100%').height('100%').backgroundColor(0xDCDCDC)
  }
}