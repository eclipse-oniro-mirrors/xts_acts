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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import CommonFunc from '../../MainAbility/common/Common';
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, MouseButton, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function subMenuExpandingMode() {
  describe('subMenuExpandingMode', () => {
    beforeEach(async (done: Function) => {
      console.log('subMenuExpandingMode beforeEach start');
      try {
        router.clear();
        let myPages = router.getState();
        console.info(`get subMenuExpandingMode state myPages:${JSON.stringify(myPages)}`);
        if ('subMenuExpandingMode' !== myPages.name) {
          console.info(`get subMenuExpandingMode state myPages:${JSON.stringify(myPages.name)}`);
          let result = await router.pushUrl({url:'MainAbility/pages/Menu/subMenuExpandingMode'})
          await CommonFunc.sleep(2000);
          console.info(`push subMenuExpandingMode myPage result:${JSON.stringify(result)}`);
        }
      } catch (err) {
        console.info(`push subMenuExpandingMode myPage error:${err}`);
      }
      console.info('subMenuExpandingMode forEach end');
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('subMenuExpandingMode after each called');
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_Common_subMenuExpandingMode_0100
     * @tc.name      subMenuExpandingMode_0100
     * @tc.desc      subMenuExpandingMode test
     * @tc.level     Level 3
     * @tc.type
     */

    it('subMenuExpandingMode_0100', 0, async (done: Function) => {
      console.info('[subMenuExpandingMode_0100] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('menuItemDividerText');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info(`[subMenuExpandingMode_0100] component obj is:${JSON.stringify(obj)}`);
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.subMenuExpandingMode).assertEqual('SubMenuExpandingMode.SIDE');
      console.info('[subMenuExpandingMode_0100] END');
      done();
    });

  })
}