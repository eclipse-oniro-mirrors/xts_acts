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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import deviceinfo from '@ohos.deviceInfo'
export default function SystemCapabilityTest() {
describe('SystemCapabilityTest', function () {

    console.info('SystemCapabilityTest start################################start');
    
    /**
     * @tc.name   testSysCaps01
     * @tc.number SUB_STARTUP_JS_SYSTEM_CAPABILITY_001
     * @tc.desc   Verify the availability of SystemCapability AccessToken.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSysCaps01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('testSysCaps01 start');
        try {
            var isAccessToken = canIUse("SystemCapability.Security.AccessToken");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            expect(isAccessToken == true).assertTrue();            
            done();
        } catch (e) {
            expect().assertFail();
            console.info("testSysCaps01 canIUse isAccessToken error: " + e);
            done();
        }
        console.info('testSysCaps01 end');
    })
    
    /**
     * @tc.name   device_info_test_004
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_0400
     * @tc.desc   Get the external product family name represented by a string and the return value is not null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('device_info_test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('testGetMarketName01 start')
        let marketNameInfo = deviceinfo.marketName;
        
        if (marketNameInfo != "" && marketNameInfo != null && marketNameInfo != undefined) {
            console.info('111 the value of the deviceinfo marketName is :' + marketNameInfo);
            expect(marketNameInfo).assertInstanceOf('String');
            done();
        } else {
            console.info('the return value marketName is null or incorrect.');
            expect().assertFail();
            done();
        }
        console.info('testGetMarketName01 ：end');
    })
})}
