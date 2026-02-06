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
import { beforeAll, describe, Level, Size, TestType, it, expect } from '@ohos/hypium';
import { huks } from '@kit.UniversalKeystoreKit';
import { GetAesGenerateOptions, GetEccGenerateOptions } from './utils/huks/GenerateKeyUtils';
import { SetParam, SetInData, MergeOptions, CheckSoftware } from './utils/huks/HuksOptionsUtils';
import { StringToUint8Array, Uint8ArrayToString } from './utils/common/CommonUtils';
import { Logger } from './utils/common/Logger';
import { GetAesImportData } from './utils/huks/ImportKeyUtils';
import {
  Agree,
  GetDeriveAgreeFinishOptions,
  GetEcdhAgreeOptions,
  GetHkdfDeriveOptions,
  GetSha256Options
} from './utils/huks/DeriveAgreeUtils';
import { BuildCipherData, Cipher, CipherData, GetCbcPkcs7Options, MergeCipherData } from './utils/huks/CipherUtils';
import { GetAttestKeyOptions } from './utils/huks/AttestKeyUtils';
import { HuksMinGroupId } from './utils/huks/HuksCommonUtils';
import * as huksCallbackUtils from './utils/huks/HuksCallbackUtils'
import { CheckWifiInfo } from './utils/common/NetworkUtils';

