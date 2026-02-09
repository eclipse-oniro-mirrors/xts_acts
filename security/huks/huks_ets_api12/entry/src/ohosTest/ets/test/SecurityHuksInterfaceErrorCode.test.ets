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
import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { huks } from '@kit.UniversalKeystoreKit';
import * as huksCallback from './utils/huks/HuksCallbackUtils.ets';
import { AddParam, CheckSoftware, DeleteParam, MergeOptions, SetInData, SetMultiParam, SetParam } from './utils/huks/HuksOptionsUtils.ets';
import { StringToUint8Array } from './utils/common/CommonUtils.ets';
import { GetAttestKeyOptions } from './utils/huks/AttestKeyUtils.ets';
import { Get3DesGenerateOptions, GetAesGenerateOptions, GetEccGenerateOptions, GetSm2GenerateOptions } from './utils/huks/GenerateKeyUtils.ets';
import { GetAesImportData } from './utils/huks/ImportKeyUtils.ets';
import { GetAccessControlOptions } from './utils/huks/AccessControlUtils.ets';
import { BuildWrappedKeyData } from './utils/huks/ImportWrappedKeyUtils.ets';
import { GetGenWrapKeyOptions, GetWrapKeyOptions } from './utils/huks/WrapKeyUtils.ets';
import { GetCbcNoPaddingOptions, GetCbcPkcs7Options, GetCtrNoPaddingOptions, GetSm3NoPaddingOptions } from './utils/huks/CipherUtils.ets';
import { GetDeriveAgreeFinishOptions, GetHkdfDeriveOptions, GetSha256Options } from './utils/huks/DeriveAgreeUtils.ets';
import { Logger } from './utils/common/Logger.ets';
import huksExternalCrypto from '@ohos.security.huksExternalCrypto';
import { CheckWifiInfo } from './utils/common/NetworkUtils';


