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

export default function BorderOptionsTest1() {
  describe('BorderOptionsTest1', () => {
    beforeEach(async (done: Function) => {
      console.info("BorderOptionsTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/BorderOptions/BorderOptionsTest1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get BorderOptionsTest1 state pages:" + JSON.stringify(pages));
        if (!("BorderOptionsTest1" == pages.name)) {
          console.info("get BorderOptionsTest1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push BorderOptionsTest1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push BorderOptionsTest1 page error:" + err);
      }
      console.info("BorderOptionsTest1 beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("BorderOptionsTest1 after each called");
    });


    /**
     * @tc.number    BorderOptionsTest1_0100
     * @tc.name      BorderOptionsTest1_0100
     * @tc.desc      Test BorderOptions
     * @tc.level     Level 2
     */
    it('BorderOptionsTest1_0100', 0, async (done: Function) => {
      console.info('BorderOptionsTest1_0100 START');
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('BorderOptionsTest1_text');
      console.info("[BorderOptionsTest1_0100] component border is: " + JSON.parse(strJson).$attrs.border);
      expect(JSON.parse(JSON.parse(strJson).$attrs.border).dashGap).assertEqual('5.00vp');
      expect(JSON.parse(JSON.parse(strJson).$attrs.border).dashWidth).assertEqual('10.00vp');

      console.info('BorderOptionsTest1_0100 END');
      done();
    });


  })
}