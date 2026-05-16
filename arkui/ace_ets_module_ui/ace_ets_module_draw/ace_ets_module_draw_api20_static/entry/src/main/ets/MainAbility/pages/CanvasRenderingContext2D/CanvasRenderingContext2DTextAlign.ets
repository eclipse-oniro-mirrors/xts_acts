'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
  Canvas,
  CanvasRenderingContext2D,
  RenderingContextSettings,
  Button,
  Text
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct CanvasRenderingContext2DTextAlign {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  @State textAlignResult: string = 'not set';

  build() {
    Column() {
      Column() {
        Canvas(this.context)
          .id('canvas_textAlign')
          .width(200)
          .height(70)
          .backgroundColor('#FFFF0000')
          .onReady((): void => {
            this.context.font = '20px sans-serif';
          })
        Button('Set to center')
          .id('button_textAlign')
          .height(20)
          .onClick(() => {
            this.context.textAlign = 'center';
            this.context.fillText('hello', 100, 30);
            this.textAlignResult = 'textAlign set to center';
          })
        Text(`Result: ${this.textAlignResult}`)
          .height(30)
          .id('text_textAlign_result')
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}