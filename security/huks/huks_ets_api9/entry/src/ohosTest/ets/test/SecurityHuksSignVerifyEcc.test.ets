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
import { describe, it, TestType, Size, Level, expect, beforeAll } from '@ohos/hypium';
import { huks } from '@kit.UniversalKeystoreKit';
import * as huksCallback from './utils/huks/HuksCallbackUtils';

import { GetEccGenerateOptions } from './utils/huks/GenerateKeyUtils';
import { MergeOptions, SetParam, SetInData, CheckSoftware } from './utils/huks/HuksOptionsUtils';
import {
  GetNoDigestSignOptions,
  SignVerifyData,
  BuildSignVerifyData,
  SignVerifyReal,
  DoSignCallbackEndWithAbort,
  DoSignEndWithAbort,
  GetSha1SignOptions,
  GetSha224SignOptions,
  GetSha256SignOptions,
  GetSha384SignOptions,
  GetSha512SignOptions
} from './utils/huks/SignVerifyUtils';
import { Logger } from './utils/common/Logger';

let useSoftware = true;

export default function SecurityHuksSignVerifyEcc() {
  describe('SecurityHuksSignVerifyEcc', () => {
    beforeAll(async () => {
      useSoftware = await CheckSoftware();
    })
    /**
     * @tc.name   Security_HUKS_SignVerify_API9_ECC_001
     * @tc.number Security_HUKS_SignVerify_API9_ECC_001
     * @tc.desc   Security_HUKS_SignVerify_API9_ECC_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_SignVerify_API9_ECC_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_SignVerify_API9_ECC_001';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetNoDigestSignOptions(), GetEccGenerateOptions(256));
      let signOptions = MergeOptions(GetEccGenerateOptions(256), GetNoDigestSignOptions());

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huksCallback.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huksCallback.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([32]);
        let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_SignVerify_API9_ECC_002
     * @tc.number Security_HUKS_SignVerify_API9_ECC_002
     * @tc.desc   Security_HUKS_SignVerify_API9_ECC_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_SignVerify_API9_ECC_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_SignVerify_API9_ECC_002';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetNoDigestSignOptions(), GetEccGenerateOptions(256));
      let signOptions = MergeOptions(GetEccGenerateOptions(256), GetNoDigestSignOptions());

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        let signVerifyData: SignVerifyData = BuildSignVerifyData([32]);
        await DoSignCallbackEndWithAbort(srcKeyAlias, signOptions, signVerifyData);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_SignVerify_API9_ECC_003
     * @tc.number Security_HUKS_SignVerify_API9_ECC_003
     * @tc.desc   Security_HUKS_SignVerify_API9_ECC_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_SignVerify_API9_ECC_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_SignVerify_API9_ECC_003';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetNoDigestSignOptions(), GetEccGenerateOptions(256));
      let signOptions = MergeOptions(GetEccGenerateOptions(256), GetNoDigestSignOptions());

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huksCallback.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huksCallback.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([31, 1]);
        let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_SignVerify_API9_ECC_004
     * @tc.number Security_HUKS_SignVerify_API9_ECC_004
     * @tc.desc   Security_HUKS_SignVerify_API9_ECC_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_SignVerify_API9_ECC_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_SignVerify_API9_ECC_004';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetNoDigestSignOptions(), GetEccGenerateOptions(256));
      let signOptions = MergeOptions(GetEccGenerateOptions(256), GetNoDigestSignOptions());

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        let signVerifyData: SignVerifyData = BuildSignVerifyData([31, 1]);
        await DoSignCallbackEndWithAbort(srcKeyAlias, signOptions, signVerifyData);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   Security_HUKS_SignVerify_API9_ECC_101
     * @tc.number Security_HUKS_SignVerify_API9_ECC_101
     * @tc.desc   Security_HUKS_SignVerify_API9_ECC_101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_SignVerify_API9_ECC_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_SignVerify_API9_ECC_101';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetNoDigestSignOptions(), GetEccGenerateOptions(256));
      let signOptions = MergeOptions(GetEccGenerateOptions(256), GetNoDigestSignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([32]);
        let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_SignVerify_API9_ECC_102
     * @tc.number Security_HUKS_SignVerify_API9_ECC_102
     * @tc.desc   Security_HUKS_SignVerify_API9_ECC_102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_SignVerify_API9_ECC_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_SignVerify_API9_ECC_102';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetNoDigestSignOptions(), GetEccGenerateOptions(256));
      let signOptions = MergeOptions(GetEccGenerateOptions(256), GetNoDigestSignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let signVerifyData: SignVerifyData = BuildSignVerifyData([32]);
        await DoSignEndWithAbort(srcKeyAlias, signOptions, signVerifyData);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_SignVerify_API9_ECC_103
     * @tc.number Security_HUKS_SignVerify_API9_ECC_103
     * @tc.desc   Security_HUKS_SignVerify_API9_ECC_103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_SignVerify_API9_ECC_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_SignVerify_API9_ECC_103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetNoDigestSignOptions(), GetEccGenerateOptions(256));
      let signOptions = MergeOptions(GetEccGenerateOptions(256), GetNoDigestSignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([31, 1]);
        let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_SignVerify_API9_ECC_104
     * @tc.number Security_HUKS_SignVerify_API9_ECC_104
     * @tc.desc   Security_HUKS_SignVerify_API9_ECC_104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_SignVerify_API9_ECC_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_SignVerify_API9_ECC_104';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetNoDigestSignOptions(), GetEccGenerateOptions(256));
      let signOptions = MergeOptions(GetEccGenerateOptions(256), GetNoDigestSignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let signVerifyData: SignVerifyData = BuildSignVerifyData([31, 1]);
        await DoSignEndWithAbort(srcKeyAlias, signOptions, signVerifyData);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testSignVerifyECCSize384SIGNNONE103
     * @tc.number testSignVerifyECCSize384SIGNNONE103
     * @tc.desc   testSignVerifyECCSize384SIGNNONE103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyECCSize384SIGNNONE103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyECCSize384SIGNNONE103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetNoDigestSignOptions(), GetEccGenerateOptions(384));
      let signOptions = MergeOptions(GetEccGenerateOptions(384), GetNoDigestSignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([32]);
        let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testSignVerifyECCSize521SIGNNONE103
     * @tc.number testSignVerifyECCSize521SIGNNONE103
     * @tc.desc   testSignVerifyECCSize521SIGNNONE103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyECCSize521SIGNNONE103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyECCSize521SIGNNONE103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetNoDigestSignOptions(), GetEccGenerateOptions(521));
      let signOptions = MergeOptions(GetEccGenerateOptions(521), GetNoDigestSignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([32]);
        let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testSignVerifyECCSize256SIGNSHA1103
     * @tc.number testSignVerifyECCSize256SIGNSHA1103
     * @tc.desc   testSignVerifyECCSize256SIGNSHA1103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyECCSize256SIGNSHA1103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyECCSize256SIGNSHA1103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha1SignOptions(), GetEccGenerateOptions(256));
      let signOptions = MergeOptions(GetEccGenerateOptions(256), GetSha1SignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        if (useSoftware) {
          let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
          let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
          expect(res).assertEqual(true);
        }
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testSignVerifyECCSize384SIGNSHA1103
     * @tc.number testSignVerifyECCSize384SIGNSHA1103
     * @tc.desc   testSignVerifyECCSize384SIGNSHA1103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyECCSize384SIGNSHA1103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyECCSize384SIGNSHA1103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha1SignOptions(), GetEccGenerateOptions(384));
      let signOptions = MergeOptions(GetEccGenerateOptions(384), GetSha1SignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        if (useSoftware) {
          let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
          let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
          expect(res).assertEqual(true);
        }
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testSignVerifyECCSize521SIGNSHA1103
     * @tc.number testSignVerifyECCSize521SIGNSHA1103
     * @tc.desc   testSignVerifyECCSize521SIGNSHA1103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyECCSize521SIGNSHA1103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyECCSize521SIGNSHA1103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha1SignOptions(), GetEccGenerateOptions(521));
      let signOptions = MergeOptions(GetEccGenerateOptions(521), GetSha1SignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        if (useSoftware) {
          let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
          let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
          expect(res).assertEqual(true);
        }
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testSignVerifyECCSize256SIGNSHA224103
     * @tc.number testSignVerifyECCSize256SIGNSHA224103
     * @tc.desc   testSignVerifyECCSize256SIGNSHA224103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyECCSize256SIGNSHA224103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyECCSize256SIGNSHA224103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha224SignOptions(), GetEccGenerateOptions(256));
      let signOptions = MergeOptions(GetEccGenerateOptions(256), GetSha224SignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        if (useSoftware) {
          let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
          let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
          expect(res).assertEqual(true);
        }
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testSignVerifyECCSize384SIGNSHA224103
     * @tc.number testSignVerifyECCSize384SIGNSHA224103
     * @tc.desc   testSignVerifyECCSize384SIGNSHA224103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyECCSize384SIGNSHA224103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyECCSize384SIGNSHA224103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha224SignOptions(), GetEccGenerateOptions(384));
      let signOptions = MergeOptions(GetEccGenerateOptions(384), GetSha224SignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        if (useSoftware) {
          let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
          let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
          expect(res).assertEqual(true);
        }
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testSignVerifyECCSize521SIGNSHA224103
     * @tc.number testSignVerifyECCSize521SIGNSHA224103
     * @tc.desc   testSignVerifyECCSize521SIGNSHA224103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyECCSize521SIGNSHA224103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyECCSize521SIGNSHA224103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha224SignOptions(), GetEccGenerateOptions(521));
      let signOptions = MergeOptions(GetEccGenerateOptions(521), GetSha224SignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        if (useSoftware) {
          let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
          let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
          expect(res).assertEqual(true);
        }
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testSignVerifyECCSize256SIGNSHA256103
     * @tc.number testSignVerifyECCSize256SIGNSHA256103
     * @tc.desc   testSignVerifyECCSize256SIGNSHA256103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyECCSize256SIGNSHA256103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyECCSize256SIGNSHA256103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha256SignOptions(), GetEccGenerateOptions(256));
      let signOptions = MergeOptions(GetEccGenerateOptions(256), GetSha256SignOptions());

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
    });

    /**
     * @tc.name   testSignVerifyECCSize384SIGNSHA256103
     * @tc.number testSignVerifyECCSize384SIGNSHA256103
     * @tc.desc   testSignVerifyECCSize384SIGNSHA256103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyECCSize384SIGNSHA256103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyECCSize384SIGNSHA256103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha256SignOptions(), GetEccGenerateOptions(384));
      let signOptions = MergeOptions(GetEccGenerateOptions(384), GetSha256SignOptions());

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
    });

    /**
     * @tc.name   testSignVerifyECCSize256SIGNSHA384103
     * @tc.number testSignVerifyECCSize256SIGNSHA384103
     * @tc.desc   testSignVerifyECCSize256SIGNSHA384103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyECCSize256SIGNSHA384103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyECCSize256SIGNSHA384103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha256SignOptions(), GetEccGenerateOptions(384));
      let signOptions = MergeOptions(GetEccGenerateOptions(384), GetSha256SignOptions());

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
    });

    /**
     * @tc.name   testSignVerifyECCSize521SIGNSHA256103
     * @tc.number testSignVerifyECCSize521SIGNSHA256103
     * @tc.desc   testSignVerifyECCSize521SIGNSHA256103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyECCSize521SIGNSHA256103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyECCSize521SIGNSHA256103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha256SignOptions(), GetEccGenerateOptions(521));
      let signOptions = MergeOptions(GetEccGenerateOptions(521), GetSha256SignOptions());

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
    });

    /**
     * @tc.name   testSignVerifyECCSize384SIGNSHA384103
     * @tc.number testSignVerifyECCSize384SIGNSHA384103
     * @tc.desc   testSignVerifyECCSize384SIGNSHA384103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyECCSize384SIGNSHA384103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyECCSize384SIGNSHA384103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha384SignOptions(), GetEccGenerateOptions(384));
      let signOptions = MergeOptions(GetEccGenerateOptions(384), GetSha384SignOptions());

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
    });

    /**
     * @tc.name   testSignVerifyECCSize521SIGNSHA384103
     * @tc.number testSignVerifyECCSize521SIGNSHA384103
     * @tc.desc   testSignVerifyECCSize521SIGNSHA384103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyECCSize521SIGNSHA384103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyECCSize521SIGNSHA384103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha384SignOptions(), GetEccGenerateOptions(521));
      let signOptions = MergeOptions(GetEccGenerateOptions(521), GetSha384SignOptions());

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
    });

    /**
     * @tc.name   testSignVerifyECCSize256SIGNSHA512103
     * @tc.number testSignVerifyECCSize256SIGNSHA512103
     * @tc.desc   testSignVerifyECCSize256SIGNSHA512103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyECCSize256SIGNSHA512103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyECCSize256SIGNSHA512103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha512SignOptions(), GetEccGenerateOptions(256));
      let signOptions = MergeOptions(GetEccGenerateOptions(256), GetSha512SignOptions());

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
    });

    /**
     * @tc.name   testSignVerifyECCSize384SIGNSHA512103
     * @tc.number testSignVerifyECCSize384SIGNSHA512103
     * @tc.desc   testSignVerifyECCSize384SIGNSHA512103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyECCSize384SIGNSHA512103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyECCSize384SIGNSHA512103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha512SignOptions(), GetEccGenerateOptions(384));
      let signOptions = MergeOptions(GetEccGenerateOptions(384), GetSha512SignOptions());

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
    });

    /**
     * @tc.name   testSignVerifyECCSize521SIGNSHA512103
     * @tc.number testSignVerifyECCSize521SIGNSHA512103
     * @tc.desc   testSignVerifyECCSize521SIGNSHA512103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyECCSize521SIGNSHA512103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyECCSize521SIGNSHA512103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha512SignOptions(), GetEccGenerateOptions(521));
      let signOptions = MergeOptions(GetEccGenerateOptions(521), GetSha512SignOptions());

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
    });

  });

}
