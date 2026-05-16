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

import { GetSm2GenerateOptions } from './utils/huks/GenerateKeyUtils';
import {
  BuildCipherData,
  CipherData,
  CompareCipherData,
  DoCipher,
  DoCipherCallback,
  GetSm3NoPaddingOptions,
  ReBuildCipherData
} from './utils/huks/CipherUtils';
import { MergeOptions, SetParam, SetInData, DeleteParam, CheckSoftware } from './utils/huks/HuksOptionsUtils';
import { Logger } from './utils/common/Logger';

let useSoftware = true;

export default function SecurityHuksCipherSm2() {
  describe('SecurityHuksCipherSm2', () => {
    beforeAll(async () => {
      useSoftware = await CheckSoftware();
    })

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM2_001
     * @tc.number Security_HUKS_Cipher_API9_SM2_001
     * @tc.desc   Security_HUKS_Cipher_API9_SM2_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM2_001';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSm3NoPaddingOptions(), GetSm2GenerateOptions(256));
      let cipherOptions = MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions());

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huksCallback.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        await huksCallback.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

        let cipherData: CipherData = BuildCipherData([512, 0]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        let encryptResult: CipherData = await DoCipherCallback(newSrcKeyAlias, cipherOptions, cipherData);
        encryptResult.updateDataArr = [];
        ReBuildCipherData(encryptResult, [encryptResult.finishData!.length, 0]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        let decryptResult: CipherData = await DoCipherCallback(srcKeyAlias, cipherOptions, encryptResult);
        decryptResult.updateDataArr = [];
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM2_002
     * @tc.number Security_HUKS_Cipher_API9_SM2_002
     * @tc.desc   Security_HUKS_Cipher_API9_SM2_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM2_002';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSm3NoPaddingOptions(), GetSm2GenerateOptions(256));
      let cipherOptions = MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions());

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huksCallback.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        await huksCallback.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

        let cipherData: CipherData = BuildCipherData([512]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        let encryptResult: CipherData = await DoCipherCallback(newSrcKeyAlias, cipherOptions, cipherData);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        let decryptResult: CipherData = await DoCipherCallback(srcKeyAlias, cipherOptions, encryptResult);

        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM2_101
     * @tc.number Security_HUKS_Cipher_API9_SM2_101
     * @tc.desc   Security_HUKS_Cipher_API9_SM2_101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM2_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM2_101';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSm3NoPaddingOptions(), GetSm2GenerateOptions(256));
      let cipherOptions = MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

        let cipherData: CipherData = BuildCipherData([64, 64, 64, 64, 64, 64, 64, 64]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        let encryptResult: CipherData = await DoCipher(newSrcKeyAlias, cipherOptions, cipherData);
        encryptResult.updateDataArr = [];
        ReBuildCipherData(encryptResult, [64, 64, 64, 64, 64, 64, 64, encryptResult.finishData!.length - 64 * 7]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        let decryptResult: CipherData = await DoCipher(srcKeyAlias, cipherOptions, encryptResult);
        decryptResult.updateDataArr = [];

        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM2_102
     * @tc.number Security_HUKS_Cipher_API9_SM2_102
     * @tc.desc   Security_HUKS_Cipher_API9_SM2_102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM2_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM2_102';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSm3NoPaddingOptions(), GetSm2GenerateOptions(256));
      let cipherOptions = MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

        let cipherData: CipherData = BuildCipherData([32, 0]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        let encryptResult: CipherData = await DoCipher(newSrcKeyAlias, cipherOptions, cipherData);
        encryptResult.updateDataArr = [];
        ReBuildCipherData(encryptResult, [encryptResult.finishData!.length, 0]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        let decryptResult: CipherData = await DoCipher(srcKeyAlias, cipherOptions, encryptResult);
        decryptResult.updateDataArr = [];

        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM2_103
     * @tc.number Security_HUKS_Cipher_API9_SM2_103
     * @tc.desc   Security_HUKS_Cipher_API9_SM2_103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM2_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM2_103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSm3NoPaddingOptions(), GetSm2GenerateOptions(256));
      let cipherOptions = MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

        let cipherData: CipherData = BuildCipherData([32]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        let encryptResult: CipherData = await DoCipher(newSrcKeyAlias, cipherOptions, cipherData);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        let decryptResult: CipherData = await DoCipher(srcKeyAlias, cipherOptions, encryptResult);

        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM2_104
     * @tc.number Security_HUKS_Cipher_API9_SM2_104
     * @tc.desc   Security_HUKS_Cipher_API9_SM2_104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM2_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM2_104';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetSm3NoPaddingOptions(), GetSm2GenerateOptions(512));

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(12000003);
      }

    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM2_105
     * @tc.number Security_HUKS_Cipher_API9_SM2_105
     * @tc.desc   Security_HUKS_Cipher_API9_SM2_105
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM2_105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM2_105';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSm3NoPaddingOptions(), GetSm2GenerateOptions(256));
      let cipherOptions = MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions());

      await huks.generateKeyItem(srcKeyAlias, genOptions);
      let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA1)
      try {
        await huks.initSession(srcKeyAlias, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM2_106
     * @tc.number Security_HUKS_Cipher_API9_SM2_106
     * @tc.desc   Security_HUKS_Cipher_API9_SM2_106
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM2_106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM2_106';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSm3NoPaddingOptions(), GetSm2GenerateOptions(256));
      let cipherOptions = MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions());
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);

      await huks.generateKeyItem(srcKeyAlias, genOptions);
      let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

      try {
        await huks.initSession(srcKeyAlias, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM2_107
     * @tc.number Security_HUKS_Cipher_API9_SM2_107
     * @tc.desc   Security_HUKS_Cipher_API9_SM2_107
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM2_107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM2_107';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSm3NoPaddingOptions(), GetSm2GenerateOptions(256));
      let cipherOptions = MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions());
      DeleteParam(cipherOptions, huks.HuksTag.HUKS_TAG_DIGEST);

      await huks.generateKeyItem(srcKeyAlias, genOptions);
      let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

      try {
        await huks.initSession(srcKeyAlias, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM2_1081
     * @tc.number Security_HUKS_Cipher_API9_SM2_1081
     * @tc.desc   Security_HUKS_Cipher_API9_SM2_1081
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM2_1081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM2_1081';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSm3NoPaddingOptions(), GetSm2GenerateOptions(256));
      let cipherOptions = MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions());

      await huks.generateKeyItem(srcKeyAlias, genOptions);
      let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

      let initRes = await huks.initSession(srcKeyAlias, cipherOptions);
      cipherOptions.inData = new Uint8Array();
      try {
        await huks.finishSession(initRes.handle, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(12000014);
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM2_1082
     * @tc.number Security_HUKS_Cipher_API9_SM2_1082
     * @tc.desc   Security_HUKS_Cipher_API9_SM2_1082
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM2_1082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM2_1082';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSm3NoPaddingOptions(), GetSm2GenerateOptions(256));
      let cipherOptions = MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions());

      await huks.generateKeyItem(srcKeyAlias, genOptions);
      let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

      let initRes = await huks.initSession(srcKeyAlias, cipherOptions);
      SetInData(cipherOptions, new Uint8Array());
      try {
        await huks.updateSession(initRes.handle, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(12000014);
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM2_1091
     * @tc.number Security_HUKS_Cipher_API9_SM2_1091
     * @tc.desc   Security_HUKS_Cipher_API9_SM2_1091
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM2_1091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM2_1091';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSm3NoPaddingOptions(), GetSm2GenerateOptions(256));
      let cipherOptions = MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions());

      await huks.generateKeyItem(srcKeyAlias, genOptions);
      let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

      cipherOptions = MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions());
      let initRes = await huks.initSession(srcKeyAlias, cipherOptions);
      try {
        await huks.finishSession(initRes.handle, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(12000014);
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM2_1092
     * @tc.number Security_HUKS_Cipher_API9_SM2_1092
     * @tc.desc   Security_HUKS_Cipher_API9_SM2_1092
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM2_1092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM2_1092';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSm3NoPaddingOptions(), GetSm2GenerateOptions(256));
      let cipherOptions = MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions());

      await huks.generateKeyItem(srcKeyAlias, genOptions);
      let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

      cipherOptions = MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions());
      let initRes = await huks.initSession(srcKeyAlias, cipherOptions);
      try {
        await huks.updateSession(initRes.handle, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(12000014);
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM2_110
     * @tc.number Security_HUKS_Cipher_API9_SM2_110
     * @tc.desc   Security_HUKS_Cipher_API9_SM2_110
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM2_110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM2_110';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSm3NoPaddingOptions(), GetSm2GenerateOptions(256));
      let cipherOptions = MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_KEY_SIZE, 512);
        let cipherData: CipherData = BuildCipherData([32, 0]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        let encryptResult: CipherData = await DoCipher(newSrcKeyAlias, cipherOptions, cipherData);
        encryptResult.updateDataArr = [];
        ReBuildCipherData(encryptResult, [encryptResult.finishData!.length, 0]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        let decryptResult: CipherData = await DoCipher(srcKeyAlias, cipherOptions, encryptResult);
        decryptResult.updateDataArr = [];

        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM2_111
     * @tc.number Security_HUKS_Cipher_API9_SM2_111
     * @tc.desc   Security_HUKS_Cipher_API9_SM2_111
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM2_111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM2_111';
      let srcKeyAlias = testNumber;
      let srcKeyAlias2 = testNumber + "2";
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSm3NoPaddingOptions(), GetSm2GenerateOptions(256));
      let cipherOptions = MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions());

      await huks.generateKeyItem(srcKeyAlias, genOptions);
      await huks.generateKeyItem(srcKeyAlias2, genOptions);
      let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

      let cipherData: CipherData = BuildCipherData([32, 0]);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      let encryptResult: CipherData = await DoCipher(newSrcKeyAlias, cipherOptions, cipherData);

      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
      let initRes = await huks.initSession(srcKeyAlias2, cipherOptions);
      cipherOptions.inData = encryptResult.finishData!;
      await huks.updateSession(initRes.handle, cipherOptions);
      cipherOptions.inData = new Uint8Array();
      try {
        await huks.finishSession(initRes.handle, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        if (useSoftware) {
          expect(err.code).assertEqual(12000006);
        } else {
          expect(err.code).assertEqual(12000012);
        }
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM2_112
     * @tc.number Security_HUKS_Cipher_API9_SM2_112
     * @tc.desc   Security_HUKS_Cipher_API9_SM2_112
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM2_112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM2_112';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSm3NoPaddingOptions(), GetSm2GenerateOptions(256));
      let cipherOptions = MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions());

      await huks.generateKeyItem(srcKeyAlias, genOptions);
      let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

      let cipherData: CipherData = BuildCipherData([32]);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      await DoCipher(newSrcKeyAlias, cipherOptions, cipherData);

      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA1);
      try {
        await huks.initSession(srcKeyAlias, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM2_113
     * @tc.number Security_HUKS_Cipher_API9_SM2_113
     * @tc.desc   Security_HUKS_Cipher_API9_SM2_113
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM2_113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM2_113';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSm3NoPaddingOptions(), GetSm2GenerateOptions(256));
      let cipherOptions = MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions());

      await huks.generateKeyItem(srcKeyAlias, genOptions);
      let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

      let cipherData: CipherData = BuildCipherData([32]);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      await DoCipher(newSrcKeyAlias, cipherOptions, cipherData);

      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      try {
        await huks.initSession(srcKeyAlias, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM2_114
     * @tc.number Security_HUKS_Cipher_API9_SM2_114
     * @tc.desc   Security_HUKS_Cipher_API9_SM2_114
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM2_114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM2_114';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSm3NoPaddingOptions(), GetSm2GenerateOptions(256));
      let cipherOptions = MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions());

      await huks.generateKeyItem(srcKeyAlias, genOptions);
      let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

      let cipherData: CipherData = BuildCipherData([32]);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      await DoCipher(newSrcKeyAlias, cipherOptions, cipherData);

      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
      DeleteParam(cipherOptions, huks.HuksTag.HUKS_TAG_DIGEST);
      try {
        await huks.initSession(srcKeyAlias, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM2_1151
     * @tc.number Security_HUKS_Cipher_API9_SM2_1151
     * @tc.desc   Security_HUKS_Cipher_API9_SM2_1151
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM2_1151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM2_1151';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSm3NoPaddingOptions(), GetSm2GenerateOptions(256));
      let cipherOptions = MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions());

      await huks.generateKeyItem(srcKeyAlias, genOptions);
      let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

      let cipherData: CipherData = BuildCipherData([32]);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      await DoCipher(newSrcKeyAlias, cipherOptions, cipherData);

      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
      let initRes = await huks.initSession(srcKeyAlias, cipherOptions);
      cipherOptions.inData = new Uint8Array();
      try {
        await huks.finishSession(initRes.handle, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(12000014);
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM2_1152
     * @tc.number Security_HUKS_Cipher_API9_SM2_1152
     * @tc.desc   Security_HUKS_Cipher_API9_SM2_1152
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM2_1152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM2_1152';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSm3NoPaddingOptions(), GetSm2GenerateOptions(256));
      let cipherOptions = MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions());

      await huks.generateKeyItem(srcKeyAlias, genOptions);
      let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

      let cipherData: CipherData = BuildCipherData([32]);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      await DoCipher(newSrcKeyAlias, cipherOptions, cipherData);

      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
      let initRes = await huks.initSession(srcKeyAlias, cipherOptions);
      cipherOptions.inData = new Uint8Array();
      try {
        await huks.updateSession(initRes.handle, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(12000014);
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM2_1161
     * @tc.number Security_HUKS_Cipher_API9_SM2_1161
     * @tc.desc   Security_HUKS_Cipher_API9_SM2_1161
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM2_1161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM2_1161';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSm3NoPaddingOptions(), GetSm2GenerateOptions(256));
      let cipherOptions = MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions());

      await huks.generateKeyItem(srcKeyAlias, genOptions);
      let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

      let cipherData: CipherData = BuildCipherData([32]);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      await DoCipher(newSrcKeyAlias, cipherOptions, cipherData);

      cipherOptions = MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions());
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
      let initRes = await huks.initSession(srcKeyAlias, cipherOptions);
      try {
        await huks.finishSession(initRes.handle, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(12000014);
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM2_1162
     * @tc.number Security_HUKS_Cipher_API9_SM2_1162
     * @tc.desc   Security_HUKS_Cipher_API9_SM2_1162
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM2_1162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM2_1161';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSm3NoPaddingOptions(), GetSm2GenerateOptions(256));
      let cipherOptions = MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions());

      await huks.generateKeyItem(srcKeyAlias, genOptions);
      let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

      let cipherData: CipherData = BuildCipherData([32]);
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      await DoCipher(newSrcKeyAlias, cipherOptions, cipherData);

      cipherOptions = MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions());
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
      let initRes = await huks.initSession(srcKeyAlias, cipherOptions);
      try {
        await huks.updateSession(initRes.handle, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(12000014);
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM2_801
     * @tc.number Security_HUKS_Cipher_API9_SM2_801
     * @tc.desc   Security_HUKS_Cipher_API9_SM2_801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM2_801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM2_801';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSm3NoPaddingOptions(), GetSm2GenerateOptions(256));
      let cipherOptions = MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_KEY_SIZE, 512);
        let cipherData: CipherData = BuildCipherData([1024, 0]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        let startTime = Date.now();
        let encryptResult: CipherData = await DoCipher(newSrcKeyAlias, cipherOptions, cipherData);
        let encryptTime = Date.now() - startTime;
        encryptResult.updateDataArr = [];
        ReBuildCipherData(encryptResult, [encryptResult.finishData!.length, 0]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        startTime = Date.now();
        let decryptResult: CipherData = await DoCipher(srcKeyAlias, cipherOptions, encryptResult);
        let decryptTime = Date.now() - startTime;
        expect(encryptTime).assertLess(100);
        expect(decryptTime).assertLess(100);
        decryptResult.updateDataArr = [];
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_SM2_802
     * @tc.number Security_HUKS_Cipher_API9_SM2_802
     * @tc.desc   Security_HUKS_Cipher_API9_SM2_802
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_SM2_802', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_SM2_802';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSm3NoPaddingOptions(), GetSm2GenerateOptions(256));
      let cipherOptions = MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_KEY_SIZE, 512);
        let cipherData: CipherData = BuildCipherData([1024]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        let startTime = Date.now();
        let encryptResult: CipherData = await DoCipher(newSrcKeyAlias, cipherOptions, cipherData);
        let encryptTime = Date.now() - startTime;
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        startTime = Date.now();
        let decryptResult: CipherData = await DoCipher(srcKeyAlias, cipherOptions, encryptResult);
        let decryptTime = Date.now() - startTime;
        expect(encryptTime).assertLess(100);
        expect(decryptTime).assertLess(100);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

  });
}
