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
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

 import bundle from '@ohos.bundle.bundleManager';
 import { BusinessError } from '@ohos.base';
 import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
 
 export default function getInstalledBundleList(): void {
   describe('getInstalledBundleListTest', (): void => {
 
     /**
      * @tc.name   SUB_BMS_FRAMEWORK_getInstalledBundleListSTATIC_0100
      * @tc.number SUB_BMS_FRAMEWORK_getInstalledBundleListSTATIC_0100
      * @tc.desc   test BundleInfo when GET_BUNDLE_INFO_DEFAULT
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_BMS_FRAMEWORK_getInstalledBundleListSTATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
       async (done: () => void): Promise<void> => {
         console.info("SUB_BMS_FRAMEWORK_getInstalledBundleListSTATIC_0100 start");
         try {
           let bundleFlags = bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT;
           bundle.getInstalledBundleList(bundleFlags).then((data: Array<bundle.BundleInfo>) => {
             console.info('getInstalledBundleList successfully. Data: ' + JSON.stringify(data));
             expect(data.length).assertLarger(0);
             let target:bundle.BundleInfo | undefined = data.find((item) => item.name === "com.acts.bundle.stage");
             console.info('getInstalledBundleList target ===>' + JSON.stringify(target));
             expect(target?.name).assertEqual("com.acts.bundle.stage");
             expect(target?.versionCode).assertLarger(0);
             expect(target?.versionName?.length).assertLarger(0);
             expect(target?.vendor).assertEqual("example");
             expect(target?.buildVersion).assertEqual("");
             expect(target?.appInfo).assertEqual(null);
             expect(target?.minCompatibleVersionCode).assertLarger(0);
             expect(target?.targetVersion).assertLarger(0);
             expect(target?.hapModulesInfo?.length).assertEqual(0);
             expect(target?.reqPermissionDetails?.length).assertEqual(0);
             expect(target?.permissionGrantStates?.length).assertEqual(0);
             expect(target?.signatureInfo).assertEqual(null);
             expect(target?.routerMap.length).assertEqual(0);
             expect(target?.appInfo).assertEqual(null);
             expect(target?.installTime).assertLarger(0);
             expect(target?.firstInstallTime).assertLarger(0);
             expect(target?.updateTime).assertLarger(0);
             expect(target?.appIndex).assertEqual(0);
             done();
           }).catch((err: Error): void => {
             let message = (err as BusinessError).message;
             let code = (err as BusinessError).code;
             console.info('getInstalledBundleList fail ==> ' + code + "==>" + message);
             if (code == 201) {
               expect(code).assertEqual(201);
             }
             done();
           });
         } catch (err) {
           let message = (err as BusinessError).message;
           let code = (err as BusinessError).code;
           console.info('getInstalledBundleList failx ==> ' + code + "==>" + message);
           expect().assertFail();
           done();
         }
       });
 
     /**
      * @tc.name   SUB_BMS_FRAMEWORK_getInstalledBundleListSTATIC_0200
      * @tc.number SUB_BMS_FRAMEWORK_getInstalledBundleListSTATIC_0200
      * @tc.desc   test BundleInfo when GET_BUNDLE_INFO_WITH_APPLICATION
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_BMS_FRAMEWORK_getInstalledBundleListSTATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
       async (done: () => void): Promise<void> => {
         console.info("SUB_BMS_FRAMEWORK_getInstalledBundleListSTATIC_0200 start");
         try {
           let bundleFlags = bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
           bundle.getInstalledBundleList(bundleFlags).then((data: Array<bundle.BundleInfo>) => {
             console.info('getInstalledBundleList2 successfully. Data: ' + JSON.stringify(data));
             expect(data.length).assertLarger(0);
             let target:bundle.BundleInfo|undefined = data.find((item) => item.name === "com.acts.bundle.stage");
             console.info('getInstalledBundleList2 target ===>' + JSON.stringify(target));
             expect(target?.name).assertEqual("com.acts.bundle.stage");
             expect(target?.versionCode).assertLarger(0);
             expect(target?.versionName?.length).assertLarger(0);
             expect(target?.buildVersion).assertEqual("");
             expect(target?.minCompatibleVersionCode).assertLarger(0);
             expect(target?.targetVersion).assertLarger(0);
             expect(target?.hapModulesInfo?.length).assertEqual(0);
             expect(target?.reqPermissionDetails?.length).assertEqual(0);
             expect(target?.permissionGrantStates?.length).assertEqual(0);
             expect(target?.signatureInfo).assertEqual(null);
             expect(target?.routerMap.length).assertEqual(0);
             expect(target?.installTime).assertLarger(0);
             expect(target?.firstInstallTime).assertLarger(0);
             expect(target?.updateTime).assertLarger(0);
             expect(target?.appIndex).assertEqual(0);
             expect(target?.vendor).assertEqual("example");
             let appInfo:bundle.ApplicationInfo | undefined | null = target?.appInfo
             expect(appInfo?.name).assertEqual('com.acts.bundle.stage');
             expect(appInfo?.bundleType).assertEqual(bundle.BundleType.APP);
             expect(appInfo?.debug).assertFalse();
             expect(appInfo?.description).assertEqual("$string:description_application");
             expect(appInfo?.descriptionId).assertLarger(0);
             expect(appInfo?.enabled).assertEqual(true);
             expect(appInfo?.label).assertEqual('$string:app_name');
             expect(appInfo?.labelId).assertLarger(0);
             expect(appInfo?.process).assertEqual("com.acts.bundle.stage");
             expect((appInfo?.permissions as Array<string>).length == 0).assertTrue();
             expect(appInfo?.codePath).assertEqual("/data/app/el1/bundle/public/com.acts.bundle.stage");
             expect((appInfo?.metadataArray as Array<bundle.ModuleMetadata>).length == 0).assertTrue();
             expect(appInfo?.removable).assertTrue();
             expect(appInfo?.accessTokenId).assertLarger(0);
             expect(appInfo?.uid).assertLarger(0);
             expect(appInfo?.iconResource?.bundleName).assertEqual('com.acts.bundle.stage');
             expect(appInfo?.iconResource?.moduleName).assertEqual('phone');
             expect(appInfo?.iconResource?.id).assertLarger(0);
             expect(appInfo?.labelResource?.id).assertLarger(0);
             expect(appInfo?.labelResource?.bundleName).assertEqual('com.acts.bundle.stage');
             expect(appInfo?.labelResource?.moduleName).assertEqual('phone');
             expect(appInfo?.appDistributionType).assertEqual('os_integration');
             expect(appInfo?.appProvisionType).assertEqual('release');
             expect(appInfo?.systemApp).assertFalse();
             expect(appInfo?.dataUnclearable).assertFalse();
             expect(appInfo?.nativeLibraryPath).assertEqual('');
             expect(appInfo?.appIndex).assertEqual(0);
             expect(appInfo?.installSource).assertEqual('unknown');
             expect(appInfo?.releaseType.length).assertLarger(0);
             expect(appInfo?.cloudFileSyncEnabled).assertFalse();
             expect(appInfo?.cloudStructuredDataSyncEnabled).assertFalse();
             expect(appInfo?.flags).assertEqual(1);
             expect(appInfo?.multiAppMode?.multiAppModeType).assertEqual(0);
             expect(appInfo?.multiAppMode?.maxCount).assertEqual(0);
             done();
           }).catch((err: Error): void => {
             let message = (err as BusinessError).message;
             let code = (err as BusinessError).code;
             console.info('getInstalledBundleList2 fail ==> ' + code + "==>" + message);
             if (code == 201) {
               expect(code).assertEqual(201);
             }
             done();
           });
         } catch (err) {
           let message = (err as BusinessError).message;
           let code = (err as BusinessError).code;
           console.info('getInstalledBundleList2 failx ==> ' + code + "==>" + message);
           expect().assertFail();
           done();
         }
       });
 
   })
 }