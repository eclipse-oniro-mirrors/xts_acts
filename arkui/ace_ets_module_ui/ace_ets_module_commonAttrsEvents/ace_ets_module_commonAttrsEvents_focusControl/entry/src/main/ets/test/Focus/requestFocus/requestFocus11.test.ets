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

export default function requestFocus11() {
  describe('requestFocus11', () => {
    beforeEach(async (done: Function) => {
      console.info("requestFocus11 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/requestFocus/requestFocus11',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get requestFocus11 state pages:" + JSON.stringify(pages));
        if (!("requestFocus11" == pages.name)) {
          console.info("get requestFocus11 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push requestFocus11 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push requestFocus11 page error:" + err);
      }
      console.info("requestFocus11 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   requestFocus11_0100
     * @tc.number requestFocus11_0100
     * @tc.desc   requestFocus11_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('requestFocus11_0100', Level.LEVEL0, async (done: Function) => {
      console.info('requestFocus11_0100 START');
      await CommonFunc.sleep(1000);

      sendEventByKey('requestFocus11_btn5',10,"")
      await CommonFunc.sleep(1000);
      console.info('click after')

      let btn4 = getInspectorByKey('requestFocus11_btn4');
      expect(JSON.stringify(JSON.parse(btn4).$attrs.label)).assertEqual('"btn4-1"');
      await CommonFunc.sleep(1000);

      console.info('requestFocus11_0100 END');
      done();
    });

  })
}