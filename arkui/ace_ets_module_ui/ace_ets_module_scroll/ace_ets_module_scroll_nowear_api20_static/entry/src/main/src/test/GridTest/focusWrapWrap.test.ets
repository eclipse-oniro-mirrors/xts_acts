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
import { describe, beforeEach, afterEach, it, expect, Level, beforeAll } from '../../../../hypium'
import events_emitter from '@ohos.events.emitter';
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
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter';

export default function focusWrapWrap() {
  describe('focusWrapWrap', () => {
    beforeAll(() => {
      console.info("ActsAceCalendarPickerTest beforeEach start");
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.scroll.nowear.api20.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async (): Promise<void> => {
      console.info("focusWrapWrap beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/focusWrapWrap",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get focusWrapWrap state pages:" + JSON.stringify(pages));
        if (!("focusWrapWrap" == pages.name)) {
          console.info("get focusWrapWrap pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push focusWrapWrap page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push focusWrapWrap page error:" + err);
      }
      console.info("focusWrapWrap beforeEach end");
    });



    
    /**
     * @tc.number   focusWrapWrap_static_0100
     * @tc.name     focusWrapWrap_static_0100
     * @tc.desc     focusWrapWrap_static_0100
     * @tc.level    Level.LEVEL0
     */
it('focusWrapWrap_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[focusWrapWrap_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('focusWrapMode_wrap');
      console.info("[focusWrapWrap_0100] $type: " + JSON.stringify(JSON.parseJsonElement(strJson).getString('$type')));
      console.info("[focusWrapWrap_0100] $attrs: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[focusWrapWrap_0100] focusWrapMode: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('focusWrapMode')));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Grid");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('focusWrapMode')).assertEqual("FocusWrapMode.WRAP_WITH_ARROW");

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      //await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await driver.triggerKey(2015);
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2015);
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('wrap_focused_c'));
      let btn_isFocusedValue = await (btn?.isFocused() as Promise<boolean>)
      expect(btn_isFocusedValue).assertEqual(true);
      console.info('[focusWrapWrap_0100] GridItem isFocused');
      console.info('[focusWrapWrap_0100] END');
      done();
    });
  })
}
