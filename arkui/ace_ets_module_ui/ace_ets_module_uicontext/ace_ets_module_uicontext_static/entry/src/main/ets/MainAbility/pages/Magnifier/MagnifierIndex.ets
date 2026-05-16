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
import { Router, Magnifier } from '@ohos.arkui.UIContext';

const TARGET_ID: string = 'magnifierTarget';

@Entry
@Component
struct MagnifierIndex {
  @State bindStatus: string = 'init';
  @State showStatus: string = 'init';
  @State unbindStatus: string = 'init';

  private magnifier: Magnifier = this.getUIContext().getMagnifier();

  aboutToAppear() {
    try {
      let router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('MagnifierIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column() {
      Text('magnifier_target_text_for_bind_show')
        .id(TARGET_ID)
        .key('magnifierTargetText')
        .fontSize(20)
        .height('5%')
        .margin({ bottom: '1%' });

      Button('bind')
        .id('bindMagnifier')
        .height('8%')
        .onClick(() => {
          try {
            this.magnifier.bind(TARGET_ID);
            this.bindStatus = 'bind_ok';
          } catch (error) {
            this.bindStatus = 'bind_fail';
            console.error('magnifier bind error: ' + JSON.stringify(error));
          }
        });

      Text(this.bindStatus).key('bindStatus').height('5%');

      Button('show')
        .id('showMagnifier')
        .height('8%')
        .onClick(() => {
          try {
            this.magnifier.show(20, 20);
            this.showStatus = 'show_ok';
          } catch (error) {
            this.showStatus = 'show_fail';
            console.error('magnifier show error: ' + JSON.stringify(error));
          }
        });

      Text(this.showStatus).key('showStatus').height('5%');

      Button('unbind')
        .id('unbindMagnifier')
        .height('8%')
        .onClick(() => {
          try {
            this.magnifier.unbind();
            this.unbindStatus = 'unbind_ok';
          } catch (error) {
            console.error('magnifier unbind error: ' + error);
            this.unbindStatus = 'unbind_fail';
          }
        });

      Text(this.unbindStatus).key('unbindStatus').height('5%');
    }
    .width('100%')
    .height('100%');
  }
}
