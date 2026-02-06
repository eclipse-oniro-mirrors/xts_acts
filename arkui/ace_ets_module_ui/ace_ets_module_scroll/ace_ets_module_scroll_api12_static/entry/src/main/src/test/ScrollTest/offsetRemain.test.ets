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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { BusinessError } from '@ohos.base';
import { Router } from '@ohos.arkui.UIContext';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';

let testAbilityContext: common.UIAbilityContext;
let domain: int = 0x0000;
let tag: string = 'testTag';
const waitUiReadyMs = 1000;

export default function offsetRemain() {
  describe('offsetRemain', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("offsetRemain beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/offsetRemain",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get offsetRemain state pages: " + JSON.stringify(pages));
        if (!("offsetRemain" == pages.name)) {
          console.info("get offsetRemain state pages.name: " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push offsetRemain page error: " + err);
        expect().assertFail();
      }
    });

    
      
  
/**
     * @tc.number   offsetRemain_0100
     * @tc.name     offsetRemain_0100
     * @tc.desc     offsetRemain_0100
     * @tc.level    Level.LEVEL0
     */
it('offsetRemain_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('offsetRemain_0100 START');
      let driver = Driver.create();
      let swiperScroll = CommonFunc.getComponentRectOnScreen('list_offsetRemain');
      let top = swiperScroll.top;
      let right = swiperScroll.right;
      let left = swiperScroll.left;
      let bottom = swiperScroll.bottom;
      console.info("offsetRemain_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      await driver.swipe((Math.round(left + width / 2)).toInt(), (Math.round(top + height * 0.7)).toInt(),
        (Math.round(left + width / 2)).toInt(), (Math.round(top + height * 0.2)).toInt());
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('offsetRemain');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[offsetRemain_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[offsetRemain_0100] content obj is: " + obj.getElement('$attrs').getString('content'));
      expect(Number(obj.getElement('$attrs').getString('content')) > 0).assertEqual(true);
      console.info('[offsetRemain_0100] END');
      done();
    });

  })
}

