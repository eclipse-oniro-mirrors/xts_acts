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

export default function addParallelGestureTest1() {
  describe('addParallelGestureTest1', () => {
    beforeEach(async (done: Function) => {
      console.info("addParallelGestureTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureHandler/addParallelGestureTest1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get addParallelGestureTest1 state pages:" + JSON.stringify(pages));
        if (!("addParallelGestureTest1" == pages.name)) {
          console.info("get addParallelGestureTest1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push addParallelGestureTest1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push addParallelGestureTest1 page error:" + err);
      }
      console.info("addParallelGestureTest1 beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("addParallelGestureTest1 after each called");
    });


    /**
     * @tc.number    addParallelGestureTest1_0100
     * @tc.name      addParallelGestureTest1_0100
     * @tc.desc      Test addParallelGesture
     * @tc.level     Level 2
     */
    it('addParallelGestureTest1_0100', 0, async (done: Function) => {
      console.info('addParallelGestureTest1_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('addParallelGestureTest1_text'));
      await text.click()
      console.info("[addParallelGestureTest1_0100] text");
      await CommonFunc.sleep(2000);

      let btn2 = await driver.findComponent(ON.id('addParallelGestureTest1_get'));
      await btn2.click()
      console.info("[addParallelGestureTest1_0100] btn2");
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('addParallelGestureTest1_text');
      let obj1: ESObject = JSON.parse(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[addParallelGestureTest1_0100] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('columnTap');

      console.info('addParallelGestureTest1_0100 END');
      done();
    });



  })
}