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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router'
import Utils from './Utils';
import events_emitter from '@ohos.events.emitter';
export default function datapanelJsunit() {
  describe('dataPanelTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dataPanel',
      }
      let result: ESObject;
      try {
        router.clear();
        await Utils.sleep(1000);
        let pages = router.getState();
        console.info("get DataPanel state success " + JSON.stringify(pages));
        if (!("dataPanel" == pages.name)) {
          console.info("get DataPanel state success " + JSON.stringify(pages.name));
          result = await router.push(options)
          console.info("push DataPanel page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DataPanel page error " + JSON.stringify(result));
      }
      await Utils.sleep(2000);
      done();
    });

    /**
     * @tc.number testDataPanel01
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testDataPanel01', Level.LEVEL0, async (done: Function) => {
      console.info('testDataPanel01 START');
      let strJson = getInspectorByKey('DataPanelKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.log("cd DataPanel obj" + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.trackShadow.radius).assertEqual("6.000000")
      expect(obj.$attrs.trackShadow.offsetX).assertEqual("2.000000")
      expect(obj.$attrs.trackShadow.offsetY).assertEqual("1.000000")
      console.info('testDataPanel01 END');
      done();
    });

    /**
     * @tc.number testDataPanel02
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testDataPanel02', Level.LEVEL0, async (done: Function) => {
      console.info('testDataPanel02 START');
      let strJson = getInspectorByKey('DataPanelKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.log("cd DataPanel obj" + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.strokeWidth).assertEqual("25.00vp")
      console.info('testDataPanel02 END');
      done();
    });

    /**
     * @tc.number testDataPanel03
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testDataPanel03', Level.LEVEL0, async (done: Function) => {
      console.info('testDataPanel03 START');
      let strJson = getInspectorByKey('DataPanelKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.log("cd DataPanel obj" + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.trackBackgroundColor).assertEqual("#08182431")
      console.info('testDataPanel03 END');
      done();
    });

    /**
     * @tc.number testDataPanel04
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testDataPanel04', Level.LEVEL0, async (done: Function) => {
      console.info('testDataPanel04 START');
      let strJson = getInspectorByKey('DataPanelKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.log("cd DataPanel obj" + JSON.stringify(obj.$attrs));
      expect(JSON.stringify(obj.$attrs.valueColors)).assertEqual('[[{"color":"#FF123456","offset":"0.000000"},{"color":"#FF123456","offset":"1.000000"}],[{"color":"#FF654321","offset":"0.000000"},{"color":"#FF654321","offset":"1.000000"}]]')
      console.info('testDataPanel04 END');
      done();
    });

    /**
     * @tc.number testDataPanel05
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testDataPanel05', Level.LEVEL0, async (done: Function) => {
      console.info('testDataPanel05 START');
      let strJson = getInspectorByKey('DataPanelKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.log("cd DataPanel obj" + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.closeEffect).assertEqual("true")
      console.info('testDataPanel05 END');
      done();
    });
  })
}