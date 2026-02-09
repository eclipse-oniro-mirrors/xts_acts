'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../../hypium/index";
import router from '@ohos.router';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import {
  Component,
  Driver,
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
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { UtilsTest, startAbility } from '../../Util.test';

export default function frame() {
  describe('frame', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("frame beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RenderNode/renderNode001/frame',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get frame state pages:" + JSON.stringify(pages));
        if (!("frame" == pages.name)) {
          console.info("get frame pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push frame page result:" + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push frame page error: " + err);
        expect().assertFail();
      }

    });
    
    
/**
     * @tc.number   frame_static_0100
     * @tc.name     frame_static_0100
     * @tc.desc     frame_static_0100
     * @tc.level    Level.LEVEL2
     */
it('frame_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('frame_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('getFrame_id'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text_getFrame');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[frame_0100] component obj is: " + JSON.stringify(obj));
      console.info("[frame_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('50');
      console.info('[frame_0100] END');
      done();
    });
    
    
/**
     * @tc.number   frame_static_0200
     * @tc.name     frame_static_0200
     * @tc.desc     frame_static_0200
     * @tc.level    Level.LEVEL2
     */
it('frame_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('frame_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('setFrame_id'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text_setFrame');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[frame_0200] component obj is: " + JSON.stringify(obj));
      console.info("[frame_0200] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('60');
      console.info('[frame_0200] END');
      done();
    });
  })
}

