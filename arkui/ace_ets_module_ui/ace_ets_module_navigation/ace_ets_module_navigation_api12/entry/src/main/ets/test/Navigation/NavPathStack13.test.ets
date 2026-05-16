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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function NavPathStack13() {
  describe('NavPathStack13', () => {
    beforeEach(async (done: Function) => {
      console.info("NavPathStack13 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavPathStack13',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavPathStack13 state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get NavPathStack13 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NavPathStack13 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavPathStack13 page error:" + err);
      }
      console.info("NavPathStack13 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   NavPathStack13_0100
     * @tc.number NavPathStack13_0100
     * @tc.desc   NavPathStack13_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStack13_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('NavPathStack13_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn3 = await driver.findComponent(ON.id('NavPathStack13_btn3'));
      await btn3.click()
      await CommonFunc.sleep(1000);

      let pageThree_text1 = getInspectorByKey('NavPathStack13_pageThree_text1');
      await CommonFunc.sleep(500);
      expect(String(JSON.parse(pageThree_text1).$attrs.content)).assertEqual('pageThree');
      await CommonFunc.sleep(500);

      console.info('NavPathStack13_0100 END');
      done();
    });

    /**
     * @tc.name   NavPathStack13_0200
     * @tc.number NavPathStack13_0200
     * @tc.desc   NavPathStack13_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStack13_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('NavPathStack13_0200 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn3 = await driver.findComponent(ON.id('NavPathStack13_btn3'));
      await btn3.click()
      await CommonFunc.sleep(1000);

      let btn1 = await driver.findComponent(ON.id('NavPathStack13_btn1'));
      await btn1.click()
      await CommonFunc.sleep(1000);

      let pageOne_text1 = getInspectorByKey('NavPathStack13_pageOne_text1');
      await CommonFunc.sleep(500);
      expect(String(JSON.parse(pageOne_text1).$attrs.content)).assertEqual('pageOne');
      await CommonFunc.sleep(500);

      console.info('NavPathStack13_0200 END');
      done();
    });

    /**
     * @tc.name   NavPathStack13_0300
     * @tc.number NavPathStack13_0300
     * @tc.desc   NavPathStack13_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStack13_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('NavPathStack13_0300 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn3 = await driver.findComponent(ON.id('NavPathStack13_btn3'));
      await btn3.click()
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('NavPathStack13_btn2'));
      await btn2.click()
      await CommonFunc.sleep(1000);

      let pageThree_text1 = getInspectorByKey('NavPathStack13_pageThree_text1');
      await CommonFunc.sleep(500);
      expect(String(JSON.parse(pageThree_text1).$attrs.content)).assertEqual('pageThree');
      await CommonFunc.sleep(500);

      console.info('NavPathStack13_0300 END');
      done();
    });


  })
}