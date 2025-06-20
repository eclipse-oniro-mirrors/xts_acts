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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import huks from '@ohos.security.huks';
import { DeleteParam, GenParam, SetParam } from './utils/huks/HuksOptionsUtils';
import { GetDataBySize, StringToUint8Array } from './utils/CommonUtils';
import { Cipher, cipherAbortWithText, CipherData, cipherWithText, cipherWithTextCallback } from './utils/huks/CipherUtils';


export default function SecurityHuksCipherSM4Test() {
  let genKeyOption: huks.HuksOptions;
  let cipherOption: huks.HuksOptions;

  describe('SecurityHuksCipherSM4Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      genKeyOption = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_SM4),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_SM4_KEY_SIZE_128),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT)
        ]
      };
      cipherOption = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_SM4),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_SM4_KEY_SIZE_128),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
          GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CFB),
          GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE),
          GenParam(huks.HuksTag.HUKS_TAG_IV, StringToUint8Array("0000000000000000")),
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
     * @tc.number : SUB_Security_HUKS_Cipher_SM4_API12_Func_0100
     * @tc.name   : test sm4 CFB module cipher by three steps finish, 240B data, process success
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_0100";
      let preText: string = testNumber + GetDataBySize(240 - testNumber.length);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CFB);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_INFO, StringToUint8Array("0000000000000000"));
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_SALT, StringToUint8Array("0000000000000000"));
      try {
        let res: boolean = await cipherWithText(genKeyOption, cipherOption, preText);
        expect(res).assertEqual(true);
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_SM4_API12_Func_0200
     * @tc.name   : test sm4 CFB module cipher by three steps abort, 240B data, process success
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_0200";
      let preText: string = testNumber + GetDataBySize(240 - testNumber.length);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CFB);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      try {
        let res: boolean = await cipherAbortWithText(genKeyOption, cipherOption, preText);
        expect(res).assertEqual(true);
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_SM4_API12_Func_0300
     * @tc.name   : test sm4 CFB module cipher by two steps finish, 240B data, process success
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_0300";
      let preData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(testNumber + GetDataBySize(240 - testNumber.length))
      }
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CFB);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      try {
        // let res: boolean = await cipherOnlyFinishWithText(genKeyOption, cipherOption, preText);
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, preData);
        expect(res).assertEqual(true);
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_SM4_API12_Func_0400
     * @tc.name   : test sm4 CFB module cipher by three steps finish, 64KB data, process success
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_0400";
      let preText: string = testNumber + GetDataBySize(64 * 1024 - testNumber.length);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CFB);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      try {
        let res: boolean = await cipherWithText(genKeyOption, cipherOption, preText);
        expect(res).assertEqual(true);
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_SM4_API12_Func_0500
     * @tc.name   : test sm4 CFB module cipher by three steps finish, 240B data, callback style, process success
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_0500";
      let preText: string = testNumber + GetDataBySize(240 - testNumber.length);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CFB);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      try {
        let res: boolean = await cipherWithTextCallback(genKeyOption, cipherOption, preText);
        expect(res).assertEqual(true);
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_SM4_API12_Func_0600
     * @tc.name   : test sm4 CFB module cipher with unsupported padding pkcs7, process fail
     * @tc.desc   : generate key, init
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_0600";
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CFB);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        await huks.initSession(testNumber, cipherOption);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_SM4_API12_Func_0700
     * @tc.name   : test sm4 CFB module cipher without iv tag, process fail
     * @tc.desc   : generate key, init
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_0700";
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CFB);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      DeleteParam(cipherOption, huks.HuksTag.HUKS_TAG_IV);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        await huks.initSession(testNumber, cipherOption);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_SM4_API12_Func_0800
     * @tc.name   : test sm4 OFB module cipher by three steps finish, 240B data, process success
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_0800";
      let preText: string = testNumber + GetDataBySize(240 - testNumber.length);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_OFB);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_INFO, StringToUint8Array("0000000000000000"));
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_SALT, StringToUint8Array("0000000000000000"));
      try {
        let res: boolean = await cipherWithText(genKeyOption, cipherOption, preText);
        expect(res).assertEqual(true);
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_SM4_API12_Func_0900
     * @tc.name   : test sm4 OFB module cipher by three steps abort, 240B data, process success
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_0900";
      let preText: string = testNumber + GetDataBySize(240 - testNumber.length);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_OFB);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      try {
        let res: boolean = await cipherAbortWithText(genKeyOption, cipherOption, preText);
        expect(res).assertEqual(true);
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_SM4_API12_Func_1000
     * @tc.name   : test sm4 OFB module cipher by two steps finish, 240B data, process success
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_1000";
      let preText: string = testNumber + GetDataBySize(240 - testNumber.length);
      let preData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(testNumber + GetDataBySize(240 - testNumber.length))
      }
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_OFB);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      try {
        // let res: boolean = await cipherOnlyFinishWithText(genKeyOption, cipherOption, preText);
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, preData);
        expect(res).assertEqual(true);
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_SM4_API12_Func_1100
     * @tc.name   : test sm4 OFB module cipher by three steps finish, 64KB data, process success
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_1100";
      let preText: string = testNumber + GetDataBySize(64 * 1024 - testNumber.length);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_OFB);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      try {
        let res: boolean = await cipherWithText(genKeyOption, cipherOption, preText);
        expect(res).assertEqual(true);
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_SM4_API12_Func_1200
     * @tc.name   : test sm4 OFB module cipher by three steps finish, 240B data, callback style, process success
     * @tc.desc   : generate key, encrypt, decrypt
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_1200";
      let preText: string = testNumber + GetDataBySize(240 - testNumber.length);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_OFB);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      try {
        let res: boolean = await cipherWithTextCallback(genKeyOption, cipherOption, preText);
        expect(res).assertEqual(true);
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_SM4_API12_Func_1300
     * @tc.name   : test sm4 OFB module cipher with unsupported padding pkcs7, process fail
     * @tc.desc   : generate key, init
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_1300";
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_OFB);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        await huks.initSession(testNumber, cipherOption);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_SM4_API12_Func_1400
     * @tc.name   : test sm4 OFB module cipher without iv tag, process fail
     * @tc.desc   : generate key, init
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_1400";
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_OFB);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      DeleteParam(cipherOption, huks.HuksTag.HUKS_TAG_IV);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        await huks.initSession(testNumber, cipherOption);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_SM4_API12_Func_1500
     * @tc.name   : test sm4 CFB module cipher with empty iv tag, process fail
     * @tc.desc   : generate key, init
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_1500";
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CFB);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_IV, new Uint8Array);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        await huks.initSession(testNumber, cipherOption);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_SM4_API12_Func_1600
     * @tc.name   : test sm4 CFB module cipher with empty salt tag, process fail
     * @tc.desc   : generate key, init
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_1600";
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CFB);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_SALT, new Uint8Array);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        await huks.initSession(testNumber, cipherOption);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_SM4_API12_Func_1700
     * @tc.name   : test sm4 OFB module cipher with empty iv tag, process fail
     * @tc.desc   : generate key, init
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_1700";
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_OFB);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_IV, new Uint8Array);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        await huks.initSession(testNumber, cipherOption);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_Cipher_SM4_API12_Func_1800
     * @tc.name   : test sm4 OFB module cipher with empty salt tag, process fail
     * @tc.desc   : generate key, init
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_1800";
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_OFB);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_SALT, new Uint8Array);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        await huks.initSession(testNumber, cipherOption);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
      }
    })

  }
  )
}