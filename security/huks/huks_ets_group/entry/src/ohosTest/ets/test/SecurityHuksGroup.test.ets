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
import { StringToUint8Array } from './utils/common/CommonUtils';
import { Logger } from './utils/common/Logger';
import { GetAesImportData } from './utils/huks/ImportKeyUtils';
import { BuildWrappedKeyData } from './utils/huks/ImportWrappedKeyUtils';
import {
  Agree,
  Derive,
  GetDeriveAgreeFinishOptions,
  GetEcdhAgreeOptions,
  GetHkdfDeriveOptions,
  GetHmacMacOptions,
  GetSha256Options,
  Mac
} from './utils/huks/DeriveAgreeUtils';
import { BuildSignVerifyData, GetSha256SignOptions, SignVerify } from './utils/huks/SignVerifyUtils';
import { BuildCipherData, Cipher, GetCbcPkcs7Options } from './utils/huks/CipherUtils';
import { GetAttestKeyOptions } from './utils/huks/AttestKeyUtils';
import { HuksMaxGroupId, HuksMinGroupId } from './utils/huks/HuksCommonUtils';
import { CheckWifiInfo } from './utils/common/NetworkUtils';

export default function abilityTest() {
  let useSoftware: boolean = true;
  describe('SecurityHuksGroupTest', () => {
    beforeAll(async () => {
      useSoftware = await CheckSoftware();
    })
    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_0100
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_0100
     * @tc.desc   test generateKeyItem group succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_0100";
        let genGroupKeyOptions = SetParam(GetAesGenerateOptions(128), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMinGroupId));
        try {
          await huks.generateKeyItem(testNumber, genGroupKeyOptions);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_0200
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_0200
     * @tc.desc   test importKeyItem group succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_0200";
        let genGroupKeyOptions = SetParam(GetAesGenerateOptions(128), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMinGroupId));
        try {
          await huks.importKeyItem(testNumber, SetInData(genGroupKeyOptions, GetAesImportData(128)));
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_0300
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_0300
     * @tc.desc   test importWrappedKeyItem group succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_0300";
        let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
        let wrappedKeySize = 192;
        let genKeyPairOptions = GetEccGenerateOptions(256);
        SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
        SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
        let deviceAPubKeyData =
          (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
        let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
        let importWrappedKeyOption = GetAesGenerateOptions(wrappedKeySize);
        SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE,
          huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
        importWrappedKeyOption.inData = wrappedKeyData;
        try {
          SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
          await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_0500
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_0500
     * @tc.desc   test alias DeriveAgree group_alias succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_0500";
        let genKeyOptions = GetEccGenerateOptions(256);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
        let agreeInitOptions: huks.HuksOptions = GetEcdhAgreeOptions(256);
        let agreeFinishOptions: huks.HuksOptions = GetAesGenerateOptions(256);
        SetParam(agreeFinishOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        MergeOptions(agreeFinishOptions, GetDeriveAgreeFinishOptions(testNumber + "_agreed"));
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          await huks.generateKeyItem(testNumber + "_deviceB", genKeyOptions);
          let res = await huks.exportKeyItem(testNumber + "_deviceB", genKeyOptions);
          agreeInitOptions.inData = res.outData;
          await Agree(testNumber, agreeInitOptions, agreeFinishOptions);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_0600
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_0600
     * @tc.desc   test alias Agree group_alias succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_0600";
        let genKeyOptions = GetAesGenerateOptions(256);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
        let deriveInitOptions: huks.HuksOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha256Options());
        let deriveFinishOptions: huks.HuksOptions = GetAesGenerateOptions(256);
        SetParam(deriveFinishOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        MergeOptions(deriveFinishOptions, GetDeriveAgreeFinishOptions(testNumber + "_derived"));
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          await Derive(testNumber, deriveInitOptions, deriveFinishOptions);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_0700
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_0700
     * @tc.desc   test exportKeyItem group succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_0700";
        let genKeyOptions = GetEccGenerateOptions(256);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);

          let res = await huks.exportKeyItem(testNumber, genKeyOptions);
          expect(res.outData).not().assertNull();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_0900
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_0900
     * @tc.desc   test Cipher group succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_0900";
        let genKeyOptions = GetAesGenerateOptions(128);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        let cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(12));
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        let cipherData = BuildCipherData([16]);
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          let res = await Cipher(testNumber, cipherOptions, cipherData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_1000
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_1000
     * @tc.desc   test SignVerify group succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_1000";
        let genKeyOptions = GetEccGenerateOptions(256);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        let signOptions = MergeOptions(GetEccGenerateOptions(256), GetSha256SignOptions());
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        let signData = BuildSignVerifyData([16]);
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          let res = await SignVerify(testNumber, signOptions, signData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_1100
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_1100
     * @tc.desc   test Mac group succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_1100";
        let genKeyOptions = GetAesGenerateOptions(256);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_MAC);
        let macOptions = MergeOptions(GetHmacMacOptions(), GetSha256Options());
        SetParam(macOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        macOptions.inData = StringToUint8Array("12345678")
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          let res = await Mac(testNumber, macOptions);
          expect(res.outData).not().assertNull();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_1200
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_1200
     * @tc.desc   test group_alias Derive succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_1200";
        let genKeyOptions = GetEccGenerateOptions(256);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
        let agreeInitOptions: huks.HuksOptions = GetEcdhAgreeOptions(256);
        SetParam(agreeInitOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        let agreeFinishOptions: huks.HuksOptions = GetAesGenerateOptions(256);
        MergeOptions(agreeFinishOptions, GetDeriveAgreeFinishOptions(testNumber + "_agreed"));
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          await huks.generateKeyItem(testNumber + "_deviceB", genKeyOptions);
          let res = await huks.exportKeyItem(testNumber + "_deviceB", genKeyOptions);
          agreeInitOptions.inData = res.outData;
          await Agree(testNumber, agreeInitOptions, agreeFinishOptions);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_1300
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_1300
     * @tc.desc   test group_alias Agree succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_1300";
        let genKeyOptions = GetEccGenerateOptions(256);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
        let agreeInitOptions: huks.HuksOptions = GetEcdhAgreeOptions(256);
        SetParam(agreeInitOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        let agreeFinishOptions: huks.HuksOptions = GetAesGenerateOptions(256);
        SetParam(agreeFinishOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        MergeOptions(agreeFinishOptions, GetDeriveAgreeFinishOptions(testNumber + "_agreed"));
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          await huks.generateKeyItem(testNumber + "_deviceB", genKeyOptions);
          let res = await huks.exportKeyItem(testNumber + "_deviceB", genKeyOptions);
          agreeInitOptions.inData = res.outData;
          await Agree(testNumber, agreeInitOptions, agreeFinishOptions);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_1400
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_1400
     * @tc.desc   test alias Agree succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_1400";
        let genKeyOptions = GetAesGenerateOptions(256);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
        let deriveInitOptions: huks.HuksOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha256Options());
        SetParam(deriveInitOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        let deriveFinishOptions: huks.HuksOptions = GetAesGenerateOptions(256);
        MergeOptions(deriveFinishOptions, GetDeriveAgreeFinishOptions(testNumber + "_derived"));
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          await Agree(testNumber, deriveInitOptions, deriveFinishOptions);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_1500
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_1500
     * @tc.desc   test alias Agree succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_1500";
        let genKeyOptions = GetAesGenerateOptions(256);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
        let deriveInitOptions: huks.HuksOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha256Options());
        SetParam(deriveInitOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        let deriveFinishOptions: huks.HuksOptions = GetAesGenerateOptions(256);
        SetParam(deriveFinishOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        MergeOptions(deriveFinishOptions, GetDeriveAgreeFinishOptions(testNumber + "_derived"));
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          await Agree(testNumber, deriveInitOptions, deriveFinishOptions);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_1700
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_1700
     * @tc.desc   test anonAttestKeyItem group succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        if(!useSoftware){
          await CheckWifiInfo();
        }
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_1700";
        let genKeyOptions = SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMinGroupId));
        let attestOptions =
          SetParam(GetAttestKeyOptions(), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          let res = await huks.anonAttestKeyItem(testNumber, attestOptions);
          expect(res.certChains?.length).assertEqual(3);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_1800
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_1800
     * @tc.desc   test getKeyItemProperties group succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_1800";
        let genKeyOptions = SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMinGroupId));
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          let res = await huks.getKeyItemProperties(testNumber, genKeyOptions);
          expect(res.properties?.length).assertLarger(0);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_1900
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_1900
     * @tc.desc   test hasKeyItem group succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_1900";
        let genKeyOptions = SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMinGroupId));
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          let res = await huks.hasKeyItem(testNumber, genKeyOptions);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_1910
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_1910
     * @tc.desc   test isKeyItemExist group succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_1910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_1910";
        let genKeyOptions = SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMinGroupId));
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          let res = await huks.isKeyItemExist(testNumber, genKeyOptions);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_2000
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_2000
     * @tc.desc   test listAliases group succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_2000";
        let genKeyOptions = SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMinGroupId));
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          let res = await huks.listAliases(genKeyOptions);
          expect(res.keyAliases.length).assertLarger(0);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_2100
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_2100
     * @tc.desc   test deleteKeyItem group succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_2100";
        let genKeyOptions = SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMinGroupId));
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          await huks.deleteKeyItem(testNumber, genKeyOptions);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_2300
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_2300
     * @tc.desc   test generateKeyItem group127 succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_2300";
        let genGroupKeyOptions = SetParam(GetAesGenerateOptions(128), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMaxGroupId));
        try {
          await huks.generateKeyItem(testNumber, genGroupKeyOptions);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_2400
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_2400
     * @tc.desc   test importKeyItem group127 succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_2400";
        let genGroupKeyOptions = SetParam(GetAesGenerateOptions(128), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMaxGroupId));
        try {
          await huks.importKeyItem(testNumber, SetInData(genGroupKeyOptions, GetAesImportData(128)));
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_2500
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_2500
     * @tc.desc   test importWrappedKeyItem group127 succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_2500";
        let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
        let wrappedKeySize = 192;
        let genKeyPairOptions = GetEccGenerateOptions(256);
        SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
        SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMaxGroupId));
        await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
        let deviceAPubKeyData =
          (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
        let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
        let importWrappedKeyOption = GetAesGenerateOptions(wrappedKeySize);
        SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE,
          huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
        importWrappedKeyOption.inData = wrappedKeyData;
        try {
          SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMaxGroupId));
          await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_2700
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_2700
     * @tc.desc   test alias DeriveAgree group_alias127 succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_2700";
        let genKeyOptions = GetEccGenerateOptions(256);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
        let agreeInitOptions: huks.HuksOptions = GetEcdhAgreeOptions(256);
        let agreeFinishOptions: huks.HuksOptions = GetAesGenerateOptions(256);
        SetParam(agreeFinishOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMaxGroupId));
        MergeOptions(agreeFinishOptions, GetDeriveAgreeFinishOptions(testNumber + "_agreed"));
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          await huks.generateKeyItem(testNumber + "_deviceB", genKeyOptions);
          let res = await huks.exportKeyItem(testNumber + "_deviceB", genKeyOptions);
          agreeInitOptions.inData = res.outData;
          await Agree(testNumber, agreeInitOptions, agreeFinishOptions);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_2800
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_2800
     * @tc.desc   test alias Agree group_alias127 succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_2800";
        let genKeyOptions = GetAesGenerateOptions(256);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
        let deriveInitOptions: huks.HuksOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha256Options());
        let deriveFinishOptions: huks.HuksOptions = GetAesGenerateOptions(256);
        SetParam(deriveFinishOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMaxGroupId));
        MergeOptions(deriveFinishOptions, GetDeriveAgreeFinishOptions(testNumber + "_derived"));
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          await Derive(testNumber, deriveInitOptions, deriveFinishOptions);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_2900
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_2900
     * @tc.desc   test exportKeyItem group_alias127 succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_2900";
        let genKeyOptions = GetEccGenerateOptions(256);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMaxGroupId));
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          let res = await huks.exportKeyItem(testNumber, genKeyOptions);
          expect(res.outData).not().assertNull();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_3100
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_3100
     * @tc.desc   test Cipher group_alias127 succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_3100";
        let genKeyOptions = GetAesGenerateOptions(128);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMaxGroupId));
        let cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(12));
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMaxGroupId));
        let cipherData = BuildCipherData([16]);
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          let res = await Cipher(testNumber, cipherOptions, cipherData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_3300
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_3300
     * @tc.desc   test anonAttestKeyItem group_alias127 succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        if(!useSoftware){
          await CheckWifiInfo();
        }
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_3300";
        let genKeyOptions = SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMaxGroupId));
        let attestOptions =
          SetParam(GetAttestKeyOptions(), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMaxGroupId));
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          let res = await huks.anonAttestKeyItem(testNumber, attestOptions);
          expect(res.certChains?.length).assertEqual(3);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_3400
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_3400
     * @tc.desc   test getKeyItemProperties group_alias127 succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_3400";
        let genKeyOptions = SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMaxGroupId));
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          let res = await huks.getKeyItemProperties(testNumber, genKeyOptions);
          expect(res.properties?.length).assertLarger(0);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_3500
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_3500
     * @tc.desc   test hasKeyItem group_alias127 succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_3500";
        let genKeyOptions = SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMaxGroupId));
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          let res = await huks.hasKeyItem(testNumber, genKeyOptions);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_3510
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_3510
     * @tc.desc   test isKeyItemExist group_alias127 succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_3510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_3510";
        let genKeyOptions = SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMaxGroupId));
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          let res = await huks.isKeyItemExist(testNumber, genKeyOptions);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_3600
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_3600
     * @tc.desc   test listAliases group_alias127 succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_3600";
        let genKeyOptions = SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMaxGroupId));
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          let res = await huks.listAliases(genKeyOptions);
          expect(res.keyAliases.length).assertLarger(0);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_3700
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_3700
     * @tc.desc   test deleteKeyItem group_alias127 succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_3700";
        let genKeyOptions = SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMaxGroupId));
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          await huks.deleteKeyItem(testNumber, genKeyOptions);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_3800
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_3800
     * @tc.desc   test generateKeyItem group_aliasNull, errcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_3800";
        let genGroupKeyOptions =
          SetParam(GetAesGenerateOptions(128), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(""));
        try {
          await huks.generateKeyItem(testNumber, genGroupKeyOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(401);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_3900
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_3900
     * @tc.desc   test importKeyItem group_aliasNull, errcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_3900";
        let genGroupKeyOptions =
          SetParam(GetAesGenerateOptions(128), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(""));
        try {
          await huks.importKeyItem(testNumber, SetInData(genGroupKeyOptions, GetAesImportData(128)));
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(401);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_4000
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_4000
     * @tc.desc   test importWrappedKeyItem group_aliasNull, errcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_4000";
        let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
        let wrappedKeySize = 192;
        let genKeyPairOptions = GetEccGenerateOptions(256);
        SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
        SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
        let deviceAPubKeyData =
          (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
        let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
        let importWrappedKeyOption = GetAesGenerateOptions(wrappedKeySize);
        SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE,
          huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
        importWrappedKeyOption.inData = wrappedKeyData;
        try {
          SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(""));
          await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(401);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_4200
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_4200
     * @tc.desc   test alias DeriveAgree group_aliasNull, errcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_4200";
        let genKeyOptions = GetEccGenerateOptions(256);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
        let agreeInitOptions: huks.HuksOptions = GetEcdhAgreeOptions(256);
        let agreeFinishOptions: huks.HuksOptions = GetAesGenerateOptions(256);
        SetParam(agreeFinishOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(""));
        MergeOptions(agreeFinishOptions, GetDeriveAgreeFinishOptions(testNumber + "_agreed"));
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          await huks.generateKeyItem(testNumber + "_deviceB", genKeyOptions);
          let res = await huks.exportKeyItem(testNumber + "_deviceB", genKeyOptions);
          agreeInitOptions.inData = res.outData;
          await Agree(testNumber, agreeInitOptions, agreeFinishOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(401);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_4300
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_4300
     * @tc.desc   test alias Agree group_aliasNull, errcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_4300";
        let genKeyOptions = GetAesGenerateOptions(256);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
        let deriveInitOptions: huks.HuksOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha256Options());
        let deriveFinishOptions: huks.HuksOptions = GetAesGenerateOptions(256);
        SetParam(deriveFinishOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(""));
        MergeOptions(deriveFinishOptions, GetDeriveAgreeFinishOptions(testNumber + "_derived"));
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          await Derive(testNumber, deriveInitOptions, deriveFinishOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(401);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_4400
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_4400
     * @tc.desc   test exportKeyItem group_aliasNull, errcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_4400";
        let genKeyOptions = GetAesGenerateOptions(256);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(""));
        try {
          await huks.exportKeyItem(testNumber, genKeyOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(401);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_4600
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_4600
     * @tc.desc   test Cipher group_aliasNull, errcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_4600";
        let genKeyOptions = GetAesGenerateOptions(128);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(""));
        let cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(12));
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(""));
        let cipherData = BuildCipherData([16]);
        try {
          await Cipher(testNumber, cipherOptions, cipherData);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(401);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_4800
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_4800
     * @tc.desc   test anonAttestKeyItem group_aliasNull, errcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        if(!useSoftware){
          await CheckWifiInfo();
        }
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_4800";
        let attestOptions =
          SetParam(GetAttestKeyOptions(), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(""));
        try {
          await huks.anonAttestKeyItem(testNumber, attestOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(401);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_4900
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_4900
     * @tc.desc   test getKeyItemProperties group_aliasNull, errcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_4900";
        let genKeyOptions =
          SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(""));
        try {
          await huks.getKeyItemProperties(testNumber, genKeyOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(401);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_5000
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_5000
     * @tc.desc   test hasKeyItem group_aliasNull, errcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_5000";
        let genKeyOptions =
          SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(""));
        try {
          await huks.hasKeyItem(testNumber, genKeyOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(401);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_5010
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_5010
     * @tc.desc   test isKeyItemExist group_aliasNull, errcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_5010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_5010";
        let genKeyOptions =
          SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(""));
        try {
          await huks.isKeyItemExist(testNumber, genKeyOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(401);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_5100
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_5100
     * @tc.desc   test listAliases group_aliasNull, errcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_5100";
        let genKeyOptions =
          SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(""));
        try {
          await huks.listAliases(genKeyOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(401);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_5200
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_5200
     * @tc.desc   test deleteKeyItem group_aliasNull, errcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_5200";
        let genKeyOptions =
          SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(""));
        try {
          await huks.deleteKeyItem(testNumber, genKeyOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(401);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_5300
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_5300
     * @tc.desc   test generateKeyItem group_alias not exist, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_5300";
        let genGroupKeyOptions = SetParam(GetAesGenerateOptions(128), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array("group_not_exist"));
        try {
          await huks.generateKeyItem(testNumber, genGroupKeyOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_5400
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_5400
     * @tc.desc   test importKeyItem group_alias not exist, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_5400";
        let genGroupKeyOptions = SetParam(GetAesGenerateOptions(128), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array("group_not_exist"));
        try {
          await huks.importKeyItem(testNumber, SetInData(genGroupKeyOptions, GetAesImportData(128)));
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_5500
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_5500
     * @tc.desc   test importWrappedKeyItem group_alias not exist, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_5500";
        let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
        let wrappedKeySize = 192;
        let genKeyPairOptions = GetEccGenerateOptions(256);
        SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
        SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
        let deviceAPubKeyData =
          (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
        let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
        let importWrappedKeyOption = GetAesGenerateOptions(wrappedKeySize);
        SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE,
          huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
        importWrappedKeyOption.inData = wrappedKeyData;
        try {
          SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
            StringToUint8Array("group_not_exist"));
          await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_5700
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_5700
     * @tc.desc   test alias Derive group_alias not exist, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_5700";
        let genKeyOptions = GetEccGenerateOptions(256);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
        let agreeInitOptions: huks.HuksOptions = GetEcdhAgreeOptions(256);
        let agreeFinishOptions: huks.HuksOptions = GetAesGenerateOptions(256);
        SetParam(agreeFinishOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array("group_not_exist"));
        MergeOptions(agreeFinishOptions, GetDeriveAgreeFinishOptions(testNumber + "_agreed"));
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          await huks.generateKeyItem(testNumber + "_deviceB", genKeyOptions);
          let res = await huks.exportKeyItem(testNumber + "_deviceB", genKeyOptions);
          agreeInitOptions.inData = res.outData;
          await Agree(testNumber, agreeInitOptions, agreeFinishOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_5800
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_5800
     * @tc.desc   test alias DeriveAgree group_alias not exist, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_5800";
        let genKeyOptions = GetAesGenerateOptions(256);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
        let deriveInitOptions: huks.HuksOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha256Options());
        let deriveFinishOptions: huks.HuksOptions = GetAesGenerateOptions(256);
        SetParam(deriveFinishOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array("group_not_exist"));
        MergeOptions(deriveFinishOptions, GetDeriveAgreeFinishOptions(testNumber + "_derived"));
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          await Derive(testNumber, deriveInitOptions, deriveFinishOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_5900
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_5900
     * @tc.desc   test exportKeyItem group_alias not exist, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_5900";
        let genKeyOptions = GetAesGenerateOptions(256);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array("group_not_exist"));
        try {
          await huks.exportKeyItem(testNumber, genKeyOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_6100
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_6100
     * @tc.desc   test Cipher group_alias not exist, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_6100";
        let genKeyOptions = GetAesGenerateOptions(128);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array("group_not_exist"));
        let cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(12));
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array("group_not_exist"));
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
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_6300
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_6300
     * @tc.desc   test anonAttestKeyItem group_alias not exist, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        if(!useSoftware){
          await CheckWifiInfo();
        }
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_6300";
        let attestOptions = SetParam(GetAttestKeyOptions(), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array("group_not_exist"));
        try {
          await huks.anonAttestKeyItem(testNumber, attestOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_6400
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_6400
     * @tc.desc   test getKeyItemProperties group_alias not exist, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_6400";
        let genKeyOptions = SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array("group_not_exist"));
        try {
          await huks.getKeyItemProperties(testNumber, genKeyOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_6500
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_6500
     * @tc.desc   test hasKeyItem group_alias not exist, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_6500";
        let genKeyOptions = SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array("group_not_exist"));
        try {
          await huks.hasKeyItem(testNumber, genKeyOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_6510
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_6510
     * @tc.desc   test hasKeyItem group_alias not exist, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_6510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_6510";
        let genKeyOptions = SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array("group_not_exist"));
        try {
          await huks.isKeyItemExist(testNumber, genKeyOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_6600
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_6600
     * @tc.desc   test listAliases group_alias not exist, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_6600";
        let genKeyOptions = SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array("group_not_exist"));
        try {
          await huks.listAliases(genKeyOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_6700
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_6700
     * @tc.desc   test deleteKeyItem group_alias not exist, errcode 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_6700";
        let genKeyOptions = SetParam(GetEccGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array("group_not_exist"));
        try {
          await huks.deleteKeyItem(testNumber, genKeyOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000018);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_8300
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_8300
     * @tc.desc   test deleteKeyItem group_alias override false, errcode 12000017
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_8300";
        let genGroupKeyOptions = SetParam(GetAesGenerateOptions(128), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMinGroupId));
        SetParam(genGroupKeyOptions, huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, false);
        try {
          await huks.generateKeyItem(testNumber, genGroupKeyOptions);
          await huks.generateKeyItem(testNumber, genGroupKeyOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000017);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_8400
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_8400
     * @tc.desc   test importKeyItem group_alias override false, errcode 12000017
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_8400";
        let genGroupKeyOptions = SetParam(GetAesGenerateOptions(128), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMinGroupId));
        SetParam(genGroupKeyOptions, huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, false);
        try {
          await huks.importKeyItem(testNumber, SetInData(genGroupKeyOptions, GetAesImportData(128)));
          await huks.importKeyItem(testNumber, SetInData(genGroupKeyOptions, GetAesImportData(128)));
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000017);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_8500
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_8500
     * @tc.desc   test importWrappedKeyItem group_alias override false, errcode 12000017
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_8500";
        let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
        let wrappedKeySize = 192;
        let genKeyPairOptions = GetEccGenerateOptions(256);
        SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
        SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
        let deviceAPubKeyData =
          (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
        let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
        let importWrappedKeyOption = GetAesGenerateOptions(wrappedKeySize);
        SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE,
          huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
        SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, false);
        importWrappedKeyOption.inData = wrappedKeyData;
        try {
          SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
          await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
          await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000017);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_8700
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_8700
     * @tc.desc   test alias DeriveAgree group_alias override false, errcode 12000017
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_8700";
        let genKeyOptions = GetEccGenerateOptions(256);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
        let agreeInitOptions: huks.HuksOptions = GetEcdhAgreeOptions(256);
        let agreeFinishOptions: huks.HuksOptions = GetAesGenerateOptions(256);
        SetParam(agreeFinishOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        SetParam(agreeFinishOptions, huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, false);
        MergeOptions(agreeFinishOptions, GetDeriveAgreeFinishOptions(testNumber + "_agreed"));
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          await huks.generateKeyItem(testNumber + "_deviceB", genKeyOptions);
          let res = await huks.exportKeyItem(testNumber + "_deviceB", genKeyOptions);
          agreeInitOptions.inData = res.outData;
          await Agree(testNumber, agreeInitOptions, agreeFinishOptions);
          await Agree(testNumber, agreeInitOptions, agreeFinishOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000017);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_8800
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_8800
     * @tc.desc   test agree group_alias override false, errcode 12000017
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_8800";
        let genKeyOptions = GetAesGenerateOptions(256);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
        let deriveInitOptions: huks.HuksOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha256Options());
        let deriveFinishOptions: huks.HuksOptions = GetAesGenerateOptions(256);
        SetParam(deriveFinishOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        SetParam(deriveFinishOptions, huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, false);
        MergeOptions(deriveFinishOptions, GetDeriveAgreeFinishOptions(testNumber + "_derived"));
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          await Derive(testNumber, deriveInitOptions, deriveFinishOptions);
          await Derive(testNumber, deriveInitOptions, deriveFinishOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000017);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_8900
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_8900
     * @tc.desc   test generateKeyItem group_alias override succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_8900";
        let genGroupKeyOptions = SetParam(GetAesGenerateOptions(128), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMinGroupId));
        SetParam(genGroupKeyOptions, huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, true);
        try {
          await huks.generateKeyItem(testNumber, genGroupKeyOptions);
          await huks.generateKeyItem(testNumber, genGroupKeyOptions);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_9000
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_9000
     * @tc.desc   test importKeyItem group_alias override succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_9000";
        let genGroupKeyOptions = SetParam(GetAesGenerateOptions(128), huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP,
          StringToUint8Array(HuksMinGroupId));
        SetParam(genGroupKeyOptions, huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, true);
        try {
          await huks.importKeyItem(testNumber, SetInData(genGroupKeyOptions, GetAesImportData(128)));
          await huks.importKeyItem(testNumber, SetInData(genGroupKeyOptions, GetAesImportData(128)));
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_9100
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_9100
     * @tc.desc   test importWrappedKeyItem group_alias override succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_9100";
        let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
        let wrappedKeySize = 192;
        let genKeyPairOptions = GetEccGenerateOptions(256);
        SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
        SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
        let deviceAPubKeyData =
          (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
        let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
        let importWrappedKeyOption = GetAesGenerateOptions(wrappedKeySize);
        SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE,
          huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
        SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, true);
        importWrappedKeyOption.inData = wrappedKeyData;
        try {
          SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
          await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
          await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_9300
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_9300
     * @tc.desc   test exportKeyItem group_alias override succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_9300";
        let genKeyOptions = GetEccGenerateOptions(256);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
        let agreeInitOptions: huks.HuksOptions = GetEcdhAgreeOptions(256);
        let agreeFinishOptions: huks.HuksOptions = GetAesGenerateOptions(256);
        SetParam(agreeFinishOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        SetParam(agreeFinishOptions, huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, true);
        MergeOptions(agreeFinishOptions, GetDeriveAgreeFinishOptions(testNumber + "_agreed"));
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          await huks.generateKeyItem(testNumber + "_deviceB", genKeyOptions);
          let res = await huks.exportKeyItem(testNumber + "_deviceB", genKeyOptions);
          agreeInitOptions.inData = res.outData;
          await Agree(testNumber, agreeInitOptions, agreeFinishOptions);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Group_API23_Func_9400
     * @tc.number SUB_Security_HUKS_AccessControl_Group_API23_Func_9400
     * @tc.desc   test agree group_alias override succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Group_API23_Func_9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Group_API23_Func_9400";
        let genKeyOptions = GetAesGenerateOptions(256);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
        let deriveInitOptions: huks.HuksOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha256Options());
        let deriveFinishOptions: huks.HuksOptions = GetAesGenerateOptions(256);
        SetParam(deriveFinishOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        SetParam(deriveFinishOptions, huks.HuksTag.HUKS_TAG_KEY_OVERRIDE, true);
        MergeOptions(deriveFinishOptions, GetDeriveAgreeFinishOptions(testNumber + "_derived"));
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          await Derive(testNumber, deriveInitOptions, deriveFinishOptions);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })


    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Groups_API23_Func_1300
     * @tc.number SUB_Security_HUKS_AccessControl_Groups_API23_Func_1300
     * @tc.desc   test exportKeyItem another group, errcode 12000011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Groups_API23_Func_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Groups_API23_Func_1300";
        let genKeyOptions = GetEccGenerateOptions(256);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        try {
          await huks.generateKeyItem(testNumber, genKeyOptions);
          SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMaxGroupId));
          await huks.exportKeyItem(testNumber, genKeyOptions);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000011);
        }
      })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_Groups_API23_Func_1700
     * @tc.number SUB_Security_HUKS_AccessControl_Groups_API23_Func_1700
     * @tc.desc   test Cipher A/C/D group succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_Groups_API23_Func_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        let testNumber: string = "SUB_Security_HUKS_AccessControl_Groups_API23_Func_1700";
        let genKeyOptions = GetAesGenerateOptions(256);
        SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        let cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(12));
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP, StringToUint8Array(HuksMinGroupId));
        let cipherData = BuildCipherData([16]);
        try {
          SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL,
            huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_DE);
          SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL,
            huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_DE);
          await huks.generateKeyItem(testNumber + "_de", genKeyOptions);
          let res1 = await Cipher(testNumber + "_de", cipherOptions, cipherData);
          expect(res1).assertEqual(true);
          SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL,
            huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE);
          SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL,
            huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE);
          await huks.generateKeyItem(testNumber + "_ce", genKeyOptions);
          let res2 = await Cipher(testNumber + "_ce", cipherOptions, cipherData);
          expect(res2).assertEqual(true);
          SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL,
            huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_ECE);
          SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL,
            huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_ECE);
          await huks.generateKeyItem(testNumber + "_ece", genKeyOptions);
          let res3 = await Cipher(testNumber + "_ece", cipherOptions, cipherData);
          expect(res3).assertEqual(true);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      })
  })
}
