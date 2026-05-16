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
import { Router, CustomKeyboardContinueFeature } from '@ohos.arkui.UIContext';

@Entry
@Component
struct CustomKeyboardContinueFeatureIndex {
  @State setEnabledStatus: string = 'init';
  @State setDisabledStatus: string = 'init';
  @State enabledValue: string = '' + CustomKeyboardContinueFeature.ENABLED;
  @State disabledValue: string = '' + CustomKeyboardContinueFeature.DISABLED;

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('CustomKeyboardContinueFeatureIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column() {
      Text(this.enabledValue).key('customKeyboardEnabledValue').height('5%');
      Text(this.disabledValue).key('customKeyboardDisabledValue').height('5%');

      Button('setEnabled')
        .id('setCustomKeyboardEnabledBtn')
        .height('8%')
        .onClick(() => {
          try {
            this.getUIContext().setCustomKeyboardContinueFeature(CustomKeyboardContinueFeature.ENABLED);
            this.setEnabledStatus = 'set_enabled_ok';
          } catch (error) {
            this.setEnabledStatus = 'set_enabled_fail';
            console.error('set ENABLED error: ' + error);
          }
        });
      Text(this.setEnabledStatus).key('setEnabledStatus').height('5%');

      Button('setDisabled')
        .id('setCustomKeyboardDisabledBtn')
        .height('8%')
        .onClick(() => {
          try {
            this.getUIContext().setCustomKeyboardContinueFeature(CustomKeyboardContinueFeature.DISABLED);
            this.setDisabledStatus = 'set_disabled_ok';
          } catch (error) {
            this.setDisabledStatus = 'set_disabled_fail';
            console.error('set DISABLED error: ' + error);
          }
        });
      Text(this.setDisabledStatus).key('setDisabledStatus').height('5%');
    }
    .width('100%')
    .height('100%');
  }
}
