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

import { describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import { huks } from '@kit.UniversalKeystoreKit';

import { StringToUint8Array } from "./utils/common/CommonUtils";
import { GetAesGenerateOptions, GetX25519GenerateOptions } from './utils/huks/GenerateKeyUtils';
import { MergeOptions, SetInData, SetParam } from './utils/huks/HuksOptionsUtils';
import { GetCbcNoPaddingOptions, CipherData, BuildCipherData, DoCipher, CompareCipherData, GetEcbNoPaddingOptions } from './utils/huks/CipherUtils';
import { Agree } from './utils/huks/DeriveAgreeUtils';
import { Logger } from './utils/common/Logger';

let genOptions = GetX25519GenerateOptions(256);

export default function SecurityHuksAgreeX25519() {
  describe('SecurityHuksAgreeX25519', () => {
    /**
     * @tc.name   Security_HUKS_Agree_API9_X25519_101
     * @tc.number Security_HUKS_Agree_API9_X25519_101
     * @tc.desc   Security_HUKS_Agree_API9_X25519_101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Agree_API9_X25519_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "Security_HUKS_Agree_API9_X25519_101";
      let srcKeyAlias1 = testNumber + "01";
      let srcKeyAlias2 = testNumber + "02";
      let targetKeyAlias1 = srcKeyAlias1 + "final";
      let targetKeyAlias2 = srcKeyAlias2 + "final";

      let initOptions = GetX25519GenerateOptions(256);
      SetParam(initOptions, huks.HuksTag.HUKS_TAG_KEY_SIZE, 256);
      let finishOptions = MergeOptions(GetCbcNoPaddingOptions(16), GetAesGenerateOptions(256));
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

        let cipherData: CipherData = BuildCipherData([64]);
        let cipherOptions: huks.HuksOptions = MergeOptions(GetCbcNoPaddingOptions(16), GetAesGenerateOptions(256))
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        let encryptResult: CipherData = await DoCipher(targetKeyAlias1, cipherOptions, cipherData);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        let decryptResult: CipherData = await DoCipher(targetKeyAlias2, cipherOptions, encryptResult);

        await huks.deleteKeyItem(srcKeyAlias1, genOptions);
        await huks.deleteKeyItem(srcKeyAlias2, genOptions);

        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    //abort
    /**
     * @tc.name   Security_HUKS_Agree_API9_X25519_102
     * @tc.number Security_HUKS_Agree_API9_X25519_102
     * @tc.desc   Security_HUKS_Agree_API9_X25519_102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Agree_API9_X25519_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "Security_HUKS_Agree_API9_X25519_101";
      let srcKeyAlias1 = testNumber + "01";
      let srcKeyAlias2 = testNumber + "02";
      let targetKeyAlias1 = srcKeyAlias1 + "final";
      let targetKeyAlias2 = srcKeyAlias2 + "final";

      let initOptions = GetX25519GenerateOptions(256);
      SetParam(initOptions, huks.HuksTag.HUKS_TAG_KEY_SIZE, 256);
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
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
  });
}
