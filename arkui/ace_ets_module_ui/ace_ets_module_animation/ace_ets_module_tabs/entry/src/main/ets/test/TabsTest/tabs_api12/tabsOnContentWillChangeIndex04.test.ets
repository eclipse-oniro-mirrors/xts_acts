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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';

export default function tabsOnContentWillChangeIndex04JsunitTest() {
  describe('tabsOnContentWillChangeIndex04JsunitTest', () => {
    beforeEach(async (done: Function) => {
      console.info("tabsOnContentWillChangeIndex04JsunitTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabsOnContentWillChangeIndex04JsunitTest state pages:" + JSON.stringify(pages));
        if (!("tabs_onContentWillChangeIndex04" == pages.name)) {
          console.info("tabsOnContentWillChangeIndex03JsunitTest  pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Tabs/tabs_api12/tabs_onContentWillChangeIndex04"})
          await CommonFunc.sleep(2000);
          console.info("push tabsOnContentWillChangeIndex04JsunitTest result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsOnContentWillChangeIndex04JsunitTest page error:" + err);
      }
      console.info("tabsOnContentWillChangeIndex04JsunitTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("tabsOnContentWillChangeIndex4JsunitTest after each called");
    });


    /**
     * @tc.name   tabsOnContentWillChangeJsunitTest_0040
     * @tc.number tabsOnContentWillChangeJsunitTest_0040
     * @tc.desc   tabsOnContentWillChangeJsunitTest_0040
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tabsOnContentWillChangeJsunitTest_0040', Level.LEVEL1, async (done: Function) => {
      console.info('tabsOnContentWillChangeIndex04JsunitTest START');

      // change index it can not change index 3
      let driver = Driver.create();
      let button01 = await driver.findComponent(ON.id("changeIndexTest"));
      await button01.click();
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('currentIndex4x');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[tabsOnContentWillChangeJsunitTest_0040] component obj is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('1');

      await button01.click();
      await CommonFunc.sleep(2000);

      let strJson2 = getInspectorByKey('currentIndex4x');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[tabsOnContentWillChangeJsunitTest_0040] component obj is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('2');

      await button01.click();
      await CommonFunc.sleep(2000);

      let strJson3 = getInspectorByKey('currentIndex4x');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[tabsOnContentWillChangeJsunitTest_0040] component obj is: " + JSON.stringify(obj3));
      expect(obj3.$attrs.content).assertEqual('2');

      console.info('tabsOnContentWillChangeIndex04JsunitTest END');
      done();
    });


  })
}
