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
import bundle from '@ohos.bundle.bundleManager';
import defaultAppMgr from '@ohos.bundle.defaultAppManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium";

const BUNDLE_NAME = "ohos.acts.bundle.stage.test";
const MODULE_NAME = "testModule";
const METADATA_NAME = "metadata.ability.test";
const METADATA_NAME1 = "ohos.extension.form1";
const ABILITY_NAME = "ohos.acts.bundle.stage.test.MainAbility";
const ABILITY_NAME1 = "Form";
const PROFILE_JSON_STRING = "{\"src\":[\"MainAbility/pages/index/index\",\"MainAbility/pages/second/second\"]}";
const PROFILE_JSON_STRING1 = "{\"forms\":[{\"colorMode\":\"auto\",\"defaultDimension\":\"2*2\",\"description\":" +
  "\"This is a service widget.\",\"isDefault\":true,\"isDynamic\":true,\"name\":\"widget\",\"scheduledUpdateTime\":" +
  "\"10:30\",\"src\":\"./ets/widget/pages/WidgetCard.ets\",\"supportDimensions\":[\"1*2\",\"2*2\",\"2*4\",\"4*4\"]," +
  "\"uiSyntax\":\"arkts\",\"updateDuration\":1,\"updateEnabled\":true,\"window\":{\"autoDesignWidth\":true,\"designWidth\":720}}]}";

export default function PublicApiNineTest() {
  describe('PublicApiNineTest',() => {

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_7960
     * @tc.name: getBundleInfoForSelfProTest
     * @tc.desc: Test getBundleInfoForSelf of API9 in version9 normal project
     */
    it('getBundleInfoForSelfProTest', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) =>  {
      await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).then(data => {
        console.info("getBundleInfoForSelfPro" + JSON.stringify(data));
        expect(data.name).assertEqual(BUNDLE_NAME);
      }).catch((err: BusinessError) => {
        console.info("getBundleInfoForSelf fail" + JSON.stringify(err));
        expect(err).assertFail();
      })
      bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT, (err, data) => {
        expect(data.name).assertEqual(BUNDLE_NAME);
        expect(err).assertEqual(null);
        done();
      })
    });

    /*
     * @tc.number: Sub_Bms_Framework_Query_Profile_7900
     * @tc.name: getProfileByAbilityTest
     * @tc.desc: Test getProfileByAbility of API9 in version9 normal project
     */
    it('getProfileByAbilityTest', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) =>  {
      await bundle.getProfileByAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME).then(data => {
        console.info('getProfileByAbility promise data is: ' + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(data.length).assertEqual(1);
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
      }).catch((err: BusinessError) => {
        console.info('getProfileByAbility failed. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      })
      bundle.getProfileByAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME, (err, data) => {
        console.info('getProfileByAbility failed. Cause: ' + JSON.stringify(err));
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        done();
      })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_Profile_8000
    * @tc.name: getProfileByExtensionAbilityTest
    * @tc.desc: Test getProfileByExtensionAbility of API9 in version9 normal project
    */
    it('getProfileByExtensionAbilityPromise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) =>  {
      await bundle.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME1, METADATA_NAME1).then(data => {
        console.info('getProfileByExtensionAbility promise data is: ' + JSON.stringify(data));
        expect(data[0]).assertEqual(PROFILE_JSON_STRING1);
      }).catch((err: BusinessError) => {
        console.info('getProfileByExtensionAbility failed. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      })
      bundle.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME1, METADATA_NAME1, (err, data) => {
        console.info('getProfileByExtensionAbility failed. Cause: ' + JSON.stringify(err));
        expect(data[0]).assertEqual(PROFILE_JSON_STRING1);
        done();
      })
    });

    /**
    * @tc.number: Sub_Bms_Framework_Status_DefaultApp_8250
    * @tc.name: isDefaultApplicationTest
    * @tc.desc: Test isDefaultApplication of API9 in version9 normal project
    */
    it('isDefaultApplication_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) =>  {
      await defaultAppMgr.isDefaultApplication(defaultAppMgr.ApplicationType.IMAGE).then(data => {
        expect(data).assertFalse()
      }).catch((err: BusinessError) => {
        expect().assertFail();
      })
      defaultAppMgr.isDefaultApplication(defaultAppMgr.ApplicationType.IMAGE, (err, data) => {
        console.info("isDefaultApplication_0100 data--- " + data)
        console.info("isDefaultApplication_0100 err--- " + err)
        expect(data).assertFalse()
        expect(err).assertEqual(null)
        done()
      })
    });

  })
}