export default function SecurityHuksInterfaceErrorCodeTest() {
  let useSoftware: boolean = true;
  let genKeyOption: huks.HuksOptions;
  let genKeyOptionMultiAlg: huks.HuksOptions;
  let genKeyOptionNoAlg: huks.HuksOptions;
  let genKeyOptionErrorAlg: huks.HuksOptions;
  let encryptOption: huks.HuksOptions;
  let encryptOptionMultiAlg: huks.HuksOptions;
  let encryptOptionNoAlg: huks.HuksOptions;
  let encryptOptionErrorAlg: huks.HuksOptions;

  describe('SecurityHuksInterfaceErrorCodeTest', () => {

    beforeAll(async () => {
      useSoftware = await CheckSoftware();
    })
    beforeEach(() => {
      genKeyOption = GetAesGenerateOptions(256);
      genKeyOptionMultiAlg = AddParam(GetAesGenerateOptions(256), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES);
      genKeyOptionNoAlg = DeleteParam(GetAesGenerateOptions(256), huks.HuksTag.HUKS_TAG_ALGORITHM);
      genKeyOptionErrorAlg = SetParam(GetAesGenerateOptions(256), huks.HuksTag.HUKS_TAG_ALGORITHM, 4);
      encryptOption = MergeOptions(GetAesGenerateOptions(256), GetCbcPkcs7Options(12));
      encryptOptionMultiAlg = MergeOptions(GetAesGenerateOptions(256), GetCbcPkcs7Options(12));
      AddParam(encryptOptionMultiAlg, huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES);
      encryptOptionNoAlg = DeleteParam(MergeOptions(GetAesGenerateOptions(256), GetCbcPkcs7Options(12)), huks.HuksTag.HUKS_TAG_ALGORITHM);
      encryptOptionErrorAlg = SetParam(MergeOptions(GetAesGenerateOptions(256), GetCbcPkcs7Options(12)), huks.HuksTag.HUKS_TAG_ALGORITHM, 4);
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_0100
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_0100
     * @tc.desc   generate key, delete
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0100', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0100";
      await huks.generateKeyItem(testNumber, genKeyOption);
      try {
        await huks.deleteKeyItem(testNumber, genKeyOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_0200
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_0200
     * @tc.desc   generate key, delete
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0200', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0200";
      try {
        await huks.deleteKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_0110
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_0110
     * @tc.desc   generate key, delete
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0110', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0110";
      await huksCallback.generateKeyItem(testNumber, genKeyOption);
      try {
        await huksCallback.deleteKeyItem(testNumber, genKeyOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_0210
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_0210
     * @tc.desc   generate key, delete
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0210', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0210";
      try {
        await huksCallback.deleteKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_0300
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_0300
     * @tc.desc   import key
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0300', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0300";
      genKeyOptionNoAlg.inData = GetAesImportData(256);
      try {
        await huks.importKeyItem(testNumber, genKeyOptionNoAlg);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_0310
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_0310
     * @tc.desc   import key
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0310', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0310";
      genKeyOptionNoAlg.inData = StringToUint8Array('32012345678901234567890123456789')
      try {
        await huksCallback.importKeyItem(testNumber, genKeyOptionNoAlg);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_0400
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_0400
     * @tc.desc   generate key, export key
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0400', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0400";
      genKeyOption = GetEccGenerateOptions(256);
      genKeyOptionMultiAlg = AddParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ECC);
      await huks.generateKeyItem(testNumber, genKeyOption);
      try {
        await huks.exportKeyItem(testNumber, genKeyOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_0500
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_0500
     * @tc.desc   export key
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0500', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0500";
      try {
        await huks.exportKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_0410
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_0410
     * @tc.desc   generate key, export key
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0410', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0410";
      genKeyOption = GetEccGenerateOptions(256);
      genKeyOptionMultiAlg = AddParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ECC);
      await huksCallback.generateKeyItem(testNumber, genKeyOption);
      try {
        await huksCallback.exportKeyItem(testNumber, genKeyOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_0510
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_0510
     * @tc.desc   export key
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0510', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0510";
      try {
        await huksCallback.exportKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_0600
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_0600
     * @tc.desc   generate key, get key properties
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0600', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0600";
      await huks.generateKeyItem(testNumber, genKeyOption);
      try {
        await huks.getKeyItemProperties(testNumber, genKeyOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_0700
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_0700
     * @tc.desc   get key properties
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0700', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0700";
      try {
        await huks.getKeyItemProperties(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_0610
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_0610
     * @tc.desc   generate key, get key properties
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0610', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0610";
      await huksCallback.generateKeyItem(testNumber, genKeyOption);
      try {
        await huksCallback.getKeyItemProperties(testNumber, genKeyOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_0710
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_0710
     * @tc.desc   get key properties
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0710', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0710";
      try {
        await huksCallback.getKeyItemProperties(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_0800
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_0800
     * @tc.desc   generate key, query Key
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0800', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0800";
      await huks.generateKeyItem(testNumber, genKeyOption);
      try {
        await huks.hasKeyItem(testNumber, genKeyOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_0810
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_0810
     * @tc.desc   generate key, query Key
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0810', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0810";
      await huksCallback.generateKeyItem(testNumber, genKeyOption);
      try {
        await huksCallback.hasKeyItem(testNumber, genKeyOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_0900
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_0900
     * @tc.desc   init session
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0900', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0900";
      try {
        await huks.initSession(testNumber, encryptOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_0910
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_0910
     * @tc.desc   init session
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0910', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0910";
      try {
        await huksCallback.initSession(testNumber, encryptOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_1000
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_1000
     * @tc.desc   generate key, init, update
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1000', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1000";
      await huks.generateKeyItem(testNumber, genKeyOption);
      let handle = (await huks.initSession(testNumber, encryptOption)).handle;
      try {
        await huks.updateSession(handle, encryptOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_1100
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_1100
     * @tc.desc   update
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1100', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1100";
      let handle = 0;
      try {
        await huks.updateSession(handle, encryptOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_1010
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_1010
     * @tc.desc   generate key, init, update
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1010', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1010";
      await huksCallback.generateKeyItem(testNumber, genKeyOption);
      let handle = (await huksCallback.initSession(testNumber, encryptOption)).handle;
      try {
        await huksCallback.updateSession(handle, encryptOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_1110
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_1110
     * @tc.desc   update
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1110', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1110";
      let handle = 0;
      try {
        await huksCallback.updateSession(handle, encryptOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_1200
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_1200
     * @tc.desc   generate key, init, finish
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1200', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1200";
      await huks.generateKeyItem(testNumber, genKeyOption);
      let handle = (await huks.initSession(testNumber, encryptOption)).handle;
      try {
        await huks.finishSession(handle, encryptOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_1300
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_1300
     * @tc.desc   finish
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1300', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1300";
      let handle = 0;
      try {
        await huks.finishSession(handle, encryptOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_1210
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_1210
     * @tc.desc   generate key, init, finish
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1210', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1210";
      await huksCallback.generateKeyItem(testNumber, genKeyOption);
      let handle = (await huksCallback.initSession(testNumber, encryptOption)).handle;
      try {
        await huksCallback.finishSession(handle, encryptOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_1310
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_1310
     * @tc.desc   finish
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1310', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1310";
      let handle = 0;
      try {
        await huksCallback.finishSession(handle, encryptOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_1400
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_1400
     * @tc.desc   generate key, init, abort
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1400', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1400";
      await huks.generateKeyItem(testNumber, genKeyOption);
      let handle = (await huks.initSession(testNumber, encryptOption)).handle;
      try {
        await huks.abortSession(handle, encryptOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_1410
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_1410
     * @tc.desc   generate key, init, abort
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1410', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1410";
      await huksCallback.generateKeyItem(testNumber, genKeyOption);
      let handle = (await huksCallback.initSession(testNumber, encryptOption)).handle;
      try {
        await huksCallback.abortSession(handle, encryptOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_1700
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_1700
     * @tc.desc   attest key
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1700', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      if(!useSoftware){
        await CheckWifiInfo();
      }
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1700";
      let attestOption: huks.HuksOptions = GetAttestKeyOptions();
      try {
        await huks.anonAttestKeyItem(testNumber, attestOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_1710
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_1710
     * @tc.desc   attest key
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1710', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      if(!useSoftware){
        await CheckWifiInfo();
      }
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1710";
      let attestOption: huks.HuksOptions = GetAttestKeyOptions();
      try {
        await huksCallback.anonAttestKeyItem(testNumber, attestOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_2800
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_2800
     * @tc.desc   import key
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_2800', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_2800";
      MergeOptions(genKeyOption, GetAccessControlOptions());
      genKeyOption.inData = GetAesImportData(256);
      try {
        await huks.importKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_CREDENTIAL_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_2810
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_2810
     * @tc.desc   import key
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_2810', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_2810";
      MergeOptions(genKeyOption, GetAccessControlOptions());
      genKeyOption.inData = GetAesImportData(256);
      try {
        await huksCallback.importKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_CREDENTIAL_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_2900
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_2900
     * @tc.desc   query key
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_2900', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_2900";
      try {
        await huks.isKeyItemExist(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_2910
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_2910
     * @tc.desc   query key
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_2910', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_2910";
      try {
        await huksCallback.isKeyItemExist(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_3000
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_3000
     * @tc.desc   import wrapped key
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_3000', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_3000";
      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOption = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOption.inData = wrappedKeyData;
      try {
        AddParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES);
        await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_3100
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_3100
     * @tc.desc   import wrapped key
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_3100', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_3100";
      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOption = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOption.inData = wrappedKeyData;
      try {
        DeleteParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_ALGORITHM);
        await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_3200
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_3200
     * @tc.desc   import wrapped key
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_3200', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_3200";
      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOption = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOption.inData = wrappedKeyData;
      try {
        SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_ALGORITHM, 4);
        await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_3300
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_3300
     * @tc.desc   import wrapped key
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_3300', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_3300";
      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOption = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOption.inData = wrappedKeyData;
      try {
        await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias + "emptyKey", importWrappedKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_3400
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_3400
     * @tc.desc   import wrapped key
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_3400', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_3400";
      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOption = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      MergeOptions(importWrappedKeyOption, GetAccessControlOptions());
      importWrappedKeyOption.inData = wrappedKeyData;
      try {
        await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_CREDENTIAL_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_3010
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_3010
     * @tc.desc   import wrapped key
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_3010', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_3010";
      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOption = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOption.inData = wrappedKeyData;
      try {
        AddParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES);
        await huksCallback.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_3110
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_3110
     * @tc.desc   import wrapped key
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_3110', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_3110";
      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOption = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOption.inData = wrappedKeyData;
      try {
        DeleteParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_ALGORITHM);
        await huksCallback.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_3210
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_3210
     * @tc.desc   import wrapped key
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_3210', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_3210";
      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOption = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOption.inData = wrappedKeyData;
      try {
        SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_ALGORITHM, 4);
        await huksCallback.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_3310
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_3310
     * @tc.desc   import wrapped key
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_3310', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_3310";
      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOption = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOption.inData = wrappedKeyData;
      try {
        await huksCallback.importWrappedKeyItem(testNumber, deviceAKeyPairAlias + "emptyKey", importWrappedKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_3410
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_3410
     * @tc.desc   import wrapped key
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_3410', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_3410";
      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOption = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      MergeOptions(importWrappedKeyOption, GetAccessControlOptions());
      importWrappedKeyOption.inData = wrappedKeyData;
      try {
        await huksCallback.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_CREDENTIAL_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_3500
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_3500
     * @tc.desc   generate key, init, update
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
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
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API16_Interface_3510
     * @tc.number SUB_Security_HUKS_ErrorCode_API16_Interface_3510
     * @tc.desc   generate key, init, update
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
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
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_0100
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_0100
     * @tc.desc   test wrap key, error code 12000018
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_0100', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_0100";
      try {
        await huks.wrapKeyItem(testNumber, SetMultiParam(GetWrapKeyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES));
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_ARGUMENT);
      }
    }
    )

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_0200
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_0200
     * @tc.desc   test unwrap key, error code 12000018
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_0200', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_0200";
      try {
        let wrapRes = new Uint8Array([0, 0, 0, 0]);
        await huks.unwrapKeyItem(testNumber, SetMultiParam(GetWrapKeyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES), wrapRes);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_ARGUMENT);
      }
    }
    )

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_0300
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_0300
     * @tc.desc   test generateKeyItem, error code 12000014
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_0300', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_0300";
      try {
        await huks.generateKeyItem(testNumber, MergeOptions(genKeyOption, GetGenWrapKeyOptions()));
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INSUFFICIENT_MEMORY);
      }
    }
    )

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_0400
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_0400
     * @tc.desc   test generateKeyItem with error param, error code 401
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_0400', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_0400";
      try {
        await huks.generateKeyItem(testNumber, genKeyOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
      }
    }
    )

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_0500
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_0500
     * @tc.desc   test generateKeyItem with no alg, error code 12000002
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_0500', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_0500";
      try {
        await huks.generateKeyItem(testNumber, genKeyOptionNoAlg);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT);
      }
    }
    )

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_0600
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_0600
     * @tc.desc   test generateKeyItem with invalid alg, error code 12000003
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_0600', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_0600";
      try {
        await huks.generateKeyItem(testNumber, genKeyOptionErrorAlg);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    }
    )

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_0700
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_0700
     * @tc.desc   test generateKeyItem with no credential, error code 12000013
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_0700', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_0700";
      MergeOptions(genKeyOption, GetAccessControlOptions());
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_CREDENTIAL_NOT_EXIST);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_0800
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_0800
     * @tc.desc   test generateKeyItem when key exist, error code 12000017
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_0800', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_0800";
      await huks.generateKeyItem(testNumber, genKeyOption);
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, false)
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_ALREADY_EXIST);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_0900
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_0900
     * @tc.desc   test importKeyItem with multi alg, error code 401
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_0900', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_0900";
      try {
        await huks.importKeyItem(testNumber, SetInData(genKeyOptionMultiAlg, GetAesImportData(256)));
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_1000
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_1000
     * @tc.desc   test importKeyItem with invalid alg, error code 12000003
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_1000', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_1000";
      try {
        await huks.importKeyItem(testNumber, SetInData(genKeyOptionErrorAlg, GetAesImportData(256)));
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_1100
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_1100
     * @tc.desc   test importKeyItem with empty appid, error code 12000014
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_1100', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_1100";
      try {
        await huks.importKeyItem(testNumber, SetInData(MergeOptions(genKeyOption, GetGenWrapKeyOptions()), GetAesImportData(256)));
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INSUFFICIENT_MEMORY);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_1200
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_1200
     * @tc.desc   test importKeyItem when key exist, error code 12000017
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_1200', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_1200";
      await huks.generateKeyItem(testNumber, genKeyOption);
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, false);
      try {
        await huks.importKeyItem(testNumber, SetInData(genKeyOption, GetAesImportData(256)));
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_ALREADY_EXIST);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_1300
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_1300
     * @tc.desc   test anonAttestKeyItem with multi param, error code 401
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_1300', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      if(!useSoftware){
        await CheckWifiInfo();
      }
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_1300";
      await huks.generateKeyItem(testNumber, GetEccGenerateOptions(256));
      let attestOptions = AddParam(GetAttestKeyOptions(), huks.HuksTag.HUKS_TAG_ATTESTATION_CHALLENGE, StringToUint8Array("challenge_data"));
      try {
        await huks.anonAttestKeyItem(testNumber, attestOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_1400
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_1400
     * @tc.desc   test importWrappedKeyItem with empty appid, error code 12000014
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_1400', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_1400";
      await huks.generateKeyItem(testNumber, GetAesGenerateOptions(256));
      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOption = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOption.inData = wrappedKeyData;
      MergeOptions(importWrappedKeyOption, GetWrapKeyOptions());
      try {
        await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INSUFFICIENT_MEMORY);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_1500
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_1500
     * @tc.desc   test importWrappedKeyItem when key exist, error code 12000017
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_1500', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_1500";
      await huks.generateKeyItem(testNumber, GetAesGenerateOptions(256));
      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOption = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOption.inData = wrappedKeyData;
      SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, false);
      try {
        await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_ALREADY_EXIST);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_1600
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_1600
     * @tc.desc   test isKeyItemExist with multi alg, error code 401
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_1600', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_1600";
      await huks.generateKeyItem(testNumber, genKeyOption);
      try {
        await huks.isKeyItemExist(testNumber, genKeyOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_1700
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_1700
     * @tc.desc   test initSession with multi alg, error code 401
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_1700', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_1700";
      await huks.generateKeyItem(testNumber, genKeyOption);
      try {
        await huks.initSession(testNumber, encryptOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_1800
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_1800
     * @tc.desc   test initSession with invalid mode, error code 12000002
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_1800', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_1800";
      await huks.generateKeyItem(testNumber, Get3DesGenerateOptions(192));
      try {
        await huks.initSession(testNumber, MergeOptions(Get3DesGenerateOptions(192), GetCtrNoPaddingOptions(16)));
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_1900
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_1900
     * @tc.desc   test initSession with invalid iv length, error code 401
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_1900', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_1900";
      await huks.generateKeyItem(testNumber, Get3DesGenerateOptions(192));
      try {
        await huks.initSession(testNumber, MergeOptions(Get3DesGenerateOptions(192), GetCbcNoPaddingOptions(12)));
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_2000
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_2000
     * @tc.desc   test updateSession with empty inData, error code 12000014
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_2000', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_2000";
      await huks.generateKeyItem(testNumber, GetSm2GenerateOptions(256));
      try {
        let res = await huks.initSession(testNumber, MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions()));
        await huks.updateSession(res.handle, MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions()));
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INSUFFICIENT_MEMORY);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_2100
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_2100
     * @tc.desc   test finishSession with empty inData, error code 12000014
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_2100', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_2100";
      await huks.generateKeyItem(testNumber, GetSm2GenerateOptions(256));
      let res = await huks.initSession(testNumber, MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions()));
      try {
        await huks.finishSession(res.handle, MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions()));
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INSUFFICIENT_MEMORY);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_2200
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_2200
     * @tc.desc   test deriveKey when key exist, error code 12000017
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_2200', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_2200";
      await huks.generateKeyItem(testNumber, GetAesGenerateOptions(256));
      let genDeriveKeyOption = SetParam(GetAesGenerateOptions(256), huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      await huks.generateKeyItem(testNumber + "_keyA", genDeriveKeyOption);
      let initOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha256Options());
      let finishOptions = MergeOptions(GetAesGenerateOptions(256), GetDeriveAgreeFinishOptions(testNumber));
      let res = await huks.initSession(testNumber + "_keyA", initOptions);
      await huks.updateSession(res.handle, initOptions);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, false);
      try {
        await huks.finishSession(res.handle, finishOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_ALREADY_EXIST);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_0310
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_0310
     * @tc.desc   test generateKeyItem, error code 12000014
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_0310', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_0310";
      try {
        await huksCallback.generateKeyItem(testNumber, MergeOptions(genKeyOption, GetGenWrapKeyOptions()));
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INSUFFICIENT_MEMORY);
      }
    }
    )

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_0410
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_0410
     * @tc.desc   test generateKeyItem with error param, error code 401
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_0410', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_0410";
      try {
        await huksCallback.generateKeyItem(testNumber, genKeyOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
      }
    }
    )

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_0510
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_0510
     * @tc.desc   test generateKeyItem with no alg, error code 12000002
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_0510', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_0510";
      try {
        await huksCallback.generateKeyItem(testNumber, genKeyOptionNoAlg);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT);
      }
    }
    )

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_0610
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_0610
     * @tc.desc   test generateKeyItem with invalid alg, error code 12000003
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_0610', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_0610";
      try {
        await huksCallback.generateKeyItem(testNumber, genKeyOptionErrorAlg);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    }
    )

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_0710
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_0710
     * @tc.desc   test generateKeyItem with no credential, error code 12000013
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_0710', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_0710";
      MergeOptions(genKeyOption, GetAccessControlOptions());
      try {
        await huksCallback.generateKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_CREDENTIAL_NOT_EXIST);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_0810
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_0810
     * @tc.desc   test generateKeyItem when key exist, error code 12000017
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_0810', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_0810";
      await huksCallback.generateKeyItem(testNumber, genKeyOption);
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, false)
      try {
        await huksCallback.generateKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_ALREADY_EXIST);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_0910
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_0910
     * @tc.desc   test importKeyItem with multi alg, error code 401
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_0910', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_0910";
      try {
        await huksCallback.importKeyItem(testNumber, SetInData(genKeyOptionMultiAlg, GetAesImportData(256)));
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_1010
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_1010
     * @tc.desc   test importKeyItem with invalid alg, error code 12000003
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_1010', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_1010";
      try {
        await huksCallback.importKeyItem(testNumber, SetInData(genKeyOptionErrorAlg, GetAesImportData(256)));
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_1110
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_1110
     * @tc.desc   test importKeyItem with empty appid, error code 12000014
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_1110', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_1110";
      try {
        await huksCallback.importKeyItem(testNumber, SetInData(MergeOptions(genKeyOption, GetGenWrapKeyOptions()), GetAesImportData(256)));
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INSUFFICIENT_MEMORY);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_1210
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_1210
     * @tc.desc   test importKeyItem when key exist, error code 12000017
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_1210', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_1210";
      await huksCallback.generateKeyItem(testNumber, genKeyOption);
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, false);
      try {
        await huksCallback.importKeyItem(testNumber, SetInData(genKeyOption, GetAesImportData(256)));
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_ALREADY_EXIST);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_1310
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_1310
     * @tc.desc   test anonAttestKeyItem with multi param, error code 401
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_1310', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      if(!useSoftware){
        await CheckWifiInfo();
      }
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_1310";
      await huksCallback.generateKeyItem(testNumber, GetEccGenerateOptions(256));
      let attestOptions = AddParam(GetAttestKeyOptions(), huks.HuksTag.HUKS_TAG_ATTESTATION_CHALLENGE, StringToUint8Array("challenge_data"));
      try {
        await huksCallback.anonAttestKeyItem(testNumber, attestOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_1410
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_1410
     * @tc.desc   test importWrappedKeyItem with empty appid, error code 12000014
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_1410', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_1410";
      await huksCallback.generateKeyItem(testNumber, GetAesGenerateOptions(256));
      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huksCallback.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huksCallback.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOption = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOption.inData = wrappedKeyData;
      MergeOptions(importWrappedKeyOption, GetWrapKeyOptions());
      try {
        await huksCallback.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INSUFFICIENT_MEMORY);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_1510
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_1510
     * @tc.desc   test importWrappedKeyItem when key exist, error code 12000017
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_1510', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_1510";
      await huksCallback.generateKeyItem(testNumber, GetAesGenerateOptions(256));
      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huksCallback.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huksCallback.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOption = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOption.inData = wrappedKeyData;
      SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, false);
      try {
        await huksCallback.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_ALREADY_EXIST);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_1610
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_1610
     * @tc.desc   test isKeyItemExist with multi alg, error code 401
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_1610', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_1610";
      await huksCallback.generateKeyItem(testNumber, genKeyOption);
      try {
        await huksCallback.isKeyItemExist(testNumber, genKeyOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_1710
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_1710
     * @tc.desc   test initSession with multi alg, error code 401
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_1710', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_1710";
      await huksCallback.generateKeyItem(testNumber, genKeyOption);
      try {
        await huksCallback.initSession(testNumber, encryptOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_1810
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_1810
     * @tc.desc   test initSession with invalid mode, error code 12000002
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_1810', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_1810";
      await huksCallback.generateKeyItem(testNumber, Get3DesGenerateOptions(192));
      try {
        await huksCallback.initSession(testNumber, MergeOptions(Get3DesGenerateOptions(192), GetCtrNoPaddingOptions(16)));
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_1910
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_1910
     * @tc.desc   test initSession with invalid iv length, error code 401
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_1910', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_1910";
      await huksCallback.generateKeyItem(testNumber, Get3DesGenerateOptions(192));
      try {
        await huksCallback.initSession(testNumber, MergeOptions(Get3DesGenerateOptions(192), GetCbcNoPaddingOptions(12)));
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_2010
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_2010
     * @tc.desc   test updateSession with empty inData, error code 12000014
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_2010', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_2010";
      await huksCallback.generateKeyItem(testNumber, GetSm2GenerateOptions(256));
      try {
        let res = await huksCallback.initSession(testNumber, MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions()));
        await huksCallback.updateSession(res.handle, MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions()));
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INSUFFICIENT_MEMORY);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_2110
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_2110
     * @tc.desc   test finishSession with empty inData, error code 12000014
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_2110', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_2010";
      await huksCallback.generateKeyItem(testNumber, GetSm2GenerateOptions(256));
      let res = await huksCallback.initSession(testNumber, MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions()));
      try {
        await huksCallback.finishSession(res.handle, MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions()));
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INSUFFICIENT_MEMORY);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API20_Interface_2210
     * @tc.number SUB_Security_HUKS_ErrorCode_API20_Interface_2210
     * @tc.desc   test deriveKey when key exist, error code 12000017
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API20_Interface_2210', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API20_Interface_2210";
      await huksCallback.generateKeyItem(testNumber, GetAesGenerateOptions(256));
      let genDeriveKeyOption = SetParam(GetAesGenerateOptions(256), huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      await huksCallback.generateKeyItem(testNumber + "_keyA", genDeriveKeyOption);
      let initOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha256Options());
      let finishOptions = MergeOptions(GetAesGenerateOptions(256), GetDeriveAgreeFinishOptions(testNumber));
      let res = await huksCallback.initSession(testNumber + "_keyA", initOptions);
      await huksCallback.updateSession(res.handle, initOptions);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, false);
      try {
        await huksCallback.finishSession(res.handle, finishOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_ALREADY_EXIST);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API22_Interface_0100
     * @tc.number SUB_Security_HUKS_ErrorCode_API22_Interface_0100
     * @tc.desc   test registerProvider when no permission, error code 201
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API22_Interface_0100', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API22_Interface_0100";
      if (canIUse("SystemCapability.Security.Huks.CryptoExtension")) {
        try {
          const providerName = "testHap";
          const extProperties: Array<huksExternalCrypto.HuksExternalCryptoParam> = [
            {
              tag: huksExternalCrypto.HuksExternalCryptoTag.HUKS_EXT_CRYPTO_TAG_ABILITY_NAME,
              value: new Uint8Array([1, 1, 1, 1])
            }
          ];
          await huksExternalCrypto.registerProvider(providerName, extProperties);
          expect(null).assertFail();
        } catch (err) {
          if (err.code != 801) {
            Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
            expect(err.code).assertEqual(201);
          }
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API22_Interface_0200
     * @tc.number SUB_Security_HUKS_ErrorCode_API22_Interface_0200
     * @tc.desc   test unregisterProvider when no permission, error code 201
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API22_Interface_0200', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API22_Interface_0200";
      if (canIUse("SystemCapability.Security.Huks.CryptoExtension")) {
        try {
          const providerName = "testHap";
          const extProperties: Array<huksExternalCrypto.HuksExternalCryptoParam> = [
            {
              tag: huksExternalCrypto.HuksExternalCryptoTag.HUKS_EXT_CRYPTO_TAG_ABILITY_NAME,
              value: new Uint8Array([1, 1, 1, 1])
            }
          ];
          await huksExternalCrypto.unregisterProvider(providerName, extProperties);
          expect(null).assertFail();
        } catch (err) {
          if (err.code != 801) {
            Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
            expect(err.code).assertEqual(201);
          }
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API22_Interface_0300
     * @tc.number SUB_Security_HUKS_ErrorCode_API22_Interface_0300
     * @tc.desc   test abnormal authUkeyPin , error code 202
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API22_Interface_0300', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API22_Interface_0400";
      if (canIUse("SystemCapability.Security.Huks.CryptoExtension")) {
        try {
          const resourceId = "SUB_Security_HUKS_ErrorCode_API22_Interface_0400";
          const extProperties: Array<huksExternalCrypto.HuksExternalCryptoParam> = [
            {
              tag: huksExternalCrypto.HuksExternalCryptoTag.HUKS_EXT_CRYPTO_TAG_UKEY_PIN,
              value: new Uint8Array([1, 1, 1, 1, 1])
            }
          ];
          await huksExternalCrypto.authUkeyPin(resourceId, extProperties);
          expect(null).assertFail();
        } catch (err) {
          if (err.code != 801) {
            Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
            expect(err.code).assertEqual(202);
          }
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API22_Interface_0500
     * @tc.number SUB_Security_HUKS_ErrorCode_API22_Interface_0500
     * @tc.desc   test abnormal getUkeyPinAuthState, error code 12000012
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API22_Interface_0500', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API22_Interface_0500";
      if (canIUse("SystemCapability.Security.Huks.CryptoExtension")) {
        try {
          const resourceId = "SUB_Security_HUKS_ErrorCode_API22_Interface_0500";
          const extProperties: Array<huksExternalCrypto.HuksExternalCryptoParam> = [
            {
              tag: huksExternalCrypto.HuksExternalCryptoTag.HUKS_EXT_CRYPTO_TAG_ABILITY_NAME,
              value: new Uint8Array([1, 1, 1, 1, 1])
            }
          ];
          await huksExternalCrypto.getUkeyPinAuthState(resourceId, extProperties);
          expect(null).assertFail();
        } catch (err) {
          if (err.code != 801) {
            Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
            expect(err.code).assertEqual(12000012);
          }
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_API22_Interface_0600
     * @tc.number SUB_Security_HUKS_ErrorCode_API22_Interface_0600
     * @tc.desc   test abnormal getProperty, error code 12000012
     * @tc.type   SAFETY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_ErrorCode_API22_Interface_0600', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API22_Interface_0600";
      let propertyId = "SKF_EnumDev";
      if (canIUse("SystemCapability.Security.Huks.CryptoExtension")) {
        try {
          const resourceId = "SUB_Security_HUKS_ErrorCode_API22_Interface_0600";
          const extProperties: Array<huksExternalCrypto.HuksExternalCryptoParam> = [
            {
              tag: huksExternalCrypto.HuksExternalCryptoTag.HUKS_EXT_CRYPTO_TAG_ABILITY_NAME,
              value: new Uint8Array([1, 1, 1, 1, 1])
            }
          ];
          await huksExternalCrypto.getProperty(resourceId, propertyId, extProperties);
          expect(null).assertFail();
        } catch (err) {
          if (err.code != 801) {
            Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
            expect(err.code).assertEqual(12000012);
          }
        }
      }
    })
  }
  )
}