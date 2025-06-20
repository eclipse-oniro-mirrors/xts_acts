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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../MainAbility/utils/Common';
import {MessageManager,Callback} from '../MainAbility/utils/MessageManager';
export default function backgroundBrightnessTest() {
  describe('backgroundBrightnessTest', ()=> {
    beforeEach( async (done:Function)=> {
      console.info("backgroundBrightnessTest beforeEach start");
      let options :router.RouterOptions = {
        url: 'MainAbility/pages/backgroundBrightness',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get backgroundBrightnessTest state pages: " + JSON.stringify(pages));
        if (!("backgroundBrightness" == pages.name)) {
          console.info("get backgroundBrightnessTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(5000);
          console.info("push backgroundBrightnessTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push backgroundBrightnessTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    backgroundBrightness
     * @tc.name      backgroundBrightnessTest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('backgroundBrightnessTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('backgroundBrightnessTest_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('backgroundBrightness_1');
      let obj :ESObject= JSON.parse(strJson);
      console.info('backgroundBrightnessTest_0100',JSON.stringify(obj))
      console.info('backgroundBrightnessTest_0100',JSON.stringify(obj.$attrs.BackgroundBrightness))
      expect(obj.$attrs.BackgroundBrightness.dynamicLightUpRate).assertEqual(0.5);
      expect(obj.$attrs.BackgroundBrightness.dynamicLightUpDegree).assertEqual(0.5);
      done();
    });
  })
}

