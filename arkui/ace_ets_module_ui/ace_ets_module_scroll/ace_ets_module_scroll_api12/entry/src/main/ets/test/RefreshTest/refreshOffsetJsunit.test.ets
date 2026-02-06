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

export default function refreshOffsetJsunit() {
  describe('refreshOffsetJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("refreshOffsetJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Refresh/refreshOffset',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get refreshOffsetJsunit state pages: " + JSON.stringify(pages));
        if (!("refreshOffset" == pages.name)) {
          console.info("get refreshOffsetJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push refreshOffsetJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push refreshOffsetJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info(" refreshOffsetJsunit after each called");
    });

    /* *
    * @tc.number: SUB_ACE_REFRESH_REFRESHOFFSET_0100
    * @tc.name  : refreshOffsetJsunit_0100
    * @tc.desc  : Add refreshOffset and pullToRefresh interfaces.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('refreshOffsetJsunit_0100', Level.LEVEL1, async (done: Function) => {
      console.info('refreshOffsetJsunit_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Refresh_Offset');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[scrollOffsetJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[scrollOffsetJsunit_0100] refreshOffset: " + JSON.stringify(obj.$attrs.refreshOffset));
      console.info("[scrollOffsetJsunit_0100] pullToRefresh: " + JSON.stringify(obj.$attrs.pullToRefresh));
      expect(obj.$attrs.refreshOffset).assertEqual('64.00vp');
      expect(obj.$attrs.pullToRefresh).assertEqual(true);
      expect(obj.$attrs.pullDownRatio).assertEqual(0.5);
      console.info('[refreshOffsetJsunit_0100] END');
      done();
    });

    /* *
    * @tc.number: SUB_ACE_REFRESH_REFRESHOFFSET_0200
    * @tc.name  : refreshOffsetJsunit_0200
    * @tc.desc  : trigger onOffsetChange callback.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('refreshOffsetJsunit_0200', Level.LEVEL1, async (done: Function) => {
      console.info('refreshOffsetJsunit_0200 START');
      let swiperOffset = CommonFunc.getComponentRectOnScreen('Refresh_Offset');
      let top = swiperOffset.top;
      let right = swiperOffset.right;
      let left = swiperOffset.left;
      let bottom = swiperOffset.bottom;
      console.info("scrollOffsetJsunit_0200 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(left + width*0.2),Math.round(bottom - height/2),Math.round(left + width*0.2),Math.round(bottom - height/4));
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('refresh_mess');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[scrollOffsetJsunit_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('onOffsetChange');
      console.info('[refreshOffsetJsunit_0200] END');
      done();
    });

  })
}