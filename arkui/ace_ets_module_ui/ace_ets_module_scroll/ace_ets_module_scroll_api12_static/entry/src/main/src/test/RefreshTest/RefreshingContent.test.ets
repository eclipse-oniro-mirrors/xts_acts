'use static';
/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test'
import { UtilsTest } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function RefreshingContent() {
  describe('RefreshingContent', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("RefreshingContent beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Refresh/RefreshingContent',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        let pages = router.getState();
        console.info("get RefreshingContent state pages: " + JSON.stringify(pages));
        if (!("RefreshingContent" == pages.name)) {
          console.info("get RefreshingContent state pages.name: " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RefreshingContent success");
        }
      } catch (err) {
        console.error("push RefreshingContent page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info(" RefreshingContent after each called");
    });

    
      
  
/**
     * @tc.number   RefreshingContent_static_0100
     * @tc.name     RefreshingContent_static_0100
     * @tc.desc     RefreshingContent_static_0100
     * @tc.level    Level.LEVEL0
     */
it('RefreshingContent_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RefreshingContent_static_0100 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let swiperOffset = CommonFunc.getComponentRectOnScreen('refresh_content');
      let top = swiperOffset.top;
      let right = swiperOffset.right;
      let left = swiperOffset.left;
      let bottom = swiperOffset.bottom;
      console.info("RefreshingContent_static_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      await driver.swipe((Math.round(left + width * 0.2)).toInt(), (Math.round(top + height / 10)).toInt(),
        (Math.round(left + width * 0.2)).toInt(), (Math.round(bottom - height / 10)).toInt());
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('RefreshingContent');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[scrollRefreshingContent_static_0100] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onRefreshing test');
      console.info('[RefreshingContent_static_0100] END');
      done();
    });
  })
}