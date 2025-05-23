/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';


export default function search_bottom() {
  describe('search_bottom', () => {
    beforeEach(async (done: Function) => {
      console.info("search_bottom beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/search_bottom',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get search_bottom state pages: " + JSON.stringify(pages));
        if (!("search_bottom" == pages.name)) {
          console.info("get search_bottom state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push search_bottom page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push search_bottom page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_search_bottom_001
    * @tc.name  : testSearch
    * @tc.desc  : Click to trigger the keyboard when search is at the bottom
    * @tc.level : Level 2
    */
    it('search_bottom_001', Level.LEVEL2, async (done: Function) => {

      console.info('[search_bottom_001] START');
      await CommonFunc.sleep(1000);

      if (globalThis.winLeft == 0) {
        console.log('get click before Initial value')
        let text_00 = CommonFunc.getComponentRect('search_bottom_text_00');
        let text_01 = CommonFunc.getComponentRect('search_bottom_text_01');
        let text_02 = CommonFunc.getComponentRect('search_bottom_text_02');
        let text_03 = CommonFunc.getComponentRect('search_bottom_text_03');
        let Column_1 = CommonFunc.getComponentRect('search_bottom_Column_1');

        let driver = await Driver.create();
        await CommonFunc.sleep(500);
        await driver.mouseScroll({x:360, y:640}, true, 30, 2072)
        await CommonFunc.sleep(1000);

        console.log('get swipe after Initial value')
        let search_01 = CommonFunc.getComponentRect('search_bottom_search_01');

        console.log('assert click before position')
        let y1 = search_01.bottom

        await driver.click(
          Math.round(search_01.left + (search_01.right - search_01.left)/2),Math.round(search_01.top + (search_01.bottom - search_01.top)/2)
        );
        await CommonFunc.sleep(1000);

        console.log('get click after Initial value')
        let search_02 = CommonFunc.getComponentRect('search_bottom_search_01');
        let y2 = search_02.bottom

        expect(y1).assertEqual(y2);
      }

      done();
    });

  })
}
