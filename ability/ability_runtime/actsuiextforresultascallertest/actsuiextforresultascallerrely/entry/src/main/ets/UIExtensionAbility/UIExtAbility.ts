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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import type UIExtensionContentSession from '@ohos.app.ability.UIExtensionContentSession';

let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
let sessionCode: UIExtensionContentSession;
function sleep(time: number): Promise<number> {
  return new Promise((resolve) => setTimeout(resolve, time));
}

export default class UiExtAbility extends ShareExtensionAbility {
  private StartAbilityForResultAsCaller_0100 = () => {
    console.info('====>[UIExtensionForResultAsCallerUIAbility] want.parameters.parameter == StartAbilityForResultAsCaller_0100');
    this.context.startAbilityForResultAsCaller({
      bundleName: 'com.example.uiextensionforresultascaller',
      abilityName: 'CalledAbility',
      parameters: {
        parameter: 'StartAbilityForResultAsCaller_0100'
      }
    }, {
      windowMode: 0,
      displayId: 0,
      withAnimation: true,
      windowLeft: 0,
      windowTop: 0,
      windowWidth: 20,
      windowHeight: 20
    }).then((data) => {
      console.log('====>[UIExtensionForResultAsCallerUIAbility] 0100 ok: ' + JSON.stringify(data));
    }).catch((error) => {
      console.log('====>[UIExtensionForResultAsCallerUIAbility] 0100 err: ' + error.code);
    });
  }

  private StartAbilityForResultAsCaller_0200 = () => {
    console.info('====>[UIExtensionForResultAsCallerUIAbility] want.parameters.parameter == StartAbilityForResultAsCaller_0200');
    this.context.startAbilityForResultAsCaller({
      bundleName: 'com.example.uiextensionforresultascallerother',
      abilityName: 'EntryAbility',
      moduleName: 'entry',
      parameters: {
        parameter: 'StartAbilityForResultAsCaller_0200'
      }
    }).then((data) => {
      console.log('====>[UIExtensionForResultAsCallerUIAbility] 0200 ok: ' + JSON.stringify(data));
    }).catch((error) => {
      console.log('====>[UIExtensionForResultAsCallerUIAbility] 0200 err: ' + error.code);
    });
  }

  private StartAbilityForResultAsCaller_0300 = () => {
    console.info('====>[UIExtensionForResultAsCallerUIAbility] want.parameters.parameter == StartAbilityForResultAsCaller_0300');
    this.context.startAbilityForResultAsCaller({
      bundleName: 'com.example.uiextensionforresultascaller',
      abilityName: 'CalledAbility',
      moduleName: 'entry',
      parameters: {
        parameter: 'StartAbilityForResultAsCaller_0300'
      }
    }).then((data) => {
      console.info('====>[UIExtensionForResultAsCallerUIAbility] 0300 ok: ' + JSON.stringify(data));
      let commonEventData = {
        parameters: {
          str: data.want.parameters.action,
          result: data.resultCode
        }
      };
      commonEvent.publish('0300', commonEventData, (err) => {
        console.debug('====>[UIExtensionForResultAsCallerUIAbility] 0300 publish err:' + JSON.stringify(err));
        sessionCode.terminateSelf()
          .catch((err) => {
            console.info('====>[UIExtensionForResultAsCallerUIAbility] 0300 terminate err: ' + JSON.stringify(err));
          });
      });
    }).catch((error) => {
      console.log('====>[UIExtensionForResultAsCallerUIAbility] 0300 err: ' + error.code);
    });
  }

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

  private StartAbilityForResultAsCaller_0600 = () => {
    console.info('====>[UIExtensionForResultAsCallerUIAbility] want.parameters.parameter == StartAbilityForResultAsCaller_0600');
    this.context.startAbilityForResultAsCaller({
      action: 'ohos.caller.test.action',
      entities: ['entity.system.home']
    }).then((data) => {
      console.info('====>[UIExtensionForResultAsCallerUIAbility] 0600 ok: ' + JSON.stringify(data));
      let commonEventData = {
        parameters: {
          str: data.want.parameters.action,
          result: data.resultCode
        }
      };
      commonEvent.publish('0600', commonEventData, (err) => {
        console.debug('====>[UIExtensionForResultAsCallerUIAbility] 0600 publish err:' + JSON.stringify(err));
      });
    }).catch((error) => {
      console.log('====>[UIExtensionForResultAsCallerUIAbility] 0600 err: ' + error.code);
    });
  }

