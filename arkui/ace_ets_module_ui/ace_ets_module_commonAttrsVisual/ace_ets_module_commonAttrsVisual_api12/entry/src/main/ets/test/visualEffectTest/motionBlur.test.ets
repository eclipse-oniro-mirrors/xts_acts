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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';


export default function motionBlurTest() {
  describe('motionBlurTest', () => {
    beforeEach(async (done: Function) => {
      console.info("motionBlurTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/visualEffect/motionBlur',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get motionBlurTest state pages: " + JSON.stringify(pages));
        if (!("motionBlur" == pages.name)) {
          console.info("get motionBlurTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push motionBlurTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push motionBlurTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number motionBlurTest_0100
     * @tc.name motionBlurTest_0100
     * @tc.desc api: motionBlur
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('motionBlurTest_0100', 0, async (done: Function) => {
      console.info('motionBlurTest_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('motionBlur_id');
      console.log('motionBlurTest_0100', JSON.stringify(JSON.parse(strJson).$attrs))
      console.log('motionBlurTest_0100', JSON.stringify(JSON.parse(strJson).$attrs.motionBlur))
      expect(JSON.stringify(JSON.parse(strJson).$attrs.motionBlur)).assertEqual('{"radius":0,"anchor":{"x":0,"y":0}}');
      console.info('motionBlurTest_0100 END');
      done();
    });
  })
}
