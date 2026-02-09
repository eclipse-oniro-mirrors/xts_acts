/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium";
import router from '@ohos.router';
import { UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../MainAbility/utils/Common';

export default function MotionPathExample() {
  describe('MotionPathExample', () => {
    beforeEach(async (done: Function) => {
      console.info("MotionPathExample beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/MotionPathExample',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get MotionPathExample state pages:' + JSON.stringify(pages));
        if (!('MotionPathExample' == pages.name)) {
          console.info('get MotionPathExample state pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push MotionPathExample page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push MotionPathExample page error:' + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('MotionPathExample after each called');
    });

    /**
     * @tc.name   MotionPathExample_0100
     * @tc.number MotionPathExample_0100
     * @tc.desc   Test motionPath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MotionPathExample_0100', Level.LEVEL0, async (done: Function) => {
      console.info('MotionPathExample_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.text('clickme'));

      let point1 = await button.getBoundsCenter();
      let x1 = point1.x;
      let y1 = point1.y;
      console.info('MotionPathExample_0100 x1 is ', x1);
      console.info('MotionPathExample_0100 y1 is ', y1);
      await button.click();
      await CommonFunc.sleep(8000);

      let button2 = await driver.findComponent(ON.text('clickme'));
      let point2 = await button2.getBoundsCenter();
      let x2 = point2.x;
      let y2 = point2.y;
      console.info('MotionPathExample_0100 x2 is ', x2);
      console.info('MotionPathExample_0100 y2 is ', y2);
      expect(x1 !== x2 || y1 !== y2).assertTrue();
      console.info('MotionPathExample_0100 END');
      done();
    });
  }) 
}