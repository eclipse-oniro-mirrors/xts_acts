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
import router from '@ohos.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it,expect, Level } from "../../../../../hypium/index"
import {  Driver, ON ,MouseButton} from '@ohos.UiTest';
import CommonFunc from "../../../../ets/MainAbility/common/Common";
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function TextSelectionMenu() {
  describe('TextSelectionMenu', ()  => {
    beforeAll(() => {
      console.info("TextSelectionMenu beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("TextSelectionMenu beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/TextApi/TextSelectionMenu',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get TextSelectionMenu state pages:" + JSON.stringify(pages));
        if (!("TextSelectionMenu" == pages.name)) {
          console.info("get TextSelectionMenu pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TextSelectionMenu page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextSelectionMenu page error:" + err);
      }
      console.info("TextSelectionMenu beforeEach end");
    });


    
    /**
     * @tc.number   TextSelectionMenu_static_001
     * @tc.name     TextSelectionMenu_static_001
     * @tc.desc     TextSelectionMenu_static_001
     * @tc.level    Level.LEVEL2
     */
    it('TextSelectionMenu_static_001', Level.LEVEL2, async (done: ()=>void ) => {
      console.info('[TextSelectionMenu_static_001] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text3 = CommonFunc.getComponentRectOnScreen('Text_bindSelectionMenu_test')
      let x: int = Math.floor(((text3.right-text3.left)*0.5+text3.left)) as int
      let y: int = Math.floor(((text3.bottom-text3.top)*0.5+text3.top)) as int
      await driver.mouseClick({ x: x, y: y}, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('textApi_text1_test');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info("[TextSelectionMenu_static_001] obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('TextResponseType.RIGHT_CLICK');
      console.info('[TextSelectionMenu_static_001] END');
      done();

    });


    
    /**
     * @tc.number   TextSelectionMenu_static_002
     * @tc.name     TextSelectionMenu_static_002
     * @tc.desc     TextSelectionMenu_static_002
     * @tc.level    Level.LEVEL2
     */
    it('TextSelectionMenu_static_002', Level.LEVEL2, async (done: ()=>void ) => {
      console.info('[TextSelectionMenu_static_002] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let test4 = CommonFunc.getComponentRectOnScreen('text_TextResponseType')
      let x: int = Math.floor((test4.right-test4.left)*0.2+test4.left) as int
      let y: int = Math.floor((test4.bottom-test4.top)*0.5+test4.top) as int
      await driver.longClick(x, y)
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('textApi_text2');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info("[TextSelectionMenu_static_002] obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('TextResponseType.LONG_PRESS');

      console.info('[TextSelectionMenu_static_002] END');
      done();

    });
  })
}


