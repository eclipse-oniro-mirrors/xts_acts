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
  private event8: string = 'com.acts.ability.asynclifecycletest.event8';
  private event9: string = 'com.acts.ability.asynclifecycletest.event9';

  onCreate() {
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'module2.AbilityStage onCreate');
    appRecovery.enableAppRecovery();
  }

  onAcceptWant(want: Want): string {
    hilog.info(DOMAIN, 'testTag', '%{public}s', `module2.MyAbilityStage onAcceptWant. want: ${JSON.stringify(want)}`);
    let commonEventData: commonEventManager.CommonEventPublishData = {
      data: 'module2.onAcceptWant'
    };
    commonEventManager.publish(this.event8, commonEventData, (err) => {
      hilog.info(DOMAIN, 'testTag', '%{public}s', `MyAbilityStage publish: ${commonEventData.data}`);
      hilog.info(DOMAIN, 'testTag', '%{public}s', `MyAbilityStage publish ${this.event8}. result: ${JSON.stringify(err)}`);
    });

    return 'MyAbilityStage.onAcceptWant';
  }

  onNewProcessRequest(want: Want): string {
    hilog.info(DOMAIN, 'testTag', '%{public}s', `module2.MyAbilityStage onNewProcessRequest. want: ${JSON.stringify(want)}`);
    let commonEventData: commonEventManager.CommonEventPublishData = {
      data: 'module2.onNewProcessRequest'
    };
    commonEventManager.publish(this.event9, commonEventData, (err) => {
      hilog.info(DOMAIN, 'testTag', '%{public}s', `MyAbilityStage publish: ${commonEventData.data}`);
      hilog.info(DOMAIN, 'testTag', '%{public}s', `MyAbilityStage publish ${this.event9}. result: ${JSON.stringify(err)}`);
    });
    
    return 'module2.MyAbilityStage.MyUIAbilityProcess';
  }

  onAcceptWantAsync(want: Want): Promise<string> {
    hilog.info(DOMAIN, 'testTag', '%{public}s', `module2.MyAbilityStage onAcceptWantAsync. want: ${JSON.stringify(want)}`);
    let commonEventData: commonEventManager.CommonEventPublishData = {
      data: 'module2.onAcceptWantAsync'
    };
    commonEventManager.publish(this.event8, commonEventData, (err) => {
      hilog.info(DOMAIN, 'testTag', '%{public}s', `MyAbilityStage publish: ${commonEventData.data}`);
      hilog.info(DOMAIN, 'testTag', '%{public}s', `MyAbilityStage publish ${this.event8}. result: ${JSON.stringify(err)}`);
    });

    return new Promise<string>((resolve, reject) => {
      resolve('module2.MyAbilityStage.onAcceptWantAsync');
    });
  }
  
  onNewProcessRequestAsync(want: Want): Promise<string> {
    hilog.info(DOMAIN, 'testTag', '%{public}s',
      `module2.MyAbilityStage onNewProcessRequestAsync. want: ${JSON.stringify(want)}`);
    let commonEventData: commonEventManager.CommonEventPublishData = {
      data: 'module2.onNewProcessRequestAsync'
    };
    commonEventManager.publish(this.event9, commonEventData, (err) => {
      hilog.info(DOMAIN, 'testTag', '%{public}s', `MyAbilityStage publish: ${commonEventData.data}`);
      hilog.info(DOMAIN, 'testTag', '%{public}s', `MyAbilityStage publish ${this.event9}. result: ${JSON.stringify(err)}`);
    });

    return new Promise<string>((resolve, reject) => {
      resolve('module2.MyAbilityStage.onNewProcessRequestAsync');
    });
  }
}