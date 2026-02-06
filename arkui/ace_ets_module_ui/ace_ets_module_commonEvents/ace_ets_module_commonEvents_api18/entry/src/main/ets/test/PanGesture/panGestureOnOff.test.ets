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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function panGestureOnOffTest() {

  describe('panGestureOnOffTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PanGesture/panGestureOnOff',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get panGesture state pages: " + JSON.stringify(pages));
        if (!("panGesture" == pages.name)) {
          console.info("get panGesture state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push panGesture success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push panGesture page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("panGesture after each called");
    });

    /**
     * @tc.number    panGesture_on_beforePanStart_0010
     * @tc.name      Test the api of panGesture
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('panGesture_on_beforePanStart_0010', Level.LEVEL0, async (done: Function) => {
      console.info('panGesture_on_beforePanStart_0010 START');
      let driver : Driver = await Driver.create()
      await CommonFunc.sleep(1000);

      // 获取滑动组件Scroll
      let swiperTabs = CommonFunc.getComponentRectOnScreen('panGesture_on_beforePanStart_scroll_id');
      let top = swiperTabs.top;
      let right = swiperTabs.right;
      let left = swiperTabs.left;
      let bottom = swiperTabs.bottom;
      console.info("panGesture_on_beforePanStart_scroll value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      
      await driver.swipe(Math.round(left + width*0.5),Math.round(bottom - height*0.08),Math.round(left + width*0.5),Math.round(top + height*0.08));
      await CommonFunc.sleep(3000);
      // 验证监听是否按顺序触发回调      
      expect(AppStorage.get('callbackFunc')).assertEqual('callbackFunc_afterPanCallBack_beforeEndCallBack_afterEndCallBack');
      AppStorage.delete('callbackFunc')
      await CommonFunc.sleep(1000);
      console.info('[panGesture_on_beforePanStart_0010] END');
      done();
    });
  })
}