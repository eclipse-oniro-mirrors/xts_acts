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

export default function NavPathStack20() {
  describe('NavPathStack20', () => {
    beforeEach(async (done: Function) => {
      console.info("NavPathStack20 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavPathStack20',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavPathStack20 state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get NavPathStack20 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NavPathStack20 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavPathStack20 page error:" + err);
      }
      console.info("NavPathStack20 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   NavPathStack20_0100
     * @tc.number NavPathStack20_0100
     * @tc.desc   NavPathStack20_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStack20_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('NavPathStack20_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn1 = await driver.findComponent(ON.id('NavPathStack20_btn1'));
      await btn1.click()
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('NavPathStack20_btn2'));
      await btn2.click()
      await CommonFunc.sleep(1000);

      let text1 = getInspectorByKey('NavPathStack20_text1');
      expect(String(JSON.parse(text1).$attrs.content)).assertEqual('["pageTwo"]');
      await CommonFunc.sleep(500);

      console.info('NavPathStack20_0100 END');
      done();
    });




  })
}