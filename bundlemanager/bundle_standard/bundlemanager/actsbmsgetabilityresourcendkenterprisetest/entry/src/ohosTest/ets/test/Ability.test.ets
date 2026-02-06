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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import testNapi from 'libentry.so';
import { BusinessError } from '@kit.BasicServicesKit';

const DOMAIN: number = 0xFF00;
const ERROR201: number = 201;

export default function actsGetAbilityInfoTest() {
  describe('ActsGetAbilityInfoTest', () => {
    /** 
     * @tc.number Sub_Bms_Framework_GetAbilityInfo_0100
     * @tc.name Sub_Bms_Framework_GetAbilityInfo_0100
     * @tc.desc Test getAbilityResourceInfo with valid value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sub_Bms_Framework_GetAbilityInfo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let resourceInfo = testNapi.getAbilityResourceInfo(".pdf");
          hilog.info(DOMAIN, 'testTag', `Sub_Bms_Framework_GetAbilityResourceInfo_0100 getAbilityResourceInfo success,
            ResourceInfo is ${JSON.stringify(resourceInfo)}`);
          expect(resourceInfo[0]).assertEqual(48);
          expect(resourceInfo[1]).assertEqual(false);
          expect(resourceInfo[2]).assertEqual(0);
          expect(resourceInfo[3]).assertEqual("test label");
          expect(resourceInfo[4]).assertEqual("entry_test");
          expect(resourceInfo[5]).assertEqual("TestAbility");
          expect(resourceInfo[6]).assertEqual("com.acts.getabilityresourceinfo");
          expect(resourceInfo[7]).assertEqual(false);
          done();
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          let code = (err as BusinessError).code;
          hilog.info(DOMAIN, "testTag",
            `Sub_Bms_Framework_GetAbilityResourceInfo_0100 errData is errCode:${code} message:${errMsg}`);
          expect(err.code).assertEqual("201");
          done();
        }
      })
    /** 
     * @tc.number Sub_Bms_Framework_getBundleNameTest_0100
     * @tc.name Sub_Bms_Framework_getBundleNameTest_0100
     * @tc.desc Test getBundleNameTest with nullptr.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sub_Bms_Framework_getBundleNameTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let resourceInfo = testNapi.getBundleNameTest(null);
          hilog.info(DOMAIN, 'testTag', `Sub_Bms_Framework_getBundleNameTest_0100 success,
            ResourceInfo is ${JSON.stringify(resourceInfo)}`);
          expect(resourceInfo).assertEqual(401);
          done();
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          let code = (err as BusinessError).code;
          hilog.info(DOMAIN, "testTag",
            `Sub_Bms_Framework_getBundleNameTest_0100 errData is errCode:${code} message:${errMsg}`);
          expect(err.code).assertEqual("201");
          done();
        }
      })
    /** 
     * @tc.number Sub_Bms_Framework_getBundleNameTest_0200
     * @tc.name Sub_Bms_Framework_getBundleNameTest_0200
     * @tc.desc Test getBundleNameTest with exist file type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sub_Bms_Framework_getBundleNameTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let resourceInfo = testNapi.getBundleNameTest('.pdf');
          hilog.info(DOMAIN, 'testTag', `Sub_Bms_Framework_getBundleNameTest_0200 success,
            ResourceInfo is ${JSON.stringify(resourceInfo)}`);
          expect(resourceInfo).assertEqual(0);
          done();
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          let code = (err as BusinessError).code;
          hilog.info(DOMAIN, "testTag",
            `Sub_Bms_Framework_getBundleNameTest_0200 errData is errCode:${code} message:${errMsg}`);
          expect(err.code).assertEqual("201");
          done();
        }
      })
    /** 
     * @tc.number Sub_Bms_Framework_getModuleNameTest_0100
     * @tc.name Sub_Bms_Framework_getModuleNameTest_0100
     * @tc.desc Test getModuleNameTest with nullptr.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sub_Bms_Framework_getModuleNameTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let resourceInfo = testNapi.getModuleNameTest(null);
          hilog.info(DOMAIN, 'testTag', `Sub_Bms_Framework_getModuleNameTest_0100 success,
            ResourceInfo is ${JSON.stringify(resourceInfo)}`);
          expect(resourceInfo).assertEqual(401);
          done();
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          let code = (err as BusinessError).code;
          hilog.info(DOMAIN, "testTag",
            `Sub_Bms_Framework_getModuleNameTest_0100 errData is errCode:${code} message:${errMsg}`);
          expect(err.code).assertEqual("201");
          done();
        }
      })
    /** 
     * @tc.number Sub_Bms_Framework_getModuleNameTest_0200
     * @tc.name Sub_Bms_Framework_getModuleNameTest_0200
     * @tc.desc Test getModuleNameTest with exist file type.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sub_Bms_Framework_getModuleNameTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let resourceInfo = testNapi.getModuleNameTest('.pdf');
          hilog.info(DOMAIN, 'testTag', `Sub_Bms_Framework_getModuleNameTest_0200 success,
            ResourceInfo is ${JSON.stringify(resourceInfo)}`);
          expect(resourceInfo).assertEqual(0);
          done();
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          let code = (err as BusinessError).code;
          hilog.info(DOMAIN, "testTag",
            `Sub_Bms_Framework_getModuleNameTest_0200 errData is errCode:${code} message:${errMsg}`);
          expect(err.code).assertEqual("201");
          done();
        }
      })
    /** 
     * @tc.number Sub_Bms_Framework_getAbilityNameTest_0100
     * @tc.name Sub_Bms_Framework_getAbilityNameTest_0100
     * @tc.desc Test getAbilityNameTest with nullptr.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sub_Bms_Framework_getAbilityNameTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let resourceInfo = testNapi.getAbilityNameTest(null);
          hilog.info(DOMAIN, 'testTag', `Sub_Bms_Framework_getAbilityNameTest_0100 success,
            ResourceInfo is ${JSON.stringify(resourceInfo)}`);
          expect(resourceInfo).assertEqual(401);
          done();
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          let code = (err as BusinessError).code;
          hilog.info(DOMAIN, "testTag",
            `Sub_Bms_Framework_getAbilityNameTest_0100 errData is errCode:${code} message:${errMsg}`);
          expect(err.code).assertEqual("201");
          done();
        }
      })
    /** 
     * @tc.number Sub_Bms_Framework_getAbilityNameTest_0200
     * @tc.name Sub_Bms_Framework_getAbilityNameTest_0200
     * @tc.desc Test getAbilityNameTest with exist file type.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sub_Bms_Framework_getAbilityNameTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let resourceInfo = testNapi.getAbilityNameTest('.pdf');
          hilog.info(DOMAIN, 'testTag', `Sub_Bms_Framework_getAbilityNameTest_0200 success,
            ResourceInfo is ${JSON.stringify(resourceInfo)}`);
          expect(resourceInfo).assertEqual(0);
          done();
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          let code = (err as BusinessError).code;
          hilog.info(DOMAIN, "testTag",
            `Sub_Bms_Framework_getAbilityNameTest_0200 errData is errCode:${code} message:${errMsg}`);
          expect(err.code).assertEqual("201");
          done();
        }
      })
    /** 
     * @tc.number Sub_Bms_Framework_getLabelTest_0100
     * @tc.name Sub_Bms_Framework_getLabelTest_0100
     * @tc.desc Test getLabelTest with nullptr.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sub_Bms_Framework_getLabelTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let resourceInfo = testNapi.getLabelTest(null);
          hilog.info(DOMAIN, 'testTag', `Sub_Bms_Framework_getLabelTest_0100 success,
            ResourceInfo is ${JSON.stringify(resourceInfo)}`);
          expect(resourceInfo).assertEqual(401);
          done();
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          let code = (err as BusinessError).code;
          hilog.info(DOMAIN, "testTag",
            `Sub_Bms_Framework_getLabelTest_0100 errData is errCode:${code} message:${errMsg}`);
          expect(err.code).assertEqual("201");
          done();
        }
      })
    /** 
     * @tc.number Sub_Bms_Framework_getLabelTest_0200
     * @tc.name Sub_Bms_Framework_getLabelTest_0200
     * @tc.desc Test getLabelTest with exist file type.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sub_Bms_Framework_getLabelTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let resourceInfo = testNapi.getLabelTest('.pdf');
          hilog.info(DOMAIN, 'testTag', `Sub_Bms_Framework_getLabelTest_0200errData success,
            ResourceInfo is ${JSON.stringify(resourceInfo)}`);
          expect(resourceInfo).assertEqual(0);
          done();
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          let code = (err as BusinessError).code;
          hilog.info(DOMAIN, "testTag",
            `Sub_Bms_Framework_getLabelTest_0200errData is errCode:${code} message:${errMsg}`);
          expect(err.code).assertEqual("201");
          done();
        }
      })
    /** 
     * @tc.number Sub_Bms_Framework_getAppIndexTest_0100
     * @tc.name Sub_Bms_Framework_getAppIndexTest_0100
     * @tc.desc Test getAppIndexTest with nullptr.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sub_Bms_Framework_getAppIndexTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let resourceInfo = testNapi.getAppIndexTest(null);
          hilog.info(DOMAIN, 'testTag', `Sub_Bms_Framework_getAppIndexTest_0100 success,
            ResourceInfo is ${JSON.stringify(resourceInfo)}`);
          expect(resourceInfo).assertEqual(401);
          done();
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          let code = (err as BusinessError).code;
          hilog.info(DOMAIN, "testTag",
            `Sub_Bms_Framework_getAppIndexTest_0100 errData is errCode:${code} message:${errMsg}`);
          expect(err.code).assertEqual("201");
          done();
        }
      })
    /** 
     * @tc.number Sub_Bms_Framework_getAppIndexTest_0200
     * @tc.name Sub_Bms_Framework_getAppIndexTest_0200
     * @tc.desc Test getAppIndexTest with exist file type.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sub_Bms_Framework_getAppIndexTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let resourceInfo = testNapi.getAppIndexTest('.pdf');
          hilog.info(DOMAIN, 'testTag', `Sub_Bms_Framework_getAppIndexTest_0200 success,
            ResourceInfo is ${JSON.stringify(resourceInfo)}`);
          expect(resourceInfo).assertEqual(0);
          done();
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          let code = (err as BusinessError).code;
          hilog.info(DOMAIN, "testTag",
            `Sub_Bms_Framework_getAppIndexTest_0200 errData is errCode:${code} message:${errMsg}`);
          expect(err.code).assertEqual("201");
          done();
        }
      })
    /** 
     * @tc.number Sub_Bms_Framework_checkDefaultAppTest_0100
     * @tc.name Sub_Bms_Framework_checkDefaultAppTest_0100
     * @tc.desc Test checkDefaultAppTest with nullptr.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sub_Bms_Framework_checkDefaultAppTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let resourceInfo = testNapi.checkDefaultAppTest(null);
          hilog.info(DOMAIN, 'testTag', `Sub_Bms_Framework_checkDefaultAppTest_0100 success,
            ResourceInfo is ${JSON.stringify(resourceInfo)}`);
          expect(resourceInfo).assertEqual(401);
          done();
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          let code = (err as BusinessError).code;
          hilog.info(DOMAIN, "testTag",
            `Sub_Bms_Framework_checkDefaultAppTest_0100 errData is errCode:${code} message:${errMsg}`);
          expect(err.code).assertEqual("201");
          done();
        }
      })
    /** 
     * @tc.number Sub_Bms_Framework_checkDefaultAppTest_0200
     * @tc.name Sub_Bms_Framework_checkDefaultAppTest_0200
     * @tc.desc Test checkDefaultAppTest with exist file type.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sub_Bms_Framework_checkDefaultAppTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let resourceInfo = testNapi.checkDefaultAppTest('.pdf');
          hilog.info(DOMAIN, 'testTag', `Sub_Bms_Framework_checkDefaultAppTest_0200 success,
            ResourceInfo is ${JSON.stringify(resourceInfo)}`);
          expect(resourceInfo).assertEqual(0);
          done();
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          let code = (err as BusinessError).code;
          hilog.info(DOMAIN, "testTag",
            `Sub_Bms_Framework_checkDefaultAppTest_0200 errData is errCode:${code} message:${errMsg}`);
          expect(err.code).assertEqual("201");
          done();
        }
      })
    /** 
     * @tc.number Sub_Bms_Framework_getDrawableDescriptorTest_0100
     * @tc.name Sub_Bms_Framework_getDrawableDescriptorTest_0100
     * @tc.desc Test getDrawableDescriptorTest with nullptr.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sub_Bms_Framework_getDrawableDescriptorTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let resourceInfo = testNapi.getDrawableDescriptorTest(null);
          hilog.info(DOMAIN, 'testTag', `Sub_Bms_Framework_getDrawableDescriptorTest_0100 success,
            ResourceInfo is ${JSON.stringify(resourceInfo)}`);
          expect(resourceInfo).assertEqual(401);
          done();
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          let code = (err as BusinessError).code;
          hilog.info(DOMAIN, "testTag",
            `Sub_Bms_Framework_getDrawableDescriptorTest_0100 errData is errCode:${code} message:${errMsg}`);
          expect(err.code).assertEqual("201");
          done();
        }
      })
    /** 
     * @tc.number Sub_Bms_Framework_getDrawableDescriptorTest_0200
     * @tc.name Sub_Bms_Framework_getDrawableDescriptorTest_0200
     * @tc.desc Test getDrawableDescriptorTest with exist file type.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sub_Bms_Framework_getDrawableDescriptorTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let resourceInfo = testNapi.getDrawableDescriptorTest('.pdf');
          hilog.info(DOMAIN, 'testTag', `Sub_Bms_Framework_getDrawableDescriptorTest_0200 success,
            ResourceInfo is ${JSON.stringify(resourceInfo)}`);
          expect(resourceInfo).assertEqual(0);
          done();
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          let code = (err as BusinessError).code;
          hilog.info(DOMAIN, "testTag",
            `Sub_Bms_Framework_getDrawableDescriptorTest_0200 errData is errCode:${code} message:${errMsg}`);
          expect(err.code).assertEqual("201");
          done();
        }
      })
    /** 
     * @tc.number Sub_Bms_Framework_abilityResourceInfoDestroyTest_0100
     * @tc.name Sub_Bms_Framework_abilityResourceInfoDestroyTest_0100
     * @tc.desc Test abilityResourceInfoDestroyTest with nullptr.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sub_Bms_Framework_abilityResourceInfoDestroyTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let resourceInfo = testNapi.abilityResourceInfoDestroyTest(null);
          hilog.info(DOMAIN, 'testTag', `Sub_Bms_Framework_abilityResourceInfoDestroyTest_0100 success,
            ResourceInfo is ${JSON.stringify(resourceInfo)}`);
          expect(resourceInfo).assertEqual(401);
          done();
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          let code = (err as BusinessError).code;
          hilog.info(DOMAIN, "testTag",
            `Sub_Bms_Framework_abilityResourceInfoDestroyTest_0100 errData is errCode:${code} message:${errMsg}`);
          expect(err.code).assertEqual("201");
          done();
        }
      })
    /** 
     * @tc.number Sub_Bms_Framework_abilityResourceInfoDestroyTest_0200
     * @tc.name Sub_Bms_Framework_abilityResourceInfoDestroyTest_0200
     * @tc.desc Test abilityResourceInfoDestroyTest with exist file type.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sub_Bms_Framework_abilityResourceInfoDestroyTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let resourceInfo = testNapi.abilityResourceInfoDestroyTest('.pdf');
          hilog.info(DOMAIN, 'testTag', `Sub_Bms_Framework_abilityResourceInfoDestroyTest_0200 success,
            ResourceInfo is ${JSON.stringify(resourceInfo)}`);
          expect(resourceInfo).assertEqual(0);
          done();
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          let code = (err as BusinessError).code;
          hilog.info(DOMAIN, "testTag",
            `Sub_Bms_Framework_abilityResourceInfoDestroyTest_0200 errData is errCode:${code} message:${errMsg}`);
          expect(err.code).assertEqual("201");
          done();
        }
      })
    /** 
     * @tc.number Sub_Bms_Framework_getAbilityResourceErrorTest_0100
     * @tc.name Sub_Bms_Framework_getAbilityResourceErrorTest_0100
     * @tc.desc Test getAbilityResourceErrorTest with exist file type.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sub_Bms_Framework_getAbilityResourceErrorTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let resourceInfo = testNapi.getAbilityResourceErrorTest('.pdf');
          hilog.info(DOMAIN, 'testTag', `Sub_Bms_Framework_getAbilityResourceErrorTest_0100 success,
            ResourceInfo is ${JSON.stringify(resourceInfo)}`);
          if (resourceInfo == ERROR201) {
            expect(resourceInfo).assertEqual(ERROR201);
          } else {
            expect(resourceInfo).assertEqual(0);
          }
          done();
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          let code = (err as BusinessError).code;
          hilog.info(DOMAIN, "testTag",
            `Sub_Bms_Framework_getAbilityResourceErrorTest_0100 errData is errCode:${code} message:${errMsg}`);
          expect().assertFail();
          done();
        }
      })
  })
}