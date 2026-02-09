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
import {Component,  Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { TextDecorationType, Color, TextCase } from '@ohos.arkui.component'
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
const waitUiReadyMs = 1000;

export default function textTwoJsunit() {
  describe('textTwoJsunit', () => {

    beforeAll(() => {
      console.info("textTwoJsunit beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("textTwoJsunit beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/textTwo',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        let pages:router.RouterState = routerInstance.getState();
        console.info("get textTwoJsunit state pages:" + JSON.stringify(pages));
        if (!("textTwo" == pages.name)) {
          console.info("get textTwoJsunit pages.name:" + '');
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textTwoJsunit page error:" + err);
      }
      console.info("textTwoJsunit beforeEach end");
    });


    // /*
    //  * @tc.number   textTwoJsunit_static_0100
    //  * @tc.name     textTwoJsunit_static_0100
    //  * @tc.desc     textTwoJsunit_static_0100
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('textTwoJsunit_static_0100', Level.LEVEL1, async (done: ()=>void) => {
    //   console.info('textTwoJsunit_static_0200 START');
    //   // test the illegal value of decoration
    //   await CommonFunc.sleep(1000);
    //   let message: MessageManager = AppStorage.get<MessageManager>("messageManager")!
    //   message.notify({name:'type',value:undefined})//Type 'undefined' is not compatible with type 'String|Double|TextCase|TextDecorationType|Boolean|Resource' at property 'value' [textTwoJsunit.test.ets:84:41]
    //   await CommonFunc.sleep(1000);
    //   message.notify({name:'color',value:undefined})
    //   await CommonFunc.sleep(1000);
    //   let strJson = inspector.getInspectorByKey('text1');
    //   let obj = JSON.parseJsonElement(strJson);
    //   console.info('textTwoJsunit_static_0100 component obj is: ' + obj.getElement('$attrs').getString('decoration'));
    //   expect(obj.getElement('$attrs').getString('decoration')).assertEqual('{"type":"TextDecorationType.None","color":"#FF000000",' +
    //   '"style":"TextDecorationStyle.SOLID"}');
    //   done();
    // });

    // /*
    //  * @tc.number   textTwoJsunit_static_0200
    //  * @tc.name     textTwoJsunit_static_0200
    //  * @tc.desc     textTwoJsunit_static_0200
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('textTwoJsunit_static_0200', Level.LEVEL1, async (done: ()=>void) => { // textTwoJsunit_static_0100 影响
    //   console.info('imageOneJsunit_0200 START');
    //   await CommonFunc.sleep(500);
    //   // get the image component and test attribute
    //   let strJson = inspector.getInspectorByKey('text1');
    //   let obj = JSON.parseJsonElement(strJson);
    //   console.info('textTwoJsunit_static_0200 component obj is: ' + obj.getElement('$attrs').getString('decoration'));
    //   expect(obj.getElement('$attrs').getString('decoration')).assertEqual('{"type":"TextDecorationType.LineThrough","color":"#FF000000",' +
    //   '"style":"TextDecorationStyle.SOLID"}');
    //   await CommonFunc.sleep(1000);
    //   // to modify the atrribute
    //   let message: MessageManager = AppStorage.get<MessageManager>("messageManager")!
    //   message.notify({name:'type',value:TextDecorationType.Overline})
    //   await CommonFunc.sleep(1000);
    //   message.notify({name:'color',value:Color.Green})
    //   await CommonFunc.sleep(200);
    //   let strJson2 = inspector.getInspectorByKey('text1');
    //   let obj2 = JSON.parseJsonElement(strJson2);
    //   console.info('textTwoJsunit_static_0200 component obj2 is: ' + obj2.getElement('$attrs').getString('decoration'));
    //   expect(obj2.getElement('$attrs').getString('decoration')).assertEqual('{"type":"TextDecorationType.Overline","color":"#FF008000",' +
    //   '"style":"TextDecorationStyle.SOLID"}');
    //   await CommonFunc.sleep(1000);
    //   message.notify({name:'type',value:TextDecorationType.Underline})
    //   await CommonFunc.sleep(1000);
    //   message.notify({name:'color',value:'rgb(238, 130, 238)'})
    //   await CommonFunc.sleep(200);
    //   let strJson3 = inspector.getInspectorByKey('text1');
    //   let obj3  = JSON.parseJsonElement(strJson3);
    //   console.info('textTwoJsunit_static_0200 component obj3 is: ' + obj3.getElement('$attrs').getString('decoration'));
    //   expect(obj3.getElement('$attrs').getString('decoration')).assertEqual('{"type":"TextDecorationType.Underline","color":"#FFEE82EE",' +
    //   '"style":"TextDecorationStyle.SOLID"}');
    //   await CommonFunc.sleep(1000);
    //   message.notify({name:'type',value:TextDecorationType.None})
    //
    //   await CommonFunc.sleep(1000);
    //   message.notify({name:'color',value:'#FFACEEEE'})
    //
    //   await CommonFunc.sleep(2000);
    //   let strJson4 = inspector.getInspectorByKey('text1');
    //   let obj4  = JSON.parseJsonElement(strJson4);
    //   console.info('textTwoJsunit_static_0200 component obj4 is: ' + obj4.getElement('$attrs').getString('decoration'));
    //   expect(obj4.getElement('$attrs').getString('decoration')).assertEqual('{"type":"TextDecorationType.None","color":"#FFACEEEE",' +
    //   '"style":"TextDecorationStyle.SOLID"}');
    //   done();
    // });

   

    /**
     * @tc.number   textTwoJsunit_static_0300
     * @tc.name     textTwoJsunit_static_0300
     * @tc.desc     textTwoJsunit_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('textTwoJsunit_static_0300', Level.LEVEL1, async (done: ()=>void) => {
      console.info('textTwoJsunit_static_0300 START');
      // test the baselineOffset
      await CommonFunc.sleep(1000);
      let message: MessageManager = AppStorage.get<MessageManager>("messageManager")!
      message.notify({name:'baselineOffset',value:30})

      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('text2');
      let obj = JSON.parseJsonElement(strJson);
      console.info('textTwoJsunit_static_0300 component obj is: ' + obj.getElement('$attrs').getString('baselineOffset'));
      expect(obj.getElement('$attrs').getString('baselineOffset')).assertEqual('30');
      done();
    });

    /**
     * @tc.number   textTwoJsunit_static_0400
     * @tc.name     textTwoJsunit_static_0400
     * @tc.desc     textTwoJsunit_static_0400
     * @tc.level    Level.LEVEL1
     */
    it('textTwoJsunit_static_0400', Level.LEVEL1, async (done: ()=>void) => {
      console.info('textTwoJsunit_static_0400 START');
      // test the baselineOffset of negative value
      await CommonFunc.sleep(1000);
      let message: MessageManager = AppStorage.get<MessageManager>("messageManager")!
      message.notify({name:'baselineOffset',value:-20})

      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('text2');
      let obj = JSON.parseJsonElement(strJson);
      console.info('textTwoJsunit_static_0400 component obj is: ' + obj.getElement('$attrs').getString('baselineOffset'));
      expect(obj.getElement('$attrs').getString('baselineOffset')).assertEqual('-20');
      done();
    });

    /**
     * @tc.number   textTwoJsunit_static_0500
     * @tc.name     textTwoJsunit_static_0500
     * @tc.desc     textTwoJsunit_static_0500
     * @tc.level    Level.LEVEL1
     */
    it('textTwoJsunit_static_0500', Level.LEVEL1, async (done: ()=>void) => {
      console.info('textTwoJsunit_static_0500 START');
      // test the letterSpacing
      await CommonFunc.sleep(1000);
      let message: MessageManager = AppStorage.get<MessageManager>("messageManager")!
      message.notify({name:'letterSpacing',value:4});

      await CommonFunc.sleep(200);
      let strJson = inspector.getInspectorByKey('text3');
      let obj = JSON.parseJsonElement(strJson);
      console.info('textTwoJsunit_static_0500 component obj is: ' + obj.getElement('$attrs').getString('letterSpacing'));
      expect(obj.getElement('$attrs').getString('letterSpacing')).assertEqual('4.00fp');
      done();
    });

    /**
     * @tc.number   textTwoJsunit_static_0600
     * @tc.name     textTwoJsunit_static_0600
     * @tc.desc     textTwoJsunit_static_0600
     * @tc.level    Level.LEVEL1
     */
    it('textTwoJsunit_static_0600', Level.LEVEL1, async (done: ()=>void) => {
      console.info('textTwoJsunit_static_0600 START');
      // test the baselineOffset of negative value
      await CommonFunc.sleep(1000);
      let message: MessageManager = AppStorage.get<MessageManager>("messageManager")!
      message.notify({name:'letterSpacing',value:-2})

      await CommonFunc.sleep(200);
      let strJson = inspector.getInspectorByKey('text3');
      let obj = JSON.parseJsonElement(strJson);
      console.info('textTwoJsunit_static_0600 component obj is: ' + obj.getElement('$attrs').getString('letterSpacing'));
      expect(obj.getElement('$attrs').getString('baselineOffset')).assertEqual('0');
      done();
    });

    /**
     * @tc.number   textTwoJsunit_static_0700
     * @tc.name     textTwoJsunit_static_0700
     * @tc.desc     textTwoJsunit_static_0700
     * @tc.level    Level.LEVEL1
     */
    it('textTwoJsunit_static_0700', Level.LEVEL1, async (done: ()=>void) => {
      console.info('textTwoJsunit_static_0700 START');
      // test the testcase
      await CommonFunc.sleep(1000);
      let message: MessageManager = AppStorage.get<MessageManager>("messageManager")!
      message.notify({name:'textCase',value:TextCase.Normal})

      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('text5');
      let obj = JSON.parseJsonElement(strJson);
      console.info('textTwoJsunit_static_0700 component obj is: ' + obj.getElement('$attrs').getString('textCase'));
      expect(obj.getElement('$attrs').getString('textCase')).assertEqual('TextCase.Normal');
      message.notify({name:'textCase',value:TextCase.LowerCase})

      await CommonFunc.sleep(2000);
      let strJson2 = inspector.getInspectorByKey('text5');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('textTwoJsunit_static_0700 component obj2 is: ' + obj2.getElement('$attrs').getString('textCase'));
      expect(obj2.getElement('$attrs').getString('textCase')).assertEqual('TextCase.LowerCase');
      message.notify({name:'textCase',value:TextCase.UpperCase})

      await CommonFunc.sleep(2000);
      let strJson3 = inspector.getInspectorByKey('text5');
      let obj3  = JSON.parseJsonElement(strJson3);
      console.info('textTwoJsunit_static_0700 component obj3 is: ' + obj3.getElement('$attrs').getString('textCase'));
      expect(obj3.getElement('$attrs').getString('textCase')).assertEqual('TextCase.UpperCase');
      done();
    });

    // /*
    //  * @tc.number   textTwoJsunit_static_0800
    //  * @tc.name     textTwoJsunit_static_0800
    //  * @tc.desc     textTwoJsunit_static_0800
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('textTwoJsunit_static_0800', Level.LEVEL1, async (done: ()=>void) => {
    //   console.info('textTwoJsunit_static_0800 START');
    //   // test the testcase of illegal value
    //   await CommonFunc.sleep(1000);
    //   let message: MessageManager = AppStorage.get<MessageManager>("messageManager")!
    //   message.notify({name:'textCase',value:8}) // textCase 没有值为8的成员
    //
    //   await CommonFunc.sleep(2000);
    //   let strJson = inspector.getInspectorByKey('text5');
    //   let obj = JSON.parseJsonElement(strJson);
    //   console.info('textTwoJsunit_static_0800 component obj is: ' + obj.getElement('$attrs').getString('testCase'));
    //   expect(obj.getElement('$attrs').getString('textCase')).assertEqual('TextCase.Normal');
    //   done();
    // });
  })
}