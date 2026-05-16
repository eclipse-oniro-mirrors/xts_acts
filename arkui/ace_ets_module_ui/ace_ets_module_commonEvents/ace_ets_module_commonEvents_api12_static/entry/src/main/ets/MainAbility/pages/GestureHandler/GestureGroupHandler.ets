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
  GestureHandler,
  GestureMode
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';

class GestureGroupModifier implements GestureModifier {
  supportDoubleTap: boolean = true
  supportPan: boolean = true
  value: string = 'succ'
  temp: GestureHandler[] = [new GestureHandler(), new GestureHandler()]
  GestureGroupOptions1: GestureGroupGestureHandlerOptions = {
    mode: GestureMode.Sequence,
    gestures: this.temp
  }

  applyGesture(event: UIGestureEvent): void {
    if (this.supportDoubleTap) {
      event.addGesture(
        new GestureGroupHandler(this.GestureGroupOptions1)
          .onCancel(() => {
            console.log("GestureGroup start");
          })
      )
    } else {
      event.addGesture(
        new TapGestureHandler()
          .tag("tap gesture")
          .onAction(()=>{
            // return 'tap start'
          })
      )
    }
    if (this.supportPan) {
      event.addGesture(
        new PanGestureHandler()
          .tag("pan gesture")
          .onActionStart(()=>{
            console.log("Pan start");
            // return 'pan start'
          })
      )
    }
  }
}

@Entry
@Component
struct GestureGroupHandler1 {
  @State modifier: GestureGroupModifier = new GestureGroupModifier()

  build() {
    Row() {
      Column() {
        Button(this.modifier.value).margin({bottom:20} as Margin).id('GestureGroupHandler1')
        Column()
          .id('GestureGroupHandlerColumn')
          .gestureModifier(this.modifier)
          .width(400)
          .height(400)
          .backgroundColor(Color.Blue)
      }
      .width('100%')
    }
    .height('100%')
  }
}