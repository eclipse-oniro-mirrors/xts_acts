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

export default function selectApi1() {
  describe('selectApi1', () => {
    beforeEach(async (done: Function) => {
      console.info("selectApi1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/select/selectApi1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get selectApi1 state pages:" + JSON.stringify(pages));
        if (!("selectApi1" == pages.name)) {
          console.info("get selectApi1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push selectApi1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push selectApi1 page error:" + err);
      }
      console.info("selectApi1 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number selectApi1_0100
     * @tc.name   testFocus
     * @tc.desc
     */
    it('selectApi1_0100', 0, async (done: Function) => {
      console.info('selectApi1_0100 START');
      await CommonFunc.sleep(1000);

      sendEventByKey('selectApi1_Select',10,"")
      await CommonFunc.sleep(1000);
      console.info('click after')

      let text1 = getInspectorByKey('selectApi1_text');
      expect(JSON.stringify(JSON.parse(text1).$attrs.content)).assertEqual('"item1"');
      await CommonFunc.sleep(1000);

      console.info('selectApi1_0100 END');
      done();
    });

  })
}