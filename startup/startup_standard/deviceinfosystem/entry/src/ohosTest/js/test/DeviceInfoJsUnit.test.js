/*
 * Copyright (C) 2021-2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import deviceinfo from '@ohos.deviceInfo'

export default function DeviceInfoTest() {
    describe('DeviceInfoTest', function () {

        const MAX_CHARACTERS_NUM_ONE = 33;
        const MAX_CHARACTERS_NUM_TWO = 65;
        const MAX_CHARACTERS_NUM = 0;
        const CHARACTERS_NUM_ODID = 36;
        const CLASS_LEVEL_HIGH = 0;
        const CLASS_LEVEL_MEDIUM = 1;
        const CLASS_LEVEL_LOW = 2;

        beforeAll(function () {
            console.info('beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.');

        })

        beforeEach(function () {
            console.info('beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.');

        })
        afterEach(function () {
            console.info('afterEach: Test case-level clearance conditions, which are executed after each test case is executed.');

        })
        afterAll(function () {
            console.info('afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed');

        })

        console.info('start################################start');



        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0110
         * @tc.name     testGetSerial01
         * @tc.desc      Get the device serial number represented by a string and the return value is not null.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('testGetSerial01 start');

            let serialInfo = deviceinfo.serial;
            console.info('the value of the deviceinfo serial is :' + serialInfo);

            expect(serialInfo).assertInstanceOf('String');
            if (serialInfo != "" && serialInfo != null && serialInfo != undefined) {
                let str = /[\w-\.\(\)]/g;
                let arr = serialInfo.match(str);
                let bufferstr = arr.join('');
                console.info('the value of the bufferstr is :' + bufferstr);
                expect(serialInfo).assertEqual(bufferstr);
            } else {
                console.info('the return value is null or incorrect.');
                expect(false).assertTrue();
            }

            console.info('testGetSerial01 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0430
         * @tc.name      testGetSerial02
         * @tc.desc      Get a string representing the device serial number which has a maximum of 64 characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_039 start');
            let serialInfo = deviceinfo.serial;
            console.info('the value of the deviceinfo serial is :' + serialInfo);

            let len = serialInfo.length;
            console.info('the value of the device serial number characters is :' + len);
            expect(len).assertLess(MAX_CHARACTERS_NUM_TWO);

            let str = /[\w-\.\(\)]/g;
            let arr = serialInfo.match(str);
            let bufferstr = arr.join('');
            console.info('the value of the bufferstr is :' + bufferstr);
            expect(serialInfo).assertEqual(bufferstr);

            console.info('device_info_test_039 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0590
         * @tc.name      testGetSerial03
         * @tc.desc      Get a string representing the device serial number which has at least one characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_054 start');
            let serialInfo = deviceinfo.serial;
            console.info('the value of the deviceinfo serial is :' + serialInfo);

            let len = serialInfo.length;
            console.info('the value of the device serial number characters is :' + len);
            expect(len).assertLarger(MAX_CHARACTERS_NUM);

            let str = /[\w-\.\(\)]/g;
            let arr = serialInfo.match(str);
            let bufferstr = arr.join('');
            console.info('the value of the bufferstr is :' + bufferstr);
            expect(serialInfo).assertEqual(bufferstr);

            console.info('device_info_test_054 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0662
         * @tc.name      testGetUdid
         * @tc.desc      Get udid
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_062 start');
            let udid = deviceinfo.udid;
            console.info('the value of the deviceinfo udid is :' + udid);

            let len = udid.length
            console.info('the value of the different build host of the same baseline code characters is :' + len);
            expect(len).assertLarger(MAX_CHARACTERS_NUM);
            console.info('device_info_test_060 : end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0663
         * @tc.name      testGetUuid
         * @tc.desc      Get uuid
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('device_info_test_063 start');
            let ret = false;
            let udid = deviceinfo.udid;
            console.info('the value of the deviceinfo udid is :' + udid);

            expect(udid).assertInstanceOf('String');
            if (udid != "" && udid != null && udid != undefined) {
                ret = true;
                expect(ret).assertTrue();
				done();
            } else {
                console.info('the return value GetManufacture01 is null or incorrect.');
                expect(false).assertTrue();
				done();
            }

            console.info('device_info_test_063 : end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0664
         * @tc.name      testGetUdid
         * @tc.desc      Get udid
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_064 start');
            let udid = deviceinfo.udid;
            console.info('the value of the deviceinfo udid is :' + udid);

            let len = udid.length
            console.info('the value of the different build host of the same baseline code characters is :' + len);
            expect(len).assertLess(MAX_CHARACTERS_NUM_TWO)
            console.info('device_info_test_064 : end');
        })
    })
}
