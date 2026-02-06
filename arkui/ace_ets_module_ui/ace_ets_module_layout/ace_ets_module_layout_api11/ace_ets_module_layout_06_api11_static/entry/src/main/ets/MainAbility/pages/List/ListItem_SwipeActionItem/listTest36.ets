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

import {
  Axis,
  BarState,
  Builder,
  Button,
  ButtonAttribute,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  ComputedBarAttribute,
  EdgeEffect,
  Entry,
  FlexAlign,
  ForEach,
  Grid,
  GridItem,
  HorizontalAlign,
  Image,
  ImageFit,
  List,
  ListItem,
  Margin,
  Row,
  SafeAreaType,
  Scroll,
  ScrollDirection,
  Scroller,
  Search,
  SwipeActionState,
  SwipeEdgeEffect,
  Text,
  TextAlign,
  TextAttribute,
  TransitionEffect
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct ListItemExample36 {
  @State message: string = 'Hello World';
  @State arr: Array<number> = new Array<number>(0, 1, 2, 3, 4);
  @State enterEndDeleteAreaString: string = "not enterEndDeleteArea";
  @State exitEndDeleteAreaString: string = "not exitEndDeleteArea";
  @State swipeActionState: string = '-1';
  @State swipeOffSet: string = '-1';

  onPageShow(): void {
    let context = this.getUIContext() as UIContext
    AppStorage.setOrCreate<UIContext>("context", context);
  }

  @Builder
  itemEnd() {
    Row() {
      Button("Delete").margin("4vp").fontSize(12).height('10%')
      Button("Set").margin("4vp").fontSize(12).height('10%')
    }.padding("4vp").justifyContent(FlexAlign.SpaceEvenly).key('lSwipe36Row2')
  }

  @Builder
  itemStart() {
    Row() {
      Button("StartDelete").margin("4vp").fontSize(12).height('10%')
      Button("StartSet").margin("4vp").fontSize(12).height('10%')
    }.padding("4vp").justifyContent(FlexAlign.SpaceEvenly).key('lSwipe36Row')
  }

  build() {
    Column() {
      Text(this.enterEndDeleteAreaString).fontSize(14)
      Text(this.exitEndDeleteAreaString).fontSize(14)
      Row() {
        Text(this.swipeActionState).fontSize(14).margin({ right: 20 } as Margin).key('swipe36State')
        Text(this.swipeOffSet).fontSize(14).key('swipe36Offset')
      }

      Button("Delete").margin("4vp").key('btreset36')
        .height('8%')
        .onClick((e: ClickEvent) => {
          this.swipeActionState = "-1";
          this.swipeOffSet = "-1"
          this.arr = [0, 1, 2, 3, 4];
        })
      List({ space: 10 }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text("item" + item)
              .width('60%')
              .height('80%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }
          // .transition(TransitionEffect.OPACITY.opacity(0))
          // .transition({ type: TransitionType.Delete, opacity: 0 })
          .swipeAction({
            start: {
              builder: () => {
                this.itemStart();
              },
              onAction: () => {
                this.getUIContext().animateTo({ duration: 1000 }, () => {
                  let index = this.arr.indexOf(item);
                  this.arr.splice(index, 1);
                })
              },
              actionAreaDistance: 30,
              onEnterActionArea: () => {
                this.enterEndDeleteAreaString = "enterEndDeleteArea";
                this.exitEndDeleteAreaString = "not exitEndDeleteArea";
              },
              onExitActionArea: () => {
                this.enterEndDeleteAreaString = "not enterEndDeleteArea";
                this.exitEndDeleteAreaString = "exitEndDeleteArea";
              },
              onStateChange: ((swipeActionState: SwipeActionState) => {
                this.swipeActionState = swipeActionState.toString();
              })

            }
          ,
            edgeEffect: SwipeEdgeEffect.Spring,
            end: {
              builder: () => {
                this.itemEnd();
              },
              onAction: () => {
                this.getUIContext().animateTo({ duration: 1000 }, () => {
                  let index = this.arr.indexOf(item);
                  this.arr.splice(index, 1);
                })
              },
              actionAreaDistance: 30,
              onEnterActionArea: () => {
                this.enterEndDeleteAreaString = "enterEndDeleteArea";
                this.exitEndDeleteAreaString = "not exitEndDeleteArea";
              },
              onExitActionArea: () => {
                this.enterEndDeleteAreaString = "not enterEndDeleteArea";
                this.exitEndDeleteAreaString = "exitEndDeleteArea";
              },
              onStateChange: ((swipeActionState: SwipeActionState) => {
                this.swipeActionState = swipeActionState.toString();
              })

            }
          ,
            onOffsetChange: (offset: number) => {
              console.info('[listTest36.ets] onOffsetChange start! ');
              this.swipeOffSet = offset + "";
            }


          })
          .key('lSwipe36Action' + item)
        }, (item: number) => item.toString())
      }.listDirection(Axis.Horizontal).height('80%')
      .width('90%')

    }
    .padding(10)
    .backgroundColor(0xDCDCDC)
    .width('100%')
    .height('100%')
  }
}