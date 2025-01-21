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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../MainAbility/utils/Common';
import {MessageManager,Callback} from '../MainAbility/utils/MessageManager';


export default function search_top() {
  describe('search_top', function () {
    beforeEach(async function (done) {
      console.info("search_top beforeEach start");
      let options = {
        uri: 'MainAbility/pages/search_top',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get search_top state pages: " + JSON.stringify(pages));
        if (!("search_top" == pages.name)) {
          console.info("get search_top state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push search_top page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push search_top page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_search_top_001
    * @tc.name  : testSearch
    * @tc.desc  : Click to trigger the keyboard when search is at the top
    * @tc.level : Level 2
    */
    it('search_top_001', 0, async function (done) {

      console.info('[search_top_001] START');
      await CommonFunc.sleep(1000);

      console.log('get Initial value')
      let text_01 = CommonFunc.getComponentRect('search_top_text_01');
      let text_02 = CommonFunc.getComponentRect('search_top_text_02');
      let text_03 = CommonFunc.getComponentRect('search_top_text_03');
      let search_01 = CommonFunc.getComponentRect('search_top_search_01');
      let Column_1 = CommonFunc.getComponentRect('search_top_Column_1');

      console.log('assert position')
      expect(search_01.top).assertEqual(Column_1.top);
      console.log('search_01.top' + search_01.top)
      console.log('Column_1.top' + Column_1.top)

      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      await driver.click(vp2px(200),vp2px(20));
      await CommonFunc.sleep(1000);

      expect(search_01.top).assertEqual(Column_1.top);
      console.log('search_01.top' + search_01.top)
      console.log('Column_1.top' + Column_1.top)


      done();
    });

  })
}
