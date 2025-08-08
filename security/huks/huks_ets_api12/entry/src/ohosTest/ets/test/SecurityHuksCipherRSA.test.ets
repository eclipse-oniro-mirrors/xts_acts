/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import huks from '@ohos.security.huks';
import { SetParam, GenParam, GetDataBySize } from './utils/HuksOptionUtil';
import { StringToUint8Array } from './utils/CommonUtil';
import { SignVerify, SignVerifyData } from './utils/SignVerifyUtil';
import { Cipher, CipherData } from './utils/CipherUtil';


export default function SecurityHuksCipherRSATest() {
  let genKeyOption: huks.HuksOptions;
  let cipherOption: huks.HuksOptions;

  describe('SecurityHuksCipherRSATest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      genKeyOption = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_RSA),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_RSA_KEY_SIZE_1024),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT)
        ]
      };
      cipherOption = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_RSA),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_RSA_KEY_SIZE_1024),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
          GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB),
          GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA1),
          GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE),
        ]
      }
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_RSA_API16_Func_0100
     * @tc.name   : test rsa 1032 ecb/sha1/noPadding mode cipher by two steps, data size equals to key size, process success
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_Cipher_RSA_API16_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_RSA_API16_Func_0100";
      let keySize = 1032;
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(keySize / 8)),
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_RSA_API16_Func_0200
     * @tc.name   : test rsa 1032 ecb/sha224/noPadding mode cipher by two steps, data size equals to key size, process success
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_Cipher_RSA_API16_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_RSA_API16_Func_0200";
      let keySize = 1032;
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(keySize / 8)),
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA224);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_RSA_API16_Func_0300
     * @tc.name   : test rsa 1032 ecb/sha256/oaep mode cipher by two steps, max data size, process success
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_Cipher_RSA_API16_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_RSA_API16_Func_0300";
      let keySize = 1032;
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(keySize / 8 - 2 * 256 / 8 - 2)),
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_OAEP);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_RSA_API16_Func_0400
     * @tc.name   : test rsa 1032 ecb/sha384/pkcs1_v1_5 mode cipher by two steps, 118B data, process success
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_Cipher_RSA_API16_Func_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_RSA_API16_Func_0400";
      let keySize = 1032;
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(keySize / 8 - 11)),
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA384);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS1_V1_5);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_RSA_API16_Func_0500
     * @tc.name   : test rsa 1032 ecb/sha512/pkcs1_v1_5 mode cipher by two steps, 118B data, process success
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_Cipher_RSA_API16_Func_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_RSA_API16_Func_0500";
      let keySize = 1032;
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(keySize / 8 - 11)),
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA512);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS1_V1_5);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_RSA_API16_Func_0600
     * @tc.name   : test rsa 2040 ecb/sha1/noPadding mode cipher by two steps, data size equals to key size, process success
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_Cipher_RSA_API16_Func_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_RSA_API16_Func_0600";
      let keySize = 2040;
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(keySize / 8)),
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_RSA_API16_Func_0700
     * @tc.name   : test rsa 2040 ecb/sha224/noPadding mode cipher by two steps, data size equals to key size, process success
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_Cipher_RSA_API16_Func_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_RSA_API16_Func_0700";
      let keySize = 2040;
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(keySize / 8)),
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA224);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_RSA_API16_Func_0800
     * @tc.name   : test rsa 2040 ecb/sha256/noPadding mode cipher by two steps, data size equals to key size, process success
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_Cipher_RSA_API16_Func_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_RSA_API16_Func_0800";
      let keySize = 2040;
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(keySize / 8)),
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_RSA_API16_Func_0900
     * @tc.name   : test rsa 2040 ecb/sha384/oaep mode cipher by two steps, max data size, process success
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_Cipher_RSA_API16_Func_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_RSA_API16_Func_0900";
      let keySize = 2040;
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(keySize / 8 - 2 * 384 / 8 - 2)),
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA384);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_OAEP);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_RSA_API16_Func_1000
     * @tc.name   : test rsa 2040 ecb/sha512/pkcs1_v1_5 mode cipher by two steps, 118B data, process success
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_Cipher_RSA_API16_Func_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_RSA_API16_Func_1000";
      let keySize = 2040;
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(keySize / 8 - 11)),
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA512);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS1_V1_5);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_RSA_API16_Func_1100
     * @tc.name   : test rsa generate with wrong size 1016, process fail
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_Cipher_RSA_API16_Func_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_RSA_API16_Func_1100";
      let keySize = 1016;
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000003);
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_RSA_API16_Func_1200
     * @tc.name   : test rsa generate with wrong size 2056, process fail
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_Cipher_RSA_API16_Func_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_RSA_API16_Func_1200";
      let keySize = 2056;
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000003);
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_RSA_API16_Func_1300
     * @tc.name   : test rsa generate with wrong size 1025, process fail
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_Cipher_RSA_API16_Func_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_RSA_API16_Func_1300";
      let keySize = 1025;
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(12000003);
        }
      }
    })


  }
  )
}