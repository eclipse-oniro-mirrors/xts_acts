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
  Flex,
  Text,
  ColumnOptions,
  TouchType,
  CustomBuilder,
  DragItemInfo,
  Color,
  TextArea,
  CopyOptions,
  Visibility,

  TextAlign,
  FlexAlign,
  ItemAlign,
  FlexDirection,
  Padding,
  Margin,
  $rawfile,
  TapGesture,
  GestureEvent
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
@Entry
@Component
struct TapGesture1 {
  @State angle: number = 90
  @State rotateValue: number = 0
  @State value: string = ''

  build() {
    Column(){
      Column() {
        Text('RotationGesture angle:' + this.angle).key('Tap1')
        Text(this.value).key('Tap2')
      }
      .key('TapGesture1')
      .height(150)
      .width(200)
      .backgroundColor(Color.Green)
      .rotate({ angle: this.angle })
      .gesture(
        TapGesture({ count: 1 })
          .onAction((event?: GestureEvent) => {
            if (event) {
              this.value = 'TapGesture'
            }
          })
      )
    }
    .height(150)
    .width(200)
    .backgroundColor(Color.Orange)
    .margin(100)
  }
}