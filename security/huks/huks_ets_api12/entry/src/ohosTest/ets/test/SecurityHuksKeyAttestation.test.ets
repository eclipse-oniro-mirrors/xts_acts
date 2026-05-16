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
import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import huks from '@ohos.security.huks';
import { CheckSoftware, DeleteParam, GenParam, MergeOptions, SetParam } from './utils/huks/HuksOptionsUtils';
import {
  GetAesGenerateOptions,
  GetEccGenerateOptions,
  GetEd25519GenerateOptions,
  GetRsaGenerateOptions,
  GetX25519GenerateOptions
} from './utils/huks/GenerateKeyUtils';
import { GetAttestKeyBaseOptions, GetAttestKeyOptions } from './utils/huks/AttestKeyUtils';
import { GetImportPubKeyOptions } from './utils/huks/ImportKeyUtils';
import { Logger } from './utils/common/Logger';
import { CheckWifiInfo } from './utils/common/NetworkUtils';
import { StringToUint8Array } from './utils/common/CommonUtils';


export default function SecurityHuksKeyAttestationTest() {
  let useSoftware: boolean = true;
  describe('SecurityHuksKeyAttestationTest', () => {
    beforeAll(async () => {
      useSoftware = await CheckSoftware();
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0100
     * @tc.number SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0100
     * @tc.desc   generate key, anonAttest key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      if (!useSoftware) {
        await CheckWifiInfo();
      }
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0100";
      let genKeyOptions: huks.HuksOptions = GetX25519GenerateOptions(256);
      let anonAttestKeyOptions: huks.HuksOptions = MergeOptions(GetX25519GenerateOptions(256), GetAttestKeyOptions());
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        let res = (await huks.anonAttestKeyItem(testNumber, anonAttestKeyOptions)).certChains as Array<string>;
        expect(res.length).assertEqual(3);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${err.code}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0200
     * @tc.number SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0200
     * @tc.desc   import key, anonAttest key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      if (!useSoftware) {
        await CheckWifiInfo();
      }
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0200";
      let genKeyOptions: huks.HuksOptions = GetX25519GenerateOptions(256);
      let importPubKeyOptions: huks.HuksOptions = MergeOptions(GetX25519GenerateOptions(256), GetImportPubKeyOptions());
      let anonAttestKeyOptions: huks.HuksOptions = MergeOptions(GetX25519GenerateOptions(256), GetAttestKeyOptions());
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        importPubKeyOptions.inData = (await huks.exportKeyItem(testNumber, genKeyOptions)).outData as Uint8Array;
        let importKeyAlias: string = testNumber + "pub";
        await huks.importKeyItem(importKeyAlias, importPubKeyOptions);
        let res = (await huks.anonAttestKeyItem(importKeyAlias, anonAttestKeyOptions)).certChains as Array<string>;
        expect(res.length).assertEqual(3);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${err.code}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0300
     * @tc.number SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0300
     * @tc.desc   generate key, anonAttest key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      if (!useSoftware) {
        await CheckWifiInfo();
      }
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0300";
      let genKeyOptions: huks.HuksOptions = GetEd25519GenerateOptions(256);
      let anonAttestKeyOptions: huks.HuksOptions = MergeOptions(GetEd25519GenerateOptions(256), GetAttestKeyOptions());
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        let res = (await huks.anonAttestKeyItem(testNumber, anonAttestKeyOptions)).certChains as Array<string>;
        expect(res.length).assertEqual(3);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${err.code}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0400
     * @tc.number SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0400
     * @tc.desc   import key, anonAttest key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      if (!useSoftware) {
        await CheckWifiInfo();
      }
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0400";
      let genKeyOptions: huks.HuksOptions = GetEd25519GenerateOptions(256);
      let importPubKeyOptions: huks.HuksOptions = MergeOptions(GetEd25519GenerateOptions(256), GetImportPubKeyOptions());
      let anonAttestKeyOptions: huks.HuksOptions = MergeOptions(GetEd25519GenerateOptions(256), GetAttestKeyOptions());
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        importPubKeyOptions.inData = (await huks.exportKeyItem(testNumber, genKeyOptions)).outData as Uint8Array;
        SetParam(importPubKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        let importKeyAlias: string = testNumber + "pub";
        await huks.importKeyItem(importKeyAlias, importPubKeyOptions);
        let res = (await huks.anonAttestKeyItem(importKeyAlias, anonAttestKeyOptions)).certChains as Array<string>;
        expect(res.length).assertEqual(3);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${err.code}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0100
     * @tc.number SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0100
     * @tc.desc   import key, anonAttest key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      if (!useSoftware) {
        await CheckWifiInfo();
      }
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0100";
      let keyAlias: string = testNumber;

      let genKeyOptions: huks.HuksOptions = GetEccGenerateOptions(256);
      let attestKeyOptions: huks.HuksOptions = GetAttestKeyOptions();

      await huks.generateKeyItem(keyAlias, genKeyOptions);

      try {
        let res = (await huks.anonAttestKeyItemOffline(keyAlias, attestKeyOptions.properties)).certChains as Array<string>;
        expect(res.length).assertEqual(4);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0200
     * @tc.number SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0200
     * @tc.desc   import key, anonAttest key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      if (!useSoftware) {
        await CheckWifiInfo();
      }
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0200";
      let keyAlias: string = testNumber;

      let genKeyOptions: huks.HuksOptions = GetEccGenerateOptions(256);
      let attestKeyOptions: huks.HuksOptions = GetAttestKeyBaseOptions();

      await huks.generateKeyItem(keyAlias, genKeyOptions);

      try {
        let res = (await huks.anonAttestKeyItemOffline(keyAlias, attestKeyOptions.properties)).certChains as Array<string>;
        expect(res.length).assertEqual(4);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0300
     * @tc.number SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0300
     * @tc.desc   import key, anonAttest key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      if (!useSoftware) {
        return;
      }
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0300";
      let keyAlias: string = testNumber;

      let genKeyOptions: huks.HuksOptions = GetEccGenerateOptions(224);
      let attestKeyOptions: huks.HuksOptions = GetAttestKeyBaseOptions();

      await huks.generateKeyItem(keyAlias, genKeyOptions);

      try {
        await huks.anonAttestKeyItemOffline(keyAlias, attestKeyOptions.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000012);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0400
     * @tc.number SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0400
     * @tc.desc   import key, anonAttest key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      if (!useSoftware) {
        await CheckWifiInfo();
      }
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0400";
      let keyAlias: string = testNumber;

      let genKeyOptions: huks.HuksOptions = GetEccGenerateOptions(256);
      let attestKeyOptions: huks.HuksOptions = GetAttestKeyBaseOptions();

      await huks.generateKeyItem(keyAlias, genKeyOptions);

      try {
        let res = (await huks.anonAttestKeyItemOffline(keyAlias, attestKeyOptions.properties)).certChains as Array<string>;
        expect(res.length).assertEqual(4);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0500
     * @tc.number SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0500
     * @tc.desc   import key, anonAttest key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      if (!useSoftware) {
        await CheckWifiInfo();
      }
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0500";
      let keyAlias: string = testNumber;

      let genKeyOptions: huks.HuksOptions = GetEccGenerateOptions(384);
      let attestKeyOptions: huks.HuksOptions = GetAttestKeyBaseOptions();

      await huks.generateKeyItem(keyAlias, genKeyOptions);

      try {
        let res = (await huks.anonAttestKeyItemOffline(keyAlias, attestKeyOptions.properties)).certChains as Array<string>;
        expect(res.length).assertEqual(4);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0600
     * @tc.number SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0600
     * @tc.desc   import key, anonAttest key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      if (!useSoftware) {
        await CheckWifiInfo();
      }
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0600";
      let keyAlias: string = testNumber;

      let genKeyOptions: huks.HuksOptions = GetEccGenerateOptions(521);
      let attestKeyOptions: huks.HuksOptions = GetAttestKeyBaseOptions();

      await huks.generateKeyItem(keyAlias, genKeyOptions);

      try {
        let res = (await huks.anonAttestKeyItemOffline(keyAlias, attestKeyOptions.properties)).certChains as Array<string>;
        expect(res.length).assertEqual(4);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0700
     * @tc.number SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0700
     * @tc.desc   import key, anonAttest key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      if (!useSoftware) {
        await CheckWifiInfo();
      }
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0700";
      let keyAlias: string = testNumber;

      let genKeyOptions: huks.HuksOptions = GetRsaGenerateOptions(1024);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS1_V1_5);
      let attestKeyOptions: huks.HuksOptions = GetAttestKeyBaseOptions();

      await huks.generateKeyItem(keyAlias, genKeyOptions);

      try {
        let res = (await huks.anonAttestKeyItemOffline(keyAlias, attestKeyOptions.properties)).certChains as Array<string>;
        expect(res.length).assertEqual(4);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0800
     * @tc.number SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0800
     * @tc.desc   generate RSA1032 key, anonAttest key offline
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      if (!useSoftware) {
        await CheckWifiInfo();
      }
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0800";
      let keyAlias: string = testNumber;

      let genKeyOptions: huks.HuksOptions = GetRsaGenerateOptions(1032);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS1_V1_5);
      let attestKeyOptions: huks.HuksOptions = GetAttestKeyBaseOptions();

      await huks.generateKeyItem(keyAlias, genKeyOptions);

      try {
        let res = (await huks.anonAttestKeyItemOffline(keyAlias, attestKeyOptions.properties)).certChains as Array<string>;
        expect(res.length).assertEqual(4);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0900
     * @tc.number SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0900
     * @tc.desc   generate RSA2040 key, anonAttest key offline
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      if (!useSoftware) {
        await CheckWifiInfo();
      }
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_0900";
      let keyAlias: string = testNumber;

      let genKeyOptions: huks.HuksOptions = GetRsaGenerateOptions(2040);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS1_V1_5);
      let attestKeyOptions: huks.HuksOptions = GetAttestKeyBaseOptions();

      await huks.generateKeyItem(keyAlias, genKeyOptions);

      try {
        let res = (await huks.anonAttestKeyItemOffline(keyAlias, attestKeyOptions.properties)).certChains as Array<string>;
        expect(res.length).assertEqual(4);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1000
     * @tc.number SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1000
     * @tc.desc   generate RSA2048 key, anonAttest key offline
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      if (!useSoftware) {
        await CheckWifiInfo();
      }
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1000";
      let keyAlias: string = testNumber;

      let genKeyOptions: huks.HuksOptions = GetRsaGenerateOptions(2048);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS1_V1_5);
      let attestKeyOptions: huks.HuksOptions = GetAttestKeyBaseOptions();

      await huks.generateKeyItem(keyAlias, genKeyOptions);

      try {
        let res = (await huks.anonAttestKeyItemOffline(keyAlias, attestKeyOptions.properties)).certChains as Array<string>;
        expect(res.length).assertEqual(4);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1100
     * @tc.number SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1100
     * @tc.desc   generate RSA3072 key, anonAttest key offline
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      if (!useSoftware) {
        await CheckWifiInfo();
      }
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1100";
      let keyAlias: string = testNumber;

      let genKeyOptions: huks.HuksOptions = GetRsaGenerateOptions(3072);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS1_V1_5);
      let attestKeyOptions: huks.HuksOptions = GetAttestKeyBaseOptions();

      await huks.generateKeyItem(keyAlias, genKeyOptions);

      try {
        let res = (await huks.anonAttestKeyItemOffline(keyAlias, attestKeyOptions.properties)).certChains as Array<string>;
        expect(res.length).assertEqual(4);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1200
     * @tc.number SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1200
     * @tc.desc   generate RSA4096 key, anonAttest key offline
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      if (!useSoftware) {
        await CheckWifiInfo();
      }
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1200";
      let keyAlias: string = testNumber;

      let genKeyOptions: huks.HuksOptions = GetRsaGenerateOptions(4096);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS1_V1_5);
      let attestKeyOptions: huks.HuksOptions = GetAttestKeyBaseOptions();

      await huks.generateKeyItem(keyAlias, genKeyOptions);

      try {
        let res = (await huks.anonAttestKeyItemOffline(keyAlias, attestKeyOptions.properties)).certChains as Array<string>;
        expect(res.length).assertEqual(4);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1300
     * @tc.number SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1300
     * @tc.desc   generate RSA512 key, anonAttest key offline
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      if (!useSoftware) {
        return;
      }
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1300";
      let keyAlias: string = testNumber;

      let genKeyOptions: huks.HuksOptions = GetRsaGenerateOptions(512);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS1_V1_5);
      let attestKeyOptions: huks.HuksOptions = GetAttestKeyBaseOptions();

      await huks.generateKeyItem(keyAlias, genKeyOptions);

      try {
        let res = (await huks.anonAttestKeyItemOffline(keyAlias, attestKeyOptions.properties)).certChains as Array<string>;
        expect(res.length).assertEqual(4);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1400
     * @tc.number SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1400
     * @tc.desc   generate RSA768 key, anonAttest key offline
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      if (!useSoftware) {
        return;
      }
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1400";
      let keyAlias: string = testNumber;

      let genKeyOptions: huks.HuksOptions = GetRsaGenerateOptions(768);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS1_V1_5);
      let attestKeyOptions: huks.HuksOptions = GetAttestKeyBaseOptions();

      await huks.generateKeyItem(keyAlias, genKeyOptions);

      try {
        let res = (await huks.anonAttestKeyItemOffline(keyAlias, attestKeyOptions.properties)).certChains as Array<string>;
        expect(res.length).assertEqual(4);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1500
     * @tc.number SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1500
     * @tc.desc   generate ED25519 key, anonAttest key offline
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      if (!useSoftware) {
        await CheckWifiInfo();
      }
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1500";
      let keyAlias: string = testNumber;

      let genKeyOptions: huks.HuksOptions = GetEd25519GenerateOptions(256);
      let attestKeyOptions: huks.HuksOptions = GetAttestKeyBaseOptions();

      await huks.generateKeyItem(keyAlias, genKeyOptions);

      try {
        let res = (await huks.anonAttestKeyItemOffline(keyAlias, attestKeyOptions.properties)).certChains as Array<string>;
        expect(res.length).assertEqual(4);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1600
     * @tc.number SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1600
     * @tc.desc   generate X25519 key, anonAttest key offline
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      if (!useSoftware) {
        await CheckWifiInfo();
      }
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1600";
      let keyAlias: string = testNumber;

      let genKeyOptions: huks.HuksOptions = GetX25519GenerateOptions(256);
      let attestKeyOptions: huks.HuksOptions = GetAttestKeyBaseOptions();

      await huks.generateKeyItem(keyAlias, genKeyOptions);

      try {
        let res = (await huks.anonAttestKeyItemOffline(keyAlias, attestKeyOptions.properties)).certChains as Array<string>;
        expect(res.length).assertEqual(4);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1700
     * @tc.number SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1700
     * @tc.desc   generate AES128 key, anonAttest key offline
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      if (!useSoftware) {
        await CheckWifiInfo();
      }
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1700";
      let keyAlias: string = testNumber;

      let genKeyOptions: huks.HuksOptions = GetAesGenerateOptions(128);
      let attestKeyOptions: huks.HuksOptions = GetAttestKeyBaseOptions();

      await huks.generateKeyItem(keyAlias, genKeyOptions);

      try {
        await huks.anonAttestKeyItemOffline(keyAlias, attestKeyOptions.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000018);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1800
     * @tc.number SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1800
     * @tc.desc   generate AES256 key, anonAttest key offline
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      if (!useSoftware) {
        await CheckWifiInfo();
      }
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1800";
      let keyAlias: string = testNumber;

      let genKeyOptions: huks.HuksOptions = GetAesGenerateOptions(256);
      let attestKeyOptions: huks.HuksOptions = GetAttestKeyBaseOptions();

      await huks.generateKeyItem(keyAlias, genKeyOptions);

      try {
        await huks.anonAttestKeyItemOffline(keyAlias, attestKeyOptions.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000018);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1900
     * @tc.number SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1900
     * @tc.desc   generate RSA2048 key with OAEP, anonAttest key offline
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      if (!useSoftware) {
        await CheckWifiInfo();
      }
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_1900";
      let keyAlias: string = testNumber;

      let genKeyOptions: huks.HuksOptions = GetRsaGenerateOptions(2048);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_OAEP);
      let attestKeyOptions: huks.HuksOptions = GetAttestKeyBaseOptions();

      await huks.generateKeyItem(keyAlias, genKeyOptions);

      try {
        let res = (await huks.anonAttestKeyItemOffline(keyAlias, attestKeyOptions.properties)).certChains as Array<string>;
        expect(res.length).assertEqual(4);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_2000
     * @tc.number SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_2000
     * @tc.desc   generate RSA2048 key without padding, anonAttest key offline
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      if (!useSoftware) {
        await CheckWifiInfo();
      }
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_2000";
      let keyAlias: string = testNumber;

      let genKeyOptions: huks.HuksOptions = GetRsaGenerateOptions(2048);
      let attestKeyOptions: huks.HuksOptions = GetAttestKeyBaseOptions();

      await huks.generateKeyItem(keyAlias, genKeyOptions);

      try {
        let res = (await huks.anonAttestKeyItemOffline(keyAlias, attestKeyOptions.properties)).certChains as Array<string>;
        expect(res.length).assertEqual(4);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_2100
     * @tc.number SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_2100
     * @tc.desc   generate RSA2048 key with PSS, anonAttest key offline
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      if (!useSoftware) {
        await CheckWifiInfo();
      }
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_2100";
      let keyAlias: string = testNumber;

      let genKeyOptions: huks.HuksOptions = GetRsaGenerateOptions(2048);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PSS);
      let attestKeyOptions: huks.HuksOptions = GetAttestKeyBaseOptions();

      await huks.generateKeyItem(keyAlias, genKeyOptions);

      try {
        let res = (await huks.anonAttestKeyItemOffline(keyAlias, attestKeyOptions.properties)).certChains as Array<string>;
        expect(res.length).assertEqual(4);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_2200
     * @tc.number SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_2200
     * @tc.desc   attestKeyOptions missing challenge parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      if (!useSoftware) {
        await CheckWifiInfo();
      }
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_2200";
      let keyAlias: string = testNumber;

      let genKeyOptions: huks.HuksOptions = GetEccGenerateOptions(256);
      let attestKeyOptions: huks.HuksOptions = DeleteParam(GetAttestKeyBaseOptions(), huks.HuksTag.HUKS_TAG_ATTESTATION_CHALLENGE);

      await huks.generateKeyItem(keyAlias, genKeyOptions);

      try {
        await huks.anonAttestKeyItemOffline(keyAlias, attestKeyOptions.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000018);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_2300
     * @tc.number SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_2300
     * @tc.desc   attestKeyOptions missing id alias parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      if (!useSoftware) {
        await CheckWifiInfo();
      }
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_2300";
      let keyAlias: string = testNumber;

      let genKeyOptions: huks.HuksOptions = GetEccGenerateOptions(256);
      let attestKeyOptions: huks.HuksOptions = DeleteParam(GetAttestKeyBaseOptions(), huks.HuksTag.HUKS_TAG_ATTESTATION_ID_ALIAS);

      await huks.generateKeyItem(keyAlias, genKeyOptions);

      try {
        let res = (await huks.anonAttestKeyItemOffline(keyAlias, attestKeyOptions.properties)).certChains as Array<string>;
        expect(res.length).assertEqual(4);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_2500
     * @tc.number SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_2500
     * @tc.desc   attest key without generating key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      if (!useSoftware) {
        await CheckWifiInfo();
      }
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKeyOffline_API26_Func_2500";
      let keyAlias: string = testNumber;

      let attestKeyOptions: huks.HuksOptions = GetAttestKeyBaseOptions();

      try {
        await huks.anonAttestKeyItemOffline(keyAlias, attestKeyOptions.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000011);
      }
    })

  })
}