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
import events_emitter from '@ohos.events.emitter';

export default function blankJsunit() {
  describe('blankTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/blank',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get blank state success " + JSON.stringify(pages));
        if (!("blank" == pages.name)) {
          console.info("get blank state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(1000);
        }
      } catch (err) {
        console.error("push blank page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   blankTest_0001
     * @tc.number blankTest_0001
     * @tc.desc   Set color values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('blankTest_0001', Level.LEVEL0, async (done: Function) => {
      console.info('blankTest_0001 START');
      let strJsonNew = getInspectorByKey('blank');
      console.info("blankTest_0001 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.color).assertEqual("#FF123456");
      console.info('blankTest_0001 END');
      done();
    });

    /**
     * @tc.name   blankTest_0002
     * @tc.number blankTest_0002
     * @tc.desc   Change color values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('blankTest_0002', Level.LEVEL0, async (done: Function) => {

      console.info('blankTest_0002 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = getInspectorByKey('blank');
      console.info("blankTest_0002 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.color).assertEqual("#FF654321");
      console.info('blankTest_0002 END');
      done();
    });
  })
}