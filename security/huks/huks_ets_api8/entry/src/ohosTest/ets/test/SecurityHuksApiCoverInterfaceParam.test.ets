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
import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { huks } from '@kit.UniversalKeystoreKit';
import {
  GetAesGenerateOptions, GetEccGenerateOptions,
} from './utils/huks/GenerateKeyUtils';
import { ClearAllKeys, MergeOptions } from './utils/huks/HuksOptionsUtils';
import { GetDataBySize, StringToUint8Array } from './utils/common/CommonUtils';
import { Logger } from './utils/common/Logger';
import { HuksMaxAliasLength } from './utils/huks/HuksCommonUtils';
import { GetAesImportData } from './utils/huks/ImportKeyUtils';
import { GetCbcPkcs7Options } from './utils/huks/CipherUtils';

export default function SecurityHuksApiCoverInterfaceParam() {

  describe('SecurityHuksApiCoverInterfaceParam', () => {

    afterEach(async () => {
      await ClearAllKeys();
    })

    //huks.generateKey()
    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GenerateKey_Interface_0100
     * @tc.number SUB_Security_HUKS_ApiCover_GenerateKey_Interface_0100
     * @tc.desc   test generateKey with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GenerateKey_Interface_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GenerateKey_Interface_0100";
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
        let res = await huks.generateKey(keyAlias, huksOptions);
        expect(res.errorCode).assertEqual(0);
        expect(res.outData).assertEqual(null);
        expect(res.properties).assertEqual(null);
        expect(res.certChains).assertEqual(undefined);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GenerateKey_Interface_0200
     * @tc.number SUB_Security_HUKS_ApiCover_GenerateKey_Interface_0200
     * @tc.desc   test generateKey with maximum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GenerateKey_Interface_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GenerateKey_Interface_0200";
      let keyAlias: string = GetDataBySize(HuksMaxAliasLength);

      let huksOptions = GetAesGenerateOptions(128);

      try {
        let res = await huks.generateKey(keyAlias, huksOptions);
        expect(res.errorCode).assertEqual(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GenerateKey_Interface_0300
     * @tc.number SUB_Security_HUKS_ApiCover_GenerateKey_Interface_0300
     * @tc.desc   test generateKey with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GenerateKey_Interface_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GenerateKey_Interface_0300";

      let huksOptions = GetAesGenerateOptions(128);

      try {
        let res = await huks.generateKey("", huksOptions);
        expect(res.errorCode).assertEqual(-3);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GenerateKey_Interface_0400
     * @tc.number SUB_Security_HUKS_ApiCover_GenerateKey_Interface_0400
     * @tc.desc   test generateKey with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GenerateKey_Interface_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GenerateKey_Interface_0400";

      let huksOptions = GetAesGenerateOptions(128);

      try {
        let res = await huks.generateKey(testNumber.padEnd(HuksMaxAliasLength + 1, "a"), huksOptions);
        expect(res.errorCode).assertEqual(-3);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GenerateKey_Interface_0500
     * @tc.number SUB_Security_HUKS_ApiCover_GenerateKey_Interface_0500
     * @tc.desc   test generateKey with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GenerateKey_Interface_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GenerateKey_Interface_0500";

      let huksOptions = GetAesGenerateOptions(128);

      try {
        let res = await huks.generateKey(null, huksOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GenerateKey_Interface_0600
     * @tc.number SUB_Security_HUKS_ApiCover_GenerateKey_Interface_0600
     * @tc.desc   test generateKey with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GenerateKey_Interface_0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GenerateKey_Interface_0600";

      let huksOptions = GetAesGenerateOptions(128);

      try {
        let res = await huks.generateKey(undefined, huksOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GenerateKey_Interface_5000
     * @tc.number SUB_Security_HUKS_ApiCover_GenerateKey_Interface_5000
     * @tc.desc   test generateKey with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GenerateKey_Interface_5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GenerateKey_Interface_5000";
      let keyAlias: string = testNumber;

      try {
        let res = await huks.generateKey(keyAlias, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GenerateKey_Interface_5100
     * @tc.number SUB_Security_HUKS_ApiCover_GenerateKey_Interface_5100
     * @tc.desc   test generateKey with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GenerateKey_Interface_5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GenerateKey_Interface_5100";
      let keyAlias: string = testNumber;

      try {
        let res = await huks.generateKey(keyAlias, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GenerateKey_Interface_5200
     * @tc.number SUB_Security_HUKS_ApiCover_GenerateKey_Interface_5200
     * @tc.desc   test generateKey with empty properties array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GenerateKey_Interface_5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GenerateKey_Interface_5200";
      let keyAlias: string = testNumber;

      let genOptions: huks.HuksOptions = {
        properties: []
      }

      try {
        let res = await huks.generateKey(keyAlias, genOptions);
        expect(res.errorCode).assertEqual(-100);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    //huks.deleteKey()

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_DeleteKey_Interface_0100
     * @tc.number SUB_Security_HUKS_ApiCover_DeleteKey_Interface_0100
     * @tc.desc   test deleteKey with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_DeleteKey_Interface_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_DeleteKey_Interface_0100";
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
        await huks.generateKey(keyAlias, genOptions);
        let res = await huks.deleteKey(keyAlias, useOptions);
        expect(res.errorCode).assertEqual(0);
        expect(res.outData).assertEqual(null);
        expect(res.properties).assertEqual(null);
        expect(res.certChains).assertEqual(undefined);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_DeleteKey_Interface_0200
     * @tc.number SUB_Security_HUKS_ApiCover_DeleteKey_Interface_0200
     * @tc.desc   test deleteKey with maximum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_DeleteKey_Interface_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_DeleteKey_Interface_0200";
      let keyAlias: string = GetDataBySize(HuksMaxAliasLength);

      let genOptions = GetAesGenerateOptions(128);
      let useOptions = GetAesGenerateOptions(128);

      try {
        await huks.generateKey(keyAlias, genOptions);
        let res = await huks.deleteKey(keyAlias, useOptions);
        expect(res.errorCode).assertEqual(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_DeleteKey_Interface_0300
     * @tc.number SUB_Security_HUKS_ApiCover_DeleteKey_Interface_0300
     * @tc.desc   test deleteKey with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_DeleteKey_Interface_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_DeleteKey_Interface_0300";

      let useOptions = GetAesGenerateOptions(128);

      try {
        let res = await huks.deleteKey("", useOptions);
        expect(res.errorCode).assertEqual(-3);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_DeleteKey_Interface_0400
     * @tc.number SUB_Security_HUKS_ApiCover_DeleteKey_Interface_0400
     * @tc.desc   test deleteKey with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_DeleteKey_Interface_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_DeleteKey_Interface_0400";

      let useOptions = GetAesGenerateOptions(128);

      try {
        let res = await huks.deleteKey(testNumber.padEnd(HuksMaxAliasLength + 1, "a"), useOptions);
        expect(res.errorCode).assertEqual(-3);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_DeleteKey_Interface_0500
     * @tc.number SUB_Security_HUKS_ApiCover_DeleteKey_Interface_0500
     * @tc.desc   test deleteKey with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_DeleteKey_Interface_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_DeleteKey_Interface_0500";

      let useOptions = GetAesGenerateOptions(128);

      try {
        let res = await huks.deleteKey(null, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_DeleteKey_Interface_0600
     * @tc.number SUB_Security_HUKS_ApiCover_DeleteKey_Interface_0600
     * @tc.desc   test deleteKey with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_DeleteKey_Interface_0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_DeleteKey_Interface_0600";

      let useOptions = GetAesGenerateOptions(128);

      try {
        let res = await huks.deleteKey(undefined, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_DeleteKey_Interface_5000
     * @tc.number SUB_Security_HUKS_ApiCover_DeleteKey_Interface_5000
     * @tc.desc   test deleteKey with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_DeleteKey_Interface_5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_DeleteKey_Interface_5000";
      let keyAlias: string = testNumber;

      try {
        let res = await huks.deleteKey(keyAlias, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_DeleteKey_Interface_5100
     * @tc.number SUB_Security_HUKS_ApiCover_DeleteKey_Interface_5100
     * @tc.desc   test deleteKey with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_DeleteKey_Interface_5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_DeleteKey_Interface_5100";
      let keyAlias: string = testNumber;

      try {
        let res = await huks.deleteKey(keyAlias, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_DeleteKey_Interface_5200
     * @tc.number SUB_Security_HUKS_ApiCover_DeleteKey_Interface_5200
     * @tc.desc   test deleteKey with undefined Options parameter after generate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_DeleteKey_Interface_5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_DeleteKey_Interface_5200";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let useOptions: huks.HuksOptions = {
        properties: []
      }

      await huks.generateKey(keyAlias, genOptions);

      try {
        let res = await huks.deleteKey(keyAlias, useOptions);
        expect(res.errorCode).assertEqual(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    //huks.importKey()
    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportKey_Interface_0100
     * @tc.number SUB_Security_HUKS_ApiCover_ImportKey_Interface_0100
     * @tc.desc   test generateKey with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportKey_Interface_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportKey_Interface_0100";
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
        let res = await huks.importKey(keyAlias, huksOptions);
        expect(res.errorCode).assertEqual(0);
        expect(res.outData).assertEqual(null);
        expect(res.properties).assertEqual(null);
        expect(res.certChains).assertEqual(undefined);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportKey_Interface_0200
     * @tc.number SUB_Security_HUKS_ApiCover_ImportKey_Interface_0200
     * @tc.desc   test generateKey with maximum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportKey_Interface_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportKey_Interface_0200";
      let keyAlias: string = GetDataBySize(HuksMaxAliasLength);

      let huksOptions = GetAesGenerateOptions(128);
      huksOptions.inData = GetAesImportData(128);

      try {
        let res = await huks.importKey(keyAlias, huksOptions);
        expect(res.errorCode).assertEqual(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportKey_Interface_0300
     * @tc.number SUB_Security_HUKS_ApiCover_ImportKey_Interface_0300
     * @tc.desc   test generateKey with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportKey_Interface_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportKey_Interface_0300";

      let huksOptions = GetAesGenerateOptions(128);
      huksOptions.inData = GetAesImportData(128);

      try {
        let res = await huks.importKey("", huksOptions);
        expect(res.errorCode).assertEqual(-3);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportKey_Interface_0400
     * @tc.number SUB_Security_HUKS_ApiCover_ImportKey_Interface_0400
     * @tc.desc   test generateKey with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportKey_Interface_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportKey_Interface_0400";

      let huksOptions = GetAesGenerateOptions(128);
      huksOptions.inData = GetAesImportData(128);

      try {
        let res = await huks.importKey(testNumber.padEnd(HuksMaxAliasLength + 1, "a"), huksOptions);
        expect(res.errorCode).assertEqual(-3);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportKey_Interface_0500
     * @tc.number SUB_Security_HUKS_ApiCover_ImportKey_Interface_0500
     * @tc.desc   test generateKey with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportKey_Interface_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportKey_Interface_0500";

      let huksOptions = GetAesGenerateOptions(128);
      huksOptions.inData = GetAesImportData(128);

      try {
        let res = await huks.importKey(null, huksOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportKey_Interface_0600
     * @tc.number SUB_Security_HUKS_ApiCover_ImportKey_Interface_0600
     * @tc.desc   test generateKey with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportKey_Interface_0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportKey_Interface_0600";

      let huksOptions = GetAesGenerateOptions(128);
      huksOptions.inData = GetAesImportData(128);

      try {
        let res = await huks.importKey(undefined, huksOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportKey_Interface_5000
     * @tc.number SUB_Security_HUKS_ApiCover_ImportKey_Interface_5000
     * @tc.desc   test generateKey with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportKey_Interface_5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportKey_Interface_5000";
      let keyAlias: string = testNumber;

      try {
        let res = await huks.importKey(keyAlias, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportKey_Interface_5100
     * @tc.number SUB_Security_HUKS_ApiCover_ImportKey_Interface_5100
     * @tc.desc   test generateKey with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportKey_Interface_5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportKey_Interface_5100";
      let keyAlias: string = testNumber;

      try {
        let res = await huks.importKey(keyAlias, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportKey_Interface_5200
     * @tc.number SUB_Security_HUKS_ApiCover_ImportKey_Interface_5200
     * @tc.desc   test generateKey with empty properties array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportKey_Interface_5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportKey_Interface_5200";
      let keyAlias: string = testNumber;

      let huksOptions: huks.HuksOptions = {
        properties: []
      }

      try {
        let res = await huks.importKey(keyAlias, huksOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    //huks.exportKey()

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ExportKey_Interface_0100
     * @tc.number SUB_Security_HUKS_ApiCover_ExportKey_Interface_0100
     * @tc.desc   test deleteKey with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ExportKey_Interface_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ExportKey_Interface_0100";
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
        await huks.generateKey(keyAlias, genOptions);
        let res = await huks.exportKey(keyAlias, useOptions);
        expect(res.errorCode).assertEqual(0);
        expect(res.outData).not().assertEqual(undefined);
        expect(res.properties).assertEqual(null);
        expect(res.certChains).assertEqual(undefined);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ExportKey_Interface_0200
     * @tc.number SUB_Security_HUKS_ApiCover_ExportKey_Interface_0200
     * @tc.desc   test deleteKey with maximum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ExportKey_Interface_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ExportKey_Interface_0200";
      let keyAlias: string = GetDataBySize(HuksMaxAliasLength);

      let genOptions = GetEccGenerateOptions(256);
      let useOptions = GetEccGenerateOptions(256);

      try {
        await huks.generateKey(keyAlias, genOptions);
        let res = await huks.exportKey(keyAlias, useOptions);
        expect(res.errorCode).assertEqual(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ExportKey_Interface_0300
     * @tc.number SUB_Security_HUKS_ApiCover_ExportKey_Interface_0300
     * @tc.desc   test deleteKey with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ExportKey_Interface_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ExportKey_Interface_0300";

      let useOptions = GetEccGenerateOptions(256);

      try {
        let res = await huks.exportKey("", useOptions);
        expect(res.errorCode).assertEqual(-3);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ExportKey_Interface_0400
     * @tc.number SUB_Security_HUKS_ApiCover_ExportKey_Interface_0400
     * @tc.desc   test deleteKey with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ExportKey_Interface_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ExportKey_Interface_0400";

      let useOptions = GetEccGenerateOptions(256);

      try {
        let res = await huks.exportKey(testNumber.padEnd(HuksMaxAliasLength + 1, "a"), useOptions);
        expect(res.errorCode).assertEqual(-3);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ExportKey_Interface_0500
     * @tc.number SUB_Security_HUKS_ApiCover_ExportKey_Interface_0500
     * @tc.desc   test deleteKey with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ExportKey_Interface_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ExportKey_Interface_0500";

      let useOptions = GetEccGenerateOptions(256);

      try {
        let res = await huks.exportKey(null, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ExportKey_Interface_0600
     * @tc.number SUB_Security_HUKS_ApiCover_ExportKey_Interface_0600
     * @tc.desc   test deleteKey with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ExportKey_Interface_0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ExportKey_Interface_0600";

      let useOptions = GetEccGenerateOptions(256);

      try {
        let res = await huks.exportKey(undefined, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ExportKey_Interface_5000
     * @tc.number SUB_Security_HUKS_ApiCover_ExportKey_Interface_5000
     * @tc.desc   test deleteKey with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ExportKey_Interface_5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ExportKey_Interface_5000";
      let keyAlias: string = testNumber;

      try {
        let res = await huks.exportKey(keyAlias, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ExportKey_Interface_5100
     * @tc.number SUB_Security_HUKS_ApiCover_ExportKey_Interface_5100
     * @tc.desc   test deleteKey with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ExportKey_Interface_5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ExportKey_Interface_5100";
      let keyAlias: string = testNumber;

      try {
        let res = await huks.exportKey(keyAlias, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ExportKey_Interface_5200
     * @tc.number SUB_Security_HUKS_ApiCover_ExportKey_Interface_5200
     * @tc.desc   test deleteKey with undefined Options parameter after generate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ExportKey_Interface_5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ExportKey_Interface_5200";
      let keyAlias: string = testNumber;

      let genOptions = GetEccGenerateOptions(256);
      let useOptions: huks.HuksOptions = {
        properties: []
      }

      await huks.generateKey(keyAlias, genOptions);

      try {
        let res = await huks.exportKey(keyAlias, useOptions);
        expect(res.errorCode).assertEqual(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    //huks.getKeyProperties()

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_0100
     * @tc.number SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_0100
     * @tc.desc   test deleteKey with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_0100";
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
        await huks.generateKey(keyAlias, genOptions);
        let res = await huks.getKeyProperties(keyAlias, useOptions);
        expect(res.errorCode).assertEqual(0);
        expect(res.outData).assertEqual(null);
        expect(res.properties).not().assertEqual(undefined);
        expect(res.certChains).assertEqual(undefined);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_0200
     * @tc.number SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_0200
     * @tc.desc   test deleteKey with maximum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_0200";
      let keyAlias: string = GetDataBySize(HuksMaxAliasLength);

      let genOptions = GetAesGenerateOptions(128);
      let useOptions = GetAesGenerateOptions(128);

      try {
        await huks.generateKey(keyAlias, genOptions);
        let res = await huks.getKeyProperties(keyAlias, useOptions);
        expect(res.errorCode).assertEqual(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_0300
     * @tc.number SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_0300
     * @tc.desc   test deleteKey with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_0300";

      let useOptions = GetAesGenerateOptions(128);

      try {
        let res = await huks.getKeyProperties("", useOptions);
        expect(res.errorCode).assertEqual(-3);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_0400
     * @tc.number SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_0400
     * @tc.desc   test deleteKey with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_0400";

      let useOptions = GetAesGenerateOptions(128);

      try {
        let res = await huks.getKeyProperties(testNumber.padEnd(HuksMaxAliasLength + 1, "a"), useOptions);
        expect(res.errorCode).assertEqual(-3);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_0500
     * @tc.number SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_0500
     * @tc.desc   test deleteKey with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_0500";

      let useOptions = GetAesGenerateOptions(128);

      try {
        let res = await huks.getKeyProperties(null, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_0600
     * @tc.number SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_0600
     * @tc.desc   test deleteKey with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_0600";

      let useOptions = GetAesGenerateOptions(128);

      try {
        let res = await huks.getKeyProperties(undefined, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_5000
     * @tc.number SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_5000
     * @tc.desc   test deleteKey with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_5000";
      let keyAlias: string = testNumber;

      try {
        let res = await huks.getKeyProperties(keyAlias, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_5100
     * @tc.number SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_5100
     * @tc.desc   test deleteKey with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_5100";
      let keyAlias: string = testNumber;

      try {
        let res = await huks.getKeyProperties(keyAlias, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_5200
     * @tc.number SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_5200
     * @tc.desc   test deleteKey with undefined Options parameter after generate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GetKeyProperties_Interface_5200";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let useOptions: huks.HuksOptions = {
        properties: []
      }

      await huks.generateKey(keyAlias, genOptions);

      try {
        let res = await huks.getKeyProperties(keyAlias, useOptions);
        expect(res.errorCode).assertEqual(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    //huks.isKeyExist()

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_0100
     * @tc.number SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_0100
     * @tc.desc   test deleteKey with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_0100";
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
        let res = await huks.isKeyExist(keyAlias, useOptions);
        expect(res).assertEqual(false);
        await huks.generateKey(keyAlias, genOptions);
        res = await huks.isKeyExist(keyAlias, useOptions);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_0200
     * @tc.number SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_0200
     * @tc.desc   test deleteKey with maximum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_0200";
      let keyAlias: string = GetDataBySize(HuksMaxAliasLength);

      let genOptions = GetAesGenerateOptions(128);
      let useOptions = GetAesGenerateOptions(128);

      try {
        let res = await huks.isKeyExist(keyAlias, useOptions);
        expect(res).assertEqual(false);
        await huks.generateKey(keyAlias, genOptions);
        res = await huks.isKeyExist(keyAlias, useOptions);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_0300
     * @tc.number SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_0300
     * @tc.desc   test deleteKey with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_0300";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huks.isKeyExist("", useOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_0400
     * @tc.number SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_0400
     * @tc.desc   test deleteKey with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_0400";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huks.isKeyExist(testNumber.padEnd(HuksMaxAliasLength + 1, "a"), useOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_0500
     * @tc.number SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_0500
     * @tc.desc   test deleteKey with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_0500";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huks.isKeyExist(null, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_0600
     * @tc.number SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_0600
     * @tc.desc   test deleteKey with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_0600";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huks.isKeyExist(undefined, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_5000
     * @tc.number SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_5000
     * @tc.desc   test deleteKey with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_5000";
      let keyAlias: string = testNumber;

      try {
        let res = await huks.isKeyExist(keyAlias, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_5100
     * @tc.number SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_5100
     * @tc.desc   test deleteKey with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_5100";
      let keyAlias: string = testNumber;

      try {
        let res = await huks.isKeyExist(keyAlias, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_5200
     * @tc.number SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_5200
     * @tc.desc   test deleteKey with undefined Options parameter after generate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_IsKeyExist_Interface_5200";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let useOptions: huks.HuksOptions = {
        properties: []
      }

      await huks.generateKey(keyAlias, genOptions);

      try {
        let res = await huks.isKeyExist(keyAlias, useOptions);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    //huks.init()

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Init_Interface_0100
     * @tc.number SUB_Security_HUKS_ApiCover_Init_Interface_0100
     * @tc.desc   test deleteKey with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Init_Interface_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Init_Interface_0100";
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
        await huks.generateKey(keyAlias, genOptions);
        let res = await huks.init(keyAlias, useOptions);
        expect(res.handle).assertLarger(0);
        expect(res.errorCode).assertEqual(0);
        await huks.abort(res.handle, useOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Init_Interface_0200
     * @tc.number SUB_Security_HUKS_ApiCover_Init_Interface_0200
     * @tc.desc   test deleteKey with maximum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Init_Interface_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Init_Interface_0200";
      let keyAlias: string = GetDataBySize(HuksMaxAliasLength);

      let genOptions = GetAesGenerateOptions(128);
      let useOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huks.generateKey(keyAlias, genOptions);
        let res = await huks.init(keyAlias, useOptions);
        expect(res.errorCode).assertEqual(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Init_Interface_0300
     * @tc.number SUB_Security_HUKS_ApiCover_Init_Interface_0300
     * @tc.desc   test deleteKey with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Init_Interface_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Init_Interface_0300";

      let useOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        let res = await huks.init("", useOptions);
        expect(res.errorCode).assertEqual(-3);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Init_Interface_0400
     * @tc.number SUB_Security_HUKS_ApiCover_Init_Interface_0400
     * @tc.desc   test deleteKey with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Init_Interface_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Init_Interface_0400";

      let useOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        let res = await huks.init(testNumber.padEnd(HuksMaxAliasLength + 1, "a"), useOptions);
        expect(res.errorCode).assertEqual(-3);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Init_Interface_0500
     * @tc.number SUB_Security_HUKS_ApiCover_Init_Interface_0500
     * @tc.desc   test deleteKey with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Init_Interface_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Init_Interface_0500";

      let useOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        let res = await huks.init(null, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Init_Interface_0600
     * @tc.number SUB_Security_HUKS_ApiCover_Init_Interface_0600
     * @tc.desc   test deleteKey with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Init_Interface_0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Init_Interface_0600";

      let useOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        let res = await huks.init(undefined, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Init_Interface_5000
     * @tc.number SUB_Security_HUKS_ApiCover_Init_Interface_5000
     * @tc.desc   test deleteKey with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Init_Interface_5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Init_Interface_5000";
      let keyAlias: string = testNumber;

      try {
        let res = await huks.init(keyAlias, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Init_Interface_5100
     * @tc.number SUB_Security_HUKS_ApiCover_Init_Interface_5100
     * @tc.desc   test deleteKey with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Init_Interface_5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Init_Interface_5100";
      let keyAlias: string = testNumber;

      try {
        let res = await huks.init(keyAlias, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Init_Interface_5200
     * @tc.number SUB_Security_HUKS_ApiCover_Init_Interface_5200
     * @tc.desc   test deleteKey with undefined Options parameter after generate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Init_Interface_5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Init_Interface_5200";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let useOptions: huks.HuksOptions = {
        properties: []
      }

      await huks.generateKey(keyAlias, genOptions);

      try {
        let res = await huks.init(keyAlias, useOptions);
        expect(res.errorCode).assertEqual(-3);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    //huks.update()

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Update_Interface_0100
     * @tc.number SUB_Security_HUKS_ApiCover_Update_Interface_0100
     * @tc.desc   test deleteKey with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Update_Interface_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Update_Interface_0100";
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
        await huks.generateKey(keyAlias, genOptions);
        let initRes = await huks.init(keyAlias, initOptions);
        let updateRes = await huks.update(initRes.handle, undefined, updateOptions);
        expect(updateRes.outData).not().assertEqual(undefined);
        expect(updateRes.properties).assertEqual(null);
        expect(updateRes.certChains).assertEqual(undefined);
        expect(updateRes.errorCode).assertEqual(0);
        await huks.abort(initRes.handle, abortOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Update_Interface_0300
     * @tc.number SUB_Security_HUKS_ApiCover_Update_Interface_0300
     * @tc.desc   test deleteKey with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Update_Interface_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Update_Interface_0300";

      let updateOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        let res = await huks.update(0, undefined, updateOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Update_Interface_0400
     * @tc.number SUB_Security_HUKS_ApiCover_Update_Interface_0400
     * @tc.desc   test deleteKey with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Update_Interface_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Update_Interface_0400";

      let updateOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        let res = await huks.update(null, undefined, updateOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("Parameter type does not match");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Update_Interface_0500
     * @tc.number SUB_Security_HUKS_ApiCover_Update_Interface_0500
     * @tc.desc   test deleteKey with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Update_Interface_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Update_Interface_0500";

      let updateOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        let res = await huks.update(undefined, undefined, updateOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("Parameter type does not match");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Update_Interface_1000
     * @tc.number SUB_Security_HUKS_ApiCover_Update_Interface_1000
     * @tc.desc   test deleteKey with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Update_Interface_1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Update_Interface_1000";
      let keyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));
      let updateOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));
      updateOptions.inData = StringToUint8Array(GetDataBySize(64));

      try {
        await huks.generateKey(keyAlias, genOptions);
        let initRes = await huks.init(keyAlias, initOptions);
        let updateRes = await huks.update(initRes.handle, null, updateOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Update_Interface_5000
     * @tc.number SUB_Security_HUKS_ApiCover_Update_Interface_5000
     * @tc.desc   test deleteKey with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Update_Interface_5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Update_Interface_5000";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      await huks.generateKey(keyAlias, genOptions);

      let initRes = await huks.init(keyAlias, initOptions);
      try {
        let res = await huks.update(initRes.handle, undefined, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Update_Interface_5100
     * @tc.number SUB_Security_HUKS_ApiCover_Update_Interface_5100
     * @tc.desc   test deleteKey with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Update_Interface_5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Update_Interface_5100";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      await huks.generateKey(keyAlias, genOptions);

      let initRes = await huks.init(keyAlias, initOptions);
      try {
        let res = await huks.update(initRes.handle, undefined, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Update_Interface_5200
     * @tc.number SUB_Security_HUKS_ApiCover_Update_Interface_5200
     * @tc.desc   test deleteKey with undefined Options parameter after generate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Update_Interface_5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Update_Interface_5200";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));
      let updateOptions: huks.HuksOptions = {
        properties: []
      }

      await huks.generateKey(keyAlias, genOptions);

      let initRes = await huks.init(keyAlias, initOptions);
      try {
        let res = await huks.update(initRes.handle, undefined, updateOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    //huks.finish()

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Finish_Interface_0100
     * @tc.number SUB_Security_HUKS_ApiCover_Finish_Interface_0100
     * @tc.desc   test deleteKey with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Finish_Interface_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Finish_Interface_0100";
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
        await huks.generateKey(keyAlias, genOptions);
        let initRes = await huks.init(keyAlias, initOptions);
        let finishRes = await huks.finish(initRes.handle, finishOptions);
        expect(finishRes.outData).not().assertEqual(undefined);
        expect(finishRes.properties).assertEqual(null);
        expect(finishRes.certChains).assertEqual(undefined);
        expect(finishRes.errorCode).assertEqual(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Finish_Interface_0300
     * @tc.number SUB_Security_HUKS_ApiCover_Finish_Interface_0300
     * @tc.desc   test deleteKey with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Finish_Interface_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Finish_Interface_0300";

      let finishOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        let res = await huks.finish(0, finishOptions);
        expect(res.errorCode).assertEqual(-13);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Finish_Interface_0400
     * @tc.number SUB_Security_HUKS_ApiCover_Finish_Interface_0400
     * @tc.desc   test deleteKey with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Finish_Interface_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Finish_Interface_0400";

      let finishOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        let res = await huks.finish(null, finishOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("Parameter type does not match");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Finish_Interface_0500
     * @tc.number SUB_Security_HUKS_ApiCover_Finish_Interface_0500
     * @tc.desc   test deleteKey with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Finish_Interface_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Finish_Interface_0500";

      let finishOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        let res = await huks.finish(undefined, finishOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("Parameter type does not match");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Finish_Interface_5000
     * @tc.number SUB_Security_HUKS_ApiCover_Finish_Interface_5000
     * @tc.desc   test deleteKey with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Finish_Interface_5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Finish_Interface_5000";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      await huks.generateKey(keyAlias, genOptions);

      let initRes = await huks.init(keyAlias, initOptions);
      try {
        let res = await huks.finish(initRes.handle, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Finish_Interface_5100
     * @tc.number SUB_Security_HUKS_ApiCover_Finish_Interface_5100
     * @tc.desc   test deleteKey with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Finish_Interface_5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Finish_Interface_5100";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      await huks.generateKey(keyAlias, genOptions);

      let initRes = await huks.init(keyAlias, initOptions);
      try {
        let res = await huks.finish(initRes.handle, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Finish_Interface_5200
     * @tc.number SUB_Security_HUKS_ApiCover_Finish_Interface_5200
     * @tc.desc   test deleteKey with undefined Options parameter after generate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Finish_Interface_5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Finish_Interface_5200";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));
      let finishOptions: huks.HuksOptions = {
        properties: []
      }

      await huks.generateKey(keyAlias, genOptions);

      let initRes = await huks.init(keyAlias, initOptions);
      try {
        let res = await huks.finish(initRes.handle, finishOptions);
        expect(res.errorCode).assertEqual(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    //huks.abort()

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Abort_Interface_0100
     * @tc.number SUB_Security_HUKS_ApiCover_Abort_Interface_0100
     * @tc.desc   test deleteKey with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Abort_Interface_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Abort_Interface_0100";
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
        await huks.generateKey(keyAlias, genOptions);
        let initRes = await huks.init(keyAlias, initOptions);
        let res = await huks.abort(initRes.handle, abortOptions);
        expect(res.errorCode).assertEqual(0);
        expect(res.outData).assertEqual(null);
        expect(res.properties).assertEqual(null);
        expect(res.certChains).assertEqual(undefined);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Abort_Interface_0300
     * @tc.number SUB_Security_HUKS_ApiCover_Abort_Interface_0300
     * @tc.desc   test deleteKey with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Abort_Interface_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Abort_Interface_0300";

      let abortOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        let res = await huks.abort(0, abortOptions);
        expect(res.errorCode).assertEqual(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Abort_Interface_0400
     * @tc.number SUB_Security_HUKS_ApiCover_Abort_Interface_0400
     * @tc.desc   test deleteKey with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Abort_Interface_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Abort_Interface_0400";

      let abortOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        let res = await huks.abort(null, abortOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("Parameter type does not match");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Abort_Interface_0500
     * @tc.number SUB_Security_HUKS_ApiCover_Abort_Interface_0500
     * @tc.desc   test deleteKey with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Abort_Interface_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Abort_Interface_0500";

      let abortOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        let res = await huks.abort(undefined, abortOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("Parameter type does not match");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Abort_Interface_5000
     * @tc.number SUB_Security_HUKS_ApiCover_Abort_Interface_5000
     * @tc.desc   test deleteKey with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Abort_Interface_5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Abort_Interface_5000";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      await huks.generateKey(keyAlias, genOptions);

      let initRes = await huks.init(keyAlias, initOptions);
      try {
        let res = await huks.abort(initRes.handle, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Abort_Interface_5100
     * @tc.number SUB_Security_HUKS_ApiCover_Abort_Interface_5100
     * @tc.desc   test deleteKey with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Abort_Interface_5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Abort_Interface_5100";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      await huks.generateKey(keyAlias, genOptions);

      let initRes = await huks.init(keyAlias, initOptions);
      try {
        let res = await huks.abort(initRes.handle, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("empty error message");
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Abort_Interface_5200
     * @tc.number SUB_Security_HUKS_ApiCover_Abort_Interface_5200
     * @tc.desc   test deleteKey with undefined Options parameter after generate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Abort_Interface_5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Abort_Interface_5200";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));
      let abortOptions: huks.HuksOptions = {
        properties: []
      }

      await huks.generateKey(keyAlias, genOptions);

      let initRes = await huks.init(keyAlias, initOptions);
      try {
        let res = await huks.abort(initRes.handle, abortOptions);
        expect(res.errorCode).assertEqual(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    //huks.getSdkVersion()

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GetSdkVersion_Interface_0000
     * @tc.number SUB_Security_HUKS_ApiCover_GetSdkVersion_Interface_0000
     * @tc.desc   test deleteKey with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GetSdkVersion_Interface_0000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GetSdkVersion_Interface_0000";

      let getSdkVersionOptions: huks.HuksOptions = {
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
        let res = huks.getSdkVersion(getSdkVersionOptions);
        expect(res.length).assertLarger(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });


    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GetSdkVersion_Interface_5000
     * @tc.number SUB_Security_HUKS_ApiCover_GetSdkVersion_Interface_5000
     * @tc.desc   test deleteKey with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GetSdkVersion_Interface_5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GetSdkVersion_Interface_5000";

      try {
        let res = huks.getSdkVersion(null);
        expect(res.length).assertLarger(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GetSdkVersion_Interface_5100
     * @tc.number SUB_Security_HUKS_ApiCover_GetSdkVersion_Interface_5100
     * @tc.desc   test deleteKey with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GetSdkVersion_Interface_5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GetSdkVersion_Interface_5100";

      try {
        let res = huks.getSdkVersion(undefined);
        expect(res.length).assertLarger(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GetSdkVersion_Interface_5200
     * @tc.number SUB_Security_HUKS_ApiCover_GetSdkVersion_Interface_5200
     * @tc.desc   test deleteKey with undefined Options parameter after generate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GetSdkVersion_Interface_5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GetSdkVersion_Interface_5200";

      let genOptions = GetAesGenerateOptions(128);
      let getSdkVersionOptions: huks.HuksOptions = {
        properties: []
      }
      try {
        let res = huks.getSdkVersion(getSdkVersionOptions);
        expect(res.length).assertLarger(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

  });
}