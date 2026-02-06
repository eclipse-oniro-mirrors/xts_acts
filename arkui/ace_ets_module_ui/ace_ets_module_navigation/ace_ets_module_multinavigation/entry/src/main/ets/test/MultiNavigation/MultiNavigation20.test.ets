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

export default function MultiNavigation20() {
  describe('MultiNavigation20', () => {
    beforeEach(async (done: Function) => {
      console.info("MultiNavigation20 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/MultiNavigation/MultiNavigation20',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MultiNavigation20 state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get MultiNavigation20 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push MultiNavigation20 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MultiNavigation20 page error:" + err);
      }
      console.info("MultiNavigation20 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   MultiNavigation20_0100
     * @tc.number MultiNavigation20_0100
     * @tc.desc   MultiNavigation20_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiNavigation20_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('MultiNavigation20_0100 START');
      await CommonFunc.sleep(1000);

      sendEventByKey('MultiNavigation20_btn1',10,"")
      await CommonFunc.sleep(1000);
      let text1 = getInspectorByKey('MultiNavigation20_text1');
      expect(String(JSON.parse(text1).$attrs.content)).assertEqual('["PageHome1"]');

      sendEventByKey('MultiNavigation20_btn2',10,"")
      await CommonFunc.sleep(1000);
      let text2 = getInspectorByKey('MultiNavigation20_text1');
      expect(String(JSON.parse(text2).$attrs.content)).assertEqual('["PageHome1"]');

      sendEventByKey('MultiNavigation20_btn3',10,"")
      await CommonFunc.sleep(1000);
      let text3 = getInspectorByKey('MultiNavigation20_text1');
      expect(String(JSON.parse(text3).$attrs.content)).assertEqual('["PageHome1"]');

      sendEventByKey('MultiNavigation20_btn4',10,"")
      await CommonFunc.sleep(1000);
      let text4 = getInspectorByKey('MultiNavigation20_text1');
      expect(String(JSON.parse(text4).$attrs.content)).assertEqual('["PageHome1"]');

      sendEventByKey('MultiNavigation20_btn5',10,"")
      await CommonFunc.sleep(1000);
      let text5 = getInspectorByKey('MultiNavigation20_text1');
      expect(String(JSON.parse(text5).$attrs.content)).assertEqual('["PageHome1"]');

      sendEventByKey('MultiNavigation20_btn6',10,"")
      await CommonFunc.sleep(1000);
      let text6 = getInspectorByKey('MultiNavigation20_text1');
      expect(String(JSON.parse(text6).$attrs.content)).assertEqual('["PageHome1"]');

      sendEventByKey('MultiNavigation20_btn7',10,"")
      await CommonFunc.sleep(1000);
      let text7 = getInspectorByKey('MultiNavigation20_text1');
      expect(String(JSON.parse(text7).$attrs.content)).assertEqual('["PageHome1"]');

      sendEventByKey('MultiNavigation20_btn8',10,"")
      await CommonFunc.sleep(1000);
      let text8 = getInspectorByKey('MultiNavigation20_text1');
      expect(String(JSON.parse(text8).$attrs.content)).assertEqual('["PageHome1"]');

      sendEventByKey('MultiNavigation20_btn9',10,"")
      await CommonFunc.sleep(1000);
      let text9 = getInspectorByKey('MultiNavigation20_text1');
      expect(String(JSON.parse(text9).$attrs.content)).assertEqual('["PageHome1"]');

      console.info('MultiNavigation20_0100 END');
      done();
    });

  })
}