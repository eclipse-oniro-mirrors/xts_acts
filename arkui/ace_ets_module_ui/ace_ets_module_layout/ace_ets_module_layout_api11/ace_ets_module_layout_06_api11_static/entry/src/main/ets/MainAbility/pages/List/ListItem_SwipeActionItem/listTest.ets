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

@Entry
@Component
struct ListItemExample2 {
  @State message: string = 'Hello World';
  @State arr: Array<number> = new Array<number>(0, 1, 2, 3, 4);
  @State enterEndDeleteAreaString: string = "not enterEndDeleteArea";
  @State exitEndDeleteAreaString: string = "not exitEndDeleteArea";
  @State swipeActionState: string = '-1';

  @Builder
  itemEnd() {
    Row() {
      Button("Delete").margin("4vp").fontSize(12).width('5%')
      Button("Set").margin("4vp").fontSize(12).width('5%')
    }.padding("4vp").justifyContent(FlexAlign.SpaceEvenly)
  }

  @Builder
  itemStart() {
    Row() {
      Button("StartDelete").margin("4vp").fontSize(12).width('5%')
      Button("StartSet").margin("4vp").fontSize(12).width('5%')
    }.padding("4vp").justifyContent(FlexAlign.SpaceEvenly)
  }

  build() {
    Column() {
      Text(this.enterEndDeleteAreaString).fontSize(14)
      Text(this.exitEndDeleteAreaString).fontSize(14)
      Text(this.swipeActionState).fontSize(14).key('swipeState')
      Button("Delete").key('btreset')
        .height('8%')
        .onClick((e: ClickEvent) => {
          this.swipeActionState = "-1";
          this.arr = [0, 1, 2, 3, 4];
        })
      List({ space: 10 }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text("item" + item)
              .width('100%')
              .height('30%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }
          // .transition(TransitionEffect.OPACITY.opacity(0))
          /*          .transition({ type: TransitionType.Delete, opacity: 0 })*/
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
              actionAreaDistance: 56,
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
          , edgeEffect: SwipeEdgeEffect.Spring


          })
          .key('lSwipeAction' + item)
        }, (item: number) => item.toString())
      }
      .height('90%')
      .width('90%')

    }
    .padding(10)
    .backgroundColor(0xDCDCDC)
    .width('100%')
    .height('100%')
  }
}