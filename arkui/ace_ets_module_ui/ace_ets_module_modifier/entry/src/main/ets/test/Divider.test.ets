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

export default function dividerJsunit() {
  describe('dividerTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/divider',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get divider state success " + JSON.stringify(pages));
        if (!("divider" == pages.name)) {
          console.info("get divider state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(1000);
        }
      } catch (err) {
        console.error("push divider page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   dividerTest_0001
     * @tc.number dividerTest_0001
     * @tc.desc   Set lineCap values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dividerTest_0001', Level.LEVEL0, async (done: Function) => {
      console.info('dividerTest_0001 START');
      let strJsonNew = getInspectorByKey('divider');
      console.info("dividerTest_0001 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.lineCap).assertEqual("ROUND");
      console.info('dividerTest_0001 END');
      done();
    });

    /**
     * @tc.name   dividerTest_0002
     * @tc.number dividerTest_0002
     * @tc.desc   Set strokeWidth values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dividerTest_0002', Level.LEVEL0, async (done: Function) => {
      console.info('dividerTest_0002 START');
      let strJsonNew = getInspectorByKey('divider');
      console.info("dividerTest_0002 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.strokeWidth).assertEqual("10.00vp");
      console.info('dividerTest_0002 END');
      done();
    });

    /**
     * @tc.name   dividerTest_0003
     * @tc.number dividerTest_0003
     * @tc.desc   Set color values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dividerTest_0003', Level.LEVEL0, async (done: Function) => {
      console.info('dividerTest_0003 START');
      let strJsonNew = getInspectorByKey('divider');
      console.info("dividerTest_0003 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.color).assertEqual("#FF123456");
      console.info('dividerTest_0003 END');
      done();
    });

    /**
     * @tc.name   dividerTest_0004
     * @tc.number dividerTest_0004
     * @tc.desc   Set vertical values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dividerTest_0004', Level.LEVEL0, async (done: Function) => {
      console.info('dividerTest_0004 START');
      let strJsonNew = getInspectorByKey('divider');
      console.info("dividerTest_0004 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.vertical).assertEqual("false");
      console.info('dividerTest_0004 END');
      done();
    });

    /**
     * @tc.name   dividerTest_0005
     * @tc.number dividerTest_0005
     * @tc.desc   Change color values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dividerTest_0005', Level.LEVEL0, async (done: Function) => {

      console.info('dividerTest_0005 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = getInspectorByKey('divider');
      console.info("dividerTest_0005 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.color).assertEqual("#FF654321");
      console.info('dividerTest_0005 END');
      done();
    });
  })
}