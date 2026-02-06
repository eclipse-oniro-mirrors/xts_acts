/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeEach } from '@ohos/hypium';
import huks from '@ohos.security.huks';
import * as huksCallback from './utils/param/huksCallback';

export default function SecurityHuksQueryKeyJsunit() {
  let huksProperties;
  let huksOptions;
  describe('SecurityHuksQueryKeyJsunit', function () {
    beforeEach(() => {
      huksProperties = new Array();
      let index = 0;
      huksProperties[index++] = {
        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
        value: huks.HuksKeyAlg.HUKS_ALG_AES
      };
      huksProperties[index++] = {
        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
        value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_128
      };
      huksProperties[index++] = {
        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
      };
      huksProperties[index++] = {
        tag: huks.HuksTag.HUKS_TAG_PADDING,
        value: huks.HuksKeyPadding.HUKS_PADDING_PKCS7
      };
      huksProperties[index++] = {
        tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
        value: huks.HuksCipherMode.HUKS_MODE_CBC
      };
      huksOptions = {
        properties: huksProperties
      };
    })

    /**
     * @tc.name   SUB_Security_HUKS_QueryKey_IsKeyExist_API8_Func_0100
     * @tc.number SUB_Security_HUKS_QueryKey_IsKeyExist_API8_Func_0100
     * @tc.desc   test isKeyExist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_QueryKey_IsKeyExist_API8_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async function (done) {
        let srcKeyAlias = 'SUB_Security_HUKS_QueryKey_IsKeyExist_API8_Func_0100';
        try {
          await huks.generateKey(srcKeyAlias, huksOptions);
          let res = await huks.isKeyExist(srcKeyAlias, huksOptions);
          expect(res).assertEqual(true);
        } catch (err) {
          console.error(srcKeyAlias + `: fail, err: ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_HUKS_QueryKey_IsKeyExist_API8_Func_0110
     * @tc.number SUB_Security_HUKS_QueryKey_IsKeyExist_API8_Func_0110
     * @tc.desc   test isKeyExist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_QueryKey_IsKeyExist_API8_Func_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let srcKeyAlias = 'SUB_Security_HUKS_QueryKey_IsKeyExist_API8_Func_0110';
        try {
          await huksCallback.generateKey(srcKeyAlias, huksOptions);
          let res = await huksCallback.isKeyExist(srcKeyAlias, huksOptions);
          expect(res).assertEqual(true);
        } catch (err) {
          console.error(srcKeyAlias + `: fail, err: ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_HUKS_QueryKey_IsKeyExist_API8_Func_0200
     * @tc.number SUB_Security_HUKS_QueryKey_IsKeyExist_API8_Func_0200
     * @tc.desc   test isKeyExist, key not exist, return false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_QueryKey_IsKeyExist_API8_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async function (done) {
        let srcKeyAlias = 'SUB_Security_HUKS_QueryKey_IsKeyExist_API8_Func_0200';
        try {
          let res = await huks.isKeyExist(srcKeyAlias, huksOptions);
          expect(res).assertEqual(false);
        } catch (err) {
          console.error(srcKeyAlias + `: fail, err: ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_HUKS_QueryKey_IsKeyExist_API8_Func_0210
     * @tc.number SUB_Security_HUKS_QueryKey_IsKeyExist_API8_Func_0210
     * @tc.desc   test isKeyExist, key not exist, err.code -13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_QueryKey_IsKeyExist_API8_Func_0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let srcKeyAlias = 'SUB_Security_HUKS_QueryKey_IsKeyExist_API8_Func_0210';
        try {
          await huksCallback.isKeyExist(srcKeyAlias, huksOptions);
          expect(null).assertFail();
        } catch (err) {
          console.error(srcKeyAlias + `: fail, err: ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(-13);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_HUKS_QueryKey_IsKeyExist_API8_Func_0300
     * @tc.number SUB_Security_HUKS_QueryKey_IsKeyExist_API8_Func_0300
     * @tc.desc   test isKeyExist, key not exist, err.code -13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_QueryKey_IsKeyExist_API8_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let srcKeyAlias = 'SUB_Security_HUKS_QueryKey_IsKeyExist_API8_Func_0300';
        try {
          await huksCallback.generateKey(srcKeyAlias, huksOptions);
          await huksCallback.deleteKey(srcKeyAlias, huksOptions);
          await huksCallback.isKeyExist(srcKeyAlias, huksOptions);
          expect(null).assertFail();
        } catch (err) {
          console.error(srcKeyAlias + `: fail, err: ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(-13);
        }
        done();
      });
  })
}