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

export default function MultiNavigation7() {
  describe('MultiNavigation7', () => {
    beforeEach(async (done: Function) => {
      console.info("MultiNavigation7 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/MultiNavigation/MultiNavigation7',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MultiNavigation7 state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get MultiNavigation7 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push MultiNavigation7 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MultiNavigation7 page error:" + err);
      }
      console.info("MultiNavigation7 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number MultiNavigation7_0100
     * @tc.name testMultiNavigation
     * @tc.desc
     */
    it('MultiNavigation7_0100', 0, async (done: Function) => {
      console.info('MultiNavigation7_0100 START');
      await CommonFunc.sleep(1000);

      sendEventByKey('MultiNavigation7_btn1',10,"")
      await CommonFunc.sleep(1000);
      sendEventByKey('MultiNavigation7_PageDetail1_btn1',10,"")
      await CommonFunc.sleep(1000);
      sendEventByKey('MultiNavigation7_pageHome1_btn1',10,"")
      await CommonFunc.sleep(1000);
      sendEventByKey('MultiNavigation7_PageDetail1_btn2',10,"")
      await CommonFunc.sleep(1000);

      let text1 = getInspectorByKey('MultiNavigation7_pageFull_text1');
      expect(String(JSON.parse(text1).$attrs.content)).assertEqual('pageFull');

      sendEventByKey('MultiNavigation7_btn2',10,"")
      await CommonFunc.sleep(1000);
      let text2 = getInspectorByKey('MultiNavigation7_text1');
      expect(String(JSON.parse(text2).$attrs.content)).assertEqual('["pageFull"]');

      console.info('MultiNavigation7_0100 END');
      done();
    });



  })
}