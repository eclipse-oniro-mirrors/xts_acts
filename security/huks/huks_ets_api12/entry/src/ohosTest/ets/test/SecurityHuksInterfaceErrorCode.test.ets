/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { huks } from '@kit.UniversalKeystoreKit';
import * as huksCallback from './utils/HuksCallbackUtil';
import { AddParam, DeleteParam, MergeOption, SetParam } from './utils/HuksOptionUtil';
import { StringToUint8Array } from './utils/CommonUtil';
import { GetAttestKeyOption } from './options/AttestKeyOptions';
import { GetAesGenerateOption, GetEccGenerateOption } from './options/GenerateKeyOptions';
import { GetAesImportData } from './options/ImportOptions';
import { GetAccessControlOptions } from './options/AccessControlOptions';
import { BuildWrappedKeyData } from './utils/ImportWrappedKeyUtil';
import { GetAesCbcOptions } from './options/CipherOptions';


export default function SecurityHuksInterfaceErrorCodeTest() {
  let genKeyOption: huks.HuksOptions;
  let genKeyOptionMultiAlg: huks.HuksOptions;
  let genKeyOptionNoAlg: huks.HuksOptions;
  let genKeyOptionErrorAlg: huks.HuksOptions;
  let encryptOption: huks.HuksOptions;
  let encryptOptionMultiAlg: huks.HuksOptions;
  let encryptOptionNoAlg: huks.HuksOptions;
  let encryptOptionErrorAlg: huks.HuksOptions;

  describe('SecurityHuksInterfaceErrorCodeTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      genKeyOption = GetAesGenerateOption(256);
      genKeyOptionMultiAlg = AddParam(GetAesGenerateOption(256), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES);
      genKeyOptionNoAlg = DeleteParam(GetAesGenerateOption(256), huks.HuksTag.HUKS_TAG_ALGORITHM);
      genKeyOptionErrorAlg = SetParam(GetAesGenerateOption(256), huks.HuksTag.HUKS_TAG_ALGORITHM, 4);
      encryptOption = GetAesCbcOptions();
      encryptOptionMultiAlg = AddParam(GetAesCbcOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES);
      encryptOptionNoAlg = DeleteParam(GetAesCbcOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM);
      encryptOptionErrorAlg = SetParam(GetAesCbcOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, 4);
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
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_0100
     * @tc.name   : test deleteKeyItem, error code 401
     * @tc.desc   : generate key, delete
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0100', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0100";
      await huks.generateKeyItem(testNumber, genKeyOption);
      try {
        await huks.deleteKeyItem(testNumber, genKeyOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_0200
     * @tc.name   : test deleteKeyItem, error code 12000011
     * @tc.desc   : generate key, delete
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0200', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0200";
      try {
        await huks.deleteKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_0110
     * @tc.name   : test deleteKeyItem, error code 401
     * @tc.desc   : generate key, delete
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0110', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0110";
      await huksCallback.generateKeyItem(testNumber, genKeyOption);
      try {
        await huksCallback.deleteKeyItem(testNumber, genKeyOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_0210
     * @tc.name   : test deleteKeyItem, error code 12000011
     * @tc.desc   : generate key, delete
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0210', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0210";
      try {
        await huksCallback.deleteKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_0300
     * @tc.name   : test importKeyItem, error code 12000002
     * @tc.desc   : import key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0300', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0300";
      genKeyOptionNoAlg.inData = GetAesImportData(256);
      try {
        await huks.importKeyItem(testNumber, genKeyOptionNoAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_0310
     * @tc.name   : test importKeyItem, error code 12000002
     * @tc.desc   : import key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0310', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0310";
      genKeyOptionNoAlg.inData = StringToUint8Array('32012345678901234567890123456789')
      try {
        await huksCallback.importKeyItem(testNumber, genKeyOptionNoAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_0400
     * @tc.name   : test exportKeyItem, error code 401
     * @tc.desc   : generate key, export key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0400', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0400";
      genKeyOption = GetEccGenerateOption(256);
      genKeyOptionMultiAlg = AddParam(GetEccGenerateOption(256), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ECC);
      await huks.generateKeyItem(testNumber, genKeyOption);
      try {
        await huks.exportKeyItem(testNumber, genKeyOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_0500
     * @tc.name   : test exportKeyItem, error code 12000011
     * @tc.desc   : export key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0500', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0500";
      try {
        await huks.exportKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_0410
     * @tc.name   : test exportKeyItem, error code 401
     * @tc.desc   : generate key, export key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0410', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0410";
      genKeyOption = GetEccGenerateOption(256);
      genKeyOptionMultiAlg = AddParam(GetEccGenerateOption(256), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ECC);
      await huksCallback.generateKeyItem(testNumber, genKeyOption);
      try {
        await huksCallback.exportKeyItem(testNumber, genKeyOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_0510
     * @tc.name   : test exportKeyItem, error code 12000011
     * @tc.desc   : export key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0510', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0510";
      try {
        await huksCallback.exportKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_0600
     * @tc.name   : test getKeyItemProperties, error code 401
     * @tc.desc   : generate key, get key properties
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0600', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0600";
      await huks.generateKeyItem(testNumber, genKeyOption);
      try {
        await huks.getKeyItemProperties(testNumber, genKeyOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_0700
     * @tc.name   : test getKeyItemProperties, error code 12000011
     * @tc.desc   : get key properties
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0700', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0700";
      try {
        await huks.getKeyItemProperties(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_0610
     * @tc.name   : test getKeyItemProperties, error code 401
     * @tc.desc   : generate key, get key properties
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0610', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0610";
      await huksCallback.generateKeyItem(testNumber, genKeyOption);
      try {
        await huksCallback.getKeyItemProperties(testNumber, genKeyOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_0710
     * @tc.name   : test getKeyItemProperties, error code 12000011
     * @tc.desc   : get key properties
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0710', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0710";
      try {
        await huksCallback.getKeyItemProperties(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_0800
     * @tc.name   : test hasKeyItem, error code 401
     * @tc.desc   : generate key, query Key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0800', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0800";
      await huks.generateKeyItem(testNumber, genKeyOption);
      try {
        await huks.hasKeyItem(testNumber, genKeyOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_0810
     * @tc.name   : test hasKeyItem, error code 401
     * @tc.desc   : generate key, query Key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0810', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0810";
      await huksCallback.generateKeyItem(testNumber, genKeyOption);
      try {
        await huksCallback.hasKeyItem(testNumber, genKeyOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_0900
     * @tc.name   : test initSession, error code 12000011
     * @tc.desc   : init session
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0900', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0900";
      try {
        await huks.initSession(testNumber, encryptOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_0910
     * @tc.name   : test initSession, error code 12000011
     * @tc.desc   : init session
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0910', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0910";
      try {
        await huksCallback.initSession(testNumber, encryptOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_1000
     * @tc.name   : test updateSession, error code 401
     * @tc.desc   : generate key, init, update
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1000', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1000";
      await huks.generateKeyItem(testNumber, genKeyOption);
      let handle = (await huks.initSession(testNumber, encryptOption)).handle;
      try {
        await huks.updateSession(handle, encryptOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_1100
     * @tc.name   : test updateSession, error code 12000011
     * @tc.desc   : update
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1100', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1100";
      let handle = 0;
      try {
        await huks.updateSession(handle, encryptOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_1010
     * @tc.name   : test updateSession, error code 401
     * @tc.desc   : generate key, init, update
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1010', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1010";
      await huksCallback.generateKeyItem(testNumber, genKeyOption);
      let handle = (await huksCallback.initSession(testNumber, encryptOption)).handle;
      try {
        await huksCallback.updateSession(handle, encryptOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_1110
     * @tc.name   : test updateSession, error code 12000011
     * @tc.desc   : update
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1110', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1110";
      let handle = 0;
      try {
        await huksCallback.updateSession(handle, encryptOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_1200
     * @tc.name   : test finishSession, error code 401
     * @tc.desc   : generate key, init, finish
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1200', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1200";
      await huks.generateKeyItem(testNumber, genKeyOption);
      let handle = (await huks.initSession(testNumber, encryptOption)).handle;
      try {
        await huks.finishSession(handle, encryptOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_1300
     * @tc.name   : test finishSession, error code 12000011
     * @tc.desc   : finish
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1300', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1300";
      let handle = 0;
      try {
        await huks.finishSession(handle, encryptOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_1210
     * @tc.name   : test finishSession, error code 401
     * @tc.desc   : generate key, init, finish
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1210', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1210";
      await huksCallback.generateKeyItem(testNumber, genKeyOption);
      let handle = (await huksCallback.initSession(testNumber, encryptOption)).handle;
      try {
        await huksCallback.finishSession(handle, encryptOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_1310
     * @tc.name   : test finishSession, error code 12000011
     * @tc.desc   : finish
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1310', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1310";
      let handle = 0;
      try {
        await huksCallback.finishSession(handle, encryptOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_1400
     * @tc.name   : test abortSession, error code 401
     * @tc.desc   : generate key, init, abort
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1400', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1400";
      await huks.generateKeyItem(testNumber, genKeyOption);
      let handle = (await huks.initSession(testNumber, encryptOption)).handle;
      try {
        await huks.abortSession(handle, encryptOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_1410
     * @tc.name   : test abortSession, error code 401
     * @tc.desc   : generate key, init, abort
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1410', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1410";
      await huksCallback.generateKeyItem(testNumber, genKeyOption);
      let handle = (await huksCallback.initSession(testNumber, encryptOption)).handle;
      try {
        await huksCallback.abortSession(handle, encryptOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_1700
     * @tc.name   : test anonAttestKeyItem, error code 12000011
     * @tc.desc   : attest key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1700', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1700";
      let attestOption: huks.HuksOptions = GetAttestKeyOption();
      try {
        await huks.anonAttestKeyItem(testNumber, attestOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_1710
     * @tc.name   : test anonAttestKeyItem, error code 12000011
     * @tc.desc   : attest key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1710', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1710";
      let attestOption: huks.HuksOptions = GetAttestKeyOption();
      try {
        await huksCallback.anonAttestKeyItem(testNumber, attestOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_2800
     * @tc.name   : test importKeyItem, error code 12000013
     * @tc.desc   : import key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_2800', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_2800";
      MergeOption(genKeyOption, GetAccessControlOptions());
      genKeyOption.inData = GetAesImportData(256);
      try {
        await huks.importKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_CREDENTIAL_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_2810
     * @tc.name   : test importKeyItem, error code 12000013
     * @tc.desc   : import key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_2810', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_2810";
      MergeOption(genKeyOption, GetAccessControlOptions());
      genKeyOption.inData = GetAesImportData(256);
      try {
        await huksCallback.importKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_CREDENTIAL_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_2900
     * @tc.name   : test isKeyItemExist, error code 12000011
     * @tc.desc   : query key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_2900', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_2900";
      try {
        await huks.isKeyItemExist(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_2910
     * @tc.name   : test isKeyItemExist, error code 12000011
     * @tc.desc   : query key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_2910', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_2910";
      try {
        await huksCallback.isKeyItemExist(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_3000
     * @tc.name   : test importWrappedKeyItem, error code 401
     * @tc.desc   : import wrapped key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_3000', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_3000";
      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOption(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOption = GetAesGenerateOption(wrappedKeySize);
      SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOption.inData = wrappedKeyData;
      try {
        AddParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES);
        await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_3100
     * @tc.name   : test importWrappedKeyItem, error code 12000002
     * @tc.desc   : import wrapped key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_3100', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_3100";
      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOption(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOption = GetAesGenerateOption(wrappedKeySize);
      SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOption.inData = wrappedKeyData;
      try {
        DeleteParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_ALGORITHM);
        await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_3200
     * @tc.name   : test importWrappedKeyItem, error code 12000003
     * @tc.desc   : import wrapped key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_3200', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_3200";
      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOption(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOption = GetAesGenerateOption(wrappedKeySize);
      SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOption.inData = wrappedKeyData;
      try {
        SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_ALGORITHM, 4);
        await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_3300
     * @tc.name   : test importWrappedKeyItem, error code 12000011
     * @tc.desc   : import wrapped key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_3300', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_3300";
      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOption(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOption = GetAesGenerateOption(wrappedKeySize);
      SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOption.inData = wrappedKeyData;
      try {
        await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias + "emptyKey", importWrappedKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_3400
     * @tc.name   : test importWrappedKeyItem, error code 12000013
     * @tc.desc   : import wrapped key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_3400', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_3400";
      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOption(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOption = GetAesGenerateOption(wrappedKeySize);
      SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      MergeOption(importWrappedKeyOption, GetAccessControlOptions());
      importWrappedKeyOption.inData = wrappedKeyData;
      try {
        await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_CREDENTIAL_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_3010
     * @tc.name   : test importWrappedKeyItem, error code 401
     * @tc.desc   : import wrapped key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_3010', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_3010";
      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOption(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOption = GetAesGenerateOption(wrappedKeySize);
      SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOption.inData = wrappedKeyData;
      try {
        AddParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES);
        await huksCallback.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_3110
     * @tc.name   : test importWrappedKeyItem, error code 12000002
     * @tc.desc   : import wrapped key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_3110', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_3110";
      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOption(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOption = GetAesGenerateOption(wrappedKeySize);
      SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOption.inData = wrappedKeyData;
      try {
        DeleteParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_ALGORITHM);
        await huksCallback.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_3210
     * @tc.name   : test importWrappedKeyItem, error code 12000003
     * @tc.desc   : import wrapped key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_3210', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_3210";
      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOption(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOption = GetAesGenerateOption(wrappedKeySize);
      SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOption.inData = wrappedKeyData;
      try {
        SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_ALGORITHM, 4);
        await huksCallback.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_3310
     * @tc.name   : test importWrappedKeyItem, error code 12000011
     * @tc.desc   : import wrapped key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_3310', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_3310";
      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOption(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOption = GetAesGenerateOption(wrappedKeySize);
      SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOption.inData = wrappedKeyData;
      try {
        await huksCallback.importWrappedKeyItem(testNumber, deviceAKeyPairAlias + "emptyKey", importWrappedKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_3410
     * @tc.name   : test importWrappedKeyItem, error code 12000013
     * @tc.desc   : import wrapped key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_3410', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_3410";
      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOption(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOption = GetAesGenerateOption(wrappedKeySize);
      SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      MergeOption(importWrappedKeyOption, GetAccessControlOptions());
      importWrappedKeyOption.inData = wrappedKeyData;
      try {
        await huksCallback.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_CREDENTIAL_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_3500
     * @tc.name   : test update, error code 401
     * @tc.desc   : generate key, init, update
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_3500', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_3500";
      await huks.generateKeyItem(testNumber, genKeyOption);
      let handle = (await huks.initSession(testNumber, encryptOption)).handle as number;
      let token = new Uint8Array([0, 0, 0, 0]);
      try {
        await huks.update(handle, token, encryptOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_3510
     * @tc.name   : test update, error code 401
     * @tc.desc   : generate key, init, update
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_3510', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_3510";
      await huksCallback.generateKeyItem(testNumber, genKeyOption);
      let handle = (await huksCallback.initSession(testNumber, encryptOption)).handle as number;
      let token = new Uint8Array([0, 0, 0, 0]);
      try {
        await huksCallback.update(handle, token, encryptOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
      }
    })
  }
  )
}