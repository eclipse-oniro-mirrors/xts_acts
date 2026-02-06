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

export default function pathNewTest() {
  describe('pathTest', () => {
    beforeAll(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/path',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get path state success " + JSON.stringify(pages));
        if (!("path" == pages.name)) {
          console.info("get path state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push path page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   testPathNe0004
     * @tc.number testPathNe0004
     * @tc.desc   Set commands values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathNe0004', Level.LEVEL0, async (done: Function) => {
      console.info('pathNe testPathNe0004 START');
      let strJson = getInspectorByKey('PathKey1');
      console.info("[testPathNe0004] component fontSize strJson:" + strJson);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testPathNe0004] commands value :" + obj.$attrs.commands);
      expect(obj.$attrs.commands).assertEqual("M100 0 L0 100 L50 200 L150 200 L200 100 Z");
      console.info('pathNe testPathNe0004 END');
      done();
    });

    /**
     * @tc.name   testPathNe0005
     * @tc.number testPathNe0005
     * @tc.desc   Change commands values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathNe0005', Level.LEVEL0, async (done: Function) => {
      console.info('testPathNe0005 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = getInspectorByKey('PathKey1'); //测试组件的key名称
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("testPathNe0005 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.commands).assertEqual("M100 0 L0 100 L50 200 L150 200 L200 200 Z"); //

      console.info('testPathNe0005 END');
      done();
    });

  })
}
