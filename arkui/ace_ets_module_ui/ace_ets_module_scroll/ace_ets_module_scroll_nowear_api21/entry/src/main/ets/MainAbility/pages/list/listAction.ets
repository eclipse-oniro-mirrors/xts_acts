/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct ListItemExample5 {
  @State list1Item0State: string = '1111';
  @Builder
  itemAction(str: string) {
    Row() {
      Text(str)
        .id('text' + str)
        .margin('4vp')
    }.padding('4vp').justifyContent(FlexAlign.SpaceEvenly)
  }
  @Builder
  itemAction1(str1: string) {
    Row() {
      Text(str1)
        .id('text2' + str1)
        .margin('4vp')
    }.padding('4vp').justifyContent(FlexAlign.SpaceEvenly)
  }

  @Builder
  itemAction2(str2: string) {
    Row() {
      Text(str2)
        .id('text3' + str2)
        .margin('4vp')
    }.padding('4vp').justifyContent(FlexAlign.SpaceEvenly)
  }
  @Builder
  itemAction3(str3: string) {
    Row() {
      Text(str3)
        .id('text4' + str3)
        .margin('4vp')
    }.padding('4vp').justifyContent(FlexAlign.SpaceEvenly)
  }
  build() {
    Flex({ wrap: FlexWrap.Wrap }) {
      Text(this.list1Item0State)
        .id('swipe0100')

      Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.SpaceBetween }) {
        Button('expand start')
          .id('btn1')
          .onClick(() => {
            try {
              let node: FrameNode | null = this.getUIContext().getAttachedFrameNodeById('listItem');
              ListItemSwipeActionManager.expand(node, ListItemSwipeActionDirection.START);
            } catch (error) {
              console.error('Error expand item:', (error as BusinessError).code, (error as BusinessError).message);
            }
          })
        Button('expand end')
          .id('btn2')
          .onClick(() => {
            try {
              let node1: FrameNode | null = this.getUIContext().getAttachedFrameNodeById('listItem1');
              ListItemSwipeActionManager.expand(node1, ListItemSwipeActionDirection.END);
            } catch (error) {
              console.error('Error expand item:', (error as BusinessError).code, (error as BusinessError).message);
            }
          })
        Button('collapse')
          .id('btn3')
          .onClick(() => {
            try {
              let node: FrameNode | null = this.getUIContext().getAttachedFrameNodeById('listItem');
              ListItemSwipeActionManager.collapse(node);
            } catch (error) {
              console.error('Error collapse item:', (error as BusinessError).code, (error as BusinessError).message);
            }
          })
        Button('collapse1')
          .id('btn4')
          .onClick(() => {
            try {
              let node1: FrameNode | null = this.getUIContext().getAttachedFrameNodeById('listItem1');
              ListItemSwipeActionManager.collapse(node1);
            } catch (error) {
              console.error('Error collapse item:', (error as BusinessError).code, (error as BusinessError).message);
            }
          })
        Button('expand undefined')
          .id('btn5')
          .onClick(() => {
            try {
              let node2: FrameNode | null = this.getUIContext().getAttachedFrameNodeById('listItem2');
              ListItemSwipeActionManager.expand(node2, undefined);
            } catch (error) {
              console.error('Error expand item:', (error as BusinessError).code, (error as BusinessError).message);
            }
          })
        Button('expand null')
          .id('btn6')
          .onClick(() => {
            try {
              let node3: FrameNode | null = this.getUIContext().getAttachedFrameNodeById('listItem3');
              ListItemSwipeActionManager.expand(node3, null);
            } catch (error) {
              console.error('Error expand item:', (error as BusinessError).code, (error as BusinessError).message);
            }
          })
      }
      .margin({ bottom: 10 })

      List({ space: 10 }) {
        ListItem() {
          Text('item')
            .width('100%')
            .height('10%')
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .borderRadius(10)
            .backgroundColor(0xFFFFFF)
        }
        .id('listItem')
        .transition({ type: TransitionType.Delete, opacity: 0 })
        .swipeAction({
          start: {
            builder: () => {
              this.itemAction('start')
            },
            onStateChange: (state: SwipeActionState) => {
              if (state == SwipeActionState.COLLAPSED) {
                console.info('MyList1_ListItem0 swipe action state COLLAPSED');
                this.list1Item0State = 'COLLAPSED';
              } else if (state == SwipeActionState.EXPANDED) {
                console.info('MyList1_ListItem0 swipe action state EXPANDED');
                this.list1Item0State = 'EXPANDED';
              } else if (state == SwipeActionState.ACTIONING) {
                console.info('MyList1_ListItem0 swipe action state ACTIONING');
                this.list1Item0State = 'ACTIONING';
              } else {
                console.info('MyList1_ListItem0 swipe action state UNKOWN');
                this.list1Item0State = 'UNKOWN';
              }
            }
          },
          end: {
            builder: () => {
              this.itemAction('end')
            },
            onStateChange: (state: SwipeActionState) => {
              if (state == SwipeActionState.COLLAPSED) {
                console.info('MyList1_ListItem0 swipe action state COLLAPSED');
                this.list1Item0State = 'COLLAPSED';

              } else if (state == SwipeActionState.EXPANDED) {
                console.info('MyList1_ListItem0 swipe action state EXPANDED')
                this.list1Item0State = 'EXPANDED';
              } else if (state == SwipeActionState.ACTIONING) {
                console.info('MyList1_ListItem0 swipe action state ACTIONING')
                this.list1Item0State = 'ACTIONING';
              } else {
                console.info('MyList1_ListItem0 swipe action state UNKOWN')
                this.list1Item0State = 'UNKOWN';
              }
            }
          }
        })
        ListItem() {
          Text('item')
            .width('100%')
            .height('10%')
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .borderRadius(10)
            .backgroundColor(0xFFFFFF)
        }
        .id('listItem1')
        .transition({ type: TransitionType.Delete, opacity: 0 })
        .swipeAction({
          start: {
            builder: () => {
              this.itemAction1('start')
            },
            onStateChange: (state: SwipeActionState) => {
              if (state == SwipeActionState.COLLAPSED) {
                console.info('MyList1_ListItem0 swipe action state COLLAPSED');
                this.list1Item0State = 'COLLAPSED';
              } else if (state == SwipeActionState.EXPANDED) {
                console.info('MyList1_ListItem0 swipe action state EXPANDED');
                this.list1Item0State = 'EXPANDED';
              } else if (state == SwipeActionState.ACTIONING) {
                console.info('MyList1_ListItem0 swipe action state ACTIONING');
                this.list1Item0State = 'ACTIONING';
              } else {
                console.info('MyList1_ListItem0 swipe action state UNKOWN');
                this.list1Item0State = 'UNKOWN';
              }
            }
          },
          end: {
            builder: () => {
              this.itemAction1('end')
            },
            onStateChange: (state: SwipeActionState) => {
              if (state == SwipeActionState.COLLAPSED) {
                console.info('MyList1_ListItem0 swipe action state COLLAPSED');
                this.list1Item0State = 'COLLAPSED';

              } else if (state == SwipeActionState.EXPANDED) {
                console.info('MyList1_ListItem0 swipe action state EXPANDED');
                this.list1Item0State = 'EXPANDED';
              } else if (state == SwipeActionState.ACTIONING) {
                console.info('MyList1_ListItem0 swipe action state ACTIONING');
                this.list1Item0State = 'ACTIONING';
              } else {
                console.info('MyList1_ListItem0 swipe action state UNKOWN');
                this.list1Item0State = 'UNKOWN';
              }
            }
          }
        })
        ListItem() {
          Text('item')
            .width('100%')
            .height('10%')
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .borderRadius(10)
            .backgroundColor(0xFFFFFF)
        }
        .id('listItem2')
        .transition({ type: TransitionType.Delete, opacity: 0 })
        .swipeAction({
          start: {
            builder: () => {
              this.itemAction2('start')
            },
            onStateChange: (state: SwipeActionState) => {
              if (state == SwipeActionState.COLLAPSED) {
                console.info('MyList1_ListItem0 swipe action state COLLAPSED')
                this.list1Item0State = 'COLLAPSED';
              } else if (state == SwipeActionState.EXPANDED) {
                console.info('MyList1_ListItem0 swipe action state EXPANDED')
                this.list1Item0State = 'EXPANDED';
              } else if (state == SwipeActionState.ACTIONING) {
                console.info('MyList1_ListItem0 swipe action state ACTIONING')
                this.list1Item0State = 'ACTIONING';
              } else {
                console.info('MyList1_ListItem0 swipe action state UNKOWN')
                this.list1Item0State = 'UNKOWN';
              }
            }
          },
          end: {
            builder: () => {
              this.itemAction2('end')
            },
            onStateChange: (state: SwipeActionState) => {
              if (state == SwipeActionState.COLLAPSED) {
                console.info('MyList1_ListItem0 swipe action state COLLAPSED');
                this.list1Item0State = 'COLLAPSED';

              } else if (state == SwipeActionState.EXPANDED) {
                console.info('MyList1_ListItem0 swipe action state EXPANDED');
                this.list1Item0State = 'EXPANDED';
              } else if (state == SwipeActionState.ACTIONING) {
                console.info('MyList1_ListItem0 swipe action state ACTIONING');
                this.list1Item0State = 'ACTIONING';
              } else {
                console.info('MyList1_ListItem0 swipe action state UNKOWN');
                this.list1Item0State = 'UNKOWN';
              }
            }
          }
        })
        ListItem() {
          Text('item')
            .width('100%')
            .height('10%')
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .borderRadius(10)
            .backgroundColor(0xFFFFFF)
        }
        .id('listItem3')
        .transition({ type: TransitionType.Delete, opacity: 0 })
        .swipeAction({
          start: {
            builder: () => {
              this.itemAction3('start')
            },
            onStateChange: (state: SwipeActionState) => {
              if (state == SwipeActionState.COLLAPSED) {
                console.info('MyList1_ListItem0 swipe action state COLLAPSED');
                this.list1Item0State = 'COLLAPSED';
              } else if (state == SwipeActionState.EXPANDED) {
                console.info('MyList1_ListItem0 swipe action state EXPANDED');
                this.list1Item0State = 'EXPANDED';
              } else if (state == SwipeActionState.ACTIONING) {
                console.info('MyList1_ListItem0 swipe action state ACTIONING');
                this.list1Item0State = 'ACTIONING';
              } else {
                console.info('MyList1_ListItem0 swipe action state UNKOWN');
                this.list1Item0State = 'UNKOWN';
              }
            }
          },
          end: {
            builder: () => {
              this.itemAction3('end')
            },
            onStateChange: (state: SwipeActionState) => {
              if (state == SwipeActionState.COLLAPSED) {
                console.info('MyList1_ListItem0 swipe action state COLLAPSED');
                this.list1Item0State = 'COLLAPSED';

              } else if (state == SwipeActionState.EXPANDED) {
                console.info('MyList1_ListItem0 swipe action state EXPANDED');
                this.list1Item0State = 'EXPANDED';
              } else if (state == SwipeActionState.ACTIONING) {
                console.info('MyList1_ListItem0 swipe action state ACTIONING');
                this.list1Item0State = 'ACTIONING';
              } else {
                console.info('MyList1_ListItem0 swipe action state UNKOWN');
                this.list1Item0State = 'UNKOWN';
              }
            }
          }
        })
      }
      .height('80%')
    }
    .padding(10)
    .backgroundColor(0xDCDCDC)
    .width('100%')
    .height('100%')
  }
}