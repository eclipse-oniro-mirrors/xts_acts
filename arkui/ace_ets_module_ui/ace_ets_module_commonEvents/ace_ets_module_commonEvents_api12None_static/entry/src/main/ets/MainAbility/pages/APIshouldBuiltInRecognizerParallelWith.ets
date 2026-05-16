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
  Entry,
  Component,
  Column,
  Row,
  Text,
  ColumnOptions,
  TouchType,
  CustomBuilder,
  DragItemInfo,
  Color,
  Button,
  TouchEvent,
  Margin,
  Scroller,
  GestureRecognizer,
  PanRecognizer,
  GestureEvent,
  ScrollableTargetInfo,
  Stack,
  Alignment,
  Scroll,
  TextAlign,
  ForEach,
  ScrollDirection,
  BarState,
  EdgeEffect,
  GestureControl,
  PanGesture,
  GestureRecognizerState
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct APIshouldBuiltInRecognizerParallelWith {
  scroller: Scroller = new Scroller()
  scroller2: Scroller = new Scroller()
  private arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
  private childRecognizer: GestureRecognizer = new GestureRecognizer()
  private currentRecognizer: GestureRecognizer = new GestureRecognizer()
  private lastOffset: number = 0
  @State API_getTag: string = 'API_getTag'
  @State API_isBuiltIn: boolean = false
  @State API_getEventTargetInfo: string = 'API_getEventTargetInfo'
  @State API_getPanGestureOptions: string = 'API_getPanGestureOptions'



  build() {
    Column({ space: 10 } as ColumnOptions) {
      Text(this.API_getTag).key('APIshouldBuiltInRecognizerParallelWith_Text01').margin({ top: 20 } as Margin)
      Text(`${this.API_isBuiltIn}`).key('APIshouldBuiltInRecognizerParallelWith_Text02')
      Text(this.API_getEventTargetInfo).key('APIshouldBuiltInRecognizerParallelWith_Text03')
      Text(this.API_getPanGestureOptions).key('APIshouldBuiltInRecognizerParallelWith_Text04')
      Stack({ alignContent: Alignment.TopStart }) {
        Scroll(this.scroller) {
          Column() {
            Text("Scroll Area")
              .width('90%')
              .height(150)
              .backgroundColor(0xFFFFFF)
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .margin({ top: 10 } as Margin)
            Scroll(this.scroller2) {
              Column() {
                Text("Scroll Area2")
                  .width('90%')
                  .height(150)
                  .backgroundColor(0xFFFFFF)
                  .borderRadius(15)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .margin({ top: 10 } as Margin)
                Column() {
                  ForEach(this.arr, (item: number) => {
                    Text(item.toString())
                      .width('90%')
                      .height(150)
                      .backgroundColor(0xFFFFFF)
                      .borderRadius(15)
                      .fontSize(16)
                      .textAlign(TextAlign.Center)
                      .margin({ top: 10 } as Margin)
                  }, (item: number, index: int):string => String(item))
                }.width('100%')
              }
            }
            .id("inner")
            .width('100%')
            .height('60%')
          }.width('100%')
        }
        .id("outer")
        .height('60%')
        .scrollable(ScrollDirection.Vertical)
        .scrollBar(BarState.On)
        .scrollBarColor(Color.Gray)
        .scrollBarWidth(10)
        .edgeEffect(EdgeEffect.None)
        .shouldBuiltInRecognizerParallelWith((current: GestureRecognizer, others: Array<GestureRecognizer>) => {
          this.API_getTag = current.getTag()
          this.API_isBuiltIn = current.isBuiltIn()
          this.API_getEventTargetInfo = current.getEventTargetInfo()?.getId()!
          let a = current as PanRecognizer
          this.API_getPanGestureOptions = a.getPanGestureOptions().getDirection().toString()

          for (let i = 0; i < others.length; i++) {
            let target = others[i].getEventTargetInfo();
            if (target) {
              if (target.getId() == "inner" && others[i].isBuiltIn() &&
                others[i].getType() == GestureControl.GestureType.PAN_GESTURE) {
                this.currentRecognizer = current;
                this.childRecognizer = others[i];
                return others[i];
              }
            }
          }
          //return undefined;
        })
        .parallelGesture(
          PanGesture()
            .onActionUpdate((event: GestureEvent) => {
              if (this.childRecognizer.getState() != GestureRecognizerState.SUCCESSFUL ||
                this.currentRecognizer.getState() != GestureRecognizerState.SUCCESSFUL) {
                return;
              }
              let target = this.childRecognizer.getEventTargetInfo() as ScrollableTargetInfo;
              let currentTarget = this.currentRecognizer.getEventTargetInfo() as ScrollableTargetInfo;
              if (target instanceof ScrollableTargetInfo && currentTarget instanceof ScrollableTargetInfo) {
                if (target.isEnd()) {
                  if ((event.offsetY - this.lastOffset) < 0) {
                    this.childRecognizer.setEnabled(false)
                    if (currentTarget.isEnd()) {
                      this.currentRecognizer.setEnabled(false)
                    } else {
                      this.currentRecognizer.setEnabled(true)
                    }
                  } else {
                    this.childRecognizer.setEnabled(true)
                    this.currentRecognizer.setEnabled(false)
                  }
                } else if (target.isBegin()) {
                  if ((event.offsetY - this.lastOffset) > 0) {
                    this.childRecognizer.setEnabled(false)
                    if (currentTarget.isBegin()) {
                      this.currentRecognizer.setEnabled(false)
                    } else {
                      this.currentRecognizer.setEnabled(true)
                    }
                  } else {
                    this.childRecognizer.setEnabled(true)
                    this.currentRecognizer.setEnabled(false)
                  }
                } else {
                  this.childRecognizer.setEnabled(true)
                  this.currentRecognizer.setEnabled(false)
                }
              }
              this.lastOffset = event.offsetY
            })
        )
      }.width('100%').height('100%').backgroundColor(0xDCDCDC)

    }
  }
}