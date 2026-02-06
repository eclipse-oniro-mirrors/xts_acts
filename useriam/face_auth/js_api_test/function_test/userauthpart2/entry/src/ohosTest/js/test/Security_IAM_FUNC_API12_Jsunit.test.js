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

import { describe, it, expect, Level, TestType, Size  } from '@ohos/hypium'
import userAuthNorth from '@ohos.userIAM.userAuth'
import { checkSupportOrNot } from './utils/commonFunc';

export default function userauthTest_API12() {
    describe('userauthTest_API12', function () {

        /**
         * @tc.name   SUB_Security_IAM_Func_API12_0100
         * @tc.number SUB_Security_IAM_Func_API12_0100
         * @tc.desc   GetEnrolledState parameter validity check
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Security_IAM_Func_API12_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
            console.info('testFace SUB_Security_IAM_Func_API12_0100 start');
            let authType = [userAuthNorth.UserAuthType.FACE, userAuthNorth.UserAuthType.FINGERPRINT, userAuthNorth.UserAuthType.PIN]
            let authTypeOne = [-1, 0, 3, 5]
            for (let idx0 = 0; idx0 < authType.length; idx0++) {
                let checkSupport = await checkSupportOrNot(authType[idx0]);
                if (checkSupport == 0) {
                    try {
                        console.info('SUB_Security_IAM_Func_API12_0100 authtype:' + authType[idx0])
                        let EnrolledState = userAuthNorth.getEnrolledState(authType[idx0]);
                        console.info('SUB_Security_IAM_Func_API12_0100 EnrolledState.credentialDigest:' + EnrolledState.credentialDigest)
                        console.info('SUB_Security_IAM_Func_API12_0100 EnrolledState.credentialCount:' + EnrolledState.credentialCount)
                    } catch (e) {
                        console.log("SUB_Security_IAM_Func_API12_0100 fail " + 'authType:' + authType[idx0] + 'e.code:' + e.code);
                        expect(e.code).assertEqual(userAuthNorth.UserAuthResultCode.NOT_ENROLLED);
                    }
                }
            }
            for (let idx0 = 0; idx0 < authTypeOne.length; idx0++) {
                try {
                    console.info('SUB_Security_IAM_Func_API12_0100 authtype:' + authType[idx0])
                    userAuthNorth.getEnrolledState(authTypeOne[idx0]);
                } catch (e) {
                    console.log("SUB_Security_IAM_Func_API12_0100 fail " + 'authType:' + authType[idx0] + 'e.code:' + e.code);
                    expect(e.code).assertEqual(userAuthNorth.UserAuthResultCode.TYPE_NOT_SUPPORT);
                }
            }
            try {
                userAuthNorth.getEnrolledState();
            } catch (e) {
                console.log("SUB_Security_IAM_Func_API12_0100 fail " + 'authType is null:' + 'e.code:' + e.code);
                expect(e.code).assertEqual(401);
            }
            done();
        })


    })

}
