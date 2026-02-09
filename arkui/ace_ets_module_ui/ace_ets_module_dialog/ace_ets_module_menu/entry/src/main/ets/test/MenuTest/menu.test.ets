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
import router from '@ohos.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import CommonFunc from "../../MainAbility/common/Common";
import { Driver, ON } from '@ohos.UiTest';

export default function menu() {
  describe('menu', () => {
    beforeEach(async (done: Function) => {
      console.info("menu beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/menu',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get menu state success " + JSON.stringify(pages));
        if (!(" menu" == pages.name)) {
          console.info("get menu state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push menu page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push menu page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info(" menu after each called");
    });

    /**
     * @tc.name   menu_001
     * @tc.number menu_001
     * @tc.desc   menu test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('menu_001', Level.LEVEL2, async (done: Function) => {
      console.info('[menu_001] START');

      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let button = await driver.findComponent(ON.id('button_start_preview'));
      await button.click();
      await CommonFunc.sleep(1000);

      let button1 = await driver.findComponent(ON.id('button_end_preview'));
      await button1.click();
      await CommonFunc.sleep(1000);


      let strJson1 = getInspectorByKey('preview_start');
      await CommonFunc.sleep(200);
      let obj1: ESObject = JSON.parse(strJson1);
      await CommonFunc.sleep(1000);
      expect(obj1.$attrs.content).assertEqual('10');


      let strJson2 = getInspectorByKey('preview_end');
      await CommonFunc.sleep(200);
      let obj2: ESObject = JSON.parse(strJson2);
      await CommonFunc.sleep(1000);
      expect(obj2.$attrs.content).assertEqual('20');


      console.info('[menu_001] END');
      done();
    });





  })
}


