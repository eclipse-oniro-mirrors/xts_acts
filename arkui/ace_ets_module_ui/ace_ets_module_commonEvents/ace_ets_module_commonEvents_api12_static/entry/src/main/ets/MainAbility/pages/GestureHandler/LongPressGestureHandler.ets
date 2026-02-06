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
  LongPressGestureHandlerOptions,
  LongPressGestureHandler
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';

class LongPressModifier implements GestureModifier {
  supportDoubleTap: boolean = true
  value: string = 'succ'
  LongPressOptions: LongPressGestureHandlerOptions = { fingers: 1 }

  applyGesture(event: UIGestureEvent): void {
    if (this.supportDoubleTap) {
      event.addGesture(
        new TapGestureHandler({ count: 1, fingers: 1 })
          .tag('aaa')
          .onAction((event: GestureEvent) => {
            console.log('button tap ' +JSON.stringify(event.repeat))
            // return this.value
          })
      )
    } else {
      event.addGesture(
        new LongPressGestureHandler(this.LongPressOptions)
          .onAction(()=>{
            // return 'LongPress start'
          })
      )
    }
  }
}

@Entry
@Component
struct LongPressGestureHandler1 {
  @State modifier: LongPressModifier = new LongPressModifier()

  build() {
    Row() {
      Column() {
        Button(this.modifier.value).margin({bottom:20} as Margin).id('LongPressGestureHandler1')
        Column()
          .id('LongPressGestureHandlerColumn')
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