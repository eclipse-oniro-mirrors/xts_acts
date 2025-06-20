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

import commonEvent from '@ohos.commonEventManager';
import hilog from '@ohos.hilog';
import ShareExtensionAbility from '@ohos.app.ability.ShareExtensionAbility';

function sleep(time: number): Promise<number> {
  return new Promise((resolve) => setTimeout(resolve, time));
}

export default class UiExtAbility extends ShareExtensionAbility {
  private StartAbilityForResultAsCaller_0700 = () => {
    setTimeout(() => {
      console.info('====>[backGroundAbility] onSessionCreate want.parameters.parameter == StartAbilityForResultAsCaller_0700');
      this.context.startAbilityForResultAsCaller({
        moduleName: 'entry',
        bundleName: 'com.example.uiextensionforresultascallerother',
        abilityName: 'CalledAbility',
        parameters: {
          parameter: 'StartAbilityForResultAsCaller_0700_2'
        }
      }).then((data) => {
        console.log('====>[backGroundAbility] startAbilityForResultAsCaller 0700 ok: ' + JSON.stringify(data));
      }).catch((error) => {
        console.log('====>[backGroundAbility] startAbilityForResultAsCaller 0700 err: ' + error.code);
        let commonEventData = {
          parameters: {
            result: error.code
          }
        };
        commonEvent.publish('0700', commonEventData, (err) => {
          console.debug('====>[backGroundAbility] 0700 publish err:' + JSON.stringify(err));
        });
      })
    }, 2000);
  }

  private StartAbilityForResultAsCaller_0900 = () => {
    console.info('====>[backGroundAbility] onSessionCreate want.parameters.parameter == StartAbilityForResultAsCaller_0900');
    this.context.startAbilityForResultAsCaller({
      bundleName: 'com.example.uiextensionforresultascallerother',
      abilityName: 'CalledAbility',
      moduleName: 'entry',
      parameters: {
        parameter: 'StartAbilityForResultAsCaller_0900'
      }
    }).then((data) => {
      console.log('====>[backGroundAbility] startAbilityForResultAsCaller 0900 ok: ' + JSON.stringify(data));
    }).catch((error) => {
      console.log('====>[backGroundAbility] startAbilityForResultAsCaller 0900 err: ' + error.code);
    });
  }

  private StartAbilityForResultAsCaller_1300 = () => {
    console.info('====>[UIExtensionForResultAsCallerUIAbility] want.parameters.parameter == StartAbilityForResultAsCaller_1300');
    this.context.startAbilityForResultAsCaller({
      bundleName: 'com.example.uiextensionforresultascaller',
      parameters: {
        parameter: 'StartAbilityForResultAsCaller_1300'
      }
    }).then((data) => {
      console.log('====>[UIExtensionForResultAsCallerUIAbility] 1300 ok: ' + JSON.stringify(data));
    }).catch((error) => {
      console.log('====>[UIExtensionForResultAsCallerUIAbility] 1300 err: ' + error.code);
      let commonEventData = {
        parameters: {
          result: error.code
        }
      };
      commonEvent.publish('1300', commonEventData, (err) => {
        console.debug('====>[UIExtensionForResultAsCallerUIAbility] 1300 publish err:' + JSON.stringify(err));
      });
    });
  }

  private StartAbilityForResultAsCaller_2100 = async () => {
    console.info('====>[backGroundAbility] onSessionCreate want.parameters.parameter == StartAbilityForResultAsCaller_2100');
    this.context.startAbilityForResultAsCaller({
      bundleName: 'com.example.uiextensionforresultascallersyspicker',
      abilityName: 'EntryAbility',
      moduleName: 'entry',
      parameters: {
        parameter: 'StartAbilityForResultAsCaller_2100'
      }
    }).then((data) => {
      console.info('====>[OtherUIAbility] startAbilityForResultAsCaller 2100 ok: ' + JSON.stringify(data));
    }).catch((error) => {
      console.info('====>[OtherUIAbility] startAbilityForResultAsCaller 2100 err: ' + error.code);
    });
    await sleep(2000);
    commonEvent.publish('killui', (err) => {
      console.info('====>[OtherUIAbility] startAbilityForResultAsCaller 2100 err: ' + JSON.stringify(err));
    });
  }
  onCreate() {
    hilog.info(0x0000, 'testTag', 'UIExtAbility onCreate  want: %{public}s');
    console.info('=======>====> [backGroundAbility] onCreate======>');
  }

  async onSessionCreate(want, session) {
    console.log(`want: ${JSON.stringify(want)}}`);
    let storage: LocalStorage = new LocalStorage({
      'session': session
    });
    session.loadContent('pages/Page', storage);
    console.info('=======>====> [backGroundAbility] onSessionCreate======>');
    if (want.parameters.parameter === 'StartAbilityForResultAsCaller_0700') {
      this.StartAbilityForResultAsCaller_0700();
    }else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_0900') {
      this.StartAbilityForResultAsCaller_0900();
    } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_1200') {
      console.info('====>[backGroundAbility] onSessionCreate want.parameters.parameter == StartAbilityForResultAsCaller_1200');
      this.context.startAbilityForResultAsCaller({
        bundleName: 'com.example.uiextensionforresultascaller',
        abilityName: 'ThirdAbility',
        moduleName: 'entry',
        parameters: {
          parameter: 'StartAbilityForResultAsCaller_1200'
        }
      }).then((data) => {
        console.log('====>[backGroundAbility] startAbilityForResultAsCaller 1200 ok: ' + JSON.stringify(data));
      }).catch((error) => {
        console.log('====>[backGroundAbility] startAbilityForResultAsCaller 1200 err: ' + error.code);
        let commonEventData = {
          parameters: {
            result: error.code
          }
        };
        commonEvent.publish('1200', commonEventData, (err) => {
          session.terminateSelf();
          console.info('====>[backGroundAbility] 1200 publish err:' + JSON.stringify(err));
        })
      })
    } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_2100') {
      this.StartAbilityForResultAsCaller_2100();
    } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_1300') {
      this.StartAbilityForResultAsCaller_1300();
    }
  }

  onSessionDestroy(session) {
    console.log('====> [backGroundAbility] onSessionDestroy');
  }

  onBackground() {
    console.log('====> [backGroundAbility] onBackground');
  }

  onDestroy() {
    console.info('=======>UIExtensionAbility onDestroy ======>');
  }

  onForeground() {
    // Ability has brought to foreground
    console.log('=====> UIExtAbility onForeground =====> ');
  }
};
