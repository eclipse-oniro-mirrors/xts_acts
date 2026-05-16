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
struct CanvasRenderingContext2DShadowOffsetX {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  @State shadowOffsetXResult: string = 'not set';

  build() {
    Column() {
      Column() {
        Canvas(this.context)
          .id('canvas_shadowOffsetX')
          .width(200)
          .height(70)
          .backgroundColor('#FFFF0000')
          .onReady((): void => {
            this.context.shadowBlur = 10;
            this.context.shadowColor = 'rgb(0,0,0)';
          })
        Button('Set to 20')
          .id('button_shadowOffsetX')
          .height(20)
          .onClick(() => {
            this.context.shadowOffsetX = 20;
            this.context.fillStyle = 'rgb(255,0,0)';
            this.context.fillRect(50, 10, 100, 30);
            this.shadowOffsetXResult = 'shadowOffsetX set to 20';
          })
        Text(`Result: ${this.shadowOffsetXResult}`)
          .height(30)
          .id('text_shadowOffsetX_result')
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}