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

export default function refreshOffsetJsunit() {
  describe('refreshOffsetJsunit', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("refreshOffsetJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Refresh/refreshOffset',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        let pages = router.getState();
        console.info("get refreshOffsetJsunit state pages: " + JSON.stringify(pages));
        if (!("refreshOffset" == pages.name)) {
          console.info("get refreshOffsetJsunit state pages.name: " + JSON.stringify(pages.name));
          router.pushUrl(options);
        }
      } catch (err) {
        console.error("push refreshOffsetJsunit page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info(" refreshOffsetJsunit after each called");
    });

    
    /**
     * @tc.number   refreshOffsetJsunit_static_0100
     * @tc.name     refreshOffsetJsunit_static_0100
     * @tc.desc     refreshOffsetJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('refreshOffsetJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('refreshOffsetJsunit_static_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Refresh_Offset');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[scrollOffsetJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[scrollOffsetJsunit_static_0100] refreshOffset: " +
      JSON.stringify(obj.getElement('$attrs').getString('refreshOffset')));
      console.info("[scrollOffsetJsunit_static_0100] pullToRefresh: " +
      JSON.stringify(obj.getElement('$attrs').getBoolean('pullToRefresh')));
      expect(obj.getElement('$attrs').getString('refreshOffset')).assertEqual('64.00vp');
      expect(obj.getElement('$attrs').getBoolean('pullToRefresh')).assertEqual(true);
      expect(obj.getElement('$attrs').getDouble('pullDownRatio')).assertEqual(0.5);
      console.info('[refreshOffsetJsunit_static_0100] END');
      done();
    });

    
      
  
/**
     * @tc.number   refreshOffsetJsunit_static_0200
     * @tc.name     refreshOffsetJsunit_static_0200
     * @tc.desc     refreshOffsetJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('refreshOffsetJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('refreshOffsetJsunit_static_0200 START');
      let swiperOffset = CommonFunc.getComponentRectOnScreen('Refresh_Offset');
      let top = swiperOffset.top;
      let right = swiperOffset.right;
      let left = swiperOffset.left;
      let bottom = swiperOffset.bottom;
      console.info("scrollOffsetJsunit_static_0200 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      await driver.swipe((Math.round(left + width * 0.2)).toInt(), (Math.round(bottom - height / 2)).toInt(),
        (Math.round(left + width * 0.2)).toInt(), (Math.round(bottom - height / 4)).toInt());
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('refresh_mess');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[scrollOffsetJsunit_static_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onOffsetChange');
      console.info('[refreshOffsetJsunit_static_0200] END');
      done();
    });

  })
}