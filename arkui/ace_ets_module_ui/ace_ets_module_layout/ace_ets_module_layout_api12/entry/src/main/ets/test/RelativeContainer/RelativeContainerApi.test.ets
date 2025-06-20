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

export default function RelativeContainerApi() {
  describe('RelativeContainerApi', () => {
    beforeEach(async (done: Function) => {
      console.info("RelativeContainerApi beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RelativeContainer/RelativeContainerApi',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RelativeContainerApi state pages:" + JSON.stringify(pages));
        if (!("RelativeContainerApi" == pages.name)) {
          console.info("get RelativeContainerApi pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RelativeContainerApi page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RelativeContainerApi page error:" + err);
      }
      console.info("RelativeContainerApi beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number RelativeContainerApi_0100
     * @tc.name   testFocus
     * @tc.desc
     */
    it('RelativeContainerApi_0100', 0, async (done: Function) => {
      console.info('RelativeContainerApi_0100 START');
      await CommonFunc.sleep(1000);

      let row1 = CommonFunc.getComponentRect('row1')
      let row2 = CommonFunc.getComponentRect('row2')
      let row3 = CommonFunc.getComponentRect('row3')

      expect(Math.abs(row3.left - row2.right) <= 1).assertTrue();
      expect(Math.abs(row3.top - row1.top) <= 1).assertTrue();
      await CommonFunc.sleep(1000);

      console.info('RelativeContainerApi_0100 END');
      done();
    });

  })
}