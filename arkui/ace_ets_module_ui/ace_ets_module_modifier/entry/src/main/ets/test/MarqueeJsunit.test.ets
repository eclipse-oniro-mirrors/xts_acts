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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import Utils from './Utils';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'
import events_emitter from '@ohos.events.emitter';

export default function marqueeJsunit() {
  describe('marqueeTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/marquee',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get marquee state success " + JSON.stringify(pages));
        if (!("marquee" == pages.name)) {
          console.info("get marquee state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(4000);
        }
      } catch (err) {
        console.error("push marquee page error " + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.number testMarquee_04001
     * @tc.name Test the properties of components
     * @tc.desc Set fontColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testMarquee_04001', 0, async (done: Function) => {
      console.info('testMarquee_04001 START');
      let strJsonNew = getInspectorByKey('MarqueeKey1');
      let obj = JSON.parse(strJsonNew);
      expect(obj.$attrs.fontColor).assertEqual('#FF00FFFF');
      console.info('testMarquee_04001 END');
      done();
    });

    /**
     * @tc.number testMarquee_04002
     * @tc.name Test the properties of components
     * @tc.desc Set fontSize values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testMarquee_04002', 0, async (done: Function) => {
      console.info('testMarquee_04002 START');
      let strJsonNew = getInspectorByKey('MarqueeKey1');
      let obj = JSON.parse(strJsonNew);
      expect(obj.$attrs.fontSize).assertEqual('35.00fp');
      console.info('testMarquee_04002 END');
      done();
    });

    /**
     * @tc.number testMarquee_04003
     * @tc.name Test the properties of components
     * @tc.desc Set allowScale values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testMarquee_04003', 0, async (done: Function) => {
      console.info('testMarquee_04003 START');
      let strJsonNew = getInspectorByKey('MarqueeKey1');
      let obj = JSON.parse(strJsonNew);
      expect(obj.$attrs.allowScale).assertEqual('true');
      console.info('testMarquee_04003 END');
      done();
    });

    /**
     * @tc.number testMarquee_04004
     * @tc.name Test the properties of components
     * @tc.desc Set fontWeight values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testMarquee_04004', 0, async (done: Function) => {
      console.info('testMarquee_04004 START');
      let strJsonNew = getInspectorByKey('MarqueeKey1');
      let obj = JSON.parse(strJsonNew);
      expect(obj.$attrs.fontWeight).assertEqual('500');
      console.info('testMarquee_04004 END');
      done();
    });

    /**
     * @tc.number testMarquee_04005
     * @tc.name Test the properties of components
     * @tc.desc Set fontFamily values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testMarquee_04005', 0, async (done: Function) => {
      console.info('testMarquee_04005 START');
      let strJsonNew = getInspectorByKey('MarqueeKey1');
      let obj = JSON.parse(strJsonNew);
      expect(obj.$attrs.fontFamily).assertEqual('medium');
      console.info('testMarquee_04005 END');
      done();
    });
    /**
     * @tc.number testMarquee_04006
     * @tc.name Test the properties of components
     * @tc.desc Change fontSize values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testMarquee_04006', 0, async (done: Function) => {
      console.info('testMarquee_04006 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = getInspectorByKey('MarqueeKey1'); //测试组件的key名称
      let objNew = JSON.parse(strJsonNew);
      console.info("testMarquee_04006 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.fontSize).assertEqual('5.00fp'); //
      console.info('testMarquee_04006 END');
      done();
    });
  })
}