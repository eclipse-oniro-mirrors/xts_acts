/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import pkg from '@system.package'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

const NUM_TWO = 2;
const ERR_CODE = 202;
const ERR_MERSSAGE = 'value is not an available number';

export default function ActsBmsHasInstalldTest() {
describe('ActsBmsHasInstalldTest', function () {

    /*
     * @tc.number Sub_Bms_Framework_Status_Query_0100
     * @tc.name testHasInstalled
     * @tc.desc Test hasInstalled interface.
     */
    it('testHasInstalled', 0, async function (done) {
        let flag = 0;
        pkg.hasInstalled({
            bundleName: 'com.example.third2',
            success: function success(data) {
                console.info('hasInstalled success function in');
                flag += 1;
                expect(data.result).assertTrue();
            },
            fail: function fail(data, code) {
                console.info('hasInstalled fail function in');
                expect().assertFail();
            },
            complete: function complete() {
                console.info('hasInstalled complete function in');
                expect(flag).assertEqual(1);
                done();
            }
        });
    });

    /*
     * @tc.number Sub_Bms_Framework_Status_Query_0200
     * @tc.name testHasInstalledNoSuccess
     * @tc.desc Test hasInstalled interface without success function.
     */
    it('testHasInstalledNoSuccess', 0, async function (done) {
        pkg.hasInstalled({
            bundleName: 'com.example.third2',
            fail: function fail(data, code) {
                console.info('hasInstalled fail function in');
                expect().assertFail();
            },
            complete: function complete() {
                console.info('hasInstalled complete function in');
                done();
            }
        });
    });

    /*
     * @tc.number Sub_Bms_Framework_Status_Query_0300
     * @tc.name testHasInstalledNoFailComplete
     * @tc.desc Test hasInstalled without fail function and complete function.
     */
    it('testHasInstalledNoFailComplete', 0, async function (done) {
        pkg.hasInstalled({
            bundleName: 'com.example.third2',
            success: function success(data) {
                console.info('hasInstalled success function in');
                expect(data.result).assertTrue();
                done();
            }
        });
    });

    /*
     * @tc.number Sub_Bms_Framework_Status_Query_0400
     * @tc.name hasInstalledHapNotExist
     * @tc.desc Test hasInstalled when hap not exist.
     */
    it('hasInstalledHapNotExist', 0, async function (done) {
        let flag = 0;
        pkg.hasInstalled({
            bundleName: 'wrongName',
            success: function success(data) {
                console.info('hasInstalled success function in' + JSON.stringify(data));
                flag += 1;
                expect(data.result).assertFalse();
            },
            fail: function fail(data, code) {
                console.info('hasInstalled fail function in');
                expect().assertFail();
            },
            complete: function complete() {
                console.info('hasInstalled complete function in');
                expect(flag).assertEqual(1);
                done();
            }
        });
    });

    /*
     * @tc.number Sub_Bms_Framework_Status_Query_0700
     * @tc.name testHasInstalledNumberParam
     * @tc.desc Test hasInstalled when bundleName is number.
     */
    it('testHasInstalledNumberParam', 0, async function (done) {
        let flag = 0;
        pkg.hasInstalled({
            bundleName: NUM_TWO,
            success: function success(data) {
                console.info('hasInstalled success function in');
                expect().assertFail();
            },
            fail: function fail(data, code) {
                flag += 2;
                console.info('hasInstalled fail function in');
                expect(data).assertEqual(ERR_MERSSAGE);
                expect(code).assertEqual(ERR_CODE);
            },
            complete: function complete() {
                console.info('hasInstalled complete function in');
                expect(flag).assertEqual(2)
                done();
            }
        });
    });

    /*
     * @tc.number Sub_Bms_Framework_Status_Query_0800
     * @tc.name testHasInstalledFailNotExist
     * @tc.desc Test hasInstalled without function fail.
     */
    it('testHasInstalledFailNotExist', 0, async function (done) {
        pkg.hasInstalled({
            bundleName: NUM_TWO,
            success: function success(data) {
                console.info('hasInstalled success function in');
                expect().assertFail();
            },
            complete: function complete() {
                console.info('hasInstalled complete function in');
                done();
            }
        });
    });

    /*
     * @tc.number Sub_Bms_Framework_Status_Query_0900
     * @tc.name testHasInstalledCompleteNotExit
     * @tc.desc Test hasInstalled without function complete.
     */
    it('testHasInstalledCompleteNotExit', 0, async function (done) {
        pkg.hasInstalled({
            bundleName: undefined,
            success: function success(data) {
                console.info('hasInstalled success function in');
                expect().assertFail();
                done();
            },
            fail: function fail(data, code) {
                console.info('hasInstalled fail function in');
                expect(data).assertEqual(ERR_MERSSAGE);
                expect(code).assertEqual(ERR_CODE);
                done();
            }
        });
    });

    /*
     * @tc.number Sub_Bms_Framework_Status_Query_1000
     * @tc.name testHasInstalledReturnNotExist
     * @tc.desc Test hasInstalled without function fail and function complete.
     */
    it('testHasInstalledReturnNotExist', 0, async function (done) {
        let status = "normal";
        pkg.hasInstalled({
            bundleName: NUM_TWO,
            success: function success(data) {
                status = "success";
                console.info('hasInstalled success function in');
                expect().assertFail();
            }
        });
        await sleep(500);
        expect(status).assertEqual("normal");
        done();
    });

    /*
     * @tc.number Sub_Bms_Framework_Status_Query_1300
     * @tc.name testHasInstalledNoFailCompleteBundleNotExist
     * @tc.desc Test hasInstalled interface without function fail and function complete bundleName not exiet 
     */
    it('testHasInstalledNoFailCompleteBundleNotExist', 0, async function (done) {
        pkg.hasInstalled({
            bundleName: 'wrongName',
            success: function success(data) {
                console.info('hasInstalled success function in');
                expect(data.result).assertFalse();
                done();
            }
        });
    });

    /*
     * @tc.number: Sub_Bms_Framework_Status_Query_1400
     * @tc.name: testHasInstalledInvalidParamCompleteNotExit
     * @tc.desc: test hasInstalled bundleName is number without function complete
     * @tc.level 3
     */
    it('testHasInstalledInvalidParamCompleteNotExit', 0, async function (done) {
        pkg.hasInstalled({
            bundleName: NUM_TWO,
            success: function success(data) {
                console.info('hasInstalled success' + JSON.stringify(data));
                expect().assertFail();
                done();
            },
            fail: function fail(data, code) {
                console.info('hasInstalled fail');
                expect(data).assertEqual("value is not an available number");
                expect(code).assertEqual(202);
                done();
            }
        })
    });

    async function sleep(time) {
        return new Promise((resolve, reject) => {
            setTimeout(() => {
                resolve()
            }, time)
        }).then(() => {
            console.info(`sleep ${time} over...`)
        })
    }
})}
