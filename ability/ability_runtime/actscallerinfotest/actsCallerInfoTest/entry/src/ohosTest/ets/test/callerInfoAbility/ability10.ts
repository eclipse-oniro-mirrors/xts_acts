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

import UIAbility, { Caller } from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { Want } from '@kit.AbilityKit';

export default class CallerInfo10 extends UIAbility {
  onCreate(want, launchParam):void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'CallerInfo10 onCreate');
    globalThis.CallerInfo10 = this.context;
    hilog.info(0x0000, 'testTag', '%{public}s', `CallerInfo10 JSON.stringify(want) is: ${JSON.stringify(want)}`);
    let options = {
      parameters: {
        result: want.parameters
      }
    };
    commonEventManager.publish('ACTS_TEST_ON_CREATE_WANT', options, function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'commonEventManager CallerInfo10 publish ACTS_TEST_ON_CREATE_WANT');
    });
  }

  onDestroy():void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'CallerInfo10 onDestroy');
    commonEventManager.publish('ACTS_TEST_DESTROY', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'commonEventManager CallerInfo10 publish ACTS_TEST_DESTROY');
    });
  }

  onWindowStageCreate(windowStage: window.WindowStage):void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'CallerInfo10 onWindowStageCreate');

    windowStage.loadContent('testability/pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy():void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'CallerInfo10 onWindowStageDestroy');
  }

  onForeground():void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'CallerInfo10 onForeground');
    let caller: Caller;
    // 前台启动Ability，将parameters中的'ohos.aafwk.param.callAbilityToForeground'配置为true
    let wantForeground: Want = {
      bundleName: 'com.example.myapplication',
      moduleName: 'entry_test',
      abilityName: 'callerInfo10',
      deviceId: '',
      parameters: {
        'ohos.aafwk.param.callAbilityToForeground': true
      }
    };

    try {
      this.context.startAbilityByCall(wantForeground)
        .then((obj: Caller) => {
          // 执行正常业务
          caller = obj;
          console.info('startAbilityByCall succeed');
        }).catch((err: BusinessError) => {
        // 处理业务逻辑错误
        console.error(`startAbilityByCall failed, code is ${err.code}, message is ${err.message}`);
      });
    } catch (err) {
      // 处理入参错误异常
      let code = (err as BusinessError).code;
      let message = (err as BusinessError).message;
      console.error(`startAbilityByCall failed, code is ${code}, message is ${message}`);
    }
    setTimeout( () => {
      globalThis.CallerInfo10.terminateSelf();
    }, 2000);
  }

  onBackground():void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'CallerInfo10 onBackground');
  }
}
