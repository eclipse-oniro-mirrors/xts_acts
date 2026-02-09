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

export default function NavPathStack10() {
  describe('NavPathStack10', () => {
    beforeEach(async (done: Function) => {
      console.info("NavPathStack10 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavPathStack10',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavPathStack10 state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get NavPathStack10 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NavPathStack10 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavPathStack10 page error:" + err);
      }
      console.info("NavPathStack10 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   NavPathStack10_0100
     * @tc.number NavPathStack10_0100
     * @tc.desc   NavPathStack10_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStack10_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('NavPathStack10_0100 START');
      await CommonFunc.sleep(1000);

      sendEventByKey('NavPathStack10_btn2',10,"")
      await CommonFunc.sleep(500);
      sendEventByKey('NavPathStack10_btn1',10,"")
      await CommonFunc.sleep(500);
      sendEventByKey('NavPathStack10_btn8',10,"")
      await CommonFunc.sleep(500);

      let text5 = getInspectorByKey('NavPathStack10_text5');
      expect(String(JSON.parse(text5).$attrs.content)).assertEqual('[1]');
      await CommonFunc.sleep(500);

      console.info('NavPathStack10_0100 END');
      done();
    });

  })
}