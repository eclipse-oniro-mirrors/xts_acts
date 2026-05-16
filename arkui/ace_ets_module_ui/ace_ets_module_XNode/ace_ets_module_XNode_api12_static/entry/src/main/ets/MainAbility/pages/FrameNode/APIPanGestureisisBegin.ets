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
import promptAction from '@ohos.promptAction';
import {
  Entry,
  Column,
  Component,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Text,
  Button,
  FontWeight,
  ButtonType,
  ClickEvent,
  Margin,
  Color,
  Builder,
  Row,
  Scroller,
  Scroll,
  GestureRecognizer,
  GestureEvent,
  ScrollableTargetInfo,
  ForEach,
  PanGesture,
  TextAlign
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { UIContext, PromptAction } from '@ohos.arkui.UIContext';
@Entry
@Component
struct APIPanGestureisisBegin {
  scroller: Scroller = new Scroller()
  scroller2: Scroller = new Scroller()
  private arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
  private childRecognizer: GestureRecognizer = new GestureRecognizer()
  private currentRecognizer: GestureRecognizer = new GestureRecognizer()
  private lastOffset: number = 0
  @State isEnd: boolean = true
  @State isBegin: boolean = true
  @State API_d: string = 'start'

  build() {
    Column() {
      Scroll(this.scroller) { // 外部滚动容器
        Column() {
          Column().width(200).height(100)
          ForEach(this.arr, (item: number) => {
            Text(item.toString())
              .width('90%')
              .height(150)
              .backgroundColor(0xFFFFFF)
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .margin({ top: 10 } as Margin)
          }, (item: number,index:int):string => String(item))


        }.width('100%')
      }
      .id("outer")
      .height(400)
      .parallelGesture( // 绑定一个Pan手势作为动态控制器
        PanGesture()
          .onActionUpdate((event: GestureEvent)=>{
            let target = this.childRecognizer.getEventTargetInfo() as ScrollableTargetInfo;
            let currentTarget = this.currentRecognizer.getEventTargetInfo() as ScrollableTargetInfo;
            const promptAction = new PromptAction()
            promptAction.showToast({
              message: 'onWillInsert触发了',
              duration: 1000
            })
            if (target instanceof ScrollableTargetInfo && currentTarget instanceof ScrollableTargetInfo) {
              this.isEnd = target?.isEnd()!
              this.isBegin = target?.isBegin()!
            }
            this.lastOffset = event.offsetY
          })
      )

      Text(`${this.isEnd}`).margin({top:40} as Margin).key('APIPanGestureisisBegin_Text01')
      Text(`${this.isBegin}`).margin({top:70} as Margin).key('APIPanGestureisisBegin_Text02')
    }.width('100%').height('100%').backgroundColor(0xDCDCDC)
  }
}