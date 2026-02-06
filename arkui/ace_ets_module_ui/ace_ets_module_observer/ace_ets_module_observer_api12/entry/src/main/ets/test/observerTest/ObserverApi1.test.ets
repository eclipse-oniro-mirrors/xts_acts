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

export default function ObserverApi1() {
  describe('ObserverApi1', () => {
    beforeEach(async (done: Function) => {
      console.info("ObserverApi1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/observer/ObserverApi1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ObserverApi1 state pages:" + JSON.stringify(pages));
        if (!("ObserverApi1" == pages.name)) {
          console.info("get ObserverApi1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ObserverApi1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ObserverApi1 page error:" + err);
      }
      console.info("ObserverApi1 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number ObserverApi1_0100
     * @tc.name   testFocus
     * @tc.desc
     */
    it('ObserverApi1_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ObserverApi1_0100 START');
      await CommonFunc.sleep(1000);

      sendEventByKey('ObserverApi1_btn1',10,"")

      await CommonFunc.sleep(3000);

      let text1 = getInspectorByKey('ObserverApi1_text1');
      expect(JSON.stringify(JSON.parse(text1).$attrs.content)).assertEqual('"ObserverApi1_navId"')

      let text2 = getInspectorByKey('ObserverApi1_text2');
      expect(JSON.stringify(JSON.parse(text2).$attrs.content)).assertEqual('"mes"')

      await CommonFunc.sleep(1000);

      console.info('ObserverApi1_0100 END');
      done();
    });

  })
}