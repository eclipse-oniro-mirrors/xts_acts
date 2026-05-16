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
  Entry, Text, Column, Row, Component, Button, ClickEvent, List, ListItem,
  Scroller, Scroll, Stack, ScrollState, Edge, FlexAlign, ForEach, TextAlign,
  Alignment, Margin, Color, EdgeEffect, ScrollDirection, BarState, OffsetResult,
  ShapePoint,Line
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct line1 {
  @State startPointChange:Boolean = false;
  @State start:	ShapePoint|undefined = [50,0] as ShapePoint;

  build() {
    Column() {
      Column() {
        Text('action, edgeEffect')
          .backgroundColor('#00ff00')
        Line()
          .startPoint(this.start)
          .endPoint([50,100])
          .width(200)
          .height(150)
          .stroke(Color.Black)
          .backgroundColor('#F5F5F5')
          .id('line1')
      }

      Row() {
        Button('startPointChange').onClick(() => {
          console.log('www' + this.start)
          if (this.startPointChange) {
            this.start = [50,0];
          } else {
            this.start = undefined;
          }
          this.startPointChange = !this.startPointChange;
          console.log('www' + this.start)
        })
          .margin(5)
          .id('startPointChange')
      }
      .margin({ left: 5, top: 5 } as Margin)
    }
    .width('100%')
    .height('100%')
  }
}