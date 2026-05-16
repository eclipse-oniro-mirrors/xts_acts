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

import { Entry, Component, Column, Text } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router, ResolveStrategy } from '@ohos.arkui.UIContext';

@Entry
@Component
struct ResolveStrategyIndex {
  @State callingScope: string = '' + ResolveStrategy.CALLING_SCOPE;
  @State lastFocus: string = '' + ResolveStrategy.LAST_FOCUS;
  @State maxInstanceId: string = '' + ResolveStrategy.MAX_INSTANCE_ID;
  @State unique: string = '' + ResolveStrategy.UNIQUE;
  @State lastForeground: string = '' + ResolveStrategy.LAST_FOREGROUND;
  @State undefinedValue: string = '' + ResolveStrategy.UNDEFINED;

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('ResolveStrategyIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column() {
      Text(this.callingScope).key('resolveStrategyCallingScope').height('5%');
      Text(this.lastFocus).key('resolveStrategyLastFocus').height('5%');
      Text(this.maxInstanceId).key('resolveStrategyMaxInstanceId').height('5%');
      Text(this.unique).key('resolveStrategyUnique').height('5%');
      Text(this.lastForeground).key('resolveStrategyLastForeground').height('5%');
      Text(this.undefinedValue).key('resolveStrategyUndefined').height('5%');
    }
    .width('100%')
    .height('100%');
  }
}
