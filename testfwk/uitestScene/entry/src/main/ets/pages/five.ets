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

import { uniformTypeDescriptor } from '@kit.ArkData';
import deviceInfo from '@ohos.deviceInfo'

@Entry
@Component
struct Five {
  @State message: string = 'Hello World 5555555555555';
  @State isShowLongEventCom: boolean = false;
  @State longClickEvent: string = 'Hello World';
  @State isShowDragEventCom: boolean = false;
  @State targetText: string = 'Drag Text';
  @State backGroundColor: Color = Color.Transparent;
  @State inSetValueOne: number = 0;
  @State inSetValueTwo: number = 40;
  private arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
  scroller: Scroller = new Scroller();

  build() {
    Column() {
      Row() {
        if (this.isShowLongEventCom) {
          Text('ShowLongEventText')
            .id('ShowLongEventText')
            .fontSize(10)
        }
        Text('longClick')
          .id('longClickBtn')
          .fontSize(10)
          .margin({ left: 10 })
          .gesture(LongPressGesture({ repeat: true }).onAction((event: GestureEvent) => {
            if (event && event.repeat) {
              this.isShowLongEventCom = true;
              this.longClickEvent = 'longClickEvent'
            }
          }).onActionEnd((event: GestureEvent) => {
            this.isShowLongEventCom = false;
          }))
        Text(this.longClickEvent)
          .margin({
            left: 10
          })
          .backgroundColor(Color.Green)
          .id('longClickTextResult')
      }
      .backgroundColor(Color.Red)
        .alignItems(VerticalAlign.Center)
        .justifyContent(FlexAlign.Center)

      Row() {
        Column() {
          Text('this is abstract')
            .fontSize(10)
        }
        .margin({ left: 5, top: 5 })
          .id('dragCol')
          .width('30%')
          .onDragEnd((event) => {
            this.isShowDragEventCom = false;
            this.targetText = 'drag end';
            this.backGroundColor = Color.White;
          })
          .onDragStart((event) => {
            this.isShowDragEventCom = true;
            this.backGroundColor = Color.Red;
          })
          .onPreDrag((status: PreDragStatus) => {
          })
          .backgroundColor(this.backGroundColor)

        if (this.isShowDragEventCom) {
          Text('ShowDragEventText')
            .id('ShowDragEventText')
            .width('30%')
            .fontSize(10)
        }
        Column() {
          Text(this.targetText)
            .id('dragResultText')
            .fontSize(10)
            .border({ color: Color.Black, width: 1 })
            .margin(5)
            .allowDrop([uniformTypeDescriptor.UniformDataType.PLAIN_TEXT])
        }
        .width('30%')
      }
      .width('100%')
        .backgroundColor(Color.Red)
        .margin({ top: 10 })

      Text('HorizontalScroll')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
      Scroll(this.scroller) {
        Row() {
          ForEach(this.arr, (item: number) => {
            Text(item + '_hor')
              .backgroundColor(0xDCDCDC)
              .fontSize(10)
              .padding(10)
              .width('100%')
              .height('100%')
              .textAlign(TextAlign.Center)
              .margin({ top: 10 })
          }, (item: string) => item)
        }
      }
        .id('horizontalScroll')
        .width('80%')
        .height('100%')
        .scrollable(ScrollDirection.Horizontal)
        .scrollBar(BarState.On)
        .scrollBarColor(Color.Gray)
        .scrollBarWidth(5)
    }
    .justifyContent(FlexAlign.Center)
  }
}