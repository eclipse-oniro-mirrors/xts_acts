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
import { Entry, Component, Column, Button, Text, DrawModifier, DrawContext } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

class DemoDrawModifier extends DrawModifier {
  drawOverlay(drawContext: DrawContext): void {
    let context = drawContext;
    if (context === undefined) {
      return;
    }
  }
}

@Entry
@Component
struct DrawModifierIndex {
  @State drawOverlayStatus: string = 'init';

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('DrawModifierIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column() {
      Button('drawOverlay')
        .id('drawModifierOverlayBtn')
        .height('8%')
        .onClick(() => {
          try {
            let modifier = new DemoDrawModifier();
            modifier.drawOverlay({} as DrawContext);
            this.drawOverlayStatus = 'drawOverlay_ok';
          } catch (error) {
            this.drawOverlayStatus = 'drawOverlay_fail';
          }
        });
      Text(this.drawOverlayStatus).key('drawModifierOverlayStatus').height('5%');
    }
    .width('100%')
    .height('100%');
  }
}
