/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import huks from '@ohos.security.huks';

import { CheckSoftware, MergeOptions, SetParam } from './utils/huks/HuksOptionsUtils';
import {
  GetAesGenerateOptions,
  GetDsaGenerateOptions,
  GetEccGenerateOptions,
  GetEd25519GenerateOptions,
  GetHmacGenerateOptions,
  GetRsaGenerateOptions,
  GetSm2GenerateOptions,
  GetSm4GenerateOptions,
  GetX25519GenerateOptions
} from './utils/huks/GenerateKeyUtils';
import { GetNoDigestSignOptions, GetSha1SignOptions, GetSha256SignOptions, GetSm3SignOptions } from './utils/huks/SignVerifyUtils';
import {
  GetAesImportData,
  GetDsaImportData,
  GetEccImportData,
  GetEd25519ImportData,
  GetImportKeyPairOptions,
  GetRsaImportData,
  GetSm2ImportData,
  GetX25519ImportData
} from './utils/huks/ImportKeyUtils';
import { GetCbcNoPaddingOptions, GetEcbNoPaddingOptions } from './utils/huks/CipherUtils';
import {
  GetEcdhAgreeOptions,
  GetNoDigestOptions,
  GetSha1Options,
  GetSha256Options,
  GetSm3Options
} from './utils/huks/DeriveAgreeUtils';
import { BuildWrappedKeyData } from './utils/huks/ImportWrappedKeyUtils';
import { Logger } from './utils/common/Logger';

let useSoftware = true;

