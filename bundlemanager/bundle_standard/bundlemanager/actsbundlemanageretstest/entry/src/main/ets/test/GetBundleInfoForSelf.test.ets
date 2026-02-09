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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level  } from "@ohos/hypium"

export default function getBundleInfoForSelf() {
  describe('getBundleInfoForSelf', function () {

    /**
     * @tc.name   getBundleInfoForSelfAbilityPro
     * @tc.number Sub_Bms_Framework_Query_AppInfo_5680
     * @tc.desc   Test getBundleInfoForSelf with ability flag(by promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getBundleInfoForSelfAbilityPro', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await bundle.getBundleInfoForSelf(
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY
      ).then(data => {
        console.info("AbilityPro" + JSON.stringify(data.hapModulesInfo[0].abilitiesInfo[0]));
        expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(5);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].type).assertEqual(bundle.AbilityType.DATA);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].orientation).assertEqual(bundle.DisplayOrientation.UNSPECIFIED);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].readPermission).assertEqual("");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].writePermission).assertEqual("");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].uri).assertEqual("dataability://com.open.harmony.packagemag.DataAbility");
        expect(data.hapModulesInfo[0].abilitiesInfo[1].type).assertEqual(bundle.AbilityType.PAGE);
        expect(data.hapModulesInfo[0].abilitiesInfo[1].orientation).assertEqual(bundle.DisplayOrientation.FOLLOW_RECENT);
        expect(data.hapModulesInfo[0].abilitiesInfo[2].type).assertEqual(bundle.AbilityType.PAGE);
        expect(data.hapModulesInfo[0].abilitiesInfo[2].orientation).assertEqual(bundle.DisplayOrientation.UNSPECIFIED);
        expect(data.hapModulesInfo[0].abilitiesInfo[3].type).assertEqual(bundle.AbilityType.SERVICE);
        expect(data.hapModulesInfo[0].abilitiesInfo[3].orientation).assertEqual(bundle.DisplayOrientation.UNSPECIFIED);
        expect(data.hapModulesInfo[0].abilitiesInfo[4].type).assertEqual(bundle.AbilityType.PAGE);
        expect(data.hapModulesInfo[0].abilitiesInfo[4].orientation).assertEqual(bundle.DisplayOrientation.UNSPECIFIED);
        expect(data.hapModulesInfo[0].codePath).assertEqual("/data/storage/el1/bundle/entry.hap");
        console.info("AbilityPro11" + JSON.stringify(data.hapModulesInfo[0].abilitiesInfo[0]));
        done();
      }).catch(err => {
        console.info("getBundleInfoForSelf fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
    })


  })
}