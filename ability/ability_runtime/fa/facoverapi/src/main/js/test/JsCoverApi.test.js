/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import appManager from '@ohos.application.appManager';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium";

export default function CoverApiTest() {
describe('CoverApiTest', function () {

    /*
     * @tc.number  SUB_AA_OpenHarmony_CoverApi_0500
     * @tc.name    whether the system is under stability test
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_AA_OpenHarmony_CoverApi_0500', 0, async function (done) {
        console.log("------------start SUB_AA_OpenHarmony_CoverApi_0500-------------");
        appManager.isRunningInStabilityTest()
            .then((data) => {
                console.info('SUB_AA_OpenHarmony_CoverApi_0500 successful. data: ' + JSON.stringify(data));
                expect(data == false).assertTrue();
                done();
            }).catch((error) => {
            console.error('SUB_AA_OpenHarmony_CoverApi_0500 failed. error: ' + JSON.stringify(error));
            expect().assertFalse();
            done();
        })
    });
})}
