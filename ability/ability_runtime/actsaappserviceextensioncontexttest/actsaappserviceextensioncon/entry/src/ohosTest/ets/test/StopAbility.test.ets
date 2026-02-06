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
  describe('stopAppServiceExtensionAbility', () => {
    beforeAll(() =>{
      context = AppStorage.get<common.UIAbilityContext>('abilityContext') as common.UIAbilityContext;
    })

    /**
     * @tc.number: SUB_AA_ABILITY_NewRule_AppServiceExtension_2700
     * @tc.name: SUB_AA_ABILITY_NewRule_AppServiceExtension_2700
     * @tc.desc: UIAbilityContext stopAppServiceExtensionAbility 16000200.
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_2700', Level.LEVEL0, async(done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_2700`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} Begin`);
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextensionrely',
        abilityName: 'AppServiceExtAbility2',
      }
      try {
        context.stopAppServiceExtensionAbility(wantInfo)
          .then(() => {
            hilog.info(0x0000, 'testTag', '%{public}s', `stopAppServiceExtensionAbility succeed`);
            expect().assertFail();
            done();
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `stopAppServiceExtensionAbility error: ${JSON.stringify(err)}`);
            let result: boolean = err.code === 801 || err.code === 16000200;
            expect(result).assertTrue();
            done();
          });
      } catch (err) {
        hilog.info(0x0000, 'testTag', '%{public}s', `stopAppServiceExtensionAbility failed:${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_AA_ABILITY_NewRule_AppServiceExtension_2800
     * @tc.name: SUB_AA_ABILITY_NewRule_AppServiceExtension_2800
     * @tc.desc: UIAbilityContext stopAppServiceExtensionAbility 16000002.
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_2800', Level.LEVEL0, (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_2800`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} Begin`);
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'MyUIAbility',
      }
      try {
        context.stopAppServiceExtensionAbility(wantInfo).then(() => {
          hilog.info(0x0000, 'testTag', '%{public}s', `stopAppServiceExtensionAbility succeed`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `stopAppServiceExtensionAbility error: ${JSON.stringify(err)}`);
          let result: boolean = err.code === 801 || err.code === 16000002;
          expect(result).assertTrue();
          done();
        });
      } catch (err) {
        hilog.info(0x0000, 'testTag', '%{public}s', `stopAppServiceExtensionAbility failed:${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_AA_ABILITY_NewRule_AppServiceExtension_2900
     * @tc.name: SUB_AA_ABILITY_NewRule_AppServiceExtension_2900
     * @tc.desc: UIAbilityContext stopAppServiceExtensionAbility 16000050.
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_2900', Level.LEVEL0, (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_2900`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} Begin`);
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'AppServiceExtAbility',
        parameters: {
          'keyFd': { 'type': 'FD', 'value': -1 }
        }
      }
      try {
        context.stopAppServiceExtensionAbility(wantInfo).then(() => {
          hilog.info(0x0000, 'testTag', '%{public}s', `stopAppServiceExtensionAbility succeed`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `stopAppServiceExtensionAbility error: ${JSON.stringify(err)}`);
          let result: boolean = err.code === 801 || err.code === 16000050;
          expect(result).assertTrue();
          done();
        });
      } catch (err) {
        hilog.info(0x0000, 'testTag', '%{public}s', `stopAppServiceExtensionAbility failed:${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_AA_ABILITY_NewRule_AppServiceExtension_3000
     * @tc.name: SUB_AA_ABILITY_NewRule_AppServiceExtension_3000
     * @tc.desc: UIAbilityContext stopAppServiceExtensionAbility 16000005.
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_3000', Level.LEVEL0, (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_3000`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} Begin`);
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextensionrely',
        abilityName: 'AppServiceExtAbility3',
      }
      try {
        context.stopAppServiceExtensionAbility(wantInfo).then(() => {
          hilog.info(0x0000, 'testTag', '%{public}s', `stopAppServiceExtensionAbility succeed`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `stopAppServiceExtensionAbility error: ${JSON.stringify(err)}`);
          let result: boolean = err.code === 801 || err.code === 16000005;
          expect(result).assertTrue();
          done();
        });
      } catch (err) {
        hilog.info(0x0000, 'testTag', '%{public}s', `stopAppServiceExtensionAbility failed:${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })
  })
}