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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function requestFocus12() {
  describe('requestFocus12', () => {
    beforeEach(async (done: Function) => {
      console.info("requestFocus12 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/requestFocus/requestFocus12',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get requestFocus12 state pages:" + JSON.stringify(pages));
        if (!("requestFocus12" == pages.name)) {
          console.info("get requestFocus12 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push requestFocus12 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push requestFocus12 page error:" + err);
      }
      console.info("requestFocus12 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number requestFocus12_0100
     * @tc.name   testFocus
     * @tc.desc
     */
    it('requestFocus12_0100', Level.LEVEL0, async (done: Function) => {
      console.info('requestFocus12_0100 START');
      await CommonFunc.sleep(1000);

      sendEventByKey('requestFocus12_btn1',10,"")
      await CommonFunc.sleep(1000);
      console.info('Popup click after')

      sendEventByKey('requestFocus12_btn2',10,"")
      await CommonFunc.sleep(1000);
      console.info('Focus-textInput1 click after')

      let textInput1 = getInspectorByKey('requestFocus12_textInput1');
      expect(JSON.stringify(JSON.parse(textInput1).$attrs.text)).assertEqual('"TextInput_1"');
      await CommonFunc.sleep(1000);

      console.info('requestFocus12_0100 END');
      done();
    });

  })
}