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
import { describe, beforeEach,beforeAll, afterEach, it, expect, Level } from "../../../../hypium/index"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function RichEditorApi222() {
  describe('RichEditorApi222', () => {
    beforeAll(() => {
      console.info("RichEditorApi222 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("RichEditorApi222 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/RichEditorApi2",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RichEditorApi222 state pages:" + "");
        if (!("RichEditorApi2" == pages.name)) {
          console.info("get RichEditorApi222 pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push RichEditorApi222 page error:" + err);
      }
      console.info("RichEditorApi222 beforeEach end");
    });

afterEach(async () => {
      const routerInstance = AppStorage.get<Router>("router") as Router
      routerInstance.replaceUrl({url:'MainAbility/pages/index/index'});
      await CommonFunc.sleep(1000);
      console.info("RichEditorApi2 after each called");
    });

    
    /**
     * @tc.number   RichEditorApi2_static_001
     * @tc.name     RichEditorApi2_static_001
     * @tc.desc     RichEditorApi2_static_001
     * @tc.level    Level.LEVEL2
     */
it('RichEditorApi2_static_001', Level.LEVEL2, async (done: () => void) => {
      console.info('[RichEditorApi2_001] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let RichEditor1 = CommonFunc.getComponentRectOnScreen('RichEditorApi2_RichEditor1')
      await driver.mouseDrag({
        x: Math.round((RichEditor1.right - RichEditor1.left) * 0.3 + RichEditor1.left) as int,
        y: Math.round((RichEditor1.bottom - RichEditor1.top) * 0.5 + RichEditor1.top) as int
      },
        {
          x: Math.round((RichEditor1.right - RichEditor1.left) * 0.5 + RichEditor1.left) as int,
          y: Math.round((RichEditor1.bottom - RichEditor1.top) * 0.5 + RichEditor1.top) as int
        })
      await CommonFunc.sleep(3000);

      let strJson = inspector.getInspectorByKey('RichEditorApi2_text1');
      await CommonFunc.sleep(1000);
      console.info("[RichEditorApi2_001] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('SelectMenuAppear');
      console.info('[RichEditorApi2_001] END');
      done();
    });


    
    
    
    /**
     * @tc.number   RichEditorApi2_static_002
     * @tc.name     RichEditorApi2_static_002
     * @tc.desc     RichEditorApi2_static_002
     * @tc.level    Level.LEVEL2
     */
it('RichEditorApi2_static_002', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[RichEditorApi2_002] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('RichEditorApi2_getSpans'));
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('RichEditorApi2_text2');
      await CommonFunc.sleep(1000);
      console.info("[RichEditorApi2_002] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('renderingStrategy:0,effectStrategy:0');

      console.info('[RichEditorApi2_002] END');
      done();
    });
  })
}


