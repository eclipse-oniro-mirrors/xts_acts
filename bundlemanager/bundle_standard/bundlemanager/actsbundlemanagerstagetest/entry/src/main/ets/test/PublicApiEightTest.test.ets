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

import bundle from '@ohos.bundle';
import image from '@ohos.multimedia.image';
import util from "./Utils";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";

const BUNDLE_NAME = "ohos.acts.bundle.stage.test";
const BUNDLE_NAME1 = "com.example.myapplication1";
const ABILITY_NAME = "ohos.acts.bundle.stage.test.MainAbility";
const PATH = "/data/test/";
const BMSJSTEST1 = "bmsJstest1.hap";

export default function PublicApiEightTest() {
  describe('PublicApiEightTest', function () {

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_7980
     * @tc.name:  getBundleInfoTest
     * @tc.desc: Test getBundleInfo of API8 in version9 normal project
     */
    it('getBundleInfoTest', 0, async function (done) {
      await bundle.getBundleInfo(BUNDLE_NAME , bundle.BundleFlag.GET_BUNDLE_DEFAULT).then(data => {
        util.info("getBundleInfoTest" + JSON.stringify(data));
        expect(data.name).assertEqual("");
      }).catch(err => {
        util.info("getBundleInfoTest fail" + JSON.stringify(err));
        expect().assertFail();
      });
      bundle.getBundleInfo(BUNDLE_NAME ,bundle.BundleFlag.GET_BUNDLE_DEFAULT, (err, data) => {
        util.info("getBundleInfoTest" + JSON.stringify(data));
        util.info("getBundleInfoTest fail" + JSON.stringify(err));
        expect(data.name).assertEqual("");
        expect(err).assertEqual(0);
        done();
      })
    });

    /*
     * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_8340
     * @tc.name:  getAbilityInfoTest
     * @tc.desc: Test getAbilityInfo of API8 in version9 normal project
     */
    it('getAbilityInfoTest', 0, async function (done) {
      await bundle.getAbilityInfo(BUNDLE_NAME, ABILITY_NAME).then((data) => {
        util.info('getAbilityInfoTest promise data is: ' + JSON.stringify(data));
        expect(data.name).assertEqual("");
      }).catch((error) => {
        util.info('getAbilityInfoTest failed. Cause: ' + JSON.stringify(error));
        expect().assertFail();
      });
      bundle.getAbilityInfo(BUNDLE_NAME, ABILITY_NAME, (err, data) => {
        util.info('getAbilityInfoTest promise data is: ' + JSON.stringify(data));
        util.info('getAbilityInfoTest failed. Cause: ' + JSON.stringify(err));
        expect(data.name).assertEqual("");
        expect(err).assertEqual(0);
        done();
      })
    });

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_8000
     * @tc.name:  getApplicationInfoTest
     * @tc.desc: Test getApplicationInfo of API8 in version9 normal project
     */
    it('getApplicationInfoTest', 0, async function (done) {
      await bundle.getApplicationInfo(BUNDLE_NAME, bundle.BundleFlag.GET_BUNDLE_DEFAULT).then(data => {
        util.info("getApplicationInfoTest result" + JSON.stringify(data));
        expect(data.name).assertEqual("");
      }).catch(err => {
        util.info("getBundleInfoTest fail" + JSON.stringify(err));
        expect().assertFail();
      });
      bundle.getApplicationInfo(BUNDLE_NAME, bundle.BundleFlag.GET_BUNDLE_DEFAULT, (err, data) => {
        util.info("getApplicationInfoTest result" + JSON.stringify(data));
        util.info("getApplicationInfoTest fail" + JSON.stringify(err));
        expect(data.name).assertEqual("");
        expect(err.code).assertEqual(0);
        done();
      });

      /**
      * @tc.number Sub_Bms_Framework_Query_AbilityInfo_8360
      * @tc.name queryAbilityByWantTest
      * @tc.desc Test queryAbilityByWant of API8 in version9 normal project
      */
      it('queryAbilityByWantTest', 0, async function (done) {
        await bundle.queryAbilityByWant(
          {
            "bundleName": BUNDLE_NAME,
            "abilityName": ABILITY_NAME,
          }, bundle.BundleFlag.GET_BUNDLE_DEFAULT).then(data => {
          util.info("queryAbilityByWantTest success:" + JSON.stringify(data));
          expect(data.length).assertEqual(0);
        }).catch(err => {
          util.info("queryAbilityByWantTest err" + JSON.stringify(err));
          expect().assertFail();
        })
        bundle.queryAbilityByWant(
          {
            "bundleName": BUNDLE_NAME,
            "abilityName": ABILITY_NAME,
          }, bundle.BundleFlag.GET_BUNDLE_DEFAULT ,(err,data) => {
          util.info("queryAbilityByWantTest success:" + JSON.stringify(data));
          util.info("queryAbilityByWantTest err" + JSON.stringify(err));
          expect(data.length).assertEqual(0);
          expect(err).assertEqual(0);
          done();
        })
      })

      /**
      * @tc.number Sub_Bms_Framework_Query_AppInfo_8020
      * @tc.name getAllBundleInfoTest
      * @tc.desc Test getAllBundleInfo of API8 in version9 normal project
      */
      it('getAllBundleInfoTest', 0, async function (done) {
        await bundle.getAllBundleInfo(bundle.BundleFlag.GET_BUNDLE_DEFAULT).then(data => {
          util.info("getAllBundleInfoTest success:" + JSON.stringify(data));
          expect(data.length).assertEqual(0);
        }).catch(err => {
          util.info("getAllBundleInfoTest err" + JSON.stringify(err));
          expect().assertFail();
        })
        bundle.getAllBundleInfo(bundle.BundleFlag.GET_BUNDLE_DEFAULT,(err,data) => {
          util.info("getAllBundleInfoTest success:" + JSON.stringify(data));
          util.info("getAllBundleInfoTest err" + JSON.stringify(err));
          expect(data.length).assertEqual(0);
          expect(err).assertEqual(0);
          done();
        })
      })

      /**
      * @tc.number Sub_Bms_Framework_Query_AppInfo_8040
      * @tc.name getAllApplicationInfoTest
      * @tc.desc Test getAllApplicationInfo of API8 in version9 normal project
      */
      it('getAllApplicationInfoTest', 0, async function (done) {
        await bundle.getAllApplicationInfo(bundle.BundleFlag.GET_BUNDLE_DEFAULT).then(data => {
          util.info("getAllApplicationInfoTest success:" + JSON.stringify(data));
          expect(data.length).assertEqual(0);
        }).catch(err => {
          util.info("getAllApplicationInfoTest err" + JSON.stringify(err));
          expect().assertFail();
        })
        bundle.getAllApplicationInfo(bundle.BundleFlag.GET_BUNDLE_DEFAULT,(err,data) => {
          util.info("getAllApplicationInfoTest success:" + JSON.stringify(data));
          util.info("getAllApplicationInfoTest err" + JSON.stringify(err));
          expect(data.length).assertEqual(0);
          expect(err.code).assertEqual(0);
          done();
        })
      })

      /**
      * @tc.number Sub_Bms_Framework_Query_AppInfo_8060
      * @tc.name getNameForUidTest
      * @tc.desc Test getNameForUid of API8 in version9 normal project
      */
      it('getNameForUidTest', 0, async function (done) {
        let dataInfo = await bundle.getBundleInfo(BUNDLE_NAME, bundle.BundleFlag.GET_BUNDLE_DEFAULT);
        await bundle.getNameForUid(dataInfo.uid).then(data => {
          expect(data).assertFail();
        }).catch(err => {
          expect(err).assertEqual(1);
        });
        bundle.getNameForUid(dataInfo.uid, (err, data) => {
          util.info("getNameForUidTest result:" + JSON.stringify(data));
          expect(data).assertEqual(undefined);
          expect(err).assertEqual(1);
          done();
        });
      });

      /**
      * @tc.number Sub_Bms_Framework_Query_AppInfo_8080
      * @tc.name getBundleArchiveInfoTest
      * @tc.desc Test getBundleArchiveInfo of API8 in version9 normal project
      */
      it('getBundleArchiveInfoTest', 0, async function (done) {
        await bundle.getBundleArchiveInfo(PATH + BMSJSTEST1, bundle.BundleFlag.GET_BUNDLE_DEFAULT).then(data => {
          util.info("getBundleArchiveInfoTest success:" + JSON.stringify(data));
          expect(data.name).assertEqual("");
        }) .catch(err => {
          util.info("getBundleArchiveInfoTest err" + JSON.stringify(err));
          expect().assertFail();
        })
        bundle.getBundleArchiveInfo(PATH + BMSJSTEST1, bundle.BundleFlag.GET_BUNDLE_DEFAULT,(err,data) => {
          util.info("getBundleArchiveInfoTest success:" + JSON.stringify(data));
          util.info("getBundleArchiveInfoTest err" + JSON.stringify(err));
          expect(data.name).assertEqual("");
          expect(err.code).assertEqual(0);
          done();
        })
      })

      /**
      * @tc.number Sub_Bms_Framework_Query_AbilityInfo_8380
      * @tc.name getLaunchWantForBundleTest
      * @tc.desc Test getLaunchWantForBundle of API8 in version9 normal project
      */
      it('getLaunchWantForBundleTest', 0, async function (done) {
        await bundle.getLaunchWantForBundle(BUNDLE_NAME).then(data => {
          util.info("getLaunchWantForBundleTest success:" + JSON.stringify(data));
          expect().assertFail();
        }).catch(err => {
          util.info("getLaunchWantForBundleTest err" + JSON.stringify(err));
          expect(err.code).assertEqual(1);
        });
        bundle.getLaunchWantForBundle(BUNDLE_NAME, (err, data) => {
          util.info("getLaunchWantForBundleTest success:" + JSON.stringify(data));
          util.info("getLaunchWantForBundleTest err" + JSON.stringify(err));
          expect(err.code).assertEqual(1);
          expect(data).assertEqual(undefined);
          done();
        });
      });

      /**
      * @tc.number Sub_Bms_Framework_Query_Label_5300
      * @tc.name getAbilityLabelTest
      * @tc.desc Test getAbilityLabel of API8 in version9 normal project
      */
      it('getAbilityLabelTest', 0, async function (done) {
        await bundle.getAbilityLabel(BUNDLE_NAME, ABILITY_NAME).then((data) => {
          util.info("getAbilityLabelTest success:" + JSON.stringify(data));
          expect(data).assertFail();
        }).catch((error) => {
          util.info("getAbilityLabelTest err" + JSON.stringify(error));
          expect(error).assertEqual(1);
        });
        bundle.getAbilityLabel(BUNDLE_NAME, ABILITY_NAME, (error, data) => {
          util.info("getAbilityLabelTest success:" + JSON.stringify(data));
          util.info("getAbilityLabelTest err" + JSON.stringify(error));
          expect(error).assertEqual(1);
          done();
        });
      });

      /**
      * @tc.number Sub_Bms_Framework_Query_Icon_4100
      * @tc.name getAbilityIconTest
      * @tc.desc Test getAbilityIcon of API8 in version9 normal project
      */
      it('getAbilityIconTest', 0, async function (done) {
        await bundle.getAbilityIcon(BUNDLE_NAME, ABILITY_NAME).then(data => {
          util.info("getAbilityIconTest success:" + JSON.stringify(data));
          expect(data).assertFail();
        }).catch((error) => {
          util.info("getAbilityIconTest err" + JSON.stringify(error));
          expect(error).assertEqual(1);
        });
        bundle.getAbilityIcon(BUNDLE_NAME, ABILITY_NAME, (error, data) => {
          util.info("getAbilityIconTest success:" + JSON.stringify(data));
          util.info("getAbilityIconTest err" + JSON.stringify(error));
          expect(error).assertEqual(1);
          done();
        });
      });

      /**
      * @tc.number Sub_Bms_Framework_Status_AbilityEnable_7600
      * @tc.name isAbilityEnabledTest
      * @tc.desc Test isAbilityEnabled of API8 in version9 normal project
      */
      it('isAbilityEnabledTest', 0, async function (done) {
        let abilityInfo = generateAbilityInfoForTest(BUNDLE_NAME,ABILITY_NAME);
        await bundle.isAbilityEnabled(abilityInfo).then((data) => {
          expect(data).assertFalse();
        }).catch((error) => {
          expect(error).assertFail();
        });
        bundle.isAbilityEnabled(abilityInfo, (error, data) => {
          expect(error.code).assertEqual(0);
          expect(data).assertFalse();
          done();
        })
      })

      /**
      * @tc.number Sub_Bms_Framework_Status_AppEnable_4300
      * @tc.name isApplicationEnabledTest
      * @tc.desc Test isApplicationEnabled of API8 in version9 normal project
      */
      it('isApplicationEnabledTest', 0, async function (done) {
        await bundle.isApplicationEnabled(BUNDLE_NAME).then((data) => {
          expect(data).assertFalse();
        }).catch((error) => {
          expect(error).assertFail();
        });
        bundle.isApplicationEnabled(BUNDLE_NAME, (error, data) => {
          expect(error.code).assertEqual(0);
          expect(data).assertFalse();
          done();
        });
      });

      function generateAbilityInfoForTest(bundleName, name) {
        let map1 = new Map([
          ["", [{
                  "name": "", "value": "", "extra": ""
                }]]
        ]);
        let map2 = new Map([
          ["", [{
                  "name": "", "value": "", "resource": ""
                }]]
        ]);
        let resource = {
          "bundleName": "", "moduleName": "", "id": 0
        }
        let abilityInfo = {
          bundleName: bundleName,
          name: name,
          label: "",
          description: "",
          icon: "",
          labelId: 0,
          descriptionId: 0,
          iconId: 0,
          moduleName: "",
          process: "",
          targetAbility: "",
          backgroundModes: 0,
          isVisible: true,
          formEnabled: true,
          type: 0,
          subType: 0,
          orientation: 0,
          launchMode: 0,
          permissions: [], deviceTypes: [], deviceCapabilities: [], readPermission: "", writePermission: "",
          applicationInfo: {
            name: "", description: "", descriptionId: 0, systemApp: true, enabled: true, label: "",
            labelId: "", labelIndex: 0, icon: "", iconId: "", iconIndex: 0, process: "", supportedModes: 0, moduleSourceDirs: [],
            permissions: [], moduleInfos: [], entryDir: "", codePath: "", metaData: map1, metadata: map2,
            removable: true, accessTokenId: 0, uid: 0, entityType: "", fingerprint: "",
            iconResource: resource, labelResource: resource, descriptionResource: resource,
            appDistributionType :"" ,appProvisionType :""
          },
          uri: "", metaData: [], metadata: [], enabled: true, supportWindowMode: [],
          maxWindowRatio: 0, minWindowRatio: 0, maxWindowWidth: 0, minWindowWidth: 0, maxWindowHeight: 0, minWindowHeight: 0
        };
        return abilityInfo;
      }
    })
  })
}