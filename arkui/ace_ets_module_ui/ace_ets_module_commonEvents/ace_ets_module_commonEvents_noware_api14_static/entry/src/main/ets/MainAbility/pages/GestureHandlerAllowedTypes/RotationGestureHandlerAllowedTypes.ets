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
  HorizontalAlign,RotationGestureHandler
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

class RotationGestureHandlerAllowedTypesModifier implements GestureModifier {
  toolTypes: Array<SourceTool> = [];
  listener: Callback<string> = (data: string) => {};
  constructor(types: Array<SourceTool>, callback: Callback<string>) {
    this.toolTypes = types;
    this.listener = callback;
  }

  applyGesture(event: UIGestureEvent): void {
    console.log('applyGesture -------')
    event.addGesture(
      new RotationGestureHandler()
        .allowedTypes(this.toolTypes)
        .onActionStart((event: GestureEvent) => {
          console.log('onActionStart -------')
          this.listener('allowed types success');
        })
        .onActionUpdate((event: GestureEvent) => {
          console.log('onActionUpdate -------')
          this.listener('allowed types success');
        })
    )
  }
}

@Entry
@Component
struct RotateGestureHandlerAllowedTypes {

  @State result: string = 'allowed types default';
  private callback: Callback<string> = (data: string) => {
    console.log('callback -------')
    this.result = data;
  }
  @State modifier: RotationGestureHandlerAllowedTypesModifier = new RotationGestureHandlerAllowedTypesModifier([], this.callback);

  build() {
    Column({space: 10} as ColumnOptions) {
      Column() {
        Text('RotationGesture').fontSize(20)
      }
      .width(160).height(160)
      .backgroundColor(Color.Yellow).key('RotationGestureHandlerAllowedTypes_Text')
      .gestureModifier(this.modifier)

      Text(this.result).key('RotationGestureHandlerAllowedTypes_result')

      Button('Mouse').id('Mouse_Type')
        .onClick((e: ClickEvent) => {
          this.result = 'allowed types default'
          this.modifier = new RotationGestureHandlerAllowedTypesModifier([SourceTool.MOUSE], this.callback);
        })
      Button('Finger').id('Finger_Type')
        .onClick((e: ClickEvent) => {
          this.result = 'allowed types default'
          this.modifier = new RotationGestureHandlerAllowedTypesModifier([SourceTool.Finger], this.callback);
        })
      Button('Invalid').id('Invalid_type')
          .onClick((e: ClickEvent) => {
            this.result = 'allowed types default';
            // this.modifier = new RotationGestureHandlerAllowedTypesModifier([null, undefined], this.callback);
          })
    }.padding({top: 10, left:40 } as Padding).alignItems(HorizontalAlign.Start).width('100%').height('100%').backgroundColor('#ffbebaba').key('RotationGestureHandlerAllowedTypes_Father')
  }
}