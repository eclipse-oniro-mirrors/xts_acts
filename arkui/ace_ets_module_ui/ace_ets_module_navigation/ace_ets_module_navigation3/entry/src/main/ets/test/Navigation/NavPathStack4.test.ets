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

export default function NavPathStack4() {
  describe('NavPathStack4', () => {
    beforeEach(async (done: Function) => {
      console.info("NavPathStack4 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavPathStack4',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavPathStack4 state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get NavPathStack4 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NavPathStack4 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavPathStack4 page error:" + err);
      }
      console.info("NavPathStack4 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   NavPathStack4_0100
     * @tc.number NavPathStack4_0100
     * @tc.desc   NavPathStack4_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStack4_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('NavPathStack4_0100 START');
      await CommonFunc.sleep(1000);

      sendEventByKey('NavPathStack4_btn2',10,"")
      await CommonFunc.sleep(500);
      sendEventByKey('NavPathStack4_btn1',10,"")
      await CommonFunc.sleep(500);
      sendEventByKey('NavPathStack4_btn3',10,"")
      await CommonFunc.sleep(500);

      let pageTwo_text1 = getInspectorByKey('NavPathStack4_pageTwo_text1');
      expect(String(JSON.parse(pageTwo_text1).$attrs.content)).assertEqual('pageTwo');
      await CommonFunc.sleep(500);

      console.info('NavPathStack4_0100 END');
      done();
    });
    /**
     * @tc.name   NavPathStack4_0200
     * @tc.number NavPathStack4_0200
     * @tc.desc   NavPathStack4_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStack4_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('NavPathStack4_0200 START');
      await CommonFunc.sleep(1000);

      sendEventByKey('NavPathStack4_btn1',10,"")
      await CommonFunc.sleep(500);
      sendEventByKey('NavPathStack4_btn2',10,"")
      await CommonFunc.sleep(500);
      sendEventByKey('NavPathStack4_btn4',10,"")
      await CommonFunc.sleep(500);

      let pageTwo_text1 = getInspectorByKey('NavPathStack4_pageTwo_text1');
      expect(String(JSON.parse(pageTwo_text1).$attrs.content)).assertEqual('pageTwo');
      await CommonFunc.sleep(500);
      console.info('NavPathStack4_0200 END');
      done();
    });


  })
}