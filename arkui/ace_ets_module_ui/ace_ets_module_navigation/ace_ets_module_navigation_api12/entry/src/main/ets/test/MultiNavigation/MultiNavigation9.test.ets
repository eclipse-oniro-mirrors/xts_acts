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

export default function MultiNavigation9() {
  describe('MultiNavigation9', () => {
    beforeEach(async (done: Function) => {
      console.info("MultiNavigation9 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/MultiNavigation/MultiNavigation9',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MultiNavigation9 state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get MultiNavigation9 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push MultiNavigation9 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MultiNavigation9 page error:" + err);
      }
      console.info("MultiNavigation9 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number MultiNavigation9_0100
     * @tc.name testMultiNavigation
     * @tc.desc
     */
    it('MultiNavigation9_0100', 0, async (done: Function) => {
      console.info('MultiNavigation9_0100 START');
      await CommonFunc.sleep(1000);

      sendEventByKey('MultiNavigation9_btn1',10,"")
      await CommonFunc.sleep(1000);
      sendEventByKey('MultiNavigation9_btn2',10,"")
      await CommonFunc.sleep(1000);
      sendEventByKey('MultiNavigation9_btn3',10,"")
      await CommonFunc.sleep(1000);
      sendEventByKey('MultiNavigation9_btn4',10,"")
      await CommonFunc.sleep(1000);

      let text1 = getInspectorByKey('MultiNavigation9_PageDetail1_text1');
      expect(String(JSON.parse(text1).$attrs.content)).assertEqual('PageDetail1');

      console.info('MultiNavigation9_0100 END');
      done();
    });

  })
}