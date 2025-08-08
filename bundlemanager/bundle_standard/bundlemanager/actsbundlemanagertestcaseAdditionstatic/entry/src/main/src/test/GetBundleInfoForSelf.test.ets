import bundle from '@ohos.bundle.bundleManager';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import { BundleInfo } from 'bundleManager.BundleInfo';
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";

let domain: number = 0x0000;
let tag: string = 'testTag';
const BUNDLE_NAME = "ohos.acts.bundlemanagererrcode.test.static";
const VENDOR = "example";
const CERTIFICATE = "-----BEGIN CERTIFICATE-----"

export default function getBundleInfoForSelf() {
  describe('getBundleInfoForSelf', (): void => {

    /*
     * @tc.number: Sub_Bms_Framework_Query_BundleInfo_static_5560
     * @tc.name: getBundleInfoForSelfWithREQUESTED_PERMISSION
     * @tc.desc: Test getBundleInfoForSelf with GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION and GET_BUNDLE_INFO_WITH_SIGNATURE_INFO flag
     */
    it('getBundleInfoForSelfWithREQUESTED_PERMISSION', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO)
          .then((data : BundleInfo) => {
          hilog.info(domain, tag, 'getBundleInfoForSelfWithREQUESTED_PERMISSION  ====> start');
          expect(data.reqPermissionDetails.length).assertEqual(1.0);
          expect(data.reqPermissionDetails[0].name).assertEqual("ohos.permission.GET_BUNDLE_INFO_PRIVILEGED");
          expect(data.reqPermissionDetails[0].moduleName).assertEqual("entry");
          expect(data.reqPermissionDetails[0].reason).assertEqual("$string:module_desc");
          expect(data.reqPermissionDetails[0].reasonId).assertLarger(0.0);
          expect(data.reqPermissionDetails[0].usedScene.abilities.length).assertEqual(1.0);
          expect(data.reqPermissionDetails[0].usedScene.abilities[0]).assertEqual("MainAbility");
          expect(data.reqPermissionDetails[0].usedScene.when).assertEqual("always");

          expect(data.signatureInfo.appId).assertContain(BUNDLE_NAME);
          expect(data.signatureInfo.fingerprint).not().assertNull();
          expect(data.signatureInfo.certificate).assertContain(CERTIFICATE);
          expect(data.signatureInfo.appIdentifier).assertEqual("");

          hilog.info(domain, tag, 'getBundleInfoForSelfWithREQUESTED_PERMISSION  ====> end');
          done();
        }).catch(err => {
          hilog.info(domain, tag, 'getBundleInfoForSelfWithREQUESTED_PERMISSION  ====> err');
          expect(err).assertFail();
          done();
        })
      })


    /*
     * @tc.number: Sub_Bms_Framework_Query_BundleInfo_static_5570
     * @tc.name: getBundleInfoForSelfWithMETADATA
     * @tc.desc: Test getBundleInfoForSelf with GET_BUNDLE_INFO_WITH_HAP_MODULE and GET_BUNDLE_INFO_WITH_METADATA flag
     */
    it('getBundleInfoForSelfWithMETADATA', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA)
          .then((data : BundleInfo) => {
          hilog.info(domain, tag, 'getBundleInfoForSelfWithMETADATA  ====> start');
          expect(data.hapModulesInfo[0].metadata.length).assertEqual(1);
          expect(data.hapModulesInfo[0].metadata[0].name).assertEqual("MetaData1");
          expect(data.hapModulesInfo[0].metadata[0].value).assertEqual("MetaDataValue");
          expect(data.hapModulesInfo[0].metadata[0].valueId).assertEqual(0);
          expect(data.hapModulesInfo[0].metadata[0].resource).assertEqual("$profile:backup_config");
          hilog.info(domain, tag, 'getBundleInfoForSelfWithMETADATA  ====> end');
          done();
        }).catch(err => {
          hilog.info(domain, tag, 'getBundleInfoForSelfWithMETADATA  ====> err');
          expect(err).assertFail();
          done();
        })
      })


    /*
     * @tc.number: Sub_Bms_Framework_Query_BundleInfo_static_5580
     * @tc.name: getBundleInfoForSelfWithMETADATAandAPPLICATION
     * @tc.desc: Test getBundleInfoForSelf with GET_BUNDLE_INFO_WITH_APPLICATION and GET_BUNDLE_INFO_WITH_METADATA flag
     */
    it('getBundleInfoForSelfWithMETADATAandAPPLICATION', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA)
          .then((data : BundleInfo) => {
            hilog.info(domain, tag, 'getBundleInfoForSelfWithMETADATAandAPPLICATION  ====> start');
            let metadataArray = data.appInfo.metadataArray;
            expect(metadataArray.length).assertEqual(1.0);
            let moduleMetadata = metadataArray[0];
            expect(moduleMetadata.moduleName).assertEqual("entry");
            expect(moduleMetadata.metadata.length).assertLarger(0.0);
            hilog.info(domain, tag, 'getBundleInfoForSelfWithMETADATAandAPPLICATION  ====> end');
            done();
          }).catch(err => {
            hilog.info(domain, tag, 'getBundleInfoForSelfWithMETADATAandAPPLICATION  ====> err');
            expect(err).assertFail();
            done();
          })
      })


    /*
     * @tc.number: Sub_Bms_Framework_Query_BundleInfo_static_5590
     * @tc.name: getBundleInfoForSelfWithROUTERMAP
     * @tc.desc: Test getBundleInfoForSelf with GET_BUNDLE_INFO_WITH_HAP_MODULE and GET_BUNDLE_INFO_WITH_ROUTER_MAP flag
     */
    it('getBundleInfoForSelfWithROUTERMAP', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_ROUTER_MAP).then((data : BundleInfo) => {
          hilog.info(domain, tag, 'getBundleInfoForSelfWithROUTERMAP  ====> start');
          expect(data.appInfo).assertEqual(null);
          expect(data.hapModulesInfo[0].type + '').assertEqual('1');
          expect(data.hapModulesInfo[0].routerMap.length).assertLarger(0.0);
          expect(data.hapModulesInfo[0].routerMap[0].name).assertEqual("DynamicPage1");
          expect(data.hapModulesInfo[0].routerMap[0].pageSourceFile).assertEqual("src/main/ets");
          expect(data.hapModulesInfo[0].routerMap[0].buildFunction).assertEqual("MyStateSample");
          expect(data.hapModulesInfo[0].routerMap[0].data[0].key).assertEqual("key1");
          expect(data.hapModulesInfo[0].routerMap[0].data[0].value).assertEqual("data1");
          expect(data.hapModulesInfo[0].routerMap[0].customData.length).assertEqual(128);
          hilog.info(domain, tag, 'getBundleInfoForSelfWithROUTERMAP  ====> end');
          done();
        }).catch(err => {
          hilog.info(domain, tag, 'getBundleInfoForSelfHapModuleInfoPromise  ====> err');
          expect(err).assertFail();
          done();
        })
      })

    /*
     * @tc.number: Sub_Bms_Framework_Query_BundleInfo_5600
     * @tc.name: getBundleInfoForSelfWithSKILL
     * @tc.desc: Test getBundleInfoForSelf with GET_BUNDLE_INFO_WITH_HAP_MODULE, GET_BUNDLE_INFO_WITH_ABILITY
     *            and GET_BUNDLE_INFO_WITH_SKILL flag
     */
    it('getBundleInfoForSelfWithSKILL', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL
          | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE
          | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY).then((data : BundleInfo) => {
          hilog.info(domain, tag, 'getBundleInfoForSelfWithSKILL  ====> start');
          let skill: bundle.Skill = data.hapModulesInfo[0].abilitiesInfo[0].skills[0];
          let skillUrl: bundle.SkillUrl = skill.uris[0];
          expect(data.hapModulesInfo[0].abilitiesInfo[0].skills.length).assertEqual(1);
          expect(skill.actions[0])
            .assertEqual('action.system.home');
          expect(skill.entities[0])
            .assertEqual('entity.system.home');
          expect(skill.domainVerify).assertEqual(false);
          expect(skillUrl.scheme).assertEqual('scheme');
          expect(skillUrl.host).assertEqual('host');
          expect(skillUrl.port + '').assertEqual('2');
          expect(skillUrl.pathStartWith).assertEqual('pathStartWith');
          expect(skillUrl.path).assertEqual('path');
          expect(skillUrl.pathRegex).assertEqual('pathRegex');
          expect(skillUrl.type).assertEqual('type');
          expect(skillUrl.utd).assertEqual('utd');
          expect(skillUrl.linkFeature).assertEqual('linkFeature');
          expect(skillUrl.maxFileSupported).assertEqual(10000);
          hilog.info(domain, tag, 'getBundleInfoForSelfWithSKILL  ====> end');
          done();
        }).catch(err => {
          hilog.info(domain, tag, 'getBundleInfoForSelfWithSKILL  ====> err');
          expect(err).assertFail();
          done();
        })
      })
  })
}

