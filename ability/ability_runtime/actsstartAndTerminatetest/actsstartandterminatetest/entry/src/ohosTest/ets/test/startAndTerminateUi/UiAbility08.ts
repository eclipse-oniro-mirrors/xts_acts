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
import { commonEventManager } from '@kit.BasicServicesKit';

let timeId:number = 0
let testNum:number = 0;

export default class UiAbility08 extends UIAbility {
  onCreate(want, launchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility08 onCreate');
    commonEventManager.publish('UiAbility08_onCreate', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility08 publish UiAbility08_onCreate');
    });
    globalThis.uiAbilityContext8 = this.context;
    hilog.info(0x0000, 'testTag', '%{public}s', `UiAbility08 want is, ${JSON.stringify(want)}`);
  }
  onNewWant(want, launchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility08 onNewWant');
    commonEventManager.publish('UiAbility08_onNewWant', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility08 publish UiAbility08_onNewWant');
    });
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility08 onDestroy');
    commonEventManager.publish('ACTS_TEST_DESTROY', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility08 publish ACTS_TEST_DESTROY');
    });
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility08 onWindowStageCreate');
    commonEventManager.publish('UiAbility08_onWindowStageCreate', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility08 publish UiAbility08_onWindowStageCreate');
    });
    windowStage.loadContent('testability/pages/UiAbility/UiAbility01', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });

  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility08 onWindowStageDestroy');
  }

  onForeground(): void {
    testNum++
    if (testNum !== 1) {
      hilog.info(0x0000, 'testTag', '%{public}s', `UiAbility08 setTimeout before`);
      setTimeout(() => {
        hilog.info(0x0000, 'testTag', '%{public}s', `UiAbility08 setTimeout start terminate`);
        globalThis.uiAbilityContext8.terminateSelf();
      }, 2000);
    } else {
      commonEventManager.publish('UiAbility08_onForeground_01', function () {
        hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility08 publish UiAbility08_onForeground_01');
      });
      try {
        globalThis.uiAbilityContext8.startAbility(
          {
            bundleName: 'com.acts.actsstartandterminateassisttest01',
            abilityName: 'AbilityTest01'
          }).then(() => {
          hilog.info(0x0000, 'testTag', '%{public}s', `UiAbility08 start other hap AbilityTest01 end`);
        })
        timeId = setTimeout(()=>{
          try{
            globalThis.uiAbilityContext8.moveAbilityToBackground().then(()=>{
              hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility08 moveAbilityToBackground success');
            }).catch((err)=>{
              hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility08 moveAbilityToBackground fail ' + err?.code);
              if(err?.code == 16000061){
                commonEventManager.publish('UiAbility08_onBackground', function () {
                  hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility08 publish UiAbility08_onBackground');
                });
                setTimeout(() => {
                  hilog.info(0x0000, 'testTag', '%{public}s', `UiAbility08 setTimeout start terminate after UiAbility08_onBackground`);
                  globalThis.uiAbilityContext8.terminateSelf();
                }, 3000);
              }
            });
          }catch(e){
            hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility08 moveAbilityToBackground catch fail ' + e?.code + ' ' + e.message);
          }
        }, 2000)
      } catch (err) {
        hilog.info(0x0000, 'testTag', '%{public}s', `UiAbility08 start other hap AbilityTest01 fail : ${err}`);
      }
    }
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility08 onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility08 onBackground');
    clearTimeout(timeId);
    commonEventManager.publish('UiAbility08_onBackground', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility08 publish UiAbility08_onBackground');
    });
  }
}
