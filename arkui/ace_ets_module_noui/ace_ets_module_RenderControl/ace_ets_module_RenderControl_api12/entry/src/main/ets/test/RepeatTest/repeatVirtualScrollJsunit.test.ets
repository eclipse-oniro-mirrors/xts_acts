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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function repeatVirtualScrollJsunit() {
  describe('repeatVirtualScrollJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("repeatVirtualScrollJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Repeat/repeatVirtualScroll',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get repeatVirtualScrollJsunit state pages: " + JSON.stringify(pages));
        if (!("repeatVirtualScroll" == pages.name)) {
          console.info("get repeatVirtualScrollJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push repeatVirtualScrollJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push repeatVirtualScrollJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("repeatVirtualScrollJsunit after each called");
    });

    /**
     * @tc.name   repeatVirtualScrollJsunit_0100
     * @tc.number repeatVirtualScrollJsunit_0100
     * @tc.desc   The Repeat component template test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('repeatVirtualScrollJsunit_0100', Level.LEVEL0, async (done: Function) => {
      console.info('RepeatEachJsunit_0100 START');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('text3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[repeatVirtualScrollJsunit_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual("3:3ReuseString123");
      console.info('[repeatVirtualScrollJsunit_0100] END');

      let strJson1 = getInspectorByKey('text4');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[repeatVirtualScrollJsunit_0100] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual("4:4ReuseNumber123");
      console.info('[repeatVirtualScrollJsunit_0100] END');

      let strJson2 = getInspectorByKey('text5');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[repeatVirtualScrollJsunit_0100] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual("5:5eachMessage123");
      console.info('[repeatVirtualScrollJsunit_0100] END');
      done();
    });

    /**
     * @tc.name   repeatVirtualScrollJsunit_0200
     * @tc.number repeatVirtualScrollJsunit_0200
     * @tc.desc   Repeat Scroll to index 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('repeatVirtualScrollJsunit_0200', Level.LEVEL0, async (done: Function) => {
      console.info('repeatVirtualScrollJsunit_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll'))
      let button = await scrollBar.scrollSearch(ON.id('init_repeat'));
      await button.click();
      await CommonFunc.sleep(1000);
      let button1 = await scrollBar.scrollSearch(ON.id('scroll_data1'));
      await button1.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('text7');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[repeatVirtualScrollJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[repeatVirtualScrollJsunit_0200] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("7:8eachMessage666");
      console.info('[repeatVirtualScrollJsunit_0200] END');
      done();
    });


    /**
     * @tc.name   repeatVirtualScrollJsunit_0300
     * @tc.number repeatVirtualScrollJsunit_0300
     * @tc.desc   Click to Modify the data of index 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('repeatVirtualScrollJsunit_0300', Level.LEVEL0, async (done: Function) => {
      console.info('repeatVirtualScrollJsunit_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll'))
      let button = await scrollBar.scrollSearch(ON.id('init_repeat'));
      await button.click();
      await CommonFunc.sleep(1000);
      let button1 = await scrollBar.scrollSearch(ON.id('repeat_modify'));
      await button1.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('text7');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[repeatVirtualScrollJsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[repeatVirtualScrollJsunit_0300] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("7:333eachMessage666");
      console.info('[repeatVirtualScrollJsunit_0300] END');

      done();
    });


    /**
     * @tc.name   repeatVirtualScrollJsunit_0400
     * @tc.number repeatVirtualScrollJsunit_0400
     * @tc.desc   Click to delete value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('repeatVirtualScrollJsunit_0400', Level.LEVEL0, async (done: Function) => {
      console.info('repeatVirtualScrollJsunit_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll'))
      let button = await scrollBar.scrollSearch(ON.id('init_repeat'));
      await button.click();
      await CommonFunc.sleep(1000);
      let button1 = await scrollBar.scrollSearch(ON.id('repeat_3'));
      await button1.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('text5');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[repeatVirtualScrollJsunit_0400] component obj is: " + JSON.stringify(obj));
      console.info("[repeatVirtualScrollJsunit_0400] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("5:6eachMessage666");
      console.info('[repeatVirtualScrollJsunit_0200] END');
      done();
    });


    /**
     * @tc.name   repeatVirtualScrollJsunit_0500
     * @tc.number repeatVirtualScrollJsunit_0500
     * @tc.desc   Click to exchange value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('repeatVirtualScrollJsunit_0500', Level.LEVEL0, async (done: Function) => {
      console.info('repeatVirtualScrollJsunit_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll'))
      let button = await scrollBar.scrollSearch(ON.id('init_repeat'));
      await button.click();
      await CommonFunc.sleep(1000);
      let button1 = await scrollBar.scrollSearch(ON.id('repeat_2'));
      await button1.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('text7');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[repeatVirtualScrollJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[repeatVirtualScrollJsunit_0200] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("7:9eachMessage666");
      console.info('[repeatVirtualScrollJsunit_0200] END');

      let strJson1 = getInspectorByKey('text8');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[repeatVirtualScrollJsunit_0200] component obj1 is: " + JSON.stringify(obj1));
      console.info("[repeatVirtualScrollJsunit_0200] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("8:8eachMessage666");
      console.info('[repeatVirtualScrollJsunit_0200] END');
      done();
    });
  })
}

