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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "../../../../hypium/index";
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import { EnterKeyType } from '@ohos.arkui.component'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { UtilsTest } from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
import Utils from '../../../ets/MainAbility/common/Utils';

export default function TextStyleSuperscriptTest() {
  describe('TextStyleSuperscriptTest', () => {
    beforeAll(() => {
      console.info("TextStyleSuperscriptTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api20.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info("TextStyleSuperscriptTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/TextStyleSuperscript',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextStyleSuperscriptTest state success " + JSON.stringify(pages));
        routerInstance.replaceUrl(options);
        if (!("TextStyleSuperscript" == pages.name)) {
          console.info("get TextStyleSuperscriptTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextStyleSuperscriptTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextStyleSuperscriptTest after each called");
    });

    
    /**
     * @tc.number   TextStyleSuperscriptTest_static_0010
     * @tc.name     TextStyleSuperscriptTest_static_0010
     * @tc.desc     TextStyleSuperscriptTest_static_0010
     * @tc.level   Level.LEVEL2
     */
    it('TextStyleSuperscriptTest_static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextStyleSuperscriptTest_static_0010] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let getObj = await driver.findComponent(ON.id('get_superscript'))
      await (getObj?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[TextStyleSuperscriptTest_static_0010] superscript: ' + AppStorage.get('TextStyle_superscript_0'));
      expect(AppStorage.get('TextStyle_superscript_0')).assertEqual('SuperscriptStyle.NORMAL');
      console.info("[TextStyleSuperscriptTest_static_0010] END");
      done();
    });

    
    /**
     * @tc.number   TextStyleSuperscriptTest_static_0020
     * @tc.name     TextStyleSuperscriptTest_static_0020
     * @tc.desc     TextStyleSuperscriptTest_static_0020
     * @tc.level   Level.LEVEL2
     */
    it('TextStyleSuperscriptTest_static_0020', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextStyleSuperscriptTest_static_0020] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let getObj = await driver.findComponent(ON.id('get_superscript'))
      await (getObj?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[TextStyleSuperscriptTest_static_0010] superscript: ' + AppStorage.get('TextStyle_superscript_1'));
      expect(AppStorage.get('TextStyle_superscript_1')).assertEqual('SuperscriptStyle.SUPERSCRIPT');
      console.info("[TextStyleSuperscriptTest_static_0020] END");
      done();
    });

    
    /**
     * @tc.number   TextStyleSuperscriptTest_static_0030
     * @tc.name     TextStyleSuperscriptTest_static_0030
     * @tc.desc     TextStyleSuperscriptTest_static_0030
     * @tc.level   Level.LEVEL2
     */
    it('TextStyleSuperscriptTest_static_0030', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextStyleSuperscriptTest_static_0030] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let getObj = await driver.findComponent(ON.id('get_superscript'))
      await (getObj?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[TextStyleSuperscriptTest_static_0030] superscript: ' + AppStorage.get('TextStyle_superscript_1'));
      expect(AppStorage.get('TextStyle_superscript_2')).assertEqual('SuperscriptStyle.SUBSCRIPT');
      console.info("[TextStyleSuperscriptTest_static_0030] END");
      done();
    });
  })
}