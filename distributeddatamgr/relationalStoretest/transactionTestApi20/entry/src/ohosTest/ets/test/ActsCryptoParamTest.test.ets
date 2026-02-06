/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import testNapi from 'libentry.so'

export default function ActsCryptoParamTest() {
  describe('ActsCryptoParamTest', () => {
    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_RDB_HMAC_SHA1_0100
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_RDB_HMAC_SHA1_0100
     * @tc.desc    : Test the failure scenario of enumeration value RDB_HMAC_SHA1.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_RDB_HMAC_SHA1_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) =>
    {
      try {
        console.info("====>SUB_DistributedData_RelationalStore_SDK_RDB_HMAC_SHA1_0100 start====");
        let result = testNapi.testOHCryptoSetHmacAlgoSha1();
        expect(result).assertEqual(0);
        console.info("====>SUB_DistributedData_RelationalStore_SDK_RDB_HMAC_SHA1_0100 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_DistributedData_RelationalStore_SDK_RDB_HMAC_SHA1_0100 catch err: " + err);
        expect(err).assertFail();
        done();
      }
    })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_RDB_HMAC_SHA256_0200
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_RDB_HMAC_SHA256_0200
     * @tc.desc    : Test the failure scenario of enumeration value RDB_HMAC_SHA256.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_RDB_HMAC_SHA256_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) =>
    {
      try {
        console.info("====>SUB_DistributedData_RelationalStore_SDK_RDB_HMAC_SHA256_0200 start====");
        let result = testNapi.testOHCryptoSetHmacAlgoSha256();
        expect(result).assertEqual(0);
        console.info("====>SUB_DistributedData_RelationalStore_SDK_RDB_HMAC_SHA256_0200 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_DistributedData_RelationalStore_SDK_RDB_HMAC_SHA256_0200 catch err: " + err);
        expect(err).assertFail();
        done();
      }
    })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_RDB_AES_256_GCM_0300
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_RDB_AES_256_GCM_0300
     * @tc.desc    : Test the failure scenario of enumeration value RDB_AES_256_GCM.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_RDB_AES_256_GCM_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) =>
    {
      try {
        console.info("====>SUB_DistributedData_RelationalStore_SDK_RDB_AES_256_GCM_0300 start====");
        let result = testNapi.testOHCryptoSetEncryptionAlgo256Gcm();
        expect(result).assertEqual(0);
        console.info("====>SUB_DistributedData_RelationalStore_SDK_RDB_AES_256_GCM_0300 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_DistributedData_RelationalStore_SDK_RDB_AES_256_GCM_0300 catch err: " + err);
        expect(err).assertFail();
        done();
      }
    })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_RDB_KDF_SHA1_0400
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_RDB_KDF_SHA1_0400
     * @tc.desc    : Test the failure scenario of enumeration value RDB_KDF_SHA1.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_RDB_KDF_SHA1_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) =>
    {
      try {
        console.info("====>SUB_DistributedData_RelationalStore_SDK_RDB_KDF_SHA1_0400 start====");
        let result = testNapi.testOHCryptoSetKdfAlgoKdfSha1();
        expect(result).assertEqual(0);
        console.info("====>SUB_DistributedData_RelationalStore_SDK_RDB_KDF_SHA1_0400 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_DistributedData_RelationalStore_SDK_RDB_KDF_SHA1_0400 catch err: " + err);
        expect(err).assertFail();
        done();
      }
    })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_RDB_KDF_SHA256_0500
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_RDB_KDF_SHA256_0500
     * @tc.desc    : Test the failure scenario of enumeration value RDB_KDF_SHA256.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_RDB_KDF_SHA256_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) =>
    {
      try {
        console.info("====>SUB_DistributedData_RelationalStore_SDK_RDB_KDF_SHA256_0500 start====");
        let result = testNapi.testOHCryptoSetKdfAlgoKdgShs256();
        expect(result).assertEqual(0);
        console.info("====>SUB_DistributedData_RelationalStore_SDK_RDB_KDF_SHA256_0500 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_DistributedData_RelationalStore_SDK_RDB_KDF_SHA256_0500 catch err: " + err);
        expect(err).assertFail();
        done();
      }
    })
  })
}
