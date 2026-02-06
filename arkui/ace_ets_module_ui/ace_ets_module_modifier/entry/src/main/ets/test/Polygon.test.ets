/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
import Utils from './Utils'
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest';

export default function polygonJsunit() {
  describe('polygonTest', () => {
    beforeAll(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/polygon',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get Polygon state success " + JSON.stringify(pages));
        if (!("polyLine" == pages.name)) {
          console.info("get Polygon state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push Polygon page error: " + err);
      }
      done();
    });

    /**
     * @tc.number testpolygon_001
     * @tc.name Test the properties of components
     * @tc.desc Change points values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testpolygon_001', Level.LEVEL0, async (done: Function) => {
      console.info('testpolygon_001 START');

      let strJsonNew = getInspectorByKey('polygon1');
      let objNew: ESObject = JSON.parse(strJsonNew);

      console.info("testpolygon_001 objNew component  is: " + JSON.stringify(objNew.$attrs));

      expect(objNew.$attrs.points).assertEqual(true);
      console.info('testpolygon_001 END');
      done();
    });

    /**
     * @tc.number testpolygon_002
     * @tc.name Test the properties of components
     * @tc.desc Change points values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testpolygon_002', Level.LEVEL0, async (done: Function) => {
      console.info('testpolygon_002 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)
      let strJsonNew = getInspectorByKey('polygon1');
      let objNew: ESObject = JSON.parse(strJsonNew);
      expect(objNew.$attrs.points).assertEqual(true);
      console.info('testpolygon_002 END');
      done();
    });
  })
}
