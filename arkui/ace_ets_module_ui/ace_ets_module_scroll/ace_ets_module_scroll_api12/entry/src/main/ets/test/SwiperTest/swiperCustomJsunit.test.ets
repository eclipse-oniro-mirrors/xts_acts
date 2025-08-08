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
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';

export default function swiperCustomJsunit() {
  describe('swiperCustomJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("swiperCustomJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/swiperCustom',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get swiperCustomJsunit state pages: " + JSON.stringify(pages));
        if (!("swiperCustom" == pages.name)) {
          console.info("get swiperCustomJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push swiperCustomJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiperCustomJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info(" swiperCustomJsunit after each called");
    });

    /* *
    * @tc.number: SUB_ACE_SWIPER_swiperCustomJsunit_0100
    * @tc.name  : swiperCustomJsunit_0100
    * @tc.desc  : Set to disable component navigation point interaction function.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('swiperCustomJsunit_0100', Level.LEVEL1, async (done: Function) => {
      console.info('swiperCustomJsunit_0100 START');
      let swiperOffset = CommonFunc.getComponentRectOnScreen('Swiper_Length');
      let top = swiperOffset.top;
      let right = swiperOffset.right;
      let left = swiperOffset.left;
      let bottom = swiperOffset.bottom;
      console.info("scrollOffsetJsunit_0200 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(left + width*0.8),Math.round(bottom - height/2),Math.round(left + width*0.1),Math.round(bottom - height/2));
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Swiper_Length');
      let strJson1 = getInspectorByKey('swiper_mess');
      let strJson2 = getInspectorByKey('swiper_texts');
      let obj: ESObject = JSON.parse(strJson);
      let obj1: ESObject = JSON.parse(strJson1);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[swiperCustomJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[swiperCustomJsunit_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[swiperCustomJsunit_0100] component obj2 is: " + JSON.stringify(obj2));
      expect(obj.$attrs.indicatorInteractive).assertEqual('true');
      expect(obj1.$attrs.content).assertEqual('onContentDidScroll');
      expect(obj2.$attrs.content).assertEqual('mainAxisLength');
      console.info('[swiperCustomJsunit_0100] END');
      done();
    });

  })
}
