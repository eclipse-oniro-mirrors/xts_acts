/*
* Copyright (c) 2026 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
'use static';

import StartupTask from '@ohos.app.appstartup.StartupTask';
import commonEventManager from '@ohos.commonEventManager';
import common from '@ohos.app.ability.common';
import { AppStorage, PersistentStorage, StorageLink } from '@ohos.arkui.stateManagement';

export default class Sample004 extends StartupTask {
  constructor() {
    super();
  }
  init(context: common.AbilityStageContext): Promise<Any> | Promise<void> {
    console.info('StartupTest Sample004 init');
    PersistentStorage.persistProp('Sample004_init', 'Sample004_init');
    return Promise.resolve('Sample004');
  }

  onDependencyCompleted(dependence: string, result: Object): void {
    console.info('StartupTest Sample004 onDependencyCompleted dependence=' + dependence);
    console.info('StartupTest Sample004 onDependencyCompleted result=' + JSON.stringify(result));
    let completedValue4:string = AppStorage.get<string>('Sample004_onDependencyCompleted') as string;
    if (completedValue4 == undefined) {
      PersistentStorage.persistProp('Sample004_onDependencyCompleted', dependence);
      console.info('Sample004_onDependencyCompleted completedValue4=' + completedValue4);
    } else {
      PersistentStorage.persistProp('Sample004_onDependencyCompleted2', dependence);
      console.info('Sample004_onDependencyCompleted2 completedValue4=' + completedValue4);
    }
    
  }
}