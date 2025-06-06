/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import osAccountNdk from 'libosaccountndk.so'

const OS_ACCOUNT_ERR_OK = 0;
const OS_ACCOUNT_ERR_INTERNAL_ERROR = 12300001;
const OS_ACCOUNT_ERR_INVALID_PARAMETER = 12300002;

export default function ActsOsAccountNdkTest() {
  describe('ActsOsAccountNdkTest', () => {

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_0100
     * @tc.name    : test OH_OsAccount_GetName Test Normal Scene
     * @tc.desc    : Gets the name of the OS account to which the caller process belongs.
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_0100 start====");
        let result = osAccountNdk.osAccountGetAccountNameA();
        console.info("====>SUB_Account_OsAccount_GetName_0100 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_0100 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_0200
     * @tc.name    : test OH_OsAccount_GetName Test 12300002 length is zero Scene
     * @tc.desc    : Gets the name of the OS account to which the caller process belongs.
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_0200 start====");
        let result = osAccountNdk.osAccountGetAccountNameB();
        console.info("====>SUB_Account_OsAccount_GetName_0200 result: " + result);
        expect(result).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_0200 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_0300
     * @tc.name    : test OH_OsAccount_GetName Test 12300002 Buffer is nullptr Scene
     * @tc.desc    : Gets the name of the OS account to which the caller process belongs.
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_0300 start====");
        let result = osAccountNdk.osAccountGetAccountNameC();
        console.info("====>SUB_Account_OsAccount_GetName_0300 result: " + result);
        expect(result).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_0300 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
        done()
      }
    })
  })
}
