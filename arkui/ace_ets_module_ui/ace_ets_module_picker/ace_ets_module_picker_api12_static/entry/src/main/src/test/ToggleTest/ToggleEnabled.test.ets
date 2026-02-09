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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import router from '@ohos.router'
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function ToggleContentEnabled() {
  describe('ToggleContentEnabled', () => {
    beforeAll(() => {
      console.info("enableHapticFeedbackTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.api12.static", "EntryAbility")

      console.info("enableHapticFeedbackTest beforeAll end");
    });
    beforeEach(async () => {
      console.info("ToggleContentEnabled beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Toggle/ToggleEnabled',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ToggleContentEnabled state success " + JSON.stringify(pages));
        if (!("ToggleContentEnabled" == pages.name)) {
          console.info("get ToggleContentEnabled state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          await Utils.sleep(2000);
          // console.info("push ToggleContentEnabled page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ToggleContentEnabled page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("ToggleContentEnabled after each called");
    });

    
    /**
     * @tc.number   ArkUI_Stage_Toggle_Content_static_0200
     * @tc.name     ArkUI_Stage_Toggle_Content_static_0200
     * @tc.desc     ArkUI_Stage_Toggle_Content_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Toggle_Content_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> =>  {
      console.info('[ArkUI_Stage_Toggle_Content_static_0200] START');
      await Utils.sleep(1000);

      let strJson = inspector.getInspectorByKey('ToggleContentModifier_enabled');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info("[ArkUI_Stage_Toggle_Content_static_0200] obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('enabled status is: true');
      console.info('[ArkUI_Stage_Toggle_Content_static_0200] END');
      done();
    });
  })
}
