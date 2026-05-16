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
import { describe, it, beforeAll, TestType, Size, Level, expect } from '@ohos/hypium';
import { huks } from '@kit.UniversalKeystoreKit';
import * as huksCallback from './utils/huks/HuksCallbackUtils';

import { GetDsaGenerateOptions } from './utils/huks/GenerateKeyUtils';
import { CheckSoftware, MergeOptions, SetInData, SetParam } from './utils/huks/HuksOptionsUtils';
import {
  BuildSignVerifyData,
  DoSignCallbackEndWithAbort,
  DoSignEndWithAbort,
  GetSha1SignOptions,
  SignVerifyData,
  SignVerifyReal
} from './utils/huks/SignVerifyUtils';
import { Logger } from './utils/common/Logger';

let useSoftware = true;

export default function SecurityHuksSignVerifyDsa() {
  describe('SecurityHuksSignVerifyDsa', () => {
    beforeAll(async () => {
      useSoftware = await CheckSoftware();
    })
    /**
     * @tc.name   Security_HUKS_SignVerify_API9_DSA_001
     * @tc.number Security_HUKS_SignVerify_API9_DSA_001
     * @tc.desc   Security_HUKS_SignVerify_API9_DSA_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_SignVerify_API9_DSA_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_SignVerify_API9_DSA_001';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha1SignOptions(), GetDsaGenerateOptions(1024));
      let signOptions = MergeOptions(GetDsaGenerateOptions(1024), GetSha1SignOptions());

      if (useSoftware) {
        try {
          await huksCallback.generateKeyItem(srcKeyAlias, genOptions);
          let exportKeyRes = await huksCallback.exportKeyItem(srcKeyAlias, genOptions);
          SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
          await huksCallback.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

          let signVerifyData: SignVerifyData = BuildSignVerifyData([63]);
          let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   Security_HUKS_SignVerify_API9_DSA_002
     * @tc.number Security_HUKS_SignVerify_API9_DSA_002
     * @tc.desc   Security_HUKS_SignVerify_API9_DSA_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_SignVerify_API9_DSA_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_SignVerify_API9_DSA_002';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetSha1SignOptions(), GetDsaGenerateOptions(1024));
      let signOptions = MergeOptions(GetDsaGenerateOptions(1024), GetSha1SignOptions());

      if (useSoftware) {
        try {
          await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

          let signVerifyData: SignVerifyData = BuildSignVerifyData([63]);
          await DoSignCallbackEndWithAbort(srcKeyAlias, signOptions, signVerifyData);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   Security_HUKS_SignVerify_API9_DSA_003
     * @tc.number Security_HUKS_SignVerify_API9_DSA_003
     * @tc.desc   Security_HUKS_SignVerify_API9_DSA_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_SignVerify_API9_DSA_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_SignVerify_API9_DSA_003';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha1SignOptions(), GetDsaGenerateOptions(1024));
      let signOptions = MergeOptions(GetDsaGenerateOptions(1024), GetSha1SignOptions());

      if (useSoftware) {
        try {
          await huksCallback.generateKeyItem(srcKeyAlias, genOptions);
          let exportKeyRes = await huksCallback.exportKeyItem(srcKeyAlias, genOptions);
          SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
          await huksCallback.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

          let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
          let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   Security_HUKS_SignVerify_API9_DSA_004
     * @tc.number Security_HUKS_SignVerify_API9_DSA_004
     * @tc.desc   Security_HUKS_SignVerify_API9_DSA_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_SignVerify_API9_DSA_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_SignVerify_API9_DSA_004';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetSha1SignOptions(), GetDsaGenerateOptions(1024));
      let signOptions = MergeOptions(GetDsaGenerateOptions(1024), GetSha1SignOptions());

      if (useSoftware) {
        try {
          await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

          let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
          await DoSignCallbackEndWithAbort(srcKeyAlias, signOptions, signVerifyData);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   Security_HUKS_SignVerify_API9_DSA_101
     * @tc.number Security_HUKS_SignVerify_API9_DSA_101
     * @tc.desc   Security_HUKS_SignVerify_API9_DSA_101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_SignVerify_API9_DSA_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_SignVerify_API9_DSA_101';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha1SignOptions(), GetDsaGenerateOptions(1024));
      let signOptions = MergeOptions(GetDsaGenerateOptions(1024), GetSha1SignOptions());

      if (useSoftware) {
        try {
          await huks.generateKeyItem(srcKeyAlias, genOptions);
          let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
          SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
          await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

          let signVerifyData: SignVerifyData = BuildSignVerifyData([63]);
          let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   Security_HUKS_SignVerify_API9_DSA_102
     * @tc.number Security_HUKS_SignVerify_API9_DSA_102
     * @tc.desc   Security_HUKS_SignVerify_API9_DSA_102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_SignVerify_API9_DSA_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_SignVerify_API9_DSA_102';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetSha1SignOptions(), GetDsaGenerateOptions(1024));
      let signOptions = MergeOptions(GetDsaGenerateOptions(1024), GetSha1SignOptions());

      if (useSoftware) {
        try {
          await huks.generateKeyItem(srcKeyAlias, genOptions);

          let signVerifyData: SignVerifyData = BuildSignVerifyData([63]);
          await DoSignEndWithAbort(srcKeyAlias, signOptions, signVerifyData);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   Security_HUKS_SignVerify_API9_DSA_103
     * @tc.number Security_HUKS_SignVerify_API9_DSA_103
     * @tc.desc   Security_HUKS_SignVerify_API9_DSA_103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_SignVerify_API9_DSA_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_SignVerify_API9_DSA_103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha1SignOptions(), GetDsaGenerateOptions(1024));
      let signOptions = MergeOptions(GetDsaGenerateOptions(1024), GetSha1SignOptions());

      if (useSoftware) {
        try {
          await huks.generateKeyItem(srcKeyAlias, genOptions);
          let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
          SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
          await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

          let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
          let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   Security_HUKS_SignVerify_API9_DSA_104
     * @tc.number Security_HUKS_SignVerify_API9_DSA_104
     * @tc.desc   Security_HUKS_SignVerify_API9_DSA_104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_SignVerify_API9_DSA_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_SignVerify_API9_DSA_104';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetSha1SignOptions(), GetDsaGenerateOptions(1024));
      let signOptions = MergeOptions(GetDsaGenerateOptions(1024), GetSha1SignOptions());

      if (useSoftware) {
        try {
          await huks.generateKeyItem(srcKeyAlias, genOptions);

          let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
          await DoSignEndWithAbort(srcKeyAlias, signOptions, signVerifyData);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

  });
}
