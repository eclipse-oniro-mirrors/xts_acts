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

export default function NavPathStack7() {
  describe('NavPathStack7', () => {
    beforeEach(async (done: Function) => {
      console.info("NavPathStack7 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavPathStack7',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavPathStack7 state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get NavPathStack7 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NavPathStack7 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavPathStack7 page error:" + err);
      }
      console.info("NavPathStack7 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number NavPathStack7_0100
     * @tc.name testNavigation
     * @tc.desc
     */
    it('NavPathStack7_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('NavPathStack7_0100 START');
      await CommonFunc.sleep(1000);
      sendEventByKey('NavPathStack7_btn2',10,"")
      await CommonFunc.sleep(1000);
      sendEventByKey('NavPathStack7_btn1',10,"")
      await CommonFunc.sleep(1000);
      sendEventByKey('NavPathStack7_btn3',10,"")
      await CommonFunc.sleep(500);

      let text1 = getInspectorByKey('NavPathStack7_text1');
      expect(String(JSON.parse(text1).$attrs.content)).assertEqual('["pageTwo","pageOne"]');
      await CommonFunc.sleep(500);

      console.info('NavPathStack7_0100 END');
      done();
    });


  })
}