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

import CommonFunc from '../../MainAbility/utils/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function ScrollApi1() {
  describe('ScrollApi1', () => {
    beforeEach(async (done: Function) => {
      console.info("ScrollApi1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/ScrollApi1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ScrollApi1 state pages:" + JSON.stringify(pages));
        if (!("ScrollApi1" == pages.name)) {
          console.info("get ScrollApi1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ScrollApi1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ScrollApi1 page error:" + err);
      }
      console.info("ScrollApi1 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   ScrollApi1_0100
     * @tc.number ScrollApi1_0100
     * @tc.desc   ScrollApi1_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ScrollApi1_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ScrollApi1_0100 START');
      await CommonFunc.sleep(1000);

      sendEventByKey('ScrollApi1_btn',10,"")
      await CommonFunc.sleep(1000);

      let scroll = CommonFunc.getComponentRect('ScrollApi1_Scroll');
      let listItem1 = CommonFunc.getComponentRect('ScrollApi1_listItem1');
      expect(scroll.top).assertEqual(listItem1.top)

      await CommonFunc.sleep(1000);

      console.info('ScrollApi1_0100 END');
      done();
    });

  })
}