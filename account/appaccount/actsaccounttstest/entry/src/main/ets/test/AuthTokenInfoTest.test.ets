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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import appAccount from "@ohos.account.appAccount"

export default function authTokenInfoTest() {
    describe('AuthTokenInfoTest', function () {
        beforeAll(async function (done) {
            console.info('AccountTsTest: beforeAll');
            done();
        })

        afterAll(async function (done) {
            console.info('AccountTsTest: afterAll');
            done();
        })

        beforeEach(async function (done) {
            console.info('AccountTsTest: beforeEach');
            done();
        })

        afterEach(async function (done) {
            console.info('AccountTsTest: afterEach');
            done();
        })

        /*
         * @tc.number  AuthTokenInfoTest_0100
         * @tc.name    AuthTokenInfoTest_0100
         * @tc.desc    AuthTokenInfo without account. 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AuthTokenInfoTest_0100', 0, async function (done) {
            let info : appAccount.AuthTokenInfo = {
                authType: "getSocialData",
                token: "xxxxx"
            }
            console.log("AuthTokenInfoTest_0100 info: " + JSON.stringify(info));
            expect(info.hasOwnProperty("accounts")).assertEqual(false)
            expect(info.hasOwnProperty("account")).assertEqual(false)
            done()
        })

        /*
         * @tc.number  AuthTokenInfoTest_0200
         * @tc.name    AuthTokenInfoTest_0200
         * @tc.desc    AuthTokenInfo with account. 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AuthTokenInfoTest_0200', 0, async function (done) {
            let info : appAccount.AuthTokenInfo = {
                authType: "getSocialData",
                token: "xxxxx",
                account: {
                    name: "zhangsan",
                    owner: "com.ohos.testapp"
                }
            }
            console.log("AuthTokenInfoTest_0200 info: " + JSON.stringify(info))
            expect(info.hasOwnProperty("accounts")).assertEqual(false)
            expect(info.hasOwnProperty("account")).assertEqual(true)
            expect(info.account.owner).assertEqual("com.ohos.testapp")
            done();
        })
    })
}
