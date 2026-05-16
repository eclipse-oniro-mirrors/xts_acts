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
  TouchEvent,
  TextAlign,
  FlexAlign,
  ItemAlign,
  FlexDirection,
  Padding,
  Margin,
  $rawfile
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
@Entry
@Component
struct OnTouch2 {
  @State offsetX: number = 10
  @State offsetY: number = 20
  @State text: string = ''
  @State eventType: string = ''

  build() {
    Column() {
      Column() {
        Text('PanGesture offset:X:' + this.offsetX + 'Y:' + this.offsetY).key('Touch3')
        Text(this.text).key('Touch4')
      }
      .key('OnTouch2')
      .height(150)
      .width(200)
      .backgroundColor(Color.Green)
      .translate({x: this.offsetX, y: this.offsetY})
      .onTouch((event?: TouchEvent) => {
        if(event){
          this.text = String(Math.round(event.touches[0].x))
        }
      })
    }
    .height(150)
    .width(200)
    .backgroundColor(Color.Orange)
  }
}