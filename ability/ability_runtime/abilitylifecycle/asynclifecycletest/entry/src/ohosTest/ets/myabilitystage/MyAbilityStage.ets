/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
  private event1: string = 'com.acts.ability.asynclifecycletest.event1';
  private event2: string = 'com.acts.ability.asynclifecycletest.event2';

  onCreate(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'entry_test.MyAbilityStage onCreate');
    appRecovery.enableAppRecovery();
  }

  onAcceptWant(want: Want): string {
    hilog.info(DOMAIN, 'testTag', '%{public}s', `entry_test.MyAbilityStage onAcceptWant. want: ${JSON.stringify(want)}`);
    let commonEventData: commonEventManager.CommonEventPublishData = {
      data: 'onAcceptWant'
    };
    commonEventManager.publish(this.event1, commonEventData, (err) => {
      hilog.info(DOMAIN, 'testTag', '%{public}s', `MyAbilityStage publish: ${commonEventData.data}`);
      hilog.info(DOMAIN, 'testTag', '%{public}s', `MyAbilityStage publish ${this.event1}. result: ${JSON.stringify(err)}`);
    });

    return 'entry_test.MyAbilityStage.onAcceptWant';
  }

  onNewProcessRequest(want: Want): string {
    hilog.info(DOMAIN, 'testTag', '%{public}s', `entry_test.MyAbilityStage onNewProcessRequest. want: ${JSON.stringify(want)}`);
    let commonEventData: commonEventManager.CommonEventPublishData = {
      data: 'onNewProcessRequest'
    };
    commonEventManager.publish(this.event2, commonEventData, (err) => {
      hilog.info(DOMAIN, 'testTag', '%{public}s', `MyAbilityStage publish: ${commonEventData.data}`);
      hilog.info(DOMAIN, 'testTag', '%{public}s', `MyAbilityStage publish ${this.event2}. result: ${JSON.stringify(err)}`);
    });
    
    return 'entry_test.MyAbilityStage.MyUIAbilityProcess';
  }

  onAcceptWantAsync(want: Want): Promise<string> {
    hilog.info(DOMAIN, 'testTag', '%{public}s', `entry_test.MyAbilityStage onAcceptWantAsync. want: ${JSON.stringify(want)}`);
    let commonEventData: commonEventManager.CommonEventPublishData = {
      data: 'onAcceptWantAsync'
    };
    commonEventManager.publish(this.event1, commonEventData, (err) => {
      hilog.info(DOMAIN, 'testTag', '%{public}s', `MyAbilityStage publish: ${commonEventData.data}`);
      hilog.info(DOMAIN, 'testTag', '%{public}s', `MyAbilityStage publish ${this.event1}. result: ${JSON.stringify(err)}`);
    });

    return new Promise<string>((resolve, reject) => {
      resolve('entry_test.MyAbilityStage.onAcceptWantAsync');
    });
  }
  
  onNewProcessRequestAsync(want: Want): Promise<string> {
    hilog.info(DOMAIN, 'testTag', '%{public}s',
      `entry_test.MyAbilityStage onNewProcessRequestAsync. want: ${JSON.stringify(want)}`);
    let commonEventData: commonEventManager.CommonEventPublishData = {
      data: 'onNewProcessRequestAsync'
    };
    commonEventManager.publish(this.event2, commonEventData, (err) => {
      hilog.info(DOMAIN, 'testTag', '%{public}s', `MyAbilityStage publish: ${commonEventData.data}`);
      hilog.info(DOMAIN, 'testTag', '%{public}s', `MyAbilityStage publish ${this.event2}. result: ${JSON.stringify(err)}`);
    });

    return new Promise<string>((resolve, reject) => {
      resolve('entry_test.MyAbilityStage.onNewProcessRequestAsync');
    });
  }
}