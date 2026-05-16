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
struct ImageBitmapWidthHeight {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private img: ImageBitmap = new ImageBitmap('resources/base/media/icon.png');

  build() {
    Column({ space:3} as ColumnOptions) {
      Canvas(this.context)
        .id('ImageBitmapWidthHeight')
        .width(150)
        .height(100)
        .backgroundColor('#ffff00')
        .onReady(() => {
          this.context.drawImage(this.img, 0, 0, 200, 200, 0, 0, 150, 100)
          this.img.close()
          this.img.width
          this.img.height
          let ret:double = this.img.width;
          let ret1:double = this.img.height;
          console.info('get result:' + ret);
          console.info('get result:' + ret1);
          AppStorage.setOrCreate<double>('ImageBitmapWidth', ret);
          AppStorage.setOrCreate<double>('ImageBitmapHeight', ret1);
          console.info('get result:' + AppStorage.get<double>('ImageBitmapWidth'));
          console.info('get result1:' + AppStorage.get<double>('ImageBitmapHeight'));
        })
    }
    .width('100%')
    .height('100%')
  }
}

