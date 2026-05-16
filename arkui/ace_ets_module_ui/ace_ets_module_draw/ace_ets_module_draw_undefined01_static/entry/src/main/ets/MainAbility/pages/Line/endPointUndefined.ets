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
  @State endPointChange:Boolean = false;
  @State end:	ShapePoint|undefined = [50,100] as ShapePoint;

  build() {
    Column() {
      Column() {
        Text('action, edgeEffect')
          .backgroundColor('#00ff00')
        Line()
          .startPoint([50,0])
          .endPoint(this.end)
          .width(200)
          .height(150)
          .stroke(Color.Black)
          .backgroundColor('#F5F5F5')
          .id('line2')
      }

      Row() {
        Button('endPointChange').onClick(() => {
          console.log('www' + this.end)
          if (this.endPointChange) {
            this.end = [50,100];
          } else {
            this.end = undefined;
          }
          this.endPointChange = !this.endPointChange;
          console.log('www' + this.end)
        })
          .margin(5)
          .id('endPointChange')
      }
      .margin({ left: 5, top: 5 } as Margin)
    }
    .width('100%')
    .height('100%')
  }
}