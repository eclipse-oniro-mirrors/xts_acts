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
struct CanvasRenderingContext2DGlobalCompositeOperation {
  private settingsSourceOver: RenderingContextSettings = new RenderingContextSettings(true);
  private contextSourceOver: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settingsSourceOver);

  private settingsDestinationOver: RenderingContextSettings = new RenderingContextSettings(true);
  private contextDestinationOver: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settingsDestinationOver);
  @State compositeOperationResult: string = 'not set';

  build() {
    Column() {
      Canvas(this.contextSourceOver)
        .id('canvas_globalCompositeOperation_sourceover')
        .width(100)
        .height(50)
        .backgroundColor('#FFFF0000')
        .onReady((): void => {
          this.contextSourceOver.fillStyle = 'rgb(255,0,0)';
          this.contextSourceOver.fillRect(20, 20, 50, 50);
          this.contextSourceOver.globalCompositeOperation = 'source-over';
          this.contextSourceOver.fillStyle = 'rgb(0,0,255)';
          this.contextSourceOver.fillRect(50, 50, 50, 50);
        })

      Column() {
        Canvas(this.contextDestinationOver)
          .id('canvas_globalCompositeOperation_destinationover')
          .width(100)
          .height(50)
          .backgroundColor('#FFFF0000')
          .onReady((): void => {
            this.contextDestinationOver.fillStyle = 'rgb(255,0,0)';
            this.contextDestinationOver.fillRect(20, 20, 50, 50);
            this.contextDestinationOver.fillStyle = 'rgb(0,0,255)';
            this.contextDestinationOver.fillRect(50, 50, 50, 50);
          })
        Button('Set destination-over')
          .id('button_globalCompositeOperation_destinationover')
          .height(30)
          .onClick(() => {
            this.contextDestinationOver.globalCompositeOperation = 'destination-over';
            this.compositeOperationResult = this.contextDestinationOver.globalCompositeOperation;
          })
        Text(`Result: ${this.compositeOperationResult}`)
          .id('text_globalCompositeOperation_result')
          .height(20)
      }

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}