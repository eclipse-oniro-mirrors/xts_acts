/*
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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function MultiNavigationTest() {
  describe('MultiNavigationTest', () => {
    beforeEach(async (done: Function) => {
      console.info("MultiNavigation beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/MultiNavigation/MultiNavigationEntry',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MultiNavigation state pages:" + JSON.stringify(pages));
        if (!("MultiNavigationEntry" == pages.name)) {
          console.info("get MultiNavigation pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push MultiNavigation page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MultiNavigation page error:" + err);
      }
      console.info("MultiNavigation beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("MultiNavigation after each called");
    });


    /**
     * @tc.number    MultiNavigation_0100
     * @tc.name      MultiNavigation_0100
     * @tc.desc      Test MultiNavigation
     * @tc.level     Level 2
     */
    it('MultiNavigation_0100', 0, async (done: Function) => {
      console.info('MultiNavigation_0100 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await driver.findComponent(ON.id('setPlaceholderPageId'));
      await btn1.click()
      console.info('[MultiNavigation_0100] btn1 click');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('homePageId');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[MultiNavigation_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[MultiNavigation_0100] content obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('PageHome1');

      console.info('MultiNavigation_0100 END');
      done();
    });

    
    /**
     * @tc.number    MultiNavigation_0200
     * @tc.name      MultiNavigation_0200
     * @tc.desc      Test MultiNavigation
     * @tc.level     Level 2
     */
    it('MultiNavigation_0200', 0, async (done: Function) => {
      console.info('MultiNavigation_0200 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let scrollBar: Component = await driver.findComponent(ON.type('Scroll'));
      let btn1 = await scrollBar.scrollSearch(ON.id('switchFullScreenId'));
      await btn1.click()
      console.info('[MultiNavigation_0200] btn1 click');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('homePageId');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[MultiNavigation_0200] component obj is: ' + JSON.stringify(obj));
      console.info('[MultiNavigation_0200] content obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('PageHome1');

      console.info('MultiNavigation_0200 END');
      done();
    });

    
    /**
     * @tc.number    MultiNavigation_0300
     * @tc.name      MultiNavigation_0300
     * @tc.desc      Test MultiNavigation
     * @tc.level     Level 2
     */
    it('MultiNavigation_0300', 0, async (done: Function) => {
      console.info('MultiNavigation_0300 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(200);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll'));
      let btn1 = await scrollBar.scrollSearch(ON.id('pageDetail1Id'));
      await btn1.click()
      console.info('[MultiNavigation_0300] btn1 click');
      await CommonFunc.sleep(200);

      let btn2 = await driver.findComponent(ON.id('setKeepBottomPageId'));
      await btn2.click()
      console.info('[MultiNavigation_0300] btn2 click');
      await CommonFunc.sleep(200);

      let btn3 = await driver.findComponent(ON.id('detailPopId'));
      await btn2.click()
      console.info('[MultiNavigation_0300] btn3 click');
      await CommonFunc.sleep(200);

      let strJson: string = getInspectorByKey('detailTextId');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[MultiNavigation_0300] component obj is: ' + JSON.stringify(obj));
      console.info('[MultiNavigation_0300] content obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('PageDetail1');

      console.info('MultiNavigation_0300 END');
      done();
    });
  })
}