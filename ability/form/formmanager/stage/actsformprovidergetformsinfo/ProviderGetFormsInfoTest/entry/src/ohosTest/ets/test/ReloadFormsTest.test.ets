/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import formProvider from '@ohos.app.form.formProvider';
import { BusinessError } from '@ohos.base';
import { common } from '@kit.AbilityKit';

function sleep(time: number): Promise<void> {
  return new Promise((resolve)=>setTimeout(resolve,time));
}

const moduleName: string = 'entry';
const abilityName: string = 'EntryFormAbility';
const formName: string = 'widget';

export default function ReloadFormsTest() {
  describe('ProviderReloadFormsTest', () => {
    /**
     * @tc.name   SUB_AA_OpenHarmony_ProviderReloadAllForms_0100
     * @tc.number SUB_AA_OpenHarmony_ProviderReloadAllForms_0100
     * @tc.desc   reloadAllForms()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_ProviderReloadAllForms_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let name: string = 'SUB_AA_OpenHarmony_ProviderReloadAllForms_0100';
      console.info(`${name} start`);
      let context: common.UIAbilityContext | undefined = await AppStorage.get<common.UIAbilityContext>("abilityContext");
      try {
        let reloadNum: number = await formProvider.reloadAllForms(context);
        console.info(`${name}` + " formProvider::reloadAllForms count: " + reloadNum);
        expect(reloadNum).assertEqual(9);
        await sleep(1000);
        done();
      } catch (err) {
        const businessError = err as BusinessError;
        console.error(`${name} formProvider::reloadAllForms failed: code is ${businessError?.code}, message is ${businessError?.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${name} end`);
    });

    /**
     * @tc.name   SUB_AA_OpenHarmony_ProviderReloadAllForms_0200
     * @tc.number SUB_AA_OpenHarmony_ProviderReloadAllForms_0200
     * @tc.desc   reloadAllForms()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_ProviderReloadAllForms_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let name: string = 'SUB_AA_OpenHarmony_ProviderReloadAllForms_0200';
      console.info(`${name} start`);
      try {
        await formProvider.reloadAllForms(undefined);
      } catch (err) {
        const businessError = err as BusinessError;
        console.error(`${name} formProvider::reloadAllForms failed: code is ${businessError?.code}, message is ${businessError?.message}`);
        expect(businessError.code).assertEqual(401);
        done();
      }
      console.info(`${name} end`);
    });

    /**
     * @tc.name   SUB_AA_OpenHarmony_ProviderReloadForms_0100
     * @tc.number SUB_AA_OpenHarmony_ProviderReloadForms_0100
     * @tc.desc   reloadForms()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_ProviderReloadForms_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let name: string = 'SUB_AA_OpenHarmony_ProviderReloadForms_0100';
      console.info(`${name} start`);
      let context: common.UIAbilityContext | undefined = await AppStorage.get<common.UIAbilityContext>("abilityContext");
      try {
        let reloadNum: number = await formProvider.reloadForms(context, moduleName, abilityName, formName);
        console.info(`${name}` + " formProvider::reloadForms count: " + reloadNum);
        expect(reloadNum).assertEqual(9);
        await sleep(1000);
        done();
      } catch (err) {
        const businessError = err as BusinessError;
        console.error(`${name} formProvider::reloadForms failed: code is ${businessError?.code}, message is ${businessError?.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${name} end`);
    });

    /**
     * @tc.name   SUB_AA_OpenHarmony_ProviderReloadForms_0200
     * @tc.number SUB_AA_OpenHarmony_ProviderReloadForms_0200
     * @tc.desc   reloadForms()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_ProviderReloadForms_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let name: string = 'SUB_AA_OpenHarmony_ProviderReloadForms_0200';
      console.info(`${name} start`);
      try {
        formProvider.reloadForms(undefined, moduleName, abilityName, formName);
        await sleep(1000);
        done();
      } catch (err) {
        const businessError = err as BusinessError;
        console.error(`${name} formProvider::reloadForms failed: code is ${businessError?.code}, message is ${businessError?.message}`);
        expect(businessError.code).assertEqual(401);
        done();
      }
      console.info(`${name} end`);
    });

    /**
     * @tc.name   SUB_AA_OpenHarmony_ProviderReloadForms_0300
     * @tc.number SUB_AA_OpenHarmony_ProviderReloadForms_0300
     * @tc.desc   reloadForms()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_ProviderReloadForms_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let name: string = 'SUB_AA_OpenHarmony_ProviderReloadForms_0300';
      console.info(`${name} start`);
      try {
        let context: common.UIAbilityContext | undefined = await AppStorage.get<common.UIAbilityContext>("abilityContext");
        formProvider.reloadForms(context, undefined, abilityName, formName);
        await sleep(1000);
        done();
      } catch (err) {
        const businessError = err as BusinessError;
        console.error(`${name} formProvider::reloadForms failed: code is ${businessError?.code}, message is ${businessError?.message}`);
        expect(businessError.code).assertEqual(401);
        done();
      }
      console.info(`${name} end`);
    });

    /**
     * @tc.name   SUB_AA_OpenHarmony_ProviderReloadForms_0400
     * @tc.number SUB_AA_OpenHarmony_ProviderReloadForms_0400
     * @tc.desc   reloadForms()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_ProviderReloadForms_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let name: string = 'SUB_AA_OpenHarmony_ProviderReloadForms_0400';
      console.info(`${name} start`);
      try {
        let context: common.UIAbilityContext | undefined = await AppStorage.get<common.UIAbilityContext>("abilityContext");
        formProvider.reloadForms(context, moduleName, undefined, formName);
        await sleep(1000);
        done();
      } catch (err) {
        const businessError = err as BusinessError;
        console.error(`${name} formProvider::reloadForms failed: code is ${businessError?.code}, message is ${businessError?.message}`);
        expect(businessError.code).assertEqual(401);
        done();
      }
      console.info(`${name} end`);
    });

    /**
     * @tc.name   SUB_AA_OpenHarmony_ProviderReloadForms_0500
     * @tc.number SUB_AA_OpenHarmony_ProviderReloadForms_0500
     * @tc.desc   reloadForms()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_ProviderReloadForms_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let name: string = 'SUB_AA_OpenHarmony_ProviderReloadForms_0500';
      console.info(`${name} start`);
      try {
        let context: common.UIAbilityContext | undefined = await AppStorage.get<common.UIAbilityContext>("abilityContext");
        formProvider.reloadForms(context, moduleName, abilityName, undefined);
        await sleep(1000);
        done();
      } catch (err) {
        const businessError = err as BusinessError;
        console.error(`${name} formProvider::reloadForms failed: code is ${businessError?.code}, message is ${businessError?.message}`);
        expect(businessError.code).assertEqual(401);
        done();
      }
      console.info(`${name} end`);
    });

    /**
     * @tc.name   SUB_AA_OpenHarmony_ProviderReloadForms_0600
     * @tc.number SUB_AA_OpenHarmony_ProviderReloadForms_0600
     * @tc.desc   reloadForms()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_ProviderReloadForms_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let name: string = 'SUB_AA_OpenHarmony_ProviderReloadForms_0600';
      console.info(`${name} start`);
      let context: common.UIAbilityContext | undefined = await AppStorage.get<common.UIAbilityContext>("abilityContext");
      formProvider.reloadForms(context, '', abilityName, formName).then( async (value: number) => {
        console.info(`${name}` + "formProvider::reloadForms value: " + value);
        expect(value).assertEqual(0);
        await sleep(1000);
        done();
      }).catch((err: BusinessError) => {
        console.error(`${name} formProvider::reloadForms failed: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      })
      console.info(`${name} end`);
    });

    /**
     * @tc.name   SUB_AA_OpenHarmony_ProviderReloadForms_0700
     * @tc.number SUB_AA_OpenHarmony_ProviderReloadForms_0700
     * @tc.desc   reloadForms()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_ProviderReloadForms_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let name: string = 'SUB_AA_OpenHarmony_ProviderReloadForms_0700';
      console.info(`${name} start`);
      let context: common.UIAbilityContext | undefined = await AppStorage.get<common.UIAbilityContext>("abilityContext");
      formProvider.reloadForms(context, moduleName, '', formName).then( async (value: number) => {
        console.info(`${name}` + "formProvider::reloadForms value: " + value);
        expect(value).assertEqual(0);
        await sleep(1000);
        done();
      }).catch((err: BusinessError) => {
        console.error(`${name} formProvider::reloadForms failed: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      })
      console.info(`${name} end`);
    });

    /**
     * @tc.name   SUB_AA_OpenHarmony_ProviderReloadForms_0800
     * @tc.number SUB_AA_OpenHarmony_ProviderReloadForms_0800
     * @tc.desc   reloadForms()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_ProviderReloadForms_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let name: string = 'SUB_AA_OpenHarmony_ProviderReloadForms_0800';
      console.info(`${name} start`);
      let context: common.UIAbilityContext | undefined = await AppStorage.get<common.UIAbilityContext>("abilityContext");
      formProvider.reloadForms(context, moduleName, abilityName, '').then( async (value: number) => {
        console.info(`${name}` + "formProvider::reloadForms value: " + value);
        expect(value).assertEqual(0);
        await sleep(1000);
        done();
      }).catch((err: BusinessError) => {
        console.error(`${name} formProvider::reloadForms failed: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      })
      console.info(`${name} end`);
    });
  })
}