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
import { BusinessError } from '@kit.BasicServicesKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"

const BUNDLE_NAME = "ohos.acts.bundle.stage.test";
const VENDOR = "example";
const MODULE_NAME = "testModule";
const SOURCE_DIR = "/data/app/el1/bundle/public/ohos.acts.bundle.stage.test/testModule";
const ABILITY_NAME = "ohos.acts.bundle.stage.test.MainAbility";
const ABILITY_NAME1 = "ohos.acts.bundle.stage.test.MainAbility1";
const APPID = "ohos.acts.bundle.stage.test_BNtg4JBClbl92Rgc3jm/RfcAdrHXaM8F0QO" +
"iwVEhnV5ebE5jNIYnAx+weFRT3QTyUjRNdhmc2aAzWyi+5t5CoBM=";
const FINGERPRINT = "8E93863FC32EE238060BF69A9B37E2608FFFB21F93C862DD511CBAC9F30024B5";
const CERTIFICATE = "-----BEGIN CERTIFICATE-----"
const PARAM_ERROR_CODE = 401;

export default function getBundleInfoForSelf() {
  describe('getBundleInfoForSelf', () => {
    /**
     * @tc.name   getBundleInfoForSelfPro
     * @tc.number Sub_Bms_Framework_Query_AppInfo_5560
     * @tc.desc   Test getBundleInfoForSelf with default flag(by promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getBundleInfoForSelfPro', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) =>  {
      await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).then(data => {
        console.info("getBundleInfoForSelfPro" + JSON.stringify(data));
        expect(bundle.CompatiblePolicy.BACKWARD_COMPATIBILITY).assertEqual(1);
        expect(data.name).assertEqual(BUNDLE_NAME);
        expect(data.vendor).assertEqual(VENDOR);
        expect(data.versionCode).assertEqual(1000000);
        expect(data.versionName).assertEqual("1.0.0");
        expect(data.buildVersion).assertEqual("1.0.0");
        expect(data.minCompatibleVersionCode).assertEqual(1000000);
        expect(data.targetVersion).assertLarger(16);
        expect(data.installTime).assertLarger(0);
        expect(data.updateTime).assertLarger(0);
        expect(data.firstInstallTime).assertLarger(0);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        done();
      }).catch((err: BusinessError) => {
        console.info("getBundleInfoForSelf fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
    })

    /**
     * @tc.name   getBundleInfoForSelfCal
     * @tc.number Sub_Bms_Framework_Query_AppInfo_5580
     * @tc.desc   Test getBundleInfoForSelf with default flag(by callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getBundleInfoForSelfCal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) =>  {
      bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT, (err, data) => {
        console.info("getBundleInfoForSelfCal" + JSON.stringify(data));
        expect(data.name).assertEqual(BUNDLE_NAME);
        expect(data.vendor).assertEqual(VENDOR);
        expect(data.versionCode).assertEqual(1000000);
        expect(data.versionName).assertEqual("1.0.0");
        expect(data.buildVersion).assertEqual("1.0.0");
        expect(data.minCompatibleVersionCode).assertEqual(1000000);
        expect(data.targetVersion).assertLarger(16);
        expect(data.installTime).assertLarger(0);
        expect(data.updateTime).assertLarger(0);
        expect(data.firstInstallTime).assertLarger(0);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        expect(err).assertEqual(null);
        done();
      })
    })

    /**
     * @tc.name   getBundleInfoForSelfApplicationPro
     * @tc.number Sub_Bms_Framework_Query_AppInfo_5600
     * @tc.desc   Test getBundleInfoForSelf with application flag(by promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getBundleInfoForSelfApplicationPro', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) =>  {
      await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION).then(data => {
        console.info("getBundleInfoForSelfApplicationPro" + JSON.stringify(data.appInfo));
        checkCommonBundleInfo(data);
        expect(data.appInfo.debug).assertFalse();
        expect(bundle.ExtensionAbilityType.PRINT).assertEqual(15);
        expect(data.appInfo.bundleType).assertEqual(bundle.BundleType.APP);
        expect(data.appInfo.name).assertEqual(BUNDLE_NAME);
        expect(data.appInfo.description).assertEqual("$string:description_application");
        expect(data.appInfo.descriptionId).assertLarger(0);
        expect(data.appInfo.enabled).assertTrue();
        expect(data.appInfo.label).assertEqual("$string:app_name");
        expect(data.appInfo.labelId).assertLarger(0);
        expect(data.appInfo.icon).assertEqual("$media:app_icon");
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
        expect(data.appInfo.dataUnclearable).assertFalse();
        expect(JSON.stringify(data.appInfo.metadata)).assertEqual("{}");
        expect(data.hapModulesInfo.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        expect(data.appInfo.installSource).assertEqual("unknown");
        expect(data.appInfo.releaseType.length).assertLarger(0);
        expect(data.appInfo.cloudFileSyncEnabled).assertFalse();
        done();
      }).catch((err: BusinessError) => {
        console.info("getBundleInfoForSelf fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
    })

    /**
     * @tc.name   getBundleInfoForSelfApplicationCal
     * @tc.number Sub_Bms_Framework_Query_AppInfo_5620
     * @tc.desc   Test getBundleInfoForSelf with application flag(by callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getBundleInfoForSelfApplicationCal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) =>  {
      bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION, (err, data) => {
        console.info("ApplicationCal" + JSON.stringify(data.appInfo));
        checkCommonBundleInfo(data);
        expect(data.appInfo.name).assertEqual(BUNDLE_NAME);
        expect(data.appInfo.description).assertEqual("$string:description_application");
        expect(data.appInfo.descriptionId).assertLarger(0);
        expect(data.appInfo.enabled).assertTrue();
        expect(data.appInfo.label).assertEqual("$string:app_name");
        expect(data.appInfo.labelId).assertLarger(0);
        expect(data.appInfo.icon).assertEqual("$media:app_icon");
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

    /**
     * @tc.name   getBundleInfoForSelfMetadata
     * @tc.number SUB_BMS_APPINFO_QUERY_1121
     * @tc.desc   Test getBundleInfoForSelf with application and metadata flag(by callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getBundleInfoForSelfMetadata', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) =>  {
      bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION
        | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA, (err, data) => {
        console.info("ApplicationInfo" + JSON.stringify(data.appInfo));
        checkCommonBundleInfo(data);
        expect(data.appInfo.metadata["testModule"].length).assertLarger(0);
        let metadataArray = data.appInfo.metadataArray;
        expect(metadataArray.length).assertEqual(1);
        let moduleMetadata = metadataArray[0];
        expect(moduleMetadata.moduleName).assertEqual("testModule");
        expect(moduleMetadata.metadata.length).assertLarger(0);

        expect(data.hapModulesInfo.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        expect(err).assertEqual(null);
        done();
      })
    })

    /**
     * @tc.name   getBundleInfoForSelfModulePro
     * @tc.number Sub_Bms_Framework_Query_AppInfo_5640
     * @tc.desc   Test getBundleInfoForSelf with hapModuleInfo flag(by promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getBundleInfoForSelfModulePro', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) =>  {
      await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE).then(data => {
        console.info("ModulePro" + JSON.stringify(data.hapModulesInfo[0]));
        checkCommonBundleInfo(data);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length).assertEqual(1);
        expect(data.hapModulesInfo[0].name).assertEqual("testModule");
        expect(data.hapModulesInfo[0].icon).assertEqual("");
        expect(data.hapModulesInfo[0].iconId).assertEqual(0);
        expect(data.hapModulesInfo[0].label).assertEqual("$string:TestAbility_label");
        expect(data.hapModulesInfo[0].labelId).assertLarger(0);
        expect(data.hapModulesInfo[0].description).assertEqual("$string:module_test_desc");
        expect(data.hapModulesInfo[0].descriptionId).assertLarger(0);
        expect(data.hapModulesInfo[0].mainElementName).assertEqual("TestAbility");
        expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0);
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(0);
        expect(data.hapModulesInfo[0].metadata.length).assertEqual(0);
        expect(data.hapModulesInfo[0].deviceTypes.length).assertEqual(0);
        expect(data.hapModulesInfo[0].installationFree).assertFalse();
        expect(data.hapModulesInfo[0].hashValue).assertEqual("");
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        done();
      }).catch((err: BusinessError) => {
        console.info("getBundleInfoForSelf fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
    })

    /**
     * @tc.name   getBundleInfoForSelfEntryModuleInfo
     * @tc.number Sub_Bms_Framework_Query_AppInfo_5641
     * @tc.desc   Test getBundleInfoForSelf with hapModuleInfo flag(by promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getBundleInfoForSelfEntryModuleInfo', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) =>  {
      await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_ENTRY_MODULE).then(data => {
        console.info("ModulePro" + JSON.stringify(data));
        checkCommonBundleInfo(data);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        done();
      }).catch((err: BusinessError) => {
        console.info("getBundleInfoForSelf fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
    })

    /**
     * @tc.name   getBundleInfoForSelfModuleCal
     * @tc.number Sub_Bms_Framework_Query_AppInfo_5660
     * @tc.desc   Test getBundleInfoForSelf with hapModuleInfo flag(by callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getBundleInfoForSelfModuleCal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) =>  {
      bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE, (err, data) => {
        console.info("getBundleInfoForSelfPro" + JSON.stringify(data.hapModulesInfo));
        checkCommonBundleInfo(data);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length).assertEqual(1);
        expect(data.hapModulesInfo[0].name).assertEqual("testModule");
        expect(data.hapModulesInfo[0].icon).assertEqual("");
        expect(data.hapModulesInfo[0].iconId).assertEqual(0);
        expect(data.hapModulesInfo[0].label).assertEqual("$string:TestAbility_label");
        expect(data.hapModulesInfo[0].labelId).assertLarger(0);
        expect(data.hapModulesInfo[0].description).assertEqual("$string:module_test_desc");
        expect(data.hapModulesInfo[0].descriptionId).assertLarger(0);
        expect(data.hapModulesInfo[0].mainElementName).assertEqual("TestAbility");
        expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0);
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(0);
        expect(data.hapModulesInfo[0].metadata.length).assertEqual(0);
        expect(data.hapModulesInfo[0].deviceTypes.length).assertEqual(0);
        expect(data.hapModulesInfo[0].installationFree).assertFalse();
        expect(data.hapModulesInfo[0].hashValue).assertEqual("");
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        expect(err).assertEqual(null);
        done();
      })
    })

    /**
     * @tc.name   getBundleInfoForSelfAbilityPro
     * @tc.number Sub_Bms_Framework_Query_AppInfo_5680
     * @tc.desc   Test getBundleInfoForSelf with ability flag(by promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getBundleInfoForSelfAbilityPro', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) =>  {
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
        expect(data.hapModulesInfo[0].abilitiesInfo[0].label).assertEqual("$string:TestAbility_label");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].labelId).assertLarger(0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].description).assertEqual("$string:TestAbility_desc");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].descriptionId).assertLarger(0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].icon).assertEqual("$media:icon");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].iconId).assertLarger(0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].process).assertEqual("");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].exported).assertTrue();
        expect(data.hapModulesInfo[0].abilitiesInfo[0].excludeFromDock).assertFalse();
        expect(data.hapModulesInfo[0].abilitiesInfo[0].orientation).assertEqual(bundle.DisplayOrientation.PORTRAIT);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].launchType).assertEqual(bundle.LaunchType.SINGLETON);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].permissions.length).assertEqual(0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].deviceTypes.length).assertEqual(0);
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
        expect(data.hapModulesInfo[0].abilitiesInfo[0].orientationId).assertEqual(0);
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
      }).catch((err: BusinessError) => {
        console.info("getBundleInfoForSelf fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
    })

    /**
     * @tc.name   getBundleInfoForSelfAbilityCal
     * @tc.number Sub_Bms_Framework_Query_AppInfo_5700
     * @tc.desc   Test getBundleInfoForSelf with ability flag(by callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getBundleInfoForSelfAbilityCal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) =>  {
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
          expect(data.hapModulesInfo[0].abilitiesInfo[0].label).assertEqual("$string:TestAbility_label");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].labelId).assertLarger(0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].description).assertEqual("$string:TestAbility_desc");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].descriptionId).assertLarger(0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].icon).assertEqual("$media:icon");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].iconId).assertLarger(0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].process).assertEqual("");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].exported).assertTrue();
          expect(data.hapModulesInfo[0].abilitiesInfo[0].excludeFromDock).assertFalse();
          expect(data.hapModulesInfo[0].abilitiesInfo[0].orientation).assertEqual(bundle.DisplayOrientation.PORTRAIT);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].launchType).assertEqual(bundle.LaunchType.SINGLETON);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].permissions.length).assertEqual(0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].deviceTypes.length).assertEqual(0);
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

    /**
     * @tc.name   getBundleInfoForSelfExtensionPro
     * @tc.number Sub_Bms_Framework_Query_AppInfo_5720
     * @tc.desc   Test getBundleInfoForSelf with extensionAbility flag(by promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getBundleInfoForSelfExtensionPro', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) =>  {
      await bundle.getBundleInfoForSelf(
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY
      ).then(data => {
        console.info("ExtensionPro" + JSON.stringify(data.hapModulesInfo[0].extensionAbilitiesInfo));
        checkCommonBundleInfo(data);
        checkCommonHapModuleInfo(data);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0);
        let extensionList = data.hapModulesInfo[0].extensionAbilitiesInfo
        expect(extensionList.length).assertEqual(31);
        let count = 0;
        for (let i = 0;i < extensionList.length; i++) {
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
              expect(extensionList[i].extensionAbilityTypeName).assertEqual("form");
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
            case 'driver':
              console.info("driver" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.DRIVER)
              count = count + 14;
              break;
            case 'push':
              console.info("push" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.PUSH)
              count = count + 15;
              break;
            case 'share':
              console.info("share" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.SHARE)
              count = count + 16;
              break;
            case 'action':
              console.info("action" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.ACTION)
              count = count + 19;
              break;
            case 'adsService':
              console.info("adsService" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.ADS_SERVICE)
              count = count + 20;
              break;
            case 'embeddedUI':
              console.info("embeddedUI" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.EMBEDDED_UI)
              count = count + 21;
              break;
            case 'assetAcceleration':
              console.info("assetAcceleration" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.ASSET_ACCELERATION)
              count = count + 22;
              break;
            case 'formEdit':
              console.info("formEdit" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.FORM_EDIT)
              count = count + 23;
              break;
            case 'fence':
              console.info("fence" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.FENCE)
              count = count + 24;
              break;
            case 'callerInfoQuery':
              console.info("callerInfoQuery" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.CALLER_INFO_QUERY)
              count = count + 25
              break;
            case 'appService':
              console.info("callerInfoQuery" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.APP_SERVICE)
              count = count + 26
              break;
            case 'distributed':
              console.info("distributed" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.DISTRIBUTED)
              count = count + 27
              break;
            case 'liveForm':
              console.info("liveForm" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.LIVE_FORM)
              count = count + 28
              break;
            case 'webNativeMessaging':
              console.info("webNativeMessaging" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.WEB_NATIVE_MESSAGING)
              count = count + 29
              break;
            case 'notificationSubscriber':
              console.info("notificationSubscriber" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.NOTIFICATION_SUBSCRIBER)
              count = count + 30
              break;
            case 'crypto':
              console.info("crypto" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.CRYPTO)
              count = count + 35
              break;
            case 'partnerAgent':
              console.info("partnerAgent" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.PARTNER_AGENT)
              count = count + 36
              break;
          }
          console.info("count" + JSON.stringify(count));
        }
        expect(count).assertEqual(501);
        expect(data.hapModulesInfo[0].metadata.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        done();
      }).catch((err: BusinessError) => {
        console.info("getBundleInfoForSelf fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
    })

    /**
     * @tc.name   getBundleInfoForSelfExtensionCal
     * @tc.number Sub_Bms_Framework_Query_AppInfo_5740
     * @tc.desc   Test getBundleInfoForSelf with extensionAbility flag(by callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getBundleInfoForSelfExtensionCal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) =>  {
      bundle.getBundleInfoForSelf(
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY,
        (err, data) => {
          console.info("ExtensionCal" + JSON.stringify(data.hapModulesInfo[0].extensionAbilitiesInfo));
          checkCommonBundleInfo(data);
          checkCommonHapModuleInfo(data);
          expect(data.appInfo).assertEqual(null);
          expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0);
          let extensionList = data.hapModulesInfo[0].extensionAbilitiesInfo
          expect(extensionList.length).assertEqual(31);
          let count = 0;
          for (let i = 0;i < extensionList.length; i++) {
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
                expect(extensionList[i].extensionAbilityTypeName).assertEqual("form");
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
              case 'driver':
                console.info("driver" + JSON.stringify(extensionList[i].extensionAbilityType));
                expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.DRIVER)
                count = count + 14;
                break;
              case 'push':
                console.info("push" + JSON.stringify(extensionList[i].extensionAbilityType));
                expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.PUSH)
                count = count + 15;
                break;
              case 'share':
                console.info("share" + JSON.stringify(extensionList[i].extensionAbilityType));
                expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.SHARE)
                count = count + 16;
                break;
              case 'action':
                console.info("action" + JSON.stringify(extensionList[i].extensionAbilityType));
                expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.ACTION)
                count = count + 19;
                break;
              case 'adsService':
                console.info("adsService" + JSON.stringify(extensionList[i].extensionAbilityType));
                expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.ADS_SERVICE)
                count = count + 20;
                break;
              case 'embeddedUI':
                console.info("embeddedUI" + JSON.stringify(extensionList[i].extensionAbilityType));
                expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.EMBEDDED_UI)
                count = count + 21;
                break;
              case 'assetAcceleration':
                console.info("assetAcceleration" + JSON.stringify(extensionList[i].extensionAbilityType));
                expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.ASSET_ACCELERATION)
                count = count + 22;
                break;
              case 'formEdit':
                console.info("formEdit" + JSON.stringify(extensionList[i].extensionAbilityType));
                expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.FORM_EDIT)
                count = count + 23;
                break;
            case 'fence':
              console.info("fence" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.FENCE)
              count = count + 24;
              break;
            case 'callerInfoQuery':
              console.info("callerInfoQuery" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.CALLER_INFO_QUERY)
              count = count + 25
              break;
            case 'appService':
              console.info("callerInfoQuery" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.APP_SERVICE)
              count = count + 26
              break;
            case 'distributed':
              console.info("distributed" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.DISTRIBUTED)
              count = count + 27
              break;
            case 'liveForm':
              console.info("liveForm" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.LIVE_FORM)
              count = count + 28
              break;
            case 'webNativeMessaging':
              console.info("webNativeMessaging" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.WEB_NATIVE_MESSAGING)
              count = count + 29
              break;
            case 'notificationSubscriber':
              console.info("notificationSubscriber" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.NOTIFICATION_SUBSCRIBER)
              count = count + 30
              break;
            case 'crypto':
              console.info("crypto" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.CRYPTO)
              count = count + 35
              break;
            case 'partnerAgent':
              console.info("partnerAgent" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.PARTNER_AGENT)
              count = count + 36
              break;
            }
            console.info("count" + JSON.stringify(count));
          }
          expect(count).assertEqual(501);
          expect(data.hapModulesInfo[0].metadata.length).assertEqual(0);
          expect(data.reqPermissionDetails.length).assertEqual(0);
          expect(data.permissionGrantStates.length).assertEqual(0);
          expect(data.signatureInfo).assertEqual(null);
          expect(err).assertEqual(null);
          expect(bundle.ExtensionAbilityType.SERVICE).assertEqual(3);
          expect(bundle.ExtensionAbilityType.DATA_SHARE).assertEqual(5);
          expect(bundle.ExtensionAbilityType.EMBEDDED_UI).assertEqual(21);
          expect(bundle.ExtensionAbilityType.UNSPECIFIED).assertEqual(255);
          done();
        })
    })

    /**
     * @tc.name   getBundleInfoForSelfPermissionPro
     * @tc.number Sub_Bms_Framework_Query_AppInfo_5760
     * @tc.desc   Test getBundleInfoForSelf with permission flag(by promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getBundleInfoForSelfPermissionPro', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) =>  {
      await bundle.getBundleInfoForSelf(
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION).then(data => {
        console.info("PermissionPro" + JSON.stringify(data.reqPermissionDetails));
        console.info("PermissionPro" + JSON.stringify(data.permissionGrantStates));
        checkCommonBundleInfo(data);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(3);
        expect(data.reqPermissionDetails[0].name).assertEqual("ohos.permission.GET_BUNDLE_INFO");
        expect(data.reqPermissionDetails[0].moduleName).assertEqual("testModule");
        expect(data.reqPermissionDetails[0].reason).assertEqual("$string:permission_reason");
        expect(data.reqPermissionDetails[0].reasonId).assertLarger(0);
        expect(data.reqPermissionDetails[0].usedScene.abilities.length).assertEqual(1);
        expect(data.reqPermissionDetails[0].usedScene.abilities[0]).assertEqual("MainAbility");
        expect(data.reqPermissionDetails[0].usedScene.when).assertEqual("always");
        expect(data.permissionGrantStates[0]).assertEqual(bundle.PermissionGrantState.PERMISSION_GRANTED);
        expect(data.reqPermissionDetails[1].name).assertEqual("ohos.permission.READ_CALENDAR");
        expect(data.reqPermissionDetails[1].moduleName).assertEqual("testModule");
        expect(data.reqPermissionDetails[1].reason).assertEqual("$string:permission_reason");
        expect(data.reqPermissionDetails[1].reasonId).assertLarger(0);
        expect(data.reqPermissionDetails[1].usedScene.abilities.length).assertEqual(1);
        expect(data.reqPermissionDetails[1].usedScene.abilities[0]).assertEqual("MainAbility");
        expect(data.reqPermissionDetails[1].usedScene.when).assertEqual("inuse");
        expect(data.permissionGrantStates[1]).assertEqual(bundle.PermissionGrantState.PERMISSION_DENIED);
        expect(data.signatureInfo).assertEqual(null);
        done();
      }).catch((err: BusinessError) => {
        console.info("getBundleInfoForSelf fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
    })

    /**
     * @tc.name   getBundleInfoForSelfPermissionCal
     * @tc.number Sub_Bms_Framework_Query_AppInfo_5780
     * @tc.desc   Test getBundleInfoForSelf with permission flag(by callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getBundleInfoForSelfPermissionCal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) =>  {
      bundle.getBundleInfoForSelf(
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION, (err, data) => {
        console.info("PermissionPro" + JSON.stringify(data.reqPermissionDetails));
        console.info("PermissionPro" + JSON.stringify(data.permissionGrantStates));
        checkCommonBundleInfo(data);
        expect(data.appInfo).assertEqual(null);
        expect(data.reqPermissionDetails.length).assertEqual(3);
        expect(data.reqPermissionDetails[0].name).assertEqual("ohos.permission.GET_BUNDLE_INFO");
        expect(data.reqPermissionDetails[0].moduleName).assertEqual("testModule");
        expect(data.reqPermissionDetails[0].reason).assertEqual("$string:permission_reason");
        expect(data.reqPermissionDetails[0].reasonId).assertLarger(0);
        expect(data.reqPermissionDetails[0].usedScene.abilities.length).assertEqual(1);
        expect(data.reqPermissionDetails[0].usedScene.abilities[0]).assertEqual("MainAbility");
        expect(data.reqPermissionDetails[0].usedScene.when).assertEqual("always");
        expect(data.permissionGrantStates[0]).assertEqual(bundle.PermissionGrantState.PERMISSION_GRANTED);
        expect(data.reqPermissionDetails[1].name).assertEqual("ohos.permission.READ_CALENDAR");
        expect(data.reqPermissionDetails[1].moduleName).assertEqual("testModule");
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

    /**
     * @tc.name   getBundleInfoForSelfMetaPro
     * @tc.number Sub_Bms_Framework_Query_AppInfo_5800
     * @tc.desc   Test getBundleInfoForSelf with metadata flag(by promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getBundleInfoForSelfMetaPro', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) =>  {
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
          expect(data.hapModulesInfo[0].metadata[0].valueId).assertEqual(0);
          expect(data.hapModulesInfo[0].metadata[0].resource).assertEqual("$profile:shortcuts_config");
          expect(data.reqPermissionDetails.length).assertEqual(0);
          expect(data.permissionGrantStates.length).assertEqual(0);
          expect(data.signatureInfo).assertEqual(null);
          done();
        })
        .catch((err: BusinessError) => {
          console.info("getBundleInfoForSelf fail" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
    })

    /**
     * @tc.name   getBundleInfoForSelfMetaCal
     * @tc.number Sub_Bms_Framework_Query_AppInfo_5820
     * @tc.desc   Test getBundleInfoForSelf with metadata flag(by callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getBundleInfoForSelfMetaCal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) =>  {
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
          expect(data.hapModulesInfo[0].metadata[0].valueId).assertEqual(0);
          expect(data.hapModulesInfo[0].metadata[0].resource).assertEqual("$profile:shortcuts_config");
          expect(data.reqPermissionDetails.length).assertEqual(0);
          expect(data.permissionGrantStates.length).assertEqual(0);
          expect(data.signatureInfo).assertEqual(null);
          expect(err).assertEqual(null);
          done();
        })
    })

    /**
     * @tc.name   getBundleInfoForSelfSigPro
     * @tc.number Sub_Bms_Framework_Query_AppInfo_5840
     * @tc.desc   Test getBundleInfoForSelf with signatureInfo flag(by promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getBundleInfoForSelfSigPro', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) =>  {
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
        expect(data.signatureInfo.certificate).assertContain(CERTIFICATE);
        done();
      }).catch((err: BusinessError) => {
        console.info("getBundleInfoForSelf fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
    })

    /**
     * @tc.name   getBundleInfoForSelfSigCal
     * @tc.number Sub_Bms_Framework_Query_AppInfo_5860
     * @tc.desc   Test getBundleInfoForSelf with signatureInfo flag(by callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getBundleInfoForSelfSigCal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) =>  {
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
        expect(data.signatureInfo.certificate).assertContain(CERTIFICATE);
        expect(err).assertEqual(null);
        done();
      })
    })

    /**
     * @tc.name   getBundleInfoForSelfDisPro
     * @tc.number Sub_Bms_Framework_Query_AppInfo_5880
     * @tc.desc   Test getBundleInfoForSelf with disable flag(by promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getBundleInfoForSelfDisPro', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) =>  {
      await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_DISABLE).then(data => {
        console.info("DisPro" + JSON.stringify(data));
        checkCommonBundleInfo(data);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        done();
      }).catch((err: BusinessError) => {
        console.info("getBundleInfoForSelf fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
    })

    /**
     * @tc.name   getBundleInfoForSelfDisCal
     * @tc.number Sub_Bms_Framework_Query_AppInfo_5900
     * @tc.desc   Test getBundleInfoForSelf with disable flag(by callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getBundleInfoForSelfDisCal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) =>  {
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

    /**
     * @tc.name   getBundleInfoForSelfParamErrPro
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_4560
     * @tc.desc   Test getBundleInfoForSelf with error param(by promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getBundleInfoForSelfParamErrPro', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      try {
        await bundle.getBundleInfoForSelf(null).then(data => {
          console.info("ParamErrPro null success " + JSON.stringify(data));
          expect(data).assertFail();
        }).catch((err: BusinessError) => {
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
        }).catch((err: BusinessError) => {
          console.info("ParamErrPro undefined fail1 " + JSON.stringify(err));
          expect(err).assertFail();
        })
      } catch (err) {
        console.info("ParamErrPro undefined fail2 " + JSON.stringify(err));
        expect(err.code).assertEqual(PARAM_ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.name   getBundleInfoForSelfParamErrCal
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_4580
     * @tc.desc   Test getBundleInfoForSelf with error param(by callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getBundleInfoForSelfParamErrCal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
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

    /**
     * @tc.name   getBundleInfoForSelfSyncParamNull
     * @tc.number Sub_Bms_Framework_Query_AppInfo_6980
     * @tc.desc   Test getBundleInfoForSelfSync with null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getBundleInfoForSelfSyncParamNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      try {
        let bundleInfo = bundle.getBundleInfoForSelfSync(null);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("getBundleInfoForSelfSyncParamNull null fail2 " + JSON.stringify(err));
        expect(err.code).assertEqual(PARAM_ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.name   getBundleInfoForSelfSyncParamUndefined
     * @tc.number Sub_Bms_Framework_Query_AppInfo_7000
     * @tc.desc   Test getBundleInfoForSelfSync with undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getBundleInfoForSelfSyncParamUndefined', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      try {
        let bundleInfo = bundle.getBundleInfoForSelfSync(undefined);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("getBundleInfoForSelfSyncParamUndefined undefined fail2 " + JSON.stringify(err));
        expect(err.code).assertEqual(PARAM_ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.name   getBundleInfoForSelfSyncDefault
     * @tc.number Sub_Bms_Framework_Query_AppInfo_7020
     * @tc.desc   Test getBundleInfoForSelfSync with default flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getBundleInfoForSelfSyncDefault', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) =>  {
      let data = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT);
      console.info("getBundleInfoForSelfSyncDefault" + JSON.stringify(data));
      expect(data.name).assertEqual(BUNDLE_NAME);
      expect(data.vendor).assertEqual(VENDOR);
      expect(data.versionCode).assertEqual(1000000);
      expect(data.versionName).assertEqual("1.0.0");
      expect(data.buildVersion).assertEqual("1.0.0");
      expect(data.minCompatibleVersionCode).assertEqual(1000000);
      expect(data.targetVersion).assertLarger(16);
      expect(data.installTime).assertLarger(0);
      expect(data.updateTime).assertLarger(0);
      expect(data.firstInstallTime).assertLarger(0);
      expect(data.appInfo).assertEqual(null);
      expect(data.hapModulesInfo.length).assertEqual(0);
      expect(data.reqPermissionDetails.length).assertEqual(0);
      expect(data.permissionGrantStates.length).assertEqual(0);
      expect(data.signatureInfo).assertEqual(null);
      done();
    })

    /**
     * @tc.name   getBundleInfoForSelfSyncAppInfo
     * @tc.number Sub_Bms_Framework_Query_AppInfo_7040
     * @tc.desc   Test getBundleInfoForSelfSync with appInfo flag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getBundleInfoForSelfSyncAppInfo', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) =>  {
      let data = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
      console.info("getBundleInfoForSelfSyncAppInfo" + JSON.stringify(data.appInfo));
      checkCommonBundleInfo(data);
      expect(data.appInfo.debug).assertFalse();
      expect(bundle.ExtensionAbilityType.PRINT).assertEqual(15);
      expect(data.appInfo.bundleType).assertEqual(bundle.BundleType.APP);
      expect(data.appInfo.name).assertEqual(BUNDLE_NAME);
      expect(data.appInfo.description).assertEqual("$string:description_application");
      expect(data.appInfo.descriptionId).assertLarger(0);
      expect(data.appInfo.enabled).assertTrue();
      expect(data.appInfo.label).assertEqual("$string:app_name");
      expect(data.appInfo.labelId).assertLarger(0);
      expect(data.appInfo.icon).assertEqual("$media:app_icon");
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
    })

    /**
     * @tc.name   getBundleInfoForSelfSyncHapModuleInfo
     * @tc.number Sub_Bms_Framework_Query_AppInfo_7060
     * @tc.desc   Test getBundleInfoForSelfSync with hapModuleInfo flag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getBundleInfoForSelfSyncHapModuleInfo', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) =>  {
      let data = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE);
      console.info("getBundleInfoForSelfSyncHapModuleInfo" + JSON.stringify(data.hapModulesInfo));
      checkCommonBundleInfo(data);
      expect(data.appInfo).assertEqual(null);
      expect(data.hapModulesInfo.length).assertEqual(1);
      expect(data.hapModulesInfo[0].name).assertEqual("testModule");
      expect(data.hapModulesInfo[0].icon).assertEqual("");
      expect(data.hapModulesInfo[0].iconId).assertEqual(0);
      expect(data.hapModulesInfo[0].label).assertEqual("$string:TestAbility_label");
      expect(data.hapModulesInfo[0].labelId).assertLarger(0);
      expect(data.hapModulesInfo[0].description).assertEqual("$string:module_test_desc");
      expect(data.hapModulesInfo[0].descriptionId).assertLarger(0);
      expect(data.hapModulesInfo[0].mainElementName).assertEqual("TestAbility");
      expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0);
      expect(data.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(0);
      expect(data.hapModulesInfo[0].metadata.length).assertEqual(0);
      expect(data.hapModulesInfo[0].deviceTypes.length).assertEqual(0);
      expect(data.hapModulesInfo[0].installationFree).assertFalse();
      expect(data.hapModulesInfo[0].hashValue).assertEqual("");
      expect(data.reqPermissionDetails.length).assertEqual(0);
      expect(data.permissionGrantStates.length).assertEqual(0);
      expect(data.signatureInfo).assertEqual(null);
      done();
    })

    /**
     * @tc.name   getBundleInfoForSelfSyncAbilitiesInfo
     * @tc.number Sub_Bms_Framework_Query_AppInfo_7080
     * @tc.desc   Test getBundleInfoForSelfSync with abilitiesInfo flag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getBundleInfoForSelfSyncAbilitiesInfo', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) =>  {
      let data = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY);
      console.info("getBundleInfoForSelfSyncAbilitiesInfo" + JSON.stringify(data.hapModulesInfo[0].abilitiesInfo));
      for (let count = 0; count < 11; count++) {
        console.info(count + "getBundleInfoForSelfSyncAbilitiesInfo::" + JSON.stringify(data.hapModulesInfo[0].abilitiesInfo[count]));
      }
      checkCommonBundleInfo(data);
      checkCommonHapModuleInfo(data);
      expect(data.appInfo).assertEqual(null);
      expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(11);
      expect(data.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(BUNDLE_NAME);
      expect(data.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual("testModule");
      expect(data.hapModulesInfo[0].abilitiesInfo[0].name).assertEqual("ohos.acts.bundle.stage.test.MainAbility");
      expect(data.hapModulesInfo[0].abilitiesInfo[0].label).assertEqual("$string:TestAbility_label");
      expect(data.hapModulesInfo[0].abilitiesInfo[0].labelId).assertLarger(0);
      expect(data.hapModulesInfo[0].abilitiesInfo[0].description).assertEqual("$string:TestAbility_desc");
      expect(data.hapModulesInfo[0].abilitiesInfo[0].descriptionId).assertLarger(0);
      expect(data.hapModulesInfo[0].abilitiesInfo[0].icon).assertEqual("$media:icon");
      expect(data.hapModulesInfo[0].abilitiesInfo[0].iconId).assertLarger(0);
      expect(data.hapModulesInfo[0].abilitiesInfo[0].process).assertEqual("");
      expect(data.hapModulesInfo[0].abilitiesInfo[0].exported).assertTrue();
      expect(data.hapModulesInfo[0].abilitiesInfo[0].excludeFromDock).assertFalse();
      expect(data.hapModulesInfo[0].abilitiesInfo[0].orientation).assertEqual(bundle.DisplayOrientation.PORTRAIT);
      expect(data.hapModulesInfo[0].abilitiesInfo[0].launchType).assertEqual(bundle.LaunchType.SINGLETON);
      expect(data.hapModulesInfo[0].abilitiesInfo[0].permissions.length).assertEqual(0);
      expect(data.hapModulesInfo[0].abilitiesInfo[0].deviceTypes.length).assertEqual(0);
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
    })

    /**
     * @tc.name   getBundleInfoForSelfSyncExtensionAbilitiesInfo
     * @tc.number Sub_Bms_Framework_Query_AppInfo_7100
     * @tc.desc   Test getBundleInfoForSelfSync with extensionAbilitiesInfo flag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getBundleInfoForSelfSyncExtensionAbilitiesInfo', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) =>  {
      let data = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY);
      console.info("getBundleInfoForSelfSyncExtensionAbilitiesInfo" + JSON.stringify(data.hapModulesInfo[0].extensionAbilitiesInfo));
      checkCommonBundleInfo(data);
      checkCommonHapModuleInfo(data);
      expect(data.appInfo).assertEqual(null);
      expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0);
      let extensionList = data.hapModulesInfo[0].extensionAbilitiesInfo
      expect(extensionList.length).assertEqual(31);
      let count = 0;
      for (let i = 0;i < extensionList.length; i++) {
        switch (extensionList[i].name) {
          case "Form":
            console.info("Form" + JSON.stringify(extensionList[i]));
            expect(extensionList[i].bundleName).assertEqual(BUNDLE_NAME);
            expect(extensionList[i].moduleName).assertEqual("testModule");
            expect(extensionList[i].name).assertEqual("Form");
            expect(extensionList[i].labelId).assertLarger(0);
            expect(extensionList[i].descriptionId).assertLarger(0);
            expect(extensionList[i].iconId).assertLarger(0);
            expect(extensionList[i].exported).assertTrue();
            expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.FORM);
            expect(extensionList[i].extensionAbilityTypeName).assertEqual("form");
            expect(extensionList[i].permissions.length).assertEqual(0);
            expect(extensionList[i].applicationInfo).assertEqual(null);
            expect(extensionList[i].metadata.length).assertEqual(0);
            expect(extensionList[i].enabled).assertTrue();
            expect(extensionList[i].readPermission).assertEqual("");
            expect(extensionList[i].writePermission).assertEqual("");
            expect(extensionList[i].appIndex).assertEqual(0);
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
            expect(extensionList[i].appIndex).assertEqual(0);
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
          case 'driver':
            console.info("driver" + JSON.stringify(extensionList[i].extensionAbilityType));
            expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.DRIVER)
            count = count + 14;
            break;
          case 'push':
            console.info("push" + JSON.stringify(extensionList[i].extensionAbilityType));
            expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.PUSH)
            count = count + 15;
            break;
          case 'share':
            console.info("share" + JSON.stringify(extensionList[i].extensionAbilityType));
            expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.SHARE)
            count = count + 16;
            break;
          case 'action':
            console.info("action" + JSON.stringify(extensionList[i].extensionAbilityType));
            expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.ACTION)
            count = count + 19;
            break;
          case 'adsService':
            console.info("adsService" + JSON.stringify(extensionList[i].extensionAbilityType));
            expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.ADS_SERVICE)
            count = count + 20;
            break;
          case 'embeddedUI':
            console.info("embeddedUI" + JSON.stringify(extensionList[i].extensionAbilityType));
            expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.EMBEDDED_UI)
            count = count + 21;
            break;
          case 'assetAcceleration':
            console.info("assetAcceleration" + JSON.stringify(extensionList[i].extensionAbilityType));
            expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.ASSET_ACCELERATION)
            count = count + 22;
            break;
          case 'formEdit':
            console.info("formEdit" + JSON.stringify(extensionList[i].extensionAbilityType));
            expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.FORM_EDIT)
            count = count + 23;
            break;
          case 'fence':
            console.info("fence" + JSON.stringify(extensionList[i].extensionAbilityType));
            expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.FENCE)
            count = count + 24;
            break;
          case 'callerInfoQuery':
              console.info("callerInfoQuery" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.CALLER_INFO_QUERY)
              count = count + 25
              break;
          case 'appService':
              console.info("callerInfoQuery" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.APP_SERVICE)
              count = count + 26
              break;
          case 'distributed':
              console.info("distributed" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.DISTRIBUTED)
              count = count + 27
              break;
          case 'liveForm':
              console.info("liveForm" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.LIVE_FORM)
              count = count + 28
              break;
          case 'webNativeMessaging':
              console.info("webNativeMessaging" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.WEB_NATIVE_MESSAGING)
              count = count + 29
              break;
          case 'notificationSubscriber':
              console.info("notificationSubscriber" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.NOTIFICATION_SUBSCRIBER)
              count = count + 30
              break;
          case 'crypto':
              console.info("crypto" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.CRYPTO)
              count = count + 35
              break;
          case 'partnerAgent':
              console.info("partnerAgent" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.PARTNER_AGENT)
              count = count + 36
              break;
        }
        console.info("count" + JSON.stringify(count));
      }
      expect(count).assertEqual(501);
      expect(data.hapModulesInfo[0].metadata.length).assertEqual(0);
      expect(data.reqPermissionDetails.length).assertEqual(0);
      expect(data.permissionGrantStates.length).assertEqual(0);
      expect(data.signatureInfo).assertEqual(null);
      done();
    })

    /**
     * @tc.name   getBundleInfoForSelfSyncReqPermissionDetails
     * @tc.number Sub_Bms_Framework_Query_AppInfo_7120
     * @tc.desc   Test getBundleInfoForSelfSync with reqPermissionDetails flag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getBundleInfoForSelfSyncReqPermissionDetails', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) =>  {
      let data = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION);
      console.info("getBundleInfoForSelfSyncReqPermissionDetails" + JSON.stringify(data.reqPermissionDetails));
      console.info("getBundleInfoForSelfSyncReqPermissionDetails" + JSON.stringify(data.permissionGrantStates));
      checkCommonBundleInfo(data);
      expect(data.appInfo).assertEqual(null);
      expect(data.hapModulesInfo.length).assertEqual(0);
      expect(data.reqPermissionDetails.length).assertEqual(3);
      expect(data.reqPermissionDetails[0].name).assertEqual("ohos.permission.GET_BUNDLE_INFO");
      expect(data.reqPermissionDetails[0].moduleName).assertEqual("testModule");
      expect(data.reqPermissionDetails[0].reason).assertEqual("$string:permission_reason");
      expect(data.reqPermissionDetails[0].reasonId).assertLarger(0);
      expect(data.reqPermissionDetails[0].usedScene.abilities.length).assertEqual(1);
      expect(data.reqPermissionDetails[0].usedScene.abilities[0]).assertEqual("MainAbility");
      expect(data.reqPermissionDetails[0].usedScene.when).assertEqual("always");
      expect(data.permissionGrantStates[0]).assertEqual(bundle.PermissionGrantState.PERMISSION_GRANTED);
      expect(data.reqPermissionDetails[1].name).assertEqual("ohos.permission.READ_CALENDAR");
      expect(data.reqPermissionDetails[1].moduleName).assertEqual("testModule");
      expect(data.reqPermissionDetails[1].reason).assertEqual("$string:permission_reason");
      expect(data.reqPermissionDetails[1].reasonId).assertLarger(0);
      expect(data.reqPermissionDetails[1].usedScene.abilities.length).assertEqual(1);
      expect(data.reqPermissionDetails[1].usedScene.abilities[0]).assertEqual("MainAbility");
      expect(data.reqPermissionDetails[1].usedScene.when).assertEqual("inuse");
      expect(data.permissionGrantStates[1]).assertEqual(bundle.PermissionGrantState.PERMISSION_DENIED);
      expect(data.signatureInfo).assertEqual(null);
      done();
    })

    /**
     * @tc.name   getBundleInfoForSelfSyncMetadata
     * @tc.number Sub_Bms_Framework_Query_AppInfo_7140
     * @tc.desc   Test getBundleInfoForSelfSync with metadata flag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getBundleInfoForSelfSyncMetadata', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) =>  {
      let data = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA);
      console.info("getBundleInfoForSelfSyncMetadata" + JSON.stringify(data.hapModulesInfo[0].metadata));
      checkCommonBundleInfo(data);
      checkCommonHapModuleInfo(data);
      expect(data.appInfo).assertEqual(null);
      expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0);
      expect(data.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(0);
      expect(data.hapModulesInfo[0].metadata.length).assertEqual(1);
      expect(data.hapModulesInfo[0].metadata[0].name).assertEqual("MetaData1");
      expect(data.hapModulesInfo[0].metadata[0].value).assertEqual("MetaDataValue");
      expect(data.hapModulesInfo[0].metadata[0].valueId).assertEqual(0);
      expect(data.hapModulesInfo[0].metadata[0].resource).assertEqual("$profile:shortcuts_config");
      expect(data.hapModulesInfo[0].routerMap.length).assertEqual(0);
      expect(data.routerMap.length).assertEqual(0);
      expect(data.reqPermissionDetails.length).assertEqual(0);
      expect(data.permissionGrantStates.length).assertEqual(0);
      expect(data.signatureInfo).assertEqual(null);
      done();
    })

    /**
     * @tc.name   getBundleInfoForSelfSyncDisable
     * @tc.number Sub_Bms_Framework_Query_AppInfo_7160
     * @tc.desc   Test getBundleInfoForSelfSync with disable flag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getBundleInfoForSelfSyncDisable', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) =>  {
      let data = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_DISABLE);
      console.info("getBundleInfoForSelfSyncDisable" + JSON.stringify(data));
      checkCommonBundleInfo(data);
      expect(data.appInfo).assertEqual(null);
      expect(data.hapModulesInfo.length).assertEqual(0);
      expect(data.reqPermissionDetails.length).assertEqual(0);
      expect(data.permissionGrantStates.length).assertEqual(0);
      expect(data.signatureInfo).assertEqual(null);
      done();
    })

    /**
     * @tc.name   getBundleInfoForSelfSyncSignatureInfo
     * @tc.number Sub_Bms_Framework_Query_AppInfo_7180
     * @tc.desc   Test getBundleInfoForSelfSync with signatureInfo flag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getBundleInfoForSelfSyncSignatureInfo', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) =>  {
      let data = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO);
      console.info("SigCal" + JSON.stringify(data.signatureInfo));
      checkCommonBundleInfo(data);
      expect(data.appInfo).assertEqual(null);
      expect(data.hapModulesInfo.length).assertEqual(0);
      expect(data.reqPermissionDetails.length).assertEqual(0);
      expect(data.permissionGrantStates.length).assertEqual(0);
      expect(data.signatureInfo.appId).assertEqual(APPID);
      expect(data.signatureInfo.fingerprint).assertEqual(FINGERPRINT);
      expect(data.signatureInfo.certificate).assertContain(CERTIFICATE);
      expect(data.signatureInfo.appIdentifier).assertEqual("");
      done();
    })

    /**
     * @tc.name   getBundleInfoForSelfSyncRouterMap
     * @tc.number Sub_Bms_Framework_Query_AppInfo_7200
     * @tc.desc   Test getBundleInfoForSelfSync with metadata flag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getBundleInfoForSelfSyncRouterMap', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) =>  {
      let data = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_ROUTER_MAP);
      console.info("getBundleInfoForSelfSyncRouterMap" + JSON.stringify(data.hapModulesInfo[0].routerMap));
      checkCommonBundleInfo(data);
      checkCommonHapModuleInfo(data);
      expect(data.appInfo).assertEqual(null);
      expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0);
      expect(data.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(0);
      expect(data.reqPermissionDetails.length).assertEqual(0);
      expect(data.permissionGrantStates.length).assertEqual(0);
      expect(data.signatureInfo).assertEqual(null);
      expect(data.hapModulesInfo[0].routerMap.length).assertEqual(2);
      let routerMapTest: bundle.RouterItem = data.hapModulesInfo[0].routerMap[0];
      expect(typeof (routerMapTest.name)).assertEqual('string');
      expect(data.hapModulesInfo[0].routerMap.length).assertEqual(2);
      expect(routerMapTest.name).assertEqual("DynamicPage1");
      expect(routerMapTest.pageSourceFile).assertEqual("entry/src/index");
      expect(routerMapTest.buildFunction).assertEqual("myFunction");
      expect(routerMapTest.data.length).assertEqual(0);
      expect(data.hapModulesInfo[0].routerMap[1].name).assertEqual("DynamicPage2");
      expect(data.hapModulesInfo[0].routerMap[1].pageSourceFile).assertEqual("entry/src/index");
      expect(data.hapModulesInfo[0].routerMap[1].buildFunction).assertEqual("myBuilder");
      expect(data.hapModulesInfo[0].routerMap[1].data.length).assertEqual(2);
      let dataTest1: bundle.DataItem = data.hapModulesInfo[0].routerMap[1].data[0];
      expect(typeof (dataTest1.key)).assertEqual('string');
      expect(data.hapModulesInfo[0].routerMap[1].data[0].key).assertEqual("key1");
      expect(data.hapModulesInfo[0].routerMap[1].data[0].value).assertEqual("data1");
      expect(data.hapModulesInfo[0].routerMap[1].data[1].key).assertEqual("key2");
      expect(data.hapModulesInfo[0].routerMap[1].data[1].value).assertEqual("data2");
      expect(data.hapModulesInfo[0].routerMap[1].customData.length).assertEqual(128);
      let routerMapTest1: bundle.RouterItem = data.routerMap[0];
      expect(typeof (routerMapTest1)).assertEqual("object");
      expect(routerMapTest1.name).assertEqual("DynamicPage1");
      expect(routerMapTest1.pageSourceFile).assertEqual("entry/src/index");
      expect(routerMapTest1.buildFunction).assertEqual("myFunction");
      expect(routerMapTest1.data.length).assertEqual(0);
      expect(data.routerMap[1].name).assertEqual("DynamicPage2");
      expect(data.routerMap[1].pageSourceFile).assertEqual("entry/src/index");
      expect(data.routerMap[1].buildFunction).assertEqual("myBuilder");
      expect(data.routerMap[1].data.length).assertEqual(2);
      let dataTest: bundle.DataItem = data.routerMap[1].data[0];
      expect(typeof (dataTest.key)).assertEqual('string');
      expect(data.routerMap[1].data[0].key).assertEqual("key1");
      expect(data.routerMap[1].data[0].value).assertEqual("data1");
      expect(data.routerMap[1].data[1].key).assertEqual("key2");
      expect(data.routerMap[1].data[1].value).assertEqual("data2");
      expect(data.routerMap[1].customData.length).assertEqual(128);
      console.info("checkRouterMapInfo end");
      done();
    })


  })
}

    function checkCommonBundleInfo(data:bundle.BundleInfo) {
      expect(data.name).assertEqual(BUNDLE_NAME);
      expect(data.vendor).assertEqual(VENDOR);
      expect(data.versionCode).assertEqual(1000000);
      expect(data.versionName).assertEqual("1.0.0");
      expect(data.buildVersion).assertEqual("1.0.0");
      expect(data.minCompatibleVersionCode).assertEqual(1000000);
      expect(data.targetVersion).assertLarger(16);
      expect(data.installTime).assertLarger(0);
      expect(data.updateTime).assertLarger(0);
      expect(data.firstInstallTime).assertLarger(0);
      expect(data.appIndex).assertEqual(0);
      console.info("checkCommonBundleInfo end");
    }

    function checkCommonApplicationInfo(data:bundle.BundleInfo) {
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
      expect(data.appInfo.multiAppMode).assertEqual(bundle.MultiAppModeType.UNSPECIFIED);
      expect(data.appInfo.appIndex).assertEqual(0);
      console.info("checkCommonApplicationInfo end");
    }

    function checkCommonHapModuleInfo(data:bundle.BundleInfo) {
      expect(data.hapModulesInfo.length).assertEqual(1);
      expect(data.hapModulesInfo[0].name).assertEqual("testModule");
      expect(data.hapModulesInfo[0].icon).assertEqual("");
      expect(data.hapModulesInfo[0].iconId).assertEqual(0);
      expect(data.hapModulesInfo[0].label).assertEqual("$string:TestAbility_label");
      expect(data.hapModulesInfo[0].labelId).assertLarger(0);
      expect(data.hapModulesInfo[0].description).assertEqual("$string:module_test_desc");
      expect(data.hapModulesInfo[0].descriptionId).assertLarger(0);
      expect(data.hapModulesInfo[0].mainElementName).assertEqual("TestAbility");
      expect(data.hapModulesInfo[0].deviceTypes.length).assertEqual(0);
      expect(data.hapModulesInfo[0].installationFree).assertFalse();
      expect(data.hapModulesInfo[0].hashValue).assertEqual("");
      console.info("checkCommonHapModuleInfo end");
    }

    function checkCommonAbilityInfo(data:bundle.AbilityInfo) {
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
      expect(data.excludeFromDock).assertFalse();
      expect(data.permissions.length).assertEqual(0);
      expect(data.deviceTypes.length).assertEqual(0);
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
      expect(data.appIndex).assertEqual(0);
      expect(data.orientationId).assertEqual(0);
      console.info("checkCommonAbilityInfo end");
    }