/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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

export default function matrix4Test() {

  describe('matrix4Test', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.number    matrix4Test_001
     * @tc.name      matrix4Test_001
     * @tc.desc      test matrix4
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('matrix4Test_001', Level.LEVEL1, async (done: Function) => {
      console.info('[matrix4Test_001] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'Matrix4Test';
      await Utils.pushPage(`matrix4/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('1'));
      await btn.click();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('testMatrix');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[matrix4Test_001] matrix4Test: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('1.500000');
      console.info('[matrix4Test_001] END');
      done();
    })
    /**
     * @tc.number    matrix4Test_002
     * @tc.name      matrix4Test_002
     * @tc.desc      test matrix4
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('matrix4Test_002', Level.LEVEL1, async (done: Function) => {
      console.info('[matrix4Test_002] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'Matrix4Test';
      await Utils.pushPage(`matrix4/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('2'));
      await btn.click();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('testMatrix');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[matrix4Test_002] matrix4Test: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('50.500000,-20.000000,2.000000');
      console.info('[matrix4Test_002] END');
      done();
    })
    /**
     * @tc.number    matrix4Test_003
     * @tc.name      matrix4Test_003
     * @tc.desc      test matrix4
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('matrix4Test_003', Level.LEVEL1, async (done: Function) => {
      console.info('[matrix4Test_003] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'Matrix4Test';
      await Utils.pushPage(`matrix4/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('3'));
      await btn.click();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('testMatrix');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[matrix4Test_003] matrix4Test: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('2.000000,-0.500000,2.000000,10.000000,5.500000');
      console.info('[matrix4Test_003] END');
      done();
    })
    /**
     * @tc.number    matrix4Test_004
     * @tc.name      matrix4Test_004
     * @tc.desc      test matrix4
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('matrix4Test_004', Level.LEVEL1, async (done: Function) => {
      console.info('[matrix4Test_004] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'Matrix4Test';
      await Utils.pushPage(`matrix4/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('4'));
      await btn.click();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('testMatrix');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[matrix4Test_004] matrix4Test: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('2.500000,-3.000000,1.000000,5.500000,13.000000,60.000000');
      console.info('[matrix4Test_004] END');
      done();
    })
    /**
     * @tc.number    matrix4Test_005
     * @tc.name      matrix4Test_005
     * @tc.desc      test matrix4
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('matrix4Test_005', Level.LEVEL1, async (done: Function) => {
      console.info('[matrix4Test_005] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'Matrix4Test';
      await Utils.pushPage(`matrix4/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('5'));
      await btn.click();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('testMatrix');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[matrix4Test_005] matrix4Test: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('0.500000,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,' +
        '0.000000,0.000000,0.000000,2.000000,0.000000,55.000000,50.000000,120.000000,1.000000');
      console.info('[matrix4Test_005] END');
      done();
    })
    /**
     * @tc.number    matrix4Test_006
     * @tc.name      matrix4Test_006
     * @tc.desc      test matrix4
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('matrix4Test_006', Level.LEVEL1, async (done: Function) => {
      console.info('[matrix4Test_006] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'Matrix4Test';
      await Utils.pushPage(`matrix4/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('6'));
      await btn.click();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('testMatrix');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[matrix4Test_006] matrix4Test: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('2.000000,0.000000,0.000000,0.000000,0.000000,0.500000,0.000000,' +
        '0.000000,0.000000,0.000000,0.500000,0.000000,-110.000000,-25.000000,-60.000000,1.000000');
      console.info('[matrix4Test_006] END');
      done();
    })
    /**
     * @tc.number    matrix4Test_007
     * @tc.name      matrix4Test_007
     * @tc.desc      test matrix4
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('matrix4Test_007', Level.LEVEL1, async (done: Function) => {
      console.info('[matrix4Test_007] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'Matrix4Test';
      await Utils.pushPage(`matrix4/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('7'));
      await btn.click();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('testMatrix');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[matrix4Test_007] matrix4Test: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('200.000000,0.000000');
      console.info('[matrix4Test_007] END');
      done();
    })
    /**
     * @tc.number    matrix4Test_008
     * @tc.name      matrix4Test_008
     * @tc.desc      test matrix4
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('matrix4Test_008', Level.LEVEL1, async (done: Function) => {
      console.info('[matrix4Test_008] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'Matrix4Test';
      await Utils.pushPage(`matrix4/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('8'));
      await btn.click();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('testMatrix');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[matrix4Test_008] matrix4Test: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('50.000000');
      console.info('[matrix4Test_008] END');
      done();
    })
  })
}