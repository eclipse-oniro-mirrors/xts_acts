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

import CommonFunc from '../../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function navigation_add1_1() {
  describe('navigation_add1_1', () => {
    beforeEach(async (done: Function) => {
      console.info("navigation_add1_1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/navigation_add/navigation_add1_1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get navigation_add1_1 state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get navigation_add1_1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push navigation_add1_1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push navigation_add1_1 page error:" + err);
      }
      console.info("navigation_add1_1 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number navigation_add1_1_0100
     * @tc.name testNavigation
     * @tc.desc
     */
    it('navigation_add1_1_0100', 0, async (done: Function) => {
      console.info('navigation_add1_1_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('navigation_add1_1_btn1'));
      await btn1.click()
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id('navigation_add1_1_pageOne_btn1'));
      await btn2.click()
      await CommonFunc.sleep(1000);

      let pageTwo_text1 = getInspectorByKey('navigation_add1_1_pageTwo_text1');
      expect(String(JSON.parse(pageTwo_text1).$attrs.content)).assertEqual('pageTwo');
      console.log('pageTwo_text1' + String(JSON.parse(pageTwo_text1).$attrs.content))
      let navigation_text1_1 = getInspectorByKey('navigation_add1_1_text1');
      expect(String(JSON.parse(navigation_text1_1).$attrs.content)).assertEqual('"pageOne"');
      console.log('navigation_text1_1' + String(JSON.parse(pageTwo_text1).$attrs.content))
      let navigation_text2_1 = getInspectorByKey('navigation_add1_1_text2');
      expect(String(JSON.parse(navigation_text2_1).$attrs.content)).assertEqual('"pageTwo"');
      console.log('navigation_text2_1' + String(JSON.parse(pageTwo_text1).$attrs.content))
      let navigation_text3_1 = getInspectorByKey('navigation_add1_1_text3');
      expect(String(JSON.parse(navigation_text3_1).$attrs.content)).assertEqual('1');
      console.log('navigation_text3_1' + String(JSON.parse(pageTwo_text1).$attrs.content))
      let navigation_text4_1 = getInspectorByKey('navigation_add1_1_text4');
      expect(String(JSON.parse(navigation_text4_1).$attrs.content)).assertEqual('true');
      console.log('navigation_text4_1' + String(JSON.parse(pageTwo_text1).$attrs.content))
      await CommonFunc.sleep(3000);
      console.info('navigation_add1_1_0100 END');
      done();
    });



  })
}