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

export default function MultiNavigation32() {
  describe('MultiNavigation32', () => {
    beforeEach(async (done: Function) => {
      console.info("MultiNavigation32 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/MultiNavigation/MultiNavigation32',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MultiNavigation32 state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get MultiNavigation32 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push MultiNavigation32 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MultiNavigation32 page error:" + err);
      }
      console.info("MultiNavigation32 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number MultiNavigation32_0100
     * @tc.name testMultiNavigation
     * @tc.desc
     */
    it('MultiNavigation32_0100', 0, async (done: Function) => {
      console.info('MultiNavigation32_0100 START');
      await CommonFunc.sleep(1000);

      sendEventByKey('MultiNavigation32_btn2',10,"")
      await CommonFunc.sleep(1000);
      sendEventByKey('MultiNavigation32_btn1',10,"")
      await CommonFunc.sleep(1000);
      sendEventByKey('MultiNavigation32_btn1',10,"")
      await CommonFunc.sleep(1000);
      sendEventByKey('MultiNavigation32_btn3',10,"")
      await CommonFunc.sleep(1000);
      sendEventByKey('MultiNavigation32_btn1',10,"")
      await CommonFunc.sleep(1000);
      sendEventByKey('MultiNavigation32_btn4',10,"")
      await CommonFunc.sleep(1000);

      let text1 = getInspectorByKey('MultiNavigation32_PageDetail1_text1');
      expect(String(JSON.parse(text1).$attrs.content)).assertEqual('PageDetail1');

      console.info('MultiNavigation32_0100 END');
      done();
    });

  })
}