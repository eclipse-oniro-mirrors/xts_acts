/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';

export default class CallerInfo09 extends UIAbility {
  onCreate(want, launchParam):void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'CallerInfo09 onCreate');
    globalThis.CallerInfo09 = this.context;
    hilog.info(0x0000, 'testTag', '%{public}s', `CallerInfo09 JSON.stringify(want) is: ${JSON.stringify(want)}`);
    let options = {
      parameters: {
        result: want.parameters
      }
    };
    commonEventManager.publish('ACTS_TEST_ON_CREATE_WANT', options, function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'commonEventManager CallerInfo09 publish ACTS_TEST_ON_CREATE_WANT');
    });
  }

  onDestroy():void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'CallerInfo09 onDestroy');
    commonEventManager.publish('ACTS_TEST_DESTROY', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'commonEventManager CallerInfo09 publish ACTS_TEST_DESTROY');
    });
  }

  onWindowStageCreate(windowStage: window.WindowStage):void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'CallerInfo09 onWindowStageCreate');

    windowStage.loadContent('testability/pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy():void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'CallerInfo09 onWindowStageDestroy');
  }

  onForeground():void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'CallerInfo09 onForeground');

    setTimeout( () => {
      globalThis.CallerInfo09.terminateSelf();
    }, 2000);
  }

  onBackground():void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'CallerInfo09 onBackground');
  }
}
