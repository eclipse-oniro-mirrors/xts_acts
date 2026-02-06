/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file expect in compliance with the License.
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
import launcherBundleManager from '@ohos.bundle.launcherBundleManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { BusinessError } from '@kit.BasicServicesKit';
import { osAccount } from '@kit.BasicServicesKit';
import { Want } from '@kit.AbilityKit';
import bundleManager from '@ohos.bundle.bundleManager';

const BUNDLE_NAME100 = 'ohos.acts.bms.getabilityinfo.test';
const ERROR_CODE17700003: number = 17700003;
const ERROR401: number = 401;
const ERROR201: number = 201;
const DOMAIN: number = 0xFF00;
const PARAM_0: number = 0;
const URI_0100 = "abcde://urigetabilityinfotest";

export default function actsGetAbilityInfoTest() {
  describe('ActsGetAbilityInfoTest', () => {
    /**
     * @tc.name   Sub_Bms_Framework_GetAbilityInfo_0100
     * @tc.number Sub_Bms_Framework_GetAbilityInfo_0100
     * @tc.desc   Test getAbilityInfo with valid value GET_ABILITY_INFO_DEFAULT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Bms_Framework_GetAbilityInfo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try{
        let uri = URI_0100;
        let abilityFlags: bundleManager.AbilityFlag = bundleManager.AbilityFlag.GET_ABILITY_INFO_DEFAULT;
        bundleManager.getAbilityInfo(uri, abilityFlags).then((abilityInfos: Array<bundleManager.AbilityInfo>) => {
          hilog.info(DOMAIN, 'Sub_Bms_Framework_GetAbilityInfo_0100', `getAbilityInfo() success,
            abilityInfos is ${JSON.stringify(abilityInfos)}`);
          expect(abilityInfos.length).assertLarger(PARAM_0);
          for (let index = 0; index < abilityInfos.length; index++) {
            expect(abilityInfos[index].bundleName).assertEqual(BUNDLE_NAME100);
            expect(abilityInfos[index].moduleName).assertEqual("entry");
            expect(abilityInfos[index].name).assertEqual("EntryAbility");
            expect(abilityInfos[index].label).assertEqual("label");
            expect(abilityInfos[index].labelId).assertLarger(PARAM_0);
            expect(abilityInfos[index].description).assertEqual("$string:EntryAbility_desc");
            expect(abilityInfos[index].descriptionId).assertLarger(PARAM_0);
            expect(abilityInfos[index].icon).assertEqual("$media:icon");
            expect(abilityInfos[index].iconId).assertLarger(PARAM_0);
            expect(abilityInfos[index].process).assertEqual("");
            expect(abilityInfos[index].exported).assertEqual(true);
            expect(abilityInfos[index].orientation).assertEqual(PARAM_0);
            expect(abilityInfos[index].launchType).assertEqual(PARAM_0);
            expect(abilityInfos[index].permissions.length).assertEqual(PARAM_0);
            expect(abilityInfos[index].deviceTypes.length).assertEqual(PARAM_0);
            expect(abilityInfos[index].applicationInfo).assertEqual(null);
            expect(abilityInfos[index].metadata.length).assertEqual(PARAM_0);
            expect(abilityInfos[index].enabled).assertEqual(true);
            expect(abilityInfos[index].supportWindowModes.length).assertLarger(PARAM_0);
            expect(abilityInfos[index].windowSize.maxWindowRatio).assertEqual(PARAM_0);
            expect(abilityInfos[index].windowSize.minWindowRatio).assertEqual(PARAM_0);
            expect(abilityInfos[index].windowSize.maxWindowWidth).assertEqual(PARAM_0);
            expect(abilityInfos[index].windowSize.minWindowWidth).assertEqual(PARAM_0);
            expect(abilityInfos[index].windowSize.maxWindowHeight).assertEqual(PARAM_0);
            expect(abilityInfos[index].windowSize.minWindowHeight).assertEqual(PARAM_0);
            expect(abilityInfos[index].excludeFromDock).assertEqual(false);
            expect(abilityInfos[index].skills.length).assertEqual(PARAM_0);
            expect(abilityInfos[index].appIndex).assertEqual(PARAM_0);
            expect(abilityInfos[index].orientationId).assertEqual(PARAM_0);
          }
          done();
        }).catch((err: BusinessError) => {
          hilog.info(DOMAIN, 'Sub_Bms_Framework_GetAbilityInfo_0100', `getAbilityInfo() error,
            errData is errCode:${err.code}  message:${err.message}`);
          expect(err.code).assertEqual(ERROR201);
          done();
        });
      } catch (errData) {
        let errMsg = (errData as BusinessError).message;
        let code = (errData as BusinessError).code;
        hilog.info(DOMAIN, "Sub_Bms_Framework_GetAbilityInfo_0100", `errData is errCode:${code} message:${errMsg}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   Sub_Bms_Framework_GetAbilityInfo_0200
     * @tc.number Sub_Bms_Framework_GetAbilityInfo_0200
     * @tc.desc   Test getAbilityInfo with parameter GET_ABILITY_INFO_WITH_PERMISSION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Bms_Framework_GetAbilityInfo_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        let uri = URI_0100;
        let abilityFlags: bundleManager.AbilityFlag = bundleManager.AbilityFlag.GET_ABILITY_INFO_WITH_PERMISSION;
        bundleManager.getAbilityInfo(uri, abilityFlags).then((abilityInfos: Array<bundleManager.AbilityInfo>) => {
          hilog.info(DOMAIN, '0200', 'getAbilityInfo() success, data is' + JSON.stringify(abilityInfos));
          expect(abilityInfos.length).assertLarger(PARAM_0);
          for (let index = 0; index < abilityInfos.length; index++) {
            expect(abilityInfos[index].bundleName).assertEqual(BUNDLE_NAME100);
            expect(abilityInfos[index].moduleName).assertEqual("entry");
            expect(abilityInfos[index].name).assertEqual("EntryAbility");
            expect(abilityInfos[index].label).assertEqual("label");
            expect(abilityInfos[index].labelId).assertLarger(PARAM_0);
            expect(abilityInfos[index].description).assertEqual("$string:EntryAbility_desc");
            expect(abilityInfos[index].descriptionId).assertLarger(PARAM_0);
            expect(abilityInfos[index].icon).assertEqual("$media:icon");
            expect(abilityInfos[index].iconId).assertLarger(PARAM_0);
            expect(abilityInfos[index].process).assertEqual("");
            expect(abilityInfos[index].exported).assertEqual(true);
            expect(abilityInfos[index].orientation).assertEqual(PARAM_0);
            expect(abilityInfos[index].launchType).assertEqual(PARAM_0);
            expect(abilityInfos[index].permissions.length).assertEqual(PARAM_0);
            expect(abilityInfos[index].deviceTypes.length).assertEqual(PARAM_0);
            expect(abilityInfos[index].applicationInfo).assertEqual(null);
            expect(abilityInfos[index].metadata.length).assertEqual(PARAM_0);
            expect(abilityInfos[index].enabled).assertEqual(true);
            expect(abilityInfos[index].supportWindowModes.length).assertLarger(PARAM_0);
            expect(abilityInfos[index].windowSize.maxWindowRatio).assertEqual(PARAM_0);
            expect(abilityInfos[index].windowSize.minWindowRatio).assertEqual(PARAM_0);
            expect(abilityInfos[index].windowSize.maxWindowWidth).assertEqual(PARAM_0);
            expect(abilityInfos[index].windowSize.minWindowWidth).assertEqual(PARAM_0);
            expect(abilityInfos[index].windowSize.maxWindowHeight).assertEqual(PARAM_0);
            expect(abilityInfos[index].windowSize.minWindowHeight).assertEqual(PARAM_0);
            expect(abilityInfos[index].excludeFromDock).assertEqual(false);
            expect(abilityInfos[index].skills.length).assertEqual(PARAM_0);
            expect(abilityInfos[index].appIndex).assertEqual(PARAM_0);
            expect(abilityInfos[index].orientationId).assertEqual(PARAM_0);
          }
          done();
        }).catch((err: BusinessError) => {
          hilog.info(DOMAIN, 'Sub_Bms_Framework_GetAbilityInfo_0200', `getAbilityInfo() error,
            errData is errCode:${err.code}  message:${err.message}`);
          expect(err.code).assertEqual(ERROR201);
          done();
        });
      } catch (errData) {
        let errMsg = (errData as BusinessError).message;
        let code = (errData as BusinessError).code;
        hilog.info(DOMAIN, "Sub_Bms_Framework_GetAbilityInfo_0200", `errData is errCode:${code} message:${errMsg}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   Sub_Bms_Framework_GetAbilityInfo_0300
     * @tc.number Sub_Bms_Framework_GetAbilityInfo_0300
     * @tc.desc   Test getAbilityInfo with parameter GET_ABILITY_INFO_WITH_APPLICATION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Bms_Framework_GetAbilityInfo_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        let uri = URI_0100;
        let abilityFlags: bundleManager.AbilityFlag = bundleManager.AbilityFlag.GET_ABILITY_INFO_WITH_APPLICATION;
        bundleManager.getAbilityInfo(uri, abilityFlags).then((abilityInfos: Array<bundleManager.AbilityInfo>) => {
          hilog.info(DOMAIN, '0300', 'getAbilityInfo() success, data is' + JSON.stringify(abilityInfos));
          expect(abilityInfos.length).assertLarger(PARAM_0);
          for (let index = 0; index < abilityInfos.length; index++) {
            expect(abilityInfos[index].bundleName).assertEqual(BUNDLE_NAME100);
            expect(abilityInfos[index].moduleName).assertEqual("entry");
            expect(abilityInfos[index].name).assertEqual("EntryAbility");
            expect(abilityInfos[index].label).assertEqual("label");
            expect(abilityInfos[index].labelId).assertLarger(PARAM_0);
            expect(abilityInfos[index].description).assertEqual("$string:EntryAbility_desc");
            expect(abilityInfos[index].descriptionId).assertLarger(PARAM_0);
            expect(abilityInfos[index].icon).assertEqual("$media:icon");
            expect(abilityInfos[index].iconId).assertLarger(PARAM_0);
            expect(abilityInfos[index].process).assertEqual("");
            expect(abilityInfos[index].exported).assertEqual(true);
            expect(abilityInfos[index].orientation).assertEqual(PARAM_0);
            expect(abilityInfos[index].launchType).assertEqual(PARAM_0);
            expect(abilityInfos[index].permissions.length).assertEqual(PARAM_0);
            expect(abilityInfos[index].deviceTypes.length).assertEqual(PARAM_0);
            expect(abilityInfos[index].applicationInfo).not().assertNull();
            expect(abilityInfos[index].metadata.length).assertEqual(PARAM_0);
            expect(abilityInfos[index].enabled).assertEqual(true);
            expect(abilityInfos[index].supportWindowModes.length).assertLarger(PARAM_0);
            expect(abilityInfos[index].windowSize.maxWindowRatio).assertEqual(PARAM_0);
            expect(abilityInfos[index].windowSize.minWindowRatio).assertEqual(PARAM_0);
            expect(abilityInfos[index].windowSize.maxWindowWidth).assertEqual(PARAM_0);
            expect(abilityInfos[index].windowSize.minWindowWidth).assertEqual(PARAM_0);
            expect(abilityInfos[index].windowSize.maxWindowHeight).assertEqual(PARAM_0);
            expect(abilityInfos[index].windowSize.minWindowHeight).assertEqual(PARAM_0);
            expect(abilityInfos[index].excludeFromDock).assertEqual(false);
            expect(abilityInfos[index].skills.length).assertEqual(PARAM_0);
            expect(abilityInfos[index].appIndex).assertEqual(PARAM_0);
            expect(abilityInfos[index].orientationId).assertEqual(PARAM_0);
          }
          done();
        }).catch((err: BusinessError) => {
          hilog.info(DOMAIN, 'Sub_Bms_Framework_GetAbilityInfo_0300', `getAbilityInfo() error,
            errData is errCode:${err.code}  message:${err.message}`);
          expect(err.code).assertEqual(ERROR201);
          done();
        });
      } catch (errData) {
        let errMsg = (errData as BusinessError).message;
        let code = (errData as BusinessError).code;
        hilog.info(DOMAIN, "Sub_Bms_Framework_GetAbilityInfo_0300", `errData is errCode:${code} message:${errMsg}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   Sub_Bms_Framework_GetAbilityInfo_0400
     * @tc.number Sub_Bms_Framework_GetAbilityInfo_0400
     * @tc.desc   Test getAbilityInfo with parameter GET_ABILITY_INFO_WITH_METADATA.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Bms_Framework_GetAbilityInfo_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        let uri = URI_0100;
        let abilityFlags: bundleManager.AbilityFlag = bundleManager.AbilityFlag.GET_ABILITY_INFO_WITH_METADATA;
        bundleManager.getAbilityInfo(uri, abilityFlags).then((abilityInfos: Array<bundleManager.AbilityInfo>) => {
          hilog.info(DOMAIN, '0400', 'getAbilityInfo() success, data is' + JSON.stringify(abilityInfos));
          expect(abilityInfos.length).assertLarger(PARAM_0);
          for (let index = 0; index < abilityInfos.length; index++) {
            expect(abilityInfos[index].bundleName).assertEqual(BUNDLE_NAME100);
            expect(abilityInfos[index].moduleName).assertEqual("entry");
            expect(abilityInfos[index].name).assertEqual("EntryAbility");
            expect(abilityInfos[index].label).assertEqual("label");
            expect(abilityInfos[index].labelId).assertLarger(PARAM_0);
            expect(abilityInfos[index].description).assertEqual("$string:EntryAbility_desc");
            expect(abilityInfos[index].descriptionId).assertLarger(PARAM_0);
            expect(abilityInfos[index].icon).assertEqual("$media:icon");
            expect(abilityInfos[index].iconId).assertLarger(PARAM_0);
            expect(abilityInfos[index].process).assertEqual("");
            expect(abilityInfos[index].exported).assertEqual(true);
            expect(abilityInfos[index].orientation).assertEqual(PARAM_0);
            expect(abilityInfos[index].launchType).assertEqual(PARAM_0);
            expect(abilityInfos[index].permissions.length).assertEqual(PARAM_0);
            expect(abilityInfos[index].deviceTypes.length).assertEqual(PARAM_0);
            expect(abilityInfos[index].applicationInfo).assertEqual(null);
            expect(abilityInfos[index].metadata.length).assertEqual(PARAM_0);
            expect(abilityInfos[index].enabled).assertEqual(true);
            expect(abilityInfos[index].excludeFromDock).assertEqual(false);
            expect(abilityInfos[index].supportWindowModes.length).assertLarger(PARAM_0);
            expect(abilityInfos[index].windowSize.maxWindowRatio).assertEqual(PARAM_0);
            expect(abilityInfos[index].windowSize.minWindowRatio).assertEqual(PARAM_0);
            expect(abilityInfos[index].windowSize.maxWindowWidth).assertEqual(PARAM_0);
            expect(abilityInfos[index].windowSize.minWindowWidth).assertEqual(PARAM_0);
            expect(abilityInfos[index].windowSize.maxWindowHeight).assertEqual(PARAM_0);
            expect(abilityInfos[index].windowSize.minWindowHeight).assertEqual(PARAM_0);
            expect(abilityInfos[index].skills.length).assertEqual(PARAM_0);
            expect(abilityInfos[index].appIndex).assertEqual(PARAM_0);
            expect(abilityInfos[index].orientationId).assertEqual(PARAM_0);
          }
          done();
        }).catch((err: BusinessError) => {
          hilog.info(DOMAIN, 'Sub_Bms_Framework_GetAbilityInfo_0400', `getAbilityInfo() error,
            errData is errCode:${err.code}  message:${err.message}`);
          expect(err.code).assertEqual(ERROR201);
          done();
        });
      } catch (errData) {
        let errMsg = (errData as BusinessError).message;
        let code = (errData as BusinessError).code;
        hilog.info(DOMAIN, "Sub_Bms_Framework_GetAbilityInfo_0400", `errData is errCode:${code} message:${errMsg}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   Sub_Bms_Framework_GetAbilityInfo_0700
     * @tc.number Sub_Bms_Framework_GetAbilityInfo_0700
     * @tc.desc   Test getAbilityInfo with parameter GET_ABILITY_INFO_WITH_SKILL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Bms_Framework_GetAbilityInfo_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        let uri = URI_0100;
        let abilityFlags: bundleManager.AbilityFlag = bundleManager.AbilityFlag.GET_ABILITY_INFO_WITH_SKILL;
        bundleManager.getAbilityInfo(uri, abilityFlags).then((abilityInfos: Array<bundleManager.AbilityInfo>) => {
          expect(abilityInfos.length).assertLarger(PARAM_0);
          for (let index = 0; index < abilityInfos.length; index++) {
            expect(abilityInfos[index].bundleName).assertEqual(BUNDLE_NAME100);
            expect(abilityInfos[index].moduleName).assertEqual("entry");
            expect(abilityInfos[index].name).assertEqual("EntryAbility");
            expect(abilityInfos[index].label).assertEqual("label");
            expect(abilityInfos[index].labelId).assertLarger(PARAM_0);
            expect(abilityInfos[index].description).assertEqual("$string:EntryAbility_desc");
            expect(abilityInfos[index].descriptionId).assertLarger(PARAM_0);
            expect(abilityInfos[index].icon).assertEqual("$media:icon");
            expect(abilityInfos[index].iconId).assertLarger(PARAM_0);
            expect(abilityInfos[index].process).assertEqual("");
            expect(abilityInfos[index].exported).assertEqual(true);
            expect(abilityInfos[index].orientation).assertEqual(PARAM_0);
            expect(abilityInfos[index].launchType).assertEqual(PARAM_0);
            expect(abilityInfos[index].permissions.length).assertEqual(PARAM_0);
            expect(abilityInfos[index].deviceTypes.length).assertEqual(PARAM_0);
            expect(abilityInfos[index].applicationInfo).assertEqual(null);
            expect(abilityInfos[index].metadata.length).assertEqual(PARAM_0);
            expect(abilityInfos[index].enabled).assertEqual(true);
            expect(abilityInfos[index].supportWindowModes.length).assertLarger(PARAM_0);
            expect(abilityInfos[index].windowSize.maxWindowRatio).assertEqual(PARAM_0);
            expect(abilityInfos[index].windowSize.minWindowRatio).assertEqual(PARAM_0);
            expect(abilityInfos[index].windowSize.maxWindowWidth).assertEqual(PARAM_0);
            expect(abilityInfos[index].windowSize.minWindowWidth).assertEqual(PARAM_0);
            expect(abilityInfos[index].windowSize.maxWindowHeight).assertEqual(PARAM_0);
            expect(abilityInfos[index].windowSize.minWindowHeight).assertEqual(PARAM_0);
            expect(abilityInfos[index].excludeFromDock).assertEqual(false);
            expect(abilityInfos[index].skills.length).assertLarger(PARAM_0);
          }
          done();
        }).catch((err: BusinessError) => {
          hilog.info(DOMAIN, 'Sub_Bms_Framework_GetAbilityInfo_0700', `getAbilityInfo() error,
            errData is errCode:${err.code}  message:${err.message}`);
          expect(err.code).assertEqual(ERROR201);
          done();
        });
      } catch (errData) {
        let errMsg = (errData as BusinessError).message;
        let code = (errData as BusinessError).code;
        hilog.info(DOMAIN, "Sub_Bms_Framework_GetAbilityInfo_0700", `errData is errCode:${code} message:${errMsg}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   Sub_Bms_Framework_GetAbilityInfo_1200
     * @tc.number Sub_Bms_Framework_GetAbilityInfo_1200
     * @tc.desc   Test getAbilityInfo with parameter invaild ERROR_CODE17700003.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Bms_Framework_GetAbilityInfo_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        let uri = "notexist Uri";
        let abilityFlags: bundleManager.AbilityFlag = bundleManager.AbilityFlag.GET_ABILITY_INFO_DEFAULT;
        bundleManager.getAbilityInfo(uri, abilityFlags).then((abilityInfos: Array<bundleManager.AbilityInfo>) => {
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          let code = (err as BusinessError).code;
          hilog.info(DOMAIN, 'Sub_Bms_Framework_GetAbilityInfo_1200', `getAbilityInfo() error,
            err is errCode:${err.code}  message:${err.message}`);
          if (err.code === ERROR201)
          {
            expect(err.code).assertEqual(ERROR201);
            done();
          } else {
            expect(err.code).assertEqual(ERROR_CODE17700003);
            done();
          }
        });
      } catch (errData) {
        let errMsg = (errData as BusinessError).message;
        let code = (errData as BusinessError).code;
        hilog.info(DOMAIN, "Sub_Bms_Framework_GetAbilityInfo_1200", `errData is errCode:${code} message:${errMsg}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   Sub_Bms_Framework_GetAbilityInfo_1600
     * @tc.number Sub_Bms_Framework_GetAbilityInfo_1600
     * @tc.desc   Test getAbilityInfo with parameter uri null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Bms_Framework_GetAbilityInfo_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        let uri = null;
        let abilityFlags: bundleManager.AbilityFlag = bundleManager.AbilityFlag.GET_ABILITY_INFO_DEFAULT;
        bundleManager.getAbilityInfo(uri, abilityFlags).then((abilityInfos: Array<bundleManager.AbilityInfo>) => {
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          let code = (err as BusinessError).code;
          hilog.info(DOMAIN, 'Sub_Bms_Framework_GetAbilityInfo_1600', `getAbilityInfo() error,
            err is errCode:${err.code}  message:${err.message}`);
          expect().assertFail();
          done();
        });
      } catch (errData) {
        let errMsg = (errData as BusinessError).message;
        let code = (errData as BusinessError).code;
        hilog.info(DOMAIN, "Sub_Bms_Framework_GetAbilityInfo_1600", `errData is errCode:${code} message:${errMsg}`);
        expect(code).assertEqual(ERROR401);
        done();
      }
    })

    /**
     * @tc.name   Sub_Bms_Framework_GetAbilityInfo_1700
     * @tc.number Sub_Bms_Framework_GetAbilityInfo_1700
     * @tc.desc   Test getAbilityInfo with parameter uri undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Bms_Framework_GetAbilityInfo_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        let uri = undefined;
        let abilityFlags: bundleManager.AbilityFlag = bundleManager.AbilityFlag.GET_ABILITY_INFO_DEFAULT;
        bundleManager.getAbilityInfo(uri, abilityFlags).then((abilityInfos: Array<bundleManager.AbilityInfo>) => {
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          let code = (err as BusinessError).code;
          hilog.info(DOMAIN, 'Sub_Bms_Framework_GetAbilityInfo_1700', `getAbilityInfo() error,
            err is errCode:${err.code}  message:${err.message}`);
          expect().assertFail();
          done();
        });
      } catch (errData) {
        let errMsg = (errData as BusinessError).message;
        let code = (errData as BusinessError).code;
        hilog.info(DOMAIN, "Sub_Bms_Framework_GetAbilityInfo_1700", `errData is errCode:${code} message:${errMsg}`);
        expect(code).assertEqual(ERROR401);
        done();
      }
    })

    /**
     * @tc.name   Sub_Bms_Framework_GetAbilityInfo_1800
     * @tc.number Sub_Bms_Framework_GetAbilityInfo_1800
     * @tc.desc   Test getAbilityInfo with parameter uri "" invaild ERROR_CODE17700003.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Bms_Framework_GetAbilityInfo_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        let uri = "";
        let abilityFlags: bundleManager.AbilityFlag = bundleManager.AbilityFlag.GET_ABILITY_INFO_DEFAULT;
        bundleManager.getAbilityInfo(uri, abilityFlags).then((abilityInfos: Array<bundleManager.AbilityInfo>) => {
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          let code = (err as BusinessError).code;
          hilog.info(DOMAIN, 'Sub_Bms_Framework_GetAbilityInfo_1800', `getAbilityInfo() error,
            err is errCode:${err.code}  message:${err.message}`);
          expect().assertFail();
          done();
        });
      } catch (errData) {
        let errMsg = (errData as BusinessError).message;
        let code = (errData as BusinessError).code;
        hilog.info(DOMAIN, "Sub_Bms_Framework_GetAbilityInfo_1800", `errData is errCode:${code} message:${errMsg}`);
        expect(code).assertEqual(ERROR_CODE17700003);
        done();
      }
    })

    /**
     * @tc.name   Sub_Bms_Framework_GetAbilityInfo_1900
     * @tc.number Sub_Bms_Framework_GetAbilityInfo_1900
     * @tc.desc   Test getAbilityInfo with parameter AbilityFlag null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Bms_Framework_GetAbilityInfo_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        let uri = URI_0100;
        bundleManager.getAbilityInfo(uri, null).then((abilityInfos: Array<bundleManager.AbilityInfo>) => {
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          let code = (err as BusinessError).code;
          hilog.info(DOMAIN, 'Sub_Bms_Framework_GetAbilityInfo_1900', `getAbilityInfo() error,
            err is errCode:${err.code}  message:${err.message}`);
          expect().assertFail();
          done();
        });
      } catch (errData) {
        let errMsg = (errData as BusinessError).message;
        let code = (errData as BusinessError).code;
        hilog.info(DOMAIN, "Sub_Bms_Framework_GetAbilityInfo_1900", `errData is errCode:${code} message:${errMsg}`);
        expect(code).assertEqual(ERROR401);
        done();
      }
    })

    /**
     * @tc.name   Sub_Bms_Framework_GetAbilityInfo_2000
     * @tc.number Sub_Bms_Framework_GetAbilityInfo_2000
     * @tc.desc   Test getAbilityInfo with parameter AbilityFlag undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Bms_Framework_GetAbilityInfo_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        let uri = URI_0100;
        bundleManager.getAbilityInfo(uri, undefined).then((abilityInfos: Array<bundleManager.AbilityInfo>) => {
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          let code = (err as BusinessError).code;
          hilog.info(DOMAIN, 'Sub_Bms_Framework_GetAbilityInfo_2000', `getAbilityInfo() error,
            err is errCode:${err.code}  message:${err.message}`);
          expect().assertFail();
          done();
        });
      } catch (errData) {
        let errMsg = (errData as BusinessError).message;
        let code = (errData as BusinessError).code;
        hilog.info(DOMAIN, "Sub_Bms_Framework_GetAbilityInfo_2000", `errData is errCode:${code} message:${errMsg}`);
        expect(code).assertEqual(ERROR401);
        done();
      }
    })

    /**
     * @tc.name   Sub_Bms_Framework_GetAbilityInfo_2100
     * @tc.number Sub_Bms_Framework_GetAbilityInfo_2100
     * @tc.desc   Test getAbilityInfo with valid value GET_ABILITY_INFO_WITH_DISABLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Bms_Framework_GetAbilityInfo_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        let uri = URI_0100;
        let abilityFlags: bundleManager.AbilityFlag = bundleManager.AbilityFlag.GET_ABILITY_INFO_WITH_DISABLE;
        bundleManager.getAbilityInfo(uri, abilityFlags).then((abilityInfos: Array<bundleManager.AbilityInfo>) => {
          expect(abilityInfos.length).assertLarger(PARAM_0);
          for (let index = 0; index < abilityInfos.length; index++) {
            expect(abilityInfos[index].bundleName).assertEqual(BUNDLE_NAME100);
            expect(abilityInfos[index].moduleName).assertEqual("entry");
            expect(abilityInfos[index].name).assertEqual("EntryAbility");
            expect(abilityInfos[index].label).assertEqual("label");
            expect(abilityInfos[index].labelId).assertLarger(PARAM_0);
            expect(abilityInfos[index].description).assertEqual("$string:EntryAbility_desc");
            expect(abilityInfos[index].descriptionId).assertLarger(PARAM_0);
            expect(abilityInfos[index].icon).assertEqual("$media:icon");
            expect(abilityInfos[index].iconId).assertLarger(PARAM_0);
            expect(abilityInfos[index].process).assertEqual("");
            expect(abilityInfos[index].exported).assertEqual(true);
            expect(abilityInfos[index].orientation).assertEqual(PARAM_0);
            expect(abilityInfos[index].launchType).assertEqual(PARAM_0);
            expect(abilityInfos[index].permissions.length).assertEqual(PARAM_0);
            expect(abilityInfos[index].deviceTypes.length).assertEqual(PARAM_0);
            expect(abilityInfos[index].applicationInfo).assertEqual(null);
            expect(abilityInfos[index].metadata.length).assertEqual(PARAM_0);
            expect(abilityInfos[index].enabled).assertEqual(true);
            expect(abilityInfos[index].supportWindowModes.length).assertLarger(PARAM_0);
            expect(abilityInfos[index].windowSize.maxWindowRatio).assertEqual(PARAM_0);
            expect(abilityInfos[index].windowSize.minWindowRatio).assertEqual(PARAM_0);
            expect(abilityInfos[index].windowSize.maxWindowWidth).assertEqual(PARAM_0);
            expect(abilityInfos[index].windowSize.minWindowWidth).assertEqual(PARAM_0);
            expect(abilityInfos[index].windowSize.maxWindowHeight).assertEqual(PARAM_0);
            expect(abilityInfos[index].windowSize.minWindowHeight).assertEqual(PARAM_0);
            expect(abilityInfos[index].excludeFromDock).assertEqual(false);
            expect(abilityInfos[index].skills.length).assertEqual(PARAM_0);
            expect(abilityInfos[index].appIndex).assertEqual(PARAM_0);
            expect(abilityInfos[index].orientationId).assertEqual(PARAM_0);
          }
          done();
        }).catch((err: BusinessError) => {
          hilog.info(DOMAIN, 'Sub_Bms_Framework_GetAbilityInfo_2100', `getAbilityInfo() error,
            errData is errCode:${err.code}  message:${err.message}`);
          expect(err.code).assertEqual(ERROR201);
          done();
        });
      } catch (errData) {
        let errMsg = (errData as BusinessError).message;
        let code = (errData as BusinessError).code;
        hilog.info(DOMAIN, "Sub_Bms_Framework_GetAbilityInfo_2100", `errData is errCode:${code} message:${errMsg}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   Sub_Bms_Framework_GetAbilityInfo_2200
     * @tc.number Sub_Bms_Framework_GetAbilityInfo_2200
     * @tc.desc   Test getAbilityInfo with valid value GET_ABILITY_INFO_ONLY_SYSTEM_APP.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Bms_Framework_GetAbilityInfo_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        let uri = URI_0100;
        let abilityFlags: bundleManager.AbilityFlag = bundleManager.AbilityFlag.GET_ABILITY_INFO_ONLY_SYSTEM_APP;
        bundleManager.getAbilityInfo(uri, abilityFlags).then((abilityInfos: Array<bundleManager.AbilityInfo>) => {
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          hilog.info(DOMAIN, 'Sub_Bms_Framework_GetAbilityInfo_2200', `getAbilityInfo() error,
            errData is errCode:${err.code}  message:${err.message}`);
          if (err.code === ERROR201)
          {
            expect(err.code).assertEqual(ERROR201);
            done();
          } else {
            expect(err.code).assertEqual(ERROR_CODE17700003);
            done();
          }
        });
      } catch (errData) {
        let errMsg = (errData as BusinessError).message;
        let code = (errData as BusinessError).code;
        hilog.info(DOMAIN, "Sub_Bms_Framework_GetAbilityInfo_2200", `errData is errCode:${code} message:${errMsg}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   Sub_Bms_Framework_GetAbilityInfo_2300
     * @tc.number Sub_Bms_Framework_GetAbilityInfo_2300
     * @tc.desc   Test getAbilityInfo with valid value GET_ABILITY_INFO_WITH_APP_LINKING.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Bms_Framework_GetAbilityInfo_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        let uri = URI_0100;
        let abilityFlags: bundleManager.AbilityFlag = bundleManager.AbilityFlag.GET_ABILITY_INFO_WITH_APP_LINKING;
        bundleManager.getAbilityInfo(uri, abilityFlags).then((abilityInfos: Array<bundleManager.AbilityInfo>) => {
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          hilog.info(DOMAIN, 'Sub_Bms_Framework_GetAbilityInfo_2300', `getAbilityInfo() error,
            errData is errCode:${err.code}  message:${err.message}`);
          if (err.code === ERROR201)
          {
            expect(err.code).assertEqual(ERROR201);
            done();
          } else {
            expect(err.code).assertEqual(ERROR_CODE17700003);
            done();
          }
        });
      } catch (errData) {
        let errMsg = (errData as BusinessError).message;
        let code = (errData as BusinessError).code;
        hilog.info(DOMAIN, "Sub_Bms_Framework_GetAbilityInfo_2300", `errData is errCode:${code} message:${errMsg}`);
        expect().assertFail();
        done();
      }
    })
  })
}