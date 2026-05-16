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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import {
  TextAlign,
  LeadingMarginPlaceholder
} from '@ohos.arkui.component'
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function RichEditorApi() {
  describe('RichEditorApi', () => {
    beforeEach(async (): Promise<void> => {
      console.info("RichEditorApi beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/RichEditorApi",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get RichEditorApi state pages:" + JSON.stringify(pages));
        if (!("RichEditorApi" == pages.name)) {
          console.info("get RichEditorApi pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push RichEditorApi page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorApi page error:" + err);
      }
      console.info("RichEditorApi beforeEach end");
    });
    beforeAll(() => {
      console.info("RichEditorApi beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RichEditorApi after each called");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RichEditorApi after each called");
    });

    
    /**
     * @tc.number   RichEditorApi_static_001
     * @tc.name     RichEditorApi_static_001
     * @tc.desc     RichEditorApi_static_001
     * @tc.level    Level.LEVEL2
     */
    it('RichEditorApi_static_001', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[RichEditorApi_001] START');
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('RichEditorApi_text_hello');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson);
      // console.info("[RichEditorApi_001] obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('hello');

      console.info('[RichEditorApi_001] END');
      done();

    });

    
    /**
     * @tc.number   RichEditorApi_static_002
     * @tc.name     RichEditorApi_static_002
     * @tc.desc     RichEditorApi_static_002
     * @tc.level    Level.LEVEL2
     */
    it('RichEditorApi_static_002', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[RichEditorApi_002] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('RichEditorApi_btn_getParagraphs'));
      await (btn1?.click() as Promise<void>)
      ;
      console.log('spanParagraphs'+ AppStorage.get<TextAlign>('getParagraphs_textAlign'))
      console.log('spanParagraphs'+ AppStorage.get<string>('getParagraphs_size'))
      console.log('spanParagraphs'+ AppStorage.get<[number, number]>('getParagraphs_range'))
      expect(AppStorage.get<TextAlign>('getParagraphs_textAlign')).assertEqual(0)
      expect(AppStorage.get<string>('getParagraphs_size')).assertEqual('{"size":["5.00vp","0.00vp"]}')
      expect(''+AppStorage.get<[number, number]>('getParagraphs_range')).assertEqual('0,4')
      AppStorage.delete('getParagraphs_textAlign')
      AppStorage.delete('getParagraphs_size')
      AppStorage.delete('getParagraphs_range')
      console.info('[RichEditorApi_002] END');
      done();
    });

    
    /**
     * @tc.number   RichEditorApi_static_003
     * @tc.name     RichEditorApi_static_003
     * @tc.desc     RichEditorApi_static_003
     * @tc.level    Level.LEVEL2
     */
    it('RichEditorApi_static_003', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[RichEditorApi_003] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('RichEditorApi_btn_updateParagraphStyle'));
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(2000);
      console.info('[RichEditorApi_003] btn1');

      let btn2 = await driver.findComponent(ON.id('RichEditorApi_btn_getParagraphs'));
      await (btn2?.click() as Promise<void>)
      await CommonFunc.sleep(2000);
      console.info('[RichEditorApi_003] btn2');
      console.log('spanParagraphs'+AppStorage.get<TextAlign>('getParagraphs_textAlign'))
      console.log('spanParagraphs'+AppStorage.get<string>('getParagraphs_size'))
      console.log('spanParagraphs'+AppStorage.get<[number, number]>('getParagraphs_range'))
      expect(AppStorage.get<TextAlign>('getParagraphs_textAlign')).assertEqual(0)
      expect(AppStorage.get<string>('getParagraphs_size')).assertEqual('{"size":["10.00vp","0.00vp"]}')
      expect(''+AppStorage.get<[number, number]>('getParagraphs_range')).assertEqual('0,4')
      AppStorage.delete('getParagraphs_textAlign')
      AppStorage.delete('getParagraphs_size')
      AppStorage.delete('getParagraphs_range')
      console.info('[RichEditorApi_003] END');
      done();
    });

    
    /**
     * @tc.number   RichEditorApi_static_004
     * @tc.name     RichEditorApi_static_004
     * @tc.desc     RichEditorApi_static_004
     * @tc.level    Level.LEVEL2
     */
    it('RichEditorApi_static_004', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[RichEditorApi_004] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let RichEditor3 = CommonFunc.getComponentRectOnScreen('RichEditorApi_RichEditor3')
      await driver.mouseClick({
        x: Math.round((RichEditor3.right - RichEditor3.left) * 0.5 + RichEditor3.left) as Int,
        y: Math.round((RichEditor3.bottom - RichEditor3.top) * 0.5 + RichEditor3.top) as Int
      }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('RichEditorApi_text1');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('CustomMenuAppear');
      console.info('[RichEditorApi_004] END');
      done();
    });


    
    /**
     * @tc.number   RichEditorApi_static_005
     * @tc.name     RichEditorApi_static_005
     * @tc.desc     RichEditorApi_static_005
     * @tc.level    Level.LEVEL2
     */
    it('RichEditorApi_static_005', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[RichEditorApi_005] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let RichEditor4 = CommonFunc.getComponentRectOnScreen('RichEditorApi_RichEditor4')
      await driver.longClick(Math.round((RichEditor4.right - RichEditor4.left) * 0.5 + RichEditor4.left)  as Int,
        Math.round((RichEditor4.bottom - RichEditor4.top) * 0.5 + RichEditor4.top)as Int)
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('RichEditorApi_text2');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson);
      // console.info("[RichEditorApi_005] obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('SecondMenuAppear');
      console.info('[RichEditorApi_005] END');
      done();
    });
  })
}


