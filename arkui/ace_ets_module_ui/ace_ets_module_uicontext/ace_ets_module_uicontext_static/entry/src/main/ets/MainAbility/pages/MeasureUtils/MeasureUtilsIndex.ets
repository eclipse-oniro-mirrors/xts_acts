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

import { Entry, Component, Column, Button, Text } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { MeasureOptions } from '@ohos.measure';

@Entry
@Component
struct MeasureUtilsIndex {
  @State measureTextStatus: string = 'init';

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('MeasureUtilsIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column() {
      Button('measureText')
        .id('measureTextBtn')
        .height('8%')
        .onClick(() => {
          try {
            let options: MeasureOptions = { textContent: 'MeasureUtilsText', fontSize: 20 };
            let width = this.getUIContext().getMeasureUtils().measureText(options);
            this.measureTextStatus = width > 0 ? 'measureText_ok' : 'measureText_fail';
          } catch (error) {
            this.measureTextStatus = 'measureText_fail';
            console.error('measureText error: ' + error);
          }
        });

      Text(this.measureTextStatus).key('measureTextStatus').height('5%');
    }
    .width('100%')
    .height('100%');
  }
}
