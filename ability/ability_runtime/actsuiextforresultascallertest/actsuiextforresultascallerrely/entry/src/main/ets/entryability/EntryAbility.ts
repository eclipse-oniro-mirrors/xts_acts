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
import commonEvent from '@ohos.commonEventManager';

let setWantParameters = (actionInput: String, bundelNameInput: String) => {
  AppStorage.SetOrCreate('want', {
    bundleName: bundelNameInput,
    abilityName: 'UIExtAbility',
    parameters: {
      'ability.want.params.uiExtensionType': 'share',
      parameter : actionInput
    }
  });
}
let setWant = (want) => {
  if (want.parameters.parameter === 'StartAbilityForResultAsCaller_0100') {
    console.info("====>[UIExtensionForResultAsCallerRely] want.parameters.parameter == 'StartAbilityForResultAsCaller_0100':");
    setWantParameters('StartAbilityForResultAsCaller_0100', 'com.example.uiextensionforresultascaller');
  } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_0200') {
    console.info("====>[UIExtensionForResultAsCallerRely] want.parameters.parameter == 'StartAbilityForResultAsCaller_0200':");
    setWantParameters('StartAbilityForResultAsCaller_0200', 'com.example.uiextensionforresultascaller');
  } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_0300') {
    console.info("====>[UIExtensionForResultAsCallerRely] want.parameters.parameter == 'StartAbilityForResultAsCaller_0300':");
    setWantParameters('StartAbilityForResultAsCaller_0300', 'com.example.uiextensionforresultascaller');
  } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_0400') {
    console.info("====>[UIExtensionForResultAsCallerRely] want.parameters.parameter == 'StartAbilityForResultAsCaller_0400':");
    setWantParameters('StartAbilityForResultAsCaller_0400', 'com.example.uiextensionforresultascaller');
  } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_0600') {
    console.info("====>[UIExtensionForResultAsCallerRely] want.parameters.parameter == 'StartAbilityForResultAsCaller_0600':");
    setWantParameters('StartAbilityForResultAsCaller_0600', 'com.example.uiextensionforresultascaller');
  } else if (want.action === 'ohos.caller.test.action') {
    console.info("====>[UIExtensionForResultAsCallerRely] want.type == '0600FromUIExtension':");
    let commonEventData = {
      parameters: {
        result: 0
      }
    }
    commonEvent.publish('0600', commonEventData, (err) => {
      console.debug('====>[UIExtensionForResultAsCallerUIAbility] 0600 publish err:' + JSON.stringify(err));
      globalThis.terminate('0600');
    })

  } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_0800') {
    console.info("====>[UIExtensionForResultAsCallerRely] want.parameters.parameter == 'StartAbilityForResultAsCaller_0800':");
    setWantParameters('StartAbilityForResultAsCaller_0800', 'com.example.uiextensionforresultascaller');
  } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_0900') {
    console.info("====>[UIExtensionForResultAsCallerRely] want.parameters.parameter == 'StartAbilityForResultAsCaller_0900':");
    setWantParameters('StartAbilityForResultAsCaller_0900', 'com.example.uiextensionforresultascallerbackground');
  } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_1100') {
    console.info("====>[UIExtensionForResultAsCallerRely] want.parameters.parameter == 'StartAbilityForResultAsCaller_1100':");
    setWantParameters('StartAbilityForResultAsCaller_1100', 'com.example.uiextensionforresultascaller');
  } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_1400') {
    console.info("====>[UIExtensionForResultAsCallerRely] want.parameters.parameter == 'StartAbilityForResultAsCaller_1400':");
    setWantParameters('StartAbilityForResultAsCaller_1400', 'com.example.uiextensionforresultascaller');
  } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_1500') {
    console.info("====>[UIExtensionForResultAsCallerRely] want.parameters.parameter == 'StartAbilityForResultAsCaller_1500':");
    setWantParameters('StartAbilityForResultAsCaller_1500', 'com.example.uiextensionforresultascaller');
  } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_1600') {
    console.info("====>[UIExtensionForResultAsCallerRely] want.parameters.parameter == 'StartAbilityForResultAsCaller_1600':");
    setWantParameters('StartAbilityForResultAsCaller_1600', 'com.example.uiextensionforresultascaller');
  } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_1700') {
    console.info("====>[UIExtensionForResultAsCallerRely] want.parameters.parameter == 'StartAbilityForResultAsCaller_1700':");
    setWantParameters('StartAbilityForResultAsCaller_1700', 'com.example.uiextensionforresultascaller');
  } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_1800') {
    console.info("====>[UIExtensionForResultAsCallerRely] want.parameters.parameter == 'StartAbilityForResultAsCaller_1800':");
    setWantParameters('StartAbilityForResultAsCaller_1800', 'com.example.uiextensionforresultascaller');
  } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_2000') {
    console.info("====>[UIExtensionForResultAsCallerRely] want.parameters.parameter == 'StartAbilityForResultAsCaller_2000':");
    setWantParameters('StartAbilityForResultAsCaller_2000', 'com.example.uiextensionforresultascaller');
  }
}

export default class EntryAbility extends UIAbility {
  onCreate(want, launchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    console.info('====> [UIExtensionForResultAsCallerRely] onCreate.');
    globalThis.terminate = (str) => {
      this.context.terminateSelf().then(() => {
        console.info('====>terminateSelf' + JSON.stringify(str) + ' end');
      }).catch((err) => {
        console.info('====>terminateSelf ' + JSON.stringify(str) + ' err:' + JSON.stringify(err));
      });

    };
    setWant(want);
  }

  onNewWant(want, launchParam) {
    console.info('====> [UIExtensionForResultAsCallerRely] onNewWant.');
    setWant(want);
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
