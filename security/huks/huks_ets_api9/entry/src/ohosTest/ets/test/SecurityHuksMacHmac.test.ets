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

import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium";
import huks from "@ohos.security.huks";
import * as huksCallback from './utils/huks/HuksCallbackUtils';

import { GetHmacGenerateOptions } from "./utils/huks/GenerateKeyUtils";
import {
  GetSha256Options,
  GetSha384Options,
  GetSha512Options,
  GetSm3Options,
  Mac,
  MacCallback,
  MacCallbackEndWithAbort,
  MacEndWithAbort
} from "./utils/huks/DeriveAgreeUtils";
import { MergeOptions } from "./utils/huks/HuksOptionsUtils";
import { BuildCipherData, CipherData } from "./utils/huks/CipherUtils";
import { Logger } from "./utils/common/Logger";

export default function SecurityHuksMacHmac() {
  describe("SecurityHuksMacHmac", () => {
    /**
     * @tc.name   testReformedHmacSHA256001
     * @tc.number testReformedHmacSHA256001
     * @tc.desc   testReformedHmacSHA256001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testReformedHmacSHA256001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testReformedHmacSHA256001';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetHmacGenerateOptions(512), GetSha256Options());
      let macOptions = MergeOptions(GetHmacGenerateOptions(512), GetSha256Options());
      let macData: CipherData = BuildCipherData([63 * 1024, 0]);

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        await MacCallback(srcKeyAlias, macOptions, macData);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testReformedHmacSHA256002
     * @tc.number testReformedHmacSHA256002
     * @tc.desc   testReformedHmacSHA256002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testReformedHmacSHA256002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testReformedHmacSHA256002';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetHmacGenerateOptions(512), GetSha256Options());
      let macOptions = MergeOptions(GetHmacGenerateOptions(512), GetSha256Options());
      let macData: CipherData = BuildCipherData([63 * 1024, 0]);

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        await MacCallbackEndWithAbort(srcKeyAlias, macOptions, macData);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   testReformedHmacSHA256003
     * @tc.number testReformedHmacSHA256003
     * @tc.desc   testReformedHmacSHA256003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testReformedHmacSHA256003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testReformedHmacSHA256003';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetHmacGenerateOptions(512), GetSha256Options());
      let macOptions = MergeOptions(GetHmacGenerateOptions(512), GetSha256Options());
      let macData: CipherData = BuildCipherData([64 * 1024, 1 * 1024, 0]);

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        await MacCallback(srcKeyAlias, macOptions, macData);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   testReformedHmacSHA256004
     * @tc.number testReformedHmacSHA256004
     * @tc.desc   testReformedHmacSHA256004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testReformedHmacSHA256004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testReformedHmacSHA256004';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetHmacGenerateOptions(512), GetSha256Options());
      let macOptions = MergeOptions(GetHmacGenerateOptions(512), GetSha256Options());
      let macData: CipherData = BuildCipherData([64 * 1024, 1 * 1024, 0]);

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        await MacCallbackEndWithAbort(srcKeyAlias, macOptions, macData);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   Security_HUKS_Hmac_API9_SM3_001
     * @tc.number Security_HUKS_Hmac_API9_SM3_001
     * @tc.desc   Security_HUKS_Hmac_API9_SM3_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Hmac_API9_SM3_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Hmac_API9_SM3_001';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetHmacGenerateOptions(512), GetSm3Options());
      let macOptions = MergeOptions(GetHmacGenerateOptions(512), GetSm3Options());
      let macData: CipherData = BuildCipherData([63 * 1024, 0]);

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        await MacCallback(srcKeyAlias, macOptions, macData);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Hmac_API9_SM3_002
     * @tc.number Security_HUKS_Hmac_API9_SM3_002
     * @tc.desc   Security_HUKS_Hmac_API9_SM3_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Hmac_API9_SM3_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Hmac_API9_SM3_002';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetHmacGenerateOptions(512), GetSm3Options());
      let macOptions = MergeOptions(GetHmacGenerateOptions(512), GetSm3Options());
      let macData: CipherData = BuildCipherData([63 * 1024, 0]);

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        await MacCallbackEndWithAbort(srcKeyAlias, macOptions, macData);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   Security_HUKS_Hmac_API9_SM3_003
     * @tc.number Security_HUKS_Hmac_API9_SM3_003
     * @tc.desc   Security_HUKS_Hmac_API9_SM3_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Hmac_API9_SM3_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Hmac_API9_SM3_003';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetHmacGenerateOptions(512), GetSm3Options());
      let macOptions = MergeOptions(GetHmacGenerateOptions(512), GetSm3Options());
      let macData: CipherData = BuildCipherData([64 * 1024, 1 * 1024, 0]);

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        await MacCallback(srcKeyAlias, macOptions, macData);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   Security_HUKS_Hmac_API9_SM3_004
     * @tc.number Security_HUKS_Hmac_API9_SM3_004
     * @tc.desc   Security_HUKS_Hmac_API9_SM3_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Hmac_API9_SM3_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Hmac_API9_SM3_004';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetHmacGenerateOptions(512), GetSm3Options());
      let macOptions = MergeOptions(GetHmacGenerateOptions(512), GetSm3Options());
      let macData: CipherData = BuildCipherData([64 * 1024, 1 * 1024, 0]);

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        await MacCallbackEndWithAbort(srcKeyAlias, macOptions, macData);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Hmac_API9_101
     * @tc.number Security_HUKS_Hmac_API9_101
     * @tc.desc   Security_HUKS_Hmac_API9_101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Security_HUKS_Hmac_API9_101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = "Security_HUKS_Hmac_API9_101";
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetHmacGenerateOptions(512), GetSha256Options());
      let macOptions = MergeOptions(GetHmacGenerateOptions(512), GetSha256Options());
      let macData: CipherData = BuildCipherData([63 * 1024, 0]);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await Mac(srcKeyAlias, macOptions, macData);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Hmac_API9_102
     * @tc.number Security_HUKS_Hmac_API9_102
     * @tc.desc   Security_HUKS_Hmac_API9_102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Security_HUKS_Hmac_API9_102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = "Security_HUKS_Hmac_API9_102";
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetHmacGenerateOptions(512), GetSha256Options());
      let macOptions = MergeOptions(GetHmacGenerateOptions(512), GetSha256Options());
      let macData: CipherData = BuildCipherData([63 * 1024, 0]);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await MacEndWithAbort(srcKeyAlias, macOptions, macData);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Hmac_API9_103
     * @tc.number Security_HUKS_Hmac_API9_103
     * @tc.desc   Security_HUKS_Hmac_API9_103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Security_HUKS_Hmac_API9_103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = "Security_HUKS_Hmac_API9_103";
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetHmacGenerateOptions(512), GetSha256Options());
      let macOptions = MergeOptions(GetHmacGenerateOptions(512), GetSha256Options());
      let macData: CipherData = BuildCipherData([64 * 1024, 1 * 1024, 0]);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await Mac(srcKeyAlias, macOptions, macData);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Hmac_API9_104
     * @tc.number Security_HUKS_Hmac_API9_104
     * @tc.desc   Security_HUKS_Hmac_API9_104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Security_HUKS_Hmac_API9_104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = "Security_HUKS_Hmac_API9_104";
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetHmacGenerateOptions(512), GetSha256Options());
      let macOptions = MergeOptions(GetHmacGenerateOptions(512), GetSha256Options());
      let macData: CipherData = BuildCipherData([64 * 1024, 1 * 1024, 0]);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await MacEndWithAbort(srcKeyAlias, macOptions, macData);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   testReformedHmacSHA384103
     * @tc.number testReformedHmacSHA384103
     * @tc.desc   testReformedHmacSHA384103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testReformedHmacSHA384103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testReformedHmacSHA384103';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetHmacGenerateOptions(512), GetSha384Options());
      let macOptions = MergeOptions(GetHmacGenerateOptions(512), GetSha384Options());
      let macData: CipherData = BuildCipherData([64 * 1024, 1 * 1024, 0]);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await Mac(srcKeyAlias, macOptions, macData);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   testReformedHmacSHA512103
     * @tc.number testReformedHmacSHA512103
     * @tc.desc   testReformedHmacSHA512103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testReformedHmacSHA512103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testReformedHmacSHA512103';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetHmacGenerateOptions(512), GetSha512Options());
      let macOptions = MergeOptions(GetHmacGenerateOptions(512), GetSha512Options());
      let macData: CipherData = BuildCipherData([64 * 1024, 1 * 1024, 0]);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await MacEndWithAbort(srcKeyAlias, macOptions, macData);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   Security_HUKS_Hmac_API9_SM3_101
     * @tc.number Security_HUKS_Hmac_API9_SM3_101
     * @tc.desc   Security_HUKS_Hmac_API9_SM3_101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Hmac_API9_SM3_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Hmac_API9_SM3_101';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetHmacGenerateOptions(512), GetSm3Options());
      let macOptions = MergeOptions(GetHmacGenerateOptions(512), GetSm3Options());
      let macData: CipherData = BuildCipherData([63 * 1024, 0]);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await Mac(srcKeyAlias, macOptions, macData);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Hmac_API9_SM3_102
     * @tc.number Security_HUKS_Hmac_API9_SM3_102
     * @tc.desc   Security_HUKS_Hmac_API9_SM3_102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Hmac_API9_SM3_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Hmac_API9_SM3_102';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetHmacGenerateOptions(512), GetSm3Options());
      let macOptions = MergeOptions(GetHmacGenerateOptions(512), GetSm3Options());
      let macData: CipherData = BuildCipherData([63 * 1024, 0]);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await MacEndWithAbort(srcKeyAlias, macOptions, macData);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Hmac_API9_SM3_103
     * @tc.number Security_HUKS_Hmac_API9_SM3_103
     * @tc.desc   Security_HUKS_Hmac_API9_SM3_103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Hmac_API9_SM3_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Hmac_API9_SM3_103';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetHmacGenerateOptions(512), GetSm3Options());
      let macOptions = MergeOptions(GetHmacGenerateOptions(512), GetSm3Options());
      let macData: CipherData = BuildCipherData([64 * 1024, 1 * 1024, 0]);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await Mac(srcKeyAlias, macOptions, macData);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Hmac_API9_SM3_104
     * @tc.number Security_HUKS_Hmac_API9_SM3_104
     * @tc.desc   Security_HUKS_Hmac_API9_SM3_104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Hmac_API9_SM3_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Hmac_API9_SM3_104';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetHmacGenerateOptions(512), GetSm3Options());
      let macOptions = MergeOptions(GetHmacGenerateOptions(512), GetSm3Options());
      let macData: CipherData = BuildCipherData([64 * 1024, 1 * 1024, 0]);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        await MacEndWithAbort(srcKeyAlias, macOptions, macData);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
  });
}
