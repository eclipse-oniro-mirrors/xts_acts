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

export default function requestFocus18() {
  describe('requestFocus18', () => {
    beforeEach(async (done: Function) => {
      console.info("requestFocus18 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/requestFocus/requestFocus18',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get requestFocus18 state pages:" + JSON.stringify(pages));
        if (!("requestFocus18" == pages.name)) {
          console.info("get requestFocus18 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push requestFocus18 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push requestFocus18 page error:" + err);
      }
      console.info("requestFocus18 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number requestFocus18_0100
     * @tc.name   testFocus
     * @tc.desc
     */
    it('requestFocus18_0100', 0, async (done: Function) => {
      console.info('requestFocus18_0100 START');
      await CommonFunc.sleep(1000);

      sendEventByKey('requestFocus18_btn1',10,"")
      await CommonFunc.sleep(1000);
      console.info('modalPageOne click after')

      sendEventByKey('requestFocus18_btn2',10,"")
      await CommonFunc.sleep(1000);
      console.info('Focus-textInput1 click after')

      let textInput1 = getInspectorByKey('requestFocus18_textInput1');
      expect(JSON.stringify(JSON.parse(textInput1).$attrs.text)).assertEqual('"TextInput_1"');
      await CommonFunc.sleep(1000);

      console.info('requestFocus18_0100 END');
      done();
    });

  })
}