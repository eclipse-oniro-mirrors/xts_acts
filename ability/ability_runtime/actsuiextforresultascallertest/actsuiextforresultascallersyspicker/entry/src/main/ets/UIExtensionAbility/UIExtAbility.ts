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

import hilog from '@ohos.hilog';
import ShareExtensionAbility from '@ohos.app.ability.ShareExtensionAbility';
import commonEvent from '@ohos.commonEventManager';

export default class UiExtAbility extends ShareExtensionAbility {
  private StartAbilityForResultAsCaller_0400 = () => {
    console.info('====>[UIExtensionForResultAsCallerUIAbility] want.parameters.parameter == StartAbilityForResultAsCaller_0400');
    try {
      this.context.startAbilityForResultAsCaller(undefined).then((data) => {
        console.info('====>[UIExtensionForResultAsCallerUIAbility] 0400 ok: ' + JSON.stringify(data));
      }).catch((error) => {
        console.info('====>[UIExtensionForResultAsCallerUIAbility] 0400 err: ' + error.code);
      });
    } catch (err) {
      console.info('====>[UIExtensionForResultAsCallerUIAbility] 0400 start try err:' + JSON.stringify(err));
      let commonEventData = {
        parameters: {
          result: err.code
        }
      };
      commonEvent.publish('0400', commonEventData, (err) => {
        console.info('====>[UIExtensionForResultAsCallerUIAbility] 0400 publish err:' + JSON.stringify(err));
      });
    }
  }
  private StartAbilityForResultAsCaller_1400 = () => {
    console.info('====>[UIExtensionForResultAsCallerUIAbility] want.parameters.parameter == StartAbilityForResultAsCaller_1400');
    this.context.startAbilityForResultAsCaller({
      bundleName: 'com.example.uiextensionforresultascallersyspicker',
      abilityName: 'CalledAbility',
      moduleName: 'entry',
      parameters: {
        parameter: 'StartAbilityForResultAsCaller_1400'
      }
    }, undefined).then((data) => {
      console.log('====>[UIExtensionForResultAsCallerUIAbility] 1400 ok: ' + JSON.stringify(data));
    }).catch((error) => {
      console.log('====>[UIExtensionForResultAsCallerUIAbility] 1400 err: ' + error.code);
    });
  }

  private StartAbilityForResultAsCaller_1500 = () => {
    console.info('====>[UIExtensionForResultAsCallerUIAbility] want.parameters.parameter == StartAbilityForResultAsCaller_1500');
    this.context.startAbilityForResultAsCaller({
      bundleName: 'com.example.uiextensionforresultascallersyspicker',
      abilityName: 'CalledAbility',
      moduleName: 'entry',
      parameters: {
        parameter: 'StartAbilityForResultAsCaller_1500'
      }
    }, null).then((data) => {
      console.log('====>[UIExtensionForResultAsCallerUIAbility] 1500 ok: ' + JSON.stringify(data));
    }).catch((error) => {
      console.log('====>[UIExtensionForResultAsCallerUIAbility] 1500 err: ' + error.code);
    });
  }

  private StartAbilityForResultAsCaller_1600 = () => {
    console.info('====>[UIExtensionForResultAsCallerUIAbility] want.parameters.parameter == StartAbilityForResultAsCaller_1600');
    try {
      this.context.startAbilityForResultAsCaller(null).then((data) => {
        console.info('====>[UIExtensionForResultAsCallerUIAbility] 1600 ok: ' + JSON.stringify(data));
      }).catch((error) => {
        console.info('====>[UIExtensionForResultAsCallerUIAbility] 1600 err: ' + error.code);
      });
    } catch (err) {
      console.info('====>[UIExtensionForResultAsCallerUIAbility] 1600 start try err:' + JSON.stringify(err));
      let commonEventData = {
        parameters: {
          result: err.code
        }
      };
      commonEvent.publish('1600', commonEventData, (err) => {
        console.info('====>[UIExtensionForResultAsCallerUIAbility] 1600 publish err:' + JSON.stringify(err));
      });
    }
  }

