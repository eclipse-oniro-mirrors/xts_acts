/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level, TestType, Size } from '@ohos/hypium'
import userAuthNorth from '@ohos.userIAM.userAuth'

export default function userauthTest_Nopermission_API12() {
    describe('userauthTest_Nopermission_API12', function () {

        /**
         * @tc.name   SUB_Security_IAM_Func_API12_0110
         * @tc.number SUB_Security_IAM_Func_API12_0110
         * @tc.desc   Unapplied permission call GetEnrolledState
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Security_IAM_Func_API12_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
            console.info('testFace SUB_Security_IAM_Func_API12_0110 start');
            let authType = 1
            try {
                userAuthNorth.getEnrolledState(authType);
            } catch (e) {
                console.log("SUB_Security_IAM_Func_API12_0110 fail " + 'authType:' + authType + 'e.code:' + e.code);
                expect(e.code).assertEqual(201);
            }
            done();
        })

        /**
         * @tc.name   SUB_Security_IAM_UserAuth_FUNC_0140
         * @tc.number SUB_Security_IAM_UserAuth_FUNC_0140
         * @tc.desc   getAuthLockState Nopermission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Security_IAM_UserAuth_FUNC_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('testFace SUB_Security_IAM_UserAuth_FUNC_0140 start');
            let authType = 1
            try {
                await userAuthNorth.getAuthLockState(authType);
            } catch (error) {
                console.error(`SUB_Security_IAM_UserAuth_FUNC_0140 fail code is ${error.code}`);
                expect(error.code).assertEqual(201);
            }
            done();
        })
    })

}
