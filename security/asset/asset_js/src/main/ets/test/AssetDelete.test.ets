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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import * as aw from './aw/AssetAw';
//import { asset } from '@kit.AssetStoreKit';

import asset from '@ohos.security.asset'

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
     * @tc.number Security_DataSecurity_Asset_Remove_Func_0200
     * @tc. name 使用接口销毁数据后，数据被删除
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('Security_DataSecurity_Asset_Remove_Func_0200', 0, async () => {
      let attr: asset.AssetMap = new Map();
      await aw.assetAddAll(attr);
      expect(await aw.assetRemove(aw.aliasNameList[0]))
        .assertEqual(0);
      let attr2: asset.AssetMap = new Map();
      expect(await aw.assetQueryNum(attr2))
        .assertEqual(4);
      attr2.set(asset.Tag.DATA_LABEL_NORMAL_1, aw.StringToArray(aw.labelList[0]));
      expect(await aw.assetRemoveAttr(attr2))
        .assertEqual(0);
      attr2.delete(asset.Tag.DATA_LABEL_NORMAL_1);
      expect(await aw.assetQueryNum(attr2))
        .assertEqual(2);
      expect(await aw.assetRemoveAttr(attr2))
        .assertEqual(0);
      expect(await aw.assetQueryNum(attr2))
        .assertEqual(asset.ErrorCode.NOT_FOUND);
    });
    /**
     * @tc.number Security_DataSecurity_Asset_Remove_Func_0900
     * @tc. name 数据删除后，相同数据能再次写入
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('Security_DataSecurity_Asset_Remove_Func_0900', 0, async () => {
      let attr: asset.AssetMap = new Map();
      await aw.assetAddAll(attr);
      await aw.assetRemove(aw.aliasNameList[0]);
      expect(await aw.assetAddEasy(aw.aliasNameList[0], aw.secretList[0]))
        .assertEqual(0);
    });
    /**
     * @tc.number Security_DataSecurity_Asset_Remove_Func_1000
     * @tc. name 删除接口传入异常数据
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('Security_DataSecurity_Asset_Remove_Func_1000', 0, async () => {
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
     * @tc.number Security_DataSecurity_Asset_Remove_Func_1500
     * @tc. name 通过更新接口修改卸载后不删除的参数
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('Security_DataSecurity_Asset_Remove_Func_1500', 0, async () => {
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