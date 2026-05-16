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
import hilog from '@ohos.hilog';

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

    if (want.action === 'AsyncCallback_0600') {
      console.info('=======>UIExtAbility onSessionCreate want.action == AsyncCallback_0600======>');
      this.context.startAbilityForResult({
        action: 'AsyncCallback_0600',
        bundleName: 'com.example.mainhap',
        abilityName: 'CalledAbility',
        parameters: {
          [wantConstant.Params.ABILITY_BACK_TO_OTHER_MISSION_STACK]: true
        }
      }, (error, data) => {
        console.info('=======>Callback_0600  first from own error.code ======>' + error.code);
        let commonEventData = {
          parameters: {
            num: error.code
          }
        };
        commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
          console.debug('====>AsyncCallback_0600 first publish err:' + JSON.stringify(err));
        });
      });
    }

    if (want.action === 'AsyncCallback_0700') {
      console.info('=======>UIExtAbility onSessionCreate want.action == AsyncCallback_0700======>');
      this.context.startAbilityForResult({
        action: 'AsyncCallback_0700',
        bundleName: 'com.example.mainhap',
        abilityName: 'OtherAbility',
        parameters: {
          [wantConstant.Params.ABILITY_BACK_TO_OTHER_MISSION_STACK]: true
        }
      }, (error, data) => {
        console.info('=======>Callback_0700  first from own error.code ======>' + error.code);
        let commonEventData = {
          parameters: {
            num: error.code
          }
        };
        commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
          console.debug('====>AsyncCallback_0700 first publish err:' + JSON.stringify(err));
        });
      });
    }

    if (want.action === 'Promise_0600') {
      console.info('=======>UIExtAbility onSessionCreate want.action == Promise_0600======>');
      this.context.startAbilityForResult({
        action: 'Promise_0600',
        bundleName: 'com.example.mainhap',
        abilityName: 'CalledAbility',
        parameters: {
          [wantConstant.Params.ABILITY_BACK_TO_OTHER_MISSION_STACK]: true
        }
      })
        .then((data) => {
          console.info('=======>Promise_0600  startAbilityForResult ok ======>');
        })
        .catch((error) => {
          console.info('=======>Promise_0600  first from own error.code ======>' + error.code);
          let commonEventData = {
            parameters: {
              num: error.code
            }
          };
          commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
            console.debug('====>Promise_0600 first publish err:' + JSON.stringify(err));
          });
        });
    }

    if (want.action === 'Promise_0700') {
      console.info('=======>UIExtAbility onSessionCreate want.action == Promise_0700======>');
      this.context.startAbilityForResult({
        action: 'Promise_0700',
        bundleName: 'com.example.mainhap',
        abilityName: 'OtherAbility',
        parameters: {
          [wantConstant.Params.ABILITY_BACK_TO_OTHER_MISSION_STACK]: true
        }
      })
        .then((data) => {
          console.info('=======>Promise_0700  startAbilityForResult ok ======>');
        })
        .catch((error) => {
          console.info('=======>Promise_0700  first from own error.code ======>' + error.code);
          let commonEventData = {
            parameters: {
              num: error.code
            }
          };
          commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
            console.debug('====>AsyncCallback_0700 first publish err:' + JSON.stringify(err));
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
};
