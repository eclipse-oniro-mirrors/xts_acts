/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file expect in compliance with the License.
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
import bundleMgr from '@ohos.bundle.bundleManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level  } from '@ohos/hypium';

const BUNDLENAME = "com.open.harmony.packagemag";
const ABILITYNAME = "com.open.harmony.packagemag.MainAbility";

export default function getLaunchWant() {
    describe('GetLaunchWant', function () {

        /*
        * @tc.number: testGetLaunchWant_0100
        * @tc.name: testGetLaunchWant.
        * @tc.desc: Test getLaunchWant interface to get own launch want.
        * @tc.size MediumTest
        * @tc.type Function
        * @tc.level Level 1
        */
        it('testGetLaunchWant', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
            let want = bundleMgr.getLaunchWant();
            expect(want.abilityName).assertEqual(ABILITYNAME);
            expect(want.bundleName).assertEqual(BUNDLENAME);
            done();
        });

        /*
        * @tc.number: testGetLaunchWant_0200
        * @tc.name: testRepeatGetLaunchWant.
        * @tc.desc: Test repeated call getLaunchWant interface to get own launch want.
        * @tc.size MediumTest
        * @tc.type Function
        * @tc.level Level 1
        */
        it('testRepeatGetLaunchWant', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
            let want = bundleMgr.getLaunchWant();
            expect(want.abilityName).assertEqual(ABILITYNAME);
            expect(want.bundleName).assertEqual(BUNDLENAME);
            let wantRepeat = bundleMgr.getLaunchWant();
            expect(want.abilityName).assertEqual(ABILITYNAME);
            expect(want.bundleName).assertEqual(BUNDLENAME);
            done();
        });

    });
}
