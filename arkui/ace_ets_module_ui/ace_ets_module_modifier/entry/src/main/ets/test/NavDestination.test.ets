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
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'

export default function navDestinationJsunit() {
  describe('navDestinationTest', () => {
    beforeAll(async (done: Function) => {
      console.info("NavDestination beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/navDestination',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavDestination state success " + JSON.stringify(pages));
        if (!("navDestination" == pages.name)) {
          console.info("get NavDestination state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push NavDestination page error: " + err);
      }
      done();
    });

    /**
     * @tc.number testNavDestination
     * @tc.name Test the properties of components
     * @tc.desc Set hideTitleBar values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testNavDestination', Level.LEVEL0, async (done: Function) => {
      console.info('[testNavDestination] START');
      let strJson = getInspectorByKey('NavDestination1');
      console.info("[testNavDestination] strJson is : " + strJson);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testNavDestination] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.hideTitleBar).assertEqual(undefined);
      console.info('[testNavDestination] END');
      done();
    });

    /**
     * @tc.number testNavDestination_01
     * @tc.name Test the properties of components
     * @tc.desc Change hideTitleBar values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testNavDestination_01', Level.LEVEL0, async (done: Function) => {
      console.info('testNavDestination_01 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = getInspectorByKey('NavDestination1');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("testNavDestination_01 component  is: " + JSON.stringify(objNew.$attrs));
      //expect(objNew.$attrs.hideTitleBar).assertEqual('false'); 
      expect(objNew.$attrs.hideTitleBar).assertEqual(undefined);
      console.info('testNavDestination_01 END');
      done();
    });
  })
}
