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
import { Router, UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct ResolvedUIContextIndex {
  @State strategyStatus: string = 'init';

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('ResolvedUIContextIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column() {
      Button('resolvedStrategy')
        .id('resolvedStrategyBtn')
        .height('8%')
        .onClick(() => {
          try {
            let resolved = UIContext.resolveUIContext();
            this.strategyStatus = '' + resolved.strategy;
          } catch (error) {
            this.strategyStatus = 'resolvedStrategy_fail';
            console.error('resolvedStrategy error: ' + error);
          }
        });

      Text(this.strategyStatus).key('resolvedStrategyStatus').height('5%');
    }
    .width('100%')
    .height('100%');
  }
}
