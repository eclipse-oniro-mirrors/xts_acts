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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'

export default function navigatorJsunit() {
  describe('navigatorTest', () => {
    beforeEach(async (done: Function) => {
      console.info("NavigatorClick beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/navigator',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavigatorTest state pages:" + JSON.stringify(pages));
        if (!("navigator" == pages.name)) {
          console.info("get NavigatorTest state pages.name:" + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push NavigatorTest page error:" + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   test_Navigator_0021
     * @tc.number test_Navigator_0021
     * @tc.desc   Set params values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Navigator_0021', Level.LEVEL0, async (done: Function) => {
      console.info('[test_Navigator_0021] START');
      let strJson = getInspectorByKey('Navigator1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_Navigator_0021] component obj is: " + JSON.stringify(obj));
      expect(JSON.parse(obj.$attrs.params).text).assertEqual('news');
      console.info('[test_Navigator_0021] END');
      done();
    });

    /**
     * @tc.name   test_Navigator_0022
     * @tc.number test_Navigator_0022
     * @tc.desc   Set active values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Navigator_0022', Level.LEVEL0, async (done: Function) => {
      console.info('[test_Navigator_0022] START');
      let strJson = getInspectorByKey('Navigator1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_Navigator_0022] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.active).assertEqual('true');
      console.info('[test_Navigator_0022] END');
      done();
    });

    /**
     * @tc.name   test_Navigator_0023
     * @tc.number test_Navigator_0023
     * @tc.desc   Set target values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Navigator_0023', Level.LEVEL0, async (done: Function) => {
      console.info('[test_Navigator_0023] START');
      let strJson = getInspectorByKey('Navigator1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_Navigator_0023] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.target).assertEqual('');
      console.info('[test_Navigator_0023] END');
      done();
    });

    /**
     * @tc.name   test_Navigator_0024
     * @tc.number test_Navigator_0024
     * @tc.desc   Set type values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Navigator_0024', Level.LEVEL0, async (done: Function) => {
      console.info('[test_Navigator_0024] START');
      let strJson = getInspectorByKey('Navigator1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_Navigator_0024] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.type).assertEqual('NavigationType.Push');
      console.info('[test_Navigator_0024] END');
      done();
    });

    /**
     * @tc.name   test_Navigator_0025
     * @tc.number test_Navigator_0025
     * @tc.desc   Change type values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Navigator_0025', Level.LEVEL0, async (done: Function) => {
      console.info('test_Navigator_0025 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = getInspectorByKey('Navigator1');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("test_Navigator_0025 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.type).assertEqual('NavigationType.Replace');
      console.info('test_Navigator_0025 END');
      done();
    });
  })
}