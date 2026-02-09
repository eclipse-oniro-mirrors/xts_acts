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
  Scroll,
  GestureEvent,
  LongPressGesture,
  TapGesture,
  ClickEvent,
  FlexAlign,
  GestureInfo,
  BaseGestureEvent,
  DragEvent,
  GestureControl,
  GestureJudgeResult,
  GestureModifier,
  UIGestureEvent,
  TapGestureHandler
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';

class MyColumnModifierTest implements GestureModifier {
  public text: string = ''

  applyGesture(event: UIGestureEvent): void {
    event.addParallelGesture(
      new TapGestureHandler()
        .tag("aaaaa")
        .onAction((event: GestureEvent) => {
          this.text = 'columnTap'
          console.log("testTag columnTap ")
        })
    )
  }
}

@Entry
@Component
struct addParallelGestureTest1 {
  @State modifier: MyColumnModifierTest = new MyColumnModifierTest()
  @State str:string = '1'

  build() {
    Column({space:10} as ColumnOptions) {
      Column() {
        Text(this.str).fontSize(16)
          .id('addParallelGestureTest1_text')
          .height(200)
          .width(250)
          .backgroundColor(Color.Pink)
          .gesture(
            TapGesture()
              .onAction((event: GestureEvent) => {
                console.log("testTag text tap1")
              }))
      }
      .gestureModifier(this.modifier)
      .borderWidth(1)

      Button('get')
        .onClick((e:ClickEvent)=>{
          this.str = this.modifier.text
        })
        .id('addParallelGestureTest1_get')
    }
    .width('100%')
  }
}


