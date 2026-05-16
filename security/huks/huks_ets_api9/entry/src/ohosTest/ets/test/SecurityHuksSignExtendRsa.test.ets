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
import { describe, it, expect, beforeAll, TestType, Size, Level } from "@ohos/hypium";
import huks from "@ohos.security.huks";
import * as huksCallback from './utils/huks/HuksCallbackUtils';

import { GetDataBySize, StringToUint8Array } from "./utils/common/CommonUtils";
import { Logger } from "./utils/common/Logger";
import { CheckWifiInfo } from './utils/common/NetworkUtils';
import { GetAttestKeyOptions } from "./utils/huks/AttestKeyUtils";
import {
  BuildCipherData,
  Cipher,
  CipherData,
  CipherForGcm,
  CompareCipherData,
  GetCbcNoPaddingOptions,
  GetCbcPkcs7Options,
  GetEcbNoPaddingOptions,
  GetEcbOaepSha256Options,
  GetGcmNoPaddingOptions
} from "./utils/huks/CipherUtils";
import {
  Agree,
  Derive,
  GetEcdhAgreeOptions,
  GetHkdfDeriveOptions,
  GetPbkdf2DeriveOptions,
  GetSha256Options,
  GetSha512Options,
  Mac
} from "./utils/huks/DeriveAgreeUtils";
import {
  GetAesGenerateOptions,
  GetDsaGenerateOptions,
  GetEccGenerateOptions,
  GetEd25519GenerateOptions,
  GetHmacGenerateOptions,
  GetRsaGenerateOptions,
  GetSm2GenerateOptions,
  GetSm4GenerateOptions
} from "./utils/huks/GenerateKeyUtils";
import { CheckSoftware, DeleteParam, MergeOptions, PrintOptions, SetInData, SetParam } from "./utils/huks/HuksOptionsUtils";
import {
  BuildSignVerifyData,
  GetNoDigestPkcs1SignOptions,
  GetNoDigestSignOptions,
  GetSha1SignOptions,
  GetSha256Pkcs1SignOptions,
  GetSha256SignOptions,
  GetSm3SignOptions,
  SignVerify,
  SignVerifyData
} from "./utils/huks/SignVerifyUtils";

let useSoftware = true;

