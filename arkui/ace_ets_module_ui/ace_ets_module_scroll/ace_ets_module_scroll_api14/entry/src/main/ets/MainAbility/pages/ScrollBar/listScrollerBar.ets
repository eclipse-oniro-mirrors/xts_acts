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
struct listScrollerPage {
  listScroller: Scroller = new Scroller();
  @State arr: number[] = []
  @State outBarState: BarState = BarState.Off
  @State mvisiblity: Visibility = Visibility.Visible
  @State scrollForwardMode: NestedScrollMode = NestedScrollMode.PARENT_FIRST
  @State scrollBackwardMode: NestedScrollMode = NestedScrollMode.PARENT_FIRST
  @State scrollEventArr: Set<string> = new Set()
  @State listEventArr: Set<string> = new Set()
  @State onText:string = 'bar: '

  aboutToAppear() {
    this.listItems(10)
  }

  listItems(n: number) {
    this.arr = []
    for (let i = 0; i < n; i++) {
      this.arr.push(i)
    }
  }

  build() {
    Column() {
      Scroll(){
        Text(''+ this.onText)
          .id('list_scrollBar_onText')
      }.height('15%').width('80%')
      Column() {
        List({scroller: this.listScroller}) {
          ListItem() {
            Text('Scroll Area')
              .width('100%')
              .height('30%')
              .backgroundColor('#0080DC')
              .textAlign(TextAlign.Center)
          }

          ListItem() {
            List() {
              ListItem() {
                Text('Scroll Area2222')
                  .width('100%')
                  .height('20%')
                  .backgroundColor('#999999')
                  .textAlign(TextAlign.Center)
              }
              ListItem() {
                List({ space: 5, scroller: this.listScroller }) {
                  ForEach(this.arr, (item: number, index: number) => {
                    ListItem() {
                      Text('item' + item + index)
                        .fontSize(16)
                    }
                    .backgroundColor(Color.White)
                    .width('100%')
                    .height(72)
                    .borderRadius(12)
                    .visibility(index % 2 == 0 ? this.mvisiblity : Visibility.Visible)
                  }, (item: string) => item)
                }
                .onReachStart(() => {
                  this.onText += 'reachStart3-'
                  console.log('1111003 MR001 List onReachStart')
                })
                .onReachEnd(() => {
                  this.onText += 'reachEnd3-'
                  console.log('1111003 MR001 List onReachEnd')
                })
                .onScrollStart(() => {
                  this.onText += 'scrollStart3-'
                  this.scrollEventArr.add('onScrollStart')
                  console.log('1111003 MR001 Scroll onScrollStart')
                })
                .onScrollStop(() => {
                  this.onText += 'scrollStop3-'
                  this.scrollEventArr.add('onScrollStop')
                  console.log('1111003 MR001 Scroll onScrollStop')

                })
                .width('100%')
                .height('80%')
                .borderWidth(3)
                .borderColor(Color.Orange)
                .nestedScroll({
                  scrollForward: this.scrollForwardMode,
                  scrollBackward: this.scrollBackwardMode
                })
              }.height('100%').width('100%')
            }
            .height('80%')
            .width('100%')
            .borderWidth(3)
            .borderColor(Color.Pink)
            .nestedScroll({
              scrollForward: NestedScrollMode.SELF_FIRST,
              scrollBackward: NestedScrollMode.SELF_FIRST
            })
          }
          .width('100%')
          .height('100%')
        }
        .width('100%')
        .height('70%')
        .borderWidth(3)
        .borderColor(Color.Blue)
        .flexGrow(1)
        .friction(0.5)
        .backgroundColor('#DCDCDC')
        .scrollBar(this.outBarState)
        .layoutWeight(1)
        .onWillScroll(() => {
          this.scrollEventArr.add('onWillScroll')
          console.log('Scroll onWillScroll')
        })
        .onDidScroll(() => {
          this.scrollEventArr.add('onDidScroll')
          console.log('Scroll onDidScroll')
        })
        .onReachStart(() => {
          this.onText += 'reachStart1-'
          console.log('1111001 MR001 List onReachStart')
        })
        .onReachEnd(() => {
          this.onText += 'reachEnd1-'
          console.log('1111001 MR001 List onReachEnd')
        })
        .onScrollStart(() => {
          this.onText += 'scrollStart1-'
          this.scrollEventArr.add('onScrollStart')
          console.log('1111001 MR001 Scroll onScrollStart')
        })
        .onScrollStop(() => {
          this.onText += 'scrollStop1-'
          this.scrollEventArr.add('onScrollStop')
          console.log('1111001 MR001 Scroll onScrollStop')

        })

        ScrollBar({ scroller: this.listScroller, state: BarState.On }) {
          Text().backgroundColor(Color.Red).height(150).width(50)
        }
        .id('scroller_list_scrollbar')
        .position({ right: 0 })
        .width(50)
        .backgroundColor(Color.Gray)
        .enableNestedScroll(true)
      }
      .width('90%')
      .height('70%')
    }
    .width('100%')
    .height('100%')
  }
}