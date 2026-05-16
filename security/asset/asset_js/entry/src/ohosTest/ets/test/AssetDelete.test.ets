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
  describe('AssetDeleteTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(async () => {
      await aw.cleanData();
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.name   Security_DataSecurity_Asset_Remove_Func_1000
     * @tc.number Security_DataSecurity_Asset_Remove_Func_1000
     * @tc.desc   删除接口传入异常数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_DataSecurity_Asset_Remove_Func_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let attr: asset.AssetMap = new Map();
      await aw.assetAddAll(attr);
      let attr2: asset.AssetMap = new Map();
      attr2.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      attr2.set(asset.Tag.RETURN_OFFSET, 1);
      expect(await aw.assetRemoveAttr(attr2))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr2.set(asset.Tag.RETURN_TYPE, asset.ReturnType.ALL);
      expect(await aw.assetRemoveAttr(attr2))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr2.set(asset.Tag.RETURN_ORDERED_BY, asset.Tag.DATA_LABEL_NORMAL_1);
      expect(await aw.assetRemoveAttr(attr2))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr2.set(asset.Tag.RETURN_LIMIT, 1);
      expect(await aw.assetRemoveAttr(attr2))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr2.set(asset.Tag.SECRET, aw.StringToArray(aw.secretList[0]));
      expect(await aw.assetRemoveAttr(attr2))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
    });

    /**
     * @tc.name   SUB_Security_DataSecurity_Asset_Remove_Func_1300
     * @tc.number SUB_Security_DataSecurity_Asset_Remove_Func_1300
     * @tc.desc   申请权限后，增删改查卸载后不删除的数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_DataSecurity_Asset_Remove_Func_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.IS_PERSISTENT, true);
      attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_POWERED_ON);
      expect(await aw.basicCRUD(attr))
        .assertEqual(0);
    });

    /**
     * @tc.name   SUB_Security_DataSecurity_Asset_Remove_Func_1400
     * @tc.number SUB_Security_DataSecurity_Asset_Remove_Func_1400
     * @tc.desc   批量查询卸载后不删除的数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_DataSecurity_Asset_Remove_Func_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.IS_PERSISTENT, true);
      attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_POWERED_ON);
      await aw.assetAddAll(attr);
      attr.set(asset.Tag.IS_PERSISTENT, false);
      attr.set(asset.Tag.ALIAS, aw.StringToArray(aw.secretList[0]));
      attr.set(asset.Tag.SECRET, aw.StringToArray(aw.secretList[0]));
      await aw.assetAddAttr(attr);
      let attr2: asset.AssetMap = new Map();
      expect(await aw.assetQueryNum(attr2)).assertEqual(6);
      attr2.set(asset.Tag.IS_PERSISTENT, true);
      expect(await aw.assetQueryNum(attr2)).assertEqual(5);
      attr2.set(asset.Tag.IS_PERSISTENT, false);
      expect(await aw.assetQueryNum(attr2)).assertEqual(1);
    });

    /**
     * @tc.name   SUB_Security_DataSecurity_Asset_Remove_Func_1500
     * @tc.number SUB_Security_DataSecurity_Asset_Remove_Func_1500
     * @tc.desc   通过更新接口修改卸载后不删除的参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_DataSecurity_Asset_Remove_Func_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.IS_PERSISTENT, true);
      await aw.assetAddAll(attr);
      let attr2: asset.AssetMap = new Map();
      attr2.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      let attr3: asset.AssetMap = new Map();
      attr3.set(asset.Tag.IS_PERSISTENT, false);
      attr3.set(asset.Tag.SECRET, aw.StringToArray(aw.secretList[1]));
      expect(Number(await aw.assetUpdateAttrs(attr2, attr3)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      await aw.cleanData();
      attr3.set(asset.Tag.IS_PERSISTENT, false);
      await aw.assetAddAll(attr);
      attr2.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      attr3.set(asset.Tag.IS_PERSISTENT, true);
      attr3.set(asset.Tag.SECRET, aw.StringToArray(aw.secretList[1]));
      expect(Number(await aw.assetUpdateAttrs(attr2, attr3)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
    });
  })
}