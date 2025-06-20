
/**
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import router from '@ohos.router'
import events_emitter from '@ohos.events.emitter'
import Utils from './Utils';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function buttonJsunit() {
  describe('buttonTest', () => {
    beforeEach(async (done: Function) => {
      console.info("button beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/button',
      }
      let result: ESObject;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get button state pages: " + JSON.stringify(pages));
        if (!("button" == pages.name)) {
          console.info("get button state pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push button page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push button page error: " + err);
      }
      done();
    });

    beforeEach(async () => {
      await Utils.sleep(1000);
      console.info("button before each called");
    })

    /**
     * @tc.number testButton1601
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testButton1601', Level.LEVEL0, async (done: Function) => {
      console.info('[testButton1601] START');
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('button');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("[testButton1601] component testButton1601 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.type).assertEqual('ButtonType.Circle');
      done();
    });

    /**
     * @tc.number testButton1602
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testButton1602', Level.LEVEL0, async (done: Function) => {
      console.info('[testButton1602] START');
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('button');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("[testButton1602] component testButton1602 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.stateEffect).assertEqual('true');
      done();
    });

    /**
     * @tc.number testButton1603
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testButton1603', Level.LEVEL0, async (done: Function) => {
      console.info('[testButton1603] START');
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('button');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("[testButton1603] component testButton1603 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.fontColor).assertEqual('#FFCCCCCC');
      done();
    });

    /**
     * @tc.number testButton1604
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testButton1604', Level.LEVEL0, async (done: Function) => {
      console.info('[testButton1604] START');
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('button');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("[testButton1604] component testButton1604 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.fontSize).assertEqual('12.00fp');
      done();
    });

    /**
     * @tc.number testButton1605
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testButton1605', Level.LEVEL0, async (done: Function) => {
      console.info('[testButton1605] START');
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('button');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("[testButton1605] component testButton1605 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.fontWeight).assertEqual('FontWeight.Normal');
      done();
    });

    /**
     * @tc.number testButton1606
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testButton1606', Level.LEVEL0, async (done: Function) => {
      console.info('[testButton1606] START');
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('button');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("[testButton1606] component testButton1606 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.fontFamily).assertEqual('cursive');
      done();
    });

    /**
     * @tc.number testButton1607
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testButton1607', Level.LEVEL0, async (done: Function) => {
      console.info('[testButton1607] START');
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('button');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("[testButton1607] component testButton1607 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.fontStyle).assertEqual('FontStyle.Normal');
      done();
    });

    /**
     * @tc.number testButton1608
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testButton1608', Level.LEVEL0, async (done: Function) => {
      console.info('[testButton1608] START');
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('button2');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("[testButton1608] component testButton1608 is: " + JSON.stringify(objNew.$attrs));
      expect(JSON.parse(objNew.$attrs.labelStyle).overflow).assertEqual('TextOverflow.Clip');
      done();
    });

  })
}