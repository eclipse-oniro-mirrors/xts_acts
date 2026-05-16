/**
 * Copyright (c) 2024-2026 Huawei Device Co., Ltd.
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

const Success = 0
export default function ActsOsAccountNdkTest() {
  describe('ActsOsAccountNdkTest', () => {

    /**
     * @tc.name   SUB_Account_OsAccount_GetName_0100
     * @tc.number SUB_Account_OsAccount_GetName_0100
     * @tc.desc   Gets the name of the OS account to which the caller process belongs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Account_OsAccount_GetName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_0100 start====");
        let result = osAccountNdk.osAccountGetAccountNameA();
        console.info("====>SUB_Account_OsAccount_GetName_0100 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_0100 catch err: " + err);
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.name   SUB_Account_OsAccount_GetName_0200
     * @tc.number SUB_Account_OsAccount_GetName_0200
     * @tc.desc   Gets the name of the OS account to which the caller process belongs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Account_OsAccount_GetName_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_0200 start====");
        let result = osAccountNdk.osAccountGetAccountNameB();
        console.info("====>SUB_Account_OsAccount_GetName_0200 result: " + result);
        expect(result).assertEqual(12300002);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_0200 catch err: " + err);
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.name   SUB_Account_OsAccount_GetName_0300
     * @tc.number SUB_Account_OsAccount_GetName_0300
     * @tc.desc   Gets the name of the OS account to which the caller process belongs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Account_OsAccount_GetName_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_0300 start====");
        let result = osAccountNdk.osAccountGetAccountNameC();
        console.info("====>SUB_Account_OsAccount_GetName_0300 result: " + result);
        expect(result).assertEqual(Success);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_0300 catch err: " + err);
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.name   SUB_Account_OsAccount_GetName_0400
     * @tc.number SUB_Account_OsAccount_GetName_0400
     * @tc.desc   Gets the name of the OS account to which the caller process belongs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Account_OsAccount_GetName_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_0400 start====");
        let result = osAccountNdk.osAccountGetAccountNameD();
        console.info("====>SUB_Account_OsAccount_GetName_0400 result: " + result);
        expect(result).assertEqual(Success);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_0400 catch err: " + err);
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.name   SUB_Account_OsAccount_GetNameByLocalId_0100
     * @tc.number SUB_Account_OsAccount_GetNameByLocalId_0100
     * @tc.desc   Get account name with invalid localId (-1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Account_OsAccount_GetNameByLocalId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetNameByLocalId_0100 start====");
        let result = osAccountNdk.osAccountGetAccountNameByIdA();
        console.info("====>SUB_Account_OsAccount_GetNameByLocalId_0100 result: " + result);
        expect(result).assertEqual(Success);
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetNameByLocalId_0100 catch err: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Account_OsAccount_GetNameByLocalId_0200
     * @tc.number SUB_Account_OsAccount_GetNameByLocalId_0200
     * @tc.desc   Get account name with non-existent localId (101).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Account_OsAccount_GetNameByLocalId_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetNameByLocalId_0200 start====");
        let result = osAccountNdk.osAccountGetAccountNameByIdB();
        console.info("====>SUB_Account_OsAccount_GetNameByLocalId_0200 result: " + result);
        expect(result).assertEqual(Success);
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetNameByLocalId_0200 catch err: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Account_OsAccount_GetNameByLocalId_0300
     * @tc.number SUB_Account_OsAccount_GetNameByLocalId_0300
     * @tc.desc   Get account name with restricted localId (0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Account_OsAccount_GetNameByLocalId_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetNameByLocalId_0300 start====");
        let result = osAccountNdk.osAccountGetAccountNameByIdC();
        console.info("====>SUB_Account_OsAccount_GetNameByLocalId_0300 result: " + result);
        expect(result).assertEqual(Success);
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetNameByLocalId_0300 catch err: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Account_OsAccount_GetNameByLocalId_0400
     * @tc.number SUB_Account_OsAccount_GetNameByLocalId_0400
     * @tc.desc   Get account name with name_size=0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Account_OsAccount_GetNameByLocalId_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetNameByLocalId_0400 start====");
        let result = osAccountNdk.osAccountGetAccountNameByIdD();
        console.info("====>SUB_Account_OsAccount_GetNameByLocalId_0400 result: " + result);
        expect(result).assertEqual(Success);
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetNameByLocalId_0400 catch err: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Account_OsAccount_GetNameByLocalId_0500
     * @tc.number SUB_Account_OsAccount_GetNameByLocalId_0500
     * @tc.desc   Get account name with nullptr name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Account_OsAccount_GetNameByLocalId_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetNameByLocalId_0500 start====");
        let result = osAccountNdk.osAccountGetAccountNameByIdE();
        console.info("====>SUB_Account_OsAccount_GetNameByLocalId_0500 result: " + result);
        expect(result).assertEqual(Success);
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetNameByLocalId_0500 catch err: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Account_OsAccount_GetNameByLocalId_0600
     * @tc.number SUB_Account_OsAccount_GetNameByLocalId_0600
     * @tc.desc   Get account name with name_size exceeding LOGIN_NAME_MAX (257 > 256).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Account_OsAccount_GetNameByLocalId_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetNameByLocalId_0600 start====");
        let result = osAccountNdk.osAccountGetAccountNameByIdF();
        console.info("====>SUB_Account_OsAccount_GetNameByLocalId_0600 result: " + result);
        expect(result).assertEqual(Success);
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetNameByLocalId_0600 catch err: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Account_OsAccount_GetNameByLocalId_0700
     * @tc.number SUB_Account_OsAccount_GetNameByLocalId_0700
     * @tc.desc   Get account name with exactly LOGIN_NAME_MAX (256) characters including terminating character.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Account_OsAccount_GetNameByLocalId_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetNameByLocalId_0700 start====");
        let result = osAccountNdk.osAccountGetAccountNameByIdG();
        console.info("====>SUB_Account_OsAccount_GetNameByLocalId_0700 result: " + result);
        expect(result).not().assertUndefined();
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetNameByLocalId_0700 catch err: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Account_OsAccount_GetNameByLocalId_0800
     * @tc.number SUB_Account_OsAccount_GetNameByLocalId_0800
     * @tc.desc   Get account name with valid localId (100).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Account_OsAccount_GetNameByLocalId_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetNameByLocalId_0800 start====");
        let result = osAccountNdk.osAccountGetAccountNameByIdH();
        console.info("====>SUB_Account_OsAccount_GetNameByLocalId_0800 result: " + result);
        expect(result).not().assertUndefined();
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetNameByLocalId_0800 catch err: " + err);
        expect().assertFail();
      }
      done();
    });
  });
}
