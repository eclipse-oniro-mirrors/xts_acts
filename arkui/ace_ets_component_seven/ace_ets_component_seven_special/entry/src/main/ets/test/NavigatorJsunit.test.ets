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
import Utils from './Utils';

export default function navigatorJsunit() {
  describe('NavigatorClickTest', () => {
    beforeEach(async (done: Function) => {
      console.info("NavigatorClick beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/navigator',
      }
      let result: ESObject;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavigatorClick state pages:" + JSON.stringify(pages));
        if (!("NavigatorClick" == pages.name)) {
          console.info("get NavigatorClick state pages.name:" + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push NavigatorClick page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavigatorClick page error:" + JSON.stringify(result));
      }
      done();
    });

    /**
     * @tc.number test_Navigator_0021
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_Navigator_0021', Level.LEVEL0, async (done: Function) => {
      console.info('[test_Navigator_0021] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('Navigator1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_Navigator_0021] component obj is: " + JSON.stringify(obj));
      expect(JSON.parse(obj.$attrs.params).params).assertEqual('modifier');
      console.info('[test_Navigator_0021] END');
      done();
    });

    /**
     * @tc.number test_Navigator_0022
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_Navigator_0022', Level.LEVEL0, async (done: Function) => {
      console.info('[test_Navigator_0022] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('Navigator1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_Navigator_0022] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.active).assertEqual('true');
      console.info('[test_Navigator_0022] END');
      done();
    });

    /**
     * @tc.number test_Navigator_0023
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_Navigator_0023', Level.LEVEL0, async (done: Function) => {
      console.info('[test_Navigator_0023] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('Navigator1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_Navigator_0023] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.target).assertEqual('');
      console.info('[test_Navigator_0023] END');
      done();
    });

    /**
     * @tc.number test_Navigator_0024
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_Navigator_0024', Level.LEVEL0, async (done: Function) => {
      console.info('[test_Navigator_0024] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('Navigator1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_Navigator_0024] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.type).assertEqual('NavigationType.Push');
      console.info('[test_Navigator_0024] END');
      done();
    });
  })
}