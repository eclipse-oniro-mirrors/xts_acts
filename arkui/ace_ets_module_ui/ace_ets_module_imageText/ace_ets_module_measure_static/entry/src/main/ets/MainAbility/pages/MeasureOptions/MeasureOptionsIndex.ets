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

@Entry
@Component
struct MeasureOptionsIndex {
  @State textContentStatus: string = 'init';

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('MeasureOptionsIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column() {
      Button('textContent')
        .id('measureOptionsTextContentBtn')
        .height('8%')
        .onClick(() => {
          try {
            let measuredWidth = this.getUIContext().getMeasureUtils().measureText({
              textContent: 'measure_options_text'
            });
            this.textContentStatus = measuredWidth > 0 ? 'textContent_ok' : 'textContent_fail';
          } catch (error) {
            this.textContentStatus = 'textContent_fail';
          }
        });
      Text(this.textContentStatus).key('measureOptionsTextContentStatus').height('5%');
    }
    .width('100%')
    .height('100%');
  }
}
