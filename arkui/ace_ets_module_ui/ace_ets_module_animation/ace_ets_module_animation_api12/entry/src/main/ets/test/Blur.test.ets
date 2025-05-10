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

import CommonFunc from '../MainAbility/utils/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function Blur() {
  describe('Blur', () => {
    beforeEach(async (done: Function) => {
      console.info("Blur beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Blur',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Blur state pages:" + JSON.stringify(pages));
        if (!("Blur" == pages.name)) {
          console.info("get Blur pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Blur page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Blur page error:" + err);
      }
      console.info("Blur beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Blur after each called");
    });


    /**
     * @tc.number    Blur_0100
     * @tc.name      Blur_0100
     * @tc.desc      Test blur 
     * @tc.level     Level 2
     */
    it('Blur_0100', 0, async (done: Function) => {
      console.info('Blur_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let strJson2: string = getInspectorByKey('blurId');
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
      console.info('[MultiNavigation_0100] component obj is: ' + JSON.stringify(obj2));
      console.info('[MultiNavigation_0100] content obj is: ' + JSON.stringify(obj2.$attrs.blur));
      expect(obj2.$attrs.blur).assertEqual(5);

      console.info('Blur_0100 END');
      done();
    });


  })
}