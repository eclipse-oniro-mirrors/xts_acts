/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or impligetProfileByAbilityEmptyAbilityCalled.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bundle from '@ohos.bundle.bundleManager';
import util from "./Utils";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"

const BUNDLE_NAME = "ohos.acts.bundle.stage.test";
const VENDOR = "huawei";
const MODULE_NAME = "testModule";
const SOURCE_DIR = "/data/app/el1/bundle/public/ohos.acts.bundle.stage.test/testModule";
const ABILITY_NAME = "ohos.acts.bundle.stage.test.MainAbility";
const ABILITY_NAME1 = "ohos.acts.bundle.stage.test.MainAbility1";
const APPID = "ohos.acts.bundle.stage.test_BNtg4JBClbl92Rgc3jm/RfcAdrHXaM8F0QO" +
"iwVEhnV5ebE5jNIYnAx+weFRT3QTyUjRNdhmc2aAzWyi+5t5CoBM=";
const FINGERPRINT = "8E93863FC32EE238060BF69A9B37E2608FFFB21F93C862DD511CBAC9F30024B5";
const PARAM_ERROR_CODE = 401;

export default function getBundleInfoForSelf() {
  describe('getBundleInfoForSelf', function () {
    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0118
     * @tc.name: getBundleInfoForSelfPro
     * @tc.desc: Test getBundleInfoForSelf with default flag(by promise).
     */
    it('getBundleInfoForSelfPro', 0, async function (done) {
      await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).then(data => {
        console.info("getBundleInfoForSelfPro" + JSON.stringify(data));
        expect(data.name).assertEqual(BUNDLE_NAME);
        expect(data.vendor).assertEqual(VENDOR);
        expect(data.versionCode).assertEqual(1000000);
        expect(data.versionName).assertEqual("1.0.0");
        expect(data.minCompatibleVersionCode).assertEqual(1000000);
        expect(data.targetVersion).assertEqual(8);
        expect(data.installTime).assertLarger(0);
        expect(data.updateTime).assertLarger(0);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        done();
      }).catch(err => {
        console.info("getBundleInfoForSelf fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0119
     * @tc.name: getBundleInfoForSelfCal
     * @tc.desc: Test getBundleInfoForSelf with default flag(by callback).
     */
    it('getBundleInfoForSelfCal', 0, async function (done) {
      bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT, (err, data) => {
        console.info("getBundleInfoForSelfCal" + JSON.stringify(data));
        expect(data.name).assertEqual(BUNDLE_NAME);
        expect(data.vendor).assertEqual(VENDOR);
        expect(data.versionCode).assertEqual(1000000);
        expect(data.versionName).assertEqual("1.0.0");
        expect(data.minCompatibleVersionCode).assertEqual(1000000);
        expect(data.targetVersion).assertEqual(8);
        expect(data.installTime).assertLarger(0);
        expect(data.updateTime).assertLarger(0);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        expect(err).assertEqual(null);
        done();
      })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0120
     * @tc.name: getBundleInfoForSelfApplicationPro
     * @tc.desc: Test getBundleInfoForSelf with application flag(by promise).
     */
    it('getBundleInfoForSelfApplicationPro', 0, async function (done) {
      await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION).then(data => {
        console.info("getBundleInfoForSelfApplicationPro" + JSON.stringify(data.appInfo));
        checkCommonBundleInfo(data);
        expect(data.appInfo.name).assertEqual(BUNDLE_NAME);
        expect(data.appInfo.description).assertEqual("$string:description_application");
        expect(data.appInfo.descriptionId).assertLarger(0);
        expect(data.appInfo.enabled).assertTrue();
        expect(data.appInfo.label).assertEqual("$string:app_name");
        expect(data.appInfo.labelId).assertLarger(0);
        expect(data.appInfo.icon).assertEqual("$media:icon");
        expect(data.appInfo.iconId).assertLarger(0);
        expect(data.appInfo.process).assertEqual(BUNDLE_NAME);
        expect(data.appInfo.codePath).assertEqual("/data/app/el1/bundle/public/ohos.acts.bundle.stage.test");
        expect(data.appInfo.removable).assertTrue(0);
        expect(data.appInfo.accessTokenId).assertLarger(0);
        expect(data.appInfo.uid).assertLarger(0);
        expect(data.appInfo.iconResource.bundleName).assertEqual(BUNDLE_NAME);
        expect(data.appInfo.iconResource.moduleName).assertEqual("testModule");
        expect(data.appInfo.iconResource.id).assertEqual(data.appInfo.iconId);
        expect(data.appInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME);
        expect(data.appInfo.labelResource.moduleName).assertEqual("testModule");
        expect(data.appInfo.labelResource.id).assertEqual(data.appInfo.labelId);
        expect(data.appInfo.descriptionResource.bundleName).assertEqual(BUNDLE_NAME);
        expect(data.appInfo.descriptionResource.moduleName).assertEqual("testModule");
        expect(data.appInfo.descriptionResource.id).assertEqual(data.appInfo.descriptionId);
        expect(data.appInfo.appDistributionType).assertEqual("os_integration");
        expect(data.appInfo.appProvisionType).assertEqual("release");
        expect(data.appInfo.permissions.length).assertEqual(0);
        expect(data.appInfo.systemApp).assertFalse();
        expect(JSON.stringify(data.appInfo.metadata)).assertEqual("{}");
        expect(data.hapModulesInfo.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        done();
      }).catch(err => {
        console.info("getBundleInfoForSelf fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0121
     * @tc.name: getBundleInfoForSelfApplicationCal
     * @tc.desc: Test getBundleInfoForSelf with application flag(by callback).
     */
    it('getBundleInfoForSelfApplicationCal', 0, async function (done) {
      bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION, (err, data) => {
        console.info("ApplicationCal" + JSON.stringify(data.appInfo));
        for (let i in data.appInfo) {
          console.info("name" + JSON.stringify(i));
          console.info("name" + JSON.stringify(data.appInfo[i]));
        }
        checkCommonBundleInfo(data);
        expect(data.appInfo.name).assertEqual(BUNDLE_NAME);
        expect(data.appInfo.description).assertEqual("$string:description_application");
        expect(data.appInfo.descriptionId).assertLarger(0);
        expect(data.appInfo.enabled).assertTrue();
        expect(data.appInfo.label).assertEqual("$string:app_name");
        expect(data.appInfo.labelId).assertLarger(0);
        expect(data.appInfo.icon).assertEqual("$media:icon");
        expect(data.appInfo.iconId).assertLarger(0);
        expect(data.appInfo.process).assertEqual(BUNDLE_NAME);
        expect(data.appInfo.codePath).assertEqual("/data/app/el1/bundle/public/ohos.acts.bundle.stage.test");
        expect(data.appInfo.removable).assertTrue(0);
        expect(data.appInfo.accessTokenId).assertLarger(0);
        expect(data.appInfo.uid).assertLarger(0);
        expect(data.appInfo.iconResource.bundleName).assertEqual(BUNDLE_NAME);
        expect(data.appInfo.iconResource.moduleName).assertEqual("testModule");
        expect(data.appInfo.iconResource.id).assertEqual(data.appInfo.iconId);
        expect(data.appInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME);
        expect(data.appInfo.labelResource.moduleName).assertEqual("testModule");
        expect(data.appInfo.labelResource.id).assertEqual(data.appInfo.labelId);
        expect(data.appInfo.descriptionResource.bundleName).assertEqual(BUNDLE_NAME);
        expect(data.appInfo.descriptionResource.moduleName).assertEqual("testModule");
        expect(data.appInfo.descriptionResource.id).assertEqual(data.appInfo.descriptionId);
        expect(data.appInfo.appDistributionType).assertEqual("os_integration");
        expect(data.appInfo.appProvisionType).assertEqual("release");
        expect(data.appInfo.permissions.length).assertEqual(0);
        expect(data.appInfo.systemApp).assertFalse();
        expect(JSON.stringify(data.appInfo.metadata)).assertEqual("{}");
        expect(data.hapModulesInfo.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        expect(err).assertEqual(null);
        done();
      })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0122
     * @tc.name: getBundleInfoForSelfModulePro
     * @tc.desc: Test getBundleInfoForSelf with hapModuleInfo flag(by promise).
     */
    it('getBundleInfoForSelfModulePro', 0, async function (done) {
      await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE).then(data => {
        console.info("ModulePro" + JSON.stringify(data.hapModulesInfo[0]));
        checkCommonBundleInfo(data);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length).assertEqual(1);
        expect(data.hapModulesInfo[0].name).assertEqual("testModule");
        expect(data.hapModulesInfo[0].icon).assertEqual("$media:icon");
        expect(data.hapModulesInfo[0].iconId).assertLarger(0);
        expect(data.hapModulesInfo[0].label).assertEqual("$string:entry_label");
        expect(data.hapModulesInfo[0].labelId).assertLarger(0);
        expect(data.hapModulesInfo[0].description).assertEqual("$string:testModule_entry_dsc");
        expect(data.hapModulesInfo[0].descriptionId).assertLarger(0);
        expect(data.hapModulesInfo[0].mainElementName).assertEqual(ABILITY_NAME);
        expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0);
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(0);
        expect(data.hapModulesInfo[0].metadata.length).assertEqual(0);
        expect(data.hapModulesInfo[0].deviceTypes.length).assertEqual(2);
        expect(data.hapModulesInfo[0].deviceTypes[0]).assertEqual("default");
        expect(data.hapModulesInfo[0].deviceTypes[1]).assertEqual("tablet");
        expect(data.hapModulesInfo[0].installationFree).assertFalse();
        expect(data.hapModulesInfo[0].hashValue).assertEqual("");
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        done();
      }).catch(err => {
        console.info("getBundleInfoForSelf fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0123
     * @tc.name: getBundleInfoForSelfModuleCal
     * @tc.desc: Test getBundleInfoForSelf with hapModuleInfo flag(by callback).
     */
    it('getBundleInfoForSelfModuleCal', 0, async function (done) {
      bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE, (err, data) => {
        console.info("getBundleInfoForSelfPro" + JSON.stringify(data.hapModulesInfo));
        checkCommonBundleInfo(data);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length).assertEqual(1);
        expect(data.hapModulesInfo[0].name).assertEqual("testModule");
        expect(data.hapModulesInfo[0].icon).assertEqual("$media:icon");
        expect(data.hapModulesInfo[0].iconId).assertLarger(0);
        expect(data.hapModulesInfo[0].label).assertEqual("$string:entry_label");
        expect(data.hapModulesInfo[0].labelId).assertLarger(0);
        expect(data.hapModulesInfo[0].description).assertEqual("$string:testModule_entry_dsc");
        expect(data.hapModulesInfo[0].descriptionId).assertLarger(0);
        expect(data.hapModulesInfo[0].mainElementName).assertEqual(ABILITY_NAME);
        expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0);
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(0);
        expect(data.hapModulesInfo[0].metadata.length).assertEqual(0);
        expect(data.hapModulesInfo[0].deviceTypes.length).assertEqual(2);
        expect(data.hapModulesInfo[0].deviceTypes[0]).assertEqual("default");
        expect(data.hapModulesInfo[0].deviceTypes[1]).assertEqual("tablet");
        expect(data.hapModulesInfo[0].installationFree).assertFalse();
        expect(data.hapModulesInfo[0].hashValue).assertEqual("");
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        expect(err).assertEqual(null);
        done();
      })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0124
     * @tc.name: getBundleInfoForSelfAbilityPro
     * @tc.desc: Test getBundleInfoForSelf with ability flag(by promise).
     */
    it('getBundleInfoForSelfAbilityPro', 0, async function (done) {
      await bundle.getBundleInfoForSelf(
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY
      ).then(data => {
        for (let count = 0; count < 11; count++) {
          console.info(count + "AbilityPro::" + JSON.stringify(data.hapModulesInfo[0].abilitiesInfo[count]));
        }
        checkCommonBundleInfo(data);
        checkCommonHapModuleInfo(data);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(11);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(BUNDLE_NAME);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual("testModule");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].name).assertEqual("ohos.acts.bundle.stage.test.MainAbility");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].label).assertEqual("$string:entry_label");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].labelId).assertLarger(0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].description).assertEqual("$string:testModule_entry_main");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].descriptionId).assertLarger(0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].icon).assertEqual("$media:icon");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].iconId).assertLarger(0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].process).assertEqual("");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].exported).assertTrue();
        expect(data.hapModulesInfo[0].abilitiesInfo[0].type).assertEqual(1);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].orientation).assertEqual(bundle.DisplayOrientation.PORTRAIT);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].launchType).assertEqual(bundle.LaunchType.SINGLETON);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].permissions.length).assertEqual(0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].readPermission).assertEqual("");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].writePermission).assertEqual("");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].uri).assertEqual("");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].deviceTypes.length).assertEqual(2);
        console.info("AbilityPro" + JSON.stringify(data.hapModulesInfo[0].abilitiesInfo[0].deviceTypes[0]));
        console.info("AbilityPro" + JSON.stringify(data.hapModulesInfo[0].abilitiesInfo[0].deviceTypes[1]));
        expect(data.hapModulesInfo[0].abilitiesInfo[0].deviceTypes[0]).assertEqual("default");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].deviceTypes[1]).assertEqual("tablet");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].applicationInfo).assertEqual(null);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].metadata.length).assertEqual(0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].enabled).assertTrue();
        expect(data.hapModulesInfo[0].abilitiesInfo[0].supportWindowModes.length).assertEqual(3);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].supportWindowModes[0])
          .assertEqual(bundle.SupportWindowMode.FULL_SCREEN);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].supportWindowModes[1])
          .assertEqual(bundle.SupportWindowMode.SPLIT);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].supportWindowModes[2])
          .assertEqual(bundle.SupportWindowMode.FLOATING);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowRatio).assertEqual(0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowRatio).assertEqual(0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowWidth).assertEqual(0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowWidth).assertEqual(0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowHeight).assertEqual(0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowHeight).assertEqual(0);
        expect(data.hapModulesInfo[0].abilitiesInfo[1].name).assertEqual("ohos.acts.bundle.stage.test.MainAbility1");
        expect(data.hapModulesInfo[0].abilitiesInfo[1].launchType).assertEqual(bundle.LaunchType.MULTITON);
        expect(data.hapModulesInfo[0].abilitiesInfo[1].orientation).assertEqual(bundle.DisplayOrientation.LANDSCAPE);
        expect(data.hapModulesInfo[0].abilitiesInfo[2].name).assertEqual("ohos.acts.bundle.stage.test.MainAbility10");
        expect(data.hapModulesInfo[0].abilitiesInfo[2].orientation).assertEqual(bundle.DisplayOrientation.LOCKED);
        expect(data.hapModulesInfo[0].abilitiesInfo[3].name).assertEqual("ohos.acts.bundle.stage.test.MainAbility2");
        expect(data.hapModulesInfo[0].abilitiesInfo[3].launchType).assertEqual(bundle.LaunchType.SPECIFIED);
        expect(data.hapModulesInfo[0].abilitiesInfo[3].orientation)
          .assertEqual(bundle.DisplayOrientation.LANDSCAPE_INVERTED);
        expect(data.hapModulesInfo[0].abilitiesInfo[4].name).assertEqual("ohos.acts.bundle.stage.test.MainAbility3");
        expect(data.hapModulesInfo[0].abilitiesInfo[4].orientation)
          .assertEqual(bundle.DisplayOrientation.PORTRAIT_INVERTED);
        expect(data.hapModulesInfo[0].abilitiesInfo[5].name).assertEqual("ohos.acts.bundle.stage.test.MainAbility4");
        expect(data.hapModulesInfo[0].abilitiesInfo[5].orientation)
          .assertEqual(bundle.DisplayOrientation.AUTO_ROTATION);
        expect(data.hapModulesInfo[0].abilitiesInfo[6].name).assertEqual("ohos.acts.bundle.stage.test.MainAbility5");
        expect(data.hapModulesInfo[0].abilitiesInfo[6].orientation)
          .assertEqual(bundle.DisplayOrientation.AUTO_ROTATION_LANDSCAPE);
        expect(data.hapModulesInfo[0].abilitiesInfo[7].name).assertEqual("ohos.acts.bundle.stage.test.MainAbility6");
        expect(data.hapModulesInfo[0].abilitiesInfo[7].orientation)
          .assertEqual(bundle.DisplayOrientation.AUTO_ROTATION_PORTRAIT);
        expect(data.hapModulesInfo[0].abilitiesInfo[8].name).assertEqual("ohos.acts.bundle.stage.test.MainAbility7");
        expect(data.hapModulesInfo[0].abilitiesInfo[8].orientation)
          .assertEqual(bundle.DisplayOrientation.AUTO_ROTATION_RESTRICTED);
        expect(data.hapModulesInfo[0].abilitiesInfo[9].name).assertEqual("ohos.acts.bundle.stage.test.MainAbility8");
        expect(data.hapModulesInfo[0].abilitiesInfo[9].orientation)
          .assertEqual(bundle.DisplayOrientation.AUTO_ROTATION_LANDSCAPE_RESTRICTED);
        expect(data.hapModulesInfo[0].abilitiesInfo[10].name).assertEqual("ohos.acts.bundle.stage.test.MainAbility9");
        expect(data.hapModulesInfo[0].abilitiesInfo[10].orientation)
          .assertEqual(bundle.DisplayOrientation.AUTO_ROTATION_PORTRAIT_RESTRICTED);
        checkCommonAbilityInfo(data.hapModulesInfo[0].abilitiesInfo[1])
        checkCommonAbilityInfo(data.hapModulesInfo[0].abilitiesInfo[2])
        checkCommonAbilityInfo(data.hapModulesInfo[0].abilitiesInfo[3])
        checkCommonAbilityInfo(data.hapModulesInfo[0].abilitiesInfo[4])
        checkCommonAbilityInfo(data.hapModulesInfo[0].abilitiesInfo[5])
        checkCommonAbilityInfo(data.hapModulesInfo[0].abilitiesInfo[6])
        checkCommonAbilityInfo(data.hapModulesInfo[0].abilitiesInfo[7])
        checkCommonAbilityInfo(data.hapModulesInfo[0].abilitiesInfo[8])
        checkCommonAbilityInfo(data.hapModulesInfo[0].abilitiesInfo[9])
        checkCommonAbilityInfo(data.hapModulesInfo[0].abilitiesInfo[10])
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(0);
        expect(data.hapModulesInfo[0].metadata.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        done();
      }).catch(err => {
        console.info("getBundleInfoForSelf fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0125
     * @tc.name: getBundleInfoForSelfAbilityCal
     * @tc.desc: Test getBundleInfoForSelf with ability flag(by callback).
     */
    it('getBundleInfoForSelfAbilityCal', 0, async function (done) {
      bundle.getBundleInfoForSelf(
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY,
        (err, data) => {
          console.info("AbilityCal" + JSON.stringify(data.hapModulesInfo[0].abilitiesInfo[0]));
          checkCommonBundleInfo(data);
          checkCommonHapModuleInfo(data);
          expect(data.appInfo).assertEqual(null);
          expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(11);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(BUNDLE_NAME);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual("testModule");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].name).assertEqual("ohos.acts.bundle.stage.test.MainAbility");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].label).assertEqual("$string:entry_label");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].labelId).assertLarger(0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].description).assertEqual("$string:testModule_entry_main");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].descriptionId).assertLarger(0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].icon).assertEqual("$media:icon");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].iconId).assertLarger(0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].process).assertEqual("");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].exported).assertTrue();
          expect(data.hapModulesInfo[0].abilitiesInfo[0].type).assertEqual(1);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].orientation).assertEqual(bundle.DisplayOrientation.PORTRAIT);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].launchType).assertEqual(bundle.LaunchType.SINGLETON);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].permissions.length).assertEqual(0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].readPermission).assertEqual("");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].writePermission).assertEqual("");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].uri).assertEqual("");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].deviceTypes.length).assertEqual(2);
          console.info("AbilityPro" + JSON.stringify(data.hapModulesInfo[0].abilitiesInfo[0].deviceTypes[0]));
          console.info("AbilityPro" + JSON.stringify(data.hapModulesInfo[0].abilitiesInfo[0].deviceTypes[1]));
          expect(data.hapModulesInfo[0].abilitiesInfo[0].deviceTypes[0]).assertEqual("default");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].deviceTypes[1]).assertEqual("tablet");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].applicationInfo).assertEqual(null);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].metadata.length).assertEqual(0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].enabled).assertTrue();
          expect(data.hapModulesInfo[0].abilitiesInfo[0].supportWindowModes.length).assertEqual(3);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].supportWindowModes[0])
            .assertEqual(bundle.SupportWindowMode.FULL_SCREEN);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].supportWindowModes[1])
            .assertEqual(bundle.SupportWindowMode.SPLIT);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].supportWindowModes[2])
            .assertEqual(bundle.SupportWindowMode.FLOATING);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowRatio).assertEqual(0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowRatio).assertEqual(0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowWidth).assertEqual(0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowWidth).assertEqual(0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowHeight).assertEqual(0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowHeight).assertEqual(0);
          expect(data.hapModulesInfo[0].abilitiesInfo[1].name).assertEqual("ohos.acts.bundle.stage.test.MainAbility1");
          expect(data.hapModulesInfo[0].abilitiesInfo[1].launchType).assertEqual(bundle.LaunchType.MULTITON);
          expect(data.hapModulesInfo[0].abilitiesInfo[1].orientation).assertEqual(bundle.DisplayOrientation.LANDSCAPE);
          expect(data.hapModulesInfo[0].abilitiesInfo[2].name).assertEqual("ohos.acts.bundle.stage.test.MainAbility10");
          expect(data.hapModulesInfo[0].abilitiesInfo[2].orientation).assertEqual(bundle.DisplayOrientation.LOCKED);
          expect(data.hapModulesInfo[0].abilitiesInfo[3].name).assertEqual("ohos.acts.bundle.stage.test.MainAbility2");
          expect(data.hapModulesInfo[0].abilitiesInfo[3].launchType).assertEqual(bundle.LaunchType.SPECIFIED);
          expect(data.hapModulesInfo[0].abilitiesInfo[3].orientation)
            .assertEqual(bundle.DisplayOrientation.LANDSCAPE_INVERTED);
          expect(data.hapModulesInfo[0].abilitiesInfo[4].name).assertEqual("ohos.acts.bundle.stage.test.MainAbility3");
          expect(data.hapModulesInfo[0].abilitiesInfo[4].orientation)
            .assertEqual(bundle.DisplayOrientation.PORTRAIT_INVERTED);
          expect(data.hapModulesInfo[0].abilitiesInfo[5].name).assertEqual("ohos.acts.bundle.stage.test.MainAbility4");
          expect(data.hapModulesInfo[0].abilitiesInfo[5].orientation)
            .assertEqual(bundle.DisplayOrientation.AUTO_ROTATION);
          expect(data.hapModulesInfo[0].abilitiesInfo[6].name).assertEqual("ohos.acts.bundle.stage.test.MainAbility5");
          expect(data.hapModulesInfo[0].abilitiesInfo[6].orientation)
            .assertEqual(bundle.DisplayOrientation.AUTO_ROTATION_LANDSCAPE);
          expect(data.hapModulesInfo[0].abilitiesInfo[7].name).assertEqual("ohos.acts.bundle.stage.test.MainAbility6");
          expect(data.hapModulesInfo[0].abilitiesInfo[7].orientation)
            .assertEqual(bundle.DisplayOrientation.AUTO_ROTATION_PORTRAIT);
          expect(data.hapModulesInfo[0].abilitiesInfo[8].name).assertEqual("ohos.acts.bundle.stage.test.MainAbility7");
          expect(data.hapModulesInfo[0].abilitiesInfo[8].orientation)
            .assertEqual(bundle.DisplayOrientation.AUTO_ROTATION_RESTRICTED);
          expect(data.hapModulesInfo[0].abilitiesInfo[9].name).assertEqual("ohos.acts.bundle.stage.test.MainAbility8");
          expect(data.hapModulesInfo[0].abilitiesInfo[9].orientation)
            .assertEqual(bundle.DisplayOrientation.AUTO_ROTATION_LANDSCAPE_RESTRICTED);
          expect(data.hapModulesInfo[0].abilitiesInfo[10].name).assertEqual("ohos.acts.bundle.stage.test.MainAbility9");
          expect(data.hapModulesInfo[0].abilitiesInfo[10].orientation)
            .assertEqual(bundle.DisplayOrientation.AUTO_ROTATION_PORTRAIT_RESTRICTED);
          checkCommonAbilityInfo(data.hapModulesInfo[0].abilitiesInfo[1])
          checkCommonAbilityInfo(data.hapModulesInfo[0].abilitiesInfo[2])
          checkCommonAbilityInfo(data.hapModulesInfo[0].abilitiesInfo[3])
          checkCommonAbilityInfo(data.hapModulesInfo[0].abilitiesInfo[4])
          checkCommonAbilityInfo(data.hapModulesInfo[0].abilitiesInfo[5])
          checkCommonAbilityInfo(data.hapModulesInfo[0].abilitiesInfo[6])
          checkCommonAbilityInfo(data.hapModulesInfo[0].abilitiesInfo[7])
          checkCommonAbilityInfo(data.hapModulesInfo[0].abilitiesInfo[8])
          checkCommonAbilityInfo(data.hapModulesInfo[0].abilitiesInfo[9])
          checkCommonAbilityInfo(data.hapModulesInfo[0].abilitiesInfo[10])
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(0);
          expect(data.hapModulesInfo[0].metadata.length).assertEqual(0);
          expect(data.reqPermissionDetails.length).assertEqual(0);
          expect(data.permissionGrantStates.length).assertEqual(0);
          expect(data.signatureInfo).assertEqual(null);
          expect(err).assertEqual(null);
          done();
        })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0126
     * @tc.name: getBundleInfoForSelfExtensionPro
     * @tc.desc: Test getBundleInfoForSelf with extensionAbility flag(by promise).
     */
    it('getBundleInfoForSelfExtensionPro', 0, async function (done) {
      await bundle.getBundleInfoForSelf(
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY
      ).then(data => {
        console.info("ExtensionPro" + JSON.stringify(data.hapModulesInfo[0].extensionAbilitiesInfo));
        checkCommonBundleInfo(data);
        checkCommonHapModuleInfo(data);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0);
        let extensionList = data.hapModulesInfo[0].extensionAbilitiesInfo
        expect(extensionList.length).assertEqual(13);
        let count = 0;
        for (let i = 0;i < 13; i++) {
          switch (extensionList[i].name) {
            case "Form":
              console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].bundleName).assertEqual(BUNDLE_NAME);
              expect(extensionList[i].moduleName).assertEqual("testModule");
              expect(extensionList[i].name).assertEqual("Form");
              expect(extensionList[i].labelId).assertLarger(0);
              expect(extensionList[i].descriptionId).assertLarger(0);
              expect(extensionList[i].iconId).assertLarger(0);
              expect(extensionList[i].exported).assertTrue();
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.FORM);
              expect(extensionList[i].permissions.length).assertEqual(0);
              expect(extensionList[i].applicationInfo).assertEqual(null);
              expect(extensionList[i].metadata.length).assertEqual(0);
              expect(extensionList[i].enabled).assertTrue();
              expect(extensionList[i].readPermission).assertEqual("");
              expect(extensionList[i].writePermission).assertEqual("");
              count = count + 1;
              break;
            case "Form1":
              console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].bundleName).assertEqual(BUNDLE_NAME);
              expect(extensionList[i].moduleName).assertEqual("testModule");
              expect(extensionList[i].name).assertEqual("Form1");
              expect(extensionList[i].labelId).assertLarger(0);
              expect(extensionList[i].descriptionId).assertLarger(0);
              expect(extensionList[i].iconId).assertLarger(0);
              expect(extensionList[i].exported).assertTrue();
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.FORM);
              expect(extensionList[i].permissions.length).assertEqual(0);
              expect(extensionList[i].applicationInfo).assertEqual(null);
              expect(extensionList[i].metadata.length).assertEqual(0);
              expect(extensionList[i].enabled).assertTrue();
              expect(extensionList[i].readPermission).assertEqual("");
              expect(extensionList[i].writePermission).assertEqual("");
              count = count + 2;
              break;
            case 'workScheduler':
              console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.WORK_SCHEDULER)
              count = count + 3;
              break;
            case 'inputMethod':
              console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.INPUT_METHOD)
              count = count + 4;
              break;
            case 'accessibility':
              console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.ACCESSIBILITY)
              count = count + 5;
              break;
            case 'fileShare':
              console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.FILE_SHARE)
              count = count + 6;
              break;
            case 'staticSubscriber':
              console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.STATIC_SUBSCRIBER)
              count = count + 7;
              break;
            case 'wallpaper':
              console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.WALLPAPER)
              count = count + 8;
              break;
            case 'backup':
              console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.BACKUP)
              count = count + 9;
              break;
            case 'window':
              console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.WINDOW)
              count = count + 10;
              break;
            case 'enterpriseAdmin':
              console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.ENTERPRISE_ADMIN)
              count = count + 11;
              break;
            case 'thumbnail':
              console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.THUMBNAIL)
              count = count + 12;
              break;
            case 'preview':
              console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.PREVIEW)
              count = count + 13;
              break;
          }
          console.info("count" + JSON.stringify(count));
        }
        expect(count).assertEqual(91);
        expect(data.hapModulesInfo[0].metadata.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        done();
      }).catch(err => {
        console.info("getBundleInfoForSelf fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0127
     * @tc.name: getBundleInfoForSelfExtensionCal
     * @tc.desc: Test getBundleInfoForSelf with extensionAbility flag(by callback).
     */
    it('getBundleInfoForSelfExtensionCal', 0, async function (done) {
      bundle.getBundleInfoForSelf(
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY,
        (err, data) => {
          console.info("ExtensionCal" + JSON.stringify(data.hapModulesInfo[0].extensionAbilitiesInfo));
          checkCommonBundleInfo(data);
          checkCommonHapModuleInfo(data);
          expect(data.appInfo).assertEqual(null);
          expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0);
          let extensionList = data.hapModulesInfo[0].extensionAbilitiesInfo
          let count = 0;
          for (let i = 0;i < 13; i++) {
            switch (extensionList[i].name) {
              case "Form":
                console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
                expect(extensionList[i].bundleName).assertEqual(BUNDLE_NAME);
                expect(extensionList[i].moduleName).assertEqual("testModule");
                expect(extensionList[i].name).assertEqual("Form");
                expect(extensionList[i].labelId).assertLarger(0);
                expect(extensionList[i].descriptionId).assertLarger(0);
                expect(extensionList[i].iconId).assertLarger(0);
                expect(extensionList[i].exported).assertTrue();
                expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.FORM);
                expect(extensionList[i].permissions.length).assertEqual(0);
                expect(extensionList[i].applicationInfo).assertEqual(null);
                expect(extensionList[i].metadata.length).assertEqual(0);
                expect(extensionList[i].enabled).assertTrue();
                expect(extensionList[i].readPermission).assertEqual("");
                expect(extensionList[i].writePermission).assertEqual("");
                count = count + 1;
                break;
              case "Form1":
                console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
                expect(extensionList[i].bundleName).assertEqual(BUNDLE_NAME);
                expect(extensionList[i].moduleName).assertEqual("testModule");
                expect(extensionList[i].name).assertEqual("Form1");
                expect(extensionList[i].labelId).assertLarger(0);
                expect(extensionList[i].descriptionId).assertLarger(0);
                expect(extensionList[i].iconId).assertLarger(0);
                expect(extensionList[i].exported).assertTrue();
                expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.FORM);
                expect(extensionList[i].permissions.length).assertEqual(0);
                expect(extensionList[i].applicationInfo).assertEqual(null);
                expect(extensionList[i].metadata.length).assertEqual(0);
                expect(extensionList[i].enabled).assertTrue();
                expect(extensionList[i].readPermission).assertEqual("");
                expect(extensionList[i].writePermission).assertEqual("");
                count = count + 2;
                break;
              case 'workScheduler':
                console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
                expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.WORK_SCHEDULER)
                count = count + 3;
                break;
              case 'inputMethod':
                console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
                expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.INPUT_METHOD)
                count = count + 4;
                break;
              case 'accessibility':
                console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
                expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.ACCESSIBILITY)
                count = count + 5;
                break;
              case 'fileShare':
                console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
                expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.FILE_SHARE)
                count = count + 6;
                break;
              case 'staticSubscriber':
                console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
                expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.STATIC_SUBSCRIBER)
                count = count + 7;
                break;
              case 'wallpaper':
                console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
                expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.WALLPAPER)
                count = count + 8;
                break;
              case 'backup':
                console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
                expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.BACKUP)
                count = count + 9;
                break;
              case 'window':
                console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
                expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.WINDOW)
                count = count + 10;
                break;
              case 'enterpriseAdmin':
                console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
                expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.ENTERPRISE_ADMIN)
                count = count + 11;
                break;
              case 'thumbnail':
                console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
                expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.THUMBNAIL)
                count = count + 12;
                break;
              case 'preview':
                console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
                expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.PREVIEW)
                count = count + 13;
                break;
            }
            console.info("count" + JSON.stringify(count));
          }
          expect(count).assertEqual(91);
          expect(data.hapModulesInfo[0].metadata.length).assertEqual(0);
          expect(data.reqPermissionDetails.length).assertEqual(0);
          expect(data.permissionGrantStates.length).assertEqual(0);
          expect(data.signatureInfo).assertEqual(null);
          expect(err).assertEqual(null);
          expect(bundle.ExtensionAbilityType.SERVICE).assertEqual(3);
          expect(bundle.ExtensionAbilityType.DATA_SHARE).assertEqual(5);
          expect(bundle.ExtensionAbilityType.UNSPECIFIED).assertEqual(255);
          done();
        })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0128
     * @tc.name: getBundleInfoForSelfPermissionPro
     * @tc.desc: Test getBundleInfoForSelf with permission flag(by promise).
     */
    it('getBundleInfoForSelfPermissionPro', 0, async function (done) {
      await bundle.getBundleInfoForSelf(
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION).then(data => {
        console.info("PermissionPro" + JSON.stringify(data.reqPermissionDetails));
        console.info("PermissionPro" + JSON.stringify(data.permissionGrantStates));
        checkCommonBundleInfo(data);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(2);
        expect(data.reqPermissionDetails[0].name).assertEqual("ohos.permission.GET_BUNDLE_INFO");
        expect(data.reqPermissionDetails[0].reason).assertEqual("$string:permission_reason");
        expect(data.reqPermissionDetails[0].reasonId).assertLarger(0);
        expect(data.reqPermissionDetails[0].usedScene.abilities.length).assertEqual(1);
        expect(data.reqPermissionDetails[0].usedScene.abilities[0]).assertEqual("MainAbility");
        expect(data.reqPermissionDetails[0].usedScene.when).assertEqual("always");
        expect(data.permissionGrantStates[0]).assertEqual(bundle.PermissionGrantState.PERMISSION_GRANTED);
        expect(data.reqPermissionDetails[1].name).assertEqual("ohos.permission.READ_CALENDAR");
        expect(data.reqPermissionDetails[1].reason).assertEqual("$string:permission_reason");
        expect(data.reqPermissionDetails[1].reasonId).assertLarger(0);
        expect(data.reqPermissionDetails[1].usedScene.abilities.length).assertEqual(1);
        expect(data.reqPermissionDetails[1].usedScene.abilities[0]).assertEqual("MainAbility");
        expect(data.reqPermissionDetails[1].usedScene.when).assertEqual("inuse");
        expect(data.permissionGrantStates[1]).assertEqual(bundle.PermissionGrantState.PERMISSION_DENIED);
        expect(data.signatureInfo).assertEqual(null);
        done();
      }).catch(err => {
        console.info("getBundleInfoForSelf fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0129
     * @tc.name: getBundleInfoForSelfPermissionCal
     * @tc.desc: Test getBundleInfoForSelf with permission flag(by callback).
     */
    it('getBundleInfoForSelfPermissionCal', 0, async function (done) {
      bundle.getBundleInfoForSelf(
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION, (err, data) => {
        console.info("PermissionPro" + JSON.stringify(data.reqPermissionDetails));
        console.info("PermissionPro" + JSON.stringify(data.permissionGrantStates));
        checkCommonBundleInfo(data);
        expect(data.appInfo).assertEqual(null);
        expect(data.reqPermissionDetails.length).assertEqual(2);
        expect(data.reqPermissionDetails[0].name).assertEqual("ohos.permission.GET_BUNDLE_INFO");
        expect(data.reqPermissionDetails[0].reason).assertEqual("$string:permission_reason");
        expect(data.reqPermissionDetails[0].reasonId).assertLarger(0);
        expect(data.reqPermissionDetails[0].usedScene.abilities.length).assertEqual(1);
        expect(data.reqPermissionDetails[0].usedScene.abilities[0]).assertEqual("MainAbility");
        expect(data.reqPermissionDetails[0].usedScene.when).assertEqual("always");
        expect(data.permissionGrantStates[0]).assertEqual(bundle.PermissionGrantState.PERMISSION_GRANTED);
        expect(data.reqPermissionDetails[1].name).assertEqual("ohos.permission.READ_CALENDAR");
        expect(data.reqPermissionDetails[1].reason).assertEqual("$string:permission_reason");
        expect(data.reqPermissionDetails[1].reasonId).assertLarger(0);
        expect(data.reqPermissionDetails[1].usedScene.abilities.length).assertEqual(1);
        expect(data.reqPermissionDetails[1].usedScene.abilities[0]).assertEqual("MainAbility");
        expect(data.reqPermissionDetails[1].usedScene.when).assertEqual("inuse");
        expect(data.permissionGrantStates[1]).assertEqual(bundle.PermissionGrantState.PERMISSION_DENIED);
        expect(data.signatureInfo).assertEqual(null);
        expect(err).assertEqual(null);
        done();
      })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0130
     * @tc.name: getBundleInfoForSelfMetaPro
     * @tc.desc: Test getBundleInfoForSelf with metadata flag(by promise).
     */
    it('getBundleInfoForSelfMetaPro', 0, async function (done) {
      await bundle.getBundleInfoForSelf(
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA)
        .then(data => {
          console.info("MetaPro" + JSON.stringify(data.hapModulesInfo[0].metadata));
          checkCommonBundleInfo(data);
          checkCommonHapModuleInfo(data);
          expect(data.appInfo).assertEqual(null);
          expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0);
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(0);
          expect(data.hapModulesInfo[0].metadata.length).assertEqual(1);
          expect(data.hapModulesInfo[0].metadata[0].name).assertEqual("MetaData1");
          expect(data.hapModulesInfo[0].metadata[0].value).assertEqual("MetaDataValue");
          expect(data.hapModulesInfo[0].metadata[0].resource).assertEqual("$profile:shortcuts_config");
          expect(data.reqPermissionDetails.length).assertEqual(0);
          expect(data.permissionGrantStates.length).assertEqual(0);
          expect(data.signatureInfo).assertEqual(null);
          done();
        })
        .catch(err => {
          console.info("getBundleInfoForSelf fail" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0131
     * @tc.name: getBundleInfoForSelfMetaCal
     * @tc.desc: Test getBundleInfoForSelf with metadata flag(by callback).
     */
    it('getBundleInfoForSelfMetaCal', 0, async function (done) {
      bundle.getBundleInfoForSelf(
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA,
        (err, data) => {
          console.info("MetaPro" + JSON.stringify(data.hapModulesInfo[0].metadata));
          checkCommonBundleInfo(data);
          checkCommonHapModuleInfo(data);
          expect(data.appInfo).assertEqual(null);
          expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0);
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(0);
          expect(data.hapModulesInfo[0].metadata.length).assertEqual(1);
          expect(data.hapModulesInfo[0].metadata[0].name).assertEqual("MetaData1");
          expect(data.hapModulesInfo[0].metadata[0].value).assertEqual("MetaDataValue");
          expect(data.hapModulesInfo[0].metadata[0].resource).assertEqual("$profile:shortcuts_config");
          expect(data.reqPermissionDetails.length).assertEqual(0);
          expect(data.permissionGrantStates.length).assertEqual(0);
          expect(data.signatureInfo).assertEqual(null);
          expect(err).assertEqual(null);
          done();
        })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0132
     * @tc.name: getBundleInfoForSelfSigPro
     * @tc.desc: Test getBundleInfoForSelf with signatureInfo flag(by promise).
     */
    it('getBundleInfoForSelfSigPro', 0, async function (done) {
      await bundle.getBundleInfoForSelf(
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO).then(data => {
        console.info("SigPro" + JSON.stringify(data.signatureInfo));
        checkCommonBundleInfo(data);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo.appId).assertEqual(APPID);
        expect(data.signatureInfo.fingerprint).assertEqual(FINGERPRINT);
        done();
      }).catch(err => {
        console.info("getBundleInfoForSelf fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0133
     * @tc.name: getBundleInfoForSelfSigCal
     * @tc.desc: Test getBundleInfoForSelf with signatureInfo flag(by callback).
     */
    it('getBundleInfoForSelfSigCal', 0, async function (done) {
      bundle.getBundleInfoForSelf(
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO, (err, data) => {
        console.info("SigCal" + JSON.stringify(data.signatureInfo));
        checkCommonBundleInfo(data);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo.appId).assertEqual(APPID);
        expect(data.signatureInfo.fingerprint).assertEqual(FINGERPRINT);
        expect(err).assertEqual(null);
        done();
      })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0134
     * @tc.name: getBundleInfoForSelfDisPro
     * @tc.desc: Test getBundleInfoForSelf with disable flag(by promise).
     */
    it('getBundleInfoForSelfDisPro', 0, async function (done) {
      await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_DISABLE).then(data => {
        console.info("DisPro" + JSON.stringify(data));
        checkCommonBundleInfo(data);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        done();
      }).catch(err => {
        console.info("getBundleInfoForSelf fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0135
     * @tc.name: getBundleInfoForSelfDisCal
     * @tc.desc: Test getBundleInfoForSelf with disable flag(by callback).
     */
    it('getBundleInfoForSelfDisCal', 0, async function (done) {
      bundle.getBundleInfoForSelf(
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_DISABLE, (err, data) => {
        console.info("DisCal" + JSON.stringify(data));
        checkCommonBundleInfo(data);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        expect(err).assertEqual(null);
        done();
      })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0136
     * @tc.name: getBundleInfoForSelfParamErrPro
     * @tc.desc: Test getBundleInfoForSelf with error param(by promise).
     */
    it('getBundleInfoForSelfParamErrPro', 0, async function (done) {
      try {
        await bundle.getBundleInfoForSelf(null).then(data => {
          console.info("ParamErrPro null success " + JSON.stringify(data));
          expect(data).assertFail();
        }).catch(err => {
          console.info("ParamErrPro null fail1 " + JSON.stringify(err));
          expect(err).assertFail();
        })
      } catch (err) {
        console.info("ParamErrPro null fail2 " + JSON.stringify(err));
        expect(err.code).assertEqual(PARAM_ERROR_CODE);
      }
      try {
        await bundle.getBundleInfoForSelf(undefined).then(data => {
          console.info("ParamErrPro undefined success " + JSON.stringify(data));
          expect(data).assertFail();
        }).catch(err => {
          console.info("ParamErrPro undefined fail1 " + JSON.stringify(err));
          expect(err).assertFail();
        })
      } catch (err) {
        console.info("ParamErrPro undefined fail2 " + JSON.stringify(err));
        expect(err.code).assertEqual(PARAM_ERROR_CODE);
        done();
      }
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0137
     * @tc.name: getBundleInfoForSelfParamErrCal
     * @tc.desc: Test getBundleInfoForSelf with error param(by callback).
     */
    it('getBundleInfoForSelfParamErrCal', 0, async function (done) {
      try {
        bundle.getBundleInfoForSelf(null, (err, data) => {
          console.info("ParamErrCal null success " + JSON.stringify(data));
          console.info("ParamErrCal null success " + JSON.stringify(err));
          expect(data).assertFail();
        })
      } catch (err) {
        console.info("ParamErrCal null fail2 " + JSON.stringify(err));
        expect(err.code).assertEqual(PARAM_ERROR_CODE);
      }
      await util.sleep(200);
      try {
        bundle.getBundleInfoForSelf(undefined, (err, data) => {
          console.info("ParamErrCal undefined success " + JSON.stringify(data));
          console.info("ParamErrCal undefined success " + JSON.stringify(err));
          expect(data).assertFail();
        })
      } catch (err) {
        console.info("ParamErrCal undefined fail2 " + JSON.stringify(err));
        expect(err.code).assertEqual(PARAM_ERROR_CODE);
        done();
      }
    })

    function checkCommonBundleInfo(data) {
      expect(data.name).assertEqual(BUNDLE_NAME);
      expect(data.vendor).assertEqual(VENDOR);
      expect(data.versionCode).assertEqual(1000000);
      expect(data.versionName).assertEqual("1.0.0");
      expect(data.minCompatibleVersionCode).assertEqual(1000000);
      expect(data.targetVersion).assertEqual(8);
      expect(data.installTime).assertLarger(0);
      expect(data.updateTime).assertLarger(0);
      console.info("checkCommonBundleInfo end");
    }

    function checkCommonApplicationInfo(data) {
      expect(data.appInfo.name).assertEqual(BUNDLE_NAME);
      expect(data.appInfo.description).assertEqual("$string:description_application");
      expect(data.appInfo.descriptionId).assertLarger(0);
      expect(data.appInfo.enabled).assertTrue();
      expect(data.appInfo.label).assertEqual("$string:app_name");
      expect(data.appInfo.labelId).assertLarger(0);
      expect(data.appInfo.icon).assertEqual("$media:icon");
      expect(data.appInfo.iconId).assertLarger(0);
      expect(data.appInfo.process).assertEqual(BUNDLE_NAME);
      expect(data.appInfo.codePath).assertEqual("/data/app/el1/bundle/public/ohos.acts.bundle.stage.test");
      expect(data.appInfo.removable).assertTrue(0);
      expect(data.appInfo.accessTokenId).assertLarger(0);
      expect(data.appInfo.uid).assertLarger(0);
      expect(data.appInfo.iconResource.bundleName).assertEqual(BUNDLE_NAME);
      expect(data.appInfo.iconResource.moduleName).assertEqual("testModule");
      expect(data.appInfo.iconResource.id).assertEqual(data.appInfo.iconId);
      expect(data.appInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME);
      expect(data.appInfo.labelResource.moduleName).assertEqual("testModule");
      expect(data.appInfo.labelResource.id).assertEqual(data.appInfo.labelId);
      expect(data.appInfo.descriptionResource.bundleName).assertEqual(BUNDLE_NAME);
      expect(data.appInfo.descriptionResource.moduleName).assertEqual("testModule");
      expect(data.appInfo.descriptionResource.id).assertEqual(data.appInfo.descriptionId);
      expect(data.appInfo.appDistributionType).assertEqual("os_integration");
      expect(data.appInfo.appProvisionType).assertEqual("release");
      expect(data.appInfo.systemApp).assertFalse();
      expect(JSON.stringify(data.appInfo.metadata)).assertEqual("{}");
      console.info("checkCommonApplicationInfo end");
    }

    function checkCommonHapModuleInfo(data) {
      expect(data.hapModulesInfo.length).assertEqual(1);
      expect(data.hapModulesInfo[0].name).assertEqual("testModule");
      expect(data.hapModulesInfo[0].icon).assertEqual("$media:icon");
      expect(data.hapModulesInfo[0].iconId).assertLarger(0);
      expect(data.hapModulesInfo[0].label).assertEqual("$string:entry_label");
      expect(data.hapModulesInfo[0].labelId).assertLarger(0);
      expect(data.hapModulesInfo[0].description).assertEqual("$string:testModule_entry_dsc");
      expect(data.hapModulesInfo[0].descriptionId).assertLarger(0);
      expect(data.hapModulesInfo[0].mainElementName).assertEqual(ABILITY_NAME);
      expect(data.hapModulesInfo[0].deviceTypes.length).assertEqual(2);
      console.info("checkComm" + JSON.stringify(data.hapModulesInfo[0].deviceTypes[0]));
      console.info("checkComm" + JSON.stringify(data.hapModulesInfo[0].deviceTypes[1]));
      expect(data.hapModulesInfo[0].deviceTypes[0]).assertEqual("default");
      expect(data.hapModulesInfo[0].deviceTypes[1]).assertEqual("tablet");
      expect(data.hapModulesInfo[0].installationFree).assertFalse();
      expect(data.hapModulesInfo[0].hashValue).assertEqual("");
      console.info("checkCommonHapModuleInfo end");
    }

    function checkCommonAbilityInfo(data) {
      expect(data.bundleName).assertEqual(BUNDLE_NAME);
      expect(data.moduleName).assertEqual("testModule");
      expect(data.label).assertEqual("$string:entry_label");
      expect(data.labelId).assertLarger(0);
      expect(data.description).assertEqual("$string:testModule_entry_main");
      expect(data.descriptionId).assertLarger(0);
      expect(data.icon).assertEqual("$media:icon");
      expect(data.iconId).assertLarger(0);
      expect(data.process).assertEqual("");
      expect(data.exported).assertTrue();
      expect(data.type).assertEqual(1);
      expect(data.permissions.length).assertEqual(0);
      expect(data.readPermission).assertEqual("");
      expect(data.writePermission).assertEqual("");
      expect(data.uri).assertEqual("");
      expect(data.deviceTypes.length).assertEqual(2);
      console.info("checkComm" + JSON.stringify(data.deviceTypes[0]));
      console.info("checkComm" + JSON.stringify(data.deviceTypes[1]));
      expect(data.deviceTypes[0]).assertEqual("default");
      expect(data.deviceTypes[1]).assertEqual("tablet");
      expect(data.applicationInfo).assertEqual(null);
      expect(data.metadata.length).assertEqual(0);
      expect(data.enabled).assertTrue();
      expect(data.supportWindowModes.length).assertEqual(3);
      expect(data.supportWindowModes[0]).assertEqual(bundle.SupportWindowMode.FULL_SCREEN);
      expect(data.supportWindowModes[1]).assertEqual(bundle.SupportWindowMode.SPLIT);
      expect(data.supportWindowModes[2]).assertEqual(bundle.SupportWindowMode.FLOATING);
      expect(data.windowSize.maxWindowRatio).assertEqual(0);
      expect(data.windowSize.minWindowRatio).assertEqual(0);
      expect(data.windowSize.maxWindowWidth).assertEqual(0);
      expect(data.windowSize.minWindowWidth).assertEqual(0);
      expect(data.windowSize.maxWindowHeight).assertEqual(0);
      expect(data.windowSize.minWindowHeight).assertEqual(0);
      console.info("checkCommonAbilityInfo end");
    }
  })
}