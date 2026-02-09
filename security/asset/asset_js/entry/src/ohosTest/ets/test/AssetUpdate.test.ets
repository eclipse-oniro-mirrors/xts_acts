/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import * as aw from './aw/AssetAw';
import asset from '@ohos.security.asset';


export default function abilityTest() {
  describe('AssetUpdateTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await aw.cleanData();
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.name   Security_DataSecurity_Asset_Update_Func_0100
     * @tc.number Security_DataSecurity_Asset_Update_Func_0100
     * @tc.desc   test error cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_DataSecurity_Asset_Update_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let attr: asset.AssetMap = new Map();
      await aw.assetAddAll(attr);

      expect(Number(await aw.assetUpdateEasy(aw.aliasNameList[0], aw.secTooLong)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);

      expect(Number(await aw.assetUpdateEasy(aw.aliasNameList[1], aw.valueEmpty)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);

    })

    /**
     * @tc.name   Security_DataSecurity_Asset_Update_Func_0200
     * @tc.number Security_DataSecurity_Asset_Update_Func_0200
     * @tc.desc   test error cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_DataSecurity_Asset_Update_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let attr: asset.AssetMap = new Map();
      await aw.assetAddAll(attr);

      expect(Number(await aw.assetUpdate(aw.aliasNameList[0])))
        .assertEqual(0);

      expect(Number(await aw.assetUpdate(aw.aliasNameList[0])))
        .assertEqual(0);

    })

    /**
     * @tc.name   Security_DataSecurity_Asset_Update_Func_0300
     * @tc.number Security_DataSecurity_Asset_Update_Func_0300
     * @tc.desc   test error cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_DataSecurity_Asset_Update_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let attr: asset.AssetMap = new Map();
      await aw.assetAddAll(attr);

      expect(Number(await aw.assetUpdate('abcde')))
        .assertEqual(asset.ErrorCode.NOT_FOUND);

    })

    /**
     * @tc.name   Security_DataSecurity_Asset_Update_Func_0600
     * @tc.number Security_DataSecurity_Asset_Update_Func_0600
     * @tc.desc   test error cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_DataSecurity_Asset_Update_Func_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      attr.set(asset.Tag.SECRET, aw.StringToArray(aw.secretList[0]));
      attr.set(asset.Tag.DATA_LABEL_NORMAL_1, aw.StringToArray(aw.labelList[0]));
      attr.set(asset.Tag.DATA_LABEL_NORMAL_2, aw.StringToArray(aw.labelList[1]));
      attr.set(asset.Tag.DATA_LABEL_NORMAL_3, aw.StringToArray(aw.labelList[2]));
      attr.set(asset.Tag.DATA_LABEL_NORMAL_4, aw.StringToArray(aw.labelList[3]));
      attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_POWERED_ON);
      await aw.assetAddAttr(attr);

      let attr2: asset.AssetMap = new Map();
      attr2.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));

      let attr3: asset.AssetMap = new Map();
      attr3.set(asset.Tag.DATA_LABEL_NORMAL_1, aw.StringToArray(aw.labelList[4]));
      attr3.set(asset.Tag.DATA_LABEL_NORMAL_2, aw.StringToArray(aw.labelList[4]));
      attr3.set(asset.Tag.DATA_LABEL_NORMAL_3, aw.StringToArray(aw.labelList[4]));
      attr3.set(asset.Tag.DATA_LABEL_NORMAL_4, aw.StringToArray(aw.labelList[4]));
      expect(Number(await aw.assetUpdateAttrs(attr2, attr3)))
        .assertEqual(0);

    })

    /**
     * @tc.name   Security_DataSecurity_Asset_Update_Func_0700
     * @tc.number Security_DataSecurity_Asset_Update_Func_0700
     * @tc.desc   test error cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_DataSecurity_Asset_Update_Func_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      attr.set(asset.Tag.SECRET, aw.StringToArray(aw.secretList[0]));
      attr.set(asset.Tag.DATA_LABEL_CRITICAL_1, aw.StringToArray(aw.labelList[0]));
      attr.set(asset.Tag.DATA_LABEL_CRITICAL_2, aw.StringToArray(aw.labelList[1]));
      attr.set(asset.Tag.DATA_LABEL_CRITICAL_3, aw.StringToArray(aw.labelList[2]));
      attr.set(asset.Tag.DATA_LABEL_CRITICAL_4, aw.StringToArray(aw.labelList[3]));
      attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_POWERED_ON);
      await aw.assetAddAttr(attr);

      let attr2: asset.AssetMap = new Map();
      attr2.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));

      let attr3: asset.AssetMap = new Map();
      attr3.set(asset.Tag.DATA_LABEL_CRITICAL_1, aw.StringToArray(aw.labelList[4]));
      attr3.set(asset.Tag.DATA_LABEL_CRITICAL_2, aw.StringToArray(aw.labelList[4]));
      attr3.set(asset.Tag.DATA_LABEL_CRITICAL_3, aw.StringToArray(aw.labelList[4]));
      attr3.set(asset.Tag.DATA_LABEL_CRITICAL_4, aw.StringToArray(aw.labelList[4]));
      expect(Number(await aw.assetUpdateAttrs(attr2, attr3)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);

    })

    /**
     * @tc.name   Security_DataSecurity_Asset_Update_Func_0900
     * @tc.number Security_DataSecurity_Asset_Update_Func_0900
     * @tc.desc   test error cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_DataSecurity_Asset_Update_Func_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      attr.set(asset.Tag.SECRET, aw.StringToArray(aw.secretList[0]));
      attr.set(asset.Tag.DATA_LABEL_CRITICAL_1, aw.StringToArray(aw.labelList[0]));
      attr.set(asset.Tag.DATA_LABEL_CRITICAL_2, aw.StringToArray(aw.labelList[1]));
      attr.set(asset.Tag.DATA_LABEL_CRITICAL_3, aw.StringToArray(aw.labelList[2]));
      attr.set(asset.Tag.DATA_LABEL_CRITICAL_4, aw.StringToArray(aw.labelList[3]));
      attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_POWERED_ON);
      await aw.assetAddAttr(attr);

      let attr2: asset.AssetMap = new Map();
      attr2.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));

      let attr3: asset.AssetMap = new Map();
      attr3.set(asset.Tag.SECRET, aw.StringToArray(aw.secretList[1]));
      attr3.set(asset.Tag.DATA_LABEL_CRITICAL_1, aw.StringToArray(aw.labelList[4]));
      attr3.set(asset.Tag.DATA_LABEL_CRITICAL_2, aw.StringToArray(aw.labelList[4]));
      attr3.set(asset.Tag.DATA_LABEL_CRITICAL_3, aw.StringToArray(aw.labelList[4]));
      attr3.set(asset.Tag.DATA_LABEL_CRITICAL_4, aw.StringToArray(aw.labelList[4]));
      expect(Number(await aw.assetUpdateAttrs(attr2, attr3)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);

    })

    /**
     * @tc.name   Security_DataSecurity_Asset_Update_Func_1000
     * @tc.number Security_DataSecurity_Asset_Update_Func_1000
     * @tc.desc   test error cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_DataSecurity_Asset_Update_Func_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let attr: asset.AssetMap = new Map();
      await aw.assetAddAll(attr);

      let attr2: asset.AssetMap = new Map();
      let attr3: asset.AssetMap = new Map();
      attr3.set(asset.Tag.SECRET, aw.StringToArray(aw.secretList[1]));
      expect(Number(await aw.assetUpdateAttrs(attr2, attr3)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);

      attr2.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      attr2.set(asset.Tag.SECRET, aw.StringToArray(aw.secretList[0]));
      expect(Number(await aw.assetUpdateAttrs(attr2, attr3)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);

      attr2.delete(asset.Tag.ALIAS);
      attr2.set(asset.Tag.SECRET, aw.StringToArray(aw.secretList[0]));
      expect(Number(await aw.assetUpdateAttrs(attr2, attr3)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);

      attr2.delete(asset.Tag.SECRET);
      attr2.set(asset.Tag.DATA_LABEL_NORMAL_1, aw.StringToArray(aw.secretList[0]));
      expect(Number(await aw.assetUpdateAttrs(attr2, attr3)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);

      attr2.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      attr2.delete(asset.Tag.DATA_LABEL_NORMAL_1);

      attr2.set(asset.Tag.RETURN_ORDERED_BY, asset.Tag.DATA_LABEL_NORMAL_1);
      expect(Number(await aw.assetUpdateAttrs(attr2, attr3)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);

      attr2.delete(asset.Tag.RETURN_ORDERED_BY);
      attr2.set(asset.Tag.RETURN_TYPE, asset.ReturnType.ALL);
      expect(Number(await aw.assetUpdateAttrs(attr2, attr3)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);

      attr2.delete(asset.Tag.RETURN_TYPE);
      attr2.set(asset.Tag.RETURN_LIMIT, 1);
      expect(Number(await aw.assetUpdateAttrs(attr2, attr3)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);

      attr2.delete(asset.Tag.RETURN_LIMIT);
      attr2.set(asset.Tag.RETURN_OFFSET, 1);
      expect(Number(await aw.assetUpdateAttrs(attr2, attr3)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);


    })

    /**
     * @tc.name   Security_DataSecurity_Asset_Update_Func_1100
     * @tc.number Security_DataSecurity_Asset_Update_Func_1100
     * @tc.desc   test error cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_DataSecurity_Asset_Update_Func_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let attr: asset.AssetMap = new Map();
      await aw.assetAddAll(attr);

      let attr2: asset.AssetMap = new Map();
      attr2.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));

      let attr3: asset.AssetMap = new Map();
      expect(Number(await aw.assetUpdateAttrs(attr2, attr3)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);

      attr3.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      expect(Number(await aw.assetUpdateAttrs(attr2, attr3)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);

      attr3.set(asset.Tag.SECRET, aw.StringToArray(aw.secretList[1]));
      expect(Number(await aw.assetUpdateAttrs(attr2, attr3)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);

      attr3.delete(asset.Tag.ALIAS);

      attr3.set(asset.Tag.RETURN_ORDERED_BY, asset.Tag.DATA_LABEL_NORMAL_1);
      expect(Number(await aw.assetUpdateAttrs(attr2, attr3)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);

      attr3.delete(asset.Tag.RETURN_ORDERED_BY);
      attr3.set(asset.Tag.RETURN_TYPE, asset.ReturnType.ALL);
      expect(Number(await aw.assetUpdateAttrs(attr2, attr3)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);

      attr3.delete(asset.Tag.RETURN_TYPE);
      attr3.set(asset.Tag.RETURN_LIMIT, 1);
      expect(Number(await aw.assetUpdateAttrs(attr2, attr3)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);

      attr3.delete(asset.Tag.RETURN_LIMIT);
      attr3.set(asset.Tag.RETURN_OFFSET, 1);
      expect(Number(await aw.assetUpdateAttrs(attr2, attr3)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
    })

    /**
     * @tc.name   SUB_Security_DataSecurity_Asset_Password_Func_0500
     * @tc.number SUB_Security_DataSecurity_Asset_Password_Func_0500
     * @tc.desc   test error cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_DataSecurity_Asset_Password_Func_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      attr.set(asset.Tag.SECRET, aw.StringToArray(aw.secretList[0]));
      attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_POWERED_ON);
      attr.set(asset.Tag.REQUIRE_PASSWORD_SET, true);
      await aw.assetAddAttr(attr);
      let attr2: asset.AssetMap = new Map();
      attr2.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      let attr3: asset.AssetMap = new Map();
      attr3.set(asset.Tag.SECRET, aw.StringToArray(aw.updateSecret));
      attr3.set(asset.Tag.REQUIRE_PASSWORD_SET, false);
      expect(Number(await aw.assetUpdateAttrs(attr2, attr3)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);

      aw.cleanData();
      attr.set(asset.Tag.REQUIRE_PASSWORD_SET, false);
      attr2.set(asset.Tag.REQUIRE_PASSWORD_SET, true);
      expect(Number(await aw.assetUpdateAttrs(attr2, attr3)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
    })

    /**
     * @tc.name   SUB_Security_DataSecurity_Asset_LevelCtrl_Func_2500
     * @tc.number SUB_Security_DataSecurity_Asset_LevelCtrl_Func_2500
     * @tc.desc   test error cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_DataSecurity_Asset_LevelCtrl_Func_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      attr.set(asset.Tag.SECRET, aw.StringToArray(aw.secretList[0]));
      attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_UNLOCKED);
      await aw.assetAddAttr(attr);
      let attr2: asset.AssetMap = new Map();
      attr2.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      let attr3: asset.AssetMap = new Map();
      attr3.set(asset.Tag.SECRET, aw.StringToArray(aw.updateSecret));
      attr3.set(asset.Tag.ACCESSIBILITY,asset.Accessibility.DEVICE_POWERED_ON);
      expect(Number(await aw.assetUpdateAttrs(attr2, attr3)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);

      aw.cleanData();
      attr.set(asset.Tag.ACCESSIBILITY,asset.Accessibility.DEVICE_POWERED_ON);
      attr3.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_UNLOCKED);
      expect(Number(await aw.assetUpdateAttrs(attr2, attr3)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
    })

  })
}