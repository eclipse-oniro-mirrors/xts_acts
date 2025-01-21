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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
// import Utils from '../../utils/Common'
import CommonFunc from "../../MainAbility/common/Common";
import { Driver, ON } from '@ohos.UiTest';

export default function ImageAttr() {
  describe('NavigationAttr', () => {
    beforeEach(async (done: Function) => {
      console.info("NavigationAttr beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/MethodStyle/NavigationAttr',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavigationAttr state success " + JSON.stringify(pages));
        if (!("NavigationAttr" == pages.name)) {
          console.info("get NavigationAttr state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push NavigationAttr page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavigationAttr page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("NavigationAttr after each called");
    });

    /**
     * @tc.number NavigationAttr_001
     * @tc.name NavigationAttr_001
     * @tc.desc Navigation test
     * @tc.level Level 2
     */
    it('NavigationAttr_001', 0, async (done: Function) => {
      console.info('[NavigationAttr_001] START');

      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let button = await driver.findComponent(ON.id('pushPathByName_test'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('finishTransitionTest_api');
      await CommonFunc.sleep(200);
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('444');

      let strJson2 = getInspectorByKey('customNavContentTransitionTest_api');
      await CommonFunc.sleep(200);
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('222');
      console.info('[NavigationAttr_001] END');
      done();
    });
  })
}


