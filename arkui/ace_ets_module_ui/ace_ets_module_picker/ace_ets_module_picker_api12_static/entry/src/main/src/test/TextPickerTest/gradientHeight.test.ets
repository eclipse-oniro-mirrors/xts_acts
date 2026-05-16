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

export default function gradientHeight() {
  describe('gradientHeight', () => {

    beforeAll(() => {
      console.info("gradientHeight beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.api12.static", "EntryAbility")

      console.info("gradientHeight beforeAll end");
    });

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextPicker/gradientHeight',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get gradientHeight state success " + JSON.stringify(pages));
        if (!("gradientHeight" == pages.name)) {
          console.info("get gradientHeight state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push gradientHeight page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("gradientHeight after each called");
    });

    /**
     * @tc.number   gradientHeightTest_static_0100
     * @tc.name     gradientHeightTest_static_0100
     * @tc.desc     gradientHeightTest_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('gradientHeightTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('gradientHeightText_static_0100 START');
      let strJson = inspector.getInspectorByKey('gradientHeightXTS');
      console.info("gradientHeightText_static_0100 component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("gradientHeightText_static_0100 component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[gradientHeightText_static_0100] gradientHeight: " + obj.getElement('$attrs').getString('gradientHeight'));
      expect(obj.getElement('$attrs').getString('gradientHeight')).assertEqual("100.00vp");
      console.info('gradientHeightText_static_0100 END');
      done();
    });
  })
}
