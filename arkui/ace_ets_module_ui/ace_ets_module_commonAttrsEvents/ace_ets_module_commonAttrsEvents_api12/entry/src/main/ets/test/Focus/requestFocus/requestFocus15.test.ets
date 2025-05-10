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

import CommonFunc from '../../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function requestFocus15() {
  describe('requestFocus15', () => {
    beforeEach(async (done: Function) => {
      console.info("requestFocus15 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/requestFocus/requestFocus15',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get requestFocus15 state pages:" + JSON.stringify(pages));
        if (!("requestFocus15" == pages.name)) {
          console.info("get requestFocus15 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push requestFocus15 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push requestFocus15 page error:" + err);
      }
      console.info("requestFocus15 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number requestFocus15_0100
     * @tc.name   testFocus
     * @tc.desc
     */
    it('requestFocus15_0100', 0, async (done: Function) => {
      console.info('requestFocus15_0100 START');
      await CommonFunc.sleep(1000);

      sendEventByKey('requestFocus15_btn2',10,"")
      await CommonFunc.sleep(1000);
      console.info('Focus-textInput1 click after')

      let text1 = getInspectorByKey('requestFocus15_text1');
      expect(JSON.stringify(JSON.parse(text1).$attrs.content)).assertEqual('"150003"');
      await CommonFunc.sleep(1000);

      console.info('requestFocus15_0100 END');
      done();
    });

  })
}