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
import { AbilityConstant, Want } from '@kit.AbilityKit';

let backSet:number = 0

export default class CallerInfo01 extends UIAbility {
  onCreate(want, launchParam):void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'CallerInfo01 onCreate');
    globalThis.CallerInfo01 = this.context;
    hilog.info(0x0000, 'testTag', '%{public}s', `CallerInfo01 JSON.stringify(want) is: ${JSON.stringify(want)}`);
    hilog.info(0x0000, 'testTag', '%{public}s', `CallerInfo01 JSON.stringify(want.parameters) is: ${JSON.stringify(want.parameters)}`);
    let optionsWant = {
      parameters: {
        result: want.parameters
      }
    };
    commonEventManager.publish('ACTS_TEST_ON_CREATE_WANT', optionsWant, function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'commonEventManager CallerInfo01 publish ACTS_TEST_ON_CREATE_WANT');
    });
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam):void {
    hilog.info(0x0000, 'testTag', `%{public}s', onNewWant, want.parameters: ${JSON.stringify(want.parameters)}`);
    hilog.info(0x0000, 'testTag', `%{public}s', onNewWant, launchParam: ${JSON.stringify(launchParam)}`);
    let options = {
      parameters: {
        result: want.parameters
      }
    };
    commonEventManager.publish('ACTS_TEST_ON_NEW_WANT', options, function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'commonEventManager CallerInfo01 publish ACTS_TEST_ON_NEW_WANT');
    });
    setTimeout(()=>{
      try{
        commonEventManager.publish('ACTS_TEST_DESTROY', function () {
          globalThis.CallerInfo01.terminateSelf();
          hilog.info(0x0000, 'testTag', '%{public}s', 'commonEventManager CallerInfo01 publish ACTS_TEST_DESTROY');
        });
      }catch(err){
        hilog.info(0x0000, 'testTag', '%{public}s', ' CallerInfo01 moveAbilityToBackground fail ' + err.code);
      }
    }, 1000)
  }

  onDestroy():void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'CallerInfo01 onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage):void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'CallerInfo01 onWindowStageCreate');

    windowStage.loadContent('testability/pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy():void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'CallerInfo01 onWindowStageDestroy');
  }

  onForeground():void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'CallerInfo01 onForeground backSet:' + backSet);
    setTimeout(()=>{
      hilog.info(0x0000, 'testTag', '%{public}s', 'CallerInfo01 onForeground backSet:' + backSet);
      if(backSet==0){
        backSet = backSet + 1;
        hilog.info(0x0000, 'testTag', '%{public}s', `UiAbility02 backSet.. is: ${backSet}`);
        try {
          globalThis.CallerInfo01.startAbility(
            {
              bundleName: 'com.acts.actsCallerInfoAssist01Test',
              abilityName: 'AssistAbility01'
            }).then(() => {
            hilog.info(0x0000, 'testTag', '%{public}s', `CallerInfo01 startAbility end`);
          })
        } catch (err) {
          // 处理入参错误异常
          let code = (err as BusinessError).code;
          let message = (err as BusinessError).message;
          hilog.info(0x0000, 'testTag', '%{public}s', `startAbility failed, error.code: ${code}, error.message: ${message}`);
        }
      }
    }, 500)
    
  }

  onBackground():void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'CallerInfo01 onBackground');
  }
}