export default function SecurityHuksGroupAPI23Test() {
  let useSoftware: boolean = true;

  describe('SecurityHuksGroupAPI23Test', () => {
    beforeAll(async () => {
      useSoftware = await CheckSoftware();
    })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_6800
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_6800
     * @tc.desc   test generateKeyItem group not configured, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_6800";
        let genGroupKeyOptions = SetParam(GetAesGenerateOptions(128), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMinGroupId));
        try {
          await huks.generateKeyItem(testNumber, genGroupKeyOptions);
          expect(null).assertFail()
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_6810
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_6810
     * @tc.desc   test generateKeyItem group not configured, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_6810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_6810";
        let genGroupKeyOptions = SetParam(GetAesGenerateOptions(128), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMinGroupId));
        try {
          await huksCallbackUtils.generateKeyItem(testNumber, genGroupKeyOptions);
          expect(null).assertFail()
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_6900
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_6900
     * @tc.desc   test importKeyItem group not configured, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_6900";
        let genGroupKeyOptions = SetParam(GetAesGenerateOptions(128), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMinGroupId));
        try {
          await huks.importKeyItem(testNumber, SetInData(genGroupKeyOptions, GetAesImportData(128)));
          expect(null).assertFail()
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_6910
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_6910
     * @tc.desc   test importKeyItem group not configured, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_6910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_6910";
        let genGroupKeyOptions = SetParam(GetAesGenerateOptions(128), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMinGroupId));
        try {
          await huksCallbackUtils.importKeyItem(testNumber, SetInData(genGroupKeyOptions, GetAesImportData(128)));
          expect(null).assertFail()
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_7000
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_7000
     * @tc.desc   test importWrappedKeyItem group not configured, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_7000";
        let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
        let wrappedKeyData = new Uint8Array([1, 1, 1]);
        let importWrappedKeyOption = GetAesGenerateOptions(128);
        SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE,
          huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
        importWrappedKeyOption.inData = wrappedKeyData;
        SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        try {
          await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_7010
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_7010
     * @tc.desc   test importWrappedKeyItem group not configured, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_7010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_7010";
        let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
        let wrappedKeyData = new Uint8Array([1, 1, 1]);
        let importWrappedKeyOption = GetAesGenerateOptions(128);
        SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE,
          huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
        importWrappedKeyOption.inData = wrappedKeyData;
        SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        try {
          await huksCallbackUtils.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_7200
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_7200
     * @tc.desc   test alias Derive group_alias not configured, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_7200";
        let genKeyOptions = GetEccGenerateOptions(256);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
        let agreeInitOptions: huks.HuksOptions = GetEcdhAgreeOptions(256);
        let agreeFinishOptions: huks.HuksOptions = GetAesGenerateOptions(256);
        SetParam(agreeFinishOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        MergeOptions(agreeFinishOptions, GetDeriveAgreeFinishOptions(testNumber + "_agreed"));
        await huks.generateKeyItem(testNumber, genKeyOptions);
        await huks.generateKeyItem(testNumber + "_deviceB", genKeyOptions);
        let res = await huks.exportKeyItem(testNumber + "_deviceB", genKeyOptions);
        agreeInitOptions.inData = res.outData;
        try {
          await Agree(testNumber, agreeInitOptions, agreeFinishOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_7210
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_7210
     * @tc.desc   test alias Derive group_alias not configured, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_7210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_7210";
        let genKeyOptions = GetEccGenerateOptions(256);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
        let agreeInitOptions: huks.HuksOptions = GetEcdhAgreeOptions(256);
        let agreeFinishOptions: huks.HuksOptions = GetAesGenerateOptions(256);
        SetParam(agreeFinishOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        MergeOptions(agreeFinishOptions, GetDeriveAgreeFinishOptions(testNumber + "_agreed"));
        await huksCallbackUtils.generateKeyItem(testNumber, genKeyOptions);
        await huksCallbackUtils.generateKeyItem(testNumber + "_deviceB", genKeyOptions);
        let res = await huksCallbackUtils.exportKeyItem(testNumber + "_deviceB", genKeyOptions);
        agreeInitOptions.inData = res.outData;
        let handle: number = (await huksCallbackUtils.initSession(testNumber, agreeInitOptions)).handle;
        await huksCallbackUtils.updateSession(handle, agreeInitOptions);
        try {
          await huksCallbackUtils.finishSession(handle, agreeFinishOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_7300
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_7300
     * @tc.desc   test alias DeriveAgree group_alias not configured, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_7300";
        let genKeyOptions = GetAesGenerateOptions(256);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
        let deriveInitOptions: huks.HuksOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha256Options());
        let deriveFinishOptions: huks.HuksOptions = GetAesGenerateOptions(256);
        SetParam(deriveFinishOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        MergeOptions(deriveFinishOptions, GetDeriveAgreeFinishOptions(testNumber + "_derived"));
        await huks.generateKeyItem(testNumber, genKeyOptions);
        try {
          await Agree(testNumber, deriveInitOptions, deriveFinishOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_7400
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_7400
     * @tc.desc   test exportKeyItem group_alias not configured, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_7400";
        let genKeyOptions = GetAesGenerateOptions(256);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        try {
          await huks.exportKeyItem(testNumber, genKeyOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_7410
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_7410
     * @tc.desc   test exportKeyItem group_alias not configured, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_7410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_7410";
        let genKeyOptions = GetAesGenerateOptions(256);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        try {
          await huksCallbackUtils.exportKeyItem(testNumber, genKeyOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_7500
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_7500
     * @tc.desc   test exportKeyItem group_alias not configured, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_7500";
        let genKeyOptions = GetAesGenerateOptions(256);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        try {
          await huks.wrapKeyItem(testNumber, genKeyOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          if (useSoftware || err.code == 801) {
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(12000018);
          }
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_7600
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_7600
     * @tc.desc   test Cipher group_alias not configured, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_7600";
        let genKeyOptions = GetAesGenerateOptions(128);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        let cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(12));
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        let cipherData = BuildCipherData([16]);
        try {
          await Cipher(testNumber, cipherOptions, cipherData);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_7610
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_7610
     * @tc.desc   test Cipher group_alias not configured, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_7610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_7610";
        let cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(12));
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        try {
          await huksCallbackUtils.initSession(testNumber, cipherOptions)
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_7800
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_7800
     * @tc.desc   test anonAttestKeyItem group_alias not configured, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        if(!useSoftware){
          await CheckWifiInfo();
        }
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_7800";
        let attestOptions = SetParam(GetAttestKeyOptions(), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMinGroupId));
        try {
          await huks.anonAttestKeyItem(testNumber, attestOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_7810
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_7810
     * @tc.desc   test anonAttestKeyItem group_alias not configured, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_7810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        if(!useSoftware){
          await CheckWifiInfo();
        }
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_7810";
        let attestOptions = SetParam(GetAttestKeyOptions(), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMinGroupId));
        try {
          await huksCallbackUtils.anonAttestKeyItem(testNumber, attestOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_7900
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_7900
     * @tc.desc   test getKeyItemProperties group_alias not configured, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_7900";
        let genKeyOptions = SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMinGroupId));
        try {
          await huks.getKeyItemProperties(testNumber, genKeyOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_7910
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_7910
     * @tc.desc   test getKeyItemProperties group_alias not configured, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_7910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_7910";
        let genKeyOptions = SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMinGroupId));
        try {
          await huksCallbackUtils.getKeyItemProperties(testNumber, genKeyOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_8000
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_8000
     * @tc.desc   test hasKeyItem group_alias not configured, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_8000";
        let genKeyOptions = SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMinGroupId));
        try {
          await huks.hasKeyItem(testNumber, genKeyOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_8010
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_8010
     * @tc.desc   test hasKeyItem group_alias not configured, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_8010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_8010";
        let genKeyOptions = SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMinGroupId));
        try {
          await huksCallbackUtils.hasKeyItem(testNumber, genKeyOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_8100
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_8100
     * @tc.desc   test listAliases group_alias not configured, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_8100";
        let genKeyOptions = SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMinGroupId));
        try {
          await huks.listAliases(genKeyOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_8200
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_8200
     * @tc.desc   test deleteKeyItem group_alias not exist, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_8200";
        let genKeyOptions = SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMinGroupId));
        try {
          await huksCallbackUtils.deleteKeyItem(testNumber, genKeyOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_8210
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_8210
     * @tc.desc   test deleteKeyItem group_alias not exist, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_8210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_8210";
        let genKeyOptions = SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMinGroupId));
        try {
          await huks.deleteKeyItem(testNumber, genKeyOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })
  })
}
