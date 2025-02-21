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
import Utils from '../../MainAbility/utils/Common';
import { Driver, ON } from '@ohos.UiTest';

export default function TabsApi() {
  describe('TabsApi', () => {
    beforeEach(async (done: Function) => {
      console.info("TabsApi beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AttrApi/TabsApi',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TabsApi state success " + JSON.stringify(pages));
        if (!("TabsApi" == pages.name)) {
          console.info("get TabsApi state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push TabsApi page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TabsApi page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("TabsApi after each called");
    });

    /**
     * @tc.number TabsApi_001
     * @tc.name TabsApi_001
     * @tc.desc Tabs customContentTransition test
     * @tc.level Level 2
     */
    it('TabsApi_001', 0, async (done: Function) => {
      console.info('[TabsApi_001] START');
      await Utils.sleep(1000);

      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn = await driver.findComponent(ON.text('Yellow'));
      await btn.click()
      await Utils.sleep(4000);

      let strJson = getInspectorByKey('TabsApi_text1');
      await Utils.sleep(1000);
      console.info("[TabsApi_001] obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('onChange');
      console.info('[TabsApi_001] END');
      done();
    });
  })
}


