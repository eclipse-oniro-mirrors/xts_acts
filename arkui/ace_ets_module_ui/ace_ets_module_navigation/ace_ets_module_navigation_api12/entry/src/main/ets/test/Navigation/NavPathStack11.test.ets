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

export default function NavPathStack11() {
  describe('NavPathStack11', () => {
    beforeEach(async (done: Function) => {
      console.info("NavPathStack11 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavPathStack11',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavPathStack11 state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get NavPathStack11 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NavPathStack11 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavPathStack11 page error:" + err);
      }
      console.info("NavPathStack11 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number NavPathStack11_0100
     * @tc.name testNavigation
     * @tc.desc
     */
    it('NavPathStack11_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('NavPathStack11_0100 START');
      await CommonFunc.sleep(1000);

      sendEventByKey('NavPathStack11_btn2',10,"")
      await CommonFunc.sleep(500);
      sendEventByKey('NavPathStack11_btn1',10,"")
      await CommonFunc.sleep(500);
      sendEventByKey('NavPathStack11_btn5',10,"")
      await CommonFunc.sleep(500);

      let text2 = getInspectorByKey('NavPathStack11_text2');
      expect(String(JSON.parse(text2).$attrs.content)).assertEqual('2');
      await CommonFunc.sleep(500);

      console.info('NavPathStack11_0100 END');
      done();
    });




  })
}