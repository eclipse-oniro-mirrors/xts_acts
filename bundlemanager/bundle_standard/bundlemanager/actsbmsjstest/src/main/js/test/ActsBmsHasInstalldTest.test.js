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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

const NUM_TWO = 2;
const ERR_CODE = 202;
const ERR_MERSSAGE = 'value is not an available number';

export default function ActsBmsHasInstalldTest() {
describe('ActsBmsHasInstalldTest', function () {

    /**
     * @tc.name   testHasInstalled
     * @tc.number Sub_Bms_Framework_Status_Query_0100
     * @tc.desc   Test hasInstalled interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasInstalled', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
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

    /**
     * @tc.name   testHasInstalledNoSuccess
     * @tc.number Sub_Bms_Framework_Status_Query_0200
     * @tc.desc   Test hasInstalled interface without success function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHasInstalledNoSuccess', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
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

    /**
     * @tc.name   testHasInstalledNoFailComplete
     * @tc.number Sub_Bms_Framework_Status_Query_0300
     * @tc.desc   Test hasInstalled without fail function and complete function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHasInstalledNoFailComplete', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
        pkg.hasInstalled({
            bundleName: 'com.example.third2',
            success: function success(data) {
                console.info('hasInstalled success function in');
                expect(data.result).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.name   hasInstalledHapNotExist
     * @tc.number Sub_Bms_Framework_Status_Query_0400
     * @tc.desc   Test hasInstalled when hap not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hasInstalledHapNotExist', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
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

    /**
     * @tc.name   testHasInstalledNumberParam
     * @tc.number Sub_Bms_Framework_Status_Query_0700
     * @tc.desc   Test hasInstalled when bundleName is number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasInstalledNumberParam', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
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

    /**
     * @tc.name   testHasInstalledFailNotExist
     * @tc.number Sub_Bms_Framework_Status_Query_0800
     * @tc.desc   Test hasInstalled without function fail.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHasInstalledFailNotExist', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
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

    /**
     * @tc.name   testHasInstalledCompleteNotExit
     * @tc.number Sub_Bms_Framework_Status_Query_0900
     * @tc.desc   Test hasInstalled without function complete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasInstalledCompleteNotExit', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async function (done) {
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

    /**
     * @tc.name   testHasInstalledReturnNotExist
     * @tc.number Sub_Bms_Framework_Status_Query_1000
     * @tc.desc   Test hasInstalled without function fail and function complete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasInstalledReturnNotExist', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async function (done) {
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

    /**
     * @tc.name   testHasInstalledNoFailCompleteBundleNotExist
     * @tc.number Sub_Bms_Framework_Status_Query_1300
     * @tc.desc   Test hasInstalled interface without function fail and function complete bundleName not exiet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHasInstalledNoFailCompleteBundleNotExist', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
        pkg.hasInstalled({
            bundleName: 'wrongName',
            success: function success(data) {
                console.info('hasInstalled success function in');
                expect(data.result).assertFalse();
                done();
            }
        });
    });

    /**
     * @tc.name   testHasInstalledInvalidParamCompleteNotExit
     * @tc.number Sub_Bms_Framework_Status_Query_1400
     * @tc.desc   test hasInstalled bundleName is number without function complete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHasInstalledInvalidParamCompleteNotExit', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
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
