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
import {SwipeGesture,SwipeDirection,LongPressGesture,Color,HorizontalAlign,Padding,GestureEvent,ColumnOptions,Entry,Column,Text,Button,ClickEvent,Component,Margin,SourceTool} from '@ohos.arkui.component'

@Entry
@Component
struct SwipeGestureAllowedTypes {
 @State types: Array<SourceTool> = new Array<SourceTool>();
  @State result: string = 'allowed types default';
  build() {
    Column({space: 10} as ColumnOptions) {
      Text('Swipe').fontSize(20).width(240).height(80).margin({left:0,top:0} as Margin).padding({left:0,top:0} as Padding).backgroundColor(Color.Yellow).key('SwipeGestureAllowedTypes_Text')
        .gesture(
          SwipeGesture({ direction: SwipeDirection.All })
            .allowedTypes(this.types)
            .onAction((event: GestureEvent) => {
              this.result = 'allowed types success'
            })
        )

      Text(this.result).key('SwipeGestureAllowedTypes_result')

      Button('Mouse').key('Mouse_Type')
        .onClick((e: ClickEvent) => {
          this.result = 'allowed types default';
          this.types = [SourceTool.MOUSE];
        })
      Button('Finger').key('Finger_Type')
        .onClick((e: ClickEvent) => {
          this.result = 'allowed types default';
          this.types = [SourceTool.Finger];
        })
      Button('Invalid').id('Invalid_type')
          .onClick((e: ClickEvent) => {
            this.result = 'allowed types default';
            // this.types = [null, undefined];
          })
    }.alignItems(HorizontalAlign.Start).width('100%').height('100%').backgroundColor('#ffbebaba').key('SwipeGestureAllowedTypes_Father')
  }
}








