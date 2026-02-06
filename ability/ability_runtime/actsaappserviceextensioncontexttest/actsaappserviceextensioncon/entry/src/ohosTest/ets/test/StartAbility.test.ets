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
import { BusinessError } from '@kit.BasicServicesKit';
import { JSON } from '@kit.ArkTS';

let context: common.UIAbilityContext;

export default function abilityTest() {
  describe('startAppServiceExtensionAbility', () => {
    beforeAll(() =>{
      context = AppStorage.get<common.UIAbilityContext>('abilityContext') as common.UIAbilityContext;
    })

    /**
     * @tc.number: SUB_AA_ABILITY_NewRule_AppServiceExtension_1400
     * @tc.name: SUB_AA_ABILITY_NewRule_AppServiceExtension_1400
     * @tc.desc: UIAbilityContext startAppServiceExtensionAbility 16000200.
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_1400', Level.LEVEL0, async(done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_1400`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} Begin`);
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextensionrely',
        abilityName: 'AppServiceExtAbility2',
      }
      try {
        context.startAppServiceExtensionAbility(wantInfo)
          .then(() => {
            hilog.info(0x0000, 'testTag', '%{public}s', `startAppServiceExtensionAbility succeed`);
            expect().assertFail();
            done();
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `startAppServiceExtensionAbility error: ${JSON.stringify(err)}`);
            let result: boolean = err.code === 801 || err.code === 16000200;
            expect(result).assertTrue();
            done();
        });
      } catch (err) {
        hilog.info(0x0000, 'testTag', '%{public}s', `startAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_AA_ABILITY_NewRule_AppServiceExtension_1500
     * @tc.name: SUB_AA_ABILITY_NewRule_AppServiceExtension_1500
     * @tc.desc: UIAbilityContext startAppServiceExtensionAbility 16000002.
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_1500', Level.LEVEL0, (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_1500`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} Begin`);
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'MyUIAbility',
      }
      try {
        context.startAppServiceExtensionAbility(wantInfo).then(() => {
          hilog.info(0x0000, 'testTag', '%{public}s', `startAppServiceExtensionAbility succeed`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `startAppServiceExtensionAbility error: ${JSON.stringify(err)}`);
          let result: boolean = err.code === 801 || err.code === 16000002;
          expect(result).assertTrue();
          done();
        });
      } catch (err) {
        hilog.info(0x0000, 'testTag', '%{public}s', `startAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_AA_ABILITY_NewRule_AppServiceExtension_1600
     * @tc.name: SUB_AA_ABILITY_NewRule_AppServiceExtension_1600
     * @tc.desc: UIAbilityContext startAppServiceExtensionAbility 16000050.
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_1600', Level.LEVEL0, (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_1600`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} Begin`);
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'AppServiceExtAbility',
        parameters: {
          'keyFd': { 'type': 'FD', 'value': -1 }
        }
      }
      try {
        context.startAppServiceExtensionAbility(wantInfo).then(() => {
          hilog.info(0x0000, 'testTag', '%{public}s', `startAppServiceExtensionAbility succeed`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `startAppServiceExtensionAbility error: ${JSON.stringify(err)}`);
          let result: boolean = err.code === 801 || err.code === 16000050;
          expect(result).assertTrue();
          done();
        });
      } catch (err) {
        hilog.info(0x0000, 'testTag', '%{public}s', `startAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_AA_ABILITY_NewRule_AppServiceExtension_1700
     * @tc.name: SUB_AA_ABILITY_NewRule_AppServiceExtension_1700
     * @tc.desc: UIAbilityContext startAppServiceExtensionAbility 16000005.
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_1700', Level.LEVEL0, (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_1700`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} Begin`);
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextensionrely',
        abilityName: 'AppServiceExtAbility3',
      }
      try {
        context.startAppServiceExtensionAbility(wantInfo).then(() => {
          hilog.info(0x0000, 'testTag', '%{public}s', `startAppServiceExtensionAbility succeed`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `startAppServiceExtensionAbility error: ${JSON.stringify(err)}`);
          let result: boolean = err.code === 801 || err.code === 16000005;
          expect(result).assertTrue();
          done();
        });
      } catch (err) {
        hilog.info(0x0000, 'testTag', '%{public}s', `startAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_AA_ABILITY_NewRule_AppServiceExtension_1800
     * @tc.name: SUB_AA_ABILITY_NewRule_AppServiceExtension_1800
     * @tc.desc: UIAbilityContext startAppServiceExtensionAbility 16000019.
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_1800', Level.LEVEL0, (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_1800`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} Begin`);
      let wantInfo: Want = {
        action: 'action',
        entities: ['entity'],
      }
      try {
        context.startAppServiceExtensionAbility(wantInfo).then(() => {
          hilog.info(0x0000, 'testTag', '%{public}s', `startAppServiceExtensionAbility succeed`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `startAppServiceExtensionAbility error: ${JSON.stringify(err)}`);
          let result: boolean = err.code === 801 || err.code === 16000019 || err.code === 201;
          expect(result).assertTrue();
          done();
        });
      } catch (err) {
        hilog.info(0x0000, 'testTag', '%{public}s', `startAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })
  })
}