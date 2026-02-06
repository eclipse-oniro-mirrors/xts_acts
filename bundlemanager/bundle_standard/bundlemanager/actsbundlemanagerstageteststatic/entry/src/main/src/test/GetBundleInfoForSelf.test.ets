import bundle from '@ohos.bundle.bundleManager';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import { BundleInfo } from 'bundleManager.BundleInfo';
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import Want from '@ohos.app.ability.Want';

let domain: number = 0x0000;
let tag: string = 'testTag';
let userId = 100;
let want: Want = {
  bundleName: "ohos.acts.bundle.stage.test.static",
  abilityName: "EntryAbility"
};
const BUNDLE_NAME = "ohos.acts.bundle.stage.test.static";
const VENDOR = "example";

export default function getBundleInfoForSelf() {
  describe('getBundleInfoForSelf', (): void => {

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_5580
     * @tc.name: getBundleInfoForSelfCallbackDefault
     * @tc.desc: Test getBundleInfoForSelf with default flag(by callback).
     */
    it('getBundleInfoForSelfCallbackDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT,
          (err: BusinessError<void> | null, data: BundleInfo | undefined) => {
            hilog.info(domain, tag, 'getBundleInfoForSelfPromiseDefault  ====> start');
            if (err) {
              hilog.info(domain, tag, 'getBundleInfoForSelfPromiseDefault  ====> err' + JSON.stringify(err));
              expect().assertFail();
            } else if (data !== undefined) {
              expect(data!.name).assertEqual(BUNDLE_NAME);
              expect(data!.vendor).assertEqual(VENDOR);
              expect(data!.versionCode + '').assertEqual('1000000');
              expect(data!.versionName).assertEqual("1.0.0");
              expect(data!.minCompatibleVersionCode + '').assertEqual('1000000');
              expect(data!.targetVersion + '').assertEqual('20');
              expect(data!.installTime).assertLarger(0.0);
              expect(data!.updateTime).assertLarger(0.0);
              expect(data!.firstInstallTime).assertLarger(0.0);
              expect(data!.appInfo).assertEqual(null);
              expect(data!.hapModulesInfo.length + '').assertEqual('0');
              expect(data!.reqPermissionDetails.length + '').assertEqual('0');
              expect(data!.permissionGrantStates.length + '').assertEqual('0');
            } else {
              hilog.info(domain, tag, 'getBundleInfoForSelfPromiseDefault  ====> Fail');
              expect().assertFail();
            }
            hilog.info(domain, tag, 'getBundleInfoForSelfPromiseDefault  ====> end');
            done();
          })
      })

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_5560
     * @tc.name: getBundleInfoForSelfPromiseDefault
     * @tc.desc: Test getBundleInfoForSelf with default flag(by promise).
     */
    it('getBundleInfoForSelfPromiseDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).then((data: BundleInfo) => {
          hilog.info(domain, tag, 'getBundleInfoForSelfPromiseDefault  ====> start');
          expect(data.appIndex).assertEqual(0);
          expect(data.name).assertEqual(BUNDLE_NAME);
          expect(data.vendor).assertEqual(VENDOR);
          expect(data.versionCode + '').assertEqual('1000000');
          expect(data.versionName).assertEqual("1.0.0");
          expect(data.minCompatibleVersionCode + '').assertEqual('1000000');
          expect(data.targetVersion + '').assertEqual('20');
          expect(data.installTime).assertLarger(0.0);
          expect(data.updateTime).assertLarger(0.0);
          expect(data.firstInstallTime).assertLarger(0.0);
          expect(data.appInfo).assertEqual(null);
          expect(data.hapModulesInfo.length + '').assertEqual('0');
          expect(data.reqPermissionDetails.length + '').assertEqual('0');
          expect(data.permissionGrantStates.length + '').assertEqual('0');
          hilog.info(domain, tag, 'getBundleInfoForSelfPromiseDefault  ====> end');
          done();
        }).catch((err: BusinessError): void => {
          hilog.info(domain, tag, 'getBundleInfoForSelfCal  ====> err');
          expect(err).assertFail();
          done();
        })
      })

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_5570
     * @tc.name: getBundleInfoForSelfSyncDefault
     * @tc.desc: Test getBundleInfoForSelf with default flag(by sync).
     */
    it('getBundleInfoForSelfSyncDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'getBundleInfoForSelfSyncDefault  ====> Start');
        let data: bundle.BundleInfo =
          bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT);
        hilog.info(domain, tag, 'getBundleInfoForSelfSyncDefault data ====>' + JSON.stringify(data));
        expect(data.appIndex).assertEqual(0);
        expect(data.name).assertEqual(BUNDLE_NAME);
        expect(data.vendor).assertEqual(VENDOR);
        expect(data.versionCode + '').assertEqual('1000000');
        expect(data.versionName).assertEqual("1.0.0");
        expect(data.minCompatibleVersionCode + '').assertEqual('1000000');
        expect(data.targetVersion + '').assertEqual('20');
        expect(data.installTime).assertLarger(0.0);
        expect(data.updateTime).assertLarger(0.0);
        expect(data.firstInstallTime).assertLarger(0.0);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length + '').assertEqual('0');
        expect(data.reqPermissionDetails.length + '').assertEqual('0');
        expect(data.permissionGrantStates.length + '').assertEqual('0');
        done();
        hilog.info(domain, tag, 'getBundleInfoForSelfSyncDefault end');
      })

    /*
      * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_5620
      * @tc.name: getBundleInfoForSelfApplicationCallback
      * @tc.desc: Test getBundleInfoForSelf with application flag(by callback).
      */
    it('getBundleInfoForSelfApplicationCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION,
          (err: BusinessError<void> | null, data: BundleInfo | undefined) => {
            hilog.info(domain, tag, 'getBundleInfoForSelfApplicationCallback  ====> start');
            if (err) {
              hilog.info(domain, tag, 'getBundleInfoForSelfApplicationCallback  ====> err' + JSON.stringify(err));
              expect().assertFail();
            } else if (data !== undefined) {
              expect(data!.appInfo.debug).assertTrue();
              expect(data!.appInfo.bundleType).assertEqual(bundle.BundleType.APP);
              expect(data!.appInfo.name).assertEqual(BUNDLE_NAME);
              expect(data!.appInfo.description).assertEqual("$string:module_desc");
              expect(data!.appInfo.descriptionId).assertLarger(0.0);
              expect(data!.appInfo.enabled).assertTrue();
              expect(data!.appInfo.label).assertEqual("$string:app_name");
              expect(data!.appInfo.labelId).assertLarger(0.0);
              expect(data!.appInfo.icon).assertEqual("$media:app_icon");
              expect(data!.appInfo.iconId).assertLarger(0.0);
              expect(data!.appInfo.process).assertEqual(BUNDLE_NAME);
              expect(data!.appInfo.codePath)
                .assertEqual("/data/app/el1/bundle/public/ohos.acts.bundle.stage.test.static");
              expect(data!.appInfo.removable).assertTrue();
              expect(data!.appInfo.accessTokenId).assertLarger(0.0);
              expect(data!.appInfo.uid).assertLarger(0.0);
              expect(data!.appInfo.iconResource.bundleName).assertEqual(BUNDLE_NAME);
              expect(data!.appInfo.iconResource.moduleName).assertEqual("entry");
              expect(data!.appInfo.iconResource.id).assertEqual(data!.appInfo.iconId);
              expect(data!.appInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME);
              expect(data!.appInfo.labelResource.moduleName).assertEqual("entry");
              expect(data!.appInfo.labelResource.id).assertLarger(0.0);
              expect(data!.appInfo.descriptionResource.bundleName).assertEqual(BUNDLE_NAME);
              expect(data!.appInfo.descriptionResource.moduleName).assertEqual("entry");
              expect(data!.appInfo.descriptionResource.id).assertLarger(0.0);
              expect(data!.appInfo.appDistributionType).assertEqual("os_integration");
              expect(data!.appInfo.appProvisionType).assertEqual("release");
              expect(data!.appInfo.permissions.length).assertEqual(0.0);
              expect(data!.appInfo.systemApp).assertEqual(false);
              expect(data!.appInfo.dataUnclearable).assertFalse();
              expect(data!.hapModulesInfo.length + '').assertEqual('0');
              expect(data!.hapModulesInfo.length + '').assertEqual('0');
              expect(data!.reqPermissionDetails.length + '').assertEqual('0');
              expect(data!.permissionGrantStates.length + '').assertEqual('0');
              expect(data!.signatureInfo).assertEqual(null);
              expect(data!.appInfo.installSource).assertEqual("unknown");
              expect(data!.appInfo.releaseType.length).assertLarger(0.0);
              expect(data!.appInfo.cloudFileSyncEnabled).assertFalse();
            } else {
              hilog.info(domain, tag, 'getBundleInfoForSelfApplicationCallback  ====> Fail');
              expect().assertFail();
            }
            hilog.info(domain, tag, 'getBundleInfoForSelfApplicationCallback  ====> end');
            done();
          })
      })

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_5600
     * @tc.name: getBundleInfoForSelfApplicationPromise
     * @tc.desc: Test getBundleInfoForSelf with application flag(by promise).
     */
    it('getBundleInfoForSelfApplicationPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION)
          .then((data: BundleInfo) => {
            hilog.info(domain, tag, 'getBundleInfoForSelfApplicationPromise  ====> start');
            expect(data.appInfo.debug).assertTrue();
            expect(data.appInfo.bundleType).assertEqual(bundle.BundleType.APP);
            expect(data.appInfo.name).assertEqual(BUNDLE_NAME);
            expect(data.appInfo.description).assertEqual("$string:module_desc");
            expect(data.appInfo.descriptionId).assertLarger(0.0);
            expect(data.appInfo.enabled).assertTrue();
            expect(data.appInfo.label).assertEqual("$string:app_name");
            expect(data.appInfo.labelId).assertLarger(0.0);
            expect(data.appInfo.icon).assertEqual("$media:app_icon");
            expect(data.appInfo.iconId).assertLarger(0.0);
            expect(data.appInfo.process).assertEqual(BUNDLE_NAME);
            expect(data.appInfo.codePath).assertEqual("/data/app/el1/bundle/public/ohos.acts.bundle.stage.test.static");
            expect(data.appInfo.removable).assertTrue();
            expect(data.appInfo.accessTokenId).assertLarger(0.0);
            expect(data.appInfo.uid).assertLarger(0.0);
            expect(data.appInfo.iconResource.bundleName).assertEqual(BUNDLE_NAME);
            expect(data.appInfo.iconResource.moduleName).assertEqual("entry");
            expect(data.appInfo.iconResource.id).assertEqual(data.appInfo.iconId);
            expect(data.appInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME);
            expect(data.appInfo.labelResource.moduleName).assertEqual("entry");
            expect(data.appInfo.labelResource.id).assertLarger(0.0);
            expect(data.appInfo.descriptionResource.bundleName).assertEqual(BUNDLE_NAME);
            expect(data.appInfo.descriptionResource.moduleName).assertEqual("entry");
            expect(data.appInfo.descriptionResource.id).assertLarger(0.0);
            expect(data.appInfo.appDistributionType).assertEqual("os_integration");
            expect(data.appInfo.appProvisionType).assertEqual("release");
            expect(data.appInfo.permissions.length).assertEqual(0.0);
            expect(data.appInfo.systemApp).assertEqual(false);
            expect(data.appInfo.dataUnclearable).assertFalse();
            expect(data.hapModulesInfo.length + '').assertEqual('0');
            expect(data.hapModulesInfo.length + '').assertEqual('0');
            expect(data.reqPermissionDetails.length + '').assertEqual('0');
            expect(data.permissionGrantStates.length + '').assertEqual('0');
            expect(data.signatureInfo).assertEqual(null);
            expect(data.appInfo.installSource).assertEqual("unknown");
            expect(data.appInfo.releaseType.length).assertLarger(0.0);
            expect(data.appInfo.cloudFileSyncEnabled).assertFalse();
            hilog.info(domain, tag, 'getBundleInfoForSelfApplicationPromise  ====> end');
            done();
          })
          .catch((err: BusinessError): void => {
            hilog.info(domain, tag, 'getBundleInfoForSelfApplicationPromise  ====> err');
            expect(err).assertFail();
            done();
          })
      })

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_5610
     * @tc.name: getBundleInfoForSelfApplicationSync
     * @tc.desc: Test getBundleInfoForSelf with application flag(by sync).
     */
    it('getBundleInfoForSelfApplicationSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let data: bundle.BundleInfo =
          bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
        hilog.info(domain, tag, 'getBundleInfoForSelfApplicationSync  ====> start');
        expect(data.appInfo.debug).assertTrue();
        expect(data.appInfo.bundleType).assertEqual(bundle.BundleType.APP);
        expect(data.appInfo.name).assertEqual(BUNDLE_NAME);
        expect(data.appInfo.description).assertEqual("$string:module_desc");
        expect(data.appInfo.descriptionId).assertLarger(0.0);
        expect(data.appInfo.enabled).assertTrue();
        expect(data.appInfo.label).assertEqual("$string:app_name");
        expect(data.appInfo.labelId).assertLarger(0.0);
        expect(data.appInfo.icon).assertEqual("$media:app_icon");
        expect(data.appInfo.iconId).assertLarger(0.0);
        expect(data.appInfo.process).assertEqual(BUNDLE_NAME);
        expect(data.appInfo.codePath).assertEqual("/data/app/el1/bundle/public/ohos.acts.bundle.stage.test.static");
        expect(data.appInfo.removable).assertTrue();
        expect(data.appInfo.accessTokenId).assertLarger(0.0);
        expect(data.appInfo.uid).assertLarger(0.0);
        expect(data.appInfo.iconResource.bundleName).assertEqual(BUNDLE_NAME);
        expect(data.appInfo.iconResource.moduleName).assertEqual("entry");
        expect(data.appInfo.iconResource.id).assertEqual(data.appInfo.iconId);
        expect(data.appInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME);
        expect(data.appInfo.labelResource.moduleName).assertEqual("entry");
        expect(data.appInfo.labelResource.id).assertLarger(0.0);
        expect(data.appInfo.descriptionResource.bundleName).assertEqual(BUNDLE_NAME);
        expect(data.appInfo.descriptionResource.moduleName).assertEqual("entry");
        expect(data.appInfo.descriptionResource.id).assertLarger(0.0);
        expect(data.appInfo.appDistributionType).assertEqual("os_integration");
        expect(data.appInfo.appProvisionType).assertEqual("release");
        expect(data.appInfo.permissions.length).assertEqual(0.0);
        expect(data.appInfo.systemApp).assertEqual(false);
        expect(data.appInfo.dataUnclearable).assertFalse();
        expect(data.hapModulesInfo.length + '').assertEqual('0');
        expect(data.hapModulesInfo.length + '').assertEqual('0');
        expect(data.reqPermissionDetails.length + '').assertEqual('0');
        expect(data.permissionGrantStates.length + '').assertEqual('0');
        expect(data.signatureInfo).assertEqual(null);
        expect(data.appInfo.installSource).assertEqual("unknown");
        expect(data.appInfo.releaseType.length).assertLarger(0.0);
        expect(data.appInfo.cloudFileSyncEnabled).assertFalse();
        expect(data.appInfo.metadataArray.length).assertEqual(0.0);
        expect(data.appInfo.nativeLibraryPath).assertEqual("");
        expect(data.appInfo.multiAppMode.multiAppModeType).assertEqual(bundle.MultiAppModeType.UNSPECIFIED);
        expect(data.appInfo.multiAppMode.maxCount).assertEqual(0);
        expect(data.appInfo.appIndex).assertEqual(0);
        hilog.info(domain, tag, 'getBundleInfoForSelfApplicationSync  ====> end');
        done();
      })

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_5660
     * @tc.name: getBundleInfoForSelfCallbackHapModuleInfo
     * @tc.desc: Test getBundleInfoForSelf with hapModuleInfo flag(by callback).
     */
    it('getBundleInfoForSelfCallbackHapModuleInfo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE,
          (err: BusinessError<void> | null, data: BundleInfo | undefined) => {
            hilog.info(domain, tag, 'getBundleInfoForSelfCallbackHapModuleInfo  ====> start');
            if (err) {
              hilog.info(domain, tag, 'getBundleInfoForSelfCallbackHapModuleInfo  ====> err' + JSON.stringify(err));
              expect().assertFail();
            } else if (data !== undefined) {
              expect(data!.appInfo).assertEqual(null);
              expect(data!.hapModulesInfo.length).assertEqual(1.0);
              expect(data!.hapModulesInfo[0].name).assertEqual("entry");
              expect(data!.hapModulesInfo[0].icon).assertEqual("$media:layered_image");
              expect(data!.hapModulesInfo[0].iconId).assertLarger(0.0);
              expect(data!.hapModulesInfo[0].label).assertEqual("$string:EntryAbility_label");
              expect(data!.hapModulesInfo[0].labelId).assertLarger(0.0);
              expect(data!.hapModulesInfo[0].description).assertEqual("$string:module_desc");
              expect(data!.hapModulesInfo[0].descriptionId).assertLarger(0.0);
              expect(data!.hapModulesInfo[0].mainElementName).assertEqual("EntryAbility");
              expect(data!.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0.0);
              expect(data!.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(0.0);
              expect(data!.hapModulesInfo[0].metadata.length).assertEqual(0.0);
              expect(data!.hapModulesInfo[0].deviceTypes.length).assertEqual(0.0);
              expect(data!.hapModulesInfo[0].installationFree).assertFalse();
              expect(data!.hapModulesInfo[0].hashValue).assertEqual("");
              expect(data!.hapModulesInfo[0].dependencies.length).assertEqual(0.0);
              expect(data!.hapModulesInfo[0].preloads.length).assertEqual(0.0);
              expect(data!.routerMap.length).assertEqual(0.0);
              expect(data!.reqPermissionDetails.length).assertEqual(0.0);
              expect(data!.permissionGrantStates.length).assertEqual(0.0);
              expect(data!.signatureInfo).assertEqual(null);
              expect(data!.hapModulesInfo[0].codePath).assertEqual("/data/storage/el1/bundle/entry.hap");
              expect(data!.hapModulesInfo[0].nativeLibraryPath).assertEqual("");
              expect(data!.hapModulesInfo[0].fileContextMenuConfig).assertEqual("");
            } else {
              hilog.info(domain, tag, 'getBundleInfoForSelfCallbackHapModuleInfo  ====> Fail');
              expect().assertFail();
            }
            hilog.info(domain, tag, 'getBundleInfoForSelfCallbackHapModuleInfo  ====> end');
            done();
          })
      })

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_5640
     * @tc.name: getBundleInfoForSelfHapModuleInfoPromise
     * @tc.desc: Test getBundleInfoForSelf with hapModuleInfo flag(by promise).
     */
    it('getBundleInfoForSelfHapModuleInfoPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE)
          .then((data: BundleInfo) => {
            hilog.info(domain, tag, 'getBundleInfoForSelfHapModuleInfoPromise  ====> start');
            expect(data.appInfo).assertEqual(null);
            expect(data.hapModulesInfo.length).assertEqual(1.0);
            expect(data.hapModulesInfo[0].name).assertEqual("entry");
            expect(data.hapModulesInfo[0].icon).assertEqual("$media:layered_image");
            expect(data.hapModulesInfo[0].iconId).assertLarger(0.0);
            expect(data.hapModulesInfo[0].label).assertEqual("$string:EntryAbility_label");
            expect(data.hapModulesInfo[0].labelId).assertLarger(0.0);
            expect(data.hapModulesInfo[0].description).assertEqual("$string:module_desc");
            expect(data.hapModulesInfo[0].descriptionId).assertLarger(0.0);
            expect(data.hapModulesInfo[0].mainElementName).assertEqual("EntryAbility");
            expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0.0);
            expect(data.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(0.0);
            expect(data.hapModulesInfo[0].metadata.length).assertEqual(0.0);
            expect(data.hapModulesInfo[0].deviceTypes.length).assertEqual(0.0);
            expect(data.hapModulesInfo[0].installationFree).assertFalse();
            expect(data.hapModulesInfo[0].hashValue).assertEqual("");
            expect(data.hapModulesInfo[0].dependencies.length).assertEqual(0.0);
            expect(data.hapModulesInfo[0].preloads.length).assertEqual(0.0);
            expect(data.routerMap.length).assertEqual(0.0);
            expect(data.reqPermissionDetails.length).assertEqual(0.0);
            expect(data.permissionGrantStates.length).assertEqual(0.0);
            expect(data.signatureInfo).assertEqual(null);
            expect(data.hapModulesInfo[0].codePath).assertEqual("/data/storage/el1/bundle/entry.hap");
            expect(data.hapModulesInfo[0].nativeLibraryPath).assertEqual("");
            expect(data.hapModulesInfo[0].fileContextMenuConfig).assertEqual("");
            hilog.info(domain, tag, 'getBundleInfoForSelfHapModuleInfoPromise  ====> end');
            done();
          })
          .catch((err: BusinessError): void => {
            hilog.info(domain, tag, 'getBundleInfoForSelfHapModuleInfoPromise  ====> err');
            expect(err).assertFail();
            done();
          })
      })

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_7060
     * @tc.name: getBundleInfoForSelfHapModuleInfoSync
     * @tc.desc: Test getBundleInfoForSelf with HapModuleInfo flag(by sync).
     */
    it('getBundleInfoForSelfHapModuleInfoSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let data: bundle.BundleInfo =
          bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE);
        hilog.info(domain, tag, 'getBundleInfoForSelfHapModuleInfoSync  ====> start');
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length).assertEqual(1.0);
        expect(data.hapModulesInfo[0].name).assertEqual("entry");
        expect(data.hapModulesInfo[0].icon).assertEqual("$media:layered_image");
        expect(data.hapModulesInfo[0].iconId).assertLarger(0.0);
        expect(data.hapModulesInfo[0].label).assertEqual("$string:EntryAbility_label");
        expect(data.hapModulesInfo[0].labelId).assertLarger(0.0);
        expect(data.hapModulesInfo[0].description).assertEqual("$string:module_desc");
        expect(data.hapModulesInfo[0].descriptionId).assertLarger(0.0);
        expect(data.hapModulesInfo[0].mainElementName).assertEqual("EntryAbility");
        expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0.0);
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(0.0);
        expect(data.hapModulesInfo[0].metadata.length).assertEqual(0.0);
        expect(data.hapModulesInfo[0].deviceTypes.length).assertEqual(0.0);
        expect(data.hapModulesInfo[0].installationFree).assertFalse();
        expect(data.hapModulesInfo[0].hashValue).assertEqual("");
        expect(data.hapModulesInfo[0].dependencies.length).assertEqual(0.0);
        expect(data.hapModulesInfo[0].preloads.length).assertEqual(0.0);
        expect(data.routerMap.length).assertEqual(0.0);
        expect(data.reqPermissionDetails.length).assertEqual(0.0);
        expect(data.permissionGrantStates.length).assertEqual(0.0);
        expect(data.signatureInfo).assertEqual(null);
        expect(data.hapModulesInfo[0].codePath).assertEqual("/data/storage/el1/bundle/entry.hap");
        expect(data.hapModulesInfo[0].nativeLibraryPath).assertEqual("");
        expect(data.hapModulesInfo[0].fileContextMenuConfig).assertEqual("");
        hilog.info(domain, tag, 'getBundleInfoForSelfHapModuleInfoSync  ====> end');
        done();
      })

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_7080
     * @tc.name: getBundleInfoForSelfCallbackAbilitiesInfo
     * @tc.desc: Test getBundleInfoForSelf with ability flag(by callback).
     */
    it('getBundleInfoForSelfCallbackAbilitiesInfo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY,
          (err: BusinessError<void> | null, data: BundleInfo | undefined) => {
            hilog.info(domain, tag, 'getBundleInfoForSelfCallbackAbilitiesInfo  ====> start');
            if (err) {
              hilog.info(domain, tag, 'getBundleInfoForSelfCallbackAbilitiesInfo  ====> err' + JSON.stringify(err));
              expect().assertFail();
            } else if (data !== undefined) {
              expect(data!.appInfo).assertEqual(null);
              expect(data!.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(BUNDLE_NAME);
              expect(data!.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual("entry");
              expect(data!.hapModulesInfo[0].abilitiesInfo[0].name).assertEqual("EntryAbility");
              expect(data!.hapModulesInfo[0].abilitiesInfo[0].label).assertEqual("$string:EntryAbility_label");
              expect(data!.hapModulesInfo[0].abilitiesInfo[0].labelId).assertLarger(0.0);
              expect(data!.hapModulesInfo[0].abilitiesInfo[0].description).assertEqual("$string:EntryAbility_desc");
              expect(data!.hapModulesInfo[0].abilitiesInfo[0].descriptionId).assertLarger(0.0);
              expect(data!.hapModulesInfo[0].abilitiesInfo[0].icon).assertEqual("$media:layered_image");
              expect(data!.hapModulesInfo[0].abilitiesInfo[0].iconId).assertLarger(0.0);
              expect(data!.hapModulesInfo[0].abilitiesInfo[0].process).assertEqual("");
              expect(data!.hapModulesInfo[0].abilitiesInfo[0].exported).assertTrue();
              expect(data!.hapModulesInfo[0].abilitiesInfo[0].excludeFromDock).assertFalse();
              expect(data!.hapModulesInfo[0].abilitiesInfo[0].orientation)
                .assertEqual(bundle.DisplayOrientation.PORTRAIT);
              expect(data!.hapModulesInfo[0].abilitiesInfo[0].orientationId).assertEqual(0.0);
              expect(data!.hapModulesInfo[0].abilitiesInfo[0].launchType).assertEqual(bundle.LaunchType.SINGLETON);
              expect(data!.hapModulesInfo[0].abilitiesInfo[0].permissions.length).assertEqual(0.0);
              expect(data!.hapModulesInfo[0].abilitiesInfo[0].deviceTypes.length).assertEqual(0.0);
              expect(data!.hapModulesInfo[0].abilitiesInfo[0].skills.length).assertEqual(0.0);
              expect(data!.hapModulesInfo[0].abilitiesInfo[0].metadata.length).assertEqual(0.0);
              expect(data!.hapModulesInfo[0].abilitiesInfo[0].enabled).assertTrue();
              expect(data!.hapModulesInfo[0].abilitiesInfo[0].appIndex).assertEqual(0.0);
              expect(data!.hapModulesInfo[0].abilitiesInfo[0].supportWindowModes.length).assertEqual(3);
              expect(data!.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowRatio).assertEqual(0.0);
              expect(data!.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowRatio).assertEqual(0.0);
              expect(data!.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowWidth).assertEqual(0.0);
              expect(data!.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowWidth).assertEqual(0.0);
              expect(data!.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowHeight).assertEqual(0.0);
              expect(data!.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowHeight).assertEqual(0.0);
            } else {
              hilog.info(domain, tag, 'getBundleInfoForSelfCallbackAbilitiesInfo  ====> Fail');
              expect().assertFail();
            }
            hilog.info(domain, tag, 'getBundleInfoForSelfCallbackAbilitiesInfo  ====> end');
            done();
          })
      })

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_7070
     * @tc.name: getBundleInfoForSelfAbilitiesInfoPromise
     * @tc.desc: Test getBundleInfoForSelf with AbilitiesInfo flag(by promise).
     */
    it('getBundleInfoForSelfAbilitiesInfoPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY).then((data: BundleInfo) => {
          hilog.info(domain, tag, 'getBundleInfoForSelfAbilitiesInfoPromise  ====> start');
          expect(data.appInfo).assertEqual(null);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].applicationInfo).not().assertNull();
          expect(data.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(BUNDLE_NAME);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual("entry");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].name).assertEqual("EntryAbility");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].label).assertEqual("$string:EntryAbility_label");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].labelId).assertLarger(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].description).assertEqual("$string:EntryAbility_desc");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].descriptionId).assertLarger(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].icon).assertEqual("$media:layered_image");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].iconId).assertLarger(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].process).assertEqual("");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].exported).assertTrue();
          expect(data.hapModulesInfo[0].abilitiesInfo[0].excludeFromDock).assertFalse();
          expect(data.hapModulesInfo[0].abilitiesInfo[0].orientation).assertEqual(bundle.DisplayOrientation.PORTRAIT);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].orientationId).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].launchType).assertEqual(bundle.LaunchType.SINGLETON);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].permissions.length).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].deviceTypes.length).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].skills.length).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].metadata.length).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].enabled).assertTrue();
          expect(data.hapModulesInfo[0].abilitiesInfo[0].appIndex).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].supportWindowModes.length).assertEqual(3);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowRatio).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowRatio).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowWidth).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowWidth).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowHeight).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowHeight).assertEqual(0.0);
          hilog.info(domain, tag, 'getBundleInfoForSelfAbilitiesInfoPromise  ====> end');
          done();
        }).catch((err: BusinessError): void => {
          hilog.info(domain, tag, 'getBundleInfoForSelfAbilitiesInfoPromise  ====> err');
          expect(err).assertFail();
          done();
        })
      })

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_7090
     * @tc.name: getBundleInfoForSelfAbilitiesInfoSync
     * @tc.desc: Test getBundleInfoForSelf with AbilitiesInfo flag(by sync).
     */
    it('getBundleInfoForSelfAbilitiesInfoSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let data: bundle.BundleInfo =
          bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
          bundle.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY);
        hilog.info(domain, tag, 'getBundleInfoForSelfAbilitiesInfoSync  ====> start');
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].applicationInfo).not().assertNull();
        expect(data.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(BUNDLE_NAME);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual("entry");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].name).assertEqual("EntryAbility");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].label).assertEqual("$string:EntryAbility_label");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].labelId).assertLarger(0.0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].description).assertEqual("$string:EntryAbility_desc");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].descriptionId).assertLarger(0.0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].icon).assertEqual("$media:layered_image");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].iconId).assertLarger(0.0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].process).assertEqual("");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].exported).assertTrue();
        expect(data.hapModulesInfo[0].abilitiesInfo[0].excludeFromDock).assertFalse();
        expect(data.hapModulesInfo[0].abilitiesInfo[0].orientation).assertEqual(bundle.DisplayOrientation.PORTRAIT);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].orientationId).assertEqual(0.0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].launchType).assertEqual(bundle.LaunchType.SINGLETON);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].permissions.length).assertEqual(0.0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].deviceTypes.length).assertEqual(0.0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].skills.length).assertEqual(0.0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].metadata.length).assertEqual(0.0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].enabled).assertTrue();
        expect(data.hapModulesInfo[0].abilitiesInfo[0].appIndex).assertEqual(0.0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].supportWindowModes.length).assertEqual(3);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowRatio).assertEqual(0.0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowRatio).assertEqual(0.0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowWidth).assertEqual(0.0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowWidth).assertEqual(0.0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowHeight).assertEqual(0.0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowHeight).assertEqual(0.0);
        hilog.info(domain, tag, 'getBundleInfoForSelfAbilitiesInfoSync  ====> end');
        done();
      })

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_7100
     * @tc.name: getBundleInfoForSelfSyncExtensionAbilitiesInfo
     * @tc.desc: Test getBundleInfoForSelfSync with extensionAbilitiesInfo flag.
     */
    it('getBundleInfoForSelfSyncExtensionAbilitiesInfo', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let data = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY);
        hilog.info(domain, tag, "checkCommonBundleInfo start");
        expect(data.name).assertEqual(BUNDLE_NAME);
        expect(data.vendor).assertEqual(VENDOR);
        expect(data.versionCode + '').assertEqual('1000000');
        expect(data.versionName).assertEqual("1.0.0");
        expect(data.minCompatibleVersionCode + '').assertEqual('1000000');
        expect(data.targetVersion  + '').assertEqual('20');
        expect(data.installTime).assertLarger(0.0);
        expect(data.updateTime).assertLarger(0.0);
        expect(data.firstInstallTime).assertLarger(0.0);
        expect(data.appIndex).assertEqual(0.0);
        hilog.info(domain, tag, "checkCommonBundleInfo end");
        expect(data.hapModulesInfo.length).assertEqual(1.0);
        expect(data.hapModulesInfo[0].name + '').assertEqual("entry");
        expect(data.hapModulesInfo[0].label + '').assertEqual("$string:EntryAbility_label");
        expect(data.hapModulesInfo[0].labelId).assertLarger(0.0);
        expect(data.hapModulesInfo[0].description + '').assertEqual("$string:module_desc");
        expect(data.hapModulesInfo[0].descriptionId).assertLarger(0.0);
        expect(data.hapModulesInfo[0].mainElementName + '').assertEqual("EntryAbility");
        expect(data.hapModulesInfo[0].deviceTypes.length).assertEqual(0.0);
        expect(data.hapModulesInfo[0].installationFree).assertFalse();
        expect(data.hapModulesInfo[0].hashValue + '').assertEqual("");
        hilog.info(domain, tag, "checkCommonHapModuleInfo end");
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0.0);
        let extensionList = data.hapModulesInfo[0].extensionAbilitiesInfo
        expect(extensionList.length).assertEqual(26);
        let count = 0;
        for (let i = 0; i < 24; i++) {
          switch (extensionList[i].name) {
            case "Form":
              hilog.info(domain, tag, "Form");
              expect(extensionList[i].bundleName).assertEqual(BUNDLE_NAME);
              expect(extensionList[i].moduleName + '').assertEqual("entry");
              expect(extensionList[i].name + '').assertEqual("Form");
              expect(extensionList[i].labelId).assertLarger(0.0);
              expect(extensionList[i].descriptionId).assertLarger(0.0);
              expect(extensionList[i].iconId).assertLarger(0.0);
              expect(extensionList[i].exported).assertTrue();
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.FORM);
              expect(extensionList[i].extensionAbilityTypeName + '').assertEqual("form");
              expect(extensionList[i].permissions.length).assertEqual(0.0);
              expect(extensionList[i].applicationInfo).not().assertEqual(null);
              expect(extensionList[i].metadata.length).assertEqual(0.0);
              expect(extensionList[i].enabled).assertTrue();
              expect(extensionList[i].readPermission + '').assertEqual("");
              expect(extensionList[i].writePermission + '').assertEqual("");
              expect(extensionList[i].skills + '').assertEqual("");
              expect(extensionList[i].appIndex).assertEqual(0.0);
              count = count + 1;
              break;
            case "Form1":
              hilog.info(domain, tag, "Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].bundleName).assertEqual(BUNDLE_NAME);
              expect(extensionList[i].moduleName + '').assertEqual("entry");
              expect(extensionList[i].name + '').assertEqual("Form1");
              expect(extensionList[i].labelId).assertLarger(0.0);
              expect(extensionList[i].descriptionId).assertLarger(0.0);
              expect(extensionList[i].iconId).assertLarger(0.0);
              expect(extensionList[i].exported).assertTrue();
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.FORM);
              expect(extensionList[i].permissions.length).assertEqual(0.0);
              expect(extensionList[i].applicationInfo).not().assertEqual(null);
              expect(extensionList[i].metadata.length).assertEqual(0.0);
              expect(extensionList[i].enabled).assertTrue();
              expect(extensionList[i].readPermission + '').assertEqual("");
              expect(extensionList[i].writePermission + '').assertEqual("");
              expect(extensionList[i].appIndex).assertEqual(0.0);
              count = count + 2;
              break;
            case 'workScheduler':
              hilog.info(domain, tag, "Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.WORK_SCHEDULER)
              count = count + 3;
              break;
            case 'inputMethod':
              hilog.info(domain, tag, "Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.INPUT_METHOD)
              count = count + 4;
              break;
            case 'accessibility':
              hilog.info(domain, tag, "Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.ACCESSIBILITY)
              count = count + 5;
              break;
            case 'fileShare':
              hilog.info(domain, tag, "Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.FILE_SHARE)
              count = count + 6;
              break;
            case 'staticSubscriber':
              hilog.info(domain, tag, "Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.STATIC_SUBSCRIBER)
              count = count + 7;
              break;
            case 'wallpaper':
              hilog.info(domain, tag, "Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.WALLPAPER)
              count = count + 8;
              break;
            case 'backup':
              hilog.info(domain, tag, "Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.BACKUP)
              count = count + 9;
              break;
            case 'window':
              hilog.info(domain, tag, "Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.WINDOW)
              count = count + 10;
              break;
            case 'enterpriseAdmin':
              hilog.info(domain, tag, "Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.ENTERPRISE_ADMIN)
              count = count + 11;
              break;
            case 'thumbnail':
              hilog.info(domain, tag, "Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.THUMBNAIL)
              count = count + 12;
              break;
            case 'preview':
              hilog.info(domain, tag, "Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.PREVIEW)
              count = count + 13;
              break;
            case 'driver':
              hilog.info(domain, tag, "driver" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.DRIVER)
              count = count + 14;
              break;
            case 'push':
              hilog.info(domain, tag, "push" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.PUSH)
              count = count + 15;
              break;
            case 'share':
              hilog.info(domain, tag, "share" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.SHARE)
              count = count + 16;
              break;
            case 'action':
              hilog.info(domain, tag, "action" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.ACTION)
              count = count + 17;
              break;
            case 'adsService':
              hilog.info(domain, tag, "adsService" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.ADS_SERVICE)
              count = count + 18;
              break;
            case 'embeddedUI':
              hilog.info(domain, tag, "embeddedUI" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.EMBEDDED_UI)
              count = count + 19;
              break;
            case 'assetAcceleration':
              hilog.info(domain, tag, "assetAcceleration" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.ASSET_ACCELERATION)
              count = count + 20;
              break;
            case 'print':
              hilog.info(domain, tag, "print" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.PRINT)
              count = count + 21;
              break;
            case 'insightIntentUI':
              hilog.info(domain, tag, "insightIntentUI" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.INSIGHT_INTENT_UI)
              count = count + 22;
              break;
            case 'fence':
              hilog.info(domain, tag, "fence" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.FENCE)
              count = count + 23;
              break;
            case 'formEdit':
              hilog.info(domain, tag, "formEdit" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.FORM_EDIT)
              count = count + 24;
              break;
            case 'distributed':
              hilog.info(domain, tag, "distributed" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.DISTRIBUTED)
              count = count + 25;
              break;
          }
          hilog.info(domain, tag, "count" + JSON.stringify(count));
        }
        expect(count).assertEqual(312);
        expect(data.hapModulesInfo[0].metadata.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        done();
    })

    /*
    * @tc.number: getBundleInfoForSelfApplicationPromiseBundleFlag01
    * @tc.name: getBundleInfoForSelfApplicationPromiseBundleFlag01
    * @tc.desc: Test getBundleInfoForSelf with BundleFlag.
    */
    it('getBundleInfoForSelfApplicationPromiseBundleFlag01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION)
          .then((data: BundleInfo) => {
            hilog.info(domain, tag, 'getBundleInfoForSelfApplicationPromise  ====> start');
            console.log("getBundleInfoForSelfApplicationPromise01", data);
            hilog.info(domain, tag,
              "getBundleInfoForSelfApplicationPromise01" + JSON.stringify(data.reqPermissionDetails));
            expect(data.name).assertEqual("ohos.acts.bundle.stage.test.static");
            expect(data.minCompatibleVersionCode).assertEqual(1000000);
            expect(data.versionName).assertEqual("1.0.0");
            expect(data.versionCode).assertEqual(1000000);
            expect(data.vendor).assertEqual("example");
            expect(data.targetVersion).assertEqual(20);
            expect(data.appInfo).assertEqual(null);
            expect(data.installTime).assertLarger(0.0);
            expect(data.updateTime).assertLarger(0.0);
            expect(data.firstInstallTime).assertLarger(0.0);
            expect(data.permissionGrantStates).not().assertNull();
            expect(data.reqPermissionDetails).not().assertNull();
            expect(data.signatureInfo).assertEqual(null);
            expect(data.permissionGrantStates.length).assertEqual(4);
            expect(data.reqPermissionDetails.length).assertEqual(4);
            expect(data.routerMap.length).assertEqual(0);
            hilog.info(domain, tag, 'getBundleInfoForSelfApplicationPromise  ====> end');
            done();
          })
          .catch((err: BusinessError): void => {
            console.log('getBundleInfoForSelfApplicationPromise01  ====> err', JSON.stringify(err));
            expect(err).assertFail();
            done();
          })
      })

    /*
    * @tc.number: getBundleInfoForSelfApplicationPromiseBundleFlag02
    * @tc.name: getBundleInfoForSelfApplicationPromiseBundleFlag02
    * @tc.desc: Test getBundleInfoForSelf with BundleFlag.
    */
    it('getBundleInfoForSelfApplicationPromiseBundleFlag02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          await bundle.getBundleInfoForSelf(
            bundle.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA |
            bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
            bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
            bundle.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
            bundle.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY)
            .then((data: BundleInfo) => {
              hilog.info(domain, tag, 'getBundleInfoForSelfApplicationPromise02  ====> start');
              expect(data.name).assertEqual("ohos.acts.bundle.stage.test.static");
              expect(data.minCompatibleVersionCode).assertEqual(1000000);
              expect(data.versionName).assertEqual("1.0.0");
              expect(data.versionCode).assertEqual(1000000);
              expect(data.vendor).assertEqual("example");
              expect(data.targetVersion).assertEqual(20);
              expect(data!.installTime).assertLarger(0.0);
              expect(data!.updateTime).assertLarger(0.0);
              expect(data!.firstInstallTime).assertLarger(0.0);
              expect(data.hapModulesInfo[0].metadata.length).assertEqual(1);
              expect(data.hapModulesInfo[0].abilitiesInfo[0].metadata.length).assertEqual(0.0);
              expect(data.signatureInfo).assertEqual(null);
              expect(data.permissionGrantStates.length).assertEqual(0);
              expect(data.reqPermissionDetails.length).assertEqual(0);
              expect(data.routerMap.length).assertEqual(0);
              hilog.info(domain, tag, 'getBundleInfoForSelfApplicationPromise02  ====> end');
              done();
            })
            .catch((err: BusinessError<void>): void => {
              console.log('getBundleInfoForSelfApplicationPromise02  ====> err', JSON.stringify(err));
              expect(err).assertFail();
              done();
            })
        } catch (err) {
          console.log('getBundleInfoForSelfApplicationPromise02  ====> err', JSON.stringify(err));
          expect(err).assertFail();
          done();
        }
      })

    /*
    * @tc.number: getBundleInfoForSelfApplicationPromiseBundleFlag03
    * @tc.name: getBundleInfoForSelfApplicationPromiseBundleFlag03
    * @tc.desc: Test getBundleInfoForSelf with BundleFlag.
    */
    it('getBundleInfoForSelfApplicationPromiseBundleFlag03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await bundle.getBundleInfoForSelf(
          bundle.BundleFlag.GET_BUNDLE_INFO_WITH_DISABLE)
          .then((data: BundleInfo) => {
            hilog.info(domain, tag, 'getBundleInfoForSelfApplicationPromise  ====> start');
            expect(data.name).assertEqual("ohos.acts.bundle.stage.test.static");
            expect(data.minCompatibleVersionCode).assertEqual(1000000);
            expect(data.versionName).assertEqual("1.0.0");
            expect(data.versionCode).assertEqual(1000000);
            expect(data.vendor).assertEqual("example");
            expect(data.targetVersion).assertEqual(20);
            expect(data.appInfo).assertEqual(null);
            expect(data.installTime).assertLarger(0.0);
            expect(data.updateTime).assertLarger(0.0);
            expect(data.firstInstallTime).assertLarger(0.0);
            expect(data.signatureInfo).assertEqual(null);
            expect(data.permissionGrantStates.length).assertEqual(0);
            expect(data.reqPermissionDetails.length).assertEqual(0);
            expect(data.routerMap.length).assertEqual(0);
            expect(data!.installTime).assertLarger(0.0);
            expect(data!.updateTime).assertLarger(0.0);
            expect(data!.firstInstallTime).assertLarger(0.0);
            hilog.info(domain, tag, 'getBundleInfoForSelfApplicationPromise  ====> end');
            done();
          })
          .catch((err: BusinessError): void => {
            console.log('getBundleInfoForSelfApplicationPromise03  ====> err', JSON.stringify(err));
            expect(err).assertFail();
            done();
          })
      })

    /*
    * @tc.number: getBundleInfoForSelfApplicationPromiseBundleFlag04
    * @tc.name: getBundleInfoForSelfApplicationPromiseBundleFlag04
    * @tc.desc: Test getBundleInfoForSelf with BundleFlag.
    */
    it('getBundleInfoForSelfApplicationPromiseBundleFlag04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await bundle.getBundleInfoForSelf(
          bundle.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO)
          .then((data: BundleInfo) => {
            hilog.info(domain, tag, 'getBundleInfoForSelfApplicationPromise  ====> start');
            expect(data.permissionGrantStates.length).assertEqual(0);
            expect(data.routerMap.length).assertEqual(0);
            expect(data.minCompatibleVersionCode).assertEqual(1000000);
            expect(data.name).assertEqual("ohos.acts.bundle.stage.test.static");
            expect(data.vendor).assertEqual("example");
            expect(data.versionCode).assertEqual(1000000);
            expect(data.targetVersion).assertEqual(20);
            expect(data.versionName).assertEqual("1.0.0");
            expect(data.appInfo).assertEqual(null);
            expect(data.hapModulesInfo.length).assertEqual(0);
            expect(data.reqPermissionDetails.length).assertEqual(0);
            expect(data.signatureInfo.appId).assertContain("ohos.acts.bundle.stage.test.static");
            expect(data.signatureInfo.fingerprint).not().assertNull();
            expect(data.signatureInfo.appIdentifier).assertEqual("");
            expect(data.signatureInfo.certificate).not().assertNull();
            hilog.info(domain, tag, 'getBundleInfoForSelfApplicationPromise  ====> end');
            done();
          })
          .catch((err: BusinessError): void => {
            console.log('getBundleInfoForSelfApplicationPromise04  ====> err', JSON.stringify(err));
            expect(err).assertFail();
            done();
          })
      })

    /*
    * @tc.number: getBundleInfoForSelfApplicationPromiseBundleFlag05
    * @tc.name: getBundleInfoForSelfApplicationPromiseBundleFlag05
    * @tc.desc: Test getBundleInfoForSelf with BundleFlag.
    */
    it('getBundleInfoForSelfApplicationPromiseBundleFlag05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await bundle.getBundleInfoForSelf(
          bundle.BundleFlag.GET_BUNDLE_INFO_WITH_MENU |
          bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE)
          .then((data: BundleInfo) => {
            hilog.info(domain, tag, 'getBundleInfoForSelfApplicationPromise  ====> start');
            expect(data.name).assertEqual("ohos.acts.bundle.stage.test.static");
            expect(data.minCompatibleVersionCode).assertEqual(1000000);
            expect(data.versionName).assertEqual("1.0.0");
            expect(data.versionCode).assertEqual(1000000);
            expect(data.vendor).assertEqual("example");
            expect(data.targetVersion).assertEqual(20);
            expect(data.signatureInfo).assertEqual(null);
            expect(data.permissionGrantStates.length).assertEqual(0);
            expect(data.reqPermissionDetails.length).assertEqual(0);
            expect(data.routerMap.length).assertEqual(0);
            expect(data!.hapModulesInfo.length).assertEqual(1.0);
            expect(data!.hapModulesInfo[0].name).assertEqual("entry");
            expect(data!.hapModulesInfo[0].icon).assertEqual("$media:layered_image");
            expect(data!.hapModulesInfo[0].iconId).assertLarger(0.0);
            expect(data!.hapModulesInfo[0].label).assertEqual("$string:EntryAbility_label");
            expect(data!.hapModulesInfo[0].labelId).assertLarger(0.0);
            expect(data!.hapModulesInfo[0].description).assertEqual("$string:module_desc");
            expect(data!.hapModulesInfo[0].descriptionId).assertLarger(0.0);
            expect(data!.hapModulesInfo[0].mainElementName).assertEqual("EntryAbility");
            expect(data!.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0.0);
            expect(data!.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(0.0);
            expect(data!.hapModulesInfo[0].metadata.length).assertEqual(0.0);
            expect(data!.hapModulesInfo[0].deviceTypes.length).assertEqual(0.0);
            expect(data!.hapModulesInfo[0].installationFree).assertFalse();
            expect(data!.hapModulesInfo[0].hashValue).assertEqual("");
            expect(data!.hapModulesInfo[0].dependencies.length).assertEqual(0.0);
            expect(data!.hapModulesInfo[0].preloads.length).assertEqual(0.0);
            expect(data!.hapModulesInfo[0].preloads.length).assertEqual(0.0);
            expect(data!.hapModulesInfo[0].codePath).assertEqual("/data/storage/el1/bundle/entry.hap");
            expect(data!.hapModulesInfo[0].nativeLibraryPath).assertEqual("");
            expect(data!.hapModulesInfo[0].fileContextMenuConfig).assertEqual("");
            hilog.info(domain, tag, 'getBundleInfoForSelfApplicationPromise  ====> end');
            done();
          })
          .catch((err: BusinessError): void => {
            console.log('getBundleInfoForSelfApplicationPromise05  ====> err', JSON.stringify(err));
            expect(err).assertFail();
            done();
          })
      })

    /*
    * @tc.number: getBundleInfoForSelfApplicationPromiseBundleFlag06
    * @tc.name: getBundleInfoForSelfApplicationPromiseBundleFlag06
    * @tc.desc: Test getBundleInfoForSelf with BundleFlag.
    */
    it('getBundleInfoForSelfApplicationPromiseBundleFlag06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await bundle.getBundleInfoForSelf(
          bundle.BundleFlag.GET_BUNDLE_INFO_WITH_ROUTER_MAP |
          bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE)
          .then((data: BundleInfo) => {
            hilog.info(domain, tag, 'getBundleInfoForSelfApplicationPromise  ====> start');
            expect(data.name).assertEqual("ohos.acts.bundle.stage.test.static");
            expect(data.minCompatibleVersionCode).assertEqual(1000000);
            expect(data.versionName).assertEqual("1.0.0");
            expect(data.versionCode).assertEqual(1000000);
            expect(data.vendor).assertEqual("example");
            expect(data.targetVersion).assertEqual(20);
            expect(data!.routerMap.length).assertEqual(0.0);
            expect(data.signatureInfo).assertEqual(null);
            expect(data!.hapModulesInfo.length).assertEqual(1.0);
            expect(data!.hapModulesInfo[0].name).assertEqual("entry");
            expect(data!.hapModulesInfo[0].icon).assertEqual("$media:layered_image");
            expect(data!.hapModulesInfo[0].iconId).assertLarger(0.0);
            expect(data!.hapModulesInfo[0].label).assertEqual("$string:EntryAbility_label");
            expect(data!.hapModulesInfo[0].labelId).assertLarger(0.0);
            expect(data!.hapModulesInfo[0].description).assertEqual("$string:module_desc");
            expect(data!.hapModulesInfo[0].descriptionId).assertLarger(0.0);
            expect(data!.hapModulesInfo[0].mainElementName).assertEqual("EntryAbility");
            expect(data!.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0.0);
            expect(data!.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(0.0);
            expect(data!.hapModulesInfo[0].metadata.length).assertEqual(0.0);
            expect(data!.hapModulesInfo[0].deviceTypes.length).assertEqual(0.0);
            expect(data!.hapModulesInfo[0].installationFree).assertFalse();
            expect(data!.hapModulesInfo[0].hashValue).assertEqual("");
            expect(data!.hapModulesInfo[0].dependencies.length).assertEqual(0.0);
            expect(data!.hapModulesInfo[0].preloads.length).assertEqual(0.0);
            expect(data!.hapModulesInfo[0].preloads.length).assertEqual(0.0);
            expect(data!.hapModulesInfo[0].codePath).assertEqual("/data/storage/el1/bundle/entry.hap");
            expect(data!.hapModulesInfo[0].nativeLibraryPath).assertEqual("");
            expect(data!.hapModulesInfo[0].fileContextMenuConfig).assertEqual("");
            hilog.info(domain, tag, 'getBundleInfoForSelfApplicationPromise  ====> end');
            done();
          })
          .catch((err: BusinessError): void => {
            console.log('getBundleInfoForSelfApplicationPromise06  ====> err', JSON.stringify(err));
            expect(err).assertFail();
            done();
          })
      })

    /*
    * @tc.number: getBundleInfoForSelfApplicationPromiseBundleFlag07
    * @tc.name: getBundleInfoForSelfApplicationPromiseBundleFlag07
    * @tc.desc: Test getBundleInfoForSelf with BundleFlag.
    */
    it('getBundleInfoForSelfApplicationPromiseBundleFlag07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY)
          .then((data: BundleInfo) => {
            hilog.info(domain, tag, 'getBundleInfoForSelfApplicationPromise  ====> start');
            console.log("getBundleInfoForSelfApplicationPromise07", data.hapModulesInfo[0].abilitiesInfo[0]);
            expect(data.name).assertEqual("ohos.acts.bundle.stage.test.static");
            expect(data.signatureInfo).assertEqual(null);
            expect(data.minCompatibleVersionCode).assertEqual(1000000);
            expect(data.versionName).assertEqual("1.0.0");
            expect(data.versionCode).assertEqual(1000000);
            expect(data.vendor).assertEqual("example");
            expect(data.targetVersion).assertEqual(20);
            expect(data.hapModulesInfo[0].abilitiesInfo[0].skills.length).assertEqual(1);
            expect(data!.hapModulesInfo[0].abilitiesInfo[0].bundleName)
              .assertEqual("ohos.acts.bundle.stage.test.static");
            expect(data!.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual("entry");
            expect(data!.hapModulesInfo[0].abilitiesInfo[0].name).assertEqual("EntryAbility");
            expect(data!.hapModulesInfo[0].abilitiesInfo[0].label).assertEqual("$string:EntryAbility_label");
            expect(data!.hapModulesInfo[0].abilitiesInfo[0].labelId).assertLarger(0.0);
            expect(data!.hapModulesInfo[0].abilitiesInfo[0].description).assertEqual("$string:EntryAbility_desc");
            expect(data!.hapModulesInfo[0].abilitiesInfo[0].descriptionId).assertLarger(0.0);
            expect(data!.hapModulesInfo[0].abilitiesInfo[0].icon).assertEqual("$media:layered_image");
            expect(data!.hapModulesInfo[0].abilitiesInfo[0].iconId).assertLarger(0.0);
            expect(data!.hapModulesInfo[0].abilitiesInfo[0].process).assertEqual("");
            expect(data!.hapModulesInfo[0].abilitiesInfo[0].exported).assertTrue();
            expect(data!.hapModulesInfo[0].abilitiesInfo[0].excludeFromDock).assertFalse();
            expect(data!.hapModulesInfo[0].abilitiesInfo[0].orientation).assertEqual(2);
            expect(data!.hapModulesInfo[0].abilitiesInfo[0].orientationId).assertEqual(0.0);
            expect(data!.hapModulesInfo[0].abilitiesInfo[0].launchType).assertEqual(bundle.LaunchType.SINGLETON);
            expect(data!.hapModulesInfo[0].abilitiesInfo[0].permissions.length).assertEqual(0.0);
            expect(data!.hapModulesInfo[0].abilitiesInfo[0].deviceTypes.length).assertEqual(0.0);
            expect(data!.hapModulesInfo[0].abilitiesInfo[0].skills.length).assertEqual(1);
            expect(data!.hapModulesInfo[0].abilitiesInfo[0].metadata.length).assertEqual(0.0);
            expect(data!.hapModulesInfo[0].abilitiesInfo[0].enabled).assertTrue();
            expect(data!.hapModulesInfo[0].abilitiesInfo[0].appIndex).assertEqual(0.0);
            expect(data!.hapModulesInfo[0].abilitiesInfo[0].supportWindowModes.length).assertEqual(3);
            expect(data!.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowRatio).assertEqual(0.0);
            expect(data!.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowRatio).assertEqual(0.0);
            expect(data!.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowWidth).assertEqual(0.0);
            expect(data!.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowWidth).assertEqual(0.0);
            expect(data!.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowHeight).assertEqual(0.0);
            expect(data!.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowHeight).assertEqual(0.0);
            hilog.info(domain, tag, 'getBundleInfoForSelfApplicationPromise  ====> end');
            done();
          })
          .catch((err: BusinessError): void => {
            console.log('getBundleInfoForSelfApplicationPromise07  ====> err', JSON.stringify(err));
            expect(err).assertFail();
            done();
          })
      })

    /*
    * @tc.number: Sub_Bms_Framework_Query_AppInfo_5760
    * @tc.name: getBundleInfoForSelfPermissionPro
    * @tc.desc: Test getBundleInfoForSelf with permission flag(by promise).
    */
    it('getBundleInfoForSelfPermissionPro', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION)
          .then((data: BundleInfo) => {
            hilog.info(domain, tag, 'getBundleInfoForSelfPermissionPro  ====> start');
            expect(data.name).assertEqual("ohos.acts.bundle.stage.test.static");
            expect(data.signatureInfo).assertEqual(null);
            expect(data.minCompatibleVersionCode).assertEqual(1000000);
            expect(data.versionName).assertEqual("1.0.0");
            expect(data.versionCode).assertEqual(1000000);
            expect(data.vendor).assertEqual("example");
            expect(data.targetVersion).assertEqual(20);
            expect(data.permissionGrantStates[2]).assertEqual(bundle.PermissionGrantState.PERMISSION_DENIED);
            expect(data.permissionGrantStates[0]).assertEqual(bundle.PermissionGrantState.PERMISSION_GRANTED);
            hilog.info(domain, tag, 'getBundleInfoForSelfPermissionPro  ====> end');
            done();
          })
          .catch((err: BusinessError): void => {
            console.log('getBundleInfoForSelfPermissionPro  ====> err', JSON.stringify(err));
            expect(err).assertFail();
            done();
          })
      })

    /**
     * @tc.number: getBundleInfoForSelfApplicationPromiseBundleFlag08
     * @tc.name: getBundleInfoForSelfApplicationPromiseBundleFlag08
     * @tc.desc: Test getBundleInfoForSelf with BundleFlag.
     */
    it('getBundleInfoForSelfApplicationPromiseBundleFlag08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        hilog.info(domain, tag, 'getBundleInfoForSelfApplicationPromise  ====> start');
        const data = await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY);

        expect(data.name).assertEqual("ohos.acts.bundle.stage.test.static");
        expect(data.signatureInfo).assertEqual(null);
        expect(data.minCompatibleVersionCode).assertEqual(1000000);
        expect(data.versionName).assertEqual("1.0.0");
        expect(data.versionCode).assertEqual(1000000);
        expect(data.vendor).assertEqual("example");
        expect(data.targetVersion).assertEqual(20);

        expect(data!.hapModulesInfo[0].abilitiesInfo[1].bundleName)
          .assertEqual("ohos.acts.bundle.stage.test.static");
        expect(data!.hapModulesInfo[0].abilitiesInfo[1].moduleName).assertEqual("entry");
        expect(data!.hapModulesInfo[0].abilitiesInfo[1].name).assertEqual("EntryAbility1");
        expect(data!.hapModulesInfo[0].abilitiesInfo[1].label).assertEqual("$string:EntryAbility_label");
        expect(data!.hapModulesInfo[0].abilitiesInfo[1].labelId).assertLarger(0.0);
        expect(data!.hapModulesInfo[0].abilitiesInfo[1].description).assertEqual("$string:EntryAbility_desc");
        expect(data!.hapModulesInfo[0].abilitiesInfo[1].descriptionId).assertLarger(0.0);
        expect(data!.hapModulesInfo[0].abilitiesInfo[1].icon).assertEqual("$media:layered_image");
        expect(data!.hapModulesInfo[0].abilitiesInfo[1].iconId).assertLarger(0.0);
        expect(data!.hapModulesInfo[0].abilitiesInfo[1].process).assertEqual("");
        expect(data!.hapModulesInfo[0].abilitiesInfo[1].exported).assertTrue();
        expect(data!.hapModulesInfo[0].abilitiesInfo[1].excludeFromDock).assertFalse();
        expect(data!.hapModulesInfo[0].abilitiesInfo[1].orientation).assertEqual(2);
        expect(data!.hapModulesInfo[0].abilitiesInfo[1].orientationId).assertEqual(0.0);
        expect(data!.hapModulesInfo[0].abilitiesInfo[1].launchType).assertEqual(bundle.LaunchType.MULTITON);

        expect(data!.hapModulesInfo[0].abilitiesInfo[2].bundleName)
          .assertEqual("ohos.acts.bundle.stage.test.static");
        expect(data!.hapModulesInfo[0].abilitiesInfo[2].moduleName).assertEqual("entry");
        expect(data!.hapModulesInfo[0].abilitiesInfo[2].name).assertEqual("EntryAbility2");
        expect(data!.hapModulesInfo[0].abilitiesInfo[2].label).assertEqual("$string:EntryAbility_label");
        expect(data!.hapModulesInfo[0].abilitiesInfo[2].labelId).assertLarger(0.0);
        expect(data!.hapModulesInfo[0].abilitiesInfo[2].description).assertEqual("$string:EntryAbility_desc");
        expect(data!.hapModulesInfo[0].abilitiesInfo[2].descriptionId).assertLarger(0.0);
        expect(data!.hapModulesInfo[0].abilitiesInfo[2].icon).assertEqual("$media:layered_image");
        expect(data!.hapModulesInfo[0].abilitiesInfo[2].iconId).assertLarger(0.0);
        expect(data!.hapModulesInfo[0].abilitiesInfo[2].process).assertEqual("");
        expect(data!.hapModulesInfo[0].abilitiesInfo[2].exported).assertTrue();
        expect(data!.hapModulesInfo[0].abilitiesInfo[2].excludeFromDock).assertFalse();
        expect(data!.hapModulesInfo[0].abilitiesInfo[2].orientation).assertEqual(2);
        expect(data!.hapModulesInfo[0].abilitiesInfo[2].orientationId).assertEqual(0.0);
        expect(data!.hapModulesInfo[0].abilitiesInfo[2].launchType).assertEqual(bundle.LaunchType.SPECIFIED);
        hilog.info(domain, tag, 'getBundleInfoForSelfApplicationPromise  ====> end');
      } catch (err: BusinessError) {
        console.log('getBundleInfoForSelfApplicationPromise  ====> err', JSON.stringify(err));
        expect(err).assertFail();
      }
      done();
    })  
  })
}