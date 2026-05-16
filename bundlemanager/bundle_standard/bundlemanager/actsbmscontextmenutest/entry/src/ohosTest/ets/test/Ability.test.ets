/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import bundle from '@ohos.bundle.bundleManager';
import overlay from '@ohos.bundle.overlay';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect ,TestType ,Size ,Level } from '@ohos/hypium'
import { BusinessError } from '@kit.BasicServicesKit';

const MODULE_NAME = "entry_test";
const MODULE_NAME1 = "test1";
const ERROR_BUNDLE_IS_NOT_OVERLAY = 17700032;

let bundleName = 'com.example.myapplication';
let bundleFlags = bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
let userId = 100;
let uid = 101010101;

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   getBundleInfoForSelfSyncFileContextMenu
     * @tc.number Sub_Bms_Framework_Query_AppInfo_7061
     * @tc.desc   Test getBundleInfoForSelfSync with fileContextMenuConfig flag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getBundleInfoForSelfSyncFileContextMenu', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      let data = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
      bundle.BundleFlag.GET_BUNDLE_INFO_WITH_MENU);
      console.info("getBundleInfoForSelfSyncFileContextMenu" + JSON.stringify(data.hapModulesInfo));
      console.info("data.hapModulesInfo[0].fileContextMenuConfig" +
      JSON.stringify(data.hapModulesInfo[0].fileContextMenuConfig));
      expect(data.appInfo).assertEqual(null);
      expect(data.hapModulesInfo.length).assertEqual(2);
      expect(data.hapModulesInfo[0].icon).assertEqual("$media:icon");
      expect(data.hapModulesInfo[0].iconId).assertLarger(0);
      expect(data.hapModulesInfo[0].label).assertEqual("$string:EntryAbility_label");
      expect(data.hapModulesInfo[0].labelId).assertLarger(0);
      expect(data.hapModulesInfo[0].description).assertEqual("$string:module_desc");
      expect(data.hapModulesInfo[0].descriptionId).assertLarger(0);
      expect(data.hapModulesInfo[0].mainElementName).assertEqual("EntryAbility");
      expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0);
      expect(data.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(0);
      expect(data.hapModulesInfo[0].metadata.length).assertEqual(0);
      expect(data.hapModulesInfo[0].deviceTypes.length).assertEqual(0);
      expect(data.hapModulesInfo[0].installationFree).assertFalse();
      expect(data.hapModulesInfo[0].hashValue).assertEqual("");
      expect(data.hapModulesInfo[0].fileContextMenuConfig)
        .assertEqual("{\"src\":[\"pages/Index\"]}");
      expect(data.hapModulesInfo[0].routerMap.length).assertEqual(0);
      expect(data.hapModulesInfo[0].codePath).assertEqual("/data/storage/el1/bundle/entry.hap");
      expect(data.hapModulesInfo[0].nativeLibraryPath).assertEqual("");
      expect(data.routerMap.length).assertEqual(0);
      expect(data.reqPermissionDetails.length).assertEqual(0);
      expect(data.permissionGrantStates.length).assertEqual(0);
      expect(data.signatureInfo).assertEqual(null);
      done();
    })

    /**
     * @tc.name   getBundleInfoOtherUnPermissionApi14
     * @tc.number Sub_Bms_Framework_Query_AppInfo2_2200
     * @tc.desc   Test getBundleInfo unPermission query other bundle for api14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getBundleInfoOtherUnPermissionApi14', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      try {
        await bundle.getBundleInfo(bundleName, bundleFlags, userId).then(data => {
          console.info("getBundleInfoOtherUnPermissionApi14 promise success " + JSON.stringify(data));
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.info("getBundleInfoOtherUnPermissionApi14 promise error " + JSON.stringify(err));
          expect(err.code).assertEqual(201);
        })
      } catch (err) {
        console.info("getBundleInfoOtherUnPermissionApi14 catch " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      try {
        bundle.getBundleInfo(bundleName, bundleFlags, userId, (err, data) => {
          console.info("getBundleInfoOtherUnPermissionApi14 callback success " + JSON.stringify(data));
          console.info("getBundleInfoOtherUnPermissionApi14 callback error " + JSON.stringify(err));
          expect(data).assertUndefined();
          expect(err.code).assertEqual(201);
        });
      } catch (err) {
        console.info("getBundleInfoOtherUnPermissionApi14 callback catch " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      try {
        bundle.getBundleInfo(bundleName, bundleFlags, (err, data) => {
          console.info("getBundleInfoOtherUnPermissionApi14 callback2 success " + JSON.stringify(data));
          console.info("getBundleInfoOtherUnPermissionApi14 callback2 error " + JSON.stringify(err));
          expect(data).assertUndefined();
          expect(err.code).assertEqual(201);
          done();
        });
      } catch (err) {
        console.info("getBundleInfoOtherUnPermissionApi14 callback2 catch " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   getBundleInfoSyncOtherUnPermissionApi14
     * @tc.number Sub_Bms_Framework_Query_AppInfo2_2300
     * @tc.desc   Test getBundleInfoSync unPermission query other bundle for api14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getBundleInfoSyncOtherUnPermissionApi14', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      try {
        bundle.getBundleInfoSync(bundleName, bundleFlags, userId)
        expect().assertFail();
        done();
      } catch (err) {
        console.info("getBundleInfoSyncOtherUnPermissionApi14 1 catch " + JSON.stringify(err));
        expect(err.code).assertEqual(201);
      }
      try {
        bundle.getBundleInfoSync(bundleName, bundleFlags)
        expect().assertFail();
        done();
      } catch (err) {
        console.info("getBundleInfoSyncOtherUnPermissionApi14 2 catch " + JSON.stringify(err));
        expect(err.code).assertEqual(201);
        done();
      }
    })

    /**
     * @tc.name   getBundleNameByUidSyncUnPermissionApi14
     * @tc.number Sub_Bms_Framework_Query_AppInfo2_2400
     * @tc.desc   Test getBundleNameByUidSync unPermission for api14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getBundleNameByUidSyncUnPermissionApi14', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      try {
        bundle.getBundleNameByUidSync(uid)
        expect().assertFail();
        done();
      } catch (err) {
        console.info("getBundleNameByUidSyncUnPermissionApi14 1 catch " + JSON.stringify(err));
        expect(err.code).assertEqual(201);
        done();
      }
    })

    /**
     * @tc.name   getBundleNameByUidUnPermissionApi14
     * @tc.number Sub_Bms_Framework_Query_AppInfo2_2500
     * @tc.desc   Test getBundleNameByUid unPermission for api14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getBundleNameByUidUnPermissionApi14', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      try {
        await bundle.getBundleNameByUid(uid).then(data => {
          console.info("getBundleNameByUidUnPermissionApi14 promise success " + JSON.stringify(data));
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.info("getBundleNameByUidUnPermissionApi14 promise error " + JSON.stringify(err));
          expect(err.code).assertEqual(201);
        })
      } catch (err) {
        console.info("getBundleNameByUidUnPermissionApi14 1 catch " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      try {
        bundle.getBundleNameByUid(uid, (err, data) => {
          console.info("getBundleNameByUidUnPermissionApi14 callback2 success " + JSON.stringify(data));
          console.info("getBundleNameByUidUnPermissionApi14 callback2 error " + JSON.stringify(err));
          expect(data).assertUndefined();
          expect(err.code).assertEqual(201);
          done();
        });
      } catch (err) {
        console.info("getBundleNameByUidUnPermissionApi14 callback2 catch " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   getAppCloneIdentityUnPermissionApi14
     * @tc.number Sub_Bms_Framework_Query_AppInfo2_2600
     * @tc.desc   Test getAppCloneIdentity unPermission for api14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getAppCloneIdentityUnPermissionApi14', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      try {
        bundle.getAppCloneIdentity(uid).then(data => {
          console.info("getAppCloneIdentityUnPermissionApi14 success " + JSON.stringify(data));
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.info("getAppCloneIdentityUnPermissionApi14 promise " + JSON.stringify(err));
          expect(err.code).assertEqual(201);
          done();
        })
      } catch (err) {
        console.info("getAppCloneIdentityUnPermissionApi14 1 catch " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   GetOverlayModuleInfoModuleNameNotInstall
     * @tc.number Sub_Bms_Framework_Overlay_Query_0300
     * @tc.desc   The query fails when the incoming moduleName is not installed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetOverlayModuleInfoModuleNameNotInstall',  TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async  (done: Function) =>{
      try {
        await overlay.getOverlayModuleInfo(MODULE_NAME1).then(data => {
          console.info("GetOverlayModuleInfoModuleNameNotInstall result" + JSON.stringify(data));
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.info("GetOverlayModuleInfoModuleNameNotInstall promise " + JSON.stringify(err));
          expect(err.code).assertEqual(ERROR_BUNDLE_IS_NOT_OVERLAY);
        })
      }catch (e) {
        console.info("GetOverlayModuleInfoModuleNameNotInstall  catch" + JSON.stringify(e));
        expect().assertFail();
      }
      try {
        overlay.getOverlayModuleInfo(MODULE_NAME1, (err, data) => {
          console.info("GetOverlayModuleInfoModuleNameNotInstall result" + JSON.stringify(data));
          console.info("GetOverlayModuleInfoModuleNameNotInstall fail" + JSON.stringify(err));
          expect(err.code).assertEqual(ERROR_BUNDLE_IS_NOT_OVERLAY);
          done();
        });
      }catch (e) {
        console.info("GetOverlayModuleInfoModuleNameNotInstall callback catch" + JSON.stringify(e));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   GetOverlayModuleInfoModuleNameNotOverlay
     * @tc.number Sub_Bms_Framework_Overlay_Query_0400
     * @tc.desc   The query fails when the incoming moduleName is not overlay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetOverlayModuleInfoModuleNameNotOverlay',  TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async  (done: Function) =>{
      try {
        await overlay.getOverlayModuleInfo(MODULE_NAME).then(data => {
          console.info("GetOverlayModuleInfoModuleNameNotOverlay result" + JSON.stringify(data));
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.info("GetOverlayModuleInfoModuleNameNotOverlay promise " + JSON.stringify(err));
          expect(err.code).assertEqual(ERROR_BUNDLE_IS_NOT_OVERLAY);
        })
      }catch (e) {
        console.info("GetOverlayModuleInfoModuleNameNotOverlay  catch" + JSON.stringify(e));
        expect().assertFail();
      }
      try {
        overlay.getOverlayModuleInfo(MODULE_NAME, (err, data) => {
          console.info("GetOverlayModuleInfoModuleNameNotOverlay result" + JSON.stringify(data));
          console.info("GetOverlayModuleInfoModuleNameNotOverlay fail" + JSON.stringify(err));
          expect(err.code).assertEqual(ERROR_BUNDLE_IS_NOT_OVERLAY);
          done();
        });
      }catch (e) {
        console.info("GetOverlayModuleInfoModuleNameNotOverlay callback catch" + JSON.stringify(e));
        expect().assertFail();
        done();
      }
    })

  })
}