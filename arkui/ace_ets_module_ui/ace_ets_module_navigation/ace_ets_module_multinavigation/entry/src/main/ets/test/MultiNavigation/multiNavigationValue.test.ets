/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { Component, Driver, UiWindow, ON, MatchPattern, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function multiNavigationValue() {
  describe('multiNavigationValue', () => {
    beforeEach(async (done: Function) => {
      console.info("MultiNavigation beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/MultiNavigation/multiNavigationValue',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MultiNavigation state pages:" + JSON.stringify(pages));
        if (!("multiNavigationValue" == pages.name)) {
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
     * @tc.name   multiNavigationValue_0100
     * @tc.number SUB_ARKUI_MULTINAVIGATION_POPTOINDEX_0100
     * @tc.desc   Test MultiNavigation popToIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('multiNavigationValue_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('multiNavigationValue_0100 START');
      await CommonFunc.sleep(500);
      let driver = Driver.create();
      await CommonFunc.sleep(200);
      let btn = await driver.findComponent(ON.id('getAllPathName_page'));
      await btn.click()
      await CommonFunc.sleep(1000);
      console.info('[multiNavigationValue_0100] btn click');
      let text1 = getInspectorByKey('getAllPathName_page_text');
      console.info('[multiNavigationValue_0100] content1: ' + JSON.stringify(JSON.parse(text1).$attrs.content));
      expect(String(JSON.parse(text1).$attrs.content)).assertEqual('["PageDetail"]');

      let btn1 = await driver.findComponent(ON.id('MultiNavigation_btn_push2'));
      await btn1.click()
      console.info('[multiNavigationValue_0100] btn1 click');
      await CommonFunc.sleep(500);
      await btn.click()
      await CommonFunc.sleep(1000);
      let text2 = getInspectorByKey('getAllPathName_page_text');
      console.info('[multiNavigationValue_0100] content2: ' + JSON.stringify(JSON.parse(text2).$attrs.content));
      expect(String(JSON.parse(text2).$attrs.content)).assertEqual('["PageDetail","PageDetail2"]');

      let btn_neg1 = await driver.findComponent(ON.id('MultiNavigation_popToIndex_neg1'));
      await btn_neg1.click()
      console.info('[multiNavigationValue_0100] btn_neg1 click');
      await CommonFunc.sleep(1500);
      await btn.click()
      await CommonFunc.sleep(1000);
      let text3 = getInspectorByKey('getAllPathName_page_text');
      console.info('[multiNavigationValue_0100] content3: ' + JSON.stringify(JSON.parse(text3).$attrs.content));
      expect(String(JSON.parse(text3).$attrs.content)).assertEqual('["PageDetail","PageDetail2"]');

      let btn_0 = await driver.findComponent(ON.id('MultiNavigation_popToIndex_0'));
      await btn_0.click()
      console.info('[multiNavigationValue_0100] btn_0 click');
      await CommonFunc.sleep(1500);
      await btn.click()
      await CommonFunc.sleep(1000);
      let text4 = getInspectorByKey('getAllPathName_page_text');
      console.info('[multiNavigationValue_0100] content4: ' + JSON.stringify(JSON.parse(text4).$attrs.content));
      expect(String(JSON.parse(text4).$attrs.content)).assertEqual('["PageDetail"]');

      console.info('multiNavigationValue_0100 END');
      done();
    });



    /**
     * @tc.name   multiNavigationValue_0200
     * @tc.number SUB_ARKUI_MULTINAVIGATION_POPTOINDEX_0200
     * @tc.desc   Test MultiNavigation popToIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('multiNavigationValue_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('multiNavigationValue_0200 START');
      await CommonFunc.sleep(500);
      let driver = Driver.create();
      await CommonFunc.sleep(200);
      let btn = await driver.findComponent(ON.id('getAllPathName_page'));
      await btn.click()
      await CommonFunc.sleep(1000);
      console.info('[multiNavigationValue_0200] btn click');
      let text1 = getInspectorByKey('getAllPathName_page_text');
      console.info('[multiNavigationValue_0200] content1: ' + JSON.stringify(JSON.parse(text1).$attrs.content));
      expect(String(JSON.parse(text1).$attrs.content)).assertEqual('["PageDetail"]');

      let btn1 = await driver.findComponent(ON.id('MultiNavigation_btn_push2'));
      await btn1.click()
      console.info('[multiNavigationValue_0200] btn1 click');
      await CommonFunc.sleep(500);
      await btn.click()
      await CommonFunc.sleep(1000);
      let text2 = getInspectorByKey('getAllPathName_page_text');
      console.info('[multiNavigationValue_0200] content2: ' + JSON.stringify(JSON.parse(text2).$attrs.content));
      expect(String(JSON.parse(text2).$attrs.content)).assertEqual('["PageDetail","PageDetail2"]');

      let btn2_neg1 = await driver.findComponent(ON.id('MultiNavigation_popToIndex2_neg1'));
      await btn2_neg1.click()
      console.info('[multiNavigationValue_0200] btn2_neg1 click');
      await CommonFunc.sleep(1500);
      await btn.click()
      await CommonFunc.sleep(1000);
      let text3 = getInspectorByKey('getAllPathName_page_text');
      console.info('[multiNavigationValue_0200] content3: ' + JSON.stringify(JSON.parse(text3).$attrs.content));
      expect(String(JSON.parse(text3).$attrs.content)).assertEqual('["PageDetail","PageDetail2"]');

      let btn2_0 = await driver.findComponent(ON.id('MultiNavigation_popToIndex2_0'));
      await btn2_0.click()
      console.info('[multiNavigationValue_0200] btn2_0 click');
      await CommonFunc.sleep(1500);
      await btn.click()
      await CommonFunc.sleep(1000);
      let text4 = getInspectorByKey('getAllPathName_page_text');
      console.info('[multiNavigationValue_0200] content4: ' + JSON.stringify(JSON.parse(text4).$attrs.content));
      expect(String(JSON.parse(text4).$attrs.content)).assertEqual('["PageDetail"]');

      console.info('multiNavigationValue_0200 END');
      done();
    });
  })
}