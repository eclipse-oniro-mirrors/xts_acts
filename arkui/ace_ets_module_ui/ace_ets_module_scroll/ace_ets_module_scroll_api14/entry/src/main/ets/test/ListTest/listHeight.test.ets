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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function listHeight() {
  describe('listHeight', () => {
    beforeEach(async (done: Function) => {
      console.info("listHeight beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/listHeight",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get listHeight state pages:" + JSON.stringify(pages));
        if (!("listHeight" == pages.name)) {
          console.info("get listHeight pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push listHeight page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push listHeight page error:" + err);
      }
      console.info("listHeight beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("listHeight after each called");
    });

    /**
     * @tc.name   listHeight_0100
     * @tc.number listHeight_001
     * @tc.desc   Set elements that are multiples of 3 is 0 and call the ScrollPage interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('listHeight_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[listHeight_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('height_anTrue'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('height_last_index');
      console.info("[listHeight_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[listHeight_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('List: 6');
      console.info('[listHeight_0100] END');
      done();
    });
  })
}
