/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { fileShare } from '@kit.CoreFileKit';
import screenLockFileManager from '@ohos.ability.screenLockFileManager';
import bundleManager from '@ohos.bundle.bundleManager'
import { BusinessError } from '@kit.BasicServicesKit';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function SandboxAPIStaticTest() {

    describe("SandboxAPIStaticTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');

        /**
         * @tc.name   SUB_Security_FileShare_CheckPath_Const_0100
         * @tc.number SUB_Security_FileShare_CheckPath_Const_0100
         * @tc.desc   Test fileShare PolicyType const TEMPORARY_TYPE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Security_FileShare_CheckPath_Const_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '----------------------SUB_Security_FileShare_CheckPath_Const_0100---------------------------');
            let value = fileShare.PolicyType.TEMPORARY_TYPE;
            hilog.info(domain, tag, 'SUB_Security_FileShare_CheckPath_Const_0100 value is: ' + value);
            expect(value).assertEqual(0);
            done();
        })

        /**
         * @tc.name   SUB_Security_FileShare_CheckPath_Const_0200
         * @tc.number SUB_Security_FileShare_CheckPath_Const_0200
         * @tc.desc   Test fileShare PolicyType const PERSISTENT_TYPE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Security_FileShare_CheckPath_Const_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '----------------------SUB_Security_FileShare_CheckPath_Const_0200---------------------------');
            let value = fileShare.PolicyType.PERSISTENT_TYPE;
            hilog.info(domain, tag, 'SUB_Security_FileShare_CheckPath_Const_0200 value is: ' + value);
            expect(value).assertEqual(1);
            done();
        })

        /**
         * @tc.name   SUB_Security_FileShare_PathPolicyInfo_0100
         * @tc.number SUB_Security_FileShare_PathPolicyInfo_0100
         * @tc.desc   Test PathPolicyInfo
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Security_FileShare_PathPolicyInfo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '----------------------SUB_Security_FileShare_PathPolicyInfo_0100---------------------------');
            let PathPolicyInfo1: fileShare.PathPolicyInfo = {
                path: "/storage/Users/currentUser/Documents/1.txt",
                operationMode: fileShare.OperationMode.READ_MODE,
            }
            let PathPolicyInfo2: fileShare.PathPolicyInfo = {
                path: "/storage/Users/currentUser/Documents/2.txt",
                operationMode: fileShare.OperationMode.WRITE_MODE,
            }
            expect(PathPolicyInfo1.path).assertEqual("/storage/Users/currentUser/Documents/1.txt");
            expect(PathPolicyInfo1.operationMode).assertEqual(1);
            expect(PathPolicyInfo2.operationMode).assertEqual(2);
            done();
        })

        /**
         * @tc.name   SUB_Security_EL5_AcquireAccessJsTest_004
         * @tc.number SUB_Security_EL5_AcquireAccessJsTest_004
         * @tc.desc   acquireAccess DataType MEDIA_DATA
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_Security_EL5_AcquireAccessJsTest_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '----------------------SUB_Security_EL5_AcquireAccessJsTest_004---------------------------');
            let value = screenLockFileManager.DataType.MEDIA_DATA;
            hilog.info(domain, tag, 'SUB_Security_EL5_AcquireAccessJsTest_004 value is: ' + value);
            expect(value).assertEqual(1);
            done();
        })

        /**
         * @tc.name   SUB_Security_EL5_AcquireAccessJsTest_005
         * @tc.number SUB_Security_EL5_AcquireAccessJsTest_005
         * @tc.desc   acquireAccess DataType ALL_DATA
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_Security_EL5_AcquireAccessJsTest_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '----------------------SUB_Security_EL5_AcquireAccessJsTest_005---------------------------');
            let value = screenLockFileManager.DataType.ALL_DATA;
            hilog.info(domain, tag, 'SUB_Security_EL5_AcquireAccessJsTest_005 value is: ' + value);
            expect(value).assertEqual(-1);
            done();
        })

        /**
         * @tc.name   SUB_Security_EL5_AcquireAccessJsTest_002
         * @tc.number SUB_Security_EL5_AcquireAccessJsTest_002
         * @tc.desc   acquireAccess AccessStatus ACCESS_DENIED
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Security_EL5_AcquireAccessJsTest_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '----------------------SUB_Security_EL5_AcquireAccessJsTest_002---------------------------');
            let value = screenLockFileManager.AccessStatus.ACCESS_DENIED;
            expect(value).assertEqual(-1);
            done();
        })

        /**
         * @tc.name   SUB_Security_EL5_AcquireAccessJsTest_003
         * @tc.number SUB_Security_EL5_AcquireAccessJsTest_003
         * @tc.desc   acquireAccess AccessStatus ACCESS_GRANTED
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Security_EL5_AcquireAccessJsTest_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '----------------------SUB_Security_EL5_AcquireAccessJsTest_003---------------------------');
            let value = screenLockFileManager.AccessStatus.ACCESS_GRANTED;
            expect(value).assertEqual(0);
            done();
        })

        /**
         * @tc.name   SUB_Security_EL5_ReleaseAccessJsTest_002
         * @tc.number SUB_Security_EL5_ReleaseAccessJsTest_002
         * @tc.desc   acquireAccess ReleaseStatus RELEASE_DENIED
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Security_EL5_ReleaseAccessJsTest_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '----------------------SUB_Security_EL5_ReleaseAccessJsTest_002---------------------------');
            let value = screenLockFileManager.ReleaseStatus.RELEASE_DENIED;
            expect(value).assertEqual(-1);
            done();
        })

        /**
         * @tc.name   SUB_Security_EL5_ReleaseAccessJsTest_003
         * @tc.number SUB_Security_EL5_ReleaseAccessJsTest_003
         * @tc.desc   acquireAccess ReleaseStatus RELEASE_GRANTED
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Security_EL5_ReleaseAccessJsTest_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '----------------------SUB_Security_EL5_ReleaseAccessJsTest_003---------------------------');
            let value = screenLockFileManager.ReleaseStatus.RELEASE_GRANTED;
            expect(value).assertEqual(0);
            done();
        })

        /**
         * @tc.name   SUB_Security_EL5_KeyStatusConst_0100
         * @tc.number SUB_Security_EL5_KeyStatusConst_0100
         * @tc.desc   Test screenLockFileManager KeyStatus const KEY_NOT_EXIST
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Security_EL5_KeyStatusConst_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '----------------------SUB_Security_EL5_KeyStatusConst_0100---------------------------');
            let value = screenLockFileManager.KeyStatus.KEY_NOT_EXIST;
            hilog.info(domain, tag, 'SUB_Security_EL5_KeyStatusConst_0100 value is: ' + value);
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
        it('SUB_Security_EL5_KeyStatusConst_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '----------------------SUB_Security_EL5_KeyStatusConst_0200---------------------------');
            let value = screenLockFileManager.KeyStatus.KEY_RELEASED;
            hilog.info(domain, tag, 'SUB_Security_EL5_KeyStatusConst_0200 value is: ' + value);
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
        it('SUB_Security_EL5_KeyStatusConst_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '----------------------SUB_Security_EL5_KeyStatusConst_0300---------------------------');
            let value = screenLockFileManager.KeyStatus.KEY_EXIST;
            hilog.info(domain, tag, 'SUB_Security_EL5_KeyStatusConst_0300 value is: ' + value);
            expect(value).assertEqual(0);
            done();
        })

        /**
         * @tc.name   SUB_Security_EL5_AcquireAccessJsTest_001
         * @tc.number SUB_Security_EL5_AcquireAccessJsTest_001
         * @tc.desc   screenLockFileManager acquireAccess AccessStatus.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_Security_EL5_AcquireAccessJsTest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            try {
                let AccessStatus = screenLockFileManager.acquireAccess();
                hilog.info(domain, tag, 'SUB_Security_EL5_AcquireAccessJsTest_001 AccessStatus is: ' + AccessStatus);
                expect(AccessStatus).assertEqual(screenLockFileManager.AccessStatus.ACCESS_GRANTED);
                done();
            } catch (error) {
                error = error as BusinessError;
                if (error.code == 801) {
                    done();
                } else {
                    hilog.info(domain, tag, 'SUB_Security_EL5_AcquireAccessJsTest_001 err.code is: ' + error.code)
                    expect(error.code).assertEqual(29300003);
                    done();
                }
            }
        })

        /**
         * @tc.name   SUB_Security_EL5_ReleaseAccessJsTest_001
         * @tc.number SUB_Security_EL5_ReleaseAccessJsTest_001
         * @tc.desc   screenLockFileManager releaseAccess ReleaseStatus.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_Security_EL5_ReleaseAccessJsTest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            try {
                let ReleaseStatus = screenLockFileManager.releaseAccess();
                hilog.info(domain, tag, 'SUB_Security_EL5_ReleaseAccessJsTest_001 ReleaseStatus is: ' + ReleaseStatus);
                expect(ReleaseStatus).assertEqual(screenLockFileManager.ReleaseStatus.RELEASE_GRANTED);
                done();
            } catch (error) {
                error = error as BusinessError;
                if (error.code == 801) {
                    done();
                } else {
                    hilog.info(domain, tag, 'SUB_Security_EL5_ReleaseAccessJsTest_001 err.code is: ' + error.code)
                    expect(error.code).assertEqual(29300003);
                    done();
                }
            }
        })

        /**
         * @tc.name   SUB_Security_EL5_QueryAppKeyStateTest_0100
         * @tc.number SUB_Security_EL5_QueryAppKeyStateTest_0100
         * @tc.desc   screenLockFileManager releaseAccess ReleaseStatus.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_Security_EL5_QueryAppKeyStateTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            try {
                let keyStatus = screenLockFileManager.queryAppKeyState();
                console.info('SUB_Security_EL5_QueryAppKeyStateTest_0100 keyStatus is: ' + keyStatus);
                expect(keyStatus).assertEqual(screenLockFileManager.KeyStatus.KEY_NOT_EXIST);
                done();
            } catch (error) {
                error = error as BusinessError;
                if (error.code == 801) {
                    done();
                } else {
                    hilog.info(domain, tag, 'SUB_Security_EL5_QueryAppKeyStateTest_0100 err.code is: ' + error.code)
                    expect(error.code).assertEqual(29300003);
                    done();
                }
            }
        })

        /**
         * @tc.name   SUB_Security_FileShare_OperationMode_static_0100
         * @tc.number SUB_Security_FileShare_OperationMode_static_0100
         * @tc.desc   Test fileShare OperationMode CREATE_MODE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("SUB_Security_FileShare_OperationMode_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
        async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '----------------------SUB_Security_FileShare_OperationMode_static_0100---------------------------');
            let value = fileShare.OperationMode.CREATE_MODE;
            hilog.info(domain, tag, 'SUB_Security_FileShare_OperationMode_static_0100 value is: ' + value);
            expect(value).assertEqual(0b100);
            done();
        })

        /**
         * @tc.name   SUB_Security_FileShare_OperationMode_static_0200
         * @tc.number SUB_Security_FileShare_OperationMode_static_0200
         * @tc.desc   Test fileShare OperationMode DELETE_MODE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("SUB_Security_FileShare_OperationMode_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
        async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '----------------------SUB_Security_FileShare_OperationMode_static_0200---------------------------');
            let value = fileShare.OperationMode.DELETE_MODE;
            hilog.info(domain, tag, 'SUB_Security_FileShare_OperationMode_static_0200 value is: ' + value);
            expect(value).assertEqual(0b1000);
            done();
        })

        /**
         * @tc.name   SUB_Security_FileShare_OperationMode_static_0300
         * @tc.number SUB_Security_FileShare_OperationMode_static_0300
         * @tc.desc   Test fileShare OperationMode RENAME_MODE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("SUB_Security_FileShare_OperationMode_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
        async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '----------------------SUB_Security_FileShare_OperationMode_static_0300---------------------------');
            let value = fileShare.OperationMode.RENAME_MODE;
            hilog.info(domain, tag, 'SUB_Security_FileShare_OperationMode_static_0300 value is: ' + value);
            expect(value).assertEqual(0b10000);
            done();
        })
    })

}