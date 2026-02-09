/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permission and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import screenLockFileManager from '@ohos.ability.screenLockFileManager';

export default function ScreenLockFileManagerTest() {
    describe("ScreenLockFileManagerTest", () => {
        beforeAll(() =>{

            /*
             * @tc.setup: setup invoked before all testcases
             */
            console.info('beforeAll called')
        })

        afterAll(() =>{

            /*
             * @tc.teardown: teardown invoked after all testcases
             */
            console.info('afterAll called')
        })

        beforeEach(() =>{

            /*
             * @tc.setup: setup invoked before each testcases
             */
            console.info('beforeEach called')
        })

        afterEach(() =>{

            /*
             * @tc.teardown: teardown invoked after each testcases
             */
            console.info('afterEach called')
        })

        /**
         * @tc.name   AcquireAccessJsTest001
         * @tc.number SUB_SECURITY_SCREEN_LOCK_XTS_001
         * @tc.desc   screenLockFileManager acquireAccess AccessStatus.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("AcquireAccessJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            try {
                let AccessStatus = screenLockFileManager.acquireAccess();
                console.info('AcquireAccessJsTest001 AccessStatus is: ' + AccessStatus);
                expect(AccessStatus).assertEqual(screenLockFileManager.AccessStatus.ACCESS_GRANTED);
                done();
            } catch (err) {
                if (err.code === 801) {
                    done();
                } else {
                    console.info('AcquireAccessJsTest001 err.code is: ' + err.code)
                    expect(err.code).assertEqual(29300003);
                    done();
                }
            }
        })

        /**
         * @tc.name   AcquireAccessJsTest002
         * @tc.number SUB_SECURITY_SCREEN_LOCK_XTS_002
         * @tc.desc   acquireAccess AccessStatus ACCESS_DENIED
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("AcquireAccessJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
            console.info('----------------------AcquireAccessJsTest002---------------------------');
            let value = screenLockFileManager.AccessStatus.ACCESS_DENIED;
            expect(value).assertEqual(-1);
            done();
        })

        /**
         * @tc.name   AcquireAccessJsTest003
         * @tc.number SUB_SECURITY_SCREEN_LOCK_XTS_003
         * @tc.desc   acquireAccess AccessStatus ACCESS_GRANTED
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("AcquireAccessJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
            console.info('----------------------AcquireAccessJsTest003---------------------------');
            let value = screenLockFileManager.AccessStatus.ACCESS_GRANTED;
            expect(value).assertEqual(0);
            done();
        })

        /**
         * @tc.name   ReleaseAccessJsTest001
         * @tc.number SUB_SECURITY_SCREEN_LOCK_XTS_004
         * @tc.desc   screenLockFileManager releaseAccess ReleaseStatus.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("ReleaseAccessJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            try {
                let ReleaseStatus = screenLockFileManager.releaseAccess();
                console.info('ReleaseAccessJsTest001 ReleaseStatus is: ' + ReleaseStatus);
                expect(ReleaseStatus).assertEqual(screenLockFileManager.ReleaseStatus.RELEASE_GRANTED);
                done();
            } catch (err) {
                if (err.code === 801) {
                    done();
                } else {
                    console.info('ReleaseAccessJsTest001 err.code is: ' + err.code)
                    expect(err.code).assertEqual(29300003);
                    done();
                }
            }
        })

        /**
         * @tc.name   ReleaseAccessJsTest002
         * @tc.number SUB_SECURITY_SCREEN_LOCK_XTS_005
         * @tc.desc   acquireAccess ReleaseStatus RELEASE_DENIED
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("ReleaseAccessJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
            console.info('----------------------ReleaseAccessJsTest002---------------------------');
            let value = screenLockFileManager.ReleaseStatus.RELEASE_DENIED;
            expect(value).assertEqual(-1);
            done();
        })

        /**
         * @tc.name   ReleaseAccessJsTest003
         * @tc.number SUB_SECURITY_SCREEN_LOCK_XTS_006
         * @tc.desc   acquireAccess ReleaseStatus RELEASE_GRANTED
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("ReleaseAccessJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
            console.info('----------------------ReleaseAccessJsTest003---------------------------');
            let value = screenLockFileManager.ReleaseStatus.RELEASE_GRANTED;
            expect(value).assertEqual(0);
            done();
        })

        /**
         * @tc.name   AcquireAccessJsTest004
         * @tc.number SUB_SECURITY_SCREEN_LOCK_XTS_007
         * @tc.desc   acquireAccess DataType MEDIA_DATA
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("AcquireAccessJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
            console.info('----------------------AcquireAccessJsTest004---------------------------');
            let value = screenLockFileManager.DataType.MEDIA_DATA;
            console.info('AcquireAccessJsTest004 value is: ' + value);
            expect(value).assertEqual(1);
            done();
        })

        /**
         * @tc.name   AcquireAccessJsTest005
         * @tc.number SUB_SECURITY_SCREEN_LOCK_XTS_008
         * @tc.desc   acquireAccess DataType ALL_DATA
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("AcquireAccessJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
            console.info('----------------------AcquireAccessJsTest005---------------------------');
            let value = screenLockFileManager.DataType.ALL_DATA;
            console.info('AcquireAccessJsTest005 value is: ' + value);
            expect(value).assertEqual(-1);
            done();
        })

        /**
         * @tc.name   SUB_Security_EL5_QueryAppKeyState_0100
         * @tc.number SUB_Security_EL5_QueryAppKeyState_0100
         * @tc.desc   Query access permissions for sensitive data of applications under lock screen
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("SUB_Security_EL5_QueryAppKeyState_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            try {
                let keyStatus = screenLockFileManager.queryAppKeyState();
                console.info('SUB_Security_EL5_QueryAppKeyState_0100 keyStatus is: ' + keyStatus);
                expect(keyStatus).assertEqual(-2);
                done();
            } catch (err) {
                if (err.code === 801) {
                    done();
                }
                console.error('SUB_Security_EL5_QueryAppKeyState_0100 err.code is: ' + err.code);
            }
        })

        /**
         * @tc.name   SUB_Security_EL5_KeyStatusConst_0100
         * @tc.number SUB_Security_EL5_KeyStatusConst_0100
         * @tc.desc   Test screenLockFileManager KeyStatus const KEY_NOT_EXIST
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("SUB_Security_EL5_KeyStatusConst_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
            console.info('----------------------SUB_Security_EL5_KeyStatusConst_0100---------------------------');
            let value = screenLockFileManager.KeyStatus.KEY_NOT_EXIST;
            console.info('SUB_Security_EL5_KeyStatusConst_0100 value is: ' + value);
            expect(value).assertEqual(-2);
            done();
        })

        /**
         * @tc.name   SUB_Security_EL5_KeyStatusConst_0200
         * @tc.number SUB_Security_EL5_KeyStatusConst_0200
         * @tc.desc   Test screenLockFileManager KeyStatus const KEY_RELEASED
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("SUB_Security_EL5_KeyStatusConst_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
            console.info('----------------------SUB_Security_EL5_KeyStatusConst_0200---------------------------');
            let value = screenLockFileManager.KeyStatus.KEY_RELEASED;
            console.info('SUB_Security_EL5_KeyStatusConst_0200 value is: ' + value);
            expect(value).assertEqual(-1);
            done();
        })

        /**
         * @tc.name   SUB_Security_EL5_KeyStatusConst_0300
         * @tc.number SUB_Security_EL5_KeyStatusConst_0300
         * @tc.desc   Test screenLockFileManager KeyStatus const KEY_EXIST
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_Security_EL5_KeyStatusConst_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
            console.info('----------------------SUB_Security_EL5_KeyStatusConst_0300---------------------------');
            let value = screenLockFileManager.KeyStatus.KEY_EXIST;
            console.info('SUB_Security_EL5_KeyStatusConst_0300 value is: ' + value);
            expect(value).assertEqual(0);
            done();
        })
    })
}