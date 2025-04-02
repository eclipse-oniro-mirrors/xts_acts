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
import ShareExtensionAbility from '@ohos.app.ability.ShareExtensionAbility';
import wantConstant from '@ohos.app.ability.wantConstant';
import commonEvent from '@ohos.commonEventManager';
import hilog from '@ohos.hilog';

export default class UiExtAbility extends ShareExtensionAbility {
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

    if (want.action === 'Acts_ShareExtensionAbility_1000') {
      console.info('=======>UIExtAbility onSessionCreate want.action == Acts_ShareExtensionAbility_1000======>');
      this.context.startAbility({
        action: 'Acts_ShareExtensionAbility_1000',
        bundleName: 'com.example.actsshareextensionabilitytest',
        abilityName: 'CalledAbility',
        parameters: {
          [wantConstant.Params.ABILITY_BACK_TO_OTHER_MISSION_STACK]: true
        }
      }, (error) => {
        console.info('=======>Acts_ShareExtensionAbility_1000 error.code ======>' + error.code);
        let commonEventData = {
          parameters: {
            num: error.code
          }
        };
        commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
          console.debug('====>Acts_ShareExtensionAbility_1000 publish err:' + JSON.stringify(err));
        });
      });
    }

    if (want.action === 'Acts_ShareExtensionAbility_1100') {
      console.info('=======>UIExtAbility onSessionCreate want.action == Acts_ShareExtensionAbility_1100======>');
      this.context.startAbility({
        action: 'Acts_ShareExtensionAbility_1100',
        bundleName: 'com.example.actsshareextensionabilitytest',
        abilityName: 'CalledAbility',
        parameters: {
          [wantConstant.Params.ABILITY_BACK_TO_OTHER_MISSION_STACK]: true
        }
      }).then(() => {
        console.info('=======>Acts_ShareExtensionAbility_1100 UIExtAbility startAbility success ======>');
        let commonEventData = {
          parameters: {
            str: 'success'
          }
        };
        commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
          console.debug('====>Acts_ShareExtensionAbility_1100 publish err:' + JSON.stringify(err));
        });
      }).catch((err) => {
        console.debug('====>Acts_ShareExtensionAbility_1100 UIExtAbility startAbility err:' + JSON.stringify(err));
      });
    }

    if (want.action === 'Acts_ShareExtensionAbility_1200') {
      console.info('=======>UIExtAbility onSessionCreate want.action == Acts_ShareExtensionAbility_1200======>');
      this.context.startAbility({
        action: 'Acts_ShareExtensionAbility_1200',
        bundleName: 'xxx.xxxx.xxxxx',
        abilityName: 'CalledAbility',
        parameters: {
          [wantConstant.Params.ABILITY_BACK_TO_OTHER_MISSION_STACK]: true
        }
      }, (error) => {
        console.info('=======>Acts_ShareExtensionAbility_1200 error.code ======>' + error.code);
        let commonEventData = {
          parameters: {
            num: error.code
          }
        };
        commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
          console.debug('====>Acts_ShareExtensionAbility_1200 publish err:' + JSON.stringify(err));
        });
      });
    }

    if (want.action === 'Acts_ShareExtensionAbility_1300') {
      console.info('=======>UIExtAbility onSessionCreate want.action == Acts_ShareExtensionAbility_1300======>');
      this.context.startAbilityForResult({
        action: 'Acts_ShareExtensionAbility_1300',
        bundleName: 'com.example.actsshareextensionabilitytest',
        abilityName: 'CalledAbility',
        parameters: {
          [wantConstant.Params.ABILITY_BACK_TO_OTHER_MISSION_STACK]: true
        }
      }, (error, data) => {
        console.info('=======>Acts_ShareExtensionAbility_1300 error.code ======>' + error.code);
        console.info('=======>Acts_ShareExtensionAbility_1300 data.resultCode ======>' + data.resultCode);
        console.info('=======>Acts_ShareExtensionAbility_1300 data.action ======>' + data.want.parameters.action);
        let commonEventData = {
          parameters: {
            num: error.code,
            str: data.want.parameters.action,
            result: data.resultCode
          }
        };
        commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
          console.debug('====>Acts_ShareExtensionAbility_1300 publish err:' + JSON.stringify(err));
        });
      });
    }

    if (want.action === 'Acts_ShareExtensionAbility_1400') {
      console.info('=======>UIExtAbility onSessionCreate want.action == Acts_ShareExtensionAbility_1300======>');
      this.context.startAbilityForResult({
        action: 'Acts_ShareExtensionAbility_1400',
        bundleName: 'com.example.actsshareextensionabilitytest',
        abilityName: 'CalledAbility',
        parameters: {
          [wantConstant.Params.ABILITY_BACK_TO_OTHER_MISSION_STACK]: true
        }
      }).then((data) => {
        console.info('=======>Acts_ShareExtensionAbility_1400 data.resultCode ======>' + data.resultCode);
        console.info('=======>Acts_ShareExtensionAbility_1400 data.action ======>' + data.want.parameters.action);
        let commonEventData = {
          parameters: {
            str: data.want.parameters.action,
            result: data.resultCode
          }
        };
        commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
          console.debug('====>Acts_ShareExtensionAbility_1400 publish err:' + JSON.stringify(err));
        });
      }).catch((error) => {
        console.info('=======>Acts_ShareExtensionAbility_1400 error.code ======>' + error.code);
      });
    }

    if (want.action === 'Acts_ShareExtensionAbility_1500') {
      console.info('=======>UIExtAbility onSessionCreate want.action == Acts_ShareExtensionAbility_1500======>');
      this.context.startAbilityForResult({
        action: 'Acts_ShareExtensionAbility_1500',
        bundleName: 'xxx.xxxxxxx.xxx',
        abilityName: 'CalledAbility',
        parameters: {
          [wantConstant.Params.ABILITY_BACK_TO_OTHER_MISSION_STACK]: true
        }
      }, (error, data) => {
        console.info('=======>Acts_ShareExtensionAbility_1500  first from own error.code ======>' + error.code);
        let commonEventData = {
          parameters: {
            num: error.code
          }
        };
        commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
          console.debug('====>Acts_ShareExtensionAbility_1500 first publish err:' + JSON.stringify(err));
        });
      });
    }

    if (want.action === 'Acts_ShareExtensionAbility_1600') {
      session.setReceiveDataCallback((data) => {
        let options = {
          parameters: {
            'result': data
          }
        };
        commonEvent.publish('setReceiveDataCallback', options, (err) => {
          console.log('Acts_ShareExtensionAbility_1600');
        });
      });
    }

    if (want.action === 'Acts_ShareExtensionAbility_1800') {
      console.info('=======>UIExtAbility onSessionCreate want.action == Acts_ShareExtensionAbility_1800======>');
      this.context.startAbility({
        action: 'Acts_ShareExtensionAbility_1800',
        bundleName: 'com.example.actsshareextensionabilitytest',
        abilityName: 'ActsShareExtensionAbility'
      }, (error, data) => {
        console.info('=======>Acts_ShareExtensionAbility_1800  first from own error.code ======>' + error.code);
        let commonEventData = {
          parameters: {
            num: error.code
          }
        };
        commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
          console.debug('====>Acts_ShareExtensionAbility_1800 first publish err:' + JSON.stringify(err));
        });
      });
    }

    if (want.action === 'Acts_ShareExtensionAbility_context') {
      console.info('=======>UIExtAbility onSessionCreate want.action == Acts_ShareExtensionAbility_context======>');

      let commonEventData = {
        parameters: {
          context: this.context
        }
      };
      commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
        console.debug('====>Acts_ShareExtensionAbility_context first publish err:' + JSON.stringify(err));
      });

    }

    if (want.action === 'Acts_ShareExtensionAbility_2200') {
      console.info('=======>UIExtAbility onSessionCreate want.action == Acts_ShareExtensionAbility_2200======>');
      console.info('Acts_ShareExtensionAbility_2200 resourceManager: ' + this.context.resourceManager);
      let commonEventData = {
        parameters: {
          resourceManager: this.context.resourceManager
        }
      };
      commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
        console.debug('====>Acts_ShareExtensionAbility_2200 first publish err:' + JSON.stringify(err));
      });
    }

    if (want.action === 'Acts_ShareExtensionAbility_2300') {
      console.info('=======>UIExtAbility onSessionCreate want.action == Acts_ShareExtensionAbility_2300======>');
      console.info('Acts_ShareExtensionAbility_2300 applicationInfo: ' + this.context.applicationInfo);
      let applicationInfo = this.context.applicationInfo;


      let commonEventData = {
        parameters: {
          name: applicationInfo.name,
          description_length: applicationInfo.description.length,
          descriptionId: applicationInfo.descriptionId,
          label: applicationInfo.label,
          labelId: applicationInfo.labelId,
          icon: applicationInfo.icon,
          iconId: applicationInfo.iconId,
          codePath: typeof (applicationInfo.codePath)
        }
      };
      commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
        console.debug('====>Acts_ShareExtensionAbility_2300 first publish err:' + JSON.stringify(err));
      });
    }

    if (want.action === 'Acts_ShareExtensionAbility_2400') {
      console.info('=======>UIExtAbility onSessionCreate want.action == Acts_ShareExtensionAbility_2400======>');

      let commonEventData = {
        parameters: {
          cacheDir: this.context.cacheDir
        }
      };
      commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
        console.debug('====>Acts_ShareExtensionAbility_2400 first publish err:' + JSON.stringify(err));
      });
    }

    if (want.action === 'Acts_ShareExtensionAbility_2500') {
      console.info('=======>UIExtAbility onSessionCreate want.action == Acts_ShareExtensionAbility_2500======>');

      let commonEventData = {
        parameters: {
          tempDir: this.context.tempDir
        }
      };
      commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
        console.debug('====>Acts_ShareExtensionAbility_2500 first publish err:' + JSON.stringify(err));
      });
    }

    if (want.action === 'Acts_ShareExtensionAbility_2600') {
      console.info('=======>UIExtAbility onSessionCreate want.action == Acts_ShareExtensionAbility_2600======>');

      let commonEventData = {
        parameters: {
          filesDir: this.context.filesDir
        }
      };
      commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
        console.debug('====>Acts_ShareExtensionAbility_2600 first publish err:' + JSON.stringify(err));
      });
    }

    if (want.action === 'Acts_ShareExtensionAbility_2700') {
      console.info('=======>UIExtAbility onSessionCreate want.action == Acts_ShareExtensionAbility_2700======>');

      let commonEventData = {
        parameters: {
          databaseDir: this.context.databaseDir
        }
      };
      commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
        console.debug('====>Acts_ShareExtensionAbility_2700 first publish err:' + JSON.stringify(err));
      });
    }

    if (want.action === 'Acts_ShareExtensionAbility_2800') {
      console.info('=======>UIExtAbility onSessionCreate want.action == Acts_ShareExtensionAbility_2800======>');

      let commonEventData = {
        parameters: {
          preferencesDir: this.context.preferencesDir
        }
      };
      commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
        console.debug('====>Acts_ShareExtensionAbility_2800 first publish err:' + JSON.stringify(err));
      });
    }

    if (want.action === 'Acts_ShareExtensionAbility_2900') {
      console.info('=======>UIExtAbility onSessionCreate want.action == Acts_ShareExtensionAbility_2900======>');

      let commonEventData = {
        parameters: {
          bundleCodeDir: this.context.bundleCodeDir
        }
      };
      commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
        console.debug('====>Acts_ShareExtensionAbility_2900 first publish err:' + JSON.stringify(err));
      });
    }

    if (want.action === 'Acts_ShareExtensionAbility_3000') {
      let moduleContext = this.context.createModuleContext('entry');
      let options = {
        parameters: {
          'bundleName': moduleContext.applicationInfo.name
        }
      };
      commonEvent.publish('ACTS_TEST_CONTEXT', options, (err) => {
        console.log('Acts_ShareExtensionAbility_context');
      });
    }

    if (want.action === 'Acts_ShareExtensionAbility_3100') {
      let moduleContext = this.context.createModuleContext('entry_test');
      let options = {
        parameters: {
          'bundleName': moduleContext.applicationInfo.name
        }
      };
      commonEvent.publish('ACTS_TEST_CONTEXT', options, (err) => {
        console.log('Acts_ShareExtensionAbility_context');
      });
    }

    if (want.action === 'Acts_ShareExtensionAbility_3200') {
      let moduleContext;
      try {
        moduleContext = this.context.createModuleContext('entry_assist');
      } catch {
        console.log('createModuleContext err');
      }
      let options = {
        parameters: {
          'moduleContext': moduleContext
        }
      };
      commonEvent.publish('ACTS_TEST_CONTEXT', options, (err) => {
        console.log('Acts_ShareExtensionAbility_context');
      });
    }

    if (want.action === 'Acts_ShareExtensionAbility_3300') {
      let moduleContext;
      try {
        moduleContext = this.context.createModuleContext('abc');
      } catch {
        console.log('createModuleContext err');
      }
      let options = {
        parameters: {
          'moduleContext': moduleContext
        }
      };
      commonEvent.publish('ACTS_TEST_CONTEXT', options, (err) => {
        console.log('Acts_ShareExtensionAbility_context');
      });
    }

    if (want.action === 'Acts_ShareExtensionAbility_3400') {
      let moduleContext;
      try {
        moduleContext = this.context.createModuleContext(undefined);
      } catch {
        console.log('createModuleContext err');
      }
      let options = {
        parameters: {
          'moduleContext': moduleContext
        }
      };
      commonEvent.publish('ACTS_TEST_CONTEXT', options, (err) => {
        console.log('Acts_ShareExtensionAbility_context');
      });
    }

    if (want.action === 'Acts_ShareExtensionAbility_3500') {
      let applicationContext = this.context.getApplicationContext();
      let options = {
        parameters: {
          'applicationContext': applicationContext
        }
      };
      commonEvent.publish('ACTS_TEST_CONTEXT', options, (err) => {
        console.log('Acts_ShareExtensionAbility_context');
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
    console.log('=====> UIExtAbility onForeground =====> ');
  }
};
