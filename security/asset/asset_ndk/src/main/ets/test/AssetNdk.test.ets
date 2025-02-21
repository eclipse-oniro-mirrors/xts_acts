/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';

import * as aw from './aw/AssetAwNdk';
import asset from '@ohos.security.asset';
import myAssetNdk from 'libassetNdkTest.so';


export default function AssetNdkTest() {
  describe('ActsAssetNdkTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      myAssetNdk.asset_removeAll();
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
     * @tc.number :SUB_Security_DataSecurity_Asset_NDK_Func_0100
     * @tc.name  :assetAddNormal
     * @tc.desc  :test error cases
     * @tc.size  :Medium
     * @tc.type  :Func
     * @tc.level  :Level3
     */
    it('SUB_Security_DataSecurity_Asset_NDK_Func_0100', 0, () => {
      expect(myAssetNdk.asset_add(aw.aliasLong, aw.secLong))
        .assertEqual(0);
      expect(myAssetNdk.asset_queryAll(aw.aliasLong, aw.secLong))
        .assertEqual(aw.assetQueryTrue);
      expect(myAssetNdk.asset_add(aw.aliasNameList[1], aw.secShort))
        .assertEqual(0);
      expect(myAssetNdk.asset_queryAll(aw.aliasNameList[1], aw.secShort))
        .assertEqual(aw.assetQueryTrue);
      expect(myAssetNdk.asset_add(aw.aliasNameList[1], aw.secLong))
        .assertEqual(asset.ErrorCode.DUPLICATED);
      expect(myAssetNdk.asset_queryAll(aw.aliasNameList[1], aw.secShort))
        .assertEqual(aw.assetQueryTrue);
      expect(myAssetNdk.asset_queryNum(2))
        .assertEqual(aw.assetQueryTrue);
    })

    /**
     * @tc.number  :SUB_Security_DataSecurity_Asset_NDK_Func_0600
     * @tc.name  :assetAddError
     * @tc.desc  :test error cases
     * @tc.size  :Medium
     * @tc.type  :Func
     * @tc.level  :Level3
     */
    it('SUB_Security_DataSecurity_Asset_NDK_Func_0600', 0, () => {
      expect(myAssetNdk.asset_add('', ''))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      expect(myAssetNdk.asset_add(aw.aliasNameList[0], ''))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      expect(myAssetNdk.asset_add('', aw.secLong))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      expect(myAssetNdk.asset_add(aw.aliasNameList[0], aw.secTooLong))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      expect(myAssetNdk.asset_add(aw.aliasTooLong, aw.secLong))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      expect(myAssetNdk.asset_queryNum(0))
        .assertEqual(asset.ErrorCode.NOT_FOUND);

    })

    /**
     * @tc.number  :SUB_Security_DataSecurity_Asset_NDK_Func_0200
     * @tc.name  :assetQueryNormal
     * @tc.desc  :test error cases
     * @tc.size  :Medium
     * @tc.type  :Func
     * @tc.level  :Level3
     */
    it('SUB_Security_DataSecurity_Asset_NDK_Func_0200', 0, async () => {
      let attr: asset.AssetMap = new Map();
      await aw.assetAddAll(attr);
      expect(myAssetNdk.asset_queryNum(5))
        .assertEqual(aw.assetQueryTrue);
      expect(myAssetNdk.asset_queryAll(aw.aliasNameList[0], aw.secretList[0]))
        .assertEqual(aw.assetQueryTrue);
      expect(myAssetNdk.asset_queryLabel(aw.labelList[0], 3))
        .assertEqual(aw.assetQueryTrue);
      expect(myAssetNdk.asset_queryOption(2, 1, asset.Tag.DATA_LABEL_NORMAL_1, 2))
        .assertEqual(aw.assetQueryTrue);

    })

    /**
     * @tc.number  :SUB_Security_DataSecurity_Asset_NDK_Func_0700
     * @tc.name  :assetQueryError
     * @tc.desc  :test error cases
     * @tc.size  :Medium
     * @tc.type  :Func
     * @tc.level  :Level3
     */
    it('SUB_Security_DataSecurity_Asset_NDK_Func_0700', 0, async () => {
      let attr: asset.AssetMap = new Map();
      await aw.assetAddAll(attr);
      expect(myAssetNdk.asset_queryError(aw.aliasNameList[0], aw.secretList[0]))
        .assertEqual(aw.assetQueryTrue);
    })

    /**
     * @tc.number  :SUB_Security_DataSecurity_Asset_NDK_Func_0300
     * @tc.name  :assetUpdateNormal
     * @tc.desc  :test error cases
     * @tc.size  :Medium
     * @tc.type  :Func
     * @tc.level  :Level3
     */
    it('SUB_Security_DataSecurity_Asset_NDK_Func_0300', 0, async () => {
      let attr: asset.AssetMap = new Map();
      await aw.assetAddAll(attr);

      expect(Number(myAssetNdk.asset_updateEasy(aw.aliasNameList[0], aw.secLong)))
        .assertEqual(0);
      expect(Number(myAssetNdk.asset_updateEasy(aw.aliasNameList[1], aw.secShort)))
        .assertEqual(0);
      expect(myAssetNdk.asset_updateLabel(aw.aliasNameList[2], aw.secLong, aw.labelLong))
        .assertEqual(0);

    })

    /**
     * @tc.number  :SUB_Security_DataSecurity_Asset_NDK_Func_0800
     * @tc.name  :assetUpdateError
     * @tc.desc  :test error cases
     * @tc.size  :Medium
     * @tc.type  :Func
     * @tc.level  :Level3
     */
    it('SUB_Security_DataSecurity_Asset_NDK_Func_0800', 0, async () => {
      let attr: asset.AssetMap = new Map();
      await aw.assetAddAll(attr);

      expect(Number(myAssetNdk.asset_updateEasy(aw.aliasNameList[0], aw.secTooLong)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      expect(Number(myAssetNdk.asset_updateEasy(aw.aliasNameList[1], aw.valueEmpty)))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);
      expect(myAssetNdk.asset_updateLabel(aw.aliasNameList[2], aw.secLong, aw.labelTooLong))
        .assertEqual(asset.ErrorCode.INVALID_ARGUMENT);

      expect(myAssetNdk.asset_updateError(aw.aliasNameList[0], aw.secretList[0]))
        .assertEqual(aw.assetQueryTrue);
    })

    /**
     * @tc.number  :SUB_Security_DataSecurity_Asset_NDK_Func_0400
     * @tc.name  :assetDeleteNormal
     * @tc.desc  :test error cases
     * @tc.size  :Medium
     * @tc.type  :Func
     * @tc.level  :Level3
     */
    it('SUB_Security_DataSecurity_Asset_NDK_Func_0400', 0, async () => {
      let attr: asset.AssetMap = new Map();
      await aw.assetAddAll(attr);

      expect(Number(myAssetNdk.asset_remove(aw.aliasNameList[0])))
        .assertEqual(0);
      expect(Number(myAssetNdk.asset_removeLabel(aw.labelList[0])))
        .assertEqual(0);
      expect(Number(myAssetNdk.asset_removeAll()))
        .assertEqual(0);
    })

    /**
     * @tc.number  :SUB_Security_DataSecurity_Asset_NDK_Func_0900
     * @tc.name  :assetDeleteError
     * @tc.desc  :test error cases
     * @tc.size  :Medium
     * @tc.type  :Func
     * @tc.level  :Level3
     */
    it('SUB_Security_DataSecurity_Asset_NDK_Func_0900', 0, async () => {
      let attr: asset.AssetMap = new Map();
      await aw.assetAddAll(attr);
      expect(myAssetNdk.asset_removeError(aw.aliasNameList[0], aw.secretList[0]))
        .assertEqual(aw.assetQueryTrue);
    })

    /**
     * @tc.number  :SUB_Security_DataSecurity_Asset_NDK_Func_0500
     * @tc.name  :assetPreAndPostQueryNormal
     * @tc.desc  :test error cases
     * @tc.size  :Medium
     * @tc.type  :Func
     * @tc.level  :Level3
     */
    it('SUB_Security_DataSecurity_Asset_NDK_Func_0500', 0, async () => {
      let attr: asset.AssetMap = new Map();
      await aw.assetAddAllAuth(attr);
      expect(myAssetNdk.asset_preAndPostQueryNormal(aw.aliasNameList[0], aw.aliasNameList[1]))
        .assertEqual(aw.assetQueryTrue);

    })

    /**
     * @tc.number  :SUB_Security_DataSecurity_Asset_NDK_Func_1000
     * @tc.name  :assetPreAndPostQueryError
     * @tc.desc  :test error cases
     * @tc.size  :Medium
     * @tc.type  :Func
     * @tc.level  :Level3
     */
    it('SUB_Security_DataSecurity_Asset_NDK_Func_1000', 0, async () => {
      let attr: asset.AssetMap = new Map();
      await aw.assetAddAllAuth(attr);
      expect(myAssetNdk.asset_preAndPostQueryError(aw.aliasNameList[0], aw.secretList[0]))
        .assertEqual(aw.assetQueryTrue);
    })

  })
}