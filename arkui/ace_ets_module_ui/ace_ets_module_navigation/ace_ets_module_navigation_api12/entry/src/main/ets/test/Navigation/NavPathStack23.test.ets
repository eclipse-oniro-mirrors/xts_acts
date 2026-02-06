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

export default function NavPathStack23() {
  describe('NavPathStack23', () => {
    beforeEach(async (done: Function) => {
      console.info("NavPathStack23 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavPathStack23',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavPathStack23 state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get NavPathStack23 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NavPathStack23 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavPathStack23 page error:" + err);
      }
      console.info("NavPathStack23 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number NavPathStack23_0100
     * @tc.name testNavigation
     * @tc.desc
     */
    it('NavPathStack23_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('NavPathStack23_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn1 = await driver.findComponent(ON.id('NavPathStack23_btn1'));
      await btn1.click()
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id('NavPathStack23_btn2'));
      await btn2.click()
      await CommonFunc.sleep(1000);
      let btn3 = await driver.findComponent(ON.id('NavPathStack23_btn3'));
      await btn3.click()
      await CommonFunc.sleep(1000);


      let text1 = getInspectorByKey('NavPathStack23_text1');
      expect(String(JSON.parse(text1).$attrs.content)).assertEqual('pageOne onWillAppear pageOne onAppear pageOne onWillShow pageOne onShown pageThree onWillAppear pageOne onWillHide pageThree onAppear pageThree onWillShow pageOne onHidden pageThree onShown pageThree onWillHide pageOne onWillShow pageThree onHidden pageThree onWillDisappear pageOne onShown pageThree onDisAppear ');
      await CommonFunc.sleep(500);

      console.info('NavPathStack23_0100 END');
      done();
    });




  })
}