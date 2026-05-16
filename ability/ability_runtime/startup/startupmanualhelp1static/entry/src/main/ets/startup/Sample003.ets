/*
* Copyright (c) 2026 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the 'License");
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

export default class Sample003 extends StartupTask {
  constructor() {
    super();
  }
  init(context: common.AbilityStageContext): Promise<Any> | Promise<void> {
    console.info('StartupTest Sample003 init');
    PersistentStorage.persistProp('Sample003_init', 'Sample003_init');
    return Promise.resolve('Sample003');
  }

  onDependencyCompleted(dependence: string, result: Object): void {
    console.info('StartupTest Sample003 onDependencyCompleted dependence=' + dependence);
    console.info('StartupTest Sample003 onDependencyCompleted result=' + JSON.stringify(result));
    PersistentStorage.persistProp('Sample003_onDependencyCompleted', dependence);
  }
}