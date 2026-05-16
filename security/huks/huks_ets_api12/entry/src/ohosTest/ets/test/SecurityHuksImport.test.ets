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
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import huks from '@ohos.security.huks';
import { GenParam } from './utils/huks/HuksOptionsUtils.ets';
import { GetDataBySize, StringToUint8Array } from './utils/common/CommonUtils.ets';
import { Cipher, CipherData } from './utils/huks/CipherUtils.ets';
import { GetDesImportData, GetRsaImportData } from './utils/huks/ImportKeyUtils.ets';
import { SignVerify, SignVerifyData } from './utils/huks/SignVerifyUtils.ets';
import { Logger } from './utils/common/Logger.ets';


export default function SecurityHuksImportTest() {

  describe('SecurityHuksImportTest', () => {

    /**
     * @tc.name   SUB_Security_HUKS_Import_API16_Func_0100
     * @tc.number SUB_Security_HUKS_Import_API16_Func_0100
     * @tc.desc   import key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Import_API16_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Import_API16_Func_0100";
      let keySize = 1032;
      let importKeyOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_RSA),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT),
          GenParam(huks.HuksTag.HUKS_TAG_IMPORT_KEY_TYPE, huks.HuksImportKeyType.HUKS_KEY_TYPE_KEY_PAIR),
        ],
        inData: GetRsaImportData(keySize)
      };
      let cipherOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_RSA),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
          GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB),
          GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA1),
          GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE),
        ]
      }
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(keySize / 8)),
      }
      try {
        await huks.importKeyItem(testNumber, importKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Import_API16_Func_0200
     * @tc.number SUB_Security_HUKS_Import_API16_Func_0200
     * @tc.desc   import key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Import_API16_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Import_API16_Func_0200";
      let keySize = 1032;
      let importKeyOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_RSA),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY),
          GenParam(huks.HuksTag.HUKS_TAG_IMPORT_KEY_TYPE, huks.HuksImportKeyType.HUKS_KEY_TYPE_KEY_PAIR),
        ],
        inData: GetRsaImportData(keySize)
      };
      let signVerifyOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_RSA),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN),
          GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE),
          GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS1_V1_5),
        ]
      }
      let signVerifyData: SignVerifyData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(32)),
        signatureData: null
      }
      try {
        await huks.importKeyItem(testNumber, importKeyOption);
        let res: boolean = await SignVerify(testNumber, signVerifyOption, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Import_API16_Func_0300
     * @tc.number SUB_Security_HUKS_Cipher_SM4_API16_Func_0100
     * @tc.desc   import key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Import_API16_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API16_Func_0100";
      let keySize = 2040;
      let importKeyOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_RSA),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT),
          GenParam(huks.HuksTag.HUKS_TAG_IMPORT_KEY_TYPE, huks.HuksImportKeyType.HUKS_KEY_TYPE_KEY_PAIR),
        ],
        inData: GetRsaImportData(keySize)
      };
      let cipherOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_RSA),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
          GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB),
          GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA1),
          GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE),
        ]
      }
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(keySize / 8)),
      }
      try {
        await huks.importKeyItem(testNumber, importKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Import_API16_Func_0400
     * @tc.number SUB_Security_HUKS_Import_API16_Func_0400
     * @tc.desc   import key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Import_API16_Func_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Import_API16_Func_0400";
      let keySize = 2040;
      let importKeyOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_RSA),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY),
          GenParam(huks.HuksTag.HUKS_TAG_IMPORT_KEY_TYPE, huks.HuksImportKeyType.HUKS_KEY_TYPE_KEY_PAIR),
        ],
        inData: GetRsaImportData(keySize)
      };
      let signVerifyOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_RSA),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN),
          GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE),
          GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS1_V1_5),
        ]
      }
      let signVerifyData: SignVerifyData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(32)),
        signatureData: null
      }
      try {
        await huks.importKeyItem(testNumber, importKeyOption);
        let res: boolean = await SignVerify(testNumber, signVerifyOption, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Import_API16_Func_0500
     * @tc.number SUB_Security_HUKS_Import_API16_Func_0500
     * @tc.desc   import key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Import_API16_Func_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Import_API16_Func_0500";
      let keySize = 1016;
      let importKeyOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_RSA),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY),
          GenParam(huks.HuksTag.HUKS_TAG_IMPORT_KEY_TYPE, huks.HuksImportKeyType.HUKS_KEY_TYPE_KEY_PAIR),
        ],
        inData: GetRsaImportData(keySize)
      };
      try {
        await huks.importKeyItem(testNumber, importKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000003);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Import_API16_Func_0600
     * @tc.number SUB_Security_HUKS_Import_API16_Func_0600
     * @tc.desc   import key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Import_API16_Func_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Import_API16_Func_0600";
      let keySize = 2056;
      let importKeyOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_RSA),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY),
          GenParam(huks.HuksTag.HUKS_TAG_IMPORT_KEY_TYPE, huks.HuksImportKeyType.HUKS_KEY_TYPE_KEY_PAIR),
        ],
        inData: GetRsaImportData(1032)
      };
      try {
        await huks.importKeyItem(testNumber, importKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000003);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Import_API16_Func_0700
     * @tc.number SUB_Security_HUKS_Import_API16_Func_0700
     * @tc.desc   import key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Import_API16_Func_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Import_API16_Func_0700";
      let importKeyOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_DES),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_DES_KEY_SIZE_64),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT),
        ],
        inData: GetDesImportData(64)
      };
      let cipherOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_DES),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_DES_KEY_SIZE_64),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
          GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB),
          GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE),
        ]
      }
      let cipherData: CipherData = {
        updateDataArr: [StringToUint8Array(GetDataBySize(64))],
        finishData: StringToUint8Array(GetDataBySize(64)),
      }
      try {
        await huks.importKeyItem(testNumber, importKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Import_API16_Func_0800
     * @tc.number SUB_Security_HUKS_Import_API16_Func_0800
     * @tc.desc   import key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Import_API16_Func_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Import_API16_Func_0800";
      let keySize = 128;
      let importKeyOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_DES),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT)
        ],
        inData: GetDesImportData(keySize)
      };
      try {
        await huks.importKeyItem(testNumber, importKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Import_API16_Func_0900
     * @tc.number SUB_Security_HUKS_Import_API16_Func_0900
     * @tc.desc   import key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Import_API16_Func_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Import_API16_Func_0900";
      let keySize = 128;
      let importKeyOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_3DES),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT)
        ],
        inData: GetDesImportData(keySize)
      };
      let cipherOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_3DES),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
          GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB),
          GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE),
        ]
      }
      let cipherData: CipherData = {
        updateDataArr: [StringToUint8Array(GetDataBySize(64))],
        finishData: StringToUint8Array(GetDataBySize(64)),
      }
      try {
        await huks.importKeyItem(testNumber, importKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Import_API16_Func_1000
     * @tc.number SUB_Security_HUKS_Import_API16_Func_1000
     * @tc.desc   import key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Import_API16_Func_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Import_API16_Func_1000";
      let keySize = 192;
      let importKeyOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_3DES),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT)
        ],
        inData: GetDesImportData(keySize)
      };
      let cipherOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_3DES),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
          GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB),
          GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE),
        ]
      }
      let cipherData: CipherData = {
        updateDataArr: [StringToUint8Array(GetDataBySize(64))],
        finishData: StringToUint8Array(GetDataBySize(64)),
      }
      try {
        await huks.importKeyItem(testNumber, importKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Import_API16_Func_1100
     * @tc.number SUB_Security_HUKS_Import_API16_Func_1100
     * @tc.desc   import key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Import_API16_Func_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Import_API16_Func_1100";
      let keySize = 64;
      let importKeyOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_3DES),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT)
        ],
        inData: GetDesImportData(keySize)
      };
      try {
        await huks.importKeyItem(testNumber, importKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Import_API16_Func_1200
     * @tc.number SUB_Security_HUKS_Import_API16_Func_1200
     * @tc.desc   import key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Import_API16_Func_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Import_API16_Func_1200";
      let keySize = 256;
      let importKeyOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_3DES),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT)
        ],
        inData: GetDesImportData(keySize)
      };
      try {
        await huks.importKeyItem(testNumber, importKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    })

  }
  )
}