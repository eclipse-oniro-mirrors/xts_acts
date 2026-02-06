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
  Margin,
  Column,
  Button,
  ColumnOptions,
  Text,
  HorizontalAlign,
  Color,
  Line,
  Swiper,
  Scroll,
  List,
  Grid,
  Flex,
  Image,
  Checkbox,
  ForEach,
  ColumnOptions,
  TouchEvent,
  TouchType,
} from '@ohos.arkui.component';
import { MessageManager, Callback } from '../../common/MessageManager';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct RollAngleExample {
  @State text: string = ''
  @State eventType: string = ''
  build() {
    Column() {
      Button('Touch')
      .height('10%')
      .width('15%')
      .margin(10)
      .key('Touch')
        .onTouch((event?: TouchEvent) => {
          if(event){
            if (event.type === TouchType.Down) {
              this.eventType = 'Down'
            }
            if (event.type === TouchType.Up) {
              this.eventType = 'Up'
            }
            if (event.type === TouchType.Move) {
              this.eventType = 'Move'
            }

            this.text = 'Touch:' + this.eventType +
              '\n tiltX:' + event.tiltX+
              '\n rollAngle:' + event.rollAngle;
          }
        })
      Text(this.text).key('text')
    }.width('100%')
  }
}