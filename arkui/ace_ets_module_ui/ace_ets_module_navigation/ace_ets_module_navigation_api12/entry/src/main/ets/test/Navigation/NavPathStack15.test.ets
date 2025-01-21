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

export default function NavPathStack15() {
  describe('NavPathStack15', () => {
    beforeEach(async (done: Function) => {
      console.info("NavPathStack15 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavPathStack15',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavPathStack15 state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get NavPathStack15 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NavPathStack15 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavPathStack15 page error:" + err);
      }
      console.info("NavPathStack15 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number NavPathStack15_0100
     * @tc.name testNavigation
     * @tc.desc
     */
    it('NavPathStack15_0100', 0, async (done: Function) => {
      console.info('NavPathStack15_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn3 = await driver.findComponent(ON.id('NavPathStack15_btn3'));
      await btn3.click()
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('NavPathStack15_btn2'));
      await btn2.click()
      await CommonFunc.sleep(1000);

      let pageThree_text1 = getInspectorByKey('NavPathStack15_pageThree_text1');
      await CommonFunc.sleep(500);
      expect(String(JSON.parse(pageThree_text1).$attrs.content)).assertEqual('pageThree');
      await CommonFunc.sleep(500);

      console.info('NavPathStack15_0100 END');
      done();
    });

  })
}