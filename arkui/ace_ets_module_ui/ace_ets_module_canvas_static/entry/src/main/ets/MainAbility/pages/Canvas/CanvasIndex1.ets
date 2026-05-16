'use static';

/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { Entry, Component, Column, Canvas, CanvasRenderingContext2D, RenderingContextSettings, Text } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct CanvasIndex {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  @State antialiasGetResult: string = 'pending';
  @State antialiasSetTrue: string = 'pending';
  @State antialiasSetFalse: string = 'pending';
  @State antialiasSetUndefined: string = 'pending';

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) { console.info('[ARKUI_NEW] CanvasIndex error ' + error); }
  }

  onPageShow() {
    try {
      let defaultVal = this.context.antialias;
      this.antialiasGetResult = 'get:' + String(defaultVal);
      AppStorage.setOrCreate<string>('canvasAntialiasGet', this.antialiasGetResult);

      this.context.antialias = true;
      this.antialiasSetTrue = 'setTrue:' + String(this.context.antialias);
      AppStorage.setOrCreate<string>('canvasAntialiasSetTrue', this.antialiasSetTrue);

      this.context.antialias = false;
      this.antialiasSetFalse = 'setFalse:' + String(this.context.antialias);
      AppStorage.setOrCreate<string>('canvasAntialiasSetFalse', this.antialiasSetFalse);

      this.context.antialias = undefined;
      this.antialiasSetUndefined = 'setUndef:' + String(this.context.antialias);
      AppStorage.setOrCreate<string>('canvasAntialiasSetUndefined', this.antialiasSetUndefined);

      console.info('[ARKUI_NEW] CanvasIndex onPageShow antialias ops done');
    } catch (error) {
      console.error('[ARKUI_NEW] CanvasIndex onPageShow error: ' + error);
    }
  }

  build() {
    Column() {
      Canvas(this.context)
        .width('100%')
        .height('30%')
        .key('canvasComp')
        .id('canvasComp')
        .onReady(() => {
          let defaultVal = this.context.antialias;
          this.antialiasGetResult = 'get:' + String(defaultVal);

          this.context.antialias = true;
          this.antialiasSetTrue = 'setTrue:' + String(this.context.antialias);

          this.context.antialias = false;
          this.antialiasSetFalse = 'setFalse:' + String(this.context.antialias);

          this.context.antialias = undefined;
          this.antialiasSetUndefined = 'setUndef:' + String(this.context.antialias);

          AppStorage.setOrCreate<string>('canvasAntialiasGet', this.antialiasGetResult);
          AppStorage.setOrCreate<string>('canvasAntialiasSetTrue', this.antialiasSetTrue);
          AppStorage.setOrCreate<string>('canvasAntialiasSetFalse', this.antialiasSetFalse);
          AppStorage.setOrCreate<string>('canvasAntialiasSetUndefined', this.antialiasSetUndefined);
        })
      Text(this.antialiasGetResult).key('txtAntialiasGet').id('txtAntialiasGet').fontSize(14)
      Text(this.antialiasSetTrue).key('txtAntialiasSetTrue').id('txtAntialiasSetTrue').fontSize(14)
      Text(this.antialiasSetFalse).key('txtAntialiasSetFalse').id('txtAntialiasSetFalse').fontSize(14)
      Text(this.antialiasSetUndefined).key('txtAntialiasSetUndef').id('txtAntialiasSetUndef').fontSize(14)
    }.width('100%').height('100%')
  }
}
