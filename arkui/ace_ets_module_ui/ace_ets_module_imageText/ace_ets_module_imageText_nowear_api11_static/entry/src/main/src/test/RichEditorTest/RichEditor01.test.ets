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
import { describe, beforeEach,beforeAll, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
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

export default function RichEditor01() {
  describe('RichEditor01', () => {
    beforeAll(() => {
      console.info("RichEditor01 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("RichEditor01 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/RichEditor01",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RichEditor01 state pages:" + "");
        if (!("RichEditor01" == pages.name)) {
          console.info("get RichEditor01 pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push RichEditor01 page error:" + err);
      }
      console.info("RichEditor01 beforeEach end");
    });

    /**
     * @tc.number   RichEditor01_static_001
     * @tc.name     RichEditor01_static_001
     * @tc.desc     RichEditor01_static_001
     * @tc.level    Level.LEVEL0
     */
it('RichEditor01_static_001', Level.LEVEL0, async (done: () => void) => {

      await CommonFunc.sleep(1000);
      console.info('[RichEditor01_001] START');

      let strJson = inspector.getInspectorByKey('RichEditor01Text');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RichEditor01_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      console.info("[obj.$attrs.content] : " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('012345678');
      console.info('[RichEditor01_001] END');
      done();
    });
    //aboutToIMEInput 事件测试
    /**
     * @tc.number   RichEditor01_static_002
     * @tc.name     RichEditor01_static_002
     * @tc.desc     RichEditor01_static_002
     * @tc.level    Level.LEVEL0
     */
it('RichEditor01_static_002', Level.LEVEL0, async (done: () => void) => {

      console.info('[RichEditor01_002] START');
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('RichEditorKey'));
      await (text?.inputText('9') as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('RichEditor02Text');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('RichEditor03Text');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[RichEditor01_002] component obj is: " + JSON.stringify(obj1));
      console.info("[RichEditor01_002] component obj is: " + JSON.stringify(obj2));
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('0');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('9');
      console.info('[RichEditor01_002] END');
      done();
    });

    //onIMEInputComplete 事件测试
    
    /**
     * @tc.number   RichEditor01_static_003
     * @tc.name     RichEditor01_static_003
     * @tc.desc     RichEditor01_static_003
     * @tc.level    Level.LEVEL0
     */
it('RichEditor01_static_003', Level.LEVEL0, async (done: () => void) => {

      console.info('[RichEditor01_003] START');
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('RichEditorKey'));
      await (text?.inputText('9') as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('RichEditor01Text');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RichEditor01_003] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('0,9,0,1,0,1,16');
      console.info('[RichEditor01_003] END');
      done();
    });

    //set setCaretOffset to 6

    /**
     * @tc.number   RichEditor01_static_004
     * @tc.name     RichEditor01_static_004
     * @tc.desc     RichEditor01_static_004
     * @tc.level    Level.LEVEL0
     */
it('RichEditor01_static_004', Level.LEVEL0, async (done: () => void) => {

      console.info('[RichEditor01_004] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setCaretOffset01'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('RichEditor01Text');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RichEditor01_004] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('true');

      console.info('[RichEditor01_004] END');
      done();
    });

    //set setCaretOffset to 100

    
    
    
    /**
     * @tc.number   RichEditor01_static_005
     * @tc.name     RichEditor01_static_005
     * @tc.desc     RichEditor01_static_005
     * @tc.level    Level.LEVEL0
     */
it('RichEditor01_static_005', Level.LEVEL0, async (done: () => void) => {

      console.info('[RichEditor01_005] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setCaretOffset02'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('RichEditor01Text');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RichEditor01_005] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('false');
      console.info('[RichEditor01_005] END');
      done();
    });

    //set setCaretOffset to 100

    
    
    
    /**
     * @tc.number   RichEditor01_static_006
     * @tc.name     RichEditor01_static_006
     * @tc.desc     RichEditor01_static_006
     * @tc.level    Level.LEVEL0
     */
it('RichEditor01_static_006', Level.LEVEL0, async (done: () => void) => {

      console.info('[RichEditor01_006] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setCaretOffset01'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('getCaretOffset'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('RichEditor01Text');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RichEditor01_006] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content')).assertEqual('1');

      console.info('[RichEditor01_006] END');
      done();
    });
})
}
