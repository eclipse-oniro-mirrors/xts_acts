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

import UIExtensionAbility from '@ohos.app.ability.UIExtensionAbility';
import wantConstant from '@ohos.app.ability.wantConstant';
import commonEvent from '@ohos.commonEventManager';
// import Logger from '../model/Logger'
import hilog from '@ohos.hilog';
// const TAG: string = '[UIExtensionAbility]'

export default class UiExtAbility extends UIExtensionAbility {
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

    if (want.action === 'AsyncCallback_0100') {
      console.info('=======>UIExtAbility onSessionCreate want.action == AsyncCallback_0100======>');
      this.context.startAbilityForResult({
        action: 'AsyncCallback_0100',
        bundleName: 'com.example.mainhap',
        abilityName: 'CalledAbility',
        parameters: {
          [wantConstant.Params.ABILITY_BACK_TO_OTHER_MISSION_STACK]: true
        }
      }, (error, data) => {
        console.info('=======>Callback_0100 error.code ======>' + error.code);
        console.info('=======>Callback_0100 data.resultCode ======>' + data.resultCode);
        console.info('=======>Callback_0100 data.action ======>' + data.want.parameters.action);
        let commonEventData = {
          parameters: {
            num: error.code,
            str: data.want.parameters.action,
            result: data.resultCode
          }
        };
        commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
          console.debug('====>AsyncCallback_0100 publish err:' + JSON.stringify(err));
        });
      });
    }

    if (want.action === 'AsyncCallback_0300') {
      console.info('=======>UIExtAbility onSessionCreate want.action == AsyncCallback_0300======>');
      this.context.startAbilityForResult({
        action: 'AsyncCallback_0300',
        bundleName: 'com.example.mainhap',
        abilityName: 'OtherAbility',
        parameters: {
          [wantConstant.Params.ABILITY_BACK_TO_OTHER_MISSION_STACK]: true
        }
      }, (error, data) => {
        console.info('=======>Callback_0300  first from own error.code ======>' + error.code);
        console.info('=======>Callback_0300  first from own data.resultCode ======>' + data.resultCode);
        console.info('=======>Callback_0300 first from own data.action ======>' + data.want.parameters.action);
        let commonEventData = {
          parameters: {
            num: error.code,
            str: data.want.parameters.action,
            result: data.resultCode
          }
        };
        commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
          console.debug('====>AsyncCallback_0300 first publish err:' + JSON.stringify(err));
        });
      });
    }

    if (want.action === 'AsyncCallback_0400') {
      console.info('=======>UIExtAbility onSessionCreate want.action == AsyncCallback_0400======>');
      this.context.startAbilityForResult({
        action: 'AsyncCallback_0400',
        bundleName: 'com.example.forresulttestsecond',
        abilityName: 'CalledAbility',
        parameters: {
          [wantConstant.Params.ABILITY_BACK_TO_OTHER_MISSION_STACK]: true
        }
      }, (error, data) => {
        console.info('=======>Callback_0400  first from own error.code ======>' + error.code);
        console.info('=======>Callback_0400  first from own data.resultCode ======>' + data.resultCode);
        console.info('=======>Callback_0400 first from own data.action ======>' + data.want.parameters.action);
        let commonEventData = {
          parameters: {
            num: error.code,
            str: data.want.parameters.action,
            result: data.resultCode
          }
        };
        commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
          console.debug('====>AsyncCallback_0400 first publish err:' + JSON.stringify(err));
        });
      });
    }

    if (want.action === 'AsyncCallback_0500') {
      console.info('=======>UIExtAbility onSessionCreate want.action == AsyncCallback_0500======>');
      this.context.startAbilityForResult({
        action: 'AsyncCallback_0500',
        bundleName: 'xxx.xxxxxxx.xxx',
        abilityName: 'CalledAbility',
        parameters: {
          [wantConstant.Params.ABILITY_BACK_TO_OTHER_MISSION_STACK]: true
        }
      }, (error, data) => {
        console.info('=======>Callback_0500  first from own error.code ======>' + error.code);
        let commonEventData = {
          parameters: {
            num: error.code
          }
        };
        commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
          console.debug('====>AsyncCallback_0500 first publish err:' + JSON.stringify(err));
        });
      });
    }

    if (want.action === 'Promise_0100') {
      console.info('=======>UIExtAbility onSessionCreate want.action == Promise_0100======>');
      this.context.startAbilityForResult({
        action: 'Promise_0100',
        bundleName: 'com.example.mainhap',
        abilityName: 'CalledAbility',
        parameters: {
          [wantConstant.Params.ABILITY_BACK_TO_OTHER_MISSION_STACK]: true
        }
      }).then((data) => {
        console.info('=======>Promise_0100 data.resultCode ======>' + data.resultCode);
        console.info('=======>Promise_0100 data.action ======>' + data.want.parameters.action);
        let commonEventData = {
          parameters: {
            str: data.want.parameters.action,
            result: data.resultCode
          }
        };
        commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
          console.debug('====>Promise_0100 publish err:' + JSON.stringify(err));
        });
      }).catch((error) => {
        console.info('=======>Promise_0100 error.code ======>' + error.code);
      });
    }

    if (want.action === 'Promise_0300') {
      console.info('=======>UIExtAbility onSessionCreate want.action == Promise_0300======>');
      this.context.startAbilityForResult({
        action: 'Promise_0300',
        bundleName: 'com.example.mainhap',
        abilityName: 'OtherAbility',
        parameters: {
          [wantConstant.Params.ABILITY_BACK_TO_OTHER_MISSION_STACK]: true
        }
      }).then((data) => {
        console.info('=======>Promise_0300  first from own data.resultCode ======>' + data.resultCode);
        console.info('=======>Promise_0300 first from own data.action ======>' + data.want.parameters.action);
        let commonEventData = {
          parameters: {
            str: data.want.parameters.action,
            result: data.resultCode
          }
        };
        commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
          console.debug('====>Promise_0300 first publish err:' + JSON.stringify(err));
        });
      }).catch((error) => {
        console.info('=======>Promise_0300  first from own error.code ======>' + error.code);
      });
    }

    if (want.action === 'Promise_0400') {
      console.info('=======>UIExtAbility onSessionCreate want.action == Promise_0400======>');
      this.context.startAbilityForResult({
        action: 'Promise_0400',
        bundleName: 'com.example.forresulttestsecond',
        abilityName: 'CalledAbility',
        parameters: {
          [wantConstant.Params.ABILITY_BACK_TO_OTHER_MISSION_STACK]: true
        }
      }).then((data) => {
        console.info('=======>Promise_0400  first from own data.resultCode ======>' + data.resultCode);
        console.info('=======>Promise_0400 first from own data.action ======>' + data.want.parameters.action);
        let commonEventData = {
          parameters: {
            str: data.want.parameters.action,
            result: data.resultCode
          }
        };
        commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
          console.debug('====>Promise_0400 first publish err:' + JSON.stringify(err));
        });
      }).catch((error) => {
        console.info('=======>Promise_0400  first from own error.code ======>' + error.code);
      });
    }

    if (want.action === 'Promise_0500') {
      console.info('=======>UIExtAbility onSessionCreate want.action == Promise_0500======>');
      this.context.startAbilityForResult({
        action: 'Promise_0500',
        bundleName: 'xxx.xxxxxxx.xxx',
        abilityName: 'CalledAbility',
        parameters: {
          [wantConstant.Params.ABILITY_BACK_TO_OTHER_MISSION_STACK]: true
        }
      }).then((data) => {
        console.info('=======>Callback_0500  first from own data.resultCode ======>' + data.resultCode);
        console.info('=======>Callback_0500 first from own data.action ======>' + data.want.parameters.action);
      }).catch((error) => {
        console.info('=======>Callback_0500  first from own error.code ======>' + error.code);
        let commonEventData = {
          parameters: {
            num: error.code
          }
        };
        commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
          console.debug('====>AsyncCallback_0500 first publish err:' + JSON.stringify(err));
        });
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
}
