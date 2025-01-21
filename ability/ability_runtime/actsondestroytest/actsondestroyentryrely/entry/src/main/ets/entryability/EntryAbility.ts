/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import commonEvent from '@ohos.commonEventManager';

const TERMIN_TIMEOUT = 1000;
const START_TIMEOUT = 500;
let param;

function OnDestroy_0200(context): void {
  setTimeout(() => {
    context.terminateSelf().then(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', `EntryAbility terminateSelf success OnDestroy_0200`);
    }).catch((err) => {
      hilog.info(0x0000, 'testTag', '%{public}s', `EntryAbility terminateSelf failed, err is: ${JSON.stringify(err)}`);
    })
  }, TERMIN_TIMEOUT)
  setTimeout(() => {
    context.startAbility({
      bundleName: 'com.example.abilitystageondestroytest',
      moduleName: 'second',
      abilityName: 'SecondAbility',
      parameters: {
        parameter: param
      }
    }).then(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', `EntryAbility startAbility success OnDestroy_0200`);
    }).catch((err) => {
      hilog.info(0x0000, 'testTag', '%{public}s', `OnDestroy_0200 EntryAbility startAbility failed, err is: ${JSON.stringify(err)}`);
    })
  }, START_TIMEOUT)
}

function OnDestroy_0300(context): void {
  setTimeout(() => {
    context.startAbility({
      bundleName: 'com.example.abilitystageondestroytest',
      moduleName: 'entry',
      abilityName: 'OtherAbility',
      parameters: {
        parameter: param
      }
    }).then(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', `OnDestroy_0300 EntryAbility startAbility success`);
    }).catch((err) => {
      console.error(param, `OnDestroy_0300 EntryAbility startAbility failed, err is: ${JSON.stringify(err)}`);
    })
  }, START_TIMEOUT)
  setTimeout(() => {
    context.terminateSelf().then(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', `OnDestroy_0300 EntryAbility terminateSelf success`);
      commonEvent.publish('Acts_EntryAbilityTerminate', (err) => {
        hilog.info(0x0000, 'testTag', '%{public}s', `OnDestroy_0300 EntryAbility terminateSelf publish err`);
      })
    }).catch((err) => {
      hilog.info(0x0000, 'testTag', '%{public}s', `OnDestroy_0300 EntryAbility terminateSelf failed, err is : ${JSON.stringify(err)}`);
    })
  }, TERMIN_TIMEOUT)
}

function OnDestroy_0400(context): void {
  setTimeout(() => {
    context.startAbility({
      bundleName: 'com.example.abilitystageondestroytest',
      moduleName: 'entry',
      abilityName: 'OtherAbility',
      parameters: {
        parameter: param
      }
    }).then(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', `OnDestroy_0500 EntryAbility startAbility success`);
    }).catch((err) => {
      console.error(param, `OnDestroy_0500 EntryAbility startAbility failed, err is: ${JSON.stringify(err)}`);
    })
  }, START_TIMEOUT)
  setTimeout(() => {
    context.terminateSelf().then(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', `OnDestroy_0500 EntryAbility terminateSelf success`);
    }).catch((err) => {
      hilog.info(0x0000, 'testTag', '%{public}s', `OnDestroy_0500 EntryAbility terminateSelf failed, err is : ${JSON.stringify(err)}`);
    })
  }, TERMIN_TIMEOUT)
}

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', `Ability onCreate want: ${JSON.stringify(Want)}`);
    param = want.parameters.param;
    1111
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Entry Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
    if (param === 'AbilityStage_OnDestroy_0300') {
      OnDestroy_0300(this.context);
    }
    if (param === 'AbilityStage_OnDestroy_0500') {
      setTimeout(() => {
        this.context.startAbility({
          bundleName: 'com.example.abilitystageondestroytest',
          moduleName: 'second',
          abilityName: 'SecondAbility',
          parameters: {
            parameter: 'AbilityStage_OnDestroy_0500_EntryAbility'
          }
        }).then(() => {
          hilog.info(0x0000, 'testTag', '%{public}s', 'AbilityStage_OnDestroy_0500 Ability onDestroy');
        }).catch((err) => {
          hilog.info(0x0000, 'testTag', '%{public}s', 'AbilityStage_OnDestroy_0500 EntryAbility startAbility failed, err is: ${JSON.stringify(err)}');
        })
      }, START_TIMEOUT)
    }
    if (param === 'AbilityStage_OnDestroy_0400') {
      OnDestroy_0400(this.context);
    }
  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
    if (param === 'AbilityStage_OnDestroy_0100') {
      setTimeout(() => {
        this.context.terminateSelf().then(() => {
          hilog.info(0x0000, 'testTag', '%{public}s', 'AbilityStage_OnDestroy_0100 EntryAbility terminateSelf success');
        }).catch((err) => {
          hilog.info(0x0000, 'testTag', '%{public}s', 'AbilityStage_OnDestroy_0100 EntryAbility terminateSelf failed, err is: ${JSON.stringify(err)}');
        })
      }, TERMIN_TIMEOUT)
    }
    if (param === 'AbilityStage_OnDestroy_0200') {
      OnDestroy_0200(this.context);
    }
  }

  onBackground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
