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
  Canvas,ColumnOptions
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct CanvasRoundRectErrorCode {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)

  build() {
    Column({ space:3} as ColumnOptions) {
      Canvas(this.context)
        .id('CanvasRoundRectErrorCode')
        .width(150)
        .height(100)
        .backgroundColor('#ffff00')
        .onReady(() => {
          try {
            this.context.beginPath();
            this.context.roundRect(10, 150, 150, 100, -40);
            this.context.stroke();
            this.context.roundRect(10, 150, 150, 100, [10,40,70,100,130]);
            this.context.stroke();
            this.context.roundRect(10, 150, 150, 100, [-10,40]);
            this.context.stroke();
            this.context.roundRect(10, 150, 150, 100, []);
            this.context.stroke();
          } catch(e) {
            let error = e as BusinessError;
            if(typeof(e as BusinessError)) {
              let ret:int = error.code
              console.info('set result:' + ret);
              AppStorage.setOrCreate<int>('StaticRoundRectErrorCode', ret);
              console.info('get result:' + AppStorage.get<int>('StaticRoundRectErrorCode'));
            } else{
              console.info('error code is error');
            }
          }
        })
    }
    .width('100%')
    .height('100%')
  }
}

