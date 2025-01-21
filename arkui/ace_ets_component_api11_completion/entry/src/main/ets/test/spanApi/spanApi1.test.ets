/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from "../../MainAbility/common/Common";
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function spanApi1() {
  describe('spanApi1', function () {
    beforeEach(async function (done) {
      console.info("spanApi1 beforeEach start");
      let options = {
        url: 'MainAbility/pages/spanApi/spanApi1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get spanApi1 state pages:" + JSON.stringify(pages));
        if (!("spanApi1" == pages.name)) {
          console.info("get spanApi1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push spanApi1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push spanApi1 page error:" + err);
      }
      console.info("spanApi1 beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("spanApi1 after each called");
    });
    /**
     * @tc.number    SUB_ACE_RICHEDITOR_spanApi1_0100
     * @tc.name      testSpan
     * @tc.desc      set api
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('spanApi1_0100', 0, async function (done) {
      console.info('[spanApi1_0100] START');
      await CommonFunc.sleep(2000);

      let spanApi1 = getInspectorByKey('spanApi1');
      let Obj1 = JSON.parse(spanApi1);
      expect(JSON.stringify(Obj1.$attrs.textBackgroundStyle)).assertEqual('{"color":"#7F007DFF","radius":"5.00vp"}');

      console.info('[testRichEditor_0100] END');
      done();
    });

  })
}
