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

export default function counterJsunit() {
  describe('counterTest', () => {
    beforeAll(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/counter',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get Counter state success " + JSON.stringify(pages));
        if (!("counter" == pages.name)) {
          console.info("get Counter state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push Counter page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   testCounter01
     * @tc.number testCounter01
     * @tc.desc   Set enableInc values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCounter01', Level.LEVEL0, async (done: Function) => {
      console.info('[testCounter01] START');
      let strJson = getInspectorByKey('Counter');
      console.info("[testCounter01] obj is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.enableInc).assertEqual("true");
      console.info('[testCounter01] END');
      done();
    });

    /**
     * @tc.name   testCounter02
     * @tc.number testCounter02
     * @tc.desc   Set enableDec values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCounter02', Level.LEVEL0, async (done: Function) => {
      console.info('[testCounter02] START');
      let strJson = getInspectorByKey('Counter');
      console.info("[testCounter02] obj is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.enableDec).assertEqual("true");
      console.info('[testCounter02] END');
      done();
    });

    /**
     * @tc.name   testCounter03
     * @tc.number testCounter03
     * @tc.desc   Change enableDec values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCounter03', Level.LEVEL0, async (done: Function) => {
      console.info('testCounter03 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = getInspectorByKey('Counter');
      console.info("testCounter03 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));
      expect(JSON.parse(strJsonNew).$attrs.enableDec).assertEqual("true");
      console.info('testCounter03 END');
      done();
    });
  })
}
