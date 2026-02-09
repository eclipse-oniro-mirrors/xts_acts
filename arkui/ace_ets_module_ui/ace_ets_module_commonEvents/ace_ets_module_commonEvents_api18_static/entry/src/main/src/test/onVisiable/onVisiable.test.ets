'use static';
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import {UtilsTest} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function onVisibleAreaApproximateChangeTest() {

  describe('onVisibleAreaApproximateChangeTest', () => {
    beforeAll(() => {
      console.info("assemblyCallbackTest beforeAll start");
      
      await UtilsTest.startAbility("com.open.harmony.acetestcommenventapi18.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/onVisiable/onVisiable',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        let pages = routerInstance.getState();
        console.info("get onVisibleAreaApproximateChange state pages: " + JSON.stringify(pages));
        if (!("onVisiable" == pages.name)) {
          routerInstance.clear();
          console.info("get onVisibleAreaApproximateChange state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push onVisibleAreaApproximateChange success: ");
        }
      } catch (err) {
        console.error("push onVisibleAreaApproximateChange page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("onVisibleAreaApproximateChange after each called");
    });

    
    
    
/**
     * @tc.number   onVisibleAreaApproximateChange_static_0010
     * @tc.name     onVisibleAreaApproximateChange_static_0010
     * @tc.desc     onVisibleAreaApproximateChange_static_0010
     * @tc.level    Level.LEVEL0
     */
it('onVisibleAreaApproximateChange_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('onVisibleAreaApproximateChange_static_0010 START');
      let driver  = Driver.create()
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
      await driver.swipe(Math.round(left + width*0.5) as Int,Math.round(bottom - height*0.08) as Int,Math.round(left + width*0.5) as Int,Math.round(top + height*0.08) as Int);
      await CommonFunc.sleep(3000);      
      let strJson = inspector.getInspectorByKey('onVisibleAreaApproximateChange_column_id');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info('onVisibleAreaApproximateChange_column_id content is :' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Test Text is completely invisible');
      await CommonFunc.sleep(1000);

      // 从完全可见滑动到完全不可见
      await driver.swipe(Math.round(left + width*0.5) as Int,Math.round(top + height*0.08) as Int,Math.round(left + width*0.5) as Int,Math.round(bottom - height*0.08) as Int);
      await CommonFunc.sleep(4000);
      strJson = inspector.getInspectorByKey('onVisibleAreaApproximateChange_column_id');
      await CommonFunc.sleep(1000);
      obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info('onVisibleAreaApproximateChange_column_id content is :' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Test Text is fully visible');
      console.info('[onVisibleAreaApproximateChange_static_0010] END');
      done();
    });
  })
}