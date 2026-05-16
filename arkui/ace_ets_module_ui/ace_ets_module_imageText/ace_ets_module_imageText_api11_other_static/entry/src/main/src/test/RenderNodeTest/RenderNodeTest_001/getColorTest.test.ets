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
import { UtilsTest, startAbility, stopApplication } from '../../Util.test';

export default function getColorTest() {
  describe('getColorTest', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("getColorTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RenderNode/renderNode001/getColor',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get getColorTest state pages:" + JSON.stringify(pages));
        if (!("getColor" == pages.name)) {
          console.info("get getColorTest pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push getColorTest page result:" + JSON.stringify(result));
        }

      } catch (err:Error) {
        console.error("push getColorTest page error: " + err);
        expect().assertFail();
      }

    });

    // afterAll(async (): Promise<void> => {
    //   await UtilsTest.msSleep(1000)
    //   stopApplication("com.arkui.ace.imageText.api11.other.static")
    //   await UtilsTest.msSleep(1000)
    // })

    
    
/**
     * @tc.number   getColorTest_static_0100
     * @tc.name     getColorTest_static_0100
     * @tc.desc     getColorTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('getColorTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('getColorTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('get_color'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('render_color');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[getColorTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('color:0');
      console.info('[getColorTest_0100] END');
      done();
    });

    
    
/**
     * @tc.number   getColorTest_static_0200
     * @tc.name     getColorTest_static_0200
     * @tc.desc     getColorTest_static_0200
     * @tc.level    Level.LEVEL2
     */
it('getColorTest_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('getColorTest_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('getSet_color'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('render_color');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[getColorTest_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('color:-16711936');
      console.info('[getColorTest_0200] END');
      done();
    });
  })
}

