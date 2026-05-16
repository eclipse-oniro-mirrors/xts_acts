/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { afterEach, beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { huks } from '@kit.UniversalKeystoreKit';
import * as huksCallback from './utils/huks/HuksCallbackUtils';
import {
  GetAesGenerateOptions, GetEccGenerateOptions,
} from './utils/huks/GenerateKeyUtils';
import { CheckSoftware, ClearAllKeys, MergeOptions, SetParam } from './utils/huks/HuksOptionsUtils';
import { GetDataBySize, StringToUint8Array } from './utils/common/CommonUtils';
import { Logger } from './utils/common/Logger';
import { HuksMaxAliasLength } from './utils/huks/HuksCommonUtils';
import { GetAesImportData } from './utils/huks/ImportKeyUtils';
import { BuildWrappedKeyData } from './utils/huks/ImportWrappedKeyUtils';
import { CheckWifiInfo } from './utils/common/NetworkUtils';
import { GetAttestKeyOptions } from './utils/huks/AttestKeyUtils';
import { GetCbcPkcs7Options } from './utils/huks/CipherUtils';

export default function SecurityHuksApiCoverInterfaceParamCallback() {

  let useSoftware: boolean = true;

  describe('SecurityHuksApiCoverInterfaceParamCallback', () => {
    beforeAll(async () => {
      useSoftware = await CheckSoftware();
    })

    afterEach(async () => {
      await ClearAllKeys();
    })

    //huksCallback.generateKeyItem()
    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0110
     * @tc.number SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0110
     * @tc.desc   test generateKeyItem with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0110";
      let keyAlias = "a";

      let huksOptions: huks.HuksOptions = {
        properties: [
          {
            tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
            value: huks.HuksKeyAlg.HUKS_ALG_AES
          },
          {
            tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
            value: 128
          },
          {
            tag: huks.HuksTag.HUKS_TAG_PURPOSE,
            value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
          }
        ]
      };

      try {
        await huksCallback.generateKeyItem(keyAlias, huksOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0210
     * @tc.number SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0210
     * @tc.desc   test generateKeyItem with maximum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0210";
      let keyAlias: string = GetDataBySize(HuksMaxAliasLength);

      let huksOptions = GetAesGenerateOptions(128);

      try {
        await huksCallback.generateKeyItem(keyAlias, huksOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0310
     * @tc.number SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0310
     * @tc.desc   test generateKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0310";

      let huksOptions = GetAesGenerateOptions(128);

      try {
        await huksCallback.generateKeyItem("", huksOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0410
     * @tc.number SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0410
     * @tc.desc   test generateKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0410";

      let huksOptions = GetAesGenerateOptions(128);

      try {
        await huksCallback.generateKeyItem(testNumber.padEnd(HuksMaxAliasLength + 1, "a"), huksOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0510
     * @tc.number SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0510
     * @tc.desc   test generateKeyItem with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0510";

      let huksOptions = GetAesGenerateOptions(128);

      try {
        await huksCallback.generateKeyItem(null, huksOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0610
     * @tc.number SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0610
     * @tc.desc   test generateKeyItem with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0610', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0610";

      let huksOptions = GetAesGenerateOptions(128);

      try {
        await huksCallback.generateKeyItem(undefined, huksOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_5010
     * @tc.number SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_5010
     * @tc.desc   test generateKeyItem with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_5010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_5010";
      let keyAlias: string = testNumber;

      try {
        await huksCallback.generateKeyItem(keyAlias, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_5110
     * @tc.number SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_5110
     * @tc.desc   test generateKeyItem with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_5110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_5110";
      let keyAlias: string = testNumber;

      try {
        await huksCallback.generateKeyItem(keyAlias, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_5210
     * @tc.number SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_5210
     * @tc.desc   test generateKeyItem with empty properties array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_5210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_5210";
      let keyAlias: string = testNumber;

      let genOptions: huks.HuksOptions = {
        properties: []
      }

      try {
        await huksCallback.generateKeyItem(keyAlias, genOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000002);
      }
    });

    //huksCallback.deleteKeyItem()

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0110
     * @tc.number SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0110
     * @tc.desc   test deleteKeyItem with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0110";
      let keyAlias = "a";

      let genOptions = GetAesGenerateOptions(128);
      let useOptions: huks.HuksOptions = {
        properties: [
          {
            tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
            value: huks.HuksKeyAlg.HUKS_ALG_AES
          },
          {
            tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
            value: 128
          },
          {
            tag: huks.HuksTag.HUKS_TAG_PURPOSE,
            value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
          }
        ]
      };

      try {
        await huksCallback.generateKeyItem(keyAlias, genOptions);
        await huksCallback.deleteKeyItem(keyAlias, useOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0210
     * @tc.number SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0210
     * @tc.desc   test deleteKeyItem with maximum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0210";
      let keyAlias: string = GetDataBySize(HuksMaxAliasLength);

      let genOptions = GetAesGenerateOptions(128);
      let useOptions = GetAesGenerateOptions(128);

      try {
        await huksCallback.generateKeyItem(keyAlias, genOptions);
        await huksCallback.deleteKeyItem(keyAlias, useOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0310
     * @tc.number SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0310
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0310";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huksCallback.deleteKeyItem("", useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0410
     * @tc.number SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0410
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0410";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huksCallback.deleteKeyItem(testNumber.padEnd(HuksMaxAliasLength + 1, "a"), useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0510
     * @tc.number SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0510
     * @tc.desc   test deleteKeyItem with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0510";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huksCallback.deleteKeyItem(null, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0610
     * @tc.number SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0610
     * @tc.desc   test deleteKeyItem with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0610', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0610";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huksCallback.deleteKeyItem(undefined, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_5010
     * @tc.number SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_5010
     * @tc.desc   test deleteKeyItem with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_5010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_5010";
      let keyAlias: string = testNumber;

      try {
        await huksCallback.deleteKeyItem(keyAlias, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_5110
     * @tc.number SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_5110
     * @tc.desc   test deleteKeyItem with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_5110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_5110";
      let keyAlias: string = testNumber;

      try {
        await huksCallback.deleteKeyItem(keyAlias, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_5210
     * @tc.number SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_5210
     * @tc.desc   test deleteKeyItem with undefined Options parameter after generate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_5210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_5210";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let useOptions: huks.HuksOptions = {
        properties: []
      }

      await huksCallback.generateKeyItem(keyAlias, genOptions);

      try {
        await huksCallback.deleteKeyItem(keyAlias, useOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    //huksCallback.importKeyItem()
    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0110
     * @tc.number SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0110
     * @tc.desc   test generateKeyItem with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0110";
      let keyAlias = "a";

      let huksOptions: huks.HuksOptions = {
        properties: [
          {
            tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
            value: huks.HuksKeyAlg.HUKS_ALG_AES
          },
          {
            tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
            value: 128
          },
          {
            tag: huks.HuksTag.HUKS_TAG_PURPOSE,
            value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
          }
        ]
      };
      huksOptions.inData = GetAesImportData(128);

      try {
        await huksCallback.importKeyItem(keyAlias, huksOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0210
     * @tc.number SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0210
     * @tc.desc   test generateKeyItem with maximum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0210";
      let keyAlias: string = GetDataBySize(HuksMaxAliasLength);

      let huksOptions = GetAesGenerateOptions(128);
      huksOptions.inData = GetAesImportData(128);

      try {
        await huksCallback.importKeyItem(keyAlias, huksOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0310
     * @tc.number SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0310
     * @tc.desc   test generateKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0310";

      let huksOptions = GetAesGenerateOptions(128);
      huksOptions.inData = GetAesImportData(128);

      try {
        await huksCallback.importKeyItem("", huksOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0410
     * @tc.number SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0410
     * @tc.desc   test generateKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0410";

      let huksOptions = GetAesGenerateOptions(128);
      huksOptions.inData = GetAesImportData(128);

      try {
        await huksCallback.importKeyItem(testNumber.padEnd(HuksMaxAliasLength + 1, "a"), huksOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0510
     * @tc.number SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0510
     * @tc.desc   test generateKeyItem with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0510";

      let huksOptions = GetAesGenerateOptions(128);
      huksOptions.inData = GetAesImportData(128);

      try {
        await huksCallback.importKeyItem(null, huksOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0610
     * @tc.number SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0610
     * @tc.desc   test generateKeyItem with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0610', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0610";

      let huksOptions = GetAesGenerateOptions(128);
      huksOptions.inData = GetAesImportData(128);

      try {
        await huksCallback.importKeyItem(undefined, huksOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_5010
     * @tc.number SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_5010
     * @tc.desc   test generateKeyItem with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_5010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_5010";
      let keyAlias: string = testNumber;

      try {
        await huksCallback.importKeyItem(keyAlias, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_5110
     * @tc.number SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_5110
     * @tc.desc   test generateKeyItem with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_5110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_5110";
      let keyAlias: string = testNumber;

      try {
        await huksCallback.importKeyItem(keyAlias, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_5210
     * @tc.number SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_5210
     * @tc.desc   test generateKeyItem with empty properties array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_5210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_5210";
      let keyAlias: string = testNumber;

      let huksOptions: huks.HuksOptions = {
        properties: []
      }

      try {
        await huksCallback.importKeyItem(keyAlias, huksOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(undefined);
      }
    });

    //importWrappedKeyItem
    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0110
     * @tc.number SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0110
     * @tc.desc   test generateKeyItem with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0110";

      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huksCallback.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huksCallback.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOptions: huks.HuksOptions = {
        properties: [
          {
            tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
            value: huks.HuksKeyAlg.HUKS_ALG_AES
          },
          {
            tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
            value: wrappedKeySize
          },
          {
            tag: huks.HuksTag.HUKS_TAG_PURPOSE,
            value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
          },
          {
            tag: huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE,
            value: huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING
          }
        ],
        inData: wrappedKeyData
      };
      try {
        await huksCallback.importWrappedKeyItem("a", deviceAKeyPairAlias, importWrappedKeyOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0210
     * @tc.number SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0210
     * @tc.desc   test generateKeyItem with maximum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0210";

      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huksCallback.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huksCallback.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOptions = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOptions.inData = wrappedKeyData;
      try {
        await huksCallback.importWrappedKeyItem(testNumber.padEnd(HuksMaxAliasLength, "targetKey"), deviceAKeyPairAlias, importWrappedKeyOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0310
     * @tc.number SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0310
     * @tc.desc   test generateKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0310";

      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huksCallback.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huksCallback.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOptions = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOptions.inData = wrappedKeyData;
      try {
        await huksCallback.importWrappedKeyItem("", deviceAKeyPairAlias, importWrappedKeyOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0410
     * @tc.number SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0410
     * @tc.desc   test generateKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0410";

      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huksCallback.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huksCallback.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOptions = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOptions.inData = wrappedKeyData;
      try {
        await huksCallback.importWrappedKeyItem(testNumber.padEnd(HuksMaxAliasLength + 1, "a"), deviceAKeyPairAlias, importWrappedKeyOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0510
     * @tc.number SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0510
     * @tc.desc   test generateKeyItem with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0510";

      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huksCallback.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huksCallback.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOptions = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOptions.inData = wrappedKeyData;
      try {
        await huksCallback.importWrappedKeyItem(null, deviceAKeyPairAlias, importWrappedKeyOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0610
     * @tc.number SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0610
     * @tc.desc   test generateKeyItem with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0610', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0610";

      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huksCallback.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huksCallback.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOptions = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOptions.inData = wrappedKeyData;
      try {
        await huksCallback.importWrappedKeyItem(undefined, deviceAKeyPairAlias, importWrappedKeyOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1110
     * @tc.number SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1110
     * @tc.desc   test generateKeyItem with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1110";

      let deviceAKeyPairAlias: string = "a";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huksCallback.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huksCallback.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOptions = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOptions.inData = wrappedKeyData;
      try {
        await huksCallback.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1210
     * @tc.number SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1210
     * @tc.desc   test generateKeyItem with maximum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1210";

      let deviceAKeyPairAlias: string = GetDataBySize(HuksMaxAliasLength);
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huksCallback.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huksCallback.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOptions = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOptions.inData = wrappedKeyData;
      try {
        await huksCallback.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1310
     * @tc.number SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1310
     * @tc.desc   test generateKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1310";

      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huksCallback.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huksCallback.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOptions = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOptions.inData = wrappedKeyData;
      try {
        await huksCallback.importWrappedKeyItem(testNumber, "", importWrappedKeyOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1410
     * @tc.number SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1410
     * @tc.desc   test generateKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1410";

      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huksCallback.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huksCallback.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOptions = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOptions.inData = wrappedKeyData;
      try {
        await huksCallback.importWrappedKeyItem(testNumber, testNumber.padEnd(HuksMaxAliasLength + 1, "a"), importWrappedKeyOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1510
     * @tc.number SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1510
     * @tc.desc   test generateKeyItem with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1510";

      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huksCallback.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huksCallback.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOptions = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOptions.inData = wrappedKeyData;
      try {
        await huksCallback.importWrappedKeyItem(testNumber, null, importWrappedKeyOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1610
     * @tc.number SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1610
     * @tc.desc   test generateKeyItem with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1610', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1610";

      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huksCallback.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huksCallback.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOptions = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOptions.inData = wrappedKeyData;
      try {
        await huksCallback.importWrappedKeyItem(testNumber, undefined, importWrappedKeyOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_5010
     * @tc.number SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_5010
     * @tc.desc   test generateKeyItem with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_5010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_5010";

      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huksCallback.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);

      try {
        await huksCallback.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_5110
     * @tc.number SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_5110
     * @tc.desc   test generateKeyItem with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_5110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_5110";

      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huksCallback.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);

      try {
        await huksCallback.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_5210
     * @tc.number SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_5210
     * @tc.desc   test generateKeyItem with empty properties array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_5210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_5210";

      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huksCallback.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);

      let importWrappedKeyOptions: huks.HuksOptions = {
        properties: []
      }
      try {
        await huksCallback.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message == "empty error message").assertTrue();
      }
    });

    //huksCallback.exportKeyItem()

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0110
     * @tc.number SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0110
     * @tc.desc   test deleteKeyItem with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0110";
      let keyAlias = "a";

      let genOptions = GetEccGenerateOptions(256);
      let useOptions: huks.HuksOptions = {
        properties: [
          {
            tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
            value: huks.HuksKeyAlg.HUKS_ALG_ECC
          },
          {
            tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
            value: 256
          },
          {
            tag: huks.HuksTag.HUKS_TAG_PURPOSE,
            value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY
          }
        ]
      };

      try {
        await huksCallback.generateKeyItem(keyAlias, genOptions);
        let res = await huksCallback.exportKeyItem(keyAlias, useOptions);
        expect(res.outData).not().assertEqual(undefined);
        expect(res.properties).assertEqual(undefined);
        expect(res.certChains).assertEqual(undefined);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0210
     * @tc.number SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0210
     * @tc.desc   test deleteKeyItem with maximum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0210";
      let keyAlias: string = GetDataBySize(HuksMaxAliasLength);

      let genOptions = GetEccGenerateOptions(256);
      let useOptions = GetEccGenerateOptions(256);

      try {
        await huksCallback.generateKeyItem(keyAlias, genOptions);
        await huksCallback.exportKeyItem(keyAlias, useOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0310
     * @tc.number SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0310
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0310";

      let useOptions = GetEccGenerateOptions(256);

      try {
        await huksCallback.exportKeyItem("", useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0410
     * @tc.number SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0410
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0410";

      let useOptions = GetEccGenerateOptions(256);

      try {
        await huksCallback.exportKeyItem(testNumber.padEnd(HuksMaxAliasLength + 1, "a"), useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0510
     * @tc.number SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0510
     * @tc.desc   test deleteKeyItem with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0510";

      let useOptions = GetEccGenerateOptions(256);

      try {
        await huksCallback.exportKeyItem(null, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0610
     * @tc.number SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0610
     * @tc.desc   test deleteKeyItem with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0610', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0610";

      let useOptions = GetEccGenerateOptions(256);

      try {
        await huksCallback.exportKeyItem(undefined, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_5010
     * @tc.number SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_5010
     * @tc.desc   test deleteKeyItem with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_5010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_5010";
      let keyAlias: string = testNumber;

      try {
        await huksCallback.exportKeyItem(keyAlias, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_5110
     * @tc.number SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_5110
     * @tc.desc   test deleteKeyItem with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_5110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_5110";
      let keyAlias: string = testNumber;

      try {
        await huksCallback.exportKeyItem(keyAlias, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_5210
     * @tc.number SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_5210
     * @tc.desc   test deleteKeyItem with undefined Options parameter after generate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_5210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_5210";
      let keyAlias: string = testNumber;

      let genOptions = GetEccGenerateOptions(256);
      let useOptions: huks.HuksOptions = {
        properties: []
      }

      await huksCallback.generateKeyItem(keyAlias, genOptions);

      try {
        await huksCallback.exportKeyItem(keyAlias, useOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    //huksCallback.getKeyItemProperties()

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0110
     * @tc.number SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0110
     * @tc.desc   test deleteKeyItem with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0110";
      let keyAlias = "a";

      let genOptions = GetAesGenerateOptions(128);
      let useOptions: huks.HuksOptions = {
        properties: [
          {
            tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
            value: huks.HuksKeyAlg.HUKS_ALG_AES
          },
          {
            tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
            value: 128
          },
          {
            tag: huks.HuksTag.HUKS_TAG_PURPOSE,
            value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
          }
        ]
      };

      try {
        await huksCallback.generateKeyItem(keyAlias, genOptions);
        let res = await huksCallback.getKeyItemProperties(keyAlias, useOptions);
        expect(res.outData).assertEqual(undefined);
        expect(res.properties).not().assertEqual(undefined);
        expect(res.certChains).assertEqual(undefined);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0210
     * @tc.number SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0210
     * @tc.desc   test deleteKeyItem with maximum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0210";
      let keyAlias: string = GetDataBySize(HuksMaxAliasLength);

      let genOptions = GetAesGenerateOptions(128);
      let useOptions = GetAesGenerateOptions(128);

      try {
        await huksCallback.generateKeyItem(keyAlias, genOptions);
        await huksCallback.getKeyItemProperties(keyAlias, useOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0310
     * @tc.number SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0310
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0310";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huksCallback.getKeyItemProperties("", useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0410
     * @tc.number SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0410
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0410";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huksCallback.getKeyItemProperties(testNumber.padEnd(HuksMaxAliasLength + 1, "a"), useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0510
     * @tc.number SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0510
     * @tc.desc   test deleteKeyItem with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0510";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huksCallback.getKeyItemProperties(null, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0610
     * @tc.number SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0610
     * @tc.desc   test deleteKeyItem with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0610', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0610";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huksCallback.getKeyItemProperties(undefined, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_5010
     * @tc.number SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_5010
     * @tc.desc   test deleteKeyItem with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_5010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_5010";
      let keyAlias: string = testNumber;

      try {
        await huksCallback.getKeyItemProperties(keyAlias, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_5110
     * @tc.number SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_5110
     * @tc.desc   test deleteKeyItem with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_5110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_5110";
      let keyAlias: string = testNumber;

      try {
        await huksCallback.getKeyItemProperties(keyAlias, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_5210
     * @tc.number SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_5210
     * @tc.desc   test deleteKeyItem with undefined Options parameter after generate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_5210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_5210";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let useOptions: huks.HuksOptions = {
        properties: []
      }

      await huksCallback.generateKeyItem(keyAlias, genOptions);

      try {
        await huksCallback.getKeyItemProperties(keyAlias, useOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    //huksCallback.isKeyItemExist()

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0110
     * @tc.number SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0110
     * @tc.desc   test deleteKeyItem with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0110";
      let keyAlias = "a";

      let genOptions = GetAesGenerateOptions(128);
      let useOptions: huks.HuksOptions = {
        properties: [
          {
            tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
            value: huks.HuksKeyAlg.HUKS_ALG_AES
          },
          {
            tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
            value: 128
          },
          {
            tag: huks.HuksTag.HUKS_TAG_PURPOSE,
            value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
          }
        ]
      };

      try {
        await huksCallback.generateKeyItem(keyAlias, genOptions);
        let res = await huksCallback.isKeyItemExist(keyAlias, useOptions);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0210
     * @tc.number SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0210
     * @tc.desc   test deleteKeyItem with maximum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0210";
      let keyAlias: string = GetDataBySize(HuksMaxAliasLength);

      let genOptions = GetAesGenerateOptions(128);
      let useOptions = GetAesGenerateOptions(128);

      try {
        await huksCallback.generateKeyItem(keyAlias, genOptions);
        await huksCallback.isKeyItemExist(keyAlias, useOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0310
     * @tc.number SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0310
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0310";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huksCallback.isKeyItemExist("", useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0410
     * @tc.number SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0410
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0410";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huksCallback.isKeyItemExist(testNumber.padEnd(HuksMaxAliasLength + 1, "a"), useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0510
     * @tc.number SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0510
     * @tc.desc   test deleteKeyItem with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0510";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huksCallback.isKeyItemExist(null, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0610
     * @tc.number SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0610
     * @tc.desc   test deleteKeyItem with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0610', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0610";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huksCallback.isKeyItemExist(undefined, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_5010
     * @tc.number SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_5010
     * @tc.desc   test deleteKeyItem with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_5010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_5010";
      let keyAlias: string = testNumber;

      try {
        await huksCallback.isKeyItemExist(keyAlias, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_5110
     * @tc.number SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_5110
     * @tc.desc   test deleteKeyItem with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_5110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_5110";
      let keyAlias: string = testNumber;

      try {
        await huksCallback.isKeyItemExist(keyAlias, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_5210
     * @tc.number SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_5210
     * @tc.desc   test deleteKeyItem with undefined Options parameter after generate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_5210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_5210";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let useOptions: huks.HuksOptions = {
        properties: []
      }

      await huksCallback.generateKeyItem(keyAlias, genOptions);

      try {
        await huksCallback.isKeyItemExist(keyAlias, useOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    //huksCallback.hasKeyItem()

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0110
     * @tc.number SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0110
     * @tc.desc   test deleteKeyItem with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0110";
      let keyAlias = "a";

      let genOptions = GetAesGenerateOptions(128);
      let useOptions: huks.HuksOptions = {
        properties: [
          {
            tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
            value: huks.HuksKeyAlg.HUKS_ALG_AES
          },
          {
            tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
            value: 128
          },
          {
            tag: huks.HuksTag.HUKS_TAG_PURPOSE,
            value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
          }
        ]
      };

      try {
        let res = await huksCallback.hasKeyItem(keyAlias, useOptions);
        expect(res).assertEqual(false);
        await huksCallback.generateKeyItem(keyAlias, genOptions);
        res = await huksCallback.hasKeyItem(keyAlias, useOptions);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0210
     * @tc.number SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0210
     * @tc.desc   test deleteKeyItem with maximum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0210";
      let keyAlias: string = GetDataBySize(HuksMaxAliasLength);

      let genOptions = GetAesGenerateOptions(128);
      let useOptions = GetAesGenerateOptions(128);

      try {
        await huksCallback.generateKeyItem(keyAlias, genOptions);
        await huksCallback.hasKeyItem(keyAlias, useOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0310
     * @tc.number SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0310
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0310";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huksCallback.hasKeyItem("", useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0410
     * @tc.number SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0410
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0410";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huksCallback.hasKeyItem(testNumber.padEnd(HuksMaxAliasLength + 1, "a"), useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0510
     * @tc.number SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0510
     * @tc.desc   test deleteKeyItem with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0510";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huksCallback.hasKeyItem(null, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0610
     * @tc.number SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0610
     * @tc.desc   test deleteKeyItem with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0610', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0610";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huksCallback.hasKeyItem(undefined, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_5010
     * @tc.number SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_5010
     * @tc.desc   test deleteKeyItem with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_5010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_5010";
      let keyAlias: string = testNumber;

      try {
        await huksCallback.hasKeyItem(keyAlias, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_5110
     * @tc.number SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_5110
     * @tc.desc   test deleteKeyItem with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_5110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_5110";
      let keyAlias: string = testNumber;

      try {
        await huksCallback.hasKeyItem(keyAlias, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_5210
     * @tc.number SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_5210
     * @tc.desc   test deleteKeyItem with undefined Options parameter after generate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_5210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_5210";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let useOptions: huks.HuksOptions = {
        properties: []
      }

      await huksCallback.generateKeyItem(keyAlias, genOptions);

      try {
        await huksCallback.hasKeyItem(keyAlias, useOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    //huksCallback.initSession()

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_InitSession_Interface_0110
     * @tc.number SUB_Security_HUKS_ApiCover_InitSession_Interface_0110
     * @tc.desc   test deleteKeyItem with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_InitSession_Interface_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_InitSession_Interface_0110";
      let keyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let useOptions: huks.HuksOptions = {
        properties: [
          {
            tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
            value: huks.HuksKeyAlg.HUKS_ALG_AES
          },
          {
            tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
            value: 128
          },
          {
            tag: huks.HuksTag.HUKS_TAG_PURPOSE,
            value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
          },
          {
            tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
            value: huks.HuksCipherMode.HUKS_MODE_CBC
          },
          {
            tag: huks.HuksTag.HUKS_TAG_PADDING,
            value: huks.HuksKeyPadding.HUKS_PADDING_PKCS7
          },
          {
            tag: huks.HuksTag.HUKS_TAG_IV,
            value: StringToUint8Array(GetDataBySize(16))
          }
        ]
      };

      try {
        await huksCallback.generateKeyItem(keyAlias, genOptions);
        let res = await huksCallback.initSession(keyAlias, useOptions);
        expect(res.handle).assertLarger(0);
        await huksCallback.abortSession(res.handle, useOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_InitSession_Interface_0210
     * @tc.number SUB_Security_HUKS_ApiCover_InitSession_Interface_0210
     * @tc.desc   test deleteKeyItem with maximum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_InitSession_Interface_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_InitSession_Interface_0210";
      let keyAlias: string = GetDataBySize(HuksMaxAliasLength);

      let genOptions = GetAesGenerateOptions(128);
      let useOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huksCallback.generateKeyItem(keyAlias, genOptions);
        await huksCallback.initSession(keyAlias, useOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_InitSession_Interface_0310
     * @tc.number SUB_Security_HUKS_ApiCover_InitSession_Interface_0310
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_InitSession_Interface_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_InitSession_Interface_0310";

      let useOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huksCallback.initSession("", useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_InitSession_Interface_0410
     * @tc.number SUB_Security_HUKS_ApiCover_InitSession_Interface_0410
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_InitSession_Interface_0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_InitSession_Interface_0410";

      let useOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huksCallback.initSession(testNumber.padEnd(HuksMaxAliasLength + 1, "a"), useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_InitSession_Interface_0510
     * @tc.number SUB_Security_HUKS_ApiCover_InitSession_Interface_0510
     * @tc.desc   test deleteKeyItem with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_InitSession_Interface_0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_InitSession_Interface_0510";

      let useOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huksCallback.initSession(null, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_InitSession_Interface_0610
     * @tc.number SUB_Security_HUKS_ApiCover_InitSession_Interface_0610
     * @tc.desc   test deleteKeyItem with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_InitSession_Interface_0610', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_InitSession_Interface_0610";

      let useOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huksCallback.initSession(undefined, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_InitSession_Interface_5010
     * @tc.number SUB_Security_HUKS_ApiCover_InitSession_Interface_5010
     * @tc.desc   test deleteKeyItem with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_InitSession_Interface_5010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_InitSession_Interface_5010";
      let keyAlias: string = testNumber;

      try {
        await huksCallback.initSession(keyAlias, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_InitSession_Interface_5110
     * @tc.number SUB_Security_HUKS_ApiCover_InitSession_Interface_5110
     * @tc.desc   test deleteKeyItem with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_InitSession_Interface_5110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_InitSession_Interface_5110";
      let keyAlias: string = testNumber;

      try {
        await huksCallback.initSession(keyAlias, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_InitSession_Interface_5210
     * @tc.number SUB_Security_HUKS_ApiCover_InitSession_Interface_5210
     * @tc.desc   test deleteKeyItem with undefined Options parameter after generate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_InitSession_Interface_5210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_InitSession_Interface_5210";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let useOptions: huks.HuksOptions = {
        properties: []
      }

      await huksCallback.generateKeyItem(keyAlias, genOptions);

      try {
        await huksCallback.initSession(keyAlias, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    //huksCallback.updateSession()

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_UpdateSession_Interface_0110
     * @tc.number SUB_Security_HUKS_ApiCover_UpdateSession_Interface_0110
     * @tc.desc   test deleteKeyItem with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_UpdateSession_Interface_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_UpdateSession_Interface_0110";
      let keyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));
      let updateOptions: huks.HuksOptions = {
        properties: [
          {
            tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
            value: huks.HuksKeyAlg.HUKS_ALG_AES
          },
          {
            tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
            value: 128
          },
          {
            tag: huks.HuksTag.HUKS_TAG_PURPOSE,
            value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
          },
          {
            tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
            value: huks.HuksCipherMode.HUKS_MODE_CBC
          },
          {
            tag: huks.HuksTag.HUKS_TAG_PADDING,
            value: huks.HuksKeyPadding.HUKS_PADDING_PKCS7
          },
          {
            tag: huks.HuksTag.HUKS_TAG_IV,
            value: StringToUint8Array(GetDataBySize(16))
          }
        ]
      };
      updateOptions.inData = StringToUint8Array(GetDataBySize(64));
      let abortOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huksCallback.generateKeyItem(keyAlias, genOptions);
        let res = await huksCallback.initSession(keyAlias, initOptions);
        let updateRes = await huksCallback.updateSession(res.handle, updateOptions);
        expect(updateRes.outData).not().assertEqual(undefined);
        expect(updateRes.properties).assertEqual(undefined);
        expect(updateRes.certChains).assertEqual(undefined);
        await huksCallback.abortSession(res.handle, abortOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_UpdateSession_Interface_0310
     * @tc.number SUB_Security_HUKS_ApiCover_UpdateSession_Interface_0310
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_UpdateSession_Interface_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_UpdateSession_Interface_0310";

      let updateOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huksCallback.updateSession(0, updateOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000011);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_UpdateSession_Interface_0410
     * @tc.number SUB_Security_HUKS_ApiCover_UpdateSession_Interface_0410
     * @tc.desc   test deleteKeyItem with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_UpdateSession_Interface_0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_UpdateSession_Interface_0410";

      let updateOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huksCallback.updateSession(null, updateOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_UpdateSession_Interface_0510
     * @tc.number SUB_Security_HUKS_ApiCover_UpdateSession_Interface_0510
     * @tc.desc   test deleteKeyItem with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_UpdateSession_Interface_0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_UpdateSession_Interface_0510";

      let updateOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huksCallback.updateSession(undefined, updateOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_UpdateSession_Interface_5010
     * @tc.number SUB_Security_HUKS_ApiCover_UpdateSession_Interface_5010
     * @tc.desc   test deleteKeyItem with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_UpdateSession_Interface_5010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_UpdateSession_Interface_5010";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      await huksCallback.generateKeyItem(keyAlias, genOptions);

      let res = await huksCallback.initSession(keyAlias, initOptions);
      try {
        await huksCallback.updateSession(res.handle, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_UpdateSession_Interface_5110
     * @tc.number SUB_Security_HUKS_ApiCover_UpdateSession_Interface_5110
     * @tc.desc   test deleteKeyItem with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_UpdateSession_Interface_5110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_UpdateSession_Interface_5110";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      await huksCallback.generateKeyItem(keyAlias, genOptions);

      let res = await huksCallback.initSession(keyAlias, initOptions);
      try {
        await huksCallback.updateSession(res.handle, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_UpdateSession_Interface_5210
     * @tc.number SUB_Security_HUKS_ApiCover_UpdateSession_Interface_5210
     * @tc.desc   test deleteKeyItem with undefined Options parameter after generate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_UpdateSession_Interface_5210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_UpdateSession_Interface_5210";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));
      let updateOptions: huks.HuksOptions = {
        properties: []
      }

      await huksCallback.generateKeyItem(keyAlias, genOptions);

      let res = await huksCallback.initSession(keyAlias, initOptions);
      try {
        await huksCallback.updateSession(res.handle, updateOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    //huksCallback.finishSession()

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_FinishSession_Interface_0110
     * @tc.number SUB_Security_HUKS_ApiCover_FinishSession_Interface_0110
     * @tc.desc   test deleteKeyItem with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_FinishSession_Interface_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_FinishSession_Interface_0110";
      let keyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));
      let finishOptions: huks.HuksOptions = {
        properties: [
          {
            tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
            value: huks.HuksKeyAlg.HUKS_ALG_AES
          },
          {
            tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
            value: 128
          },
          {
            tag: huks.HuksTag.HUKS_TAG_PURPOSE,
            value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
          },
          {
            tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
            value: huks.HuksCipherMode.HUKS_MODE_CBC
          },
          {
            tag: huks.HuksTag.HUKS_TAG_PADDING,
            value: huks.HuksKeyPadding.HUKS_PADDING_PKCS7
          },
          {
            tag: huks.HuksTag.HUKS_TAG_IV,
            value: StringToUint8Array(GetDataBySize(16))
          }
        ]
      };
      finishOptions.inData = StringToUint8Array(GetDataBySize(64));

      try {
        await huksCallback.generateKeyItem(keyAlias, genOptions);
        let res = await huksCallback.initSession(keyAlias, initOptions);
        let finishRes = await huksCallback.finishSession(res.handle, finishOptions);
        expect(finishRes.outData).not().assertEqual(undefined);
        expect(finishRes.properties).assertEqual(undefined);
        expect(finishRes.certChains).assertEqual(undefined);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_FinishSession_Interface_0310
     * @tc.number SUB_Security_HUKS_ApiCover_FinishSession_Interface_0310
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_FinishSession_Interface_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_FinishSession_Interface_0310";

      let finishOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huksCallback.finishSession(0, finishOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000011);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_FinishSession_Interface_0410
     * @tc.number SUB_Security_HUKS_ApiCover_FinishSession_Interface_0410
     * @tc.desc   test deleteKeyItem with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_FinishSession_Interface_0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_FinishSession_Interface_0410";

      let finishOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huksCallback.finishSession(null, finishOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_FinishSession_Interface_0510
     * @tc.number SUB_Security_HUKS_ApiCover_FinishSession_Interface_0510
     * @tc.desc   test deleteKeyItem with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_FinishSession_Interface_0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_FinishSession_Interface_0510";

      let finishOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huksCallback.finishSession(undefined, finishOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_FinishSession_Interface_5010
     * @tc.number SUB_Security_HUKS_ApiCover_FinishSession_Interface_5010
     * @tc.desc   test deleteKeyItem with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_FinishSession_Interface_5010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_FinishSession_Interface_5010";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      await huksCallback.generateKeyItem(keyAlias, genOptions);

      let res = await huksCallback.initSession(keyAlias, initOptions);
      try {
        await huksCallback.finishSession(res.handle, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_FinishSession_Interface_5110
     * @tc.number SUB_Security_HUKS_ApiCover_FinishSession_Interface_5110
     * @tc.desc   test deleteKeyItem with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_FinishSession_Interface_5110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_FinishSession_Interface_5110";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      await huksCallback.generateKeyItem(keyAlias, genOptions);

      let res = await huksCallback.initSession(keyAlias, initOptions);
      try {
        await huksCallback.finishSession(res.handle, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_FinishSession_Interface_5210
     * @tc.number SUB_Security_HUKS_ApiCover_FinishSession_Interface_5210
     * @tc.desc   test deleteKeyItem with undefined Options parameter after generate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_FinishSession_Interface_5210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_FinishSession_Interface_5210";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));
      let finishOptions: huks.HuksOptions = {
        properties: []
      }

      await huksCallback.generateKeyItem(keyAlias, genOptions);

      let res = await huksCallback.initSession(keyAlias, initOptions);
      try {
        await huksCallback.finishSession(res.handle, finishOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    //huksCallback.abortSession()

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_AbortSession_Interface_0110
     * @tc.number SUB_Security_HUKS_ApiCover_AbortSession_Interface_0110
     * @tc.desc   test deleteKeyItem with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_AbortSession_Interface_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_AbortSession_Interface_0110";
      let keyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));
      let abortOptions: huks.HuksOptions = {
        properties: [
          {
            tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
            value: huks.HuksKeyAlg.HUKS_ALG_AES
          },
          {
            tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
            value: 128
          },
          {
            tag: huks.HuksTag.HUKS_TAG_PURPOSE,
            value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
          },
          {
            tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
            value: huks.HuksCipherMode.HUKS_MODE_CBC
          },
          {
            tag: huks.HuksTag.HUKS_TAG_PADDING,
            value: huks.HuksKeyPadding.HUKS_PADDING_PKCS7
          },
          {
            tag: huks.HuksTag.HUKS_TAG_IV,
            value: StringToUint8Array(GetDataBySize(16))
          }
        ]
      };

      try {
        await huksCallback.generateKeyItem(keyAlias, genOptions);
        let res = await huksCallback.initSession(keyAlias, initOptions);
        await huksCallback.abortSession(res.handle, abortOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_AbortSession_Interface_0310
     * @tc.number SUB_Security_HUKS_ApiCover_AbortSession_Interface_0310
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_AbortSession_Interface_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_AbortSession_Interface_0310";

      let abortOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huksCallback.abortSession(0, abortOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_AbortSession_Interface_0410
     * @tc.number SUB_Security_HUKS_ApiCover_AbortSession_Interface_0410
     * @tc.desc   test deleteKeyItem with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_AbortSession_Interface_0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_AbortSession_Interface_0410";

      let abortOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huksCallback.abortSession(null, abortOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_AbortSession_Interface_0510
     * @tc.number SUB_Security_HUKS_ApiCover_AbortSession_Interface_0510
     * @tc.desc   test deleteKeyItem with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_AbortSession_Interface_0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_AbortSession_Interface_0510";

      let abortOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huksCallback.abortSession(undefined, abortOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_AbortSession_Interface_5010
     * @tc.number SUB_Security_HUKS_ApiCover_AbortSession_Interface_5010
     * @tc.desc   test deleteKeyItem with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_AbortSession_Interface_5010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_AbortSession_Interface_5010";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      await huksCallback.generateKeyItem(keyAlias, genOptions);

      let res = await huksCallback.initSession(keyAlias, initOptions);
      try {
        await huksCallback.abortSession(res.handle, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_AbortSession_Interface_5110
     * @tc.number SUB_Security_HUKS_ApiCover_AbortSession_Interface_5110
     * @tc.desc   test deleteKeyItem with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_AbortSession_Interface_5110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_AbortSession_Interface_5110";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      await huksCallback.generateKeyItem(keyAlias, genOptions);

      let res = await huksCallback.initSession(keyAlias, initOptions);
      try {
        await huksCallback.abortSession(res.handle, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_AbortSession_Interface_5210
     * @tc.number SUB_Security_HUKS_ApiCover_AbortSession_Interface_5210
     * @tc.desc   test deleteKeyItem with undefined Options parameter after generate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_AbortSession_Interface_5210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_AbortSession_Interface_5210";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));
      let abortOptions: huks.HuksOptions = {
        properties: []
      }

      await huksCallback.generateKeyItem(keyAlias, genOptions);

      let res = await huksCallback.initSession(keyAlias, initOptions);
      try {
        await huksCallback.abortSession(res.handle, abortOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    //huksCallback.anonAttestKeyItem()

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0110
     * @tc.number SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0110
     * @tc.desc   test deleteKeyItem with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      if (!useSoftware) {
        await CheckWifiInfo();
      }
      let testNumber = "SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0110";
      let keyAlias = "a";

      let genOptions = GetEccGenerateOptions(256);
      let useOptions: huks.HuksOptions = {
        properties: [
          {
            tag: huks.HuksTag.HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO,
            value: StringToUint8Array("sec_level")
          },
          {
            tag: huks.HuksTag.HUKS_TAG_ATTESTATION_CHALLENGE,
            value: StringToUint8Array("challenge_data")
          },
          {
            tag: huks.HuksTag.HUKS_TAG_ATTESTATION_ID_VERSION_INFO,
            value: StringToUint8Array("version_info")
          },
          {
            tag: huks.HuksTag.HUKS_TAG_ATTESTATION_ID_ALIAS,
            value: StringToUint8Array("keyAlias")
          }
        ]
      };

      try {
        await huksCallback.generateKeyItem(keyAlias, genOptions);
        let res = await huksCallback.anonAttestKeyItem(keyAlias, useOptions);
        expect(res.outData).assertEqual(undefined);
        expect(res.properties).assertEqual(undefined);
        expect(res.certChains).not().assertEqual(undefined);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0210
     * @tc.number SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0210
     * @tc.desc   test deleteKeyItem with maximum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      if (!useSoftware) {
        await CheckWifiInfo();
      }
      let testNumber = "SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0210";
      let keyAlias: string = GetDataBySize(HuksMaxAliasLength);

      let genOptions = GetEccGenerateOptions(256);
      let useOptions = GetAttestKeyOptions();

      try {
        await huksCallback.generateKeyItem(keyAlias, genOptions);
        await huksCallback.anonAttestKeyItem(keyAlias, useOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0310
     * @tc.number SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0310
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0310";

      let useOptions = GetAttestKeyOptions();

      try {
        await huksCallback.anonAttestKeyItem("", useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0410
     * @tc.number SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0410
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0410";

      let useOptions = GetAttestKeyOptions();

      try {
        await huksCallback.anonAttestKeyItem(testNumber.padEnd(HuksMaxAliasLength + 1, "a"), useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0510
     * @tc.number SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0510
     * @tc.desc   test deleteKeyItem with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0510";

      let useOptions = GetAttestKeyOptions();

      try {
        await huksCallback.anonAttestKeyItem(null, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0610
     * @tc.number SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0610
     * @tc.desc   test deleteKeyItem with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0610', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0610";

      let useOptions = GetAttestKeyOptions();

      try {
        await huksCallback.anonAttestKeyItem(undefined, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_5010
     * @tc.number SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_5010
     * @tc.desc   test deleteKeyItem with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_5010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_5010";
      let keyAlias: string = testNumber;

      try {
        await huksCallback.anonAttestKeyItem(keyAlias, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_5110
     * @tc.number SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_5110
     * @tc.desc   test deleteKeyItem with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_5110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_5110";
      let keyAlias: string = testNumber;

      try {
        await huksCallback.anonAttestKeyItem(keyAlias, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_5210
     * @tc.number SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_5210
     * @tc.desc   test deleteKeyItem with undefined Options parameter after generate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_5210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_5210";
      let keyAlias: string = testNumber;

      let genOptions = GetEccGenerateOptions(256);
      let useOptions: huks.HuksOptions = {
        properties: []
      }

      await huksCallback.generateKeyItem(keyAlias, genOptions);

      try {
        await huksCallback.anonAttestKeyItem(keyAlias, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

  });
}