  private StartAbilityForResultAsCaller_1700 = () => {
    console.info('====>[UIExtensionForResultAsCallerUIAbility] want.parameters.parameter == StartAbilityForResultAsCaller_1700');
    this.context.startAbilityForResultAsCaller({}).then((data) => {
      console.log('====>[UIExtensionForResultAsCallerUIAbility] 1700 ok: ' + JSON.stringify(data));
    }).catch((error) => {
      console.log('====>[UIExtensionForResultAsCallerUIAbility] 1700 err: ' + error.code);
      let commonEventData = {
        parameters: {
          result: error.code
        }
      };
      commonEvent.publish('1700', commonEventData, (err) => {
        console.debug('====>[UIExtensionForResultAsCallerUIAbility] 1700 publish err:' + JSON.stringify(err));
      });
    });
  }

  private StartAbilityForResultAsCaller_1800 = () => {
    console.info('====>[UIExtensionForResultAsCallerUIAbility] want.parameters.parameter == StartAbilityForResultAsCaller_1800');
    this.context.startAbilityForResultAsCaller({
      abilityName: 'CalledAbility',
      moduleName: 'entry',
      parameters: {
        parameter: 'StartAbilityForResultAsCaller_1800'
      }
    }).then((data) => {
      console.log('====>[UIExtensionForResultAsCallerUIAbility] 1800 ok: ' + JSON.stringify(data));
    }).catch((error) => {
      console.log('====>[UIExtensionForResultAsCallerUIAbility] 1800 err: ' + error.code);
      let commonEventData = {
        parameters: {
          result: error.code
        }
      };
      commonEvent.publish('1800', commonEventData, (err) => {
        console.debug('====>[UIExtensionForResultAsCallerUIAbility] 1800 publish err:' + JSON.stringify(err));
      });
    });
  }
  onCreate() {
    hilog.info(0x0000, 'testTag', 'UIExtAbility onCreate  want: %{public}s');
    console.info('=======>UIExtAbility onCreate======>');
  }

  onSessionCreate(want, session) {
    console.log(`want: ${JSON.stringify(want)}}`);
    let storage: LocalStorage = new LocalStorage({
      'session': session
    });
    session.loadContent('pages/Page', storage);
    console.info('=======>UIExtAbility onSessionCreate======>');


    if (want.parameters.parameter === 'StartAbilityForResultAsCaller_1900') {
      console.info('====>[SysPickerUIExtension] want.parameters.parameter == StartAbilityForResultAsCaller_1900');
      this.context.startAbilityForResultAsCaller({
        bundleName: 'com.example.uiextensionforresultascaller',
        abilityName: 'CalledAbility',
        parameters: {
          parameter: 'StartAbilityForResultAsCaller_1900'
        }
      }).then((data) => {
        console.log('====>[UIExtensionForResultAsCallerUIAbility] 1900 ok: ' + JSON.stringify(data));
      }).catch((error) => {
        console.log('====>[UIExtensionForResultAsCallerUIAbility] 1900 err: ' + error.code);
      });
    } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_0400') {
      this.StartAbilityForResultAsCaller_0400();
    } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_1400') {
      this.StartAbilityForResultAsCaller_1400();
    } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_1500') {
      this.StartAbilityForResultAsCaller_1500();
    } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_1600') {
      this.StartAbilityForResultAsCaller_1600();
    } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_1700') {
      this.StartAbilityForResultAsCaller_1700();
    } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_1800') {
      this.StartAbilityForResultAsCaller_1800();
    } else {
      this.context.startAbilityForResultAsCaller({
        bundleName: 'com.example.uiextensionforresultascallerother',
        abilityName: 'CalledAbility',
        moduleName: 'entry',
        parameters: {
          parameter: 'StartAbilityForResultAsCaller_1000'
        }
      }).then((data) => {
        console.log('====>[SysPickerUIExtAbility] startAbilityForResultAsCaller 1000 ok: ' + JSON.stringify(data));
      }).catch((error) => {
        console.log('====>[SysPickerUIExtAbility] startAbilityForResultAsCaller 1000 err: ' + error.code);
      });
    }
  }

  onSessionDestroy(session) {
    console.log('onSessionDestroy');
  }

  onDestroy() {
    console.info('=======>UIExtensionAbility onDestroy ======>');
  }

  onForeground() {
    // Ability has brought to foreground
    console.log('=====> UIExtAbility onForeground =====> ');
  }
};
