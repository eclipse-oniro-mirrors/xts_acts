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
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function StyledString() {
  describe('StyledString', () => {
    beforeAll(() => {
      console.info("StyledString beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api14.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      console.info("StyledString beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/styledString/StyledString',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get StyledString state pages: " + JSON.stringify(pages));
        if (!("StyledString" == pages.name)) {
          console.info("get StyledString state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push StyledString page error: " + err);
        expect().assertFail();
      }
    });

    
    

    /**
     * @tc.number   StyledString_static_0100
     * @tc.name     StyledString_static_0100
     * @tc.desc     StyledString_static_0100
     * @tc.level    Level.LEVEL2
     */
it('StyledString_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('StyledString_static_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('but1'));
      await CommonFunc.sleep(1000);
      await (button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('but2'));
      await CommonFunc.sleep(1000);
      await (button2?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[StyledString_static_0100] component obj is: " + JSON.stringify(obj));
	    let str = 'font-style: normal;font-weight: normal;color: #008000FF;font-family: HarmonyOS Sans;stroke-width: 0.00px;stroke-color: #008000FF;font-superscript: normal;">属性字符串</span><img src="file:///data/storage/el2/base/temp/htmlconvert/'
      expect(obj.getElement('$attrs').getString('content')).assertContain(str);
      console.info('[StyledString_static_0100] END');
      done();
    });

    
    

    /**
     * @tc.number   StyledString_static_0200
     * @tc.name     StyledString_static_0200
     * @tc.desc     StyledString_static_0200
     * @tc.level    Level.LEVEL2
     */
it('StyledString_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('StyledString_static_0200 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('but3'));
      await CommonFunc.sleep(1000);
      await (button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[StyledString_static_0200] component obj is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertContain('6');
      console.info('[StyledString_static_0200] END');
      done();
    });

  })
}

