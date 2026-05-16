/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
@Entry
@Component
struct backPressBehaviorList {
  @State arr: number[] = [0, 1, 2, 3, 4, 5, 6 ,7 ,8, 9, 10];
  private scroller: ListScroller = new ListScroller();
  @State closeSwipeAction: boolean = true;

  @Builder
  itemEnd() {
    Row() {
      Button('Delete').margin('4vp')
      Button('Set').margin('4vp').onClick(() => {
        this.scroller.closeAllSwipeActions();
      })
    }.padding('4vp').justifyContent(FlexAlign.SpaceEvenly)
  }

  build() {
    Column() {
      List({ space: 2, scroller: this.scroller }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('item1_' + item)
              .width('100%')
              .height('20%')
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }
          .transition(TransitionEffect.OPACITY)
          .swipeAction({
            end: {
              builder: () => {
                this.itemEnd()
              },
              onAction: () => {
                this.getUIContext()?.animateTo({ duration: 1000 }, () => {
                  let index = this.arr.indexOf(item);
                  this.arr.splice(index, 1);
                });
              },
              actionAreaDistance: 56,
            }
          })
        }, (item: number) => item.toString())
      }
      .id('list_backPressBehavior_true')
      .backPressBehavior({closeSwipeAction: true})
      .height('20%')

      List({ space: 2, scroller: this.scroller }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('item2_' + item)
              .width('100%')
              .height('20%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }
          .transition(TransitionEffect.OPACITY)
          .swipeAction({
            end: {
              builder: () => {
                this.itemEnd()
              },
              onAction: () => {
                this.getUIContext()?.animateTo({ duration: 1000 }, () => {
                  let index = this.arr.indexOf(item);
                  this.arr.splice(index, 1);
                });
              },
              actionAreaDistance: 56,
            }
          })
        }, (item: number) => item.toString())
      }
      .id('list_backPressBehavior_false')
      .backPressBehavior({closeSwipeAction: false})
      .height('20%')
      
      List({ space: 2, scroller: this.scroller }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('item3_' + item)
              .width('100%')
              .height('20%')
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }
          .transition(TransitionEffect.OPACITY)
          .swipeAction({
            end: {
              builder: () => {
                this.itemEnd()
              },
              onAction: () => {
                this.getUIContext()?.animateTo({ duration: 1000 }, () => {
                  let index = this.arr.indexOf(item);
                  this.arr.splice(index, 1);
                });
              },
              actionAreaDistance: 56,
            }
          })
        }, (item: number) => item.toString())
      }
      .id('list_backPressBehavior_null')
      .backPressBehavior(null)
      .height('20%')

      List({ space: 2, scroller: this.scroller }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('item4_' + item)
              .width('100%')
              .height('20%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }
          .transition(TransitionEffect.OPACITY)
          .swipeAction({
            end: {
              builder: () => {
                this.itemEnd()
              },
              onAction: () => {
                this.getUIContext()?.animateTo({ duration: 1000 }, () => {
                  let index = this.arr.indexOf(item);
                  this.arr.splice(index, 1);
                });
              },
              actionAreaDistance: 56,
            }
          })
        }, (item: number) => item.toString())
      }
      .id('list_backPressBehavior_undefined')
      .backPressBehavior(undefined)
      .height('20%')
    }
    .padding(10)
    .backgroundColor(0xDCDCDC)
    .width('100%')
    .height('100%')
  }
}