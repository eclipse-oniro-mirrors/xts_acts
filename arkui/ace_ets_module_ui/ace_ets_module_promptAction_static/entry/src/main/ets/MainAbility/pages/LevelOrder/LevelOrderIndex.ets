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
import { LevelOrder } from '@ohos.promptAction';

@Entry
@Component
struct LevelOrderIndex {
  @State clampStatus: string = 'init';

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('LevelOrderIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column() {
      Button('clamp')
        .id('levelOrderClampBtn')
        .height('8%')
        .onClick(() => {
          try {
            let order = LevelOrder.clamp(100);
            this.clampStatus = order !== undefined ? 'clamp_ok' : 'clamp_fail';
          } catch (error) {
            this.clampStatus = 'clamp_fail';
          }
        });
      Text(this.clampStatus).key('levelOrderClampStatus').height('5%');
    }
    .width('100%')
    .height('100%');
  }
}
