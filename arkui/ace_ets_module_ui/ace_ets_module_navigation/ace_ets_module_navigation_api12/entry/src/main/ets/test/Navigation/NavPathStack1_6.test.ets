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

export default function NavPathStack1_6() {
  describe('NavPathStack1_6', () => {
    beforeEach(async (done: Function) => {
      console.info("NavPathStack1_6 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavPathStack1_6',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavPathStack1_6 state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get NavPathStack1_6 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NavPathStack1_6 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavPathStack1_6 page error:" + err);
      }
      console.info("NavPathStack1_6 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number NavPathStack1_6_0100
     * @tc.name testNavigation
     * @tc.desc
     */
    it('NavPathStack1_6_0100', 0, async (done: Function) => {
      console.info('NavPathStack1_6_0100 START');
      await CommonFunc.sleep(1000);

      sendEventByKey('NavPathStack1_6_btn6',10,"")
      await CommonFunc.sleep(500);
      let pageOne_text6 = getInspectorByKey('NavPathStack1_6_pageOne_text1');
      expect(String(JSON.parse(pageOne_text6).$attrs.content)).assertEqual('pageOne');
      await CommonFunc.sleep(500);

      console.info('NavPathStack1_6_0100 END');
      done();
    });



  })
}