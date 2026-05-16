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
  ShapePoint,Line,Canvas,RenderingContextSettings,CanvasRenderingContext2D
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct canves1 {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  @State isChange:Boolean = false
  @State canvasWidth:String = '100%'
  @State onReadySet:string = 'Set';
  @State text:string = 'test';

  build() {
    Column() {
      Column() {
        Text('Canvas')
          .backgroundColor('#00ff00')
        Canvas(this.context)
          .width(this.canvasWidth)
          .height('45%')
          .onReady(this.isChange ? () => {
            console.log('xxx onReady')
            this.text = this.onReadySet;
            this.context.fillRect(0, 30, 100, 100)
          } : undefined)
          .id('Canvas')

        Text(this.text)
          .backgroundColor('#00ff00')
          .id('onReadySet')

      }

      Row() {
        Button('ChangeSize')
          .onClick((e: ClickEvent) => {
              this.isChange = false;
              this.onReadySet = 'onReadySet';
              this.canvasWidth = '80%';
          })
          .margin(5)
          .id('onReadyChange')
      }
      .margin({ left: 5, top: 5 } as Margin)
    }
    .width('100%')
    .height('100%')
  }
}