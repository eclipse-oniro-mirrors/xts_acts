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
import { AbilityStage, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { commonEventManager } from '@kit.BasicServicesKit';

const DOMAIN = 0x0000;
const LOG_TAG = 'testTag';

export default class MyAbilityStage extends AbilityStage {
  onCreate(): void {
    hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'AbilityStage onCreate');
    commonEventManager.publish('demo2_stage_create', {}, () => {});
  }

  onAcceptWant(want: Want): string {
    hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'AbilityStage onAcceptWant: ' + JSON.stringify(want));
    let flag: string = want.parameters?.flag as string;
    commonEventManager.publish('demo2_acceptWant', {}, () => {});
    if (flag) {
      return flag;
    }
    return 'default';
  }

  onNewProcessRequest(want: Want): string {
    hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'AbilityStage onNewProcessRequest: ' + JSON.stringify(want));
    let flag: string = want.parameters?.processFlag as string;
    commonEventManager.publish('demo2_onNewProcessRequest', {}, () => {});
    if (flag) {
      return flag;
    }
    return 'default';
  }

  onDestroy(): void {
    hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'AbilityStage onDestroy');
  }
}