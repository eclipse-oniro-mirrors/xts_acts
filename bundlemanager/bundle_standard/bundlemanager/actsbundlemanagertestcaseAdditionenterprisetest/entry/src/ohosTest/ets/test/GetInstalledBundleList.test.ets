
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import bundleManager from '@ohos.bundle.bundleManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium";
import { hilog } from '@kit.PerformanceAnalysisKit';


export default function getInstalledBundleList() {
  describe('getInstalledBundleListTest', () =>  {

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_getInstalledBundleList_0100
     * @tc.number SUB_BMS_FRAMEWORK_getInstalledBundleList_0100
     * @tc.desc   test BundleInfo when GET_BUNDLE_INFO_DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BMS_FRAMEWORK_getInstalledBundleList_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      console.info("SUB_BMS_FRAMEWORK_getInstalledBundleList_0100 start");
      try {
        let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT;
        bundleManager.getInstalledBundleList(bundleFlags).then((data:Array<bundleManager.BundleInfo>) => {
          hilog.info(0x0000, 'testTag', 'getInstalledBundleList successfully. Data: %{public}s', JSON.stringify(data));
          expect(data.length).assertLarger(0);
          let target = data.find((item)=>item['name'] === "com.acts.bundle.stage") ;
          console.info('testTag getInstalledBundleList target ===>' + JSON.stringify(target));
          expect(target?.['name']).assertEqual("com.acts.bundle.stage");
          expect(target?.['versionCode']).assertLarger(0);
          let versionName = target?.['versionName'] as string
          console.info('testTag getInstalledBundleList versionName ===>' + versionName);
          expect(versionName.length).assertLarger(0);
          expect(target?.vendor).assertEqual("example");
          expect(target?.buildVersion).assertEqual("");
          expect(target?.appInfo).assertEqual(null)
          expect(target?.minCompatibleVersionCode).assertLarger(0)
          expect(target?.targetVersion).assertLarger(0)
          expect(target?.hapModulesInfo?.length).assertEqual(0)
          expect(target?.reqPermissionDetails?.length).assertEqual(0)
          expect(target?.permissionGrantStates?.length).assertEqual(0)
          expect(target?.signatureInfo).assertEqual(null);
          expect(target?.routerMap.length).assertEqual(0);
          expect(target?.appInfo).assertEqual(null);
          expect(target?.installTime).assertLarger(0)
          expect(target?.firstInstallTime).assertLarger(0)
          expect(target?.updateTime).assertLarger(0)
          expect(target?.appIndex).assertEqual(0)
          done();
        }).catch((err: BusinessError) => {
          console.info('testtag getInstalledBundleList fail ==> ' + err.code + "==>" + err.message)
          if (err.code == 201 ) {
            expect(err.code).assertEqual(201)
          }
          done();
        });
      } catch (err) {
        let message = (err as BusinessError).message;
        let code = (err as BusinessError).code;
        console.info('testtag getInstalledBundleList failx ==> ' + code + "==>" + message)
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.name   SUB_BMS_FRAMEWORK_getInstalledBundleList_0200
     * @tc.number SUB_BMS_FRAMEWORK_getInstalledBundleList_0200
     * @tc.desc   test BundleInfo when GET_BUNDLE_INFO_WITH_APPLICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BMS_FRAMEWORK_getInstalledBundleList_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      console.info("SUB_BMS_FRAMEWORK_getInstalledBundleList_0200 start");
      try {
        let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
        bundleManager.getInstalledBundleList(bundleFlags).then((data:Array<bundleManager.BundleInfo>) => {
          hilog.info(0x0000, 'testTag', 'getInstalledBundleList2 successfully. Data: %{public}s', JSON.stringify(data));
          expect(data.length).assertLarger(0);
          let target = data.find((item)=>item['name'] === "com.acts.bundle.stage") ;
          console.info('testTag getInstalledBundleList2 target ===>' + JSON.stringify(target));
          expect(target?.['name']).assertEqual("com.acts.bundle.stage");
          expect(target?.['versionCode']).assertLarger(0);
          let versionName = target?.['versionName'] as string
          console.info('testTag getInstalledBundleList versionName ===>' + versionName);
          expect(versionName.length).assertLarger(0);
          console.info('testTag getInstalledBundleList buildVersion ===>' + target?.['buildVersion']);
          expect(target?.buildVersion).assertEqual("");
          expect(target?.minCompatibleVersionCode).assertLarger(0)
          expect(target?.targetVersion).assertLarger(0)
          expect(target?.hapModulesInfo?.length).assertEqual(0)
          expect(target?.reqPermissionDetails?.length).assertEqual(0)
          expect(target?.permissionGrantStates?.length).assertEqual(0)
          expect(target?.signatureInfo).assertEqual(null);
          expect(target?.routerMap.length).assertEqual(0);
          expect(target?.installTime).assertLarger(0)
          expect(target?.firstInstallTime).assertLarger(0)
          expect(target?.updateTime).assertLarger(0)
          expect(target?.appIndex).assertEqual(0)
          expect(target?.vendor).assertEqual("example");
          let appInfo = target?.['appInfo'] as bundleManager.ApplicationInfo;
          expect(appInfo.name).assertEqual('com.acts.bundle.stage')
          expect(appInfo.bundleType).assertEqual(bundleManager.BundleType.APP)
          expect(appInfo.debug).assertFalse()
          expect(appInfo.description).assertEqual("$string:description_application");
          expect(appInfo.descriptionId).assertLarger(0);
          expect(appInfo.enabled).assertEqual(true);
          expect(appInfo.label).assertEqual('$string:app_name');
          expect(appInfo.labelId).assertLarger(0);
          expect(appInfo.process).assertEqual("com.acts.bundle.stage")
          expect((appInfo.permissions as Array<string>).length == 0).assertTrue();
          expect(appInfo.codePath).assertEqual("/data/app/el1/bundle/public/com.acts.bundle.stage")
          expect((appInfo.metadataArray as Array<bundleManager.ModuleMetadata>).length == 0).assertTrue()
          expect(appInfo.removable).assertTrue()
          expect(appInfo.accessTokenId).assertLarger(0);
          expect(appInfo.uid).assertLarger(0);
          expect(appInfo.iconResource?.bundleName).assertEqual('com.acts.bundle.stage')
          expect(appInfo.iconResource?.moduleName).assertEqual('phone')
          expect(appInfo.iconResource?.id).assertLarger(0);
          expect(appInfo.labelResource?.id).assertLarger(0);
          expect(appInfo.labelResource?.bundleName).assertEqual('com.acts.bundle.stage')
          expect(appInfo.labelResource?.moduleName).assertEqual('phone')
          expect(appInfo.appDistributionType).assertEqual('os_integration')
          expect(appInfo.appProvisionType).assertEqual('release')
          expect(appInfo.systemApp).assertFalse()
          expect(appInfo.dataUnclearable).assertFalse();
          expect(appInfo.nativeLibraryPath).assertEqual('')
          expect(appInfo.appIndex).assertEqual(0)
          expect(appInfo.installSource).assertEqual('unknown')
          expect(appInfo.releaseType.length).assertLarger(0);
          expect(appInfo.cloudFileSyncEnabled).assertFalse();
          expect(appInfo.cloudStructuredDataSyncEnabled).assertFalse()
          expect(appInfo.flags).assertEqual(1)
          expect(appInfo.multiAppMode?.multiAppModeType).assertEqual(0)
          expect(appInfo.multiAppMode?.maxCount).assertEqual(0)
          done();
        }).catch((err: BusinessError) => {
          console.info('testtag getInstalledBundleList fail ==> ' + err.code + "==>" + err.message)
          if (err.code == 201 ) {
            expect(err.code).assertEqual(201)
          }
          done();
        });
      } catch (err) {
        let message = (err as BusinessError).message;
        let code = (err as BusinessError).code;
        console.info('testtag getInstalledBundleList failx ==> ' + code + "==>" + message)
        expect().assertFail();
        done();
      }
    });

  })
}

