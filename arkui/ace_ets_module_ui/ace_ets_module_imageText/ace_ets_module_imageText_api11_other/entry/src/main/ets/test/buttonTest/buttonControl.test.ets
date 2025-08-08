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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function buttonControlTest() {
  describe('buttonControlTest', () => {
    beforeEach(async (done: Function) => {
      console.info("buttonControlTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get buttonControlTest state pages:" + JSON.stringify(pages));
        if (!("buttonControlSize" == pages.name)) {
          console.info("get buttonControlSize pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/button/buttonControlSize"})
          await CommonFunc.sleep(2000);
          console.info("push buttonControlSize page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push buttonControlSize page error:" + err);
      }
      console.info("buttonControlSize beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("buttonControlSize after each called");
    });

    /**
     * @tc.number    SUB_ACE_ButtonControlSize_0100
     * @tc.desc      test buttonControlSize
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */

    it('buttonControlSize_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[buttonControlSize_0100] START');
      await CommonFunc.sleep(2000);
      let json = getInspectorByKey('controlSizeBt');
      let Obj1: ESObject = JSON.parse(json);
      console.info("buttonControlSize_0100 json info " + JSON.stringify(json));
      expect(Obj1.$attrs.controlSize).assertEqual('ControlSize.SMALL');
      console.info('[buttonControlSize_0100] END');
      done();
    });

  })
}
