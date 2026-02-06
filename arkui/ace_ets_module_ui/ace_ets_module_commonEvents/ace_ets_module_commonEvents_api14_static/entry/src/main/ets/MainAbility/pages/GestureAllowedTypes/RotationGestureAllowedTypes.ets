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
import { State,AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import {RotationGesture,PanDirection,LongPressGesture,Color,HorizontalAlign,Padding,GestureEvent,ColumnOptions,Entry,Column,Text,Button,ClickEvent,Component,Margin,SourceTool} from '@ohos.arkui.component'

@Entry
@Component
struct RotationGestureAllowedTypes {
  @State types: Array<SourceTool> = new Array<SourceTool>();
  @State result: string = 'allowed types default';
  @State angle: number = 0;
  build() {
    Column({space: 10} as ColumnOptions) {
      Column() {
        Text('RotationGesture').fontSize(20)
      }
      .rotate({ angle: this.angle })
      .width(160).height(160)
      .backgroundColor(Color.Yellow).key('RotationGestureAllowedTypes_Text')
      .gesture(
        RotationGesture()
          .allowedTypes(this.types)
          .onActionStart((event: GestureEvent) => {
            console.info('RotationGestureAllowedTypes onActionStart')
            this.result = 'allowed types success'
          })
          .onActionUpdate((event: GestureEvent) => {
            console.info('RotationGestureAllowedTypes onActionUpdate')
            this.result = 'allowed types success'
          })
      )

      Text(this.result).key('RotationGestureAllowedTypes_result')

      Button('Mouse').id('Mouse_Type')
        .onClick((e: ClickEvent) => {
          this.result = 'allowed types default';
          this.types = [SourceTool.MOUSE];
        })
      Button('Finger').id('Finger_Type')
        .onClick((e: ClickEvent) => {
          this.result = 'allowed types default';
          this.types = [SourceTool.Finger];
        })
      Button('Invalid').id('Invalid_type')
          .onClick((e: ClickEvent) => {
            this.result = 'allowed types default';
            // this.types = [null, undefined];
          })
    }.padding({top: 10, left:40 } as Padding).alignItems(HorizontalAlign.Start).width('100%').height('100%').backgroundColor('#ffbebaba').key('RotationGestureAllowedTypes_Father')
  }
}
