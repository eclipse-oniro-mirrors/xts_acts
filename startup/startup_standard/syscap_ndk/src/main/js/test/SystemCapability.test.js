/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

export default function SystemCapabilityTest() {
describe('SystemCapabilityTest', function () {

    console.info('SystemCapabilityTest start################################start');
    
    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_CAPABILITY_001
     * @tc.name      testSysCaps01
     * @tc.desc      Verify the availability of SystemCapability AccessToken.
     */
    it('testSysCaps01', 0, async function (done) {
        console.info('testSysCaps01 start');
        let ret = false;
        try {
            var isAccessToken = canIUse("SystemCapability.Security.AccessToken");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (isAccessToken) {
                ret = true;
            }
            expect(isAccessToken).assertTrue();
            done();
        } catch (e) {
            expect(ret).assertTrue();
            console.info("testSysCaps01 canIUse isAccessToken error: " + e);
        }
        console.info('testSysCaps01 end');
    })
})}
