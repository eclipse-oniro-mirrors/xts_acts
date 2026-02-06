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
import * as awUserid from './aw/AssetAwUserid';
import asset from '@ohos.security.asset';

export default function abilityTest() {
  describe('AssetNorightTest', () => {
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
     * @tc.name   Security_DataSecurity_Asset_Remove_Func_0200
     * @tc.number Security_DataSecurity_Asset_Remove_Func_0200
     * @tc.desc   使用接口销毁数据后，数据被删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_DataSecurity_Asset_Remove_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
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
     * @tc.name   Security_DataSecurity_Asset_Remove_Func_0900
     * @tc.number Security_DataSecurity_Asset_Remove_Func_0900
     * @tc.desc   数据删除后，相同数据能再次写入
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_DataSecurity_Asset_Remove_Func_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let attr: asset.AssetMap = new Map();
      await aw.assetAddAll(attr);
      await aw.assetRemove(aw.aliasNameList[0]);
      expect(await aw.assetAddEasy(aw.aliasNameList[0], aw.secretList[0]))
        .assertEqual(0);
    });

    /**
     * @tc.name   SUB_Security_DataSecurity_Asset_Remove_Func_1200
     * @tc.number SUB_Security_DataSecurity_Asset_Remove_Func_1200
     * @tc.desc   未申请权限时，增删改查卸载后不删除的数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_DataSecurity_Asset_Remove_Func_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      attr.set(asset.Tag.IS_PERSISTENT, true);
      expect(await aw.assetAddFull(attr))
        .assertEqual(asset.ErrorCode.PERMISSION_DENIED);
    });

    /**
     * @tc.name   SUB_Security_DataSecurity_Asset_AsUserId_Func_1000
     * @tc.number SUB_Security_DataSecurity_Asset_AsUserId_Func_1000
     * @tc.desc   未申请权限的普通应用，指定前台用户，调用asset接口失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_DataSecurity_Asset_AsUserId_Func_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await aw.assetAddEasy(aw.aliasNameList[0], aw.secretList[0]);
      expect(await awUserid.assetAddEasy(aw.aliasNameList[1], aw.secretList[0]))
        .assertEqual(asset.ErrorCode.NOT_SYSTEM_APPLICATION);
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      expect(await awUserid.assetQueryAttr(attr))
        .assertEqual(asset.ErrorCode.NOT_SYSTEM_APPLICATION);
      expect(await awUserid.assetUpdateEasy(aw.aliasNameList[0], aw.secretList[0]))
        .assertEqual(asset.ErrorCode.NOT_SYSTEM_APPLICATION);
      expect(await awUserid.assetRemoveAttr(attr))
        .assertEqual(asset.ErrorCode.NOT_SYSTEM_APPLICATION);
      expect(await awUserid.assetPreQuery(attr))
        .assertEqual(asset.ErrorCode.NOT_SYSTEM_APPLICATION);
      expect(await awUserid.assetPostQuery(aw.StringToArray(aw.fakeChallenge)))
        .assertEqual(asset.ErrorCode.NOT_SYSTEM_APPLICATION);
      done();
    });

    /**
     * @tc.name   SUB_Security_DataSecurity_Asset_CE_Func_0100
     * @tc.number SUB_Security_DataSecurity_Asset_CE_Func_0100
     * @tc.desc   设置CE保护的数据增删改查成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_DataSecurity_Asset_CE_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, true);
      expect(await aw.basicCRUDCE(attr))
        .assertEqual(0);
      let attr2: asset.AssetMap = new Map();
      attr.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, false);
      expect(await aw.basicCRUD(attr2))
        .assertEqual(0);
      done();
    });

  })
}