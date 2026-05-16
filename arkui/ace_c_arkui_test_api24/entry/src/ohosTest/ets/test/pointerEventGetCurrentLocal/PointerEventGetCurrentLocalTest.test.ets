/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

export default function PointerEventGetCurrentLocalTest() {

  describe('PointerEventGetCurrentLocalTest', () => {

    let PAGE_TAG = 'PointerEventGetCurrentLocalTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`pointerEventGetCurrentLocal/${PAGE_TAG}`, done);
    });

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   pointerEventGetCurrentLocalXTest001
     * @tc.number SUB_ArkUI_NativeAPI_PointerEvent_GetCurrentLocalX_0100
     * @tc.desc   OH_ArkUI_PointerEvent_GetCurrentLocalX normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pointerEventGetCurrentLocalXTest001', Level.LEVEL1, async (done: Function) => {
      console.info('[pointerEventGetCurrentLocalXTest001] START');
      let driver: Driver = Driver.create();
      let touchArea = await driver.findComponent(ON.id('touchAreaGetCurrentLocal'));
      await touchArea.click();
      await Utils.sleep(500);
      let strJson = getInspectorByKey('textResultGetCurrentLocalX');
      let obj: ESObject = JSON.parse(strJson);
      let content: string = obj.$attrs.content;
      console.info('[pointerEventGetCurrentLocalXTest001] LocalX content: ' + content);
      let parts = content.split(':');
      let value = parseFloat(parts[1]);
      expect(value).assertLargerOrEqual(0);
      console.info('[pointerEventGetCurrentLocalXTest001] END');
      done();
    });

    /**
     * @tc.name   pointerEventGetCurrentLocalXTest002
     * @tc.number SUB_ArkUI_NativeAPI_PointerEvent_GetCurrentLocalX_0200
     * @tc.desc   OH_ArkUI_PointerEvent_GetCurrentLocalX second click test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pointerEventGetCurrentLocalXTest002', Level.LEVEL1, async (done: Function) => {
      console.info('[pointerEventGetCurrentLocalXTest002] START');
      let driver: Driver = Driver.create();
      let touchArea = await driver.findComponent(ON.id('touchAreaGetCurrentLocal'));
      await touchArea.click();
      await Utils.sleep(500);
      let strJson = getInspectorByKey('textResultGetCurrentLocalX');
      let obj: ESObject = JSON.parse(strJson);
      let content: string = obj.$attrs.content;
      console.info('[pointerEventGetCurrentLocalXTest002] LocalX content: ' + content);
      let parts = content.split(':');
      let value = parseFloat(parts[1]);
      expect(value).assertLargerOrEqual(0);
      console.info('[pointerEventGetCurrentLocalXTest002] END');
      done();
    });

    /**
     * @tc.name   pointerEventGetCurrentLocalXByIndexTest001
     * @tc.number SUB_ArkUI_NativeAPI_PointerEvent_GetCurrentLocalXByIndex_0100
     * @tc.desc   OH_ArkUI_PointerEvent_GetCurrentLocalXByIndex normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pointerEventGetCurrentLocalXByIndexTest001', Level.LEVEL1, async (done: Function) => {
      console.info('[pointerEventGetCurrentLocalXByIndexTest001] START');
      let driver: Driver = Driver.create();
      let touchArea = await driver.findComponent(ON.id('touchAreaGetCurrentLocal'));
      await touchArea.click();
      await Utils.sleep(500);
      let strJson = getInspectorByKey('textResultGetCurrentLocalXByIndex');
      let obj: ESObject = JSON.parse(strJson);
      let content: string = obj.$attrs.content;
      console.info('[pointerEventGetCurrentLocalXByIndexTest001] LocalXByIndex content: ' + content);
      let parts = content.split(':');
      let value = parseFloat(parts[1]);
      expect(value).assertLargerOrEqual(0);
      console.info('[pointerEventGetCurrentLocalXByIndexTest001] END');
      done();
    });

    /**
     * @tc.name   pointerEventGetCurrentLocalXByIndexTest002
     * @tc.number SUB_ArkUI_NativeAPI_PointerEvent_GetCurrentLocalXByIndex_0200
     * @tc.desc   OH_ArkUI_PointerEvent_GetCurrentLocalXByIndex second click test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pointerEventGetCurrentLocalXByIndexTest002', Level.LEVEL1, async (done: Function) => {
      console.info('[pointerEventGetCurrentLocalXByIndexTest002] START');
      let driver: Driver = Driver.create();
      let touchArea = await driver.findComponent(ON.id('touchAreaGetCurrentLocal'));
      await touchArea.click();
      await Utils.sleep(500);
      let strJson = getInspectorByKey('textResultGetCurrentLocalXByIndex');
      let obj: ESObject = JSON.parse(strJson);
      let content: string = obj.$attrs.content;
      console.info('[pointerEventGetCurrentLocalXByIndexTest002] LocalXByIndex content: ' + content);
      let parts = content.split(':');
      let value = parseFloat(parts[1]);
      expect(value).assertLargerOrEqual(0);
      console.info('[pointerEventGetCurrentLocalXByIndexTest002] END');
      done();
    });

    /**
     * @tc.name   pointerEventGetCurrentLocalYTest001
     * @tc.number SUB_ArkUI_NativeAPI_PointerEvent_GetCurrentLocalY_0100
     * @tc.desc   OH_ArkUI_PointerEvent_GetCurrentLocalY normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pointerEventGetCurrentLocalYTest001', Level.LEVEL1, async (done: Function) => {
      console.info('[pointerEventGetCurrentLocalYTest001] START');
      let driver: Driver = Driver.create();
      let touchArea = await driver.findComponent(ON.id('touchAreaGetCurrentLocal'));
      await touchArea.click();
      await Utils.sleep(500);
      let strJson = getInspectorByKey('textResultGetCurrentLocalY');
      let obj: ESObject = JSON.parse(strJson);
      let content: string = obj.$attrs.content;
      console.info('[pointerEventGetCurrentLocalYTest001] LocalY content: ' + content);
      let parts = content.split(':');
      let value = parseFloat(parts[1]);
      expect(value).assertLargerOrEqual(0);
      console.info('[pointerEventGetCurrentLocalYTest001] END');
      done();
    });

    /**
     * @tc.name   pointerEventGetCurrentLocalYTest002
     * @tc.number SUB_ArkUI_NativeAPI_PointerEvent_GetCurrentLocalY_0200
     * @tc.desc   OH_ArkUI_PointerEvent_GetCurrentLocalY second click test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pointerEventGetCurrentLocalYTest002', Level.LEVEL1, async (done: Function) => {
      console.info('[pointerEventGetCurrentLocalYTest002] START');
      let driver: Driver = Driver.create();
      let touchArea = await driver.findComponent(ON.id('touchAreaGetCurrentLocal'));
      await touchArea.click();
      await Utils.sleep(500);
      let strJson = getInspectorByKey('textResultGetCurrentLocalY');
      let obj: ESObject = JSON.parse(strJson);
      let content: string = obj.$attrs.content;
      console.info('[pointerEventGetCurrentLocalYTest002] LocalY content: ' + content);
      let parts = content.split(':');
      let value = parseFloat(parts[1]);
      expect(value).assertLargerOrEqual(0);
      console.info('[pointerEventGetCurrentLocalYTest002] END');
      done();
    });

    /**
     * @tc.name   pointerEventGetCurrentLocalYByIndexTest001
     * @tc.number SUB_ArkUI_NativeAPI_PointerEvent_GetCurrentLocalYByIndex_0100
     * @tc.desc   OH_ArkUI_PointerEvent_GetCurrentLocalYByIndex normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pointerEventGetCurrentLocalYByIndexTest001', Level.LEVEL1, async (done: Function) => {
      console.info('[pointerEventGetCurrentLocalYByIndexTest001] START');
      let driver: Driver = Driver.create();
      let touchArea = await driver.findComponent(ON.id('touchAreaGetCurrentLocal'));
      await touchArea.click();
      await Utils.sleep(500);
      let strJson = getInspectorByKey('textResultGetCurrentLocalYByIndex');
      let obj: ESObject = JSON.parse(strJson);
      let content: string = obj.$attrs.content;
      console.info('[pointerEventGetCurrentLocalYByIndexTest001] LocalYByIndex content: ' + content);
      let parts = content.split(':');
      let value = parseFloat(parts[1]);
      expect(value).assertLargerOrEqual(0);
      console.info('[pointerEventGetCurrentLocalYByIndexTest001] END');
      done();
    });

    /**
     * @tc.name   pointerEventGetCurrentLocalYByIndexTest002
     * @tc.number SUB_ArkUI_NativeAPI_PointerEvent_GetCurrentLocalYByIndex_0200
     * @tc.desc   OH_ArkUI_PointerEvent_GetCurrentLocalYByIndex second click test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pointerEventGetCurrentLocalYByIndexTest002', Level.LEVEL1, async (done: Function) => {
      console.info('[pointerEventGetCurrentLocalYByIndexTest002] START');
      let driver: Driver = Driver.create();
      let touchArea = await driver.findComponent(ON.id('touchAreaGetCurrentLocal'));
      await touchArea.click();
      await Utils.sleep(500);
      let strJson = getInspectorByKey('textResultGetCurrentLocalYByIndex');
      let obj: ESObject = JSON.parse(strJson);
      let content: string = obj.$attrs.content;
      console.info('[pointerEventGetCurrentLocalYByIndexTest002] LocalYByIndex content: ' + content);
      let parts = content.split(':');
      let value = parseFloat(parts[1]);
      expect(value).assertLargerOrEqual(0);
      console.info('[pointerEventGetCurrentLocalYByIndexTest002] END');
      done();
    });
  })
}