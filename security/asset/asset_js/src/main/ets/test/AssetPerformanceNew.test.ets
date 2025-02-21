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


export default function AssetPerformanceNewtest() {
  describe('AssetPerformanceNewtest', () => {
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
     * @tc.number: SUB_Security_DataSecurity_Asset_Performance_0200
     * @tc.name: testPerformance0200
     * @tc.desc: 非首次写入单个关键资产时，JS API平均时延不大于120ms
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level3
     */
    it('SUB_Security_DataSecurity_Asset_Performance_0200', 0, async (done: Function) => {
      let testAlias1 = "0123456789123456".repeat(15);
      let times = 100;
      let beginTime = new Date().getTime();
      await aw.assetAddFullAll(testAlias1, times);
      let endTime = new Date().getTime();
      expect((endTime - beginTime) / times).assertLess(150);
      done();
    });

    /**
     * @tc.number: SUB_Security_DataSecurity_Asset_Performance_0400
     * @tc.name: testPerformance0400
     * @tc.desc: 非首次查询单个关键资产时，JS API平均时延不大于120ms
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level3
     */
    it('SUB_Security_DataSecurity_Asset_Performance_0400', 0, async (done: Function) => {
      let testAlias1 = "0123456789123456".repeat(15);
      let times = 100;

      await aw.assetAddFullAll(testAlias1, times);

      let attr2: asset.AssetMap = new Map();
      attr2.set(asset.Tag.RETURN_TYPE, asset.ReturnType.ALL);
      let beginTime = new Date().getTime();
      for (let i = 0; i < times; i++) {
        attr2.set(asset.Tag.ALIAS, aw.StringToArray(testAlias1 + String(i)));
        await aw.assetQueryAttr(attr2);
      }
      let endTime = new Date().getTime();
      expect((endTime - beginTime) / times).assertLess(150);

      done();
    });

    /**
     * @tc.number: SUB_Security_DataSecurity_Asset_Performance_0700
     * @tc.name: testPerformance0700
     * @tc.desc: 更新单个关键资产时，JS API平均时延不大于120ms
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level3
     */
    it('SUB_Security_DataSecurity_Asset_Performance_0700', 0, async (done: Function) => {
      let testAlias1 = "0123456789123456".repeat(15);
      let times = 100;

      await aw.assetAddFullAll(testAlias1, times);

      let attr2: asset.AssetMap = new Map();
      let attr3: asset.AssetMap = new Map();
      attr3.set(asset.Tag.SECRET, aw.StringToArray(aw.labelLong));
      let beginTime = new Date().getTime();
      for (let i = 0; i < times; i++) {
        attr2.set(asset.Tag.ALIAS, aw.StringToArray(testAlias1 + String(i)));
        await aw.assetUpdateAttrs(attr2, attr3);
      }
      let endTime = new Date().getTime();
      expect((endTime - beginTime) / times).assertLess(200);

      done();
    });

    /**
     * @tc.number: SUB_Security_DataSecurity_Asset_Performance_0800
     * @tc.name: testPerformance0800
     * @tc.desc: 删除单个关键资产时，JS API平均时延不大于50ms
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level3
     */
    it('SUB_Security_DataSecurity_Asset_Performance_0800', 0, async (done: Function) => {
      let testAlias1 = "0123456789123456".repeat(15);
      let times = 100;

      await aw.assetAddFullAll(testAlias1, times);

      let attr2: asset.AssetMap = new Map();
      let beginTime = new Date().getTime();
      for (let i = 0; i < times; i++) {
        attr2.set(asset.Tag.ALIAS, aw.StringToArray(testAlias1 + String(i)));
        await aw.assetRemoveAttr(attr2);
      }
      let endTime = new Date().getTime();
      expect((endTime - beginTime) / times).assertLess(100);

      done();
    });

    /**
     * @tc.number: SUB_Security_DataSecurity_Asset_Performance_0500
     * @tc.name: testPerformance0500
     * @tc.desc: 查询100个关键资产时，JS API平均时延不大于1500ms
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level3
     */
    it('SUB_Security_DataSecurity_Asset_Performance_0500', 0, async (done: Function) => {
      let testAlias1 = "0123456789123456".repeat(15);
      let times = 10;
      let limit = 100;

      await aw.assetAddFullAll(testAlias1, limit + 20);

      let attr2: asset.AssetMap = new Map();
      attr2.set(asset.Tag.RETURN_LIMIT, limit);
      let beginTime = new Date().getTime();
      for (let i = 0; i < times; i++) {
        await aw.assetQueryAttr(attr2);
      }
      let endTime = new Date().getTime();
      expect((endTime - beginTime) / times).assertLess(1500);

      done();
    });

    /**
     * @tc.number: SUB_Security_DataSecurity_Asset_Performance_0600
     * @tc.name: testPerformance0600
     * @tc.desc: 查询500个关键资产时，JS API平均时延不大于7500ms
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level3
     */
    it('SUB_Security_DataSecurity_Asset_Performance_0600', 0, async (done: Function) => {
      let testAlias1 = "0123456789123456".repeat(15);
      let times = 10;
      let limit = 500;

      await aw.assetAddFullAll(testAlias1, limit + 20);

      let attr2: asset.AssetMap = new Map();
      attr2.set(asset.Tag.RETURN_LIMIT, limit);
      let beginTime = new Date().getTime();
      for (let i = 0; i < times; i++) {
        await aw.assetQueryAttr(attr2);
      }
      let endTime = new Date().getTime();
      expect((endTime - beginTime) / times).assertLess(1500);

      done();
    });


  })
}

