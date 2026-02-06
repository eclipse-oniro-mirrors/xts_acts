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
import { MergeOptions, SetInData, SetParam } from './utils/huks/HuksOptionsUtils.ets';
import { GetAesGenerateOptions, GetEccGenerateOptions } from './utils/huks/GenerateKeyUtils.ets';
import { GetAesImportData } from './utils/huks/ImportKeyUtils.ets';
import { BuildWrappedKeyData } from './utils/huks/ImportWrappedKeyUtils.ets';
import { Agree, Derive, GetDeriveAgreeFinishOptions, GetEcdhAgreeOptions, GetHkdfDeriveOptions, GetSha256Options } from './utils/huks/DeriveAgreeUtils.ets';
import { Logger } from './utils/common/Logger.ets';

export default function SecurityHuksKeyGenerateOverrideTest() {
  describe('SecurityHuksKeyGenerateOverrideTest', () => {

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0100
     * @tc.number SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0100
     * @tc.desc   test generateKeyItem, override default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0100";
      await huks.generateKeyItem(testNumber, GetAesGenerateOptions(256));
      try {
        await huks.generateKeyItem(testNumber, GetAesGenerateOptions(256));
      } catch (err) {
        Logger.error(testNumber + ` catch error: ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0200
     * @tc.number SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0200
     * @tc.desc   test generateKeyItem, override true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0200";
      await huks.generateKeyItem(testNumber, GetAesGenerateOptions(256));
      try {
        await huks.generateKeyItem(testNumber, SetParam(GetAesGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, true));
      } catch (err) {
        Logger.error(testNumber + ` catch error: ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0300
     * @tc.number SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0300
     * @tc.desc   test generateKeyItem, override false, error code 12000017
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0300";
      await huks.generateKeyItem(testNumber, GetAesGenerateOptions(256));
      try {
        await huks.generateKeyItem(testNumber, SetParam(GetAesGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, false));
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + ` catch error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_ALREADY_EXIST);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0400
     * @tc.number SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0400
     * @tc.desc   test generateKeyItem, override false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0400";
      try {
        await huks.generateKeyItem(testNumber, SetParam(GetAesGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, false));
      } catch (err) {
        Logger.error(testNumber + ` catch error: ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0500
     * @tc.number SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0500
     * @tc.desc   test importKeyItem, override default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0500";
      await huks.generateKeyItem(testNumber, GetAesGenerateOptions(256));
      try {
        await huks.importKeyItem(testNumber, SetInData(GetAesGenerateOptions(256), GetAesImportData(256)));
      } catch (err) {
        Logger.error(testNumber + ` catch error: ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0600
     * @tc.number SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0600
     * @tc.desc   test importKeyItem, override true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0600";
      await huks.generateKeyItem(testNumber, GetAesGenerateOptions(256));
      try {
        await huks.importKeyItem(testNumber, SetInData(SetParam(GetAesGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, true), GetAesImportData(256)));
      } catch (err) {
        Logger.error(testNumber + ` catch error: ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0700
     * @tc.number SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0700
     * @tc.desc   test importKeyItem, override false, error code 12000017
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0700";
      await huks.generateKeyItem(testNumber, GetAesGenerateOptions(256));
      try {
        await huks.importKeyItem(testNumber, SetInData(SetParam(GetAesGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, false), GetAesImportData(256)));
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + ` catch error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_ALREADY_EXIST);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0800
     * @tc.number SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0800
     * @tc.desc   test importKeyItem, override false, error code 12000017
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0800";
      try {
        await huks.importKeyItem(testNumber, SetInData(SetParam(GetAesGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, false), GetAesImportData(256)));
      } catch (err) {
        Logger.error(testNumber + ` catch error: ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0900
     * @tc.number SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0900
     * @tc.desc   test importWrappedKeyItem, override default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_Override_API20_Func_0900";
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
      try {
        await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1000
     * @tc.number SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1000
     * @tc.desc   test importWrappedKeyItem, override true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1000";
      await huks.generateKeyItem(testNumber, GetAesGenerateOptions(256));
      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOption = SetParam(GetAesGenerateOptions(wrappedKeySize), huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, true);
      SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOption.inData = wrappedKeyData;
      try {
        await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1100
     * @tc.number SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1100
     * @tc.desc   test importWrappedKeyItem, override false, error code 12000017
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1100";
      await huks.generateKeyItem(testNumber, GetAesGenerateOptions(256));
      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOption = SetParam(GetAesGenerateOptions(wrappedKeySize), huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, false);
      SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOption.inData = wrappedKeyData;
      try {
        await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_ALREADY_EXIST);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1200
     * @tc.number SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1200
     * @tc.desc   test importWrappedKeyItem, override false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1200";
      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOption = SetParam(GetAesGenerateOptions(wrappedKeySize), huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, false);
      SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOption.inData = wrappedKeyData;
      try {
        await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1300
     * @tc.number SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1300
     * @tc.desc   test agree, override default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1300";
      await huks.generateKeyItem(testNumber, GetAesGenerateOptions(256));
      let genAgreeKeyOption = SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
      await huks.generateKeyItem(testNumber + "_keyPairA", genAgreeKeyOption);
      await huks.generateKeyItem(testNumber + "_keyPairB", GetEccGenerateOptions(256));
      let keyData = await huks.exportKeyItem(testNumber + "_keyPairB", GetEccGenerateOptions(256));
      let initOptions = SetInData(GetEcdhAgreeOptions(256), keyData.outData as Uint8Array);
      let finishOptions = MergeOptions(GetAesGenerateOptions(256), GetDeriveAgreeFinishOptions(testNumber));
      try {
        await Agree(testNumber + "_keyPairA", initOptions, finishOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1400
     * @tc.number SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1400
     * @tc.desc   test agree, override true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1400";
      await huks.generateKeyItem(testNumber, GetAesGenerateOptions(256));
      let genAgreeKeyOption = SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
      await huks.generateKeyItem(testNumber + "_keyPairA", genAgreeKeyOption);
      await huks.generateKeyItem(testNumber + "_keyPairB", GetEccGenerateOptions(256));
      let keyData = await huks.exportKeyItem(testNumber + "_keyPairB", GetEccGenerateOptions(256));
      let initOptions = SetInData(GetEcdhAgreeOptions(256), keyData.outData as Uint8Array);
      let finishOptions = MergeOptions(GetAesGenerateOptions(256), GetDeriveAgreeFinishOptions(testNumber));
      try {
        SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, true);
        await Agree(testNumber + "_keyPairA", initOptions, finishOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1500
     * @tc.number SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1500
     * @tc.desc   test agree, override false, error code 12000017
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1500";
      await huks.generateKeyItem(testNumber, GetAesGenerateOptions(256));
      let genAgreeKeyOption = SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
      await huks.generateKeyItem(testNumber + "_keyPairA", genAgreeKeyOption);
      await huks.generateKeyItem(testNumber + "_keyPairB", GetEccGenerateOptions(256));
      let keyData = await huks.exportKeyItem(testNumber + "_keyPairB", GetEccGenerateOptions(256));
      let initOptions = SetInData(GetEcdhAgreeOptions(256), keyData.outData as Uint8Array);
      let finishOptions = MergeOptions(GetAesGenerateOptions(256), GetDeriveAgreeFinishOptions(testNumber));
      try {
        SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, false);
        await Agree(testNumber + "_keyPairA", initOptions, finishOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_ALREADY_EXIST);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1600
     * @tc.number SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1600
     * @tc.desc   test agree, override false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1600";
      let genAgreeKeyOption = SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
      await huks.generateKeyItem(testNumber + "_keyPairA", genAgreeKeyOption);
      await huks.generateKeyItem(testNumber + "_keyPairB", GetEccGenerateOptions(256));
      let keyData = await huks.exportKeyItem(testNumber + "_keyPairB", GetEccGenerateOptions(256));
      let initOptions = SetInData(GetEcdhAgreeOptions(256), keyData.outData as Uint8Array);
      let finishOptions = MergeOptions(GetAesGenerateOptions(256), GetDeriveAgreeFinishOptions(testNumber));
      try {
        SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, false);
        await Agree(testNumber + "_keyPairA", initOptions, finishOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1700
     * @tc.number SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1700
     * @tc.desc   test derive, override default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1700";
      await huks.generateKeyItem(testNumber, GetAesGenerateOptions(256));
      let genDeriveKeyOption = SetParam(GetAesGenerateOptions(256), huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      await huks.generateKeyItem(testNumber + "_keyA", genDeriveKeyOption);
      let initOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha256Options());
      let finishOptions = MergeOptions(GetAesGenerateOptions(256), GetDeriveAgreeFinishOptions(testNumber));
      try {
        await Derive(testNumber + "_keyA", initOptions, finishOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1800
     * @tc.number SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1800
     * @tc.desc   test derive, override true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1800";
      await huks.generateKeyItem(testNumber, GetAesGenerateOptions(256));
      let genDeriveKeyOption = SetParam(GetAesGenerateOptions(256), huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      await huks.generateKeyItem(testNumber + "_keyA", genDeriveKeyOption);
      let initOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha256Options());
      let finishOptions = MergeOptions(GetAesGenerateOptions(256), GetDeriveAgreeFinishOptions(testNumber));
      try {
        SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, true);
        await Derive(testNumber + "_keyA", initOptions, finishOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1900
     * @tc.number SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1900
     * @tc.desc   test derive, override false, error code 12000017
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_Override_API20_Func_1900";
      await huks.generateKeyItem(testNumber, GetAesGenerateOptions(256));
      let genDeriveKeyOption = SetParam(GetAesGenerateOptions(256), huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      await huks.generateKeyItem(testNumber + "_keyA", genDeriveKeyOption);
      let initOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha256Options());
      let finishOptions = MergeOptions(GetAesGenerateOptions(256), GetDeriveAgreeFinishOptions(testNumber));
      try {
        SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, false);
        await Derive(testNumber + "_keyA", initOptions, finishOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_ALREADY_EXIST);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_Override_API20_Func_2000
     * @tc.number SUB_Security_HUKS_KeyGenerate_Override_API20_Func_2000
     * @tc.desc   test derive, override false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_KeyGenerate_Override_API20_Func_2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_Override_API20_Func_2000";
      let genDeriveKeyOption = SetParam(GetAesGenerateOptions(256), huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      await huks.generateKeyItem(testNumber + "_keyA", genDeriveKeyOption);
      let initOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha256Options());
      let finishOptions = MergeOptions(GetAesGenerateOptions(256), GetDeriveAgreeFinishOptions(testNumber));
      try {
        SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, false);
        await Derive(testNumber + "_keyA", initOptions, finishOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

  })
}