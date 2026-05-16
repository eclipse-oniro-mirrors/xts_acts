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

import { GetAesGenerateOptions, GetHmacGenerateOptions } from './utils/huks/GenerateKeyUtils';
import { MergeOptions, SetParam } from './utils/huks/HuksOptionsUtils';
import { StringToUint8Array } from './utils/common/CommonUtils';
import {
  Derive,
  DeriveCallback,
  DeriveCallbackEndWithAbort,
  DeriveEndWithAbort,
  GetHkdfDeriveOptions,
  GetSha256Options,
  GetSha384Options,
  GetSha512Options
} from './utils/huks/DeriveAgreeUtils';
import { GetGcmNoPaddingOptions } from './utils/huks/CipherUtils';
import { Logger } from './utils/common/Logger';

export default function SecurityHuksDeriveHkdf() {
  describe('SecurityHuksDeriveHkdf', () => {
    /**
     * @tc.name   Security_HUKS_Derive_API9_HKDF_001
     * @tc.number Security_HUKS_Derive_API9_HKDF_001
     * @tc.desc   Security_HUKS_Derive_API9_HKDF_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Derive_API9_HKDF_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Derive_API9_HKDF_001';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(192);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      let initOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha256Options());
      let finishOptions = MergeOptions(GetGcmNoPaddingOptions(), GetAesGenerateOptions(256));
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_IS_KEY_ALIAS, true);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_STORAGE_FLAG, huks.HuksKeyStorageType.HUKS_STORAGE_PERSISTENT);
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
     * @tc.name   Security_HUKS_Derive_API9_HKDF_002
     * @tc.number Security_HUKS_Derive_API9_HKDF_002
     * @tc.desc   Security_HUKS_Derive_API9_HKDF_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Derive_API9_HKDF_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Derive_API9_HKDF_001';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(192);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      let initOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha256Options());
      let finishOptions = MergeOptions(GetGcmNoPaddingOptions(), GetAesGenerateOptions(256));
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_IS_KEY_ALIAS, true);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_STORAGE_FLAG, huks.HuksKeyStorageType.HUKS_STORAGE_PERSISTENT);
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
     * @tc.name   Security_HUKS_Derive_API9_HKDF_101
     * @tc.number Security_HUKS_Derive_API9_HKDF_101
     * @tc.desc   Security_HUKS_Derive_API9_HKDF_101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Derive_API9_HKDF_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Derive_API9_HKDF_101';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(192);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      let initOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha256Options());
      let finishOptions = MergeOptions(GetGcmNoPaddingOptions(), GetAesGenerateOptions(256));
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_IS_KEY_ALIAS, true);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_STORAGE_FLAG, huks.HuksKeyStorageType.HUKS_STORAGE_PERSISTENT);
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
     * @tc.name   Security_HUKS_Derive_API9_HKDF_102
     * @tc.number Security_HUKS_Derive_API9_HKDF_102
     * @tc.desc   Security_HUKS_Derive_API9_HKDF_102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Derive_API9_HKDF_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Derive_API9_HKDF_102';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(192);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      let initOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha256Options());
      let finishOptions = MergeOptions(GetGcmNoPaddingOptions(), GetAesGenerateOptions(256));
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_IS_KEY_ALIAS, true);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_STORAGE_FLAG, huks.HuksKeyStorageType.HUKS_STORAGE_PERSISTENT);
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
     * @tc.name   testDeriveHKDFSize192SHA256Finish63KBDerive108
     * @tc.number testDeriveHKDFSize192SHA256Finish63KBDerive108
     * @tc.desc   testDeriveHKDFSize192SHA256Finish63KBDerive108
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeriveHKDFSize192SHA256Finish63KBDerive108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testDeriveHKDFSize192SHA256Finish63KBDerive108';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(192);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      let initOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha256Options());
      let finishOptions = MergeOptions(GetGcmNoPaddingOptions(), GetAesGenerateOptions(256));
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
     * @tc.name   testDeriveHKDFSize192SHA256Finish63KBDerive130
     * @tc.number testDeriveHKDFSize192SHA256Finish63KBDerive130
     * @tc.desc   testDeriveHKDFSize192SHA256Finish63KBDerive130
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeriveHKDFSize192SHA256Finish63KBDerive130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testDeriveHKDFSize192SHA256Finish63KBDerive130';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(192);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      let initOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha256Options());
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
     * @tc.name   testDeriveHKDFSize256SHA256Finish63KBDerive101
     * @tc.number testDeriveHKDFSize256SHA256Finish63KBDerive101
     * @tc.desc   testDeriveHKDFSize256SHA256Finish63KBDerive101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeriveHKDFSize256SHA256Finish63KBDerive101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testDeriveHKDFSize256SHA256Finish63KBDerive101';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      let initOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha256Options());
      let finishOptions = MergeOptions(GetGcmNoPaddingOptions(), GetAesGenerateOptions(256));
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_IS_KEY_ALIAS, true);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_STORAGE_FLAG, huks.HuksKeyStorageType.HUKS_STORAGE_PERSISTENT);
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
     * @tc.name   testDeriveHKDFSize256SHA256Finish63KBDerive108
     * @tc.number testDeriveHKDFSize256SHA256Finish63KBDerive108
     * @tc.desc   testDeriveHKDFSize256SHA256Finish63KBDerive108
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeriveHKDFSize256SHA256Finish63KBDerive108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testDeriveHKDFSize256SHA256Finish63KBDerive108';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      let initOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha256Options());
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
     * @tc.name   testDeriveHKDFSize256SHA256Finish63KBDerive130
     * @tc.number testDeriveHKDFSize256SHA256Finish63KBDerive130
     * @tc.desc   testDeriveHKDFSize256SHA256Finish63KBDerive130
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeriveHKDFSize256SHA256Finish63KBDerive130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testDeriveHKDFSize256SHA256Finish63KBDerive130';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      let initOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha256Options());
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
     * @tc.name   testDeriveHKDFSize256SHA384Finish63KBDerive101
     * @tc.number testDeriveHKDFSize256SHA384Finish63KBDerive101
     * @tc.desc   testDeriveHKDFSize256SHA384Finish63KBDerive101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeriveHKDFSize256SHA384Finish63KBDerive101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testDeriveHKDFSize256SHA384Finish63KBDerive101';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA384);
      let initOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha384Options());
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
     * @tc.name   testDeriveHKDFSize256SHA384Finish63KBDerive108
     * @tc.number testDeriveHKDFSize256SHA384Finish63KBDerive108
     * @tc.desc   testDeriveHKDFSize256SHA384Finish63KBDerive108
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeriveHKDFSize256SHA384Finish63KBDerive108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testDeriveHKDFSize256SHA384Finish63KBDerive108';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA384);
      let initOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha384Options());
      let finishOptions = MergeOptions(GetGcmNoPaddingOptions(), GetAesGenerateOptions(256));
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(targetKeyAlias));
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await Derive(srcKeyAlias, initOptions, finishOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testDeriveHKDFSize256SHA384Finish63KBDerive130
     * @tc.number testDeriveHKDFSize256SHA384Finish63KBDerive130
     * @tc.desc   testDeriveHKDFSize256SHA384Finish63KBDerive130
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeriveHKDFSize256SHA384Finish63KBDerive130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testDeriveHKDFSize256SHA384Finish63KBDerive130';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA384);
      let initOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha384Options());
      let finishOptions = MergeOptions(GetGcmNoPaddingOptions(), GetHmacGenerateOptions(256));
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
     * @tc.name   testDeriveHKDFSize256SHA512Finish63KBDerive101
     * @tc.number testDeriveHKDFSize256SHA512Finish63KBDerive101
     * @tc.desc   testDeriveHKDFSize256SHA512Finish63KBDerive101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeriveHKDFSize256SHA512Finish63KBDerive101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testDeriveHKDFSize256SHA512Finish63KBDerive101';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA512);
      let initOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha512Options());
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
     * @tc.name   testDeriveHKDFSize256SHA512Finish63KBDerive108
     * @tc.number testDeriveHKDFSize256SHA512Finish63KBDerive108
     * @tc.desc   testDeriveHKDFSize256SHA512Finish63KBDerive108
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeriveHKDFSize256SHA512Finish63KBDerive108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testDeriveHKDFSize256SHA512Finish63KBDerive108';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA512);
      let initOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha512Options());
      let finishOptions = MergeOptions(GetGcmNoPaddingOptions(), GetAesGenerateOptions(256));
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(targetKeyAlias));
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await Derive(srcKeyAlias, initOptions, finishOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testDeriveHKDFSize256SHA512Finish63KBDerive130
     * @tc.number testDeriveHKDFSize256SHA512Finish63KBDerive130
     * @tc.desc   testDeriveHKDFSize256SHA512Finish63KBDerive130
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeriveHKDFSize256SHA512Finish63KBDerive130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testDeriveHKDFSize256SHA512Finish63KBDerive130';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA512);
      let initOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha512Options());
      let finishOptions = MergeOptions(GetGcmNoPaddingOptions(), GetHmacGenerateOptions(256));
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

  });
}
