/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function VideoContentTransitionEffectTest() {
  describe('VideoContentTransitionEffectTest', () => {
    beforeEach(async (done: Function) => {
      console.info("VideoContentTransitionEffectTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Video/VideoContentTransitionEffect',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get VideoContentTransitionEffect state pages:" + JSON.stringify(pages));
        if (!("VideoContentTransitionEffect" == pages.name)) {
          console.info("get VideoContentTransitionEffect pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push VideoContentTransitionEffect page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push VideoContentTransitionEffect page error:" + err);
      }
      console.info("VideoContentTransitionEffect beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("VideoContentTransitionEffectTest after each called");
    });

    /**
     * @tc.name   VideoContentTransitionEffectTest_0100
     * @tc.number VideoContentTransitionEffectTest_0100
     * @tc.desc   Test Video ContentTransitionEffect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoContentTransitionEffectTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[VideoContentTransitionEffectTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button1 = await driver.findComponent(ON.id('VideoContentTransitionEffect'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('VideoContentTransitionEffectStr');
      let obj1: ESObject = JSON.parse(strJson1);
      expect(obj1.$attrs.content).assertEqual('IDENTITY');

      let button2 = await driver.findComponent(ON.id('VideoContentTransitionEffect'));
      await button2.click();
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('VideoContentTransitionEffectStr');
      let obj2: ESObject = JSON.parse(strJson2);
      expect(obj2.$attrs.content).assertEqual('OPACITY');

      let button3 = await driver.findComponent(ON.id('VideoContentTransitionEffect'));
      await button3.click();
      await CommonFunc.sleep(1000);
      let strJson3 = getInspectorByKey('VideoContentTransitionEffectStr');
      let obj3: ESObject = JSON.parse(strJson3);
      expect(obj3.$attrs.content).assertEqual('UNDEFINED');

      console.info('[VideoContentTransitionEffectTest_0100] END');
      done();
    });
  })
}