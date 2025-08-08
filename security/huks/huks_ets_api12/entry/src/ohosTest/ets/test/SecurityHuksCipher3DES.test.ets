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
import { SetParam, GenParam, GetDataBySize, DeleteParam } from './utils/HuksOptionUtil';
import { StringToUint8Array } from './utils/CommonUtil';
import { Cipher, CipherData, cipherWithText } from './utils/CipherUtil';


export default function SecurityHuksCipher3DESTest() {
  let genKeyOption: huks.HuksOptions;
  let cipherOption: huks.HuksOptions;

  describe('SecurityHuksCipher3DESTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      genKeyOption = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_3DES),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_3DES_KEY_SIZE_128),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT)
        ]
      };
      cipherOption = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_3DES),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_3DES_KEY_SIZE_128),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
          GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB),
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
     * @tc.number : SUB_Security_HUKS_Cipher_3DES_API16_Func_0100
     * @tc.name   : test 3des ecb mode cipher by three steps, 64B data, process success
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_Cipher_3DES_API16_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_3DES_API16_Func_0100";
      let cipherData: CipherData = {
        updateDataArr: [StringToUint8Array(GetDataBySize(64))],
        finishData: StringToUint8Array(GetDataBySize(64)),
      }
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
     * @tc.number : SUB_Security_HUKS_Cipher_3DES_API16_Func_0200
     * @tc.name   : test 3des cbc mode cipher by three steps, 64B data, process success
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_Cipher_3DES_API16_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_3DES_API16_Func_0200";
      let cipherData: CipherData = {
        updateDataArr: [StringToUint8Array(GetDataBySize(64))],
        finishData: StringToUint8Array(GetDataBySize(64)),
      }
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_IV, StringToUint8Array("12345678"));
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
     * @tc.number : SUB_Security_HUKS_Cipher_3DES_API16_Func_0300
     * @tc.name   : test 3des ecb mode cipher by three steps, 64B data, process success
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_Cipher_3DES_API16_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_3DES_API16_Func_0300";
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(64)),
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_3DES_KEY_SIZE_192);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_3DES_KEY_SIZE_192);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB);
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
     * @tc.number : SUB_Security_HUKS_Cipher_3DES_API16_Func_0400
     * @tc.name   : test 3des cbc mode cipher by three steps, 64B data, process success
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_Cipher_3DES_API16_Func_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_3DES_API16_Func_0400";
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(64)),
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_3DES_KEY_SIZE_192);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_3DES_KEY_SIZE_192);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_IV, StringToUint8Array("12345678"));
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
     * @tc.number : SUB_Security_HUKS_Cipher_3DES_API16_Func_0500
     * @tc.name   : test 3des cbc mode cipher without iv, 64B data, process fail
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_Cipher_3DES_API16_Func_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_3DES_API16_Func_0500";
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(64)),
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_3DES_KEY_SIZE_192);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_3DES_KEY_SIZE_192);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_3DES_API16_Func_0600
     * @tc.name   : test 3des cbc mode cipher with 65B data, process fail
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_Cipher_3DES_API16_Func_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_3DES_API16_Func_0600";
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(65)),
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_3DES_KEY_SIZE_192);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_3DES_KEY_SIZE_192);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_IV, StringToUint8Array("12345678"));
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_3DES_API16_Func_0700
     * @tc.name   : test 3des cipher with unsupported ctr mode, 64B data, process fail
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_Cipher_3DES_API16_Func_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_3DES_API16_Func_0700";
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(64)),
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_3DES_KEY_SIZE_192);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_3DES_KEY_SIZE_192);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CTR);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_IV, StringToUint8Array("1234567812345678"));
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000002);
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_3DES_API16_Func_0800
     * @tc.name   : test 3des cbc mode cipher with wrong iv, 64B data, process fail
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_Cipher_3DES_API16_Func_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_3DES_API16_Func_0800";
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(64)),
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_3DES_KEY_SIZE_192);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_3DES_KEY_SIZE_192);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_IV, StringToUint8Array("123456789"));
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000003);
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_3DES_API16_Func_0900
     * @tc.name   : test 3des cbc mode cipher with wrong key size, 64B data, process fail
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_Cipher_3DES_API16_Func_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_3DES_API16_Func_0900";
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_DES_KEY_SIZE_64);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000003);
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_3DES_API16_Func_1000
     * @tc.name   : test 3des cbc mode cipher with wrong key size, 64B data, process fail
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_Cipher_3DES_API16_Func_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_3DES_API16_Func_1000";
      let keySize = 256;
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000003);
      }
    })

  }
  )
}