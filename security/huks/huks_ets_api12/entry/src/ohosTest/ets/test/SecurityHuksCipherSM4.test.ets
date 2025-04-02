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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import huks from '@ohos.security.huks';
import { setParam, genParam, getDataBySize, deleteParam } from './utils/HuksOptionUtil';
import { stringToUint8Array } from './utils/CommonUtil';
import {
  cipherAbortWithText,
  cipherOnlyFinishWithText,
  cipherWithText,
  cipherWithTextCallback
} from './utils/CipherUtil';


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
          genParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_SM4),
          genParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_SM4_KEY_SIZE_128),
          genParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT)
        ]
      };
      cipherOption = {
        properties: [
          genParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_SM4),
          genParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_SM4_KEY_SIZE_128),
          genParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
          genParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CFB),
          genParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE),
          genParam(huks.HuksTag.HUKS_TAG_IV, stringToUint8Array("0000000000000000")),
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
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_0100', 0, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_0100";
      let preText: string = testNumber + getDataBySize(240 - testNumber.length);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CFB);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_INFO, stringToUint8Array("0000000000000000"));
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_SALT, stringToUint8Array("0000000000000000"));
      try {
        let res: boolean = await cipherWithText(genKeyOption, cipherOption, preText);
        expect(res).assertEqual(true);
      } catch (err) {
        console.log(testNumber + `: catch error ${err.code}`);
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
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_0200', 0, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_0200";
      let preText: string = testNumber + getDataBySize(240 - testNumber.length);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CFB);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      try {
        let res: boolean = await cipherAbortWithText(genKeyOption, cipherOption, preText);
        expect(res).assertEqual(true);
      } catch (err) {
        console.log(testNumber + `: catch error ${err.code}`);
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
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_0300', 0, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_0300";
      let preText: string = testNumber + getDataBySize(240 - testNumber.length);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CFB);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      try {
        let res: boolean = await cipherOnlyFinishWithText(genKeyOption, cipherOption, preText);
        expect(res).assertEqual(true);
      } catch (err) {
        console.log(testNumber + `: catch error ${err.code}`);
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
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_0400', 0, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_0400";
      let preText: string = testNumber + getDataBySize(64 * 1024 - testNumber.length);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CFB);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      try {
        let res: boolean = await cipherWithText(genKeyOption, cipherOption, preText);
        expect(res).assertEqual(true);
      } catch (err) {
        console.log(testNumber + `: catch error ${err.code}`);
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
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_0500', 0, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_0500";
      let preText: string = testNumber + getDataBySize(240 - testNumber.length);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CFB);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      try {
        let res: boolean = await cipherWithTextCallback(genKeyOption, cipherOption, preText);
        expect(res).assertEqual(true);
      } catch (err) {
        console.log(testNumber + `: catch error ${err.code}`);
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
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_0600', 0, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_0600";
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CFB);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        await huks.initSession(testNumber, cipherOption);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + `: catch error ${err.code}`);
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
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_0700', 0, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_0700";
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CFB);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      deleteParam(cipherOption, huks.HuksTag.HUKS_TAG_IV);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        await huks.initSession(testNumber, cipherOption);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + `: catch error ${err.code}`);
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
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_0800', 0, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_0800";
      let preText: string = testNumber + getDataBySize(240 - testNumber.length);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_OFB);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_INFO, stringToUint8Array("0000000000000000"));
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_SALT, stringToUint8Array("0000000000000000"));
      try {
        let res: boolean = await cipherWithText(genKeyOption, cipherOption, preText);
        expect(res).assertEqual(true);
      } catch (err) {
        console.log(testNumber + `: catch error ${err.code}`);
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
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_0900', 0, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_0900";
      let preText: string = testNumber + getDataBySize(240 - testNumber.length);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_OFB);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      try {
        let res: boolean = await cipherAbortWithText(genKeyOption, cipherOption, preText);
        expect(res).assertEqual(true);
      } catch (err) {
        console.log(testNumber + `: catch error ${err.code}`);
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
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_1000', 0, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_1000";
      let preText: string = testNumber + getDataBySize(240 - testNumber.length);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_OFB);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      try {
        let res: boolean = await cipherOnlyFinishWithText(genKeyOption, cipherOption, preText);
        expect(res).assertEqual(true);
      } catch (err) {
        console.log(testNumber + `: catch error ${err.code}`);
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
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_1100', 0, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_1100";
      let preText: string = testNumber + getDataBySize(64 * 1024 - testNumber.length);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_OFB);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      try {
        let res: boolean = await cipherWithText(genKeyOption, cipherOption, preText);
        expect(res).assertEqual(true);
      } catch (err) {
        console.log(testNumber + `: catch error ${err.code}`);
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
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_1200', 0, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_1200";
      let preText: string = testNumber + getDataBySize(240 - testNumber.length);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_OFB);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      try {
        let res: boolean = await cipherWithTextCallback(genKeyOption, cipherOption, preText);
        expect(res).assertEqual(true);
      } catch (err) {
        console.log(testNumber + `: catch error ${err.code}`);
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
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_1300', 0, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_1300";
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_OFB);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        await huks.initSession(testNumber, cipherOption);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + `: catch error ${err.code}`);
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
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_1400', 0, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_1400";
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_OFB);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      deleteParam(cipherOption, huks.HuksTag.HUKS_TAG_IV);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        await huks.initSession(testNumber, cipherOption);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + `: catch error ${err.code}`);
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
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_1500', 0, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_1500";
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CFB);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_IV, new Uint8Array);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        await huks.initSession(testNumber, cipherOption);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + `: catch error ${err.code}`);
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
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_1600', 0, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_1600";
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CFB);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_SALT, new Uint8Array);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        await huks.initSession(testNumber, cipherOption);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + `: catch error ${err.code}`);
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
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_1700', 0, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_1700";
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_OFB);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_IV, new Uint8Array);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        await huks.initSession(testNumber, cipherOption);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + `: catch error ${err.code}`);
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
    it('SUB_Security_HUKS_Cipher_SM4_API12_Func_1800', 0, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_SM4_API12_Func_1800";
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_OFB);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      setParam(cipherOption, huks.HuksTag.HUKS_TAG_SALT, new Uint8Array);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        await huks.initSession(testNumber, cipherOption);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + `: catch error ${err.code}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
      }
    })

  }
  )
}