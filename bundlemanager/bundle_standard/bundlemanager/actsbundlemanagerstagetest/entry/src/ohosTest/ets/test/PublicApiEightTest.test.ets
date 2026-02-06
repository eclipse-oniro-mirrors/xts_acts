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
import { BusinessError } from '@kit.BasicServicesKit';
import bundle from '@ohos.bundle';
import image from '@ohos.multimedia.image';
import bundleManager from '@ohos.bundle.bundleManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium";

const BUNDLE_NAME = "ohos.acts.bundle.stage.test";
const BUNDLE_NAME1 = "com.example.myapplication1";
const ABILITY_NAME = "ohos.acts.bundle.stage.test.MainAbility";
const PATH = "/data/test/";
const BMSJSTEST1 = "bmsJstest1.hap";

export default function PublicApiEightTest() {
  describe('PublicApiEightTest', () =>  {

    /**
     * @tc.name   getBundleInfoTest
     * @tc.number Sub_Bms_Framework_Query_AppInfo_7980
     * @tc.desc   Test getBundleInfo of API8 in version9 normal project
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getBundleInfoTest', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) =>  {
      await bundle.getBundleInfo(BUNDLE_NAME , bundle.BundleFlag.GET_BUNDLE_DEFAULT).then(data => {
        console.info("getBundleInfoTest" + JSON.stringify(data));
        expect(data.name).assertEqual("");
      }).catch((err: BusinessError) => {
        console.info("getBundleInfoTest fail" + JSON.stringify(err));
        expect().assertFail();
      });
      bundle.getBundleInfo(BUNDLE_NAME ,bundle.BundleFlag.GET_BUNDLE_DEFAULT, (err, data) => {
        console.info("getBundleInfoTest" + JSON.stringify(data));
        console.info("getBundleInfoTest fail" + JSON.stringify(err));
        expect(data.name).assertEqual("");
        expect(err).assertEqual(0);
        done();
      })
    });

    /**
     * @tc.name   getAbilityInfoTest
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_8340
     * @tc.desc   Test getAbilityInfo of API8 in version9 normal project
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAbilityInfoTest', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) =>  {
      await bundle.getAbilityInfo(BUNDLE_NAME, ABILITY_NAME).then((data) => {
        console.info('getAbilityInfoTest promise data is: ' + JSON.stringify(data));
        expect(data.name).assertEqual("");
      }).catch((err: BusinessError) => {
        console.info('getAbilityInfoTest failed. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      bundle.getAbilityInfo(BUNDLE_NAME, ABILITY_NAME, (err, data) => {
        console.info('getAbilityInfoTest promise data is: ' + JSON.stringify(data));
        console.info('getAbilityInfoTest failed. Cause: ' + JSON.stringify(err));
        expect(data.name).assertEqual("");
        expect(err).assertEqual(0);
        done();
      })
    });

    /**
     * @tc.name   getApplicationInfoTest
     * @tc.number Sub_Bms_Framework_Query_AppInfo_8000
     * @tc.desc   Test getApplicationInfo of API8 in version9 normal project
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getApplicationInfoTest', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) =>  {
      await bundle.getApplicationInfo(BUNDLE_NAME, bundle.BundleFlag.GET_BUNDLE_DEFAULT).then(data => {
        console.info("getApplicationInfoTest result" + JSON.stringify(data));
        expect(data.name).assertEqual("");
      }).catch((err: BusinessError) => {
        console.info("getBundleInfoTest fail" + JSON.stringify(err));
        expect().assertFail();
      });
      bundle.getApplicationInfo(BUNDLE_NAME, bundle.BundleFlag.GET_BUNDLE_DEFAULT, (err, data) => {
        console.info("getApplicationInfoTest result" + JSON.stringify(data));
        console.info("getApplicationInfoTest fail" + JSON.stringify(err));
        expect(data.name).assertEqual("");
        expect(err.code).assertEqual(0);
        done();
      });

      /**
       * @tc.name   queryAbilityByWantTest
       * @tc.number Sub_Bms_Framework_Query_AbilityInfo_8360
       * @tc.desc   Test queryAbilityByWant of API8 in version9 normal project
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('queryAbilityByWantTest', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) =>  {
        await bundle.queryAbilityByWant(
          {
            "bundleName": BUNDLE_NAME,
            "abilityName": ABILITY_NAME,
          }, bundle.BundleFlag.GET_BUNDLE_DEFAULT).then(data => {
          console.info("queryAbilityByWantTest success:" + JSON.stringify(data));
          expect(data.length).assertEqual(0);
        }).catch((err: BusinessError) => {
          console.info("queryAbilityByWantTest err" + JSON.stringify(err));
          expect().assertFail();
        })
        bundle.queryAbilityByWant(
          {
            "bundleName": BUNDLE_NAME,
            "abilityName": ABILITY_NAME,
          }, bundle.BundleFlag.GET_BUNDLE_DEFAULT ,(err,data) => {
          console.info("queryAbilityByWantTest success:" + JSON.stringify(data));
          console.info("queryAbilityByWantTest err" + JSON.stringify(err));
          expect(data.length).assertEqual(0);
          expect(err).assertEqual(0);
          done();
        })
      })

      /**
       * @tc.name   getAllBundleInfoTest
       * @tc.number Sub_Bms_Framework_Query_AppInfo_8020
       * @tc.desc   Test getAllBundleInfo of API8 in version9 normal project
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('getAllBundleInfoTest', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
        await bundle.getAllBundleInfo(bundle.BundleFlag.GET_BUNDLE_DEFAULT).then(data => {
          console.info("getAllBundleInfoTest success:" + JSON.stringify(data));
          expect(data.length).assertEqual(0);
        }).catch((err: BusinessError) => {
          console.info("getAllBundleInfoTest err" + JSON.stringify(err));
          expect().assertFail();
        })
        bundle.getAllBundleInfo(bundle.BundleFlag.GET_BUNDLE_DEFAULT,(err,data) => {
          console.info("getAllBundleInfoTest success:" + JSON.stringify(data));
          console.info("getAllBundleInfoTest err" + JSON.stringify(err));
          expect(data.length).assertEqual(0);
          expect(err).assertEqual(0);
          done();
        })
      })

      /**
       * @tc.name   getAllApplicationInfoTest
       * @tc.number Sub_Bms_Framework_Query_AppInfo_8040
       * @tc.desc   Test getAllApplicationInfo of API8 in version9 normal project
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('getAllApplicationInfoTest', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
        await bundle.getAllApplicationInfo(bundle.BundleFlag.GET_BUNDLE_DEFAULT).then(data => {
          console.info("getAllApplicationInfoTest success:" + JSON.stringify(data));
          expect(data.length).assertEqual(0);
        }).catch((err: BusinessError) => {
          console.info("getAllApplicationInfoTest err" + JSON.stringify(err));
          expect().assertFail();
        })
        bundle.getAllApplicationInfo(bundle.BundleFlag.GET_BUNDLE_DEFAULT,(err,data) => {
          console.info("getAllApplicationInfoTest success:" + JSON.stringify(data));
          console.info("getAllApplicationInfoTest err" + JSON.stringify(err));
          expect(data.length).assertEqual(0);
          expect(err.code).assertEqual(0);
          done();
        })
      })

      /**
       * @tc.name   getNameForUidTest
       * @tc.number Sub_Bms_Framework_Query_AppInfo_8060
       * @tc.desc   Test getNameForUid of API8 in version9 normal project
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('getNameForUidTest', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
        let dataInfo = await bundle.getBundleInfo(BUNDLE_NAME, bundle.BundleFlag.GET_BUNDLE_DEFAULT);
        await bundle.getNameForUid(dataInfo.uid).then(data => {
          expect(data).assertFail();
        }).catch((err: BusinessError) => {
          expect(err).assertEqual(1);
        });
        bundle.getNameForUid(dataInfo.uid, (err, data) => {
          console.info("getNameForUidTest result:" + JSON.stringify(data));
          expect(data).assertEqual(undefined);
          expect(err).assertEqual(1);
          done();
        });
      });

      /**
       * @tc.name   getBundleArchiveInfoTest
       * @tc.number Sub_Bms_Framework_Query_AppInfo_8080
       * @tc.desc   Test getBundleArchiveInfo of API8 in version9 normal project
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('getBundleArchiveInfoTest', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
        await bundle.getBundleArchiveInfo(PATH + BMSJSTEST1, bundle.BundleFlag.GET_BUNDLE_DEFAULT).then(data => {
          console.info("getBundleArchiveInfoTest success:" + JSON.stringify(data));
          expect(data.name).assertEqual("");
        }) .catch((err: BusinessError) => {
          console.info("getBundleArchiveInfoTest err" + JSON.stringify(err));
          expect().assertFail();
        })
        bundle.getBundleArchiveInfo(PATH + BMSJSTEST1, bundle.BundleFlag.GET_BUNDLE_DEFAULT,(err,data) => {
          console.info("getBundleArchiveInfoTest success:" + JSON.stringify(data));
          console.info("getBundleArchiveInfoTest err" + JSON.stringify(err));
          expect(data.name).assertEqual("");
          expect(err.code).assertEqual(0);
          done();
        })
      })

      /**
       * @tc.name   getLaunchWantForBundleTest
       * @tc.number Sub_Bms_Framework_Query_AbilityInfo_8380
       * @tc.desc   Test getLaunchWantForBundle of API8 in version9 normal project
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('getLaunchWantForBundleTest', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
        await bundle.getLaunchWantForBundle(BUNDLE_NAME).then(data => {
          console.info("getLaunchWantForBundleTest success:" + JSON.stringify(data));
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.info("getLaunchWantForBundleTest err" + JSON.stringify(err));
          expect(err.code).assertEqual(1);
        });
        bundle.getLaunchWantForBundle(BUNDLE_NAME, (err, data) => {
          console.info("getLaunchWantForBundleTest success:" + JSON.stringify(data));
          console.info("getLaunchWantForBundleTest err" + JSON.stringify(err));
          expect(err.code).assertEqual(1);
          expect(data).assertEqual(undefined);
          done();
        });
      });

      /**
       * @tc.name   getAbilityLabelTest
       * @tc.number Sub_Bms_Framework_Query_Label_5300
       * @tc.desc   Test getAbilityLabel of API8 in version9 normal project
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('getAbilityLabelTest', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
        await bundle.getAbilityLabel(BUNDLE_NAME, ABILITY_NAME).then((data) => {
          console.info("getAbilityLabelTest success:" + JSON.stringify(data));
          expect(data).assertFail();
        }).catch((err: BusinessError) => {
          console.info("getAbilityLabelTest err" + JSON.stringify(err));
          expect(err).assertEqual(1);
        });
        bundle.getAbilityLabel(BUNDLE_NAME, ABILITY_NAME, (error, data) => {
          console.info("getAbilityLabelTest success:" + JSON.stringify(data));
          console.info("getAbilityLabelTest err" + JSON.stringify(error));
          expect(error).assertEqual(1);
          done();
        });
      });

      /**
       * @tc.name   getAbilityIconTest
       * @tc.number Sub_Bms_Framework_Query_Icon_4100
       * @tc.desc   Test getAbilityIcon of API8 in version9 normal project
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('getAbilityIconTest', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
        await bundle.getAbilityIcon(BUNDLE_NAME, ABILITY_NAME).then(data => {
          console.info("getAbilityIconTest success:" + JSON.stringify(data));
          expect(data).assertFail();
        }).catch((error: BusinessError) => {
          console.info("getAbilityIconTest err" + JSON.stringify(error));
          expect(error).assertEqual(1);
        });
        bundle.getAbilityIcon(BUNDLE_NAME, ABILITY_NAME, (error, data) => {
          console.info("getAbilityIconTest success:" + JSON.stringify(data));
          console.info("getAbilityIconTest err" + JSON.stringify(error));
          expect(error).assertEqual(1);
          done();
        });
      });


      /**
       * @tc.name   isApplicationEnabledTest
       * @tc.number Sub_Bms_Framework_Status_AppEnable_4300
       * @tc.desc   Test isApplicationEnabled of API8 in version9 normal project
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('isApplicationEnabledTest', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
        await bundle.isApplicationEnabled(BUNDLE_NAME).then((data) => {
          expect(data).assertFalse();
        }).catch((error: BusinessError) => {
          expect(error).assertFail();
        });
        bundle.isApplicationEnabled(BUNDLE_NAME, (error, data) => {
          expect(error.code).assertEqual(0);
          expect(data).assertFalse();
          done();
        });
      });




    /**
     * @tc.name   Sub_Bms_Framework_Query_bundleInfo_9110
     * @tc.number Sub_Bms_Framework_Query_bundleInfo_9110
     * @tc.desc   Sub_Bms_Framework_Query_bundleInfo_9110
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Bms_Framework_Query_bundleInfo_9110', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      try {
        bundle.getAllBundleInfo(bundle.BundleFlag.GET_BUNDLE_DEFAULT,100,(err,data) => {
          console.info("Sub_Bms_Framework_Query_bundleInfo_9110 success:" + JSON.stringify(data));
          console.info("Sub_Bms_Framework_Query_bundleInfo_9110 err" + JSON.stringify(err));
          expect(data.length).assertEqual(0);
          expect(err).assertEqual(0);
        })

      } catch (err) {
        console.info("Sub_Bms_Framework_Query_bundleInfo_9110 catch" + JSON.stringify(err));
        expect().assertFail();
      }
      done();

    })



    /**
     * @tc.name   Sub_Bms_Framework_Query_applicationInfo_9110
     * @tc.number Sub_Bms_Framework_Query_applicationInfo_9110
     * @tc.desc   Sub_Bms_Framework_Query_applicationInfo_9110
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Bms_Framework_Query_applicationInfo_9110', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      try {
        bundle.getAllApplicationInfo(bundle.BundleFlag.GET_BUNDLE_DEFAULT,100, (err,data) => {
          console.info("Sub_Bms_Framework_Query_applicationInfo_9110 success:" + JSON.stringify(data));
          console.info("Sub_Bms_Framework_Query_applicationInfo_9110 err" + JSON.stringify(err));
          expect(data.length).assertEqual(0);
          expect(err.code).assertEqual(0);
        })
      } catch (err) {
        console.info("Sub_Bms_Framework_Query_applicationInfo_9110 catch" + JSON.stringify(err));
        expect().assertFail();
      }
      done();

    })




    })
  })
}
