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
  Text,
  DragEvent,
  Image,
  Button,
  GestureModifier,
  UIGestureEvent,
  SourceTool,
  GestureEvent,
  ClickEvent,
  Margin,
  Padding,
  Color,
  HorizontalAlign,SwipeGestureHandler
} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import { Callback } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';

class SwipeGestureHandlerAllowedTypesModifier implements GestureModifier {
  toolTypes: Array<SourceTool > = [];
  listener: Callback<string> = (data: string) => {};
  constructor(types: Array<SourceTool>, callback: Callback<string>) {
    this.toolTypes = types;
    this.listener = callback;
  }

  applyGesture(event: UIGestureEvent): void {
    event.addGesture(
      new SwipeGestureHandler({ fingers: 1 })
        .allowedTypes(this.toolTypes)
        .onAction((event: GestureEvent) => {
          this.listener('allowed types success');
        })
    )
  }
}

@Entry
@Component
struct SwipeGestureHandlerAllowedTypes {

  @State result: string = 'allowed types default';
  private callback: Callback<string> = (data: string) => {
    this.result = data;
  }
  @State modifier: SwipeGestureHandlerAllowedTypesModifier = new SwipeGestureHandlerAllowedTypesModifier([], this.callback);

  build() {
    Column({space: 10} as ColumnOptions) {
      Text('Swipe').fontSize(20).width(240).height(80).margin({left:0,top:0} as Margin).padding({left:0,top:0} as Padding).backgroundColor(Color.Yellow).key('SwipeGestureHandlerAllowedTypes_Text')
        .gestureModifier(this.modifier)

      Text(this.result).key('SwipeGestureHandlerAllowedTypes_result')

      Button('Mouse').id('Mouse_Type')
        .onClick((e: ClickEvent) => {
          this.result = 'allowed types default'
          this.modifier = new SwipeGestureHandlerAllowedTypesModifier([SourceTool.MOUSE], this.callback);
        })
      Button('Finger').id('Finger_Type')
        .onClick((e: ClickEvent) => {
          this.result = 'allowed types default'
          this.modifier = new SwipeGestureHandlerAllowedTypesModifier([SourceTool.Finger], this.callback);
        })
      Button('Invalid').id('Invalid_type')
          .onClick((e: ClickEvent) => {
            this.result = 'allowed types default';
            // this.modifier = new SwipeGestureHandlerAllowedTypesModifier([null, undefined], this.callback);
          })
    }.alignItems(HorizontalAlign.Start).width('100%').height('100%').backgroundColor('#ffbebaba').key('SwipeGestureHandlerAllowedTypes_Father')
  }
}

