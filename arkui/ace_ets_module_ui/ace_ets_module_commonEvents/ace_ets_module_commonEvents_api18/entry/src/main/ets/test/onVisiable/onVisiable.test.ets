/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

export default function onVisibleAreaApproximateChangeTest() {

  describe('onVisibleAreaApproximateChangeTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/onVisiable/onVisiable',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onVisibleAreaApproximateChange state pages: " + JSON.stringify(pages));
        if (!("onVisibleAreaApproximateChange" == pages.name)) {
          console.info("get onVisibleAreaApproximateChange state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push onVisibleAreaApproximateChange success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onVisibleAreaApproximateChange page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("onVisibleAreaApproximateChange after each called");
    });

    /**
     * @tc.name   onVisibleAreaApproximateChange_0010
     * @tc.number onVisibleAreaApproximateChange_0010
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onVisibleAreaApproximateChange_0010', Level.LEVEL0, async (done: Function) => {
      console.info('onVisibleAreaApproximateChange_0010 START');
      let driver : Driver = await Driver.create()
      await CommonFunc.sleep(1000);

      // 获取滑动组件Scroll
      let swiperTabs = CommonFunc.getComponentRectOnScreen('onVisibleAreaApproximateChange_scroll_id');
      let top = swiperTabs.top;
      let right = swiperTabs.right;
      let left = swiperTabs.left;
      let bottom = swiperTabs.bottom;
      console.info("onVisibleAreaApproximateChange_scroll value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      // 从完全可见滑动到完全不可见
      await driver.swipe(Math.round(left + width*0.5),Math.round(bottom - height*0.08),Math.round(left + width*0.5),Math.round(top + height*0.08));
      await CommonFunc.sleep(3000);      
      let strJson = getInspectorByKey('onVisibleAreaApproximateChange_column_id');
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(strJson);
      await CommonFunc.sleep(1000);
      console.info('onVisibleAreaApproximateChange_column_id content is :' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('Test Text is completely invisible');
      await CommonFunc.sleep(1000);

      // 从完全不可见滑动到完全可见
      await driver.swipe(Math.round(left + width*0.5),Math.round(top + height*0.08),Math.round(left + width*0.5),Math.round(bottom));
      await CommonFunc.sleep(3000);
      strJson = getInspectorByKey('onVisibleAreaApproximateChange_column_id');
      await CommonFunc.sleep(1000);
      obj = JSON.parse(strJson);
      await CommonFunc.sleep(1000);
      console.info('onVisibleAreaApproximateChange_column_id content is :' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('Test Text is fully visible');
      console.info('[onVisibleAreaApproximateChange_0010] END');
      done();
    });
  })
}