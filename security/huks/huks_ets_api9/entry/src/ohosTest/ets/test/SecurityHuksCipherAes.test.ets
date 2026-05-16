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
import { describe, it, expect, TestType, Size, Level, beforeAll } from '@ohos/hypium';
import huks from '@ohos.security.huks';
import * as huksCallback from './utils/huks/HuksCallbackUtils';

import { GetAesGenerateOptions } from './utils/huks/GenerateKeyUtils';
import { CheckSoftware, MergeOptions, SetParam } from './utils/huks/HuksOptionsUtils';
import {
  BuildCipherData,
  Cipher,
  CipherCallback,
  CipherData,
  DoCipherCallbackEndWithAbort,
  DoCipherEndWithAbort,
  GetCbcNoPaddingOptions,
  GetCbcPkcs7Options,
  GetCtrNoPaddingOptions,
  GetEcbNoPaddingOptions,
  GetEcbPkcs7Options
} from './utils/huks/CipherUtils';
import { Logger } from './utils/common/Logger';

let useSoftware = true;

export default function SecurityHuksCipherAes() {
  describe('SecurityHuksCipherAes', () => {
    beforeAll(async () => {
      useSoftware = await CheckSoftware();
    })
    /**
     * @tc.name   Security_HUKS_Cipher_API9_AES_001
     * @tc.number Security_HUKS_Cipher_API9_AES_001
     * @tc.desc   Security_HUKS_Cipher_API9_AES_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_AES_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_AES_001';
      let srcKeyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([48]);
      let cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcNoPaddingOptions(16));

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
     * @tc.name   Security_HUKS_Cipher_API9_AES_002
     * @tc.number Security_HUKS_Cipher_API9_AES_002
     * @tc.desc   Security_HUKS_Cipher_API9_AES_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_AES_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_AES_002';
      let srcKeyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([48]);
      let cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcNoPaddingOptions(16));

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);
        await DoCipherCallbackEndWithAbort(srcKeyAlias, cipherOptions, cipherData);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_AES_003
     * @tc.number Security_HUKS_Cipher_API9_AES_003
     * @tc.desc   Security_HUKS_Cipher_API9_AES_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_AES_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_AES_003';
      let srcKeyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([64]);
      let cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcNoPaddingOptions(16));

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
     * @tc.name   Security_HUKS_Cipher_API9_AES_004
     * @tc.number Security_HUKS_Cipher_API9_AES_004
     * @tc.desc   Security_HUKS_Cipher_API9_AES_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_AES_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_AES_004';
      let srcKeyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([48]);
      let cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcNoPaddingOptions(16));

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);
        await DoCipherCallbackEndWithAbort(srcKeyAlias, cipherOptions, cipherData);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_AES_101
     * @tc.number Security_HUKS_Cipher_API9_AES_101
     * @tc.desc   Security_HUKS_Cipher_API9_AES_101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_AES_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_AES_101';
      let srcKeyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([48]);
      let cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcNoPaddingOptions(16));

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
     * @tc.name   Security_HUKS_Cipher_API9_AES_102
     * @tc.number Security_HUKS_Cipher_API9_AES_102
     * @tc.desc   Security_HUKS_Cipher_API9_AES_102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_AES_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_AES_102';
      let srcKeyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([48]);
      let cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcNoPaddingOptions(16));

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        await DoCipherEndWithAbort(srcKeyAlias, cipherOptions, cipherData);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_AES_103
     * @tc.number Security_HUKS_Cipher_API9_AES_103
     * @tc.desc   Security_HUKS_Cipher_API9_AES_103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_AES_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_AES_103';
      let srcKeyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([64]);
      let cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcNoPaddingOptions(16));

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
     * @tc.name   Security_HUKS_Cipher_API9_AES_104
     * @tc.number Security_HUKS_Cipher_API9_AES_104
     * @tc.desc   Security_HUKS_Cipher_API9_AES_104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_AES_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_AES_104';
      let srcKeyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([48]);
      let cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcNoPaddingOptions(16));

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        await DoCipherEndWithAbort(srcKeyAlias, cipherOptions, cipherData);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testCipherAESSize128PADDINGPKCS7MODECBC103
     * @tc.number testCipherAESSize128PADDINGPKCS7MODECBC103
     * @tc.desc   testCipherAESSize128PADDINGPKCS7MODECBC103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCipherAESSize128PADDINGPKCS7MODECBC103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testCipherAESSize128PADDINGPKCS7MODECBC103';
      let srcKeyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      let cipherData: CipherData = BuildCipherData([64, 1]);
      let cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

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
     * @tc.name   testCipherAESSize128PADDINGNONEMODECTR103
     * @tc.number testCipherAESSize128PADDINGNONEMODECTR103
     * @tc.desc   testCipherAESSize128PADDINGNONEMODECTR103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCipherAESSize128PADDINGNONEMODECTR103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testCipherAESSize128PADDINGNONEMODECTR103';
      let srcKeyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CTR);
      let cipherData: CipherData = BuildCipherData([64]);
      let cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetCtrNoPaddingOptions(16));

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
     * @tc.name   testCipherAESSize128PADDINGPKCS7MODEECB103
     * @tc.number testCipherAESSize128PADDINGPKCS7MODEECB103
     * @tc.desc   testCipherAESSize128PADDINGPKCS7MODEECB103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCipherAESSize128PADDINGPKCS7MODEECB103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testCipherAESSize128PADDINGPKCS7MODEECB103';
      let srcKeyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB);
      let cipherData: CipherData = BuildCipherData([64, 1]);
      let cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetEcbPkcs7Options());

      if (useSoftware) {
        try {
          await huks.generateKeyItem(srcKeyAlias, genOptions);
          let res = await Cipher(srcKeyAlias, cipherOptions, cipherData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   testCipherAESSize192PADDINGNONEMODECBC103
     * @tc.number testCipherAESSize192PADDINGNONEMODECBC103
     * @tc.desc   testCipherAESSize192PADDINGNONEMODECBC103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCipherAESSize192PADDINGNONEMODECBC103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testCipherAESSize192PADDINGNONEMODECBC103';
      let srcKeyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(192);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([64]);
      let cipherOptions = MergeOptions(GetAesGenerateOptions(192), GetCbcNoPaddingOptions(16));

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
     * @tc.name   testCipherAESSize192PADDINGPKCS7MODECBC103
     * @tc.number testCipherAESSize192PADDINGPKCS7MODECBC103
     * @tc.desc   testCipherAESSize192PADDINGPKCS7MODECBC103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCipherAESSize192PADDINGPKCS7MODECBC103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testCipherAESSize192PADDINGPKCS7MODECBC103';
      let srcKeyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(192);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      let cipherData: CipherData = BuildCipherData([64, 1]);
      let cipherOptions = MergeOptions(GetAesGenerateOptions(192), GetCbcPkcs7Options(16));

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
     * @tc.name   testCipherAESSize192PADDINGNONEMODECTR103
     * @tc.number testCipherAESSize192PADDINGNONEMODECTR103
     * @tc.desc   testCipherAESSize192PADDINGNONEMODECTR103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCipherAESSize192PADDINGNONEMODECTR103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testCipherAESSize192PADDINGNONEMODECTR103';
      let srcKeyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(192);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CTR);
      let cipherData: CipherData = BuildCipherData([64]);
      let cipherOptions = MergeOptions(GetAesGenerateOptions(192), GetCtrNoPaddingOptions(16));

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
     * @tc.name   testCipherAESSize192PADDINGNONEMODEECB103
     * @tc.number testCipherAESSize192PADDINGNONEMODEECB103
     * @tc.desc   testCipherAESSize192PADDINGNONEMODEECB103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCipherAESSize192PADDINGNONEMODEECB103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testCipherAESSize192PADDINGNONEMODEECB103';
      let srcKeyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(192);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB);
      let cipherData: CipherData = BuildCipherData([64]);
      let cipherOptions = MergeOptions(GetAesGenerateOptions(192), GetEcbNoPaddingOptions());

      if (useSoftware) {
        try {
          await huks.generateKeyItem(srcKeyAlias, genOptions);
          let res = await Cipher(srcKeyAlias, cipherOptions, cipherData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   testCipherAESSize192PADDINGPKCS7MODEECB103
     * @tc.number testCipherAESSize192PADDINGPKCS7MODEECB103
     * @tc.desc   testCipherAESSize192PADDINGPKCS7MODEECB103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCipherAESSize192PADDINGPKCS7MODEECB103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testCipherAESSize192PADDINGPKCS7MODEECB103';
      let srcKeyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(192);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB);
      let cipherData: CipherData = BuildCipherData([64, 1]);
      let cipherOptions = MergeOptions(GetAesGenerateOptions(192), GetEcbPkcs7Options());

      if (useSoftware) {
        try {
          await huks.generateKeyItem(srcKeyAlias, genOptions);
          let res = await Cipher(srcKeyAlias, cipherOptions, cipherData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   testCipherAESSize256PADDINGNONEMODECBC103
     * @tc.number testCipherAESSize256PADDINGNONEMODECBC103
     * @tc.desc   testCipherAESSize256PADDINGNONEMODECBC103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCipherAESSize256PADDINGNONEMODECBC103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testCipherAESSize256PADDINGNONEMODECBC103';
      let srcKeyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let cipherData: CipherData = BuildCipherData([64]);
      let cipherOptions = MergeOptions(GetAesGenerateOptions(256), GetCbcNoPaddingOptions(16));

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
     * @tc.name   testCipherAESSize256PADDINGPKCS7MODECBC103
     * @tc.number testCipherAESSize256PADDINGPKCS7MODECBC103
     * @tc.desc   testCipherAESSize256PADDINGPKCS7MODECBC103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCipherAESSize256PADDINGPKCS7MODECBC103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testCipherAESSize256PADDINGPKCS7MODECBC103';
      let srcKeyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      let cipherData: CipherData = BuildCipherData([64, 1]);
      let cipherOptions = MergeOptions(GetAesGenerateOptions(256), GetCbcPkcs7Options(16));

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
     * @tc.name   testCipherAESSize256PADDINGNONEMODECTR103
     * @tc.number testCipherAESSize256PADDINGNONEMODECTR103
     * @tc.desc   testCipherAESSize256PADDINGNONEMODECTR103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCipherAESSize256PADDINGNONEMODECTR103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testCipherAESSize256PADDINGNONEMODECTR103';
      let srcKeyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CTR);
      let cipherData: CipherData = BuildCipherData([64]);
      let cipherOptions = MergeOptions(GetAesGenerateOptions(256), GetCtrNoPaddingOptions(16));

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
     * @tc.name   testCipherAESSize256PADDINGNONEMODEECB103
     * @tc.number testCipherAESSize256PADDINGNONEMODEECB103
     * @tc.desc   testCipherAESSize256PADDINGNONEMODEECB103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCipherAESSize256PADDINGNONEMODEECB103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testCipherAESSize256PADDINGNONEMODEECB103';
      let srcKeyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB);
      let cipherData: CipherData = BuildCipherData([64]);
      let cipherOptions = MergeOptions(GetAesGenerateOptions(256), GetEcbNoPaddingOptions());

      if (useSoftware) {
        try {
          await huks.generateKeyItem(srcKeyAlias, genOptions);
          let res = await Cipher(srcKeyAlias, cipherOptions, cipherData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   testCipherAESSize256PADDINGPKCS7MODEECB103
     * @tc.number testCipherAESSize256PADDINGPKCS7MODEECB103
     * @tc.desc   testCipherAESSize256PADDINGPKCS7MODEECB103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCipherAESSize256PADDINGPKCS7MODEECB103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testCipherAESSize256PADDINGPKCS7MODEECB103';
      let srcKeyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB);
      let cipherData: CipherData = BuildCipherData([64, 1]);
      let cipherOptions = MergeOptions(GetAesGenerateOptions(256), GetEcbPkcs7Options());

      if (useSoftware) {
        try {
          await huks.generateKeyItem(srcKeyAlias, genOptions);
          let res = await Cipher(srcKeyAlias, cipherOptions, cipherData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_isPwdSet_0010
     * @tc.number SUB_Security_HUKS_isPwdSet_0010
     * @tc.desc   Test generate key with Promise. Test fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_isPwdSet_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'SUB_Security_HUKS_isPwdSet_0010';
      let srcKeyAlias = testNumber;
      let genOptions = MergeOptions(GetCbcPkcs7Options(16), GetAesGenerateOptions(128));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_IS_DEVICE_PASSWORD_SET, true);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions)
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(12000016);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_isPwdSet_0020
     * @tc.number SUB_Security_HUKS_isPwdSet_0020
     * @tc.desc   Test generate key, encrypt with Promise. Test success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_isPwdSet_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'SUB_Security_HUKS_isPwdSet_0020';
      let srcKeyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_IS_DEVICE_PASSWORD_SET, false);
      let cipherData: CipherData = BuildCipherData([63]);
      let cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

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
     * @tc.name   SUB_Security_HUKS_isPwdSet_0060
     * @tc.number SUB_Security_HUKS_isPwdSet_0060
     * @tc.desc   Test generate key with Callback. Test fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_isPwdSet_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'SUB_Security_HUKS_isPwdSet_0060';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetCbcPkcs7Options(16), GetAesGenerateOptions(128));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_IS_DEVICE_PASSWORD_SET, true);

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions)
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(12000016);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_hasKeyItem_0010
     * @tc.number SUB_Security_HUKS_hasKeyItem_0010
     * @tc.desc   huksOptions with AlgName AES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_hasKeyItem_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'SUB_Security_HUKS_hasKeyItem_0010';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetCbcPkcs7Options(16), GetAesGenerateOptions(128));

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let res = await huks.hasKeyItem(srcKeyAlias, genOptions);
        expect(res).assertEqual(true);

        await huks.deleteKeyItem(srcKeyAlias, genOptions);
        res = await huks.hasKeyItem(srcKeyAlias, genOptions);
        expect(res).assertEqual(false);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });


    /**
     * @tc.name   SUB_Security_HUKS_hasKeyItem_0020
     * @tc.number SUB_Security_HUKS_hasKeyItem_0020
     * @tc.desc   huksOptions with AlgName AES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_hasKeyItem_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'SUB_Security_HUKS_hasKeyItem_0020';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetCbcPkcs7Options(16), GetAesGenerateOptions(128));

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);
        let res = await huksCallback.hasKeyItem(srcKeyAlias, genOptions);
        expect(res).assertEqual(true);

        await huksCallback.deleteKeyItem(srcKeyAlias, genOptions);
        res = await huksCallback.hasKeyItem(srcKeyAlias, genOptions);
        expect(res).assertEqual(false);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ECE_0010
     * @tc.number SUB_Security_HUKS_ECE_0010
     * @tc.desc   Test generate key, encrypt with Promise. Test success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_ECE_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'SUB_Security_HUKS_ECE_0010';
      let srcKeyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL, huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_ECE);
      let cipherData: CipherData = BuildCipherData([63]);
      let cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL, huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_ECE);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let res = await Cipher(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

  });
}
