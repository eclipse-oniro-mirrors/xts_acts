/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium'
import { Want, common } from '@kit.AbilityKit';

let context: common.UIAbilityContext;
function sleep(time:number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve('ok');
    }, time)
  });
}

export default function abilityTest() {
  describe('connectAppServiceExtensionAbility', () => {
    beforeAll(() =>{
      context = AppStorage.get<common.UIAbilityContext>('abilityContext') as common.UIAbilityContext;
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_1000
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_1000
     * @tc.desc   UIAbilityContext connectAppServiceExtensionAbility 16000005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_1000', Level.LEVEL0, async (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_1000`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextensionrely',
        abilityName: 'AppServiceExtAbility3'
      }
      let options: common.ConnectOptions = {
        onConnect(elementName, remote) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect elementName: ${elementName}`);
        },
        onDisconnect(elementName) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect elementName: ${elementName}`);
        },
        onFailed(code) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code}`);
          expect(code).assertEqual(16000005);
          done();
        }
      };
      try {
        let data: number = context.connectAppServiceExtensionAbility(wantInfo, options);
        hilog.info(0x0000, 'testTag', `connectAppServiceExtensionAbility result: ${data}`);
      } catch (err) {
        hilog.info(0x0000, 'testTag', `connectAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_1100
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_1100
     * @tc.desc   UIAbilityContext connectAppServiceExtensionAbility 16000004.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_1100', Level.LEVEL0, async (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_1100`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextensionrely',
        abilityName: 'AppServiceExtAbility'
      };

      context.startAbility({
        bundleName: 'com.acts.context.aappserviceextensionrely',
        abilityName: 'MainAbility',
        parameters: {
          'action': 'start_AppServiceExtAbility'
        }
      }, (error)=> {
        hilog.info(0x0000, 'testTag', '%{public}s', `startAbility result: ${JSON.stringify(error)}`);
      });
      let options: common.ConnectOptions = {
        onConnect(elementName, remote) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect elementName: ${elementName}`)
        },
        onDisconnect(elementName) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect elementName: ${elementName}`);
        },
        onFailed(code) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code}`);
          let result: boolean = code === 801 || code === 16000004 || code === 16000201;
          expect(result).assertTrue();
          done();
        }
      };
      sleep(2000);
      try {
        let data: number = context.connectAppServiceExtensionAbility(wantInfo, options);
        hilog.info(0x0000, 'testTag', `connectAppServiceExtensionAbility result: ${data}`);
      } catch (err) {
        hilog.info(0x0000, 'testTag', `connectAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_1200
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_1200
     * @tc.desc   UIAbilityContext connectAppServiceExtensionAbility 16000002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_1200', Level.LEVEL0, async (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_1200`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'MyUIAbility',
      }
      let options: common.ConnectOptions = {
        onConnect(elementName, remote) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect elementName: ${elementName}`)
        },
        onDisconnect(elementName) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect elementName: ${elementName}`);
          done();
        },
        onFailed(code) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code}`);
          let result: boolean = code === 801 || code === 16000002;
          expect(result).assertTrue();
          done();
        }
      };
      try {
        let data: number = context.connectAppServiceExtensionAbility(wantInfo, options);
        hilog.info(0x0000, 'testTag', `connectAppServiceExtensionAbility result: ${data}`);
      } catch (err) {
        hilog.info(0x0000, 'testTag', `connectAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_1300
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_1300
     * @tc.desc   UIAbilityContext connectAppServiceExtensionAbility 16000050.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_1300', Level.LEVEL0, async (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_1300`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'AppServiceExtAbility',
        parameters: {
          'keyFd': { 'type': 'FD', 'value': -1 }
        }
      }
      let options: common.ConnectOptions = {
        onConnect(elementName, remote) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect elementName: ${elementName}`)
        },
        onDisconnect(elementName) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect elementName: ${elementName}`);
        },
        onFailed(code) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code}`);
          let result: boolean = code === 801 || code === 16000050;
          expect(result).assertTrue();
          done();
        }
      };
      try {
        let data: number = context.connectAppServiceExtensionAbility(wantInfo, options);
        hilog.info(0x0000, 'testTag', `connectAppServiceExtensionAbility result: ${data}`);
      } catch (err) {
        hilog.info(0x0000, 'testTag', `connectAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })
  })
}