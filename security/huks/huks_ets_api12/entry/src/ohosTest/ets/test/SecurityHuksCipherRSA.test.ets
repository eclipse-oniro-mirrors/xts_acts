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
import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import huks from '@ohos.security.huks';
import { GenParam, SetParam } from './utils/huks/HuksOptionsUtils.ets';
import { GetDataBySize, StringToUint8Array } from './utils/common/CommonUtils.ets';
import { Cipher, CipherData } from './utils/huks/CipherUtils.ets';
import { Logger } from './utils/common/Logger.ets';
import { GetRsaGenerateOptions } from './utils/huks/GenerateKeyUtils.ets';


export default function SecurityHuksCipherRSATest() {
  let genKeyOption: huks.HuksOptions;
  let cipherOption: huks.HuksOptions;

  describe('SecurityHuksCipherRSATest', () => {

    beforeEach(() => {
      genKeyOption = GetRsaGenerateOptions(1024);
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

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_RSA_API16_Func_0100
     * @tc.number SUB_Security_HUKS_Cipher_RSA_API16_Func_0100
     * @tc.desc   generate key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_RSA_API16_Func_0200
     * @tc.number SUB_Security_HUKS_Cipher_RSA_API16_Func_0200
     * @tc.desc   generate key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_RSA_API16_Func_0300
     * @tc.number SUB_Security_HUKS_Cipher_RSA_API16_Func_0300
     * @tc.desc   generate key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_RSA_API16_Func_0400
     * @tc.number SUB_Security_HUKS_Cipher_RSA_API16_Func_0400
     * @tc.desc   generate key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_RSA_API16_Func_0500
     * @tc.number SUB_Security_HUKS_Cipher_RSA_API16_Func_0500
     * @tc.desc   generate key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_RSA_API16_Func_0600
     * @tc.number SUB_Security_HUKS_Cipher_RSA_API16_Func_0600
     * @tc.desc   generate key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_RSA_API16_Func_0700
     * @tc.number SUB_Security_HUKS_Cipher_RSA_API16_Func_0700
     * @tc.desc   generate key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_RSA_API16_Func_0800
     * @tc.number SUB_Security_HUKS_Cipher_RSA_API16_Func_0800
     * @tc.desc   generate key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_RSA_API16_Func_0900
     * @tc.number SUB_Security_HUKS_Cipher_RSA_API16_Func_0900
     * @tc.desc   generate key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_RSA_API16_Func_1000
     * @tc.number SUB_Security_HUKS_Cipher_RSA_API16_Func_1000
     * @tc.desc   generate key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_RSA_API16_Func_1100
     * @tc.number SUB_Security_HUKS_Cipher_RSA_API16_Func_1100
     * @tc.desc   generate key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Cipher_RSA_API16_Func_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_RSA_API16_Func_1100";
      let keySize = 1016;
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000003);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_RSA_API16_Func_1200
     * @tc.number SUB_Security_HUKS_Cipher_RSA_API16_Func_1200
     * @tc.desc   generate key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Cipher_RSA_API16_Func_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_RSA_API16_Func_1200";
      let keySize = 2056;
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000003);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_RSA_API16_Func_1300
     * @tc.number SUB_Security_HUKS_Cipher_RSA_API16_Func_1300
     * @tc.desc   generate key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Cipher_RSA_API16_Func_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_RSA_API16_Func_1300";
      let keySize = 1025;
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(12000003);
        }
      }
    })


  }
  )
}