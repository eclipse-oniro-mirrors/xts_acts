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

export default function MultiNavigation11() {
  describe('MultiNavigation11', () => {
    beforeEach(async (done: Function) => {
      console.info("MultiNavigation11 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/MultiNavigation/MultiNavigation11',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MultiNavigation11 state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get MultiNavigation11 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push MultiNavigation11 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MultiNavigation11 page error:" + err);
      }
      console.info("MultiNavigation11 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number MultiNavigation11_0100
     * @tc.name testMultiNavigation
     * @tc.desc
     */
    it('MultiNavigation11_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('MultiNavigation11_0100 START');
      await CommonFunc.sleep(1000);

      sendEventByKey('MultiNavigation11_btn1',10,"")
      await CommonFunc.sleep(1000);
      sendEventByKey('MultiNavigation11_btn2',10,"")
      await CommonFunc.sleep(1000);
      sendEventByKey('MultiNavigation11_btn3',10,"")
      await CommonFunc.sleep(1000);
      sendEventByKey('MultiNavigation11_btn4',10,"")
      await CommonFunc.sleep(1000);
      sendEventByKey('MultiNavigation11_btn5',10,"")
      await CommonFunc.sleep(1000);
      sendEventByKey('MultiNavigation11_btn6',10,"")
      await CommonFunc.sleep(1000);

      let text1 = getInspectorByKey('MultiNavigation11_PageDetail1_text1');
      expect(String(JSON.parse(text1).$attrs.content)).assertEqual('PageDetail1');

      console.info('MultiNavigation11_0100 END');
      done();
    });

  })
}