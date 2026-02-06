'use static';
/*
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
import {
  Entry,
  Component,
  $r,
  Column,
  ColumnOptions,
  Builder,
  FontWeight,
  wrapBuilder,
  Row,
  ClickEvent,
  Text,
  Swiper,
  TabsController,
  Button,
  BarMode,
  BarPosition,
  Color,
  SwiperController,
  TextAlign,
  Direction,
  Tabs,
  Margin,
  TabContent,
  FlexAlign,
  ListScroller,
  List,
  SwipeActionState,
  ListItem,
  Axis,
  SwipeEdgeEffect,
  ComponentContent,
  TransitionEffect,
  Curve,
  CustomBuilder
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import events_emitter from '@ohos.events.emitter';
import MyUtils from '../../common/Utils';

class Params {
  constructor() {
  }
}

@Builder
function itemStart() {
  Row() {
    Button("Del").margin("4vp")
    Button("Set").margin("4vp")
  }.padding("4vp").justifyContent(FlexAlign.SpaceEvenly)
}

@Builder
function itemEnd() {
  Row() {
    Button("Del").margin("4vp")
    Button("Set").margin("4vp")
  }.padding("4vp").justifyContent(FlexAlign.SpaceEvenly)
}

@Entry
@Component
struct ListSwipe {
  private listScroller: ListScroller = new ListScroller();
  @State list1Item0State: string = ''
  @State list1Item1Offset: string = ''
  @State closeButtonContent: string = ''
  @State list2Item0State: string = ''
  @State stateContent: string = ''
  @State offsetContent: string = ''
  uiContext: UIContext = this.getUIContext();

  build() {
    Column({ space: 20 } as ColumnOptions) {
      List({ space: 20, initialIndex: 0 }) {
        ListItem() {
          Text('ListItem0')
            .width('100%')
            .height(30)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .borderRadius(10)
            .backgroundColor('0xFFFFFF')
        }
        .key('MyList1_ListItem0')
        .transition(TransitionEffect.OPACITY.animation({ duration: 2000, curve: Curve.Ease }).combine(
          TransitionEffect.rotate({ z: 1, angle: 180 })))
        .swipeAction({
          end: {
            builderComponent: new ComponentContent(this.uiContext, wrapBuilder<CustomBuilder>(itemEnd)),
            // without onAction, no deleteArea
            onStateChange: (state: SwipeActionState) => {
              console.info('xyb: swipe action state EXPANDED')
              if (state == SwipeActionState.COLLAPSED) {
                console.info('MyList1_ListItem0 swipe action state COLLAPSED')
                this.list1Item0State = 'end COLLAPSED'
              } else if (state == SwipeActionState.EXPANDED) {
                console.info('MyList1_ListItem0 swipe action state EXPANDED')
                this.list1Item0State = 'end EXPANDED'
              } else if (state == SwipeActionState.ACTIONING) {
                console.info('MyList1_ListItem0 swipe action state ACTIONING')
                this.list1Item0State = 'end ACTIONING'
              } else {
                console.info('MyList1_ListItem0 swipe action state UNKOWN')
                this.list1Item0State = 'end UNKOWN'
              }
            }
          },
          edgeEffect: SwipeEdgeEffect.Spring,
          onOffsetChange: (offset: number) => {
            if (offset > 0) {
              console.info('MyList1_Item0 swipe start')
              this.offsetContent = 'swipe start'
            } else {
              console.info('MyList1_Item0 swipe end')
              this.offsetContent = 'swipe end'
            }
          }
        })

        ListItem() {
          Text('ListItem1')
            .width('100%')
            .height(30)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .borderRadius(10)
            .backgroundColor('0xFFFFFF')
        }
        .key('MyList1_ListItem1')
        .transition(TransitionEffect.OPACITY.animation({ duration: 2000, curve: Curve.Ease }))
        .swipeAction({
          end: {
            builderComponent: new ComponentContent(this.uiContext, wrapBuilder<CustomBuilder>(itemEnd)),
            // without onAction, no deleteArea
          },
          edgeEffect: SwipeEdgeEffect.Spring,
          onOffsetChange: (offset: number) => {
            if (offset > 0) {
              console.info('MyList1_Item0 swipe start')
              this.list1Item1Offset = 'swipe start'
            } else {
              console.info('MyList1_Item0 swipe end')
              this.list1Item1Offset = 'swipe end'
            }
          }
        })
      }
      .margin({ top: 5 } as Margin)
      .listDirection(Axis.Vertical)
      .key('MyList1')
      .width('90%')

      List({ space: 20, initialIndex: 0, scroller: this.listScroller }) {
        ListItem() {
          Text('ListItem0')
            .width('100%')
            .height(30)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .borderRadius(10)
            .backgroundColor('0xFFFFFF')
        }
        .key('MyList2_ListItem0')
        .transition(TransitionEffect.OPACITY.animation({ duration: 2000, curve: Curve.Ease }))
        .swipeAction({
          start: {
            builderComponent: new ComponentContent(this.uiContext, wrapBuilder<CustomBuilder>(itemStart)),
            actionAreaDistance: 5,
            onStateChange: (state: SwipeActionState) => {
              if (state == SwipeActionState.COLLAPSED) {
                console.info('MyList2_ListItem0 swipe action state COLLAPSED')
                this.list2Item0State = 'COLLAPSED'
              } else if (state == SwipeActionState.EXPANDED) {
                console.info('MyList2_ListItem0 swipe action state EXPANDED')
                this.list2Item0State = 'EXPANDED'
              } else if (state == SwipeActionState.ACTIONING) {
                console.info('MyList2_ListItem0 swipe action state ACTIONING')
                this.list2Item0State = 'ACTIONING'
              } else {
                console.info('MyList2_ListItem0 swipe action state UNKOWN')
                this.list2Item0State = 'UNKOWN'
              }
            }
          },
          onOffsetChange: (offset: number) => {
            if (offset > 0) {
              MyUtils.sendEvent('swipe start', 70000)
            } else {
              MyUtils.sendEvent('swipe end', 70000)
            }
          },
          edgeEffect: SwipeEdgeEffect.Spring
        })

        ListItem() {
          Text('ListItem1')
            .width('100%')
            .height(30)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .borderRadius(10)
            .backgroundColor('0xFFFFFF')
        }
        .key('MyList2_ListItem1')
        .transition(TransitionEffect.OPACITY.animation({ duration: 2000, curve: Curve.Ease }))
        .swipeAction({
          start: {
            builderComponent: new ComponentContent(this.uiContext, wrapBuilder<CustomBuilder>(itemEnd)),
            actionAreaDistance: 5,
            // with onAction
            onAction: () => {
            },
            onStateChange: (state: SwipeActionState) => {
              if (state == SwipeActionState.COLLAPSED) {
                console.info('MyList2_ListItem1 swipe action state COLLAPSED')
                this.stateContent = 'COLLAPSED'
              } else if (state == SwipeActionState.EXPANDED) {
                console.info('MyList2_ListItem1 swipe action state EXPANDED')
                this.stateContent = 'EXPANDED'
              } else if (state == SwipeActionState.ACTIONING) {
                console.info('MyList2_ListItem1 swipe action state ACTIONING')
                this.stateContent = 'ACTIONING'
              } else {
                console.info('MyList2_ListItem1 swipe action state UNKOWN')
                this.stateContent = 'UNKOWN'
              }
            }
          },
          onOffsetChange: (offset: number) => {
            if (offset > 0) {
              this.offsetContent = 'swipe start'
            } else {
              this.offsetContent = 'swipe left'
            }
          },
          edgeEffect: SwipeEdgeEffect.Spring
        })
      }
      .divider({
        strokeWidth: 2,
        color: '0xFF',
        startMargin: 20,
        endMargin: 20
      })
      .margin({ top: 5 } as Margin)
      .listDirection(Axis.Vertical)
      .key('MyList2')
      .width('90%')

      Button("Collapse All")
        .width("60%")
        .height(80)
        .key("MyList2CloseButton")
        .onClick((e: ClickEvent) => {
          console.info("onClick closeAllSwipeActions")
          this.listScroller.closeAllSwipeActions({
            onFinish: () => {
              this.closeButtonContent = 'onFinish'
            }
          });
        })
      Text(this.list1Item0State)
        .key('swipe0100')
        .width("60%")
        .height(80)
        .backgroundColor('0x0000ff')
      Text(this.list2Item0State)
        .key('swipe0300')
        .width("60%")
        .height(80)
        .backgroundColor('0x0000ff')
      Text(this.closeButtonContent)
        .key('swipe0400')
        .width("60%")
        .height(80)
        .backgroundColor('0x0000ff')
      Text(this.list1Item1Offset)
        .key('swipe0500')
        .width("60%")
        .height(80)
        .backgroundColor('0x0000ff')
    }
    .padding(10)
    .backgroundColor('0xDCDCDC')
    .width('100%')
    .height('100%')
  }
}
