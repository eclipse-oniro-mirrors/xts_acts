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

export default function AssetOthers() {
  describe('AssetOthers', () => {
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
     * @tc.number     : SUB_Security_DataSecurity_Asset_AsUserId_Func_0800
     * @tc.name       : testAsUseridNoRight800
     * @tc.desc       : 未申请权限的系统应用，指定前台用户，调用asset接口失败
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_Security_DataSecurity_Asset_AsUserId_Func_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await aw.assetAddEasy(aw.aliasNameList[0], aw.secretList[0]);
      expect(await awUserid.assetAddEasy(aw.aliasNameList[1], aw.secretList[0]))
        .assertEqual(asset.ErrorCode.PERMISSION_DENIED);
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      expect(await awUserid.assetQueryAttr(attr))
        .assertEqual(asset.ErrorCode.PERMISSION_DENIED);
      expect(await awUserid.assetUpdateEasy(aw.aliasNameList[0], aw.secretList[0]))
        .assertEqual(asset.ErrorCode.PERMISSION_DENIED);
      expect(await awUserid.assetRemoveAttr(attr))
        .assertEqual(asset.ErrorCode.PERMISSION_DENIED);
      expect(await awUserid.assetPreQuery(attr))
        .assertEqual(asset.ErrorCode.PERMISSION_DENIED);
      expect(await awUserid.assetPostQuery(aw.StringToArray(aw.fakeChallenge)))
        .assertEqual(asset.ErrorCode.PERMISSION_DENIED);
      done();
    });
    /**
     * @tc.number     : SUB_Security_DataSecurity_Asset_Database_Func_0500
     * @tc.name       : testDatabase0500
     * @tc.desc       : 新asset数据，所有label都能写入2k数据，并且查询成功
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_Security_DataSecurity_Asset_Database_Func_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      attr.set(asset.Tag.SECRET, aw.StringToArray(aw.secretList[0]));
      attr.set(asset.Tag.DATA_LABEL_NORMAL_1, aw.StringToArray(aw.string2k));
      attr.set(asset.Tag.DATA_LABEL_NORMAL_2, aw.StringToArray(aw.string2k));
      attr.set(asset.Tag.DATA_LABEL_NORMAL_3, aw.StringToArray(aw.string2k));
      attr.set(asset.Tag.DATA_LABEL_NORMAL_4, aw.StringToArray(aw.string2k));
      attr.set(asset.Tag.DATA_LABEL_CRITICAL_1, aw.StringToArray(aw.string2k));
      attr.set(asset.Tag.DATA_LABEL_CRITICAL_2, aw.StringToArray(aw.string2k));
      attr.set(asset.Tag.DATA_LABEL_CRITICAL_3, aw.StringToArray(aw.string2k));
      attr.set(asset.Tag.DATA_LABEL_CRITICAL_4, aw.StringToArray(aw.string2k));
      attr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_1, aw.StringToArray(aw.string2k));
      attr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_2, aw.StringToArray(aw.string2k));
      attr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_3, aw.StringToArray(aw.string2k));
      attr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_4, aw.StringToArray(aw.string2k));

      expect(await aw.assetAddAttr(attr))
        .assertEqual(0);
      let attr2: asset.AssetMap = new Map();
      attr2.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      attr2.set(asset.Tag.RETURN_TYPE, asset.ReturnType.ALL);
      let ret = await aw.assetQueryEasy(attr2);
      expect(typeof ret == typeof 1).assertFalse();
      ret = await aw.assetQueryAttr(attr2);
      let attr3 = (ret as asset.AssetMap[])[0] as asset.AssetMap;
      expect(aw.ArrayToString(attr3.get(asset.Tag.DATA_LABEL_NORMAL_1) as Uint8Array)).assertEqual(aw.string2k);
      expect(aw.ArrayToString(attr3.get(asset.Tag.DATA_LABEL_NORMAL_2) as Uint8Array)).assertEqual(aw.string2k);
      expect(aw.ArrayToString(attr3.get(asset.Tag.DATA_LABEL_NORMAL_3) as Uint8Array)).assertEqual(aw.string2k);
      expect(aw.ArrayToString(attr3.get(asset.Tag.DATA_LABEL_NORMAL_4) as Uint8Array)).assertEqual(aw.string2k);
      expect(aw.ArrayToString(attr3.get(asset.Tag.DATA_LABEL_CRITICAL_1) as Uint8Array)).assertEqual(aw.string2k);
      expect(aw.ArrayToString(attr3.get(asset.Tag.DATA_LABEL_CRITICAL_2) as Uint8Array)).assertEqual(aw.string2k);
      expect(aw.ArrayToString(attr3.get(asset.Tag.DATA_LABEL_CRITICAL_3) as Uint8Array)).assertEqual(aw.string2k);
      expect(aw.ArrayToString(attr3.get(asset.Tag.DATA_LABEL_CRITICAL_4) as Uint8Array)).assertEqual(aw.string2k);
      expect(aw.ArrayToString(attr3.get(asset.Tag.DATA_LABEL_NORMAL_LOCAL_1) as Uint8Array)).assertEqual(aw.string2k);
      expect(aw.ArrayToString(attr3.get(asset.Tag.DATA_LABEL_NORMAL_LOCAL_2) as Uint8Array)).assertEqual(aw.string2k);
      expect(aw.ArrayToString(attr3.get(asset.Tag.DATA_LABEL_NORMAL_LOCAL_3) as Uint8Array)).assertEqual(aw.string2k);
      expect(aw.ArrayToString(attr3.get(asset.Tag.DATA_LABEL_NORMAL_LOCAL_4) as Uint8Array)).assertEqual(aw.string2k);
      done();
    });

    /**
     * @tc.number     : SUB_Security_DataSecurity_Asset_Database_Func_0400
     * @tc.name       : testDatabase0500
     * @tc.desc       : 新增和更新asset数据后，查询返回新增/更新时间
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_Security_DataSecurity_Asset_Database_Func_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await aw.assetAddEasy(aw.aliasNameList[0], aw.secretList[0]);
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      attr.set(asset.Tag.RETURN_TYPE, asset.ReturnType.ALL);
      let ret = await aw.assetQueryAttr(attr);
      let attr0 = (ret as asset.AssetMap[])[0] as asset.AssetMap;
      let time1 = aw.ArrayToString(attr0.get(asset.Tag.UPDATE_TIME) as Uint8Array);
      await aw.assetUpdateEasy(aw.aliasNameList[0],aw.updateSecret)
      ret = await aw.assetQueryAttr(attr);
      attr0 = (ret as asset.AssetMap[])[0] as asset.AssetMap;
      let time2 = aw.ArrayToString(attr0.get(asset.Tag.UPDATE_TIME) as Uint8Array);
      expect(Number(time1) > 1).assertTrue();
      expect(Number(time2) > 1).assertTrue();
      expect((Number(time2)-Number(time1)) > 1).assertTrue();
      done();
    });

    /**
     * @tc.number     : SUB_Security_DataSecurity_Asset_Database_Func_0200
     * @tc.name       : testDatabase0600
     * @tc.desc       : 新增的仅本地存储字段能写入、更新、查询
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_Security_DataSecurity_Asset_Database_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      attr.set(asset.Tag.SECRET, aw.StringToArray(aw.secretList[0]));
      attr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_1, aw.StringToArray(aw.string2k));
      attr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_2, aw.StringToArray(aw.string2k));
      attr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_3, aw.StringToArray(aw.string2k));
      attr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_4, aw.StringToArray(aw.string2k));
      expect(await aw.assetAddAttr(attr))
        .assertEqual(0);
      let attr2: asset.AssetMap = new Map();
      attr2.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      let attr3: asset.AssetMap = new Map();
      attr3.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_1, aw.StringToArray(aw.updateSecret));
      attr3.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_2, aw.StringToArray(aw.updateSecret));
      attr3.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_3, aw.StringToArray(aw.updateSecret));
      attr3.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_4, aw.StringToArray(aw.updateSecret));
      expect(await aw.assetUpdateAttrs(attr2,attr3))
        .assertEqual(0);
      let attr4: asset.AssetMap = new Map();
      attr4.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      attr4.set(asset.Tag.RETURN_TYPE, asset.ReturnType.ALL);
      let ret = await aw.assetQueryAttr(attr2);
      let attr0 = (ret as asset.AssetMap[])[0] as asset.AssetMap;
      expect(aw.ArrayToString(attr0.get(asset.Tag.DATA_LABEL_NORMAL_LOCAL_1) as Uint8Array)).assertEqual(aw.updateSecret);
      expect(aw.ArrayToString(attr0.get(asset.Tag.DATA_LABEL_NORMAL_LOCAL_2) as Uint8Array)).assertEqual(aw.updateSecret);
      expect(aw.ArrayToString(attr0.get(asset.Tag.DATA_LABEL_NORMAL_LOCAL_3) as Uint8Array)).assertEqual(aw.updateSecret);
      expect(aw.ArrayToString(attr0.get(asset.Tag.DATA_LABEL_NORMAL_LOCAL_4) as Uint8Array)).assertEqual(aw.updateSecret);
      done();
    });

    /**
     * @tc.number     : SUB_Security_DataSecurity_Asset_JS_Func_0100
     * @tc.name       : testJSFunc0100
     * @tc.desc       : js接口枚举值检查测试
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_Security_DataSecurity_Asset_JS_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      let valueType: asset.Value = asset.SyncType.NEVER;
      expect(valueType).assertEqual(0);
      try{
        attr.set(asset.Tag.SYNC_TYPE,asset.SyncType.TRUSTED_ACCOUNT);
        attr.set(asset.Tag.OPERATION_TYPE,asset.OperationType.NEED_LOGOUT);
        expect(asset.SyncType.NEVER).assertEqual(0);
        expect(asset.SyncType.THIS_DEVICE).assertEqual(1);
        expect(asset.SyncType.TRUSTED_DEVICE).assertEqual(2);
        expect(asset.SyncType.TRUSTED_ACCOUNT).assertEqual(4);
        expect(asset.OperationType.NEED_SYNC).assertEqual(0);
        expect(asset.OperationType.NEED_LOGOUT).assertEqual(1);
        expect(asset.Tag.WRAP_TYPE).assertEqual(asset.TagType.NUMBER | 0x49);
        expect(asset.Tag.GROUP_ID).assertEqual(asset.TagType.BYTES | 0x48);
        expect(asset.WrapType.NEVER).assertEqual(0);
        expect(asset.WrapType.TRUSTED_ACCOUNT).assertEqual(1);
      }catch(e) {
          aw.assetLog(e);
      }
      expect(asset.ErrorCode.PERMISSION_DENIED).assertEqual(201);
      expect(asset.ErrorCode.NOT_SYSTEM_APPLICATION).assertEqual(202);
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
      done();
    });

  })
}

