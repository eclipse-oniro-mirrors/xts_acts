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

export default function backgroundImageResizableTest() {
  describe('backgroundImageResizableTest', () => {
    beforeEach(async (done: Function) => {
      console.info("backgroundImageResizableTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/backgroundImage/backgroundImageResizable',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get backgroundImageResizableTest state pages: " + JSON.stringify(pages));
        if (!("backgroundImageResizable" == pages.name)) {
          console.info("get backgroundImageResizableTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push backgroundImageResizableTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push backgroundImageResizableTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number backgroundImageResizable
     * @tc.name backgroundImageResizableTest_0100
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('backgroundImageResizableTest_0100', 0, async (done: Function) => {
      console.info('backgroundImageResizableTest_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('backgroundImageResizable_1');
      console.log('backgroundImageResizableTest_0100', JSON.parse(strJson).$attrs)
      console.log('backgroundImageResizableTest_0100', JSON.parse(strJson)
        .$attrs
        .backgroundImageResizable
        .slice
        .top)
      expect(JSON.parse(strJson).$attrs.backgroundImageResizable)
        .assertEqual(('ImageResizableSlice: {left: 20.00px, right: 20.00px, top: 20.00px, bottom: 20.00px}'));
      console.info('[backgroundImageResizableTest_0100] END');
      done();
    });
  })
}
