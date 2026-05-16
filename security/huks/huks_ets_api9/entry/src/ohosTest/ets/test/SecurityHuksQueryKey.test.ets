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
import { describe, it, expect, TestType, Size, Level, beforeEach } from '@ohos/hypium';
import huks from '@ohos.security.huks';
import * as huksCallback from './utils/huks/HuksCallbackUtils';

import { GetAesGenerateOptions } from './utils/huks/GenerateKeyUtils';


export default function SecurityHuksQueryKey() {
  let huksOptions: huks.HuksOptions;
  describe('SecurityHuksQueryKey', () => {
    beforeEach(() => {
      huksOptions = GetAesGenerateOptions(128);
    })

    /**
     * @tc.name   SUB_Security_HUKS_QueryKey_hasKey_API11_Func_0200
     * @tc.number SUB_Security_HUKS_QueryKey_hasKey_API11_Func_0200
     * @tc.desc   test hasKeyItem, key not exist, return false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_QueryKey_hasKey_API11_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'SUB_Security_HUKS_QueryKey_hasKey_API11_Func_0210';
      let srcKeyAlias = testNumber;

      try {
        let res = await huks.hasKeyItem(srcKeyAlias, huksOptions);
        expect(res).assertEqual(false);
      } catch (err) {
        console.error(testNumber + ` catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_QueryKey_hasKey_API11_Func_0210
     * @tc.number SUB_Security_HUKS_QueryKey_hasKey_API11_Func_0210
     * @tc.desc   test hasKeyItem, key not exist, return false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_QueryKey_hasKey_API11_Func_0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber = 'SUB_Security_HUKS_QueryKey_hasKey_API11_Func_0210';
      let srcKeyAlias = testNumber;

      try {
        let res = await huksCallback.hasKeyItem(srcKeyAlias, huksOptions);
        expect(res).assertEqual(false);
      } catch (err) {
        console.error(testNumber + ` catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_QueryKey_hasKey_API11_Func_0300
     * @tc.number SUB_Security_HUKS_QueryKey_hasKey_API11_Func_0300
     * @tc.desc   test hasKeyItem, key not exist, return false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_QueryKey_hasKey_API11_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber = 'SUB_Security_HUKS_QueryKey_hasKey_API11_Func_0300';
      let srcKeyAlias = testNumber;

      try {
        await huks.generateKeyItem(srcKeyAlias, huksOptions);
        await huks.deleteKeyItem(srcKeyAlias, huksOptions);
        let res = await huks.hasKeyItem(srcKeyAlias, huksOptions);
        expect(res).assertEqual(false);
      } catch (err) {
        console.error(testNumber + ` catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0100
     * @tc.number SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0100
     * @tc.desc   test isKeyItemExist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testNumber = 'SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0100';
      let srcKeyAlias = testNumber;

      try {
        await huks.generateKeyItem(srcKeyAlias, huksOptions);
        let res = await huks.isKeyItemExist(srcKeyAlias, huksOptions);
        expect(res).assertEqual(true);
      } catch (err) {
        console.error(testNumber + ` catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0200
     * @tc.number SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0200
     * @tc.desc   test isKeyItemExist, key not exist, err.code 12000011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0200';
      let srcKeyAlias = testNumber;

      try {
        await huks.isKeyItemExist(srcKeyAlias, huksOptions);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + ` catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000011);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0300
     * @tc.number SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0300
     * @tc.desc   test isKeyItemExist, key not exist, err.code 12000011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber = 'SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0300';
      let srcKeyAlias = testNumber;

      try {
        await huks.generateKeyItem(srcKeyAlias, huksOptions);
        await huks.deleteKeyItem(srcKeyAlias, huksOptions);
        await huks.isKeyItemExist(srcKeyAlias, huksOptions);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + ` catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000011);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0110
     * @tc.number SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0110
     * @tc.desc   test isKeyItemExist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber = 'SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0110';
      let srcKeyAlias = testNumber;

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, huksOptions);
        let res = await huksCallback.isKeyItemExist(srcKeyAlias, huksOptions)
        expect(res).assertEqual(true);
      } catch (err) {
        console.error(testNumber + ` catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0210
     * @tc.number SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0210
     * @tc.desc   test isKeyItemExist, key not exist, err.code 12000011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber = 'SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0210';
      let srcKeyAlias = testNumber;

      try {
        await huksCallback.isKeyItemExist(srcKeyAlias, huksOptions)
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + ` catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000011);
      }
    });
  });
}