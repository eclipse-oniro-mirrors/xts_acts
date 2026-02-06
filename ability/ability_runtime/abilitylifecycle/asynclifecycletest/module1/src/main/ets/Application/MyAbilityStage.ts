/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { AbilityStage, appRecovery, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { commonEventManager } from '@kit.BasicServicesKit';

const DOMAIN = 0x0000;

export default class MyAbilityStage extends AbilityStage {
  private event6: string = 'com.acts.ability.asynclifecycletest.event6';
  private event7: string = 'com.acts.ability.asynclifecycletest.event7';

  onCreate() {
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'module1.AbilityStage onCreate');
    appRecovery.enableAppRecovery();
  }

  onAcceptWantAsync(want: Want): Promise<string> {
    hilog.info(DOMAIN, 'testTag', '%{public}s', `module1.MyAbilityStage onAcceptWantAsync. want: ${JSON.stringify(want)}`);
    let commonEventData: commonEventManager.CommonEventPublishData = {
      data: 'module1.onAcceptWantAsync'
    };
    commonEventManager.publish(this.event6, commonEventData, (err) => {
      hilog.info(DOMAIN, 'testTag', '%{public}s', `MyAbilityStage publish: ${commonEventData.data}`);
      hilog.info(DOMAIN, 'testTag', '%{public}s', `MyAbilityStage publish ${this.event6}. result: ${JSON.stringify(err)}`);
    });

    return new Promise<string>((resolve, reject) => {
      resolve('module1.MyAbilityStage.onAcceptWantAsync');
    });
  }
  
  onNewProcessRequestAsync(want: Want): Promise<string> {
    hilog.info(DOMAIN, 'testTag', '%{public}s',
      `module1.MyAbilityStage onNewProcessRequestAsync. want: ${JSON.stringify(want)}`);
    let commonEventData: commonEventManager.CommonEventPublishData = {
      data: 'module1.onNewProcessRequestAsync'
    };
    commonEventManager.publish(this.event7, commonEventData, (err) => {
      hilog.info(DOMAIN, 'testTag', '%{public}s', `MyAbilityStage publish: ${commonEventData.data}`);
      hilog.info(DOMAIN, 'testTag', '%{public}s', `MyAbilityStage publish ${this.event7}. result: ${JSON.stringify(err)}`);
    });

    return new Promise<string>((resolve, reject) => {
      resolve('module1.MyAbilityStage.onNewProcessRequestAsync');
    });
  }
}