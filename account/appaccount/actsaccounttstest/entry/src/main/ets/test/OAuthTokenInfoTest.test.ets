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

export default function oauthTokenInfoTest() {
  describe('OAuthTokenInfoTest', () => {
    beforeAll(async (done: Function) => {
      console.info('AccountTsTest: beforeAll');
      done();
    })

    afterAll(async (done: Function) => {
      console.info('AccountTsTest: afterAll');
      done();
    })

    beforeEach(async (done: Function) => {
      console.info('AccountTsTest: beforeEach');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('AccountTsTest: afterEach');
      done();
    })

    /*
     * @tc.number  OAuthTokenInfoTest_0100
     * @tc.name    OAuthTokenInfoTest_0100
     * @tc.desc    AuthTokenInfo without account.
     * @tc.size    SmallTest
     * @tc.type    User
     */
    it('OAuthTokenInfoTest_0100', 0, async (done: Function) => {
      let info: appAccount.AuthTokenInfo = {
        authType: "getSocialData",
        token: "xxxxx"
      }
      console.log("OAuthTokenInfoTest_0100 info: " + JSON.stringify(info));
      expect(info.hasOwnProperty("accounts")).assertEqual(false)
      expect(info.hasOwnProperty("account")).assertEqual(false)
      done()
    })

    /*
     * @tc.number  OAuthTokenInfoTest_0200
     * @tc.name    OAuthTokenInfoTest_0200
     * @tc.desc    AuthTokenInfo with account.
     * @tc.size    SmallTest
     * @tc.type    User
     */
    it('OAuthTokenInfoTest_0200', 0, async (done: Function) => {
      let info: appAccount.AuthTokenInfo = {
        authType: "getSocialData",
        token: "xxxxx",
        account: {
          name: "zhangsan",
          owner: "com.ohos.testapp"
        }
      }
      console.log("OAuthTokenInfoTest_0200 info: " + JSON.stringify(info))
      expect(info.hasOwnProperty("accounts")).assertEqual(false)
      expect(info.hasOwnProperty("account")).assertEqual(true)
      expect(info.account.owner).assertEqual("com.ohos.testapp")
      done();
    })
  })
}
