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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import Utils from './Utils';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';

export default function buttonJsunit() {
  describe('buttonTest', () => {
    beforeEach(async (done: Function) => {
      console.info("button beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/button',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get button state pages: " + JSON.stringify(pages));
        if (!("button" == pages.name)) {
          console.info("get button state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push button page error: " + err);
      }
      done();
    });

    /**
     * @tc.number testButton1601
     * @tc.name Test the properties of components
     * @tc.desc Set type values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testButton1601', 0, async (done: Function) => {
      console.info('[testButton1601] START');
      let strJsonNew = getInspectorByKey('button');

      console.info("[testButton1601] component testButton1601 is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));
      expect(JSON.parse(strJsonNew).$attrs.type).assertEqual('ButtonType.Circle');
      done();
    });

    /**
     * @tc.number testButton1602
     * @tc.name Test the properties of components
     * @tc.desc Set stateEffect values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testButton1602', 0, async (done: Function) => {
      console.info('[testButton1602] START');
      let strJsonNew = getInspectorByKey('button');

      console.info("[testButton1602] component testButton1602 is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));
      expect(JSON.parse(strJsonNew).$attrs.stateEffect).assertEqual('true');
      done();
    });

    /**
     * @tc.number testButton1603
     * @tc.name Test the properties of components
     * @tc.desc Set fontColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testButton1603', 0, async (done: Function) => {
      console.info('[testButton1603] START');
      let strJsonNew = getInspectorByKey('button');

      console.info("[testButton1603] component testButton1603 is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));
      expect(JSON.parse(strJsonNew).$attrs.fontColor).assertEqual('#FFCCCCCC');
      done();
    });

    /**
     * @tc.number testButton1604
     * @tc.name Test the properties of components
     * @tc.desc Set fontSize values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testButton1604', 0, async (done: Function) => {
      console.info('[testButton1604] START');
      let strJsonNew = getInspectorByKey('button');

      console.info("[testButton1604] component testButton1604 is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));
      expect(JSON.parse(strJsonNew).$attrs.fontSize).assertEqual('12.00fp');
      done();
    });

    /**
     * @tc.number testButton1605
     * @tc.name Test the properties of components
     * @tc.desc Set fontWeight values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testButton1605', 0, async (done: Function) => {
      console.info('[testButton1605] START');
      let strJsonNew = getInspectorByKey('button');

      console.info("[testButton1605] component testButton1605 is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));
      expect(JSON.parse(strJsonNew).$attrs.fontWeight).assertEqual('FontWeight.Normal');
      done();
    });

    /**
     * @tc.number testButton1606
     * @tc.name Test the properties of components
     * @tc.desc Set fontFamily values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testButton1606', 0, async (done: Function) => {
      console.info('[testButton1606] START');
      let strJsonNew = getInspectorByKey('button');

      console.info("[testButton1606] component testButton1606 is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));
      expect(JSON.parse(strJsonNew).$attrs.fontFamily).assertEqual('cursive');
      done();
    });

    /**
     * @tc.number testButton1607
     * @tc.name Test the properties of components
     * @tc.desc Set fontStyle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testButton1607', 0, async (done: Function) => {
      console.info('[testButton1607] START');
      let strJsonNew = getInspectorByKey('button');

      console.info("[testButton1607] component testButton1607 is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));
      expect(JSON.parse(strJsonNew).$attrs.fontStyle).assertEqual('FontStyle.Normal');
      done();
    });

    /**
     * @tc.number testButton1608
     * @tc.name Test the properties of components
     * @tc.desc Set labelStyle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testButton1608', 0, async (done: Function) => {
      console.info('[testButton1608] START');
      let strJsonNew = getInspectorByKey('button2');

      console.info("[testButton1608] component testButton1608 is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));
      expect(JSON.parse(JSON.parse(strJsonNew).$attrs.labelStyle).overflow).assertEqual('TextOverflow.Clip');
      done();
    });

    /**
     * @tc.number testButton1609
     * @tc.name Test the properties of components
     * @tc.desc Change fontSize values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testButton1609', 0, async (done: Function) => {
      console.info('testButton1609 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = getInspectorByKey('button'); //测试组件的key名称


      console.info("testButton1609 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));
      expect(JSON.parse(strJsonNew).$attrs.fontSize).assertEqual('13.00fp'); //

      console.info('testButton1609 END');
      done();
    });

  })
}