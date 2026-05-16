/*software
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
import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium";
import huks from "@ohos.security.huks";

import { Logger } from "./utils/common/Logger";
import { GetChallengeNoneOptions, GetChallengeNormalOptions, GetClearPasswordOptions, GetPinOptions } from "./utils/huks/AccessControlUtils";
import { GetAttestKeyOptions } from "./utils/huks/AttestKeyUtils";
import { GetCbcNoPaddingOptions } from "./utils/huks/CipherUtils";
import { GetAesGenerateOptions, GetEccGenerateOptions } from "./utils/huks/GenerateKeyUtils";
import { MergeOptions, SetParam } from "./utils/huks/HuksOptionsUtils";


export default function SecurityHuksFaceFinger() {
  describe("SecurityHuksFaceFinger", () => {
    /**
     * @tc.name   HUKS_Cipher_AuthToken_2900
     * @tc.number HUKS_Cipher_AuthToken_2900
     * @tc.desc   HUKS_TAG_USER_AUTH_TYPE invalid and generate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("HUKS_Cipher_AuthToken_2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = "HUKS_Cipher_AuthToken_2900";
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetCbcNoPaddingOptions(16), GetAesGenerateOptions(128));
      MergeOptions(genOptions, GetClearPasswordOptions(), GetPinOptions(), GetChallengeNormalOptions());
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_CHALLENGE_POS, 0);

      SetParam(genOptions, huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE, -1);
      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   HUKS_Cipher_AuthToken_3000
     * @tc.number HUKS_Cipher_AuthToken_3000
     * @tc.desc   HUKS_TAG_KEY_AUTH_ACCESS_TYPE invalid and generate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("HUKS_Cipher_AuthToken_3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = "HUKS_Cipher_AuthToken_3000";
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetCbcNoPaddingOptions(16), GetAesGenerateOptions(128));
      MergeOptions(genOptions, GetClearPasswordOptions(), GetPinOptions(), GetChallengeNormalOptions());
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_CHALLENGE_POS, 0);

      SetParam(genOptions, huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE, -1);
      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   HUKS_Cipher_AuthToken_3100
     * @tc.number HUKS_Cipher_AuthToken_3100
     * @tc.desc   HUKS_TAG_CHALLENGE_TYPE invalid and generate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("HUKS_Cipher_AuthToken_3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = "HUKS_Cipher_AuthToken_3100";
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetCbcNoPaddingOptions(16), GetAesGenerateOptions(128));
      MergeOptions(genOptions, GetClearPasswordOptions(), GetPinOptions(), GetChallengeNormalOptions());
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_CHALLENGE_POS, 0);

      SetParam(genOptions, huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE, -1);
      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   HUKS_Cipher_AuthToken_3200
     * @tc.number HUKS_Cipher_AuthToken_3200
     * @tc.desc   HUKS_TAG_CHALLENGE_POS invalid and generate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("HUKS_Cipher_AuthToken_3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = "HUKS_Cipher_AuthToken_3200";
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetCbcNoPaddingOptions(16), GetAesGenerateOptions(128));
      MergeOptions(genOptions, GetClearPasswordOptions(), GetPinOptions(), GetChallengeNormalOptions());
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_CHALLENGE_POS, 0);

      SetParam(genOptions, huks.HuksTag.HUKS_TAG_CHALLENGE_POS, -1);
      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000013);
      }
    });

    /**
     * @tc.name   HUKS_Cipher_AuthToken_3300
     * @tc.number HUKS_Cipher_AuthToken_3300
     * @tc.desc   HUKS_TAG_AUTH_TIMEOUT invalid and generate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("HUKS_Cipher_AuthToken_3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = "HUKS_Cipher_AuthToken_3300";
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetCbcNoPaddingOptions(16), GetAesGenerateOptions(128));
      MergeOptions(genOptions, GetClearPasswordOptions(), GetPinOptions(), GetChallengeNoneOptions(10));

      SetParam(genOptions, huks.HuksTag.HUKS_TAG_AUTH_TIMEOUT, -1);
      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   HUKS_Cipher_AuthToken_5500
     * @tc.number HUKS_Cipher_AuthToken_5500
     * @tc.desc   use pin access type is HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("HUKS_Cipher_AuthToken_5500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = "HUKS_Cipher_AuthToken_5500";
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetCbcNoPaddingOptions(16), GetAesGenerateOptions(128));
      MergeOptions(genOptions, GetClearPasswordOptions(), GetPinOptions(), GetChallengeNormalOptions());
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_CHALLENGE_POS, 0);

      SetParam(genOptions, huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE, huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL);
      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   HUKS_Cipher_Attestation_0300
     * @tc.number HUKS_Cipher_Attestation_0300
     * @tc.desc   attest key support.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("HUKS_Cipher_Attestation_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = "HUKS_Cipher_Attestation_0300";
      let srcKeyAlias = testNumber;

      let genOptions = GetEccGenerateOptions(256);
      let attestOptions = GetAttestKeyOptions();

      await huks.generateKeyItem(srcKeyAlias, genOptions);

      try {
        await huks.attestKeyItem(srcKeyAlias, attestOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(201);
      }
    });
  });
}