  private StartAbilityForResultAsCaller_0800 = () => {
    console.info('====>[UIExtensionForResultAsCallerUIAbility] want.parameters.parameter == StartAbilityForResultAsCaller_0800');
    setTimeout(() => {
      this.context.startAbility({
        moduleName: 'entry',
        bundleName: 'com.example.uiextensionforresultascallerother',
        abilityName: 'CalledAbility',
        parameters: {
          parameter: 'StartAbilityForResultAsCaller_0800_2'
        }
      }).then((data) => {
        console.log('====>[UIExtensionForResultAsCallerUIAbility] 0800 ok: ' + JSON.stringify(data));
      }).catch((error) => {
        console.log('====>[UIExtensionForResultAsCallerUIAbility] 0800 err: ' + error.code);
        let commonEventData = {
          parameters: {
            result: error.code
          }
        };
        commonEvent.publish('0800', commonEventData, (err) => {
          console.debug('====>[UIExtensionForResultAsCallerUIAbility] 0800 publish err:' + JSON.stringify(err));
        });
      });
    }, 2000);
  }

  private StartAbilityForResultAsCaller_1100 = () => {
    console.info('====>[UIExtensionForResultAsCallerUIAbility] want.parameters.parameter == StartAbilityForResultAsCaller_1100');
    this.context.startAbilityForResultAsCaller({
      bundleName: 'com.example.uiextensionforresultascaller',
      abilityName: 'xxxxxxxxxx',
      moduleName: '',
      parameters: {
        parameter: 'StartAbilityForResultAsCaller_1100'
      }
    }).then((data) => {
      console.log('====>[UIExtensionForResultAsCallerUIAbility] 1100 ok: ' + JSON.stringify(data));
    }).catch((error) => {
      console.log('====>[UIExtensionForResultAsCallerUIAbility] 1100 err: ' + error.code);
      let commonEventData = {
        parameters: {
          result: error.code
        }
      };
      commonEvent.publish('1100', commonEventData, (err) => {
        console.debug('====>[UIExtensionForResultAsCallerUIAbility] 1100 publish err:' + JSON.stringify(err));
      });
    });
  }

  private StartAbilityForResultAsCaller_1400 = () => {
    console.info('====>[UIExtensionForResultAsCallerUIAbility] want.parameters.parameter == StartAbilityForResultAsCaller_1400');
    this.context.startAbilityForResultAsCaller({
      bundleName: 'com.example.uiextensionforresultascaller',
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
      bundleName: 'com.example.uiextensionforresultascaller',
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

  private StartAbilityForResultAsCaller_2000 = async () => {
    console.info('====>[UIExtensionForResultAsCallerUIAbility] want.parameters.parameter == StartAbilityForResultAsCaller_2000');
    this.context.startAbilityForResultAsCaller({
      bundleName: 'com.example.uiextensionforresultascallerbackground',
      abilityName: 'EntryAbility',
      moduleName: 'entry',
      parameters: {
        parameter: 'StartAbilityForResultAsCaller_2000'
      }
    }).then((data) => {
      console.info('====>[UIExtensionForResultAsCallerUIAbility] 2000 ok: ' + JSON.stringify(data));
      let commonEventData = {
        parameters: {
          result: data.resultCode
        }
      };
      commonEvent.publish('2000', commonEventData, (err) => {
        console.debug('====>[UIExtensionForResultAsCallerUIAbility] 2000 publish err:' + JSON.stringify(err));
      });
    }).catch((error) => {
      console.log('====>[UIExtensionForResultAsCallerUIAbility] 2000 err: ' + error.code);
    });

    await sleep(2000);
    let commonEventData = {
      parameters: {
        str: 'kill'
      }
    };
    commonEvent.publish('kill', commonEventData, (err) => {
      console.debug('====>[UIExtensionForResultAsCallerUIAbility] 2000 publish2 err:' + JSON.stringify(err));
    });
  }

  onCreate() {
    hilog.info(0x0000, 'testTag', 'UIExtAbility onCreate  want: %{public}s');
    console.info('=======>UIExtAbility onCreate======>');
  }

  async onSessionCreate(want, session) {
    sessionCode = session;
    console.log(`want: ${JSON.stringify(want)}}`);
    let storage: LocalStorage = new LocalStorage({
      'session': session
    });
    session.loadContent('pages/Page', storage);
    console.info('=======>UIExtAbility onSessionCreate======>');

    if (want.parameters.parameter === 'StartAbilityForResultAsCaller_0100') {
      this.StartAbilityForResultAsCaller_0100();
    } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_0200') {
      this.StartAbilityForResultAsCaller_0200();
    } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_0300') {
      this.StartAbilityForResultAsCaller_0300();
    } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_0400') {
      this.StartAbilityForResultAsCaller_0400();
    } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_0600') {
      this.StartAbilityForResultAsCaller_0600();
    } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_0800') {
      this.StartAbilityForResultAsCaller_0800();
    } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_1100') {
      this.StartAbilityForResultAsCaller_1100();
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
    } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_2000') {
      this.StartAbilityForResultAsCaller_2000();
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