export default function SecurityHuksImport() {
  describe('SecurityHuksImport', () => {
    beforeAll(async () => {
      useSoftware = await CheckSoftware();
    });
    /**
     * @tc.name   Security_HUKS_Import_API9_0100
     * @tc.number Security_HUKS_Import_API9_0100
     * @tc.desc   Security_HUKS_Import_API9_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Import_API9_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Import_API9_0100';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetNoDigestSignOptions(), GetEccGenerateOptions(256), GetImportKeyPairOptions());
      genOptions.inData = GetEccImportData(256);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await huks.importKeyItem(srcKeyAlias, genOptions);
        await huks.importKeyItem(srcKeyAlias, genOptions);

        await huks.deleteKeyItem(srcKeyAlias, genOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Import_API9_0200
     * @tc.number Security_HUKS_Import_API9_0200
     * @tc.desc   Security_HUKS_Import_API9_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Import_API9_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Import_API9_0200';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetNoDigestSignOptions(), GetEccGenerateOptions(256), GetImportKeyPairOptions());
      genOptions.inData = GetDsaImportData(2048);

      try {
        await huks.importKeyItem(srcKeyAlias, genOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + ` catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   Security_HUKS_Import_API9_0300
     * @tc.number Security_HUKS_Import_API9_0300
     * @tc.desc   Security_HUKS_Import_API9_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Import_API9_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Import_API9_0300';
      let srcKeyAlias = testNumber;
      let deviceAKeyPairAlias: string = srcKeyAlias + "_deviceAKeyPairAlias";

      let keyPairSize = 256;
      let agreeKeySize = 256;
      let plainKeySize = 192;
      let kekSize = 256;

      let genKeyPairOptions = GetEccGenerateOptions(keyPairSize);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      let agreeInitOptions = MergeOptions(GetEccGenerateOptions(keyPairSize), GetEcdhAgreeOptions(keyPairSize));
      let importWrappedKeyOptions = GetAesGenerateOptions(plainKeySize);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);

      try {
        // 设备A使用预先约定好的协商算法，生成用于importWrappedKeyItem的密钥对，并导出公钥发送给设备B
        await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
        let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
        agreeInitOptions.inData = deviceAPubKeyData;

        // 设备B获取到设备A的公钥，使用预先约定好的协商算法，随后通过协商密钥、kek、plainKey进行两级加密，获取kek、plainKey加密后的blob
        SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
        let wrappedKeyData = await BuildWrappedKeyData(genKeyPairOptions, agreeInitOptions, agreeKeySize, kekSize, plainKeySize);

        // 设备A获取后加密后的blob，使用生成密钥对的私钥，进行解封装并落盘
        importWrappedKeyOptions.inData = wrappedKeyData;
        await huks.importWrappedKeyItem(srcKeyAlias, deviceAKeyPairAlias, importWrappedKeyOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Import_API9_0400
     * @tc.number Security_HUKS_Import_API9_0400
     * @tc.desc   Security_HUKS_Import_API9_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Import_API9_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Import_API9_0400';
      let srcKeyAlias = testNumber;
      let deviceAKeyPairAlias: string = srcKeyAlias + "_deviceAKeyPairAlias";

      let keyPairSize = 256;
      let agreeKeySize = 256;
      let plainKeySize = 192;
      let kekSize = 256;

      let genKeyPairOptions = GetX25519GenerateOptions(keyPairSize);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      let agreeInitOptions = GetX25519GenerateOptions(keyPairSize);
      let importWrappedKeyOptions = GetAesGenerateOptions(plainKeySize);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_X25519_AES_256_GCM_NOPADDING);

      try {
        // 设备A使用预先约定好的协商算法，生成用于importWrappedKeyItem的密钥对，并导出公钥发送给设备B
        await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
        let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
        agreeInitOptions.inData = deviceAPubKeyData;

        // 设备B获取到设备A的公钥，使用预先约定好的协商算法，随后通过协商密钥、kek、plainKey进行两级加密，获取kek、plainKey加密后的blob
        SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
        let wrappedKeyData = await BuildWrappedKeyData(genKeyPairOptions, agreeInitOptions, agreeKeySize, kekSize, plainKeySize);

        // 设备A获取后加密后的blob，使用生成密钥对的私钥，进行解封装并落盘
        importWrappedKeyOptions.inData = wrappedKeyData;
        await huks.importWrappedKeyItem(srcKeyAlias, deviceAKeyPairAlias, importWrappedKeyOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Import_API9_0500
     * @tc.number Security_HUKS_Import_API9_0500
     * @tc.desc   Security_HUKS_Import_API9_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Import_API9_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Import_API9_0500';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcNoPaddingOptions(16), GetNoDigestOptions());
      genOptions.inData = GetAesImportData(128);

      try {
        await huks.importKeyItem(srcKeyAlias, genOptions);

        await huks.deleteKeyItem(srcKeyAlias, genOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Import_API9_0600
     * @tc.number Security_HUKS_Import_API9_0600
     * @tc.desc   Security_HUKS_Import_API9_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Import_API9_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Import_API9_0600';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetAesGenerateOptions(192), GetCbcNoPaddingOptions(16), GetNoDigestOptions());
      genOptions.inData = GetAesImportData(192);

      try {
        await huks.importKeyItem(srcKeyAlias, genOptions);

        await huks.deleteKeyItem(srcKeyAlias, genOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Import_API9_0700
     * @tc.number Security_HUKS_Import_API9_0700
     * @tc.desc   Security_HUKS_Import_API9_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Import_API9_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Import_API9_0700';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetAesGenerateOptions(256), GetCbcNoPaddingOptions(16), GetNoDigestOptions());
      genOptions.inData = GetAesImportData(256);

      try {
        await huks.importKeyItem(srcKeyAlias, genOptions);

        await huks.deleteKeyItem(srcKeyAlias, genOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Import_API9_0900
     * @tc.number Security_HUKS_Import_API9_0900
     * @tc.desc   Security_HUKS_Import_API9_0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Import_API9_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Import_API9_0900';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetRsaGenerateOptions(512), GetEcbNoPaddingOptions(), GetSha256Options(), GetImportKeyPairOptions());
      genOptions.inData = GetRsaImportData(512);

      if (useSoftware) {
        try {
          await huks.importKeyItem(srcKeyAlias, genOptions);

          await huks.deleteKeyItem(srcKeyAlias, genOptions);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   Security_HUKS_Import_API9_1000
     * @tc.number Security_HUKS_Import_API9_1000
     * @tc.desc   Security_HUKS_Import_API9_1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Import_API9_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Import_API9_1000';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetRsaGenerateOptions(768), GetEcbNoPaddingOptions(), GetSha256Options(), GetImportKeyPairOptions());
      genOptions.inData = GetRsaImportData(768);

      if (useSoftware) {
        try {
          await huks.importKeyItem(srcKeyAlias, genOptions);

          await huks.deleteKeyItem(srcKeyAlias, genOptions);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   Security_HUKS_Import_API9_1100
     * @tc.number Security_HUKS_Import_API9_1100
     * @tc.desc   Security_HUKS_Import_API9_1100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Import_API9_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Import_API9_1100';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetRsaGenerateOptions(1024), GetEcbNoPaddingOptions(), GetSha256Options(), GetImportKeyPairOptions());
      genOptions.inData = GetRsaImportData(1024);

      try {
        await huks.importKeyItem(srcKeyAlias, genOptions);

        await huks.deleteKeyItem(srcKeyAlias, genOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Import_API9_1200
     * @tc.number Security_HUKS_Import_API9_1200
     * @tc.desc   Security_HUKS_Import_API9_1200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Import_API9_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Import_API9_1200';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetRsaGenerateOptions(2048), GetEcbNoPaddingOptions(), GetSha256Options(), GetImportKeyPairOptions());
      genOptions.inData = GetRsaImportData(2048);

      try {
        await huks.importKeyItem(srcKeyAlias, genOptions);

        await huks.deleteKeyItem(srcKeyAlias, genOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Import_API9_1300
     * @tc.number Security_HUKS_Import_API9_1300
     * @tc.desc   Security_HUKS_Import_API9_1300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Import_API9_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Import_API9_1300';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetRsaGenerateOptions(3072), GetEcbNoPaddingOptions(), GetSha256Options(), GetImportKeyPairOptions());
      genOptions.inData = GetRsaImportData(3072);

      try {
        await huks.importKeyItem(srcKeyAlias, genOptions);

        await huks.deleteKeyItem(srcKeyAlias, genOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Import_API9_1400
     * @tc.number Security_HUKS_Import_API9_1400
     * @tc.desc   Security_HUKS_Import_API9_1400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Import_API9_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Import_API9_1400';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetRsaGenerateOptions(4096), GetEcbNoPaddingOptions(), GetSha256Options(), GetImportKeyPairOptions());
      genOptions.inData = GetRsaImportData(4096);

      try {
        await huks.importKeyItem(srcKeyAlias, genOptions);

        await huks.deleteKeyItem(srcKeyAlias, genOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Import_API9_1500
     * @tc.number Security_HUKS_Import_API9_1500
     * @tc.desc   Security_HUKS_Import_API9_1500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Import_API9_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Import_API9_1500';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetHmacGenerateOptions(512), GetSha1Options());
      genOptions.inData = GetAesImportData(512);

      if (useSoftware) {
        try {
          await huks.importKeyItem(srcKeyAlias, genOptions);

          await huks.deleteKeyItem(srcKeyAlias, genOptions);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   Security_HUKS_Import_API9_1600
     * @tc.number Security_HUKS_Import_API9_1600
     * @tc.desc   Security_HUKS_Import_API9_1600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Import_API9_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Import_API9_1600';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetEccGenerateOptions(224), GetNoDigestSignOptions(), GetImportKeyPairOptions());
      genOptions.inData = GetEccImportData(224);

      if (useSoftware) {
        try {
          await huks.importKeyItem(srcKeyAlias, genOptions);

          await huks.deleteKeyItem(srcKeyAlias, genOptions);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   Security_HUKS_Import_API9_1700
     * @tc.number Security_HUKS_Import_API9_1700
     * @tc.desc   Security_HUKS_Import_API9_1700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Import_API9_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Import_API9_1700';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetEccGenerateOptions(256), GetNoDigestSignOptions(), GetImportKeyPairOptions());
      genOptions.inData = GetEccImportData(256);

      try {
        await huks.importKeyItem(srcKeyAlias, genOptions);

        await huks.deleteKeyItem(srcKeyAlias, genOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Import_API9_1800
     * @tc.number Security_HUKS_Import_API9_1800
     * @tc.desc   Security_HUKS_Import_API9_1800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Import_API9_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Import_API9_1800';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetEccGenerateOptions(384), GetNoDigestSignOptions(), GetImportKeyPairOptions());
      genOptions.inData = GetEccImportData(384);

      try {
        await huks.importKeyItem(srcKeyAlias, genOptions);

        await huks.deleteKeyItem(srcKeyAlias, genOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Import_API9_1900
     * @tc.number Security_HUKS_Import_API9_1900
     * @tc.desc   Security_HUKS_Import_API9_1900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Import_API9_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Import_API9_1900';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetEccGenerateOptions(521), GetNoDigestSignOptions(), GetImportKeyPairOptions());
      genOptions.inData = GetEccImportData(521);

      try {
        await huks.importKeyItem(srcKeyAlias, genOptions);

        await huks.deleteKeyItem(srcKeyAlias, genOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Import_API9_2000
     * @tc.number Security_HUKS_Import_API9_2000
     * @tc.desc   Security_HUKS_Import_API9_2000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Import_API9_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Import_API9_2000';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetEccGenerateOptions(224), GetNoDigestSignOptions(), GetCbcNoPaddingOptions(16), GetImportKeyPairOptions());
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
      genOptions.inData = GetEccImportData(224);

      if (useSoftware) {
        try {
          await huks.importKeyItem(srcKeyAlias, genOptions);

          await huks.deleteKeyItem(srcKeyAlias, genOptions);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   Security_HUKS_Import_API9_2100
     * @tc.number Security_HUKS_Import_API9_2100
     * @tc.desc   Security_HUKS_Import_API9_2100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Import_API9_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Import_API9_2100';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetEccGenerateOptions(256), GetNoDigestSignOptions(), GetCbcNoPaddingOptions(16), GetImportKeyPairOptions());
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
      genOptions.inData = GetEccImportData(256);

      if (useSoftware) {
        try {
          await huks.importKeyItem(srcKeyAlias, genOptions);

          await huks.deleteKeyItem(srcKeyAlias, genOptions);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   Security_HUKS_Import_API9_2200
     * @tc.number Security_HUKS_Import_API9_2200
     * @tc.desc   Security_HUKS_Import_API9_2200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Import_API9_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Import_API9_2200';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetEccGenerateOptions(384), GetNoDigestSignOptions(), GetCbcNoPaddingOptions(16), GetImportKeyPairOptions());
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
      genOptions.inData = GetEccImportData(384);

      try {
        await huks.importKeyItem(srcKeyAlias, genOptions);

        await huks.deleteKeyItem(srcKeyAlias, genOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Import_API9_2300
     * @tc.number Security_HUKS_Import_API9_2300
     * @tc.desc   Security_HUKS_Import_API9_2300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Import_API9_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Import_API9_2300';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetEccGenerateOptions(521), GetNoDigestSignOptions(), GetCbcNoPaddingOptions(16), GetImportKeyPairOptions());
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
      genOptions.inData = GetEccImportData(521);

      try {
        await huks.importKeyItem(srcKeyAlias, genOptions);

        await huks.deleteKeyItem(srcKeyAlias, genOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Import_API9_2400
     * @tc.number Security_HUKS_Import_API9_2400
     * @tc.desc   Security_HUKS_Import_API9_2400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Import_API9_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Import_API9_2400';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetX25519GenerateOptions(256), GetNoDigestSignOptions(), GetCbcNoPaddingOptions(16), GetImportKeyPairOptions());
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
      genOptions.inData = GetX25519ImportData(256);

      try {
        await huks.importKeyItem(srcKeyAlias, genOptions);

        await huks.deleteKeyItem(srcKeyAlias, genOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Import_API9_2500
     * @tc.number Security_HUKS_Import_API9_2500
     * @tc.desc   Security_HUKS_Import_API9_2500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Import_API9_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Import_API9_2500';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetEd25519GenerateOptions(256), GetSha1SignOptions(), GetImportKeyPairOptions());
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
      genOptions.inData = GetEd25519ImportData(256);

      try {
        await huks.importKeyItem(srcKeyAlias, genOptions);

        await huks.deleteKeyItem(srcKeyAlias, genOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Import_API9_2600
     * @tc.number Security_HUKS_Import_API9_2600
     * @tc.desc   Security_HUKS_Import_API9_2600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Import_API9_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Import_API9_2600';
      let srcKeyAlias = testNumber;
      let deviceAKeyPairAlias: string = srcKeyAlias + "_deviceAKeyPairAlias";

      let keyPairSize = 256;
      let agreeKeySize = 256;
      let plainKeySize = 192;
      let kekSize = 256;

      let genKeyPairOptions = GetEccGenerateOptions(keyPairSize);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      let agreeInitOptions = MergeOptions(GetEccGenerateOptions(keyPairSize), GetEcdhAgreeOptions(keyPairSize));
      let importWrappedKeyOptions = GetAesGenerateOptions(plainKeySize);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);

      try {
        // 设备A使用预先约定好的协商算法，生成用于importWrappedKeyItem的密钥对，并导出公钥发送给设备B
        await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
        let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
        agreeInitOptions.inData = deviceAPubKeyData;

        // 设备B获取到设备A的公钥，使用预先约定好的协商算法，随后通过协商密钥、kek、plainKey进行两级加密，获取kek、plainKey加密后的blob
        SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
        let wrappedKeyData = await BuildWrappedKeyData(genKeyPairOptions, agreeInitOptions, agreeKeySize, kekSize, plainKeySize);

        // 设备A获取后加密后的blob，使用生成密钥对的私钥，进行解封装并落盘
        importWrappedKeyOptions.inData = wrappedKeyData;
        await huks.importWrappedKeyItem(srcKeyAlias, deviceAKeyPairAlias, importWrappedKeyOptions);
        await huks.importWrappedKeyItem(srcKeyAlias, deviceAKeyPairAlias, importWrappedKeyOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Import_API9_2700
     * @tc.number Security_HUKS_Import_API9_2700
     * @tc.desc   Security_HUKS_Import_API9_2700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Import_API9_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Import_API9_2600';
      let srcKeyAlias = testNumber;
      let deviceAKeyPairAlias: string = srcKeyAlias + "_deviceAKeyPairAlias";

      let keyPairSize = 256;
      let agreeKeySize = 256;
      let plainKeySize = 192;
      let kekSize = 256;

      let genKeyPairOptions = GetEccGenerateOptions(keyPairSize);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      let agreeInitOptions = MergeOptions(GetEccGenerateOptions(keyPairSize), GetEcdhAgreeOptions(keyPairSize));
      let importWrappedKeyOptions = GetAesGenerateOptions(plainKeySize);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_X25519_AES_256_GCM_NOPADDING);

      // 设备A使用预先约定好的协商算法，生成用于importWrappedKeyItem的密钥对，并导出公钥发送给设备B
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      agreeInitOptions.inData = deviceAPubKeyData;

      // 设备B获取到设备A的公钥，使用预先约定好的协商算法，随后通过协商密钥、kek、plainKey进行两级加密，获取kek、plainKey加密后的blob
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
      let wrappedKeyData = await BuildWrappedKeyData(genKeyPairOptions, agreeInitOptions, agreeKeySize, kekSize, plainKeySize);

      // 设备A获取后加密后的blob，使用生成密钥对的私钥，进行解封装并落盘
      importWrappedKeyOptions.inData = wrappedKeyData;
      try {
        await huks.importWrappedKeyItem(srcKeyAlias, deviceAKeyPairAlias, importWrappedKeyOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (useSoftware) {
          expect(err.code).assertEqual(12000006);
        } else {
          expect(err.code).assertEqual(401);
        }
      }
    });

    /**
     * @tc.name   Security_HUKS_Import_API9_2800
     * @tc.number Security_HUKS_Import_API9_2800
     * @tc.desc   Security_HUKS_Import_API9_2800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Import_API9_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Import_API9_2800';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetDsaGenerateOptions(2048), GetSha256SignOptions(), GetImportKeyPairOptions());
      genOptions.inData = GetDsaImportData(2048);

      if (useSoftware) {
        try {
          await huks.importKeyItem(srcKeyAlias, genOptions);

          await huks.deleteKeyItem(srcKeyAlias, genOptions);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   Security_HUKS_Import_API9_2900
     * @tc.number Security_HUKS_Import_API9_2900
     * @tc.desc   Security_HUKS_Import_API9_2900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Import_API9_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Import_API9_2900';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetSm3SignOptions(), GetSm2GenerateOptions(256), GetImportKeyPairOptions());
      genOptions.inData = GetSm2ImportData(256);

      try {
        await huks.importKeyItem(srcKeyAlias, genOptions);

        await huks.deleteKeyItem(srcKeyAlias, genOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Import_API9_3000
     * @tc.number Security_HUKS_Import_API9_3000
     * @tc.desc   Security_HUKS_Import_API9_3000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Import_API9_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Import_API9_3000';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetHmacGenerateOptions(512), GetSm3Options());
      genOptions.inData = GetAesImportData(512);

      try {
        await huks.importKeyItem(srcKeyAlias, genOptions);

        await huks.deleteKeyItem(srcKeyAlias, genOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Import_API9_3100
     * @tc.number Security_HUKS_Import_API9_3100
     * @tc.desc   Security_HUKS_Import_API9_3100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Import_API9_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Import_API9_3100';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetSm4GenerateOptions(128), GetCbcNoPaddingOptions(16));
      genOptions.inData = GetAesImportData(128);

      try {
        await huks.importKeyItem(srcKeyAlias, genOptions);

        await huks.deleteKeyItem(srcKeyAlias, genOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
  })
}
