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
  CanvasRenderingContext2D,
  Canvas,ColumnOptions,ImageBitmap
} from '@ohos.arkui.component';

import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct ImageDataWidthHeightData {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private img: ImageBitmap = new ImageBitmap('resources/base/media/icon.png');

  build() {
    Column({ space:3} as ColumnOptions) {
      Canvas(this.context)
        .id('ImageDataWidthHeightData')
        .width(150)
        .height(100)
        .backgroundColor('#ffff00')
        .onReady(() => {
          this.context.drawImage(this.img, 0, 0, 130, 130)
          let imageData = this.context.getImageData(50, 50, 130, 130)
          this.context.putImageData(imageData, 150, 150)
          let ret:int = imageData.width;
          let ret1:int = imageData.height;
          ret = 150
          ret1 = 100
          let ret2:Uint8ClampedArray | undefined = imageData.data;
          console.info('get result:' + ret);
          console.info('get result1:' + ret1);
          console.info('get result2:' + ret2);
          AppStorage.setOrCreate<int>('ImageDataWidth', ret);
          AppStorage.setOrCreate<int>('ImageDataHeight', ret1);
          AppStorage.setOrCreate<Uint8ClampedArray | undefined>('ImageDataData', ret2);
          console.info('get result:' + AppStorage.get<int>('ImageDataWidth'));
          console.info('get result1:' + AppStorage.get<int>('ImageDataHeight'));
          console.info('get result1:' + AppStorage.get<Uint8ClampedArray | undefined>('ImageDataData'));
        })
    }
    .width('100%')
    .height('100%')
  }
}

