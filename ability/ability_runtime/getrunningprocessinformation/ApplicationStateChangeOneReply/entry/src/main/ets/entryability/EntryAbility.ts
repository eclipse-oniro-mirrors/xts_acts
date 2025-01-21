/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import Ability from '@ohos.app.ability.UIAbility';
import type Window from '@ohos.window';
import commonEvent from '@ohos.commonEvent';

let commonStateArr: number[] = [-1, -1, -1, -1];
let commonEventData = {
  parameters: {
    commonStateArr: commonStateArr
  }
};

let tag = 'StateChangeTesttag';
let delayTime500 = 500;
let delayTime1000 = 1000;
let delayTime2000 = 2000;
let undefineTag = -1;
let defineTag = 1;
let arrLength = 4;
let onForeGroundTAG = undefineTag;
let zero = 0;
let one = 1;
let two = 2;
let three = 3;
let applicationStateChangeCallbackFir = {
  onApplicationForeground() {
    console.log(tag, 'applicationStateChangeCallbackFir onApplicationForeground');
    commonEventData.parameters.commonStateArr[zero] = defineTag;

    setTimeout(() => {
      console.info('Enter onApplicationForeground publish!');
      commonEvent.publish('processState', commonEventData, (err) => {
        console.info('====>processState publish err: ' + JSON.stringify(err));
      });
    }, delayTime1000);
  },
  onApplicationBackground() {
    console.log(tag, 'applicationStateChangeCallbackFir onApplicationBackground');
    commonEventData.parameters.commonStateArr[one] = defineTag;
    console.log(tag, 'commonEventData.parameters.commonStateArr[1] = 1');

    if (globalThis.want.action === 'NeedBackGroundOff' || globalThis.want.action === 'MultiAppRegister') {
      console.info('entered needbackgroundoff!');
      globalThis.applicationContext.off('applicationStateChange', applicationStateChangeCallbackFir);
    }
  }
};

let applicationStateChangeCallbackSec = {
  onApplicationForeground() {
    console.log(tag, 'applicationStateChangeCallbackSec onApplicationForeground');
    commonEventData.parameters.commonStateArr[two] = defineTag;
  },
  onApplicationBackground() {
    console.log(tag, 'applicationStateChangeCallbackSec onApplicationBackground');
    commonEventData.parameters.commonStateArr[three] = defineTag;
    if (globalThis.want.action === 'doubleNeedBackGroundOff') {
      setTimeout(() => {
        globalThis.applicationContext.off('applicationStateChange', applicationStateChangeCallbackSec);
      }, delayTime500);
    }
    else if (globalThis.want.action === 'DoubleRegisterOff') {
      setTimeout(() => {
        console.info('entered DoubleRegisterOff');
        globalThis.applicationContext.off('applicationStateChange');
      }, delayTime500);
    }
  }
};

export default class EntryAbility extends Ability {
  onCreate(want, launchParam) {
    onForeGroundTAG = undefineTag;
    for (let i = 0; i < arrLength; i++) {
      commonStateArr[i] = undefineTag;
    }
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
    hilog.info(0x0000, 'testTag', '%{public}s', 'launchParam:' + JSON.stringify(launchParam) ?? '');
    globalThis.abilityContext = this.context;
    globalThis.want = want;
    globalThis.applicationContext = this.context.getApplicationContext();
    if (globalThis.want.action === 'RegisterOnOffOn') {
      globalThis.applicationContext.on('applicationStateChange', applicationStateChangeCallbackFir);
      globalThis.applicationContext.off('applicationStateChange', applicationStateChangeCallbackFir);
    }
    globalThis.applicationContext.on('applicationStateChange', applicationStateChangeCallbackFir);
    if (globalThis.want.action === 'doubleRegister' || globalThis.want.action === 'doubleNeedBackGroundOff' ||
        globalThis.want.action === 'DoubleRegisterOff') {
      console.info('double in action is logic entered!');
      globalThis.applicationContext.on('applicationStateChange', applicationStateChangeCallbackSec);
    }

  }

  onDestroy() {
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: Window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.ERROR);
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Abilityone onForeground');
    onForeGroundTAG += defineTag;
    if (onForeGroundTAG === defineTag && (globalThis.want.action === 'NeedBackGroundOff' || globalThis.want.action === 'MultiAppRegister' ||
        globalThis.want.action === 'DoubleRegisterOff')) {
      setTimeout(() => {
        commonEvent.publish('processState', commonEventData, (err) => {
          console.info('====>processState publish err: ' + JSON.stringify(err));
        });
      }, delayTime2000);

    }
  }

  onBackground() {
    // Ability has back to background
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Abilityone onBackground');
  }
}
