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
import * as aw from './aw/AssetAwSync';
import asset from '@ohos.security.asset';
import deviceInfo from '@ohos.deviceInfo';


export default function AssetSynctest() {
  describe('AssetSynctest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(async () => {
      aw.cleanData();
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
     * @tc.number SUB_Security_DataSecurity_Asset_Sync_Func_0100
     * @tc.name 使用同步写入接口，传入正常参数
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('SUB_Security_DataSecurity_Asset_Sync_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(Number(aw.assetAddEasy(aw.aliasNameList[0], aw.secLong)))
        .assertEqual(0);
      expect(aw.assetQueryAll(aw.aliasNameList[0], aw.secLong))
        .assertEqual(0);
      expect(Number(aw.assetAddEasy(aw.aliasNameList[1], aw.secShort)))
        .assertEqual(0);
      expect(aw.assetQueryAll(aw.aliasNameList[1], aw.secShort))
        .assertEqual(0);
      expect(Number(aw.assetAddEasy(aw.aliasNameList[1], aw.secLong)))
        .assertEqual(asset.ErrorCode.DUPLICATED);
      expect(aw.assetQueryAll(aw.aliasNameList[1], aw.secShort))
        .assertEqual(0);

      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[1]));
      attr.set(asset.Tag.SECRET, aw.StringToArray(aw.secLong));
      attr.set(asset.Tag.DATA_LABEL_NORMAL_1, aw.StringToArray(aw.labelLong));
      attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_POWERED_ON);
      attr.set(asset.Tag.CONFLICT_RESOLUTION, asset.ConflictResolution.OVERWRITE);
      expect(aw.assetAddAttr(attr))
        .assertEqual(0);
      expect(aw.assetQueryAll(aw.aliasNameList[1], aw.secLong))
        .assertEqual(0);
      attr.set(asset.Tag.CONFLICT_RESOLUTION, asset.ConflictResolution.THROW_ERROR);
      expect(aw.assetAddAttr(attr))
        .assertEqual(asset.ErrorCode.DUPLICATED);

      let attr2: asset.AssetMap = new Map();
      attr2.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[2]));
      attr2.set(asset.Tag.SECRET, aw.StringToArray(aw.secretList[2]));
      attr2.set(asset.Tag.AUTH_TYPE, asset.AuthType.NONE);
      attr2.set(asset.Tag.IS_PERSISTENT, true);
      attr2.set(asset.Tag.REQUIRE_PASSWORD_SET, false);
      attr2.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_FIRST_UNLOCKED);
      expect(aw.assetAddAttr(attr2))
        .assertEqual(0);
      attr2.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[3]));
      attr2.set(asset.Tag.IS_PERSISTENT, false);
      attr2.set(asset.Tag.REQUIRE_PASSWORD_SET, false);
      attr2.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_UNLOCKED);
      expect(aw.assetAddAttr(attr2))
        .assertEqual(0);
    });
    /**
     * @tc.number SUB_Security_DataSecurity_Asset_Sync_Func_0600
     * @tc.name 使用同步写入接口，传入异常参数
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('SUB_Security_DataSecurity_Asset_Sync_Func_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let attr: asset.AssetMap = new Map();
      expect(aw.assetAddAttr(attr))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      expect(aw.assetAddAttr(attr))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr.delete(asset.Tag.ALIAS);
      attr.set(asset.Tag.SECRET, aw.StringToArray(aw.secretList[0]));
      expect(aw.assetAddAttr(attr))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr.delete(asset.Tag.SECRET);
      attr.set(asset.Tag.DATA_LABEL_NORMAL_1, aw.StringToArray(aw.labelList[0]));
      expect(aw.assetAddAttr(attr))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr.set(asset.Tag.SECRET, aw.StringToArray(aw.secretList[0]));
      expect(aw.assetAddAttr(attr))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      attr.set(asset.Tag.SECRET, aw.StringToArray(aw.valueEmpty));
      expect(aw.assetAddAttr(attr))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr.set(asset.Tag.SECRET, aw.StringToArray(aw.secTooLong));
      expect(aw.assetAddAttr(attr))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr.set(asset.Tag.SECRET, aw.StringToArray(aw.secretList[0]));
      attr.set(asset.Tag.DATA_LABEL_NORMAL_1, aw.StringToArray(aw.valueEmpty));
      expect(aw.assetAddAttr(attr))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr.set(asset.Tag.DATA_LABEL_NORMAL_1, aw.StringToArray(aw.labelTooLong));
      expect(aw.assetAddAttr(attr))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);

      attr.set(asset.Tag.DATA_LABEL_NORMAL_1, aw.StringToArray(aw.labelList[0]));
      attr.set(asset.Tag.RETURN_LIMIT, 1);
      attr.set(asset.Tag.RETURN_TYPE, asset.ReturnType.ALL);
      attr.set(asset.Tag.RETURN_ORDERED_BY, asset.Tag.DATA_LABEL_NORMAL_1);
      attr.set(asset.Tag.RETURN_OFFSET, 1);
      expect(aw.assetAddAttr(attr))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);

    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_Sync_Func_0200
     * @tc.name 使用同步查询接口，传入正常参数
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('SUB_Security_DataSecurity_Asset_Sync_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let attr: asset.AssetMap = new Map();
      aw.assetAddAll(attr);

      let attr2: asset.AssetMap = new Map();
      expect(aw.assetQueryNum(attr2))
        .assertEqual(5);
      expect(aw.assetQueryAll(aw.aliasNameList[0], aw.secretList[0]))
        .assertEqual(0);
      attr2.set(asset.Tag.DATA_LABEL_NORMAL_1, aw.StringToArray(aw.labelList[0]));
      expect(aw.assetQueryNum(attr2))
        .assertEqual(3);
      attr2.delete(asset.Tag.DATA_LABEL_NORMAL_1);
      attr2.set(asset.Tag.RETURN_OFFSET, 2);
      attr2.set(asset.Tag.RETURN_LIMIT, 2);
      attr2.set(asset.Tag.RETURN_ORDERED_BY, asset.Tag.DATA_LABEL_NORMAL_1);
      expect(aw.assetQueryNum(attr2))
        .assertEqual(2);
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_Sync_Func_0700
     * @tc.name 使用同步查询接口，传入异常参数
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('SUB_Security_DataSecurity_Asset_Sync_Func_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let attr: asset.AssetMap = new Map();
      aw.assetAddAll(attr);

      let attr2: asset.AssetMap = new Map();

      attr2.set(asset.Tag.SECRET, aw.StringToArray(aw.secretList[0]));
      expect(aw.assetQueryAttr(attr2))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr2.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      expect(aw.assetQueryAttr(attr2))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr2.delete(asset.Tag.ALIAS);
      attr2.set(asset.Tag.DATA_LABEL_NORMAL_1, aw.StringToArray(aw.labelList[0]));
      expect(aw.assetQueryAttr(attr2))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr2.delete(asset.Tag.DATA_LABEL_NORMAL_1);
      attr2.delete(asset.Tag.SECRET);

      attr2.set(asset.Tag.RETURN_OFFSET, 10);
      expect(aw.assetQueryAttr(attr2))
        .assertEqual(asset.ErrorCode.NOT_FOUND);
      attr2.delete(asset.Tag.RETURN_OFFSET);

      attr2.set(asset.Tag.RETURN_LIMIT, 0);
      expect(aw.assetQueryAttr(attr2))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr2.delete(asset.Tag.RETURN_LIMIT);

      attr2.set(asset.Tag.RETURN_ORDERED_BY, 0);
      expect(aw.assetQueryAttr(attr2))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_Sync_Func_0300
     * @tc.name 使用同步更新接口，传入正常参数
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('SUB_Security_DataSecurity_Asset_Sync_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let attr: asset.AssetMap = new Map();
      aw.assetAddAll(attr);

      expect(Number(aw.assetUpdateEasy(aw.aliasNameList[0], aw.secLong)))
        .assertEqual(0);
      expect(Number(aw.assetUpdateEasy(aw.aliasNameList[1], aw.secShort)))
        .assertEqual(0);
      let attr2: asset.AssetMap = new Map();
      let attr3: asset.AssetMap = new Map();
      attr2.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[2]));
      attr3.set(asset.Tag.SECRET, aw.StringToArray(aw.secLong));
      attr3.set(asset.Tag.DATA_LABEL_NORMAL_1, aw.StringToArray(aw.labelLong));
      expect(aw.assetUpdateAttrs(attr2, attr3))
        .assertEqual(0);
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_Sync_Func_0800
     * @tc.name 使用同步更新接口，传入异常参数
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('SUB_Security_DataSecurity_Asset_Sync_Func_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let attr: asset.AssetMap = new Map();
      aw.assetAddAll(attr);

      expect(Number(aw.assetUpdateEasy(aw.aliasNameList[0], aw.secTooLong)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);

      expect(Number(aw.assetUpdateEasy(aw.aliasNameList[0], aw.valueEmpty)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);

      let attr2: asset.AssetMap = new Map();
      let attr3: asset.AssetMap = new Map();
      attr2.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[2]));

      expect(aw.assetUpdateAttrs(attr2, attr3))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);

      attr3.set(asset.Tag.SECRET, aw.StringToArray(aw.updateSecret));

      attr3.set(asset.Tag.RETURN_OFFSET, 10);
      expect(aw.assetUpdateAttrs(attr2, attr3))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr3.delete(asset.Tag.RETURN_OFFSET);

      attr3.set(asset.Tag.RETURN_LIMIT, 0);
      expect(aw.assetUpdateAttrs(attr2, attr3))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr3.delete(asset.Tag.RETURN_LIMIT);

      attr3.set(asset.Tag.RETURN_ORDERED_BY, 0);
      expect(aw.assetUpdateAttrs(attr2, attr3))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);

      attr3.set(asset.Tag.RETURN_TYPE, asset.ReturnType.ALL);
      expect(aw.assetUpdateAttrs(attr2, attr3))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr3.delete(asset.Tag.RETURN_TYPE);

      attr2.delete(asset.Tag.ALIAS);
      expect(aw.assetUpdateAttrs(attr2, attr3))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr2.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[2]));

      attr2.set(asset.Tag.RETURN_OFFSET, 10);
      expect(aw.assetUpdateAttrs(attr2, attr3))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr2.delete(asset.Tag.RETURN_OFFSET);

      attr2.set(asset.Tag.RETURN_LIMIT, 0);
      expect(aw.assetUpdateAttrs(attr2, attr3))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr2.delete(asset.Tag.RETURN_LIMIT);

      attr2.set(asset.Tag.RETURN_ORDERED_BY, 0);
      expect(aw.assetUpdateAttrs(attr2, attr3))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);

      attr2.set(asset.Tag.RETURN_TYPE, asset.ReturnType.ALL);
      expect(aw.assetUpdateAttrs(attr2, attr3))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr2.delete(asset.Tag.RETURN_TYPE);
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_Sync_Func_0400
     * @tc.name 使用同步删除接口，传入正常参数
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('SUB_Security_DataSecurity_Asset_Sync_Func_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let attr: asset.AssetMap = new Map();
      aw.assetAddAll(attr);
      expect(aw.assetRemove(aw.aliasNameList[0]))
        .assertEqual(0);
      let attr2: asset.AssetMap = new Map();
      expect(aw.assetQueryNum(attr2))
        .assertEqual(4);
      attr2.set(asset.Tag.DATA_LABEL_NORMAL_1, aw.StringToArray(aw.labelList[0]));
      expect(aw.assetRemoveAttr(attr2))
        .assertEqual(0);
      attr2.delete(asset.Tag.DATA_LABEL_NORMAL_1);
      expect(aw.assetQueryNum(attr2))
        .assertEqual(2);
      expect(aw.assetRemoveAttr(attr2))
        .assertEqual(0);
      expect(aw.assetQueryNum(attr2))
        .assertEqual(asset.ErrorCode.NOT_FOUND);
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_Sync_Func_0900
     * @tc.name 使用同步删除接口，传入异常参数
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('SUB_Security_DataSecurity_Asset_Sync_Func_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let attr: asset.AssetMap = new Map();
      aw.assetAddAll(attr);
      let attr2: asset.AssetMap = new Map();
      attr2.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      attr2.set(asset.Tag.RETURN_OFFSET, 1);
      expect(aw.assetRemoveAttr(attr2))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr2.delete(asset.Tag.RETURN_OFFSET);
      attr2.set(asset.Tag.RETURN_TYPE, asset.ReturnType.ALL);
      expect(aw.assetRemoveAttr(attr2))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr2.delete(asset.Tag.RETURN_TYPE);
      attr2.set(asset.Tag.RETURN_ORDERED_BY, asset.Tag.DATA_LABEL_NORMAL_1);
      expect(aw.assetRemoveAttr(attr2))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr2.delete(asset.Tag.DATA_LABEL_NORMAL_1);
      attr2.set(asset.Tag.RETURN_LIMIT, 1);
      expect(aw.assetRemoveAttr(attr2))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr2.delete(asset.Tag.RETURN_LIMIT);
      attr2.set(asset.Tag.SECRET, aw.StringToArray(aw.secretList[0]));
      expect(aw.assetRemoveAttr(attr2))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_Sync_Func_0500
     * @tc.name 使用同步接口调用prequerySync和postQuerySync，传入正常参数
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('SUB_Security_DataSecurity_Asset_Sync_Func_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.AUTH_TYPE, asset.AuthType.ANY);
      aw.assetAddAll(attr);
      let attr2: asset.AssetMap = new Map();
      expect(aw.assetPreQueryExpect(attr2))
        .assertEqual(0);
      let challenge = aw.assetPreQuery(attr2);
      expect(aw.assetPostQuery(challenge as Uint8Array))
        .assertEqual(0);

      attr2.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      expect(aw.assetPreQueryExpect(attr2))
        .assertEqual(0);
      challenge = aw.assetPreQuery(attr2);
      expect(aw.assetPostQuery(challenge as Uint8Array))
        .assertEqual(0);

      aw.cleanData();
      attr = new Map();
      aw.assetAddAll(attr);
      attr2.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[1]));
      expect(aw.assetPreQueryExpect(attr2))
        .assertEqual(asset.ErrorCode.NOT_FOUND);
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_Sync_Func_1000
     * @tc.name 使用同步接口调用prequerySync和postQuerySync，传入异常参数
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('SUB_Security_DataSecurity_Asset_Sync_Func_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.AUTH_TYPE, asset.AuthType.ANY);
      aw.assetAddAll(attr);

      let attr0: asset.AssetMap = new Map();
      expect(aw.assetPostQueryAttr(attr0))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);

      let attr2: asset.AssetMap = new Map();
      expect(aw.assetPreQueryExpect(attr2))
        .assertEqual(0);
      let challenge = aw.assetPreQuery(attr2) as Uint8Array;
      challenge[1] = challenge[11];
      challenge[2] = challenge[12];
      challenge[3] = challenge[13];
      expect(aw.assetPostQuery(challenge))
        .assertEqual(0);

      attr2.set(asset.Tag.SECRET, aw.StringToArray(aw.secretList[0]));
      expect(aw.assetPreQueryExpect(attr2))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr2.delete(asset.Tag.SECRET);
      attr2.set(asset.Tag.RETURN_OFFSET, 1);
      expect(aw.assetPreQueryExpect(attr2))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr2.delete(asset.Tag.RETURN_OFFSET);
      attr2.set(asset.Tag.RETURN_TYPE, asset.ReturnType.ALL);
      expect(aw.assetPreQueryExpect(attr2))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr2.delete(asset.Tag.RETURN_TYPE);
      attr2.set(asset.Tag.RETURN_ORDERED_BY, asset.Tag.DATA_LABEL_NORMAL_1);
      expect(aw.assetPreQueryExpect(attr2))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr2.delete(asset.Tag.DATA_LABEL_NORMAL_1);
      attr2.set(asset.Tag.RETURN_LIMIT, 1);
      expect(aw.assetPreQueryExpect(attr2))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
    });

  })
}

