/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { beforeAll, describe, expect, it, Level, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON, Component, Rect } from '@ohos.UiTest';

export default function distanceTest() {

  describe('distanceTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.number    distanceTest_001
     * @tc.name      distanceTest_001
     * @tc.desc      test distance is 200
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('distanceTest_001', Level.LEVEL1, async (done: Function) => {
      console.info('[distanceTest_001] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'DistanceTest';
      await Utils.pushPage(`distance/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('200'));
      await btn.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('test0');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[distanceTest_001] distanceTest: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('200.000000');

      let strJson2 = getInspectorByKey('test1');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[distanceTest_001] distanceTest: ' + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('0');
      console.info('[distanceTest_001] END');
      done();
    })
    /**
     * @tc.number    distanceTest_002
     * @tc.name      distanceTest_002
     * @tc.desc      test distance is 0
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('distanceTest_002', Level.LEVEL1, async (done: Function) => {
      console.info('[distanceTest_002] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'DistanceTest';
      await Utils.pushPage(`distance/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('0'));
      await btn.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('test0');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[distanceTest_002] distanceTest: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('inf');

      let strJson2 = getInspectorByKey('test1');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[distanceTest_002] distanceTest: ' + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('401');
      console.info('[distanceTest_002] END');
      done();
    })
    /**
     * @tc.number    distanceTest_003
     * @tc.name      distanceTest_003
     * @tc.desc      test distance is 50.0
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('distanceTest_003', Level.LEVEL1, async (done: Function) => {
      console.info('[distanceTest_003] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'DistanceTest';
      await Utils.pushPage(`distance/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('50.0'));
      await btn.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('test0');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[distanceTest_003] distanceTest: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('50.000000');

      let strJson2 = getInspectorByKey('test1');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[distanceTest_003] distanceTest: ' + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('0');
      console.info('[distanceTest_003] END');
      done();
    })
    /**
     * @tc.number    distanceTest_004
     * @tc.name      distanceTest_004
     * @tc.desc      test distance is nullptr
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('distanceTest_004', Level.LEVEL1, async (done: Function) => {
      console.info('[distanceTest_004] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'DistanceTest';
      await Utils.pushPage(`distance/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('nullptr'));
      await btn.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('test0');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[distanceTest_004] distanceTest: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('inf');

      let strJson2 = getInspectorByKey('test1');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[distanceTest_004] distanceTest: ' + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('401');
      console.info('[distanceTest_004] END');
      done();
    })
  })
}