export default function SecurityHuksSignExtendRsa() {
  describe('SecurityHuksSignExtendRsa', () => {
    beforeAll(async () => {
      useSoftware = await CheckSoftware();
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_0100
     * @tc.number Security_HUKS_RSA_SignExtend_0100
     * @tc.desc   No Padding and Sign Verify with RSA.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Security_HUKS_RSA_SignExtend_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = "Security_HUKS_RSA_SignExtend_0100";
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetSha256Pkcs1SignOptions(), GetRsaGenerateOptions(1024));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING);
      let signOptions = MergeOptions(GetRsaGenerateOptions(1024), GetSha256Pkcs1SignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 0]);
        let res = await SignVerify(srcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_0200
     * @tc.number Security_HUKS_RSA_SignExtend_0200
     * @tc.desc   No Digest and Sign Verify with RSA.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Security_HUKS_RSA_SignExtend_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = "Security_HUKS_RSA_SignExtend_0200";
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetSha256Pkcs1SignOptions(), GetRsaGenerateOptions(1024));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST);
      let signOptions = MergeOptions(GetRsaGenerateOptions(1024), GetSha256Pkcs1SignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 0]);
        let res = await SignVerify(srcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_0300
     * @tc.number Security_HUKS_RSA_SignExtend_0300
     * @tc.desc   Alg, Purpose and length filled and Sign Verify with RSA.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Security_HUKS_RSA_SignExtend_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = "Security_HUKS_RSA_SignExtend_0300";
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetSha256Pkcs1SignOptions(), GetRsaGenerateOptions(1024));
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING);
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(1024), GetSha256Pkcs1SignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 0]);
        let res = await SignVerify(srcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_0400
     * @tc.number Security_HUKS_RSA_SignExtend_0400
     * @tc.desc   DigestNONE and Sign Verify with hashed plain test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Security_HUKS_RSA_SignExtend_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = "Security_HUKS_RSA_SignExtend_0400";
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetNoDigestPkcs1SignOptions(), GetRsaGenerateOptions(1024));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(1024), GetNoDigestPkcs1SignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 0]);
        let res = await SignVerify(srcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_0500
     * @tc.number Security_HUKS_RSA_SignExtend_0500
     * @tc.desc   No Padding while Sign Verify.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_0500';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetSha256Pkcs1SignOptions(), GetRsaGenerateOptions(1024));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN);
      let signOptions = MergeOptions(GetRsaGenerateOptions(1024), GetSha256Pkcs1SignOptions());
      DeleteParam(signOptions, huks.HuksTag.HUKS_TAG_PADDING);

      await huks.generateKeyItem(srcKeyAlias, genOptions);

      try {
        await huks.initSession(srcKeyAlias, signOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_0600
     * @tc.number Security_HUKS_RSA_SignExtend_0600
     * @tc.desc   No Digest while Sign Verify.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_0600';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetSha256Pkcs1SignOptions(), GetRsaGenerateOptions(1024));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN);
      let signOptions = MergeOptions(GetRsaGenerateOptions(1024), GetSha256Pkcs1SignOptions());
      DeleteParam(signOptions, huks.HuksTag.HUKS_TAG_DIGEST);

      await huks.generateKeyItem(srcKeyAlias, genOptions);

      try {
        await huks.initSession(srcKeyAlias, signOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_0700
     * @tc.number Security_HUKS_RSA_SignExtend_0700
     * @tc.desc   Alg, Purpose and length only while Sign Verify.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_0700';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetSha256Pkcs1SignOptions(), GetRsaGenerateOptions(1024));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN);
      let signOptions = MergeOptions(GetRsaGenerateOptions(1024), GetSha256Pkcs1SignOptions());
      DeleteParam(signOptions, huks.HuksTag.HUKS_TAG_PADDING);
      DeleteParam(signOptions, huks.HuksTag.HUKS_TAG_DIGEST);

      await huks.generateKeyItem(srcKeyAlias, genOptions);

      try {
        await huks.initSession(srcKeyAlias, signOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_0800
     * @tc.number Security_HUKS_RSA_SignExtend_0800
     * @tc.desc   use plain text while Sign Verify.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_0800';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetNoDigestPkcs1SignOptions(), GetRsaGenerateOptions(1024));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN);
      let signOptions = MergeOptions(GetRsaGenerateOptions(1024), GetNoDigestPkcs1SignOptions());

      await huks.generateKeyItem(srcKeyAlias, genOptions);

      let initRes = await huks.initSession(srcKeyAlias, signOptions);
      signOptions.inData = StringToUint8Array(GetDataBySize(240));
      try {
        await huks.finishSession(initRes.handle, signOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_0900
     * @tc.number Security_HUKS_RSA_SignExtend_0900
     * @tc.desc   AES not GCM,no BlockMode while generate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_0900';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetCbcNoPaddingOptions(16), GetAesGenerateOptions(128));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE);
      let cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcNoPaddingOptions(16));
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let cipherData: CipherData = BuildCipherData([64, 0]);
        let res = await Cipher(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_1000
     * @tc.number Security_HUKS_RSA_SignExtend_1000
     * @tc.desc   AES not GCM,no digest while generate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_1000';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetCbcNoPaddingOptions(16), GetAesGenerateOptions(128));
      let cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcNoPaddingOptions(16));
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let cipherData: CipherData = BuildCipherData([64, 0]);
        let res = await Cipher(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_1100
     * @tc.number Security_HUKS_RSA_SignExtend_1100
     * @tc.desc   AES not GCM,no padding while generate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_1100';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetCbcNoPaddingOptions(16), GetAesGenerateOptions(128));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING);
      let cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcNoPaddingOptions(16));
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let cipherData: CipherData = BuildCipherData([64, 0]);
        let res = await Cipher(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_1200
     * @tc.number Security_HUKS_RSA_SignExtend_1200
     * @tc.desc   AES not GCM,no IV while generate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_1200';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetCbcNoPaddingOptions(16), GetAesGenerateOptions(128));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_IV);
      let cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcNoPaddingOptions(16));
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let cipherData: CipherData = BuildCipherData([64, 0]);
        let res = await Cipher(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_1300
     * @tc.number Security_HUKS_RSA_SignExtend_1300
     * @tc.desc   AES not GCM,no blockmode,digest,padding,IV while generate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_1300';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetCbcNoPaddingOptions(16), GetAesGenerateOptions(128));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST);
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING);
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE);
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_IV);
      let cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcNoPaddingOptions(16));
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let cipherData: CipherData = BuildCipherData([64, 0]);
        let res = await Cipher(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_1400
     * @tc.number Security_HUKS_RSA_SignExtend_1400
     * @tc.desc   AES GCM,no blockmode while generate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_1400';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetGcmNoPaddingOptions(), GetAesGenerateOptions(128));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE);
      let cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetGcmNoPaddingOptions());
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let cipherData: CipherData = BuildCipherData([64, 0]);
        let res = await CipherForGcm(srcKeyAlias, cipherOptions, cipherData, 16);
        expect(CompareCipherData(cipherData, res)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_1500
     * @tc.number Security_HUKS_RSA_SignExtend_1500
     * @tc.desc   AES GCM,no digest while generate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_1500';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetGcmNoPaddingOptions(), GetAesGenerateOptions(128));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST);
      let cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetGcmNoPaddingOptions());
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let cipherData: CipherData = BuildCipherData([64, 0]);
        let res = await CipherForGcm(srcKeyAlias, cipherOptions, cipherData, 16);
        expect(CompareCipherData(cipherData, res)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_1600
     * @tc.number Security_HUKS_RSA_SignExtend_1600
     * @tc.desc   AES GCM,no padding while generate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_1600';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetGcmNoPaddingOptions(), GetAesGenerateOptions(128));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING);
      let cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetGcmNoPaddingOptions());
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let cipherData: CipherData = BuildCipherData([64, 0]);
        let res = await CipherForGcm(srcKeyAlias, cipherOptions, cipherData, 16);
        expect(CompareCipherData(cipherData, res)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_1700
     * @tc.number Security_HUKS_RSA_SignExtend_1700
     * @tc.desc   AES GCM,no blockmode,digest,padding while generate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_1700';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetGcmNoPaddingOptions(), GetAesGenerateOptions(128));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE);
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST);
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING);
      let cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetGcmNoPaddingOptions());
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let cipherData: CipherData = BuildCipherData([64, 0]);
        let res = await CipherForGcm(srcKeyAlias, cipherOptions, cipherData, 16);
        expect(CompareCipherData(cipherData, res)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_1800
     * @tc.number Security_HUKS_RSA_SignExtend_1800
     * @tc.desc   AES GCM,no digest while generate,use wrong digest (SHA256)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_1800';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetCbcNoPaddingOptions(16), GetAesGenerateOptions(128));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      let cipherOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcNoPaddingOptions(16));
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let cipherData: CipherData = BuildCipherData([64, 0]);
        let res = await Cipher(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_1900
     * @tc.number Security_HUKS_RSA_SignExtend_1900
     * @tc.desc   RSA Cipher,no blockMode while generate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_1900';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetEcbOaepSha256Options(), GetRsaGenerateOptions(1024));
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE);
      let cipherOptions = MergeOptions(GetRsaGenerateOptions(1024), GetEcbOaepSha256Options());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let cipherData: CipherData = BuildCipherData([32]);
        let res = await Cipher(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_2000
     * @tc.number Security_HUKS_RSA_SignExtend_2000
     * @tc.desc   RSA Cipher,no digest while generate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_2000';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetEcbOaepSha256Options(), GetRsaGenerateOptions(1024));
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST);
      let cipherOptions = MergeOptions(GetRsaGenerateOptions(1024), GetEcbOaepSha256Options());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let cipherData: CipherData = BuildCipherData([32]);
        let res = await Cipher(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_2100
     * @tc.number Security_HUKS_RSA_SignExtend_2100
     * @tc.desc   RSA Cipher,no padding while generate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_2100';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetEcbOaepSha256Options(), GetRsaGenerateOptions(1024));
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING);
      let cipherOptions = MergeOptions(GetRsaGenerateOptions(1024), GetEcbOaepSha256Options());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let cipherData: CipherData = BuildCipherData([32]);
        let res = await Cipher(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_2200
     * @tc.number Security_HUKS_RSA_SignExtend_2200
     * @tc.desc   RSA Cipher,no blockmode,digest,padding while generate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_2200';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetEcbOaepSha256Options(), GetRsaGenerateOptions(1024));
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE);
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST);
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING);
      let cipherOptions = MergeOptions(GetRsaGenerateOptions(1024), GetEcbOaepSha256Options());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let cipherData: CipherData = BuildCipherData([32]);
        let res = await Cipher(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_2300
     * @tc.number Security_HUKS_RSA_SignExtend_2300
     * @tc.desc   RSA Cipher,wrong blockmode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_2300';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetEcbOaepSha256Options(), GetRsaGenerateOptions(1024));
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE);
      let cipherOptions = MergeOptions(GetRsaGenerateOptions(1024), GetEcbOaepSha256Options());
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_GCM);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await huks.initSession(srcKeyAlias, cipherOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_2400
     * @tc.number Security_HUKS_RSA_SignExtend_2400
     * @tc.desc   SM4 Cipher,no blockmode while generate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_2400';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetCbcNoPaddingOptions(16), GetSm4GenerateOptions(128));
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetCbcNoPaddingOptions(16));

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let cipherData: CipherData = BuildCipherData([64, 64]);
        let res = await Cipher(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_2600
     * @tc.number Security_HUKS_RSA_SignExtend_2600
     * @tc.desc   SM4 Cipher,no padding while generate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_2600';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetCbcNoPaddingOptions(16), GetSm4GenerateOptions(128));
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetCbcNoPaddingOptions(16));

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let cipherData: CipherData = BuildCipherData([64, 64]);
        let res = await Cipher(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_2700
     * @tc.number Security_HUKS_RSA_SignExtend_2700
     * @tc.desc   SM4 Cipher,no IV while generate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_2700';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetCbcNoPaddingOptions(16), GetSm4GenerateOptions(128));
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_IV);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetCbcNoPaddingOptions(16));

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let cipherData: CipherData = BuildCipherData([64, 64]);
        let res = await Cipher(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_2800
     * @tc.number Security_HUKS_RSA_SignExtend_2800
     * @tc.desc   SM4 Cipher,no blockMode,padding,IV while generate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_2800';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetCbcNoPaddingOptions(16), GetSm4GenerateOptions(128));
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE);
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING);
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_IV);
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetCbcNoPaddingOptions(16));

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let cipherData: CipherData = BuildCipherData([64, 64]);
        let res = await Cipher(srcKeyAlias, cipherOptions, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_2900
     * @tc.number Security_HUKS_RSA_SignExtend_2900
     * @tc.desc   SM4 Cipher,wrong padding while generate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_2900';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetCbcNoPaddingOptions(16), GetSm4GenerateOptions(128));
      let cipherOptions = MergeOptions(GetSm4GenerateOptions(128), GetCbcPkcs7Options(16));

      await huks.generateKeyItem(srcKeyAlias, genOptions);

      try {
        await huks.initSession(srcKeyAlias, cipherOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_3000
     * @tc.number Security_HUKS_RSA_SignExtend_3000
     * @tc.desc   RSA SignVreify,hash mode doesn't suite for the hashed data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_3000';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetNoDigestPkcs1SignOptions(), GetRsaGenerateOptions(1024));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(1024), GetSha256Pkcs1SignOptions());

      await huks.generateKeyItem(srcKeyAlias, genOptions);

      try {
        await huks.initSession(srcKeyAlias, signOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_3100
     * @tc.number Security_HUKS_RSA_SignExtend_3100
     * @tc.desc   DSA SignVerify,no digest while generate(TEE Not support)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_3100';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetSha1SignOptions(), GetDsaGenerateOptions(1024));
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST);
      let signOptions = MergeOptions(GetDsaGenerateOptions(1024), GetSha1SignOptions());

      if (useSoftware) {
        try {
          await huks.generateKeyItem(srcKeyAlias, genOptions);

          let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 0]);
          let res = await SignVerify(srcKeyAlias, signOptions, signVerifyData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_3200
     * @tc.number Security_HUKS_RSA_SignExtend_3200
     * @tc.desc   ECC SignVerify,no Hash Support
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_3200';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetNoDigestSignOptions(), GetEccGenerateOptions(256));
      let signOptions = MergeOptions(GetEccGenerateOptions(256), GetNoDigestSignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 0]);
        let res = await SignVerify(srcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_3300
     * @tc.number Security_HUKS_RSA_SignExtend_3300
     * @tc.desc   ECC SignVerify,hash mode doesn't suite for the hashed data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_3300';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetNoDigestSignOptions(), GetEccGenerateOptions(256));
      let signOptions = MergeOptions(GetEccGenerateOptions(256), GetSha256SignOptions());

      await huks.generateKeyItem(srcKeyAlias, genOptions);

      try {
        await huks.initSession(srcKeyAlias, signOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_3400
     * @tc.number Security_HUKS_RSA_SignExtend_3400
     * @tc.desc   ECC SignVerify,no digest while generate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_3400';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetSha256SignOptions(), GetEccGenerateOptions(256));
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST);
      let signOptions = MergeOptions(GetEccGenerateOptions(256), GetSha256SignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 0]);
        let res = await SignVerify(srcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_3500
     * @tc.number Security_HUKS_RSA_SignExtend_3500
     * @tc.desc   ED25519 SignVerify,no digest while generate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_3500';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetSha256SignOptions(), GetEd25519GenerateOptions(256));
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST);
      let signOptions = MergeOptions(GetEd25519GenerateOptions(256), GetSha1SignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 0]);
        let res = await SignVerify(srcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_3600
     * @tc.number Security_HUKS_RSA_SignExtend_3600
     * @tc.desc   SM2 SignVerify,no hash support
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_3600';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetNoDigestSignOptions(), GetSm2GenerateOptions(256));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetSm2GenerateOptions(256), GetNoDigestSignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let signVerifyData: SignVerifyData = BuildSignVerifyData([32, 0]);
        let res = await SignVerify(srcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_3700
     * @tc.number Security_HUKS_RSA_SignExtend_3700
     * @tc.desc   SM2 SignVerify,hash mode doesn't suite for the hashed data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_3700';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetNoDigestSignOptions(), GetSm2GenerateOptions(256));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetSm2GenerateOptions(256), GetSm3SignOptions());

      await huks.generateKeyItem(srcKeyAlias, genOptions);

      try {
        await huks.initSession(srcKeyAlias, signOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_3800
     * @tc.number Security_HUKS_RSA_SignExtend_3800
     * @tc.desc   SM2 SignVerify,no digest while generate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_3800';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetSm3SignOptions(), GetSm2GenerateOptions(256));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST);
      let signOptions = MergeOptions(GetSm2GenerateOptions(256), GetSm3SignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 0]);
        let res = await SignVerify(srcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_3900
     * @tc.number Security_HUKS_RSA_SignExtend_3900
     * @tc.desc   ECDH Agree,no blockMode while generate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_3900';
      let srcKeyAlias1 = testNumber + "01";
      let srcKeyAlias2 = testNumber + "02";
      let targetKeyAlias1 = srcKeyAlias1 + "final";
      let targetKeyAlias2 = srcKeyAlias2 + "final";

      let genOptions = GetEccGenerateOptions(256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let initOptions = GetEcdhAgreeOptions(256);
      SetParam(initOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(initOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(initOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let finishOptions = MergeOptions(GetEcbNoPaddingOptions(), GetAesGenerateOptions(256));
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_IS_KEY_ALIAS, true);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_STORAGE_FLAG, huks.HuksKeyStorageType.HUKS_STORAGE_PERSISTENT);

      try {
        await huks.generateKeyItem(srcKeyAlias1, genOptions);
        await huks.generateKeyItem(srcKeyAlias2, genOptions);
        let exportRes1 = await huks.exportKeyItem(srcKeyAlias1, genOptions);
        let exportRes2 = await huks.exportKeyItem(srcKeyAlias2, genOptions);

        SetInData(initOptions, exportRes2.outData!);
        SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(targetKeyAlias1));
        await Agree(srcKeyAlias1, initOptions, finishOptions);
        SetInData(initOptions, exportRes1.outData!);
        SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(targetKeyAlias2));
        await Agree(srcKeyAlias2, initOptions, finishOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_4000
     * @tc.number Security_HUKS_RSA_SignExtend_4000
     * @tc.desc   ECDH Agree,no digest while generate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_4000';
      let srcKeyAlias1 = testNumber + "01";
      let srcKeyAlias2 = testNumber + "02";
      let targetKeyAlias1 = srcKeyAlias1 + "final";
      let targetKeyAlias2 = srcKeyAlias2 + "final";

      let genOptions = GetEccGenerateOptions(256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let initOptions = GetEcdhAgreeOptions(256);
      SetParam(initOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(initOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(initOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let finishOptions = MergeOptions(GetEcbNoPaddingOptions(), GetAesGenerateOptions(256));
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_IS_KEY_ALIAS, true);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_STORAGE_FLAG, huks.HuksKeyStorageType.HUKS_STORAGE_PERSISTENT);

      try {
        await huks.generateKeyItem(srcKeyAlias1, genOptions);
        await huks.generateKeyItem(srcKeyAlias2, genOptions);
        let exportRes1 = await huks.exportKeyItem(srcKeyAlias1, genOptions);
        let exportRes2 = await huks.exportKeyItem(srcKeyAlias2, genOptions);

        SetInData(initOptions, exportRes2.outData!);
        SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(targetKeyAlias1));
        await Agree(srcKeyAlias1, initOptions, finishOptions);
        SetInData(initOptions, exportRes1.outData!);
        SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(targetKeyAlias2));
        await Agree(srcKeyAlias2, initOptions, finishOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_4100
     * @tc.number Security_HUKS_RSA_SignExtend_4100
     * @tc.desc   ECDH Agree,no padding while generate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_4100';
      let srcKeyAlias1 = testNumber + "01";
      let srcKeyAlias2 = testNumber + "02";
      let targetKeyAlias1 = srcKeyAlias1 + "final";
      let targetKeyAlias2 = srcKeyAlias2 + "final";

      let genOptions = GetEccGenerateOptions(256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      let initOptions = GetEcdhAgreeOptions(256);
      SetParam(initOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(initOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(initOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let finishOptions = MergeOptions(GetEcbNoPaddingOptions(), GetAesGenerateOptions(256));
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_IS_KEY_ALIAS, true);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_STORAGE_FLAG, huks.HuksKeyStorageType.HUKS_STORAGE_PERSISTENT);

      try {
        await huks.generateKeyItem(srcKeyAlias1, genOptions);
        await huks.generateKeyItem(srcKeyAlias2, genOptions);
        let exportRes1 = await huks.exportKeyItem(srcKeyAlias1, genOptions);
        let exportRes2 = await huks.exportKeyItem(srcKeyAlias2, genOptions);

        SetInData(initOptions, exportRes2.outData!);
        SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(targetKeyAlias1));
        await Agree(srcKeyAlias1, initOptions, finishOptions);
        SetInData(initOptions, exportRes1.outData!);
        SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(targetKeyAlias2));
        await Agree(srcKeyAlias2, initOptions, finishOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_4200
     * @tc.number Security_HUKS_RSA_SignExtend_4200
     * @tc.desc   ECDH Agree,no padding,blockmode,digest while generate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_4200';
      let srcKeyAlias1 = testNumber + "01";
      let srcKeyAlias2 = testNumber + "02";
      let targetKeyAlias1 = srcKeyAlias1 + "final";
      let targetKeyAlias2 = srcKeyAlias2 + "final";

      let genOptions = GetEccGenerateOptions(256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
      let initOptions = GetEcdhAgreeOptions(256);
      SetParam(initOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(initOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(initOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
      let finishOptions = MergeOptions(GetEcbNoPaddingOptions(), GetAesGenerateOptions(256));
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_IS_KEY_ALIAS, true);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_STORAGE_FLAG, huks.HuksKeyStorageType.HUKS_STORAGE_PERSISTENT);

      try {
        await huks.generateKeyItem(srcKeyAlias1, genOptions);
        await huks.generateKeyItem(srcKeyAlias2, genOptions);
        let exportRes1 = await huks.exportKeyItem(srcKeyAlias1, genOptions);
        let exportRes2 = await huks.exportKeyItem(srcKeyAlias2, genOptions);

        SetInData(initOptions, exportRes2.outData!);
        SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(targetKeyAlias1));
        await Agree(srcKeyAlias1, initOptions, finishOptions);
        SetInData(initOptions, exportRes1.outData!);
        SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(targetKeyAlias2));
        await Agree(srcKeyAlias2, initOptions, finishOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_4300
     * @tc.number Security_HUKS_RSA_SignExtend_4300
     * @tc.desc   HKDF Derive,no digest while generate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_4300';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(192);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_IV, StringToUint8Array(GetDataBySize(16)));
      let initOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha256Options());
      SetParam(initOptions, huks.HuksTag.HUKS_TAG_IV, StringToUint8Array(GetDataBySize(16)));
      let finishOptions = MergeOptions(GetGcmNoPaddingOptions(), GetAesGenerateOptions(256));
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(targetKeyAlias))

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await Derive(srcKeyAlias, initOptions, finishOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_4400
     * @tc.number Security_HUKS_RSA_SignExtend_4400
     * @tc.desc   HKDF Derive,no IV while generate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_4400';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(192);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      let initOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha256Options());
      SetParam(initOptions, huks.HuksTag.HUKS_TAG_IV, StringToUint8Array(GetDataBySize(16)));
      let finishOptions = MergeOptions(GetGcmNoPaddingOptions(), GetAesGenerateOptions(256));
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(targetKeyAlias))

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await Derive(srcKeyAlias, initOptions, finishOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_4500
     * @tc.number Security_HUKS_RSA_SignExtend_4500
     * @tc.desc   HKDF Derive,no digest,IV while generate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_4500';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(192);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      let initOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha256Options());
      SetParam(initOptions, huks.HuksTag.HUKS_TAG_IV, StringToUint8Array(GetDataBySize(16)));
      let finishOptions = MergeOptions(GetGcmNoPaddingOptions(), GetAesGenerateOptions(256));
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(targetKeyAlias))

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await Derive(srcKeyAlias, initOptions, finishOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_4600
     * @tc.number Security_HUKS_RSA_SignExtend_4600
     * @tc.desc   HKDF Derive,IV length err
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_4600';
      let srcKeyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(192);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      let initOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha256Options());
      SetParam(initOptions, huks.HuksTag.HUKS_TAG_IV, StringToUint8Array(GetDataBySize(68)));

      await huks.generateKeyItem(srcKeyAlias, genOptions);

      try {
        await huks.initSession(srcKeyAlias, initOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`)
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_4700
     * @tc.number Security_HUKS_RSA_SignExtend_4700
     * @tc.desc   HKDF Derive,IV format err
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_4700';
      let srcKeyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(192);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      let initOptions = MergeOptions(GetHkdfDeriveOptions(256 / 8), GetSha256Options());
      SetParam(initOptions, huks.HuksTag.HUKS_TAG_IV, 16);

      await huks.generateKeyItem(srcKeyAlias, genOptions);

      try {
        await huks.initSession(srcKeyAlias, initOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_4800
     * @tc.number Security_HUKS_RSA_SignExtend_4800
     * @tc.desc   PBKDF Derive,no digest while generate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_4800';
      let srcKeyAlias = testNumber;
      let targetKeyAlias = srcKeyAlias + "final";

      let genOptions = GetAesGenerateOptions(192);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_ITERATION, 1000);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_SALT, StringToUint8Array(GetDataBySize(16)));
      let initOptions = MergeOptions(GetPbkdf2DeriveOptions(256 / 8), GetSha256Options());
      SetParam(initOptions, huks.HuksTag.HUKS_TAG_IV, StringToUint8Array(GetDataBySize(16)));
      let finishOptions = MergeOptions(GetGcmNoPaddingOptions(), GetHmacGenerateOptions(256));
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      SetParam(finishOptions, huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(targetKeyAlias))

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await Derive(srcKeyAlias, initOptions, finishOptions);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_RSA_SignExtend_4900
     * @tc.number Security_HUKS_RSA_SignExtend_4900
     * @tc.desc   HMAC ,no digest while ...
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_RSA_SignExtend_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_RSA_SignExtend_4900';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetHmacGenerateOptions(512), GetSha512Options());
      DeleteParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST);
      let macOptions = MergeOptions(GetHmacGenerateOptions(512), GetSha512Options());
      let macData: CipherData = BuildCipherData([64, 0]);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await Mac(srcKeyAlias, macOptions, macData);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_Cipher_AnonAttestation_0010
     * @tc.number Security_HUKS_Cipher_AnonAttestation_0010
     * @tc.desc   generateKeyItem with RSA ...
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Security_HUKS_Cipher_AnonAttestation_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_AnonAttestation_0010';
      let srcKeyAlias = testNumber;

      if (!useSoftware) {
        await CheckWifiInfo();
      }

      let genOptions = GetRsaGenerateOptions(2048);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PSS);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_KEY_GENERATE_TYPE, huks.HuksKeyGenerateType.HUKS_KEY_GENERATE_TYPE_DEFAULT);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_KEY_STORAGE_FLAG, huks.HuksKeyStorageType.HUKS_STORAGE_PERSISTENT);
      let attestOptions = GetAttestKeyOptions();

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await huks.anonAttestKeyItem(srcKeyAlias, attestOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_Cipher_AnonAttestation_0012
     * @tc.number Security_HUKS_Cipher_AnonAttestation_0012
     * @tc.desc   generateKeyItem with SM2, Callback...
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Security_HUKS_Cipher_AnonAttestation_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_AnonAttestation_0012';
      let srcKeyAlias = testNumber;

      if (!useSoftware) {
        await CheckWifiInfo();
      }

      let genOptions = GetSm2GenerateOptions(256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SM3);
      let attestOptions = GetAttestKeyOptions();

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        await huksCallback.anonAttestKeyItem(srcKeyAlias, attestOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_Cipher_AnonAttestation_0013
     * @tc.number Security_HUKS_Cipher_AnonAttestation_0013
     * @tc.desc   generateKeyItem with ECC ...
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Security_HUKS_Cipher_AnonAttestation_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_AnonAttestation_0010';
      let srcKeyAlias = testNumber;

      if (!useSoftware) {
        await CheckWifiInfo();
      }

      let genOptions = GetEccGenerateOptions(256);
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      let attestOptions = GetAttestKeyOptions();

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await huks.anonAttestKeyItem(srcKeyAlias, attestOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   Security_HUKS_Cipher_AnonAttestation_0014
     * @tc.number Security_HUKS_Cipher_AnonAttestation_0014
     * @tc.desc   generateKeyItem with AES ...
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Security_HUKS_Cipher_AnonAttestation_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_AnonAttestation_0014';
      let srcKeyAlias = testNumber;

      if (!useSoftware) {
        await CheckWifiInfo();
      }

      let genOptions = GetAesGenerateOptions(256);
      let attestOptions = GetAttestKeyOptions();

      await huks.generateKeyItem(srcKeyAlias, genOptions);

      try {
        await huks.anonAttestKeyItem(srcKeyAlias, attestOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(401);
      }
    })
  }
  )
}
