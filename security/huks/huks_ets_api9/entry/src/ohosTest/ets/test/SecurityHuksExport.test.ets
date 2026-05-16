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

import { CheckSoftware, MergeOptions, SetParam } from './utils/huks/HuksOptionsUtils';
import {
  GetDsaGenerateOptions,
  GetEccGenerateOptions,
  GetEd25519GenerateOptions,
  GetRsaGenerateOptions,
  GetSm2GenerateOptions,
  GetX25519GenerateOptions
} from './utils/huks/GenerateKeyUtils';
import { GetEcbNoPaddingOptions } from './utils/huks/CipherUtils';
import { GetSha1SignOptions, GetSm3SignOptions } from './utils/huks/SignVerifyUtils';
import { Logger } from './utils/common/Logger';

let useSoftware = true;

export default function SecurityHuksExport() {
  describe('SecurityHuksExport', () => {

    beforeAll(async () => {
      useSoftware = await CheckSoftware();
    })

    /**
     * @tc.name   Security_HUKS_Export_API9_0100
     * @tc.number Security_HUKS_Export_API9_0100
     * @tc.desc   Security_HUKS_Export_API9_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Export_API9_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Export_API9_0100';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetRsaGenerateOptions(512), GetEcbNoPaddingOptions());
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);

      if (useSoftware) {
        try {
          await huksCallback.generateKeyItem(srcKeyAlias, genOptions);
          await huksCallback.exportKeyItem(srcKeyAlias, genOptions);
          await huksCallback.deleteKeyItem(srcKeyAlias, genOptions);
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   Security_HUKS_Export_API9_0200
     * @tc.number Security_HUKS_Export_API9_0200
     * @tc.desc   Security_HUKS_Export_API9_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Export_API9_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Export_API9_0200';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetRsaGenerateOptions(768), GetEcbNoPaddingOptions());
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);

      if (useSoftware) {
        try {
          await huksCallback.generateKeyItem(srcKeyAlias, genOptions);
          await huksCallback.exportKeyItem(srcKeyAlias, genOptions);
          await huksCallback.deleteKeyItem(srcKeyAlias, genOptions);
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   Security_HUKS_Export_API9_0300
     * @tc.number Security_HUKS_Export_API9_0300
     * @tc.desc   Security_HUKS_Export_API9_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Export_API9_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Export_API9_0300';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetRsaGenerateOptions(1024), GetEcbNoPaddingOptions());
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);
        await huksCallback.exportKeyItem(srcKeyAlias, genOptions);
        await huksCallback.deleteKeyItem(srcKeyAlias, genOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Export_API9_0400
     * @tc.number Security_HUKS_Export_API9_0400
     * @tc.desc   Security_HUKS_Export_API9_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Export_API9_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Export_API9_0400';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetRsaGenerateOptions(2048), GetEcbNoPaddingOptions());
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);
        await huksCallback.exportKeyItem(srcKeyAlias, genOptions);
        await huksCallback.deleteKeyItem(srcKeyAlias, genOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Export_API9_0500
     * @tc.number Security_HUKS_Export_API9_0500
     * @tc.desc   Security_HUKS_Export_API9_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Export_API9_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Export_API9_0500';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetRsaGenerateOptions(3072), GetEcbNoPaddingOptions());
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);
        await huksCallback.exportKeyItem(srcKeyAlias, genOptions);
        await huksCallback.deleteKeyItem(srcKeyAlias, genOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Export_API9_0600
     * @tc.number Security_HUKS_Export_API9_0600
     * @tc.desc   Security_HUKS_Export_API9_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Export_API9_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Export_API9_0600';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetRsaGenerateOptions(4096), GetEcbNoPaddingOptions());
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);
        await huksCallback.exportKeyItem(srcKeyAlias, genOptions);
        await huksCallback.deleteKeyItem(srcKeyAlias, genOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Export_API9_0700
     * @tc.number Security_HUKS_Export_API9_0700
     * @tc.desc   Security_HUKS_Export_API9_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Export_API9_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Export_API9_0700';
      let srcKeyAlias = testNumber;

      let genOptions = GetEccGenerateOptions(224);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);

      if (useSoftware) {
        try {
          await huksCallback.generateKeyItem(srcKeyAlias, genOptions);
          await huksCallback.exportKeyItem(srcKeyAlias, genOptions);
          await huksCallback.deleteKeyItem(srcKeyAlias, genOptions);
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   Security_HUKS_Export_API9_0800
     * @tc.number Security_HUKS_Export_API9_0800
     * @tc.desc   Security_HUKS_Export_API9_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Export_API9_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Export_API9_0800';
      let srcKeyAlias = testNumber;

      let genOptions = GetEccGenerateOptions(256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);
        await huksCallback.exportKeyItem(srcKeyAlias, genOptions);
        await huksCallback.deleteKeyItem(srcKeyAlias, genOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Export_API9_0900
     * @tc.number Security_HUKS_Export_API9_0900
     * @tc.desc   Security_HUKS_Export_API9_0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Export_API9_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Export_API9_0900';
      let srcKeyAlias = testNumber;

      let genOptions = GetEccGenerateOptions(384);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);
        await huksCallback.exportKeyItem(srcKeyAlias, genOptions);
        await huksCallback.deleteKeyItem(srcKeyAlias, genOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Export_API9_1000
     * @tc.number Security_HUKS_Export_API9_1000
     * @tc.desc   Security_HUKS_Export_API9_1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Export_API9_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Export_API9_1000';
      let srcKeyAlias = testNumber;

      let genOptions = GetEccGenerateOptions(521);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);
        await huksCallback.exportKeyItem(srcKeyAlias, genOptions);
        await huksCallback.deleteKeyItem(srcKeyAlias, genOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Export_API9_1100
     * @tc.number Security_HUKS_Export_API9_1100
     * @tc.desc   Security_HUKS_Export_API9_1100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Export_API9_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Export_API9_1100';
      let srcKeyAlias = testNumber;

      let genOptions = GetEccGenerateOptions(224);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);

      if (useSoftware) {
        try {
          await huksCallback.generateKeyItem(srcKeyAlias, genOptions);
          await huksCallback.exportKeyItem(srcKeyAlias, genOptions);
          await huksCallback.deleteKeyItem(srcKeyAlias, genOptions);
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   Security_HUKS_Export_API9_1200
     * @tc.number Security_HUKS_Export_API9_1200
     * @tc.desc   Security_HUKS_Export_API9_1200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Export_API9_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Export_API9_1200';
      let srcKeyAlias = testNumber;

      let genOptions = GetEccGenerateOptions(256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);
        await huksCallback.exportKeyItem(srcKeyAlias, genOptions);
        await huksCallback.deleteKeyItem(srcKeyAlias, genOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Export_API9_1300
     * @tc.number Security_HUKS_Export_API9_1300
     * @tc.desc   Security_HUKS_Export_API9_1300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Export_API9_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Export_API9_1300';
      let srcKeyAlias = testNumber;

      let genOptions = GetEccGenerateOptions(384);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);
        await huksCallback.exportKeyItem(srcKeyAlias, genOptions);
        await huksCallback.deleteKeyItem(srcKeyAlias, genOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Export_API9_1400
     * @tc.number Security_HUKS_Export_API9_1400
     * @tc.desc   Security_HUKS_Export_API9_1400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Export_API9_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Export_API9_1400';
      let srcKeyAlias = testNumber;

      let genOptions = GetEccGenerateOptions(521);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);
        await huksCallback.exportKeyItem(srcKeyAlias, genOptions);
        await huksCallback.deleteKeyItem(srcKeyAlias, genOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Export_API9_1500
     * @tc.number Security_HUKS_Export_API9_1500
     * @tc.desc   Security_HUKS_Export_API9_1500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Export_API9_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Export_API9_1500';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetSha1SignOptions(), GetEd25519GenerateOptions(256));

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);
        await huksCallback.exportKeyItem(srcKeyAlias, genOptions);
        await huksCallback.deleteKeyItem(srcKeyAlias, genOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Export_API9_1600
     * @tc.number Security_HUKS_Export_API9_1600
     * @tc.desc   Security_HUKS_Export_API9_1600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Export_API9_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Export_API9_1600';
      let srcKeyAlias = testNumber;

      let genOptions = GetX25519GenerateOptions(256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);
        await huksCallback.exportKeyItem(srcKeyAlias, genOptions);
        await huksCallback.deleteKeyItem(srcKeyAlias, genOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Export_API9_1700
     * @tc.number Security_HUKS_Export_API9_1700
     * @tc.desc   Security_HUKS_Export_API9_1700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Export_API9_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Export_API9_1700';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetDsaGenerateOptions(1024), GetSha1SignOptions());

      if (useSoftware) {
        try {
          await huksCallback.generateKeyItem(srcKeyAlias, genOptions);
          await huksCallback.exportKeyItem(srcKeyAlias, genOptions);
          await huksCallback.deleteKeyItem(srcKeyAlias, genOptions);
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   Security_HUKS_Export_API9_1800
     * @tc.number Security_HUKS_Export_API9_1800
     * @tc.desc   Security_HUKS_Export_API9_1800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Export_API9_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Export_API9_1800';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetSm2GenerateOptions(256), GetSm3SignOptions());

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);
        await huksCallback.exportKeyItem(srcKeyAlias, genOptions);
        await huksCallback.deleteKeyItem(srcKeyAlias, genOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Export_API9_2000
     * @tc.number Security_HUKS_Export_API9_2000
     * @tc.desc   Security_HUKS_Export_API9_2000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Export_API9_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Export_API9_1800';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetSm2GenerateOptions(256), GetSm3SignOptions());

      try {
        await huksCallback.exportKeyItem(srcKeyAlias, genOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000011);
      }
    });
  });
}
