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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import * as aw from './aw/AssetAw';
import asset from '@ohos.security.asset';

export default function abilityTest() {
  describe('AssetAuthQueryTest', () => {
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
     * @tc.number Security_DataSecurity_Asset_Authentication_Func_0600
     * @tc.name 打开超过16个session
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level4
     */
    it('Security_DataSecurity_Asset_Authentication_Func_0600', 0, async () => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.AUTH_TYPE, asset.AuthType.ANY);
      await aw.assetAddAll(attr);
      let attr2: asset.AssetMap = new Map();
      let challenges: Uint8Array[] = [];
      for (let i = 0; i < 16; i++) {
        let challenge = await aw.assetPreQuery(attr2);
        expect(challenge.toString().length).assertLarger(10);
        challenges.push(challenge as Uint8Array);
      }
      expect(await aw.assetPreQueryExpect(attr2))
        .assertEqual(asset.ErrorCode.LIMIT_EXCEEDED);
      for (let i = 0; i < 16; i++) {
        await aw.assetPostQuery(challenges.pop() as Uint8Array);
      }
    })

    /**
     * @tc.number Security_DataSecurity_Asset_Authentication_Func_0700
     * @tc.name 请求创建session时，指定0,11分钟有效期
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('Security_DataSecurity_Asset_Authentication_Func_0700', 0, async () => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.AUTH_TYPE, asset.AuthType.ANY);
      await aw.assetAddAll(attr);
      let attr2: asset.AssetMap = new Map();
      attr2.set(asset.Tag.AUTH_VALIDITY_PERIOD, 0)
      expect(await aw.assetPreQueryExpect(attr2))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      attr2.set(asset.Tag.AUTH_VALIDITY_PERIOD, 11 * 60)
      expect(await aw.assetPreQueryExpect(attr2))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
    })

    /**
     * @tc.number Security_DataSecurity_Asset_Authentication_Func_1200
     * @tc.name 二次访问控制接口传入异常参数
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('Security_DataSecurity_Asset_Authentication_Func_1200', 0, async () => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.AUTH_TYPE, asset.AuthType.ANY);
      await aw.assetAddAll(attr);

      let attr2: asset.AssetMap = new Map();
      expect(await aw.assetPreQueryExpect(attr2))
        .assertEqual(0);
      let challenge = await aw.assetPreQuery(attr2) as Uint8Array;
      challenge[1] = challenge[11];
      challenge[2] = challenge[12];
      challenge[3] = challenge[13];
      let authToken = challenge;
      attr2.set(asset.Tag.AUTH_TOKEN, authToken);
      attr2.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      expect(await aw.assetQueryAttr(attr2))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      expect(asset.TagType.BOOL).assertEqual(0x01 << 28);
      expect(asset.TagType.NUMBER).assertEqual(0x02 << 28);
      expect(asset.TagType.BYTES).assertEqual(0x03 << 28);
      expect(await aw.assetPostQuery(challenge))
        .assertEqual(0);
    })

    /**
     * @tc.number Security_DataSecurity_Asset_Authentication_Func_1600
     * @tc.name prequery与postquery接口测试正例
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('Security_DataSecurity_Asset_Authentication_Func_1600', 0, async () => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.AUTH_TYPE, asset.AuthType.ANY);
      await aw.assetAddAll(attr);
      let attr2: asset.AssetMap = new Map();
      expect(await aw.assetPreQueryExpect(attr2))
        .assertEqual(0);
      let challenge = await aw.assetPreQuery(attr2);
      expect(await aw.assetPostQuery(challenge as Uint8Array))
        .assertEqual(0);
    })

    /**
     * @tc.number Security_DataSecurity_Asset_Authentication_Func_1500
     * @tc.name 不使用二次访问控制查询需要锁屏密码的数据
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('Security_DataSecurity_Asset_Authentication_Func_1500', 0, async () => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.AUTH_TYPE, asset.AuthType.ANY);
      await aw.assetAddAll(attr);
      let attr2: asset.AssetMap = new Map();
      attr2.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]))
      expect(typeof (await aw.assetQueryAttr(attr2)) != typeof (0))
        .assertTrue();
      attr2.set(asset.Tag.RETURN_TYPE, asset.ReturnType.ALL);
      expect(await aw.assetQueryAttr(attr2))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
    })

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_LevelCtrl_Func_0100
     * @tc.name 未设置密码时，A类数据增删改查
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('SUB_Security_DataSecurity_Asset_LevelCtrl_Func_0100', 0, async () => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_UNLOCKED);
      expect(await aw.basicCRUD(attr))
        .assertEqual(0);
    })

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_LevelCtrl_Func_0200
     * @tc.name 未设置密码时，C类数据增删改查
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('SUB_Security_DataSecurity_Asset_LevelCtrl_Func_0200', 0, async () => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_FIRST_UNLOCKED);
      expect(await aw.basicCRUD(attr))
        .assertEqual(0);
    })

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_LevelCtrl_Func_0300
     * @tc.name 未设置密码时，D类数据增删改查
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('SUB_Security_DataSecurity_Asset_LevelCtrl_Func_0300', 0, async () => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_POWERED_ON);
      expect(await aw.basicCRUD(attr))
        .assertEqual(0);
    })

    /**
     * @tc.number Security_DataSecurity_Asset_Authentication_Func_1000
     * @tc.name 未设置密码时，写入与删除二次访问控制数据
     * @tc.desc test error cases
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it('Security_DataSecurity_Asset_Authentication_Func_1000', 0, async () => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, aw.StringToArray(aw.aliasNameList[0]));
      attr.set(asset.Tag.SECRET, aw.StringToArray(aw.secretList[0]));
      attr.set(asset.Tag.AUTH_TYPE, asset.AuthType.ANY);
      expect(await aw.assetAddAttr(attr))
        .assertEqual(0);
      expect(await aw.assetRemove(aw.aliasNameList[0]))
        .assertEqual(0);
    })

  })
}