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
import asset from '@ohos.security.asset'

export default function AssetWriteAndQueryNewTest() {
  describe('AssetWriteAndQueryNewTest', () => {
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
     * @tc.number Security_DataSecurity_Asset_WriteAndQuery_Func_0100
     * @tc. name 空数据库中，写入异常数据（过长，过短，空）
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('Security_DataSecurity_Asset_WriteAndQuery_Func_0100', 0, async () => {
      let valueType :asset.Value = asset.SyncType.NEVER;
      expect(valueType).assertEqual(0);
      expect(asset.SyncType.THIS_DEVICE).assertEqual(1);
      expect(asset.SyncType.TRUSTED_DEVICE).assertEqual(2);
      expect(asset.ErrorCode.PERMISSION_DENIED).assertEqual(201);
      expect(asset.ErrorCode.SERVICE_UNAVAILABLE).assertEqual(24000001);
      expect(asset.ErrorCode.ACCESS_DENIED).assertEqual(24000004);
      expect(asset.ErrorCode.STATUS_MISMATCH).assertEqual(24000005);
      expect(asset.ErrorCode.OUT_OF_MEMORY).assertEqual(24000006);
      expect(asset.ErrorCode.DATA_CORRUPTED).assertEqual(24000007);
      expect(asset.ErrorCode.DATABASE_ERROR).assertEqual(24000008);
      expect(asset.ErrorCode.CRYPTO_ERROR).assertEqual(24000009);
      expect(asset.ErrorCode.IPC_ERROR).assertEqual(24000010);
      expect(asset.ErrorCode.BMS_ERROR).assertEqual(24000011);
      expect(asset.ErrorCode.ACCOUNT_ERROR).assertEqual(24000012);
      expect(asset.ErrorCode.ACCESS_TOKEN_ERROR).assertEqual(24000013);
      expect(asset.ErrorCode.FILE_OPERATION_ERROR).assertEqual(24000014);
      expect(asset.ErrorCode.GET_SYSTEM_TIME_ERROR).assertEqual(24000015);
      expect(asset.ErrorCode.UNSUPPORTED).assertEqual(24000017);

      expect(Number(await aw.assetAddEasy(aw.aliasNameList[0], aw.secTooLong)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      expect(Number(await aw.assetAddEasy(aw.aliasNameList[1], aw.valueEmpty)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
    });
    /**
     * @tc.number Security_DataSecurity_Asset_WriteAndQuery_Func_0200
     * @tc. name 空数据库中，正常格式的短敏感数据写入
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('Security_DataSecurity_Asset_WriteAndQuery_Func_0200', 0, async () => {
      expect(await aw.assetAddEasy(aw.aliasNameList[0], aw.secretList[0]))
        .assertEqual(0);
      expect(await aw.assetAddEasy(aw.aliasNameList[0], aw.secretList[0]))
        .assertEqual(asset.ErrorCode.DUPLICATED);

      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.SYNC_TYPE,asset.SyncType.NEVER);
      attr.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[1]));
      attr.set(asset.Tag.SECRET, aw.StringToArray(aw.secretList[1]));
      attr.set(asset.Tag.AUTH_TYPE, asset.AuthType.NONE);
      attr.set(asset.Tag.IS_PERSISTENT, true);
      attr.set(asset.Tag.REQUIRE_PASSWORD_SET, false);
      attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_FIRST_UNLOCKED);
      expect(await aw.assetAddAttr(attr))
        .assertEqual(0);
      attr.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[2]));
      attr.set(asset.Tag.IS_PERSISTENT, false);
      attr.set(asset.Tag.REQUIRE_PASSWORD_SET, false);
      attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_UNLOCKED);
      expect(await aw.assetAddAttr(attr))
        .assertEqual(0);

    });
    /**
     * @tc.number Security_DataSecurity_Asset_WriteAndQuery_Func_0300
     * @tc. name 正常数据库中，写入异常数据（过长，过短，空）
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('Security_DataSecurity_Asset_WriteAndQuery_Func_0300', 0, async () => {
      await aw.addSome();
      expect(Number(await aw.assetAddEasy(aw.aliasNameList[0], aw.secTooLong)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      expect(Number(await aw.assetAddEasy(aw.aliasNameList[1], aw.valueEmpty)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);

    });
    /**
     * @tc.number Security_DataSecurity_Asset_WriteAndQuery_Func_0400
     * @tc. name 正常数据库中，正常格式的短敏感数据写入，精确查询，批量查询
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('Security_DataSecurity_Asset_WriteAndQuery_Func_0400', 0, async () => {
      await aw.addSome();
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      attr.set(asset.Tag.SECRET, aw.StringToArray(aw.secLong));
      attr.set(asset.Tag.DATA_LABEL_NORMAL_1, aw.StringToArray(aw.labelList[0]));
      attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_POWERED_ON);
      expect(await aw.assetAddAttr(attr))
        .assertEqual(0);
      attr.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[1]));
      attr.set(asset.Tag.SECRET, aw.StringToArray('8'));
      expect(await aw.assetAddAttr(attr))
        .assertEqual(0);
      attr.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[2]));
      attr.set(asset.Tag.SECRET, aw.StringToArray('8'));
      attr.set(asset.Tag.DATA_LABEL_NORMAL_1, aw.StringToArray(aw.labelList[1]));
      expect(await aw.assetAddAttr(attr))
        .assertEqual(0);
      let attr2: asset.AssetMap = new Map();
      attr2.set(asset.Tag.RETURN_TYPE, asset.ReturnType.ATTRIBUTES);
      expect(await aw.assetQueryNum(attr2))
        .assertEqual(4);
      attr2.set(asset.Tag.DATA_LABEL_NORMAL_1, aw.StringToArray(aw.labelList[0]));
      expect(await aw.assetQueryNum(attr2))
        .assertEqual(3);
      expect(await aw.assetQueryAll(aw.aliasNameList[0], aw.secLong))
        .assertEqual(0);
      expect(await aw.assetQueryAll(aw.aliasNameList[1], '8'))
        .assertEqual(0);
    });
    /**
     * @tc.number Security_DataSecurity_Asset_WriteAndQuery_Func_0500
     * @tc. name 写入单个关键资产时，传入异常的别名参数——超长、空
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('Security_DataSecurity_Asset_WriteAndQuery_Func_0500', 0, async () => {
      expect(Number(await aw.assetAddEasy(aw.aliasTooLong, aw.secretList[0])))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      expect(Number(await aw.assetAddEasy(aw.valueEmpty, aw.secretList[0])))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);

    });
    /**
     * @tc.number Security_DataSecurity_Asset_WriteAndQuery_Func_0600
     * @tc. name 写入单个关键资产时，传入异常的标签参数——超长、空
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('Security_DataSecurity_Asset_WriteAndQuery_Func_0600', 0, async () => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      attr.set(asset.Tag.SECRET, aw.StringToArray(aw.secretList[0]));
      attr.set(asset.Tag.DATA_LABEL_NORMAL_1, aw.StringToArray(aw.labelTooLong));
      attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_POWERED_ON);
      expect(Number(await aw.assetAddAttr(attr)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr.set(asset.Tag.DATA_LABEL_NORMAL_1, aw.StringToArray(aw.valueEmpty));
      expect(Number(await aw.assetAddAttr(attr)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);

    });
    /**
     * @tc.number Security_DataSecurity_Asset_WriteAndQuery_Func_0700
     * @tc. name 写入单个关键资产时，每个label字段都传入参数
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('Security_DataSecurity_Asset_WriteAndQuery_Func_0700', 0, async () => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      attr.set(asset.Tag.SECRET, aw.StringToArray(aw.secretList[0]));
      attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_POWERED_ON);
      attr.set(asset.Tag.DATA_LABEL_NORMAL_1, aw.StringToArray(aw.labelList[0]));
      attr.set(asset.Tag.DATA_LABEL_NORMAL_2, aw.StringToArray(aw.labelList[1]));
      attr.set(asset.Tag.DATA_LABEL_NORMAL_3, aw.StringToArray(aw.labelList[2]));
      attr.set(asset.Tag.DATA_LABEL_NORMAL_4, aw.StringToArray(aw.labelList[3]));
      attr.set(asset.Tag.DATA_LABEL_CRITICAL_1, aw.StringToArray(aw.labelList[3]));
      attr.set(asset.Tag.DATA_LABEL_CRITICAL_2, aw.StringToArray(aw.labelList[2]));
      attr.set(asset.Tag.DATA_LABEL_CRITICAL_3, aw.StringToArray(aw.labelList[1]));
      attr.set(asset.Tag.DATA_LABEL_CRITICAL_4, aw.StringToArray(aw.labelList[0]));
      expect(await aw.assetAddAttr(attr))
        .assertEqual(0);
      let attr2: asset.AssetMap = new Map();
      attr2.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      attr2.set(asset.Tag.RETURN_TYPE, asset.ReturnType.ALL);
      let ret = await aw.assetQueryEasy(attr2);
      expect(typeof ret == typeof 1).assertFalse();
      let ret0: aw.retAll = ret as aw.retAll;
      expect(ret0.alias == aw.aliasNameList[0]).assertTrue();
      expect(ret0.secret == aw.secretList[0]).assertTrue();
      expect(ret0.label1 == aw.labelList[0]).assertTrue();
      expect(ret0.label2 == aw.labelList[1]).assertTrue();
      expect(ret0.label3 == aw.labelList[2]).assertTrue();
      expect(ret0.label4 == aw.labelList[3]).assertTrue();
      expect(ret0.critical1 == aw.labelList[3]).assertTrue();
      expect(ret0.critical2 == aw.labelList[2]).assertTrue();
      expect(ret0.critical3 == aw.labelList[1]).assertTrue();
      expect(ret0.critical4 == aw.labelList[0]).assertTrue();
    });
    /**
     * @tc.number Security_DataSecurity_Asset_WriteAndQuery_Func_0800
     * @tc. name 重复写入单个关键资产时，冲突覆盖参数分别传入报错、重写和不传
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('Security_DataSecurity_Asset_WriteAndQuery_Func_0800', 0, async () => {
      await aw.assetAddEasy(aw.aliasNameList[0], aw.secretList[0]);
      expect(await aw.assetAddEasy(aw.aliasNameList[0], aw.secretList[0]))
        .assertEqual(asset.ErrorCode.DUPLICATED);
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      attr.set(asset.Tag.SECRET, aw.StringToArray(aw.secretList[1]));
      attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_POWERED_ON);
      attr.set(asset.Tag.CONFLICT_RESOLUTION, asset.ConflictResolution.THROW_ERROR);
      expect(await aw.assetAddAttr(attr))
        .assertEqual(asset.ErrorCode.DUPLICATED);
      attr.set(asset.Tag.SECRET, aw.StringToArray(aw.secretList[1]));
      attr.set(asset.Tag.CONFLICT_RESOLUTION, asset.ConflictResolution.OVERWRITE);
      expect(await aw.assetAddAttr(attr))
        .assertEqual(0);
    });
    /**
     * @tc.number Security_DataSecurity_Asset_WriteAndQuery_Func_0900
     * @tc. name 查询不存在数据失败，包含精确查询，批量查询
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('Security_DataSecurity_Asset_WriteAndQuery_Func_0900', 0, async () => {
      let attr: asset.AssetMap = new Map();
      await aw.assetAddAll(attr);
      expect(await aw.assetQueryAll('test1', 'test2'))
        .assertEqual(asset.ErrorCode.NOT_FOUND);
      let attr2: asset.AssetMap = new Map();
      attr2.set(asset.Tag.DATA_LABEL_NORMAL_1, aw.StringToArray('test3'));
      expect(await aw.assetQueryAttr(attr2))
        .assertEqual(asset.ErrorCode.NOT_FOUND);
    });
    /**
     * @tc.number Security_DataSecurity_Asset_WriteAndQuery_Func_1200
     * @tc. name 传入不同的查询接口RETURN_LIMIT字段
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('Security_DataSecurity_Asset_WriteAndQuery_Func_1200', 0, async () => {
      let attr: asset.AssetMap = new Map();
      await aw.assetAddAll(attr);
      let attr2: asset.AssetMap = new Map();
      attr2.set(asset.Tag.DATA_LABEL_NORMAL_1, aw.StringToArray(aw.labelList[0]));
      expect(await aw.assetQueryNum(attr2))
        .assertEqual(3);
      attr2.set(asset.Tag.RETURN_LIMIT, 2);
      expect(await aw.assetQueryNum(attr2))
        .assertEqual(2);
      attr2.set(asset.Tag.RETURN_LIMIT, 4);
      expect(await aw.assetQueryNum(attr2))
        .assertEqual(3);
      attr2.set(asset.Tag.RETURN_LIMIT, 0);
      expect(await aw.assetQueryNum(attr2))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
    });
    /**
     * @tc.number Security_DataSecurity_Asset_WriteAndQuery_Func_1300
     * @tc. name 查询接口的RETURN_OFFSET字段，指定的偏移量大于或者小于总条目数，或者0，或者不传
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('Security_DataSecurity_Asset_WriteAndQuery_Func_1300', 0, async () => {
      let attr: asset.AssetMap = new Map();
      await aw.assetAddAll(attr);
      let attr2: asset.AssetMap = new Map();
      attr2.set(asset.Tag.DATA_LABEL_NORMAL_1, aw.StringToArray(aw.labelList[0]));
      expect(await aw.assetQueryNum(attr2))
        .assertEqual(3);
      attr2.set(asset.Tag.RETURN_OFFSET, 2);
      expect(await aw.assetQueryNum(attr2))
        .assertEqual(1);
      attr2.set(asset.Tag.RETURN_OFFSET, 4);
      expect(await aw.assetQueryNum(attr2))
        .assertEqual(asset.ErrorCode.NOT_FOUND);
      attr2.set(asset.Tag.RETURN_OFFSET, 0);
      expect(await aw.assetQueryNum(attr2))
        .assertEqual(3);
    });
    /**
     * @tc.number Security_DataSecurity_Asset_WriteAndQuery_Func_1400
     * @tc. name 批量查询时，传入RETURN_ORDER_BY指定排序字段
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('Security_DataSecurity_Asset_WriteAndQuery_Func_1400', 0, async () => {
      let attr: asset.AssetMap = new Map();
      await aw.assetAddAll(attr);
      let attr2: asset.AssetMap = new Map();
      let re = await aw.assetQueryAttr(attr2);
      expect(aw.ArrayToString((re as asset.AssetMap[])[0].get(asset.Tag.ALIAS) as Uint8Array))
        .assertEqual(aw.aliasNameList[0]);
      expect(aw.ArrayToString((re as asset.AssetMap[])[1].get(asset.Tag.ALIAS) as Uint8Array))
        .assertEqual(aw.aliasNameList[1]);
      expect(aw.ArrayToString((re as asset.AssetMap[])[2].get(asset.Tag.ALIAS) as Uint8Array))
        .assertEqual(aw.aliasNameList[2]);
      expect(aw.ArrayToString((re as asset.AssetMap[])[3].get(asset.Tag.ALIAS) as Uint8Array))
        .assertEqual(aw.aliasNameList[3]);
      expect(aw.ArrayToString((re as asset.AssetMap[])[4].get(asset.Tag.ALIAS) as Uint8Array))
        .assertEqual(aw.aliasNameList[4]);
      attr2.set(asset.Tag.RETURN_ORDERED_BY, asset.Tag.ALIAS);
      expect(await aw.assetQueryAttr(attr2))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr2.set(asset.Tag.RETURN_ORDERED_BY, asset.Tag.DATA_LABEL_NORMAL_1);
      re = await aw.assetQueryAttr(attr2);
      expect(aw.ArrayToString((re as asset.AssetMap[])[0].get(asset.Tag.ALIAS) as Uint8Array))
        .assertEqual(aw.aliasNameList[4]);
      expect(aw.ArrayToString((re as asset.AssetMap[])[1].get(asset.Tag.ALIAS) as Uint8Array))
        .assertEqual(aw.aliasNameList[3]);
      expect(aw.ArrayToString((re as asset.AssetMap[])[2].get(asset.Tag.ALIAS) as Uint8Array))
        .assertEqual(aw.aliasNameList[0]);
      expect(aw.ArrayToString((re as asset.AssetMap[])[3].get(asset.Tag.ALIAS) as Uint8Array))
        .assertEqual(aw.aliasNameList[1]);
      expect(aw.ArrayToString((re as asset.AssetMap[])[4].get(asset.Tag.ALIAS) as Uint8Array))
        .assertEqual(aw.aliasNameList[2]);
    });
    /**
     * @tc.number Security_DataSecurity_Asset_WriteAndQuery_Func_1600
     * @tc. name 写入接口传入异常数据
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('Security_DataSecurity_Asset_WriteAndQuery_Func_1600', 0, async () => {
      let attr: asset.AssetMap = new Map();
      expect(await aw.assetAddAttr(attr))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      expect(await aw.assetAddAttr(attr))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr.delete(asset.Tag.ALIAS);
      attr.set(asset.Tag.SECRET, aw.StringToArray(aw.secretList[0]));
      expect(await aw.assetAddAttr(attr))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr.set(asset.Tag.DATA_LABEL_NORMAL_1, aw.StringToArray(aw.labelList[0]));
      expect(await aw.assetAddAttr(attr))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      attr.set(asset.Tag.RETURN_ORDERED_BY, asset.Tag.DATA_LABEL_NORMAL_1);
      expect(await aw.assetAddAttr(attr))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr.delete(asset.Tag.RETURN_ORDERED_BY);
      attr.set(asset.Tag.RETURN_TYPE, asset.ReturnType.ALL);
      expect(await aw.assetAddAttr(attr))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr.delete(asset.Tag.RETURN_TYPE);
      attr.set(asset.Tag.RETURN_LIMIT, 1);
      expect(await aw.assetAddAttr(attr))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr.delete(asset.Tag.RETURN_LIMIT);
      attr.set(asset.Tag.RETURN_OFFSET, 1);
      expect(await aw.assetAddAttr(attr))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
    });
    /**
     * @tc.number Security_DataSecurity_Asset_WriteAndQuery_Func_1700
     * @tc. name 查询接口传入异常数据
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('Security_DataSecurity_Asset_WriteAndQuery_Func_1700', 0, async () => {
      let attr: asset.AssetMap = new Map();
      await aw.assetAddAll(attr);
      let attr2: asset.AssetMap = new Map();
      attr2.set(asset.Tag.SECRET, aw.StringToArray(aw.secretList[0]));
      expect(await aw.assetQueryAttr(attr2))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr2.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      expect(await aw.assetQueryAttr(attr2))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr2.delete(asset.Tag.ALIAS);
      attr2.set(asset.Tag.DATA_LABEL_NORMAL_1, aw.StringToArray(aw.labelList[0]));
      expect(await aw.assetQueryAttr(attr2))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
    });
  })
}