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

export default function MultiNavigation19() {
  describe('MultiNavigation19', () => {
    beforeEach(async (done: Function) => {
      console.info("MultiNavigation19 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/MultiNavigation/MultiNavigation19',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MultiNavigation19 state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get MultiNavigation19 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push MultiNavigation19 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MultiNavigation19 page error:" + err);
      }
      console.info("MultiNavigation19 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number MultiNavigation19_0100
     * @tc.name testMultiNavigation
     * @tc.desc
     */
    it('MultiNavigation19_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('MultiNavigation19_0100 START');
      await CommonFunc.sleep(1000);

      sendEventByKey('MultiNavigation19_btn1',10,"")
      await CommonFunc.sleep(1000);
      sendEventByKey('MultiNavigation19_btn3',10,"")
      await CommonFunc.sleep(1000);
      sendEventByKey('MultiNavigation19_btn2',10,"")
      await CommonFunc.sleep(1000);
      sendEventByKey('MultiNavigation19_btn2',10,"")
      await CommonFunc.sleep(1000);

      sendEventByKey('MultiNavigation19_btn4',10,"")
      await CommonFunc.sleep(1000);
      let text1 = getInspectorByKey('MultiNavigation19_text1');
      expect(String(JSON.parse(text1).$attrs.content)).assertEqual('["PageHome1","PageHome1","PageDetail2","PageDetail1","PageDetail1"]');

      sendEventByKey('MultiNavigation19_btn5',10,"")
      await CommonFunc.sleep(1000);
      sendEventByKey('MultiNavigation19_btn4',10,"")
      await CommonFunc.sleep(1000);
      let text2 = getInspectorByKey('MultiNavigation19_text1');
      expect(String(JSON.parse(text2).$attrs.content)).assertEqual('[]');

      console.info('MultiNavigation19_0100 END');
      done();
    });

  })
}