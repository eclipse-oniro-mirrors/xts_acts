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
import * as huksCallback from './utils/huks/HuksCallbackUtils';

import { MergeOptions, SetParam } from './utils/huks/HuksOptionsUtils';
import { GetSm4GenerateOptions } from './utils/huks/GenerateKeyUtils';
import {
  CipherData,
  BuildCipherData,
  GetCbcNoPaddingOptions,
  CipherCallback,
  DoCipherCallbackEndWithAbort,
  GetCbcPkcs7Options,
  GetCtrNoPaddingOptions,
  GetEcbNoPaddingOptions,
  GetEcbPkcs7Options,
  DoCipherEndWithAbort,
  Cipher
} from './utils/huks/CipherUtils';
import { Logger } from './utils/common/Logger';


export default function SecurityHuksCipherSm4() {
  describe('SecurityHuksCipherSm4', () => {
    beforeAll(async () => {
    })
    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_00148
     * @tc.number Security_HUKS_Cipher_API9_SM4_00148
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_00148
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_00148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_00148';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetCbcNoPaddingOptions(16));

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        let res = await CipherCallback(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_001240
     * @tc.number Security_HUKS_Cipher_API9_SM4_001240
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_001240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_001240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_001240';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([64, 64, 64, 48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetCbcNoPaddingOptions(16));

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        let res = await CipherCallback(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_00248
     * @tc.number Security_HUKS_Cipher_API9_SM4_00248
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_00248
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_00248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_00248';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetCbcNoPaddingOptions(16));

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        await DoCipherCallbackEndWithAbort(srcKeyAlias, cipherOptions, cipherData);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_002240
     * @tc.number Security_HUKS_Cipher_API9_SM4_002240
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_002240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_002240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_002240';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([64, 64, 64, 48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetCbcNoPaddingOptions(16));

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        await DoCipherCallbackEndWithAbort(srcKeyAlias, cipherOptions, cipherData);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_00348
     * @tc.number Security_HUKS_Cipher_API9_SM4_00348
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_00348
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_00348', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_00348';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7);
      let cipherData: CipherData = BuildCipherData([48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        let res = await CipherCallback(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_003240
     * @tc.number Security_HUKS_Cipher_API9_SM4_003240
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_003240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_003240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_003240';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7);
      let cipherData: CipherData = BuildCipherData([64, 64, 64, 48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        let res = await CipherCallback(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_00448
     * @tc.number Security_HUKS_Cipher_API9_SM4_00448
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_00448
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_00448', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_00448';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7);
      let cipherData: CipherData = BuildCipherData([48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        await DoCipherCallbackEndWithAbort(srcKeyAlias, cipherOptions, cipherData);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_004240
     * @tc.number Security_HUKS_Cipher_API9_SM4_004240
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_004240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_004240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_004240';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7);
      let cipherData: CipherData = BuildCipherData([64, 64, 64, 48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        await DoCipherCallbackEndWithAbort(srcKeyAlias, cipherOptions, cipherData);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_00548
     * @tc.number Security_HUKS_Cipher_API9_SM4_00548
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_00548
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_00548', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_00548';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CTR);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetCtrNoPaddingOptions(16));

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        let res = await CipherCallback(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_005240
     * @tc.number Security_HUKS_Cipher_API9_SM4_005240
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_005240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_005240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_005240';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CTR);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([64, 64, 64, 48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetCtrNoPaddingOptions(16));

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        let res = await CipherCallback(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_00648
     * @tc.number Security_HUKS_Cipher_API9_SM4_00648
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_00648
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_00648', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_00648';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CTR);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetCtrNoPaddingOptions(16));

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        await DoCipherCallbackEndWithAbort(srcKeyAlias, cipherOptions, cipherData);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_006240
     * @tc.number Security_HUKS_Cipher_API9_SM4_006240
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_006240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_006240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_006240';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CTR);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([64, 64, 64, 48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetCtrNoPaddingOptions(16));

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        await DoCipherCallbackEndWithAbort(srcKeyAlias, cipherOptions, cipherData);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_00748
     * @tc.number Security_HUKS_Cipher_API9_SM4_00748
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_00748
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_00748', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_00748';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetEcbNoPaddingOptions());

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        let res = await CipherCallback(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_007240
     * @tc.number Security_HUKS_Cipher_API9_SM4_007240
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_007240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_007240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_007240';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([64, 64, 64, 48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetEcbNoPaddingOptions());

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        let res = await CipherCallback(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_00848
     * @tc.number Security_HUKS_Cipher_API9_SM4_00848
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_00848
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_00848', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_00848';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetEcbNoPaddingOptions());

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        await DoCipherCallbackEndWithAbort(srcKeyAlias, cipherOptions, cipherData);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_008240
     * @tc.number Security_HUKS_Cipher_API9_SM4_008240
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_008240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_008240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_008240';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([64, 64, 64, 48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetEcbNoPaddingOptions());

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        await DoCipherCallbackEndWithAbort(srcKeyAlias, cipherOptions, cipherData);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    // HKS_SUPPORT_SM4_ECB_PKCS7
    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_00948
     * @tc.number Security_HUKS_Cipher_API9_SM4_00948
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_00948
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_00948', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_00948';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7);
      let cipherData: CipherData = BuildCipherData([48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetEcbPkcs7Options());

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        let res = await CipherCallback(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_009240
     * @tc.number Security_HUKS_Cipher_API9_SM4_009240
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_009240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_009240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_009240';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7);
      let cipherData: CipherData = BuildCipherData([64, 64, 64, 48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetEcbPkcs7Options());

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        let res = await CipherCallback(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_01048
     * @tc.number Security_HUKS_Cipher_API9_SM4_01048
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_01048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_01048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_01048';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7);
      let cipherData: CipherData = BuildCipherData([48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetEcbPkcs7Options());

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        await DoCipherCallbackEndWithAbort(srcKeyAlias, cipherOptions, cipherData);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_010240
     * @tc.number Security_HUKS_Cipher_API9_SM4_010240
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_010240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_010240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_010240';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7);
      let cipherData: CipherData = BuildCipherData([64, 64, 64, 48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetEcbPkcs7Options());

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        await DoCipherCallbackEndWithAbort(srcKeyAlias, cipherOptions, cipherData);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_10148
     * @tc.number Security_HUKS_Cipher_API9_SM4_10148
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_10148
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_10148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_10148';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetCbcNoPaddingOptions(16));

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let res = await Cipher(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_101240
     * @tc.number Security_HUKS_Cipher_API9_SM4_101240
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_101240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_101240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_101240';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([64, 64, 64, 48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetCbcNoPaddingOptions(16));

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let res = await Cipher(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_10248
     * @tc.number Security_HUKS_Cipher_API9_SM4_10248
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_10248
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_10248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_10248';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetCbcNoPaddingOptions(16));

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await DoCipherEndWithAbort(srcKeyAlias, cipherOptions, cipherData);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_102240
     * @tc.number Security_HUKS_Cipher_API9_SM4_102240
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_102240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_102240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_102240';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([64, 64, 64, 48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetCbcNoPaddingOptions(16));

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await DoCipherEndWithAbort(srcKeyAlias, cipherOptions, cipherData);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_10348
     * @tc.number Security_HUKS_Cipher_API9_SM4_10348
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_10348
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_10348', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_10348';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7);
      let cipherData: CipherData = BuildCipherData([48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let res = await Cipher(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_103240
     * @tc.number Security_HUKS_Cipher_API9_SM4_103240
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_103240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_103240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_103240';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7);
      let cipherData: CipherData = BuildCipherData([64, 64, 64, 48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let res = await Cipher(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_10448
     * @tc.number Security_HUKS_Cipher_API9_SM4_10448
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_10448
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_10448', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_10448';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7);
      let cipherData: CipherData = BuildCipherData([48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await DoCipherEndWithAbort(srcKeyAlias, cipherOptions, cipherData);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_104240
     * @tc.number Security_HUKS_Cipher_API9_SM4_104240
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_104240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_104240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_104240';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7);
      let cipherData: CipherData = BuildCipherData([64, 64, 64, 48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await DoCipherEndWithAbort(srcKeyAlias, cipherOptions, cipherData);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_10548
     * @tc.number Security_HUKS_Cipher_API9_SM4_10548
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_10548
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_10548', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_10548';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CTR);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetCtrNoPaddingOptions(16));

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let res = await Cipher(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_105240
     * @tc.number Security_HUKS_Cipher_API9_SM4_105240
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_105240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_105240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_105240';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CTR);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([64, 64, 64, 48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetCtrNoPaddingOptions(16));

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let res = await Cipher(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_10648
     * @tc.number Security_HUKS_Cipher_API9_SM4_10648
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_10648
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_10648', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_10648';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CTR);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetCtrNoPaddingOptions(16));

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await DoCipherEndWithAbort(srcKeyAlias, cipherOptions, cipherData);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_106240
     * @tc.number Security_HUKS_Cipher_API9_SM4_106240
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_106240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_106240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_106240';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CTR);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([64, 64, 64, 48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetCtrNoPaddingOptions(16));

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await DoCipherEndWithAbort(srcKeyAlias, cipherOptions, cipherData);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_10748
     * @tc.number Security_HUKS_Cipher_API9_SM4_10748
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_10748
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_10748', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_10748';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetEcbNoPaddingOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let res = await Cipher(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_107240
     * @tc.number Security_HUKS_Cipher_API9_SM4_107240
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_107240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_107240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_107240';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([64, 64, 64, 48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetEcbNoPaddingOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let res = await Cipher(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_10848
     * @tc.number Security_HUKS_Cipher_API9_SM4_10848
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_10848
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_10848', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_10848';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetEcbNoPaddingOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await DoCipherEndWithAbort(srcKeyAlias, cipherOptions, cipherData);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_108240
     * @tc.number Security_HUKS_Cipher_API9_SM4_108240
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_108240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_108240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_108240';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([64, 64, 64, 48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetEcbNoPaddingOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await DoCipherEndWithAbort(srcKeyAlias, cipherOptions, cipherData);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    // HKS_SUPPORT_SM4_ECB_PKCS7
    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_10948
     * @tc.number Security_HUKS_Cipher_API9_SM4_10948
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_10948
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_10948', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_10948';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7);
      let cipherData: CipherData = BuildCipherData([48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetEcbPkcs7Options());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let res = await Cipher(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_109240
     * @tc.number Security_HUKS_Cipher_API9_SM4_109240
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_109240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_109240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_109240';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7);
      let cipherData: CipherData = BuildCipherData([64, 64, 64, 48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetEcbPkcs7Options());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let res = await Cipher(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_11048
     * @tc.number Security_HUKS_Cipher_API9_SM4_11048
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_11048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_11048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_11048';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7);
      let cipherData: CipherData = BuildCipherData([48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetEcbPkcs7Options());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await DoCipherEndWithAbort(srcKeyAlias, cipherOptions, cipherData);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM4_110240
     * @tc.number Security_HUKS_Cipher_API9_SM4_110240
     * @tc.desc   Security_HUKS_Cipher_API9_SM4_110240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM4_110240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM4_110240';
      let srcKeyAlias = testNumber;

      let genOptions = GetSm4GenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7);
      let cipherData: CipherData = BuildCipherData([64, 64, 64, 48]);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetEcbPkcs7Options());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await DoCipherEndWithAbort(srcKeyAlias, cipherOptions, cipherData);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
  });
}
