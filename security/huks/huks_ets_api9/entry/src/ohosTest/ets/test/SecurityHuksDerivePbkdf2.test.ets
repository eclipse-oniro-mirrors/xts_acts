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

import { describe, it, TestType, Size, Level, expect } from '@ohos/hypium';
import { huks } from '@kit.UniversalKeystoreKit';
import * as huksCallback from './utils/huks/HuksCallbackUtils';

import { StringToUint8Array } from './utils/common/CommonUtils';
import { GetGcmNoPaddingOptions } from './utils/huks/CipherUtils';
import {
  Derive,
  DeriveCallback,
  DeriveCallbackEndWithAbort,
  DeriveEndWithAbort,
  GetPbkdf2DeriveOptions,
  GetSha256Options,
  GetSha384Options,
  GetSha512Options
} from './utils/huks/DeriveAgreeUtils';
import { GetAesGenerateOptions, GetHmacGenerateOptions } from './utils/huks/GenerateKeyUtils';
import { SetParam, MergeOptions } from './utils/huks/HuksOptionsUtils';
import { Logger } from './utils/common/Logger';


export default function SecurityHuksDerivePbkdf2() {
  describe('SecurityHuksDerivePbkdf2', () => {
    /**
     * @tc.name   Security_HUKS_Derive_API9_PBKDF2_001
     * @tc.number Security_HUKS_Derive_API9_PBKDF2_001
     * @tc.desc   Security_HUKS_Derive_API9_PBKDF2_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Derive_API9_PBKDF2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Derive_API9_PBKDF2_001';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(192);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_ITERATION, 1000);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_SALT, StringToUint8Array("1234567812345678"));
      let initOptions = MergeOptions(GetPbkdf2DeriveOptions(256 / 8), GetSha256Options());
      let finishOptions = MergeOptions(GetGcmNoPaddingOptions(), GetAesGenerateOptions(256));
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_IS_KEY_ALIAS, true);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_STORAGE_FLAG, huks.HuksKeyStorageType.HUKS_STORAGE_PERSISTENT);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(targetKeyAlias))

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        await DeriveCallback(srcKeyAlias, initOptions, finishOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Derive_API9_PBKDF2_002
     * @tc.number Security_HUKS_Derive_API9_PBKDF2_002
     * @tc.desc   Security_HUKS_Derive_API9_PBKDF2_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Derive_API9_PBKDF2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Derive_API9_PBKDF2_002';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(192);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_ITERATION, 1000);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_SALT, StringToUint8Array("1234567812345678"));
      let initOptions = MergeOptions(GetPbkdf2DeriveOptions(256 / 8), GetSha256Options());
      let finishOptions = MergeOptions(GetGcmNoPaddingOptions(), GetAesGenerateOptions(256));
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_IS_KEY_ALIAS, true);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_STORAGE_FLAG, huks.HuksKeyStorageType.HUKS_STORAGE_PERSISTENT);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(targetKeyAlias))

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        await DeriveCallbackEndWithAbort(srcKeyAlias, initOptions, finishOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Derive_API9_PBKDF2_101
     * @tc.number Security_HUKS_Derive_API9_PBKDF2_101
     * @tc.desc   Security_HUKS_Derive_API9_PBKDF2_101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Derive_API9_PBKDF2_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Derive_API9_PBKDF2_101';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(192);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_ITERATION, 1000);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_SALT, StringToUint8Array("1234567812345678"));
      let initOptions = MergeOptions(GetPbkdf2DeriveOptions(256 / 8), GetSha256Options());
      let finishOptions = MergeOptions(GetGcmNoPaddingOptions(), GetAesGenerateOptions(256));
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_IS_KEY_ALIAS, true);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_STORAGE_FLAG, huks.HuksKeyStorageType.HUKS_STORAGE_PERSISTENT);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(targetKeyAlias))

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await Derive(srcKeyAlias, initOptions, finishOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Derive_API9_PBKDF2_102
     * @tc.number Security_HUKS_Derive_API9_PBKDF2_102
     * @tc.desc   Security_HUKS_Derive_API9_PBKDF2_102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Derive_API9_PBKDF2_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Derive_API9_PBKDF2_102';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(192);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_ITERATION, 1000);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_SALT, StringToUint8Array("1234567812345678"));
      let initOptions = MergeOptions(GetPbkdf2DeriveOptions(256 / 8), GetSha256Options());
      let finishOptions = MergeOptions(GetGcmNoPaddingOptions(), GetAesGenerateOptions(256));
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_IS_KEY_ALIAS, true);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_STORAGE_FLAG, huks.HuksKeyStorageType.HUKS_STORAGE_PERSISTENT);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(targetKeyAlias))

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await DeriveEndWithAbort(srcKeyAlias, initOptions, finishOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testDerivePBKDF2Size192SHA256Finish63KBDerive108
     * @tc.number testDerivePBKDF2Size192SHA256Finish63KBDerive108
     * @tc.desc   testDerivePBKDF2Size192SHA256Finish63KBDerive108
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDerivePBKDF2Size192SHA256Finish63KBDerive108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testDerivePBKDF2Size192SHA256Finish63KBDerive108';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(192);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_ITERATION, 1000);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_SALT, StringToUint8Array("1234567812345678"));
      let initOptions = MergeOptions(GetPbkdf2DeriveOptions(256 / 8), GetSha256Options());
      let finishOptions = MergeOptions(GetGcmNoPaddingOptions(), GetAesGenerateOptions(256));
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(targetKeyAlias))

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await Derive(srcKeyAlias, initOptions, finishOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testDerivePBKDF2Size192SHA256Finish63KBDerive130
     * @tc.number testDerivePBKDF2Size192SHA256Finish63KBDerive130
     * @tc.desc   testDerivePBKDF2Size192SHA256Finish63KBDerive130
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDerivePBKDF2Size192SHA256Finish63KBDerive130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testDerivePBKDF2Size192SHA256Finish63KBDerive130';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(192);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      let initOptions = MergeOptions(GetPbkdf2DeriveOptions(256 / 8), GetSha256Options());
      let finishOptions = MergeOptions(GetGcmNoPaddingOptions(), GetHmacGenerateOptions(256));
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(targetKeyAlias))

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await Derive(srcKeyAlias, initOptions, finishOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testDerivePBKDF2Size256SHA256Finish63KBDerive101
     * @tc.number testDerivePBKDF2Size256SHA256Finish63KBDerive101
     * @tc.desc   testDerivePBKDF2Size256SHA256Finish63KBDerive101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDerivePBKDF2Size256SHA256Finish63KBDerive101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testDerivePBKDF2Size256SHA256Finish63KBDerive101';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_ITERATION, 1000);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_SALT, StringToUint8Array("1234567812345678"));
      let initOptions = MergeOptions(GetPbkdf2DeriveOptions(256 / 8), GetSha256Options());
      let finishOptions = MergeOptions(GetGcmNoPaddingOptions(), GetAesGenerateOptions(256));
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_IS_KEY_ALIAS, true);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_STORAGE_FLAG, huks.HuksKeyStorageType.HUKS_STORAGE_PERSISTENT);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(targetKeyAlias))

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await Derive(srcKeyAlias, initOptions, finishOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testDerivePBKDF2Size256SHA256Finish63KBDerive108
     * @tc.number testDerivePBKDF2Size256SHA256Finish63KBDerive108
     * @tc.desc   testDerivePBKDF2Size256SHA256Finish63KBDerive108
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDerivePBKDF2Size256SHA256Finish63KBDerive108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testDerivePBKDF2Size256SHA256Finish63KBDerive108';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_ITERATION, 1000);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_SALT, StringToUint8Array("1234567812345678"));
      let initOptions = MergeOptions(GetPbkdf2DeriveOptions(256 / 8), GetSha256Options());
      let finishOptions = MergeOptions(GetGcmNoPaddingOptions(), GetAesGenerateOptions(256));
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(targetKeyAlias))

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await Derive(srcKeyAlias, initOptions, finishOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testDerivePBKDF2Size256SHA256Finish63KBDerive130
     * @tc.number testDerivePBKDF2Size256SHA256Finish63KBDerive130
     * @tc.desc   testDerivePBKDF2Size256SHA256Finish63KBDerive130
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDerivePBKDF2Size256SHA256Finish63KBDerive130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testDerivePBKDF2Size256SHA256Finish63KBDerive130';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      let initOptions = MergeOptions(GetPbkdf2DeriveOptions(256 / 8), GetSha256Options());
      let finishOptions = MergeOptions(GetGcmNoPaddingOptions(), GetHmacGenerateOptions(256));
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(targetKeyAlias))

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await Derive(srcKeyAlias, initOptions, finishOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testDerivePBKDF2Size256SHA384Finish63KBDerive101
     * @tc.number testDerivePBKDF2Size256SHA384Finish63KBDerive101
     * @tc.desc   testDerivePBKDF2Size256SHA384Finish63KBDerive101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDerivePBKDF2Size256SHA384Finish63KBDerive101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testDerivePBKDF2Size256SHA384Finish63KBDerive101';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA384);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_ITERATION, 1000);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_SALT, StringToUint8Array("1234567812345678"));
      let initOptions = MergeOptions(GetPbkdf2DeriveOptions(256 / 8), GetSha384Options());
      let finishOptions = MergeOptions(GetGcmNoPaddingOptions(), GetAesGenerateOptions(256));
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_IS_KEY_ALIAS, true);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_STORAGE_FLAG, huks.HuksKeyStorageType.HUKS_STORAGE_PERSISTENT);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(targetKeyAlias))

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await Derive(srcKeyAlias, initOptions, finishOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testDerivePBKDF2Size256SHA384Finish63KBDerive108
     * @tc.number testDerivePBKDF2Size256SHA384Finish63KBDerive108
     * @tc.desc   testDerivePBKDF2Size256SHA384Finish63KBDerive108
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDerivePBKDF2Size256SHA384Finish63KBDerive108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testDerivePBKDF2Size256SHA384Finish63KBDerive108';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA384);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_ITERATION, 1000);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_SALT, StringToUint8Array("1234567812345678"));
      let initOptions = MergeOptions(GetPbkdf2DeriveOptions(256 / 8), GetSha384Options());
      let finishOptions = MergeOptions(GetGcmNoPaddingOptions(), GetAesGenerateOptions(256));
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(targetKeyAlias))

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await Derive(srcKeyAlias, initOptions, finishOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testDerivePBKDF2Size256SHA384Finish63KBDerive130
     * @tc.number testDerivePBKDF2Size256SHA384Finish63KBDerive130
     * @tc.desc   testDerivePBKDF2Size256SHA384Finish63KBDerive130
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDerivePBKDF2Size256SHA384Finish63KBDerive130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testDerivePBKDF2Size256SHA384Finish63KBDerive130';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA384);
      let initOptions = MergeOptions(GetPbkdf2DeriveOptions(256 / 8), GetSha384Options());
      let finishOptions = MergeOptions(GetGcmNoPaddingOptions(), GetHmacGenerateOptions(256));
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(targetKeyAlias))

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await Derive(srcKeyAlias, initOptions, finishOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testDerivePBKDF2Size256SHA512Finish63KBDerive101
     * @tc.number testDerivePBKDF2Size256SHA512Finish63KBDerive101
     * @tc.desc   testDerivePBKDF2Size256SHA512Finish63KBDerive101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDerivePBKDF2Size256SHA512Finish63KBDerive101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testDerivePBKDF2Size256SHA512Finish63KBDerive101';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA512);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_ITERATION, 1000);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_SALT, StringToUint8Array("1234567812345678"));
      let initOptions = MergeOptions(GetPbkdf2DeriveOptions(256 / 8), GetSha512Options());
      let finishOptions = MergeOptions(GetGcmNoPaddingOptions(), GetAesGenerateOptions(256));
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_IS_KEY_ALIAS, true);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_STORAGE_FLAG, huks.HuksKeyStorageType.HUKS_STORAGE_PERSISTENT);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(targetKeyAlias))

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await Derive(srcKeyAlias, initOptions, finishOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testDerivePBKDF2Size256SHA512Finish63KBDerive108
     * @tc.number testDerivePBKDF2Size256SHA512Finish63KBDerive108
     * @tc.desc   testDerivePBKDF2Size256SHA512Finish63KBDerive108
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDerivePBKDF2Size256SHA512Finish63KBDerive108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testDerivePBKDF2Size256SHA512Finish63KBDerive108';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA512);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_ITERATION, 1000);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_SALT, StringToUint8Array("1234567812345678"));
      let initOptions = MergeOptions(GetPbkdf2DeriveOptions(256 / 8), GetSha512Options());
      let finishOptions = MergeOptions(GetGcmNoPaddingOptions(), GetAesGenerateOptions(256));
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(targetKeyAlias))

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await Derive(srcKeyAlias, initOptions, finishOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testDerivePBKDF2Size256SHA512Finish63KBDerive130
     * @tc.number testDerivePBKDF2Size256SHA512Finish63KBDerive130
     * @tc.desc   testDerivePBKDF2Size256SHA512Finish63KBDerive130
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDerivePBKDF2Size256SHA512Finish63KBDerive130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testDerivePBKDF2Size256SHA512Finish63KBDerive130';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA512);
      let initOptions = MergeOptions(GetPbkdf2DeriveOptions(256 / 8), GetSha512Options());
      let finishOptions = MergeOptions(GetGcmNoPaddingOptions(), GetHmacGenerateOptions(256));
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(targetKeyAlias))

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await Derive(srcKeyAlias, initOptions, finishOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

  });
}
