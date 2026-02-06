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
import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import huks from '@ohos.security.huks';
import * as huksCallback from './utils/huks/HuksCallbackUtils.ets';
import { Logger } from './utils/common/Logger.ets';
import { StringToUint8Array } from './utils/common/CommonUtils.ets';
import { MergeOptions, SetParam, SetMultiParam, DeleteParam, CheckSoftware } from './utils/huks/HuksOptionsUtils.ets';
import { GetAesGenerateOptions } from './utils/huks/GenerateKeyUtils.ets';
import {
  CipherData,
  GetCcmNoPaddingOptions,
  BuildCipherData,
  CipherForCcm,
  CompareCipherData,
  PrintCipherData,
  DoCipher,
  GetCipherDataLenArr,
  ReBuildCipherData,
  CipherForGcm
} from './utils/huks/CipherUtils.ets';
import { GetDataBySize } from './utils/common/CommonUtils.ets';
import { GetGcmNoPaddingOptions } from './utils/huks/CipherUtils.ets';


export default function SecurityHuksCipherAesTest() {
  let genKeyOptions: huks.HuksOptions;
  let cipherOptions: huks.HuksOptions;
  let useSoftware: boolean = true;

  describe('SecurityHuksCipherAesTest', () => {

    beforeAll(async () => {
      useSoftware = await CheckSoftware();
    })

    beforeEach(() => {
      genKeyOptions = GetAesGenerateOptions(128);
      cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetCcmNoPaddingOptions());
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_0100
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_0100
     * @tc.desc   test aes ccm noPadding cipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_0100";
      let cipherData: CipherData = BuildCipherData([64]);
      let tagLength: number = 4;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_0200
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_0200
     * @tc.desc   test aes ccm noPadding cipher, 1B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_0200";
      let cipherData: CipherData = BuildCipherData([1]);
      let tagLength: number = 4;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_0300
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_0300
     * @tc.desc   test aes ccm noPadding cipher, 31+32B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_0300";
      let cipherData: CipherData = BuildCipherData([31, 32]);
      let tagLength: number = 4;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_0400
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_0400
     * @tc.desc   test aes ccm noPadding cipher, 32+32+1B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_0400";
      let cipherData: CipherData = BuildCipherData([32, 32, 1]);
      let tagLength: number = 4;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_0500
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_0500
     * @tc.desc   test aes ccm noPadding cipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_0500";
      let cipherData: CipherData = BuildCipherData([64]);
      let tagLength: number = 6;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_0600
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_0600
     * @tc.desc   test aes ccm noPadding cipher, 64B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_0600";
      let cipherData: CipherData = BuildCipherData([64]);
      let tagLength: number = 8;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_0700
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_0700
     * @tc.desc   test aes ccm noPadding cipher, 64B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_0700";
      let cipherData: CipherData = BuildCipherData([64]);
      let tagLength: number = 10;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_0800
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_0800
     * @tc.desc   test aes ccm noPadding cipher, 1B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_0800";
      let cipherData: CipherData = BuildCipherData([1]);
      let tagLength: number = 10;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_0900
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_0900
     * @tc.desc   test aes ccm noPadding cipher, 31+32B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_0900";
      let cipherData: CipherData = BuildCipherData([31, 32]);
      let tagLength: number = 10;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_1000
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_1000
     * @tc.desc   test aes ccm noPadding cipher, 32+32+1B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_1000";
      let cipherData: CipherData = BuildCipherData([32, 32, 1]);
      let tagLength: number = 10;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_1100
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_1100
     * @tc.desc   test aes ccm noPadding cipher, 64B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_1100";
      let cipherData: CipherData = BuildCipherData([64]);
      let tagLength: number = 12;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_1200
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_1200
     * @tc.desc   test aes ccm noPadding cipher, 64B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_1200";
      let cipherData: CipherData = BuildCipherData([64]);
      let tagLength: number = 14;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_1300
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_1300
     * @tc.desc   test aes ccm noPadding cipher, 64B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_1300";
      let cipherData: CipherData = BuildCipherData([64]);
      let tagLength: number = 16;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_1400
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_1400
     * @tc.desc   test aes ccm noPadding cipher, 64B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_1400";
      let cipherData: CipherData = BuildCipherData([64]);
      let tagLength: number = 16;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_1500
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_1500
     * @tc.desc   test aes ccm noPadding cipher, 1B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_1500";
      let cipherData: CipherData = BuildCipherData([1]);
      let tagLength: number = 16;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_1600
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_1600
     * @tc.desc   test aes ccm noPadding cipher, 31+32B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_1600";
      let cipherData: CipherData = BuildCipherData([31, 32]);
      let tagLength: number = 16;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        let encryptResult: CipherData;
        let decryptResult: CipherData;
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        PrintCipherData(cipherData);
        encryptResult = await DoCipher(testNumber, cipherOptions, cipherData);
        PrintCipherData(encryptResult);
        expect(GetCipherDataLenArr(encryptResult).join(",")).assertEqual([0, 79].join(","));
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        encryptResult.updateDataArr = new Array();
        let offset = encryptResult.finishData!.length - tagLength;
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG, encryptResult.finishData!.slice(offset) as Uint8Array);
        encryptResult.finishData = encryptResult.finishData!.slice(0, offset) as Uint8Array;
        ReBuildCipherData(encryptResult, [31, 32]);
        PrintCipherData(encryptResult);
        decryptResult = await DoCipher(testNumber, cipherOptions, encryptResult);
        PrintCipherData(decryptResult);
        expect(GetCipherDataLenArr(decryptResult).join(",")).assertEqual([0, 63].join(","));
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_1700
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_1700
     * @tc.desc   test aes ccm noPadding cipher, 32+32+1B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_1700";
      let cipherData: CipherData = BuildCipherData([32, 32, 1]);
      let tagLength: number = 16;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        let encryptResult: CipherData;
        let decryptResult: CipherData;
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        PrintCipherData(cipherData);
        encryptResult = await DoCipher(testNumber, cipherOptions, cipherData);
        PrintCipherData(encryptResult);
        expect(GetCipherDataLenArr(encryptResult).join(",")).assertEqual([0, 0, 81].join(","));
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        encryptResult.updateDataArr = new Array();
        let offset = encryptResult.finishData!.length - tagLength;
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG, encryptResult.finishData!.slice(offset) as Uint8Array);
        encryptResult.finishData = encryptResult.finishData!.slice(0, offset) as Uint8Array;
        ReBuildCipherData(encryptResult, [32, 32, 1]);
        PrintCipherData(encryptResult);
        decryptResult = await DoCipher(testNumber, cipherOptions, encryptResult);
        PrintCipherData(decryptResult);
        expect(GetCipherDataLenArr(decryptResult).join(",")).assertEqual([0, 0, 65].join(","));
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_1800
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_1800
     * @tc.desc   test aes ccm noPadding cipher with unsupported ae tag length, error code 12000003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_1800";
      let tagLength: number = 0;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        await huks.initSession(testNumber, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_1900
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_1900
     * @tc.desc   test aes ccm noPadding cipher with unsupported ae tag length, error code 12000003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_1900";
      let tagLength: number = 2;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        await huks.initSession(testNumber, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_2000
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_2000
     * @tc.desc   test aes ccm noPadding cipher with unsupported ae tag length, error code 12000003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_2000";
      let tagLength: number = 3;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        await huks.initSession(testNumber, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_2100
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_2100
     * @tc.desc   test aes ccm noPadding cipher with unsupported ae tag length, error code 12000003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_2100";
      let tagLength: number = 5;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        await huks.initSession(testNumber, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_2200
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_2200
     * @tc.desc   test aes ccm noPadding cipher with unsupported ae tag length, error code 12000003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_2200";
      let tagLength: number = 7;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        await huks.initSession(testNumber, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_2300
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_2300
     * @tc.desc   test aes ccm noPadding cipher with unsupported ae tag length, error code 12000003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_2300";
      let tagLength: number = 9;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        await huks.initSession(testNumber, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_2400
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_2400
     * @tc.desc   test aes ccm noPadding cipher with unsupported ae tag length, error code 12000003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_2400";
      let tagLength: number = 11;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        await huks.initSession(testNumber, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_2500
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_2500
     * @tc.desc   test aes ccm noPadding cipher with unsupported ae tag length, error code 12000003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_2500";
      let tagLength: number = 13;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        await huks.initSession(testNumber, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_2600
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_2600
     * @tc.desc   test aes ccm noPadding cipher with unsupported ae tag length, error code 12000003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_2600";
      let tagLength: number = 15;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        await huks.initSession(testNumber, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_2700
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_2700
     * @tc.desc   test aes ccm noPadding cipher with unsupported ae tag length, error code 12000003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_2700";
      let tagLength: number = 17;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        await huks.initSession(testNumber, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_2800
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_2800
     * @tc.desc   test aes ccm noPadding cipher with unsupported ae tag length, error code 12000003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_2800";
      let tagLength: number = 18;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        await huks.initSession(testNumber, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_2900
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_2900
     * @tc.desc   test aes ccm noPadding cipher with unsupported ae tag length, error code 12000003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_2900";
      let cipherData: CipherData = BuildCipherData([64]);
      let tagLength: number = 16;
      await huks.generateKeyItem(testNumber, genKeyOptions);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
      let encryptResult: CipherData;
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      PrintCipherData(cipherData);
      encryptResult = await DoCipher(testNumber, cipherOptions, cipherData);
      PrintCipherData(encryptResult);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
      encryptResult.updateDataArr = new Array();
      try {
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, 15);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG, encryptResult.finishData!.slice(encryptResult.finishData!.length - 15) as Uint8Array);
        await huks.initSession(testNumber, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_3000
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_3000
     * @tc.desc   test aes ccm noPadding cipher with inconsistent ae tag length, error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_3000";
      let cipherData: CipherData = BuildCipherData([64]);
      let tagLength: number = 16;
      await huks.generateKeyItem(testNumber, genKeyOptions);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
      let encryptResult: CipherData;
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      PrintCipherData(cipherData);
      encryptResult = await DoCipher(testNumber, cipherOptions, cipherData);
      PrintCipherData(encryptResult);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
      encryptResult.updateDataArr = new Array();
      try {
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, 14);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG, encryptResult.finishData!.slice(encryptResult.finishData!.length - 14) as Uint8Array);
        encryptResult.finishData = encryptResult.finishData!.slice(0, encryptResult.finishData!.length - tagLength) as Uint8Array;
        PrintCipherData(encryptResult);
        await DoCipher(testNumber, cipherOptions, encryptResult);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (useSoftware) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_CRYPTO_FAIL);
        } else {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_3100
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_3100
     * @tc.desc   test aes ccm noPadding cipher with unsupported ae tag length, error code 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_3100";
      let cipherData: CipherData = BuildCipherData([64]);
      await huks.generateKeyItem(testNumber, genKeyOptions);
      let encryptResult: CipherData;
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      PrintCipherData(cipherData);
      encryptResult = await DoCipher(testNumber, cipherOptions, cipherData);
      PrintCipherData(encryptResult);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
      encryptResult.updateDataArr = new Array();
      try {
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG, encryptResult.finishData!.slice(encryptResult.finishData!.length - 15) as Uint8Array);
        await huks.initSession(testNumber, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_3110
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_3110
     * @tc.desc   test aes ccm noPadding cipher with unsupported ae tag length, error code 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_3110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_3110";
      let cipherData: CipherData = BuildCipherData([64]);
      await huks.generateKeyItem(testNumber, genKeyOptions);
      let encryptResult: CipherData;
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      PrintCipherData(cipherData);
      encryptResult = await DoCipher(testNumber, cipherOptions, cipherData);
      PrintCipherData(encryptResult);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
      encryptResult.updateDataArr = new Array();
      try {
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG, encryptResult.finishData!.slice(encryptResult.finishData!.length - 15) as Uint8Array);
        await huksCallback.initSession(testNumber, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_3200
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_3200
     * @tc.desc   test aes ccm noPadding cipher with inconsistent ae tag length, error code 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_3200";
      let cipherData: CipherData = BuildCipherData([64]);
      let tagLength: number = 16;
      await huks.generateKeyItem(testNumber, genKeyOptions);
      let encryptResult: CipherData;
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      PrintCipherData(cipherData);
      encryptResult = await DoCipher(testNumber, cipherOptions, cipherData);
      PrintCipherData(encryptResult);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
      encryptResult.updateDataArr = new Array();
      try {
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, 14);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG, encryptResult.finishData!.slice(encryptResult.finishData!.length - tagLength) as Uint8Array);
        await huks.initSession(testNumber, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_3300
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_3300
     * @tc.desc   test aes ccm noPadding cipher with inconsistent ae tag length, error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_3300";
      let cipherData: CipherData = BuildCipherData([64]);
      let tagLength: number = 12;
      await huks.generateKeyItem(testNumber, genKeyOptions);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
      let encryptResult: CipherData;
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      PrintCipherData(cipherData);
      encryptResult = await DoCipher(testNumber, cipherOptions, cipherData);
      PrintCipherData(encryptResult);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
      encryptResult.updateDataArr = new Array();
      try {
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, 16);
        let aeTag = encryptResult.finishData!.slice(encryptResult.finishData!.length - tagLength) as Uint8Array;
        aeTag = new Uint8Array([0, 0, 0, 0, ...aeTag]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG, aeTag);
        encryptResult.finishData = encryptResult.finishData!.slice(0, encryptResult.finishData!.length - tagLength) as Uint8Array;
        PrintCipherData(encryptResult);
        await DoCipher(testNumber, cipherOptions, encryptResult);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (useSoftware) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_CRYPTO_FAIL);
        } else {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_3400
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_3400
     * @tc.desc   test aes ccm noPadding cipher with duplicate ae tag length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_3400";
      let tagLength: number = 16;
      await huks.generateKeyItem(testNumber, genKeyOptions);
      try {
        SetMultiParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        await huks.initSession(testNumber, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_3500
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_3500
     * @tc.desc   test aes ccm noPadding cipher, 64B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_3500";
      let cipherData: CipherData = BuildCipherData([64]);
      let tagLength: number = 4;
      let keySize = 192;
      try {
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_3600
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_3600
     * @tc.desc   test aes ccm noPadding cipher, 31+32B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_3600";
      let cipherData: CipherData = BuildCipherData([31, 32]);
      let tagLength: number = 4;
      let keySize = 192;
      try {
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_3700
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_3700
     * @tc.desc   test aes ccm noPadding cipher, 32+32+1B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_3700";
      let cipherData: CipherData = BuildCipherData([32, 32, 1]);
      let tagLength: number = 4;
      let keySize = 192;
      try {
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_3800
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_3800
     * @tc.desc   test aes ccm noPadding cipher, 64B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_3800";
      let cipherData: CipherData = BuildCipherData([64]);
      let tagLength: number = 8;
      let keySize = 192;
      try {
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_3900
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_3900
     * @tc.desc   test aes ccm noPadding cipher, 31+32B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_3900";
      let cipherData: CipherData = BuildCipherData([31, 32]);
      let tagLength: number = 8;
      let keySize = 192;
      try {
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_4000
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_4000
     * @tc.desc   test aes ccm noPadding cipher, 32+32+1B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_4000";
      let cipherData: CipherData = BuildCipherData([32, 32, 1]);
      let tagLength: number = 8;
      let keySize = 192;
      try {
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_4100
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_4100
     * @tc.desc   test aes ccm noPadding cipher, 64B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_4100";
      let cipherData: CipherData = BuildCipherData([64]);
      let tagLength: number = 16;
      let keySize = 192;
      try {
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_4200
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_4200
     * @tc.desc   test aes ccm noPadding cipher, 64B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_4200";
      let cipherData: CipherData = BuildCipherData([64]);
      let tagLength: number = 16;
      let keySize = 192;
      try {
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
        await huks.generateKeyItem(testNumber, genKeyOptions);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_4300
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_4300
     * @tc.desc   test aes ccm noPadding cipher, 31+32B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_4300";
      let cipherData: CipherData = BuildCipherData([31, 32]);
      let tagLength: number = 16;
      let keySize = 192;
      try {
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
        await huks.generateKeyItem(testNumber, genKeyOptions);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_4400
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_4400
     * @tc.desc   test aes ccm noPadding cipher, 32+32+1B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_4400";
      let cipherData: CipherData = BuildCipherData([32, 32, 1]);
      let tagLength: number = 16;
      let keySize = 192;
      try {
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
        await huks.generateKeyItem(testNumber, genKeyOptions);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_4500
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_4500
     * @tc.desc   test aes ccm noPadding cipher, 64B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_4500";
      let cipherData: CipherData = BuildCipherData([64]);
      let tagLength: number = 4;
      let keySize = 256;
      try {
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_4600
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_4600
     * @tc.desc   test aes ccm noPadding cipher, 31+32B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_4600";
      let cipherData: CipherData = BuildCipherData([31, 32]);
      let tagLength: number = 4;
      let keySize = 256;
      try {
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_4700
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_4700
     * @tc.desc   test aes ccm noPadding cipher, 32+32+1B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_4700";
      let cipherData: CipherData = BuildCipherData([32, 32, 1]);
      let tagLength: number = 4;
      let keySize = 256;
      try {
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_4800
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_4800
     * @tc.desc   test aes ccm noPadding cipher, 64B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_4800";
      let cipherData: CipherData = BuildCipherData([64]);
      let tagLength: number = 12;
      let keySize = 256;
      try {
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_4900
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_4900
     * @tc.desc   test aes ccm noPadding cipher, 31+32B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_4900";
      let cipherData: CipherData = BuildCipherData([31, 32]);
      let tagLength: number = 12;
      let keySize = 256;
      try {
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_5000
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_5000
     * @tc.desc   test aes ccm noPadding cipher, 32+32+1B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_5000";
      let cipherData: CipherData = BuildCipherData([32, 32, 1]);
      let tagLength: number = 12;
      let keySize = 256;
      try {
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_5100
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_5100
     * @tc.desc   test aes ccm noPadding cipher, 64B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_5100";
      let cipherData: CipherData = BuildCipherData([64]);
      let tagLength: number = 16;
      let keySize = 256;
      try {
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_5200
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_5200
     * @tc.desc   test aes ccm noPadding cipher, 64B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_5200";
      let cipherData: CipherData = BuildCipherData([64]);
      let tagLength: number = 16;
      let keySize = 256;
      try {
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
        await huks.generateKeyItem(testNumber, genKeyOptions);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_5300
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_5300
     * @tc.desc   test aes ccm noPadding cipher, 31+32B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_5300";
      let cipherData: CipherData = BuildCipherData([31, 32]);
      let tagLength: number = 16;
      let keySize = 256;
      try {
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
        await huks.generateKeyItem(testNumber, genKeyOptions);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_5400
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_5400
     * @tc.desc   test aes ccm noPadding cipher, 32+32+1B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_5400";
      let cipherData: CipherData = BuildCipherData([32, 32, 1]);
      let tagLength: number = 16;
      let keySize = 256;
      try {
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
        await huks.generateKeyItem(testNumber, genKeyOptions);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_5500
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_5500
     * @tc.desc   test aes ccm noPadding cipher without necessary padding tag, error code 12000002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_5500";
      try {
        DeleteParam(cipherOptions, huks.HuksTag.HUKS_TAG_PADDING);
        await huks.generateKeyItem(testNumber, genKeyOptions);
        await huks.initSession(testNumber, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_5600
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_5600
     * @tc.desc   test aes ccm noPadding cipher with inconsistent mode key property, error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_5600";
      try {
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_GCM);
        await huks.generateKeyItem(testNumber, genKeyOptions);
        await huks.initSession(testNumber, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_5700
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_5700
     * @tc.desc   test aes gcm noPadding cipher with ae tag length, 64B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_5700";
      cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetGcmNoPaddingOptions());
      let cipherData: CipherData = BuildCipherData([64]);
      let tagLength: number = 16;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let decryptResult: CipherData = await CipherForGcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_5800
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_5800
     * @tc.desc   test aes gcm noPadding cipher with ae tag length, 1B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_5800";
      cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetGcmNoPaddingOptions());
      let cipherData: CipherData = BuildCipherData([1]);
      let tagLength: number = 16;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_5900
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_5900
     * @tc.desc   test aes gcm noPadding cipher with ae tag length, 31+32B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_5900";
      cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetGcmNoPaddingOptions());
      let cipherData: CipherData = BuildCipherData([31, 32]);
      let tagLength: number = 16;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let encryptResult: CipherData;
        let decryptResult: CipherData;
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        PrintCipherData(cipherData);
        encryptResult = await DoCipher(testNumber, cipherOptions, cipherData);
        PrintCipherData(encryptResult);
        expect(GetCipherDataLenArr(encryptResult).join(",")).assertEqual([31, 48].join(","));
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        let offset = encryptResult.finishData!.length - tagLength;
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG, encryptResult.finishData!.slice(offset) as Uint8Array);
        encryptResult.finishData = encryptResult.finishData!.slice(0, offset) as Uint8Array;
        PrintCipherData(encryptResult);
        decryptResult = await DoCipher(testNumber, cipherOptions, encryptResult);
        PrintCipherData(decryptResult);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_6000
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_6000
     * @tc.desc   test aes gcm noPadding cipher with ae tag length, 32+32+1B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_6000";
      cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetGcmNoPaddingOptions());
      let cipherData: CipherData = BuildCipherData([32, 32, 1]);
      let tagLength: number = 16;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let encryptResult: CipherData;
        let decryptResult: CipherData;
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        PrintCipherData(cipherData);
        encryptResult = await DoCipher(testNumber, cipherOptions, cipherData);
        PrintCipherData(encryptResult);
        expect(GetCipherDataLenArr(encryptResult).join(",")).assertEqual([32, 32, 17].join(","));
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        let offset = encryptResult.finishData!.length - tagLength;
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG, encryptResult.finishData!.slice(offset) as Uint8Array);
        encryptResult.finishData = encryptResult.finishData!.slice(0, offset) as Uint8Array;
        PrintCipherData(encryptResult);
        decryptResult = await DoCipher(testNumber, cipherOptions, encryptResult);
        PrintCipherData(decryptResult);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_6100
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_6100
     * @tc.desc   test aes gcm noPadding cipher with unsupported ae tag length, error code 12000003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_6100";
      cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetGcmNoPaddingOptions());
      let tagLength: number = 14;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        await huks.initSession(testNumber, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_6200
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_6200
     * @tc.desc   test aes gcm noPadding cipher with unsupported ae tag length, error code 12000003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_6200";
      cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetGcmNoPaddingOptions());
      let tagLength: number = 15;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        await huks.initSession(testNumber, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_6300
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_6300
     * @tc.desc   test aes gcm noPadding cipher with unsupported ae tag length, error code 12000003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_6300";
      cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetGcmNoPaddingOptions());
      let tagLength: number = 17;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        await huks.initSession(testNumber, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_6400
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_6400
     * @tc.desc   test aes gcm noPadding cipher with unsupported ae tag length, error code 12000003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_6400";
      cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetGcmNoPaddingOptions());
      let tagLength: number = 18;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        await huks.initSession(testNumber, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_6500
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_6500
     * @tc.desc   test aes gcm noPadding cipher with unsupported ae tag length, error code 12000003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_6500";
      cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetGcmNoPaddingOptions());
      let cipherData: CipherData = BuildCipherData([64]);
      let tagLength: number = 16;
      await huks.generateKeyItem(testNumber, genKeyOptions);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
      let encryptResult: CipherData;
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      PrintCipherData(cipherData);
      encryptResult = await DoCipher(testNumber, cipherOptions, cipherData);
      PrintCipherData(encryptResult);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
      encryptResult.updateDataArr = new Array();
      try {
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, 14);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG, encryptResult.finishData!.slice(encryptResult.finishData!.length - 14) as Uint8Array);
        await huks.initSession(testNumber, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_6600
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_6600
     * @tc.desc   test aes gcm noPadding cipher with ae tag length, 64B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_6600";
      cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetGcmNoPaddingOptions());
      let cipherData: CipherData = BuildCipherData([64]);
      let tagLength: number = 16;
      let keySize = 192;
      try {
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let decryptResult: CipherData = await CipherForGcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_6700
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_6700
     * @tc.desc   test aes gcm noPadding cipher with ae tag length, 64B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_6700";
      cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetGcmNoPaddingOptions());
      let cipherData: CipherData = BuildCipherData([64]);
      let tagLength: number = 16;
      let keySize = 256;
      try {
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let decryptResult: CipherData = await CipherForGcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_6800
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_6800
     * @tc.desc   test aes gcm noPadding cipher without necessary padding tag, error code 12000002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_6800";
      cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetGcmNoPaddingOptions());
      try {
        DeleteParam(cipherOptions, huks.HuksTag.HUKS_TAG_PADDING);
        await huks.generateKeyItem(testNumber, genKeyOptions);
        await huks.initSession(testNumber, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_6900
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_6900
     * @tc.desc   test aes gcm noPadding cipher with inconsistent mode key property, error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_6900";
      cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetGcmNoPaddingOptions());
      try {
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CCM);
        await huks.generateKeyItem(testNumber, genKeyOptions);
        await huks.initSession(testNumber, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_7000
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_7000
     * @tc.desc   test aes ccm noPadding cipher without unnecessary aad, 64B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_7000";
      let cipherData: CipherData = BuildCipherData([64]);
      let tagLength: number = 16;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        DeleteParam(cipherOptions, huks.HuksTag.HUKS_TAG_ASSOCIATED_DATA);
        let decryptResult: CipherData = await CipherForGcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_7100
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_7100
     * @tc.desc   test aes ccm noPadding cipher with inconsistent aad, error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_7100";
      let cipherData: CipherData = BuildCipherData([64]);
      let tagLength: number = 16;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        let encryptResult: CipherData;
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        PrintCipherData(cipherData);
        encryptResult = await DoCipher(testNumber, cipherOptions, cipherData);
        PrintCipherData(encryptResult);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        encryptResult.updateDataArr = new Array();
        let offset = encryptResult.finishData!.length - tagLength;
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG, encryptResult.finishData!.slice(offset) as Uint8Array);
        encryptResult.finishData = encryptResult.finishData!.slice(0, offset) as Uint8Array;
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_ASSOCIATED_DATA, StringToUint8Array("different aad"));
        PrintCipherData(encryptResult);
        await DoCipher(testNumber, cipherOptions, encryptResult);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (useSoftware) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_CRYPTO_FAIL);
        } else {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_7200
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_7200
     * @tc.desc   test aes ccm noPadding cipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_7200";
      let cipherData: CipherData = BuildCipherData([64 * 1024 - 1]);
      let tagLength: number = 16;
      let nonceLength: number = 13;
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG_LEN, tagLength);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_NONCE, StringToUint8Array(GetDataBySize(nonceLength)));
        let decryptResult: CipherData = await CipherForCcm(testNumber, cipherOptions, cipherData, tagLength);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_7300
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_7300
     * @tc.desc   test aes ccm noPadding cipher with unsupported data length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_7300";
      let cipherData: CipherData = BuildCipherData([64 * 1024]);
      let nonceLength: number = 13;
      await huks.generateKeyItem(testNumber, genKeyOptions);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_NONCE, StringToUint8Array(GetDataBySize(nonceLength)));
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      let initRes = await huks.initSession(testNumber, cipherOptions);
      try {
        cipherOptions.inData = cipherData.finishData!;
        await huks.finishSession(initRes.handle, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (useSoftware) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_CRYPTO_FAIL);
        } else {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_7400
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_7400
     * @tc.desc   test aes ccm noPadding cipher with unsupported nonce length 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_7400";
      let cipherData: CipherData = BuildCipherData([64]);
      let nonceLength: number = 6;
      await huks.generateKeyItem(testNumber, genKeyOptions);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_NONCE, StringToUint8Array(GetDataBySize(nonceLength)));
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      let initRes = await huks.initSession(testNumber, cipherOptions);
      try {
        cipherOptions.inData = cipherData.finishData!;
        await huks.finishSession(initRes.handle, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (useSoftware) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_CRYPTO_FAIL);
        } else {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_EXTERNAL_ERROR);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_AES_API22_Func_7500
     * @tc.number SUB_Security_HUKS_Cipher_AES_API22_Func_7500
     * @tc.desc   test aes ccm noPadding cipher with unsupported nonce length 14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_Cipher_AES_API22_Func_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_AES_API22_Func_7500";
      let cipherData: CipherData = BuildCipherData([64]);
      let nonceLength: number = 14;
      await huks.generateKeyItem(testNumber, genKeyOptions);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_NONCE, StringToUint8Array(GetDataBySize(nonceLength)));
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      let initRes = await huks.initSession(testNumber, cipherOptions);
      try {
        cipherOptions.inData = cipherData.finishData!;
        await huks.finishSession(initRes.handle, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (useSoftware) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_CRYPTO_FAIL);
        } else {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_EXTERNAL_ERROR);
        }
      }
    })

  }
  )
}