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
import { Driver, ON } from '@ohos.UiTest';

export default function clipShapeTest() {

  describe('ClipShapeTest', () => {

    let PAGE_TAG = 'ClipShapeTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`clipShape/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   clipShape_0010
     * @tc.number clipShape_0010
     * @tc.desc   To set the offset position for a component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('clipShape_0010', Level.LEVEL1, async (done: Function) => {
      console.info('[clipShape_0010] START');
      let driver: Driver = Driver.create();
      let targetButton = await driver.findComponent(ON.id('ButtonClipShape1'));
      await targetButton.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('TextClipShape');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[clipShape_0010] clip: ' + obj1.$attrs.clip);
      expect(obj1.$attrs.clip).assertEqual('{\"shape\":"\Rect\"}');
      console.info('[clipShape_0010] END');
      done();
      });

    /**
     * @tc.name   clipShape_0020
     * @tc.number clipShape_0020
     * @tc.desc   To set the offset position for a component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('clipShape_0020', Level.LEVEL1, async (done: Function) => {
      console.info('[clipShape_0020] START');
      let driver: Driver = Driver.create();
      let targetButton = await driver.findComponent(ON.id('ButtonClipShape2'));
      await targetButton.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('TextClipShape');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[clipShape_0020] clip: ' + obj1.$attrs.clip);
      expect(obj1.$attrs.clip).assertEqual('{\"shape\":\"Rect\"}');
      console.info('[clipShape_0020] END');
      done();
      });

    /**
     * @tc.name   clipShape_0030
     * @tc.number clipShape_0030
     * @tc.desc   To set the offset position for a component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('clipShape_0030', Level.LEVEL1, async (done: Function) => {
      console.info('[clipShape_0030] START');
      let driver: Driver = Driver.create();
      let targetButton = await driver.findComponent(ON.id('ButtonClipShape3'));
      await targetButton.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('TextClipShape');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[clipShape_0030] clip: ' + obj1.$attrs.clip);
      expect(obj1.$attrs.clip).assertEqual('{\"shape\":\"Circle\"}');
      console.info('[clipShape_0030] END');
      done();
      });

    /**
     * @tc.name   clipShape_0040
     * @tc.number clipShape_0040
     * @tc.desc   To set the offset position for a component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('clipShape_0040', Level.LEVEL1, async (done: Function) => {
      console.info('[clipShape_0040] START');
      let driver: Driver = Driver.create();
      let targetButton = await driver.findComponent(ON.id('ButtonClipShape4'));
      await targetButton.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('TextClipShape');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[clipShape_0040] clip: ' + obj1.$attrs.clip);
      expect(obj1.$attrs.clip).assertEqual('{\"shape\":\"Ellipse\"}');
      console.info('[clipShape_0040] END');
      done();
      });

    /**
     * @tc.name   clipShape_0050
     * @tc.number clipShape_0050
     * @tc.desc   To set the offset position for a component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('clipShape_0050', Level.LEVEL1, async (done: Function) => {
      console.info('[clipShape_0050] START');
      let driver: Driver = Driver.create();
      let targetButton = await driver.findComponent(ON.id('ButtonClipShape5'));
      await targetButton.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('TextClipShape');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[clipShape_0050] clip: ' + obj1.$attrs.clip);
      expect(obj1.$attrs.clip).assertEqual('{\"shape\":\"Ellipse\"}');
      console.info('[clipShape_0050] END');
      done();
      });

      /**
     * @tc.name   clipShape_0060
     * @tc.number clipShape_0060
     * @tc.desc   To set the offset position for a component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('clipShape_0060', Level.LEVEL1, async (done: Function) => {
      console.info('[clipShape_0060] START');
      let driver: Driver = Driver.create();
      let targetButton = await driver.findComponent(ON.id('ButtonClipShape6'));
      await targetButton.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('TextClipShape');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[clipShape_0060] clip: ' + obj1.$attrs.clip);
      expect(obj1.$attrs.clip).assertEqual('{\"shape\":"\Rect\"}');
      console.info('[clipShape_0060] END');
      done();
      });

       /**
     * @tc.name   clipShape_0070
     * @tc.number clipShape_0070
     * @tc.desc   To set the offset position for a component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('clipShape_0070', Level.LEVEL1, async (done: Function) => {
      console.info('[clipShape_0070] START');
      let driver: Driver = Driver.create();
      let targetButton = await driver.findComponent(ON.id('ButtonClipShape7'));
      await targetButton.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('TextClipShape');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[clipShape_0070] clip: ' + obj1.$attrs.clip);
      expect(obj1.$attrs.clip).assertEqual('{\"shape\":"\Rect\"}');
      console.info('[clipShape_0070] END');
      done();
      });

     /**
     * @tc.name   clipShape_0080
     * @tc.number clipShape_0080
     * @tc.desc   To set the offset position for a component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('clipShape_0080', Level.LEVEL1, async (done: Function) => {
      console.info('[clipShape_0080] START');
      let driver: Driver = Driver.create();
      let targetButton = await driver.findComponent(ON.id('ButtonClipShape8'));
      await targetButton.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('TextClipShape');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[clipShape_0080] clip: ' + obj1.$attrs.clip);
      expect(obj1.$attrs.clip).assertEqual('{\"shape\":"\Circle\"}');
      console.info('[clipShape_0080] END');
      done();
      });


     /**
     * @tc.name   clipShape_0090
     * @tc.number clipShape_0090
     * @tc.desc   To set the offset position for a component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('clipShape_0090', Level.LEVEL1, async (done: Function) => {
      console.info('[clipShape_0090] START');
      let driver: Driver = Driver.create();
      let targetButton = await driver.findComponent(ON.id('ButtonClipShape9'));
      await targetButton.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('TextClipShape');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[clipShape_0090] clip: ' + obj1.$attrs.clip);
      expect(obj1.$attrs.clip).assertEqual('{\"shape\":"\Circle\"}');
      console.info('[clipShape_0090] END');
      done();
      });
      /**
     * @tc.name   clipShape_00100
     * @tc.number clipShape_00100
     * @tc.desc   To set the offset position for a component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('clipShape_00100', Level.LEVEL1, async (done: Function) => {
      console.info('[clipShape_00100] START');
      let driver: Driver = Driver.create();
      let targetButton = await driver.findComponent(ON.id('ButtonClipShape10'));
      await targetButton.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('TextClipShape');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[clipShape_00100] clip: ' + obj1.$attrs.clip);
      expect(obj1.$attrs.clip).assertEqual('{\"shape\":\"Rect\"}');
      console.info('[clipShape_00100] END');
      done();
      });
      /**
     * @tc.name   clipShape_00110
     * @tc.number clipShape_00110
     * @tc.desc   To set the offset position for a component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('clipShape_00110', Level.LEVEL1, async (done: Function) => {
      console.info('[clipShape_00110] START');
      let driver: Driver = Driver.create();
      let targetButton = await driver.findComponent(ON.id('ButtonClipShape11'));
      await targetButton.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('TextClipShape');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[clipShape_00110] clip: ' + obj1.$attrs.clip);
      expect(obj1.$attrs.clip).assertEqual('{\"shape\":\"Rect\"}');
      console.info('[clipShape_00110] END');
      done();
      });
      /**
     * @tc.name   clipShape_00120
     * @tc.number clipShape_00120
     * @tc.desc   To set the offset position for a component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('clipShape_00120', Level.LEVEL1, async (done: Function) => {
      console.info('[clipShape_00120] START');
      let driver: Driver = Driver.create();
      let targetButton = await driver.findComponent(ON.id('ButtonClipShape12'));
      await targetButton.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('TextClipShape');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[clipShape_00120] clip: ' + obj1.$attrs.clip);
      expect(obj1.$attrs.clip).assertEqual('{\"shape\":\"Ellipse\"}');
      console.info('[clipShape_00120] END');
      done();
      });
      /**
     * @tc.name   clipShape_00130
     * @tc.number clipShape_00130
     * @tc.desc   To set the offset position for a component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('clipShape_00130', Level.LEVEL1, async (done: Function) => {
      console.info('[clipShape_00130] START');
      let driver: Driver = Driver.create();
      let targetButton = await driver.findComponent(ON.id('ButtonClipShape13'));
      await targetButton.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('TextClipShape');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[clipShape_00130] clip: ' + obj1.$attrs.clip);
      expect(obj1.$attrs.clip).assertEqual('{\"shape\":\"Ellipse\"}');
      console.info('[clipShape_00130] END');
      done();
      });
  })
}