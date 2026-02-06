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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'
import events_emitter from '@ohos.events.emitter';


export default function datapanelJsunit() {
  describe('dataPanelTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dataPanel',
      }

      try {
        router.clear();
        await Utils.sleep(1000);
        let pages = router.getState();
        console.info("get DataPanel state success " + JSON.stringify(pages));
        if (!("dataPanel" == pages.name)) {
          console.info("get DataPanel state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push DataPanel page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DataPanel page error " + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.number testDataPanel01
     * @tc.name Test the properties of components
     * @tc.desc Set trackShadow values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testDataPanel01', Level.LEVEL0, async (done: Function) => {
      console.info('testDataPanel01 START');
      let strJson = getInspectorByKey('DataPanelKey1');

      console.log("cd DataPanel JSON.parse(strJson)" + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.trackShadow.radius).assertEqual("6.000000")
      expect(JSON.parse(strJson).$attrs.trackShadow.offsetX).assertEqual("2.000000")
      expect(JSON.parse(strJson).$attrs.trackShadow.offsetY).assertEqual("1.000000")
      console.info('testDataPanel01 END');
      done();
    });

    /**
     * @tc.number testDataPanel02
     * @tc.name Test the properties of components
     * @tc.desc Set strokeWidth values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testDataPanel02', Level.LEVEL0, async (done: Function) => {
      console.info('testDataPanel02 START');
      let strJson = getInspectorByKey('DataPanelKey1');

      console.log("cd DataPanel JSON.parse(strJson)" + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.strokeWidth).assertEqual("25.00vp")
      console.info('testDataPanel02 END');
      done();
    });

    /**
     * @tc.number testDataPanel03
     * @tc.name Test the properties of components
     * @tc.desc Set trackBackgroundColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testDataPanel03', Level.LEVEL0, async (done: Function) => {
      console.info('testDataPanel03 START');
      let strJson = getInspectorByKey('DataPanelKey1');

      console.log("cd DataPanel JSON.parse(strJson)" + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.trackBackgroundColor).assertEqual("#08182431")
      console.info('testDataPanel03 END');
      done();
    });

    /**
     * @tc.number testDataPanel04
     * @tc.name Test the properties of components
     * @tc.desc Set valueColors values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testDataPanel04', Level.LEVEL0, async (done: Function) => {
      console.info('testDataPanel04 START');
      let strJson = getInspectorByKey('DataPanelKey1');

      console.log("cd DataPanel JSON.parse(strJson)" + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.stringify(JSON.parse(strJson).$attrs.valueColors))
        .assertEqual('[[{"color":"#FF123456","offset":"0.000000"},{"color":"#FF123456","offset":"1.000000"}],[{"color":"#FF654321","offset":"0.000000"},{"color":"#FF654321","offset":"1.000000"}]]')
      console.info('testDataPanel04 END');
      done();
    });

    /**
     * @tc.number testDataPanel05
     * @tc.name Test the properties of components
     * @tc.desc Set closeEffect values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testDataPanel05', Level.LEVEL0, async (done: Function) => {
      console.info('testDataPanel05 START');
      let strJson = getInspectorByKey('DataPanelKey1');

      console.log("cd DataPanel JSON.parse(strJson)" + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.closeEffect).assertEqual("true")
      console.info('testDataPanel05 END');
      done();
    });

    /**
     * @tc.number testDataPanel06
     * @tc.name Test the properties of components
     * @tc.desc Change strokeWidth values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testDataPanel06', Level.LEVEL0, async (done: Function) => {
      console.info('testDataPanel06 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = getInspectorByKey('DataPanelKey1'); //测试组件的key名称
      console.info("testDataPanel06 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));
      expect(JSON.parse(strJsonNew).$attrs.strokeWidth).assertEqual('5.00vp'); //
      console.info('testDataPanel06 END');
      done();
    });

  })
}