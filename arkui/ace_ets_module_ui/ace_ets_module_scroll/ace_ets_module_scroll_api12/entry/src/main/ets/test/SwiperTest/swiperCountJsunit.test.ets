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

export default function swiperCountJsunit() {
  describe('swiperCountJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("swiperCountJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/swiperCount',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get swiperCountJsunit state pages: " + JSON.stringify(pages));
        if (!("swiperCount" == pages.name)) {
          console.info("get swiperCountJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push swiperCountJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiperCountJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info(" swiperCountJsunit after each called");
    });

    /* *
    * @tc.number: SUB_ACE_Swiper_MAXDISPLAYCOUNT_0100
    * @tc.name  : swiperCountJsunit_0100
    * @tc.desc  : Set the Indicator maxDisplayCount when selected.
    * @tc.level : Level 1
    * @tc.type :
    * @tc.size :
    */
    it('swiperCountJsunit_0100', Level.LEVEL1, async (done: Function) => {
      console.info('swiperCountJsunit_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('maxDisplayCount_mess');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[swiperCountJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[swiperCountJsunit_0100] swiper: " + JSON.stringify(obj.$attrs));
      console.info("[swiperCountJsunit_0100] indicator: " + JSON.stringify(obj.$attrs.indicator));
      expect(JSON.parse(obj.$attrs.indicator).maxDisplayCount).assertEqual(5);
      console.info('[swiperCountJsunit_0100] END');
      done();
    });

  })
}