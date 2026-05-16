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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';


export default function imageSpanTest2() {
  describe('imageSpanTest2', () => {
    beforeEach(async (done: Function) => {
      console.info("imageSpanTest2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/imageSpan2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get imageSpanTest2 state pages: " + JSON.stringify(pages));
        if (!("imageSpan2" == pages.name)) {
          console.info("get imageSpanTest2 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push imageSpanTest2 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push imageSpanTest2 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   imageSpanTest2_0100
     * @tc.number SUB_ACE_imageSpanTest2_0100
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSpanTest2_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('imageSpanTest2_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ImageSpan_onComplete_2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[imageSpanTest2_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('onComplete succ');
      console.info('[imageSpanTest2_0100] END');
      done();
    });
  })
}

