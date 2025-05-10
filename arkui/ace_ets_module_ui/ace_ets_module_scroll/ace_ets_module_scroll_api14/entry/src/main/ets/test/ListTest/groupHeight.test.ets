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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function groupHeight() {
  describe('groupHeight', () => {
    beforeEach(async (done: Function) => {
      console.info("groupHeight beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/groupHeight",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get groupHeight state pages:" + JSON.stringify(pages));
        if (!("groupHeight" == pages.name)) {
          console.info("get groupHeight pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push groupHeight page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push groupHeight page error:" + err);
      }
      console.info("groupHeight beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("groupHeight after each called");
    });

    /**
     * @tc.number    groupHeight_001
     * @tc.name      groupHeight_0100
     * @tc.desc      Set integer multiples of 2 in ListItem is 0 and call the ScrollPage interface.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('groupHeight_0100', 0, async (done: Function) => {
      console.info('[groupHeight_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('group_animation_height'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('group_height_mess');
      console.info("[groupHeight_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[groupHeight_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('onScrollVisibleContentChange: 1');
      console.info('[groupHeight_0100] END');
      done();
    });
  })
}
