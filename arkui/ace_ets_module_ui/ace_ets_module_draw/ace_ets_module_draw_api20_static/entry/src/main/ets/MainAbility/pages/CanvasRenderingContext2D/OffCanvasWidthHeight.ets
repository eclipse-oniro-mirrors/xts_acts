'use static';

/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  Entry,
  Column,
  Component,
  RenderingContextSettings,
  CanvasRenderingContext2D,OffscreenCanvas,
  Canvas,ColumnOptions
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { LengthMetricsUnit } from '@kit.ArkUI';

@Entry
@Component
struct OffCanvasWidthHeight {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private offCanvas: OffscreenCanvas = new OffscreenCanvas(200, 200);

  build() {
    Column({ space:3} as ColumnOptions) {
      Canvas(this.context)
        .id('OffCanvasWidthHeight')
        .width(150)
        .height(100)
        .backgroundColor('#ffff00')
        .onReady(() => {
          let offContext = this.offCanvas.getContext('2d', this.settings)
          let ret:double = this.offCanvas.width
          this.context.fillRect(0, 0, ret / 2, 180)
          let ret1:double = this.offCanvas.height
          offContext.fillRect(0, 0, this.offCanvas.width, 150)
          offContext.fillRect(0, 0, this.offCanvas.height, 100)
          console.info('get result:' + ret);
          console.info('get result1:' + ret1);
          AppStorage.setOrCreate<double>('OffCanvasWidth', ret);
          AppStorage.setOrCreate<double>('OffCanvasHeight', ret1);
          console.info('get result:' + AppStorage.get<double>('OffCanvasWidth'));
          console.info('get result1:' + AppStorage.get<double>('OffCanvasHeight'));
        })
    }
    .width('100%')
    .height('100%')
  }
}

