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

export default function MultiNavigation27() {
  describe('MultiNavigation27', () => {
    beforeEach(async (done: Function) => {
      console.info("MultiNavigation27 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/MultiNavigation/MultiNavigation27',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MultiNavigation27 state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get MultiNavigation27 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push MultiNavigation27 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MultiNavigation27 page error:" + err);
      }
      console.info("MultiNavigation27 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   MultiNavigation27_0100
     * @tc.number MultiNavigation27_0100
     * @tc.desc   MultiNavigation27_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiNavigation27_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('MultiNavigation27_0100 START');
      await CommonFunc.sleep(1000);

      sendEventByKey('MultiNavigation27_btn1',10,"")
      await CommonFunc.sleep(1000);
      sendEventByKey('MultiNavigation27_btn2',10,"")
      await CommonFunc.sleep(1000);
      sendEventByKey('MultiNavigation27_btn3',10,"")
      await CommonFunc.sleep(1000);
      sendEventByKey('MultiNavigation27_btn1',10,"")
      await CommonFunc.sleep(1000);
      sendEventByKey('MultiNavigation27_btn4',10,"")
      await CommonFunc.sleep(1000);

      let text1 = getInspectorByKey('MultiNavigation27_text1');
      expect(String(JSON.parse(text1).$attrs.content)).assertEqual('["PageHome1","PageHome1"]');

      console.info('MultiNavigation27_0100 END');
      done();
    });

  })
}