/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
struct animationListAddExample {
  scroller: Scroller = new Scroller()
  @State arr: number[] = [0, 1, 2]
  @State num: number = 0
  @State onTextAdd:string = ''

  aboutToAppear(){
    for (let i = 3; i < 7; i++) {
      this.arr.push(i)
    }
  }

  build() {
    Column() {
      Text('add: '+ this.onTextAdd)
        .id('list_add_mess')
        .width('90%')
        .height('10%')

      List(){
        ListItem() {
          Text(''+ this.arr)
            .fontSize(15)
        }
        ListItem() {
          Button('增加元素')
            .id('list_add_btn')
            .borderRadius(10)
            .onClick(() => {
              if (this.arr.length == 0) {
                this.num = 0
              } else {
                let len = this.arr.length
                this.num = this.arr[len-1] + 1
              }
              this.arr.push(this.num)
              this.scroller.scrollPage({ next: true, animation: true })
            })

        }
      }
      List({ scroller: this.scroller }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('item-' + item)
              .width('100%')
              .height('15%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }
        }, (item: string) => item)
      }
      .width('90%')
      .height('40%')
      .scrollBar(BarState.On)
      .divider({ strokeWidth: 1, color: Color.Blue })
      .onScrollIndex((firstIndex: number, lastIndex: number, centerIndex: number) => {
        console.info('first' + firstIndex)
        console.info('last' + lastIndex)
        console.info('center' + centerIndex)
      })
      .onScrollStart(() => {
        this.onTextAdd += 'onScrollStart-'
        console.info('waterFlow scroll start')
      })
      .onScrollStop(() => {
        this.onTextAdd += 'onScrollStop'
        console.info('waterFlow scroll stop')
      })
      .onReachStart(() => {
        this.onTextAdd += 'onReachStart-'
        console.info('waterFlow reach start')
      })
      .onReachEnd(() => {
        this.onTextAdd += 'onReachEnd-'
        console.info('waterFlow reach end')
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}