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
import { describe, beforeAll, beforeEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, ON, Point } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function RichEditorOnDoubleClickTest() {
  describe('RichEditorOnDoubleClickTest', () => {
    beforeAll(() => {
      console.info("RichEditorOnDoubleClickTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api14.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("RichEditorOnDoubleClickTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/onDoubleClickOnHover",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get RichEditorOnDoubleClickTest state pages:" + "");
        if (!("onDoubleClickOnHover" == pages.name)) {
          console.info("get RichEditorOnDoubleClickTest pages.name:" + "");
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push RichEditorOnDoubleClickTest page error:" + err);
      }
      console.info("RichEditorOnDoubleClickTest beforeEach end");
    }); 


     
    

    /**
     * @tc.number   RichEditorOnDoubleClickTest_static_0010
     * @tc.name     RichEditorOnDoubleClickTest_static_0010
     * @tc.desc     RichEditorOnDoubleClickTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('RichEditorOnDoubleClickTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RichEditorOnDoubleClickTest_0010 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(500);
      let RichEditor = await driver.findComponent(ON.id('RichEditor_OnDoubleClickOnHover'));
      let point:Point = await RichEditor!.getBoundsCenter()
      await CommonFunc.sleep(500);
      await driver.mouseMoveTo({ x: point.x , y: point.y })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('OnDoubleClickOnHover');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[RichEditorOnDoubleClickTest_0010] content: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onHover:true');
      console.info('[RichEditorOnDoubleClickTest_0010] END');
      done();
    });

     
    

    /**
     * @tc.number   RichEditorOnDoubleClickTest_static_0020
     * @tc.name     RichEditorOnDoubleClickTest_static_0020
     * @tc.desc     RichEditorOnDoubleClickTest_static_0020
     * @tc.level    Level.LEVEL0
     */
it('RichEditorOnDoubleClickTest_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RichEditorOnDoubleClickTest_0020 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(500);
      let RichEditor = await driver.findComponent(ON.id('RichEditor_OnDoubleClickOnHover'));
      let point:Point = await RichEditor!.getBoundsCenter()
      await CommonFunc.sleep(500);
      await driver.mouseMoveTo({ x:point.x , y:point.y })
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('OnDoubleClickOnHover'));
      let point2:Point = await text!.getBoundsCenter()
      await CommonFunc.sleep(500);
      await driver.mouseMoveTo({ x:point2.x , y:point2.y })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('OnDoubleClickOnHover');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[RichEditorOnDoubleClickTest_0020] content: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onHover:false');
      console.info('[RichEditorOnDoubleClickTest_0020] END');
      done();
    });
  })
}
