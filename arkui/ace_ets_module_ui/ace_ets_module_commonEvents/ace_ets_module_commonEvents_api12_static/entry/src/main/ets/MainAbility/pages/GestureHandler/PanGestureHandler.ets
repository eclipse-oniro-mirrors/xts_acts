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
  GestureGroupGestureHandlerOptions,
  GestureGroupHandler,
  UIGestureEvent,
  TapGestureHandler,
  PanGestureHandler,
  PanGestureHandlerOptions
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';

class PanGestureModifier implements GestureModifier {
  supportDoubleTap: boolean = true
  value: string = 'pan succ'
  PanOptions: PanGestureHandlerOptions = { fingers: 1 }

  applyGesture(event: UIGestureEvent): void {
    if (this.supportDoubleTap) {
      event.addGesture(
        new PanGestureHandler(this.PanOptions)
          .tag("aaa")
          .onActionStart((event: GestureEvent) => {
            console.log("button " +JSON.stringify(event.repeat))
            // return this.value
          })
      )
    } else {
      event.addGesture(
        new TapGestureHandler({ count: 1, fingers: 1 })
          .onAction(()=>{
            // return 'Tap start'
          })
      )
    }
  }
}

@Entry
@Component
struct PanGestureHandler1 {
  @State modifier: PanGestureModifier = new PanGestureModifier()

  build() {
    Row() {
      Column() {
        Button(this.modifier.value).margin({bottom:20} as Margin).id('PanGestureHandler1')
        Column()
          .id('PanGestureHandlerColumn')
          .gestureModifier(this.modifier)
          .width("90%")
          .height("80%")
          .backgroundColor(Color.Blue)
      }
      .width('100%')
    }
    .height('100%')
  }
}