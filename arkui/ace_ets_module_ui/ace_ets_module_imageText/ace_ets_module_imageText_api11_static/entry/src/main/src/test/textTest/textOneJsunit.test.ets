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
import { MessageManagerBase, CallbackBase } from '../../../ets/MainAbility/common/MessageManager2';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { TextAlign, TextOverflow } from '@ohos.arkui.component'
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
const waitUiReadyMs = 1000;

export default function textOneJsunit() {
  describe('textOneJsunit', () => {

    beforeAll(() => {
      console.info("textOneJsunit beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("textOneJsunit beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/textOne',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get textOneJsunit state pages:" + JSON.stringify(pages));
        if (!("textOne" == pages.name)) {
          console.info("get textOneJsunit pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push textOneJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textOneJsunit page error:" + err);
      }
      console.info("textOneJsunit beforeEach end");
    });


    
    /**
     * @tc.number   textOneJsunit_static_0100
     * @tc.name     textOneJsunit_static_0100
     * @tc.desc     textOneJsunit_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('textOneJsunit_static_0100', Level.LEVEL1, async (done: ()=>void) => {
       console.info('textOneJsunit_static_0100 START');
       await CommonFunc.sleep(1000);
       // get the text part component and test attribute
       let strJson = inspector.getInspectorByKey('text1');
       let obj = JSON.parseJsonElement(strJson);
       console.info('textOneJsunit_static_0100 component obj is: ' + obj.getElement('$attrs').getString('textAlign') + "---" + obj.getElement('$attrs').getString('content') + "--" + obj.getElement('$attrs').getString('fontSize'));
       expect(obj.getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.Center');
       expect(obj.getElement('$attrs').getString('content')).assertEqual('TextAlign set to Center.');
       expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('12.00fp');
       done();
    });

    
   /**
     * @tc.number   textOneJsunit_static_0200
     * @tc.name     textOneJsunit_static_0200
     * @tc.desc     textOneJsunit_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('textOneJsunit_static_0200', Level.LEVEL1, async (done: ()=>void) => {
      console.info('textOneJsunit_static_0200 START');
      // test the enum value of textAlign
      const message: MessageManagerBase<TextAlign> = AppStorage.get<MessageManagerBase<TextAlign>>("messageManagerTextAlign")!
      message.notify({name:'textAlign',value:TextAlign.Start});
      await CommonFunc.sleep(200);
      let strJson = inspector.getInspectorByKey('text1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('textOneJsunit_static_0200 component obj is: ' + obj.getElement('$attrs').getString('textAlign'));
      expect(obj.getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.Start');
      message.notify({name:'textAlign',value:TextAlign.End});
      await CommonFunc.sleep(200);
      let strJson2 = inspector.getInspectorByKey('text1');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('textOneJsunit_static_0200 component obj2 is: ' + obj.getElement('$attrs').getString('textAlign'));
      expect(obj2.getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.End');
      done();
    });

    
    // /*
    //  * @tc.number   textOneJsunit_static_0300
    //  * @tc.name     textOneJsunit_static_0300
    //  * @tc.desc     textOneJsunit_static_0300
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('textOneJsunit_static_0300', Level.LEVEL1, async (done: ()=>void) => {
    //   console.info('textOneJsunit_static_0300 START');
    //   // test the illegal enum value of textAlign
    //   let message: MessageManagerBase<number|int|string> = AppStorage.get<MessageManagerBase<number|int|string>>("messageManager")!
    //   message.notify({name:'textAlign',value:4});  No enum TextAlign with value 4
    //   await CommonFunc.sleep(200);
    //   let strJson = inspector.getInspectorByKey('text1');
    //   let obj = JSON.parseJsonElement(strJson);
    //   console.info('textOneJsunit_static_0300 component obj is: ' + obj.getElement('$attrs').getString('textAlign'));
    //   expect(obj.getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.Left');
    //   done();
    // });

    /**
     * @tc.number   textOneJsunit_static_0400
     * @tc.name     textOneJsunit_static_0400
     * @tc.desc     textOneJsunit_static_0400
     * @tc.level    Level.LEVEL1
     */
    it('textOneJsunit_static_0400', Level.LEVEL1, async (done: ()=>void) => {
      console.info('textOneJsunit_static_0400 START');
      // test the  enum value of textOverflow
      let message: MessageManagerBase<TextOverflow> = AppStorage.get<MessageManagerBase<TextOverflow>>("messageManagerTextOverflow")!
      message.notify({name:'textOverflow',value:TextOverflow.Clip});
      await CommonFunc.sleep(2000);
      let message2: MessageManagerBase<number|int|string> = AppStorage.get<MessageManagerBase<number|int|string>>("messageManager")!
      message2.notify({name:'maxLines',value:1});
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('text4');
      let obj = JSON.parseJsonElement(strJson);
      console.info('textOneJsunit_static_0400 component obj is: ' + obj.getElement('$attrs').getString('textOverflow'));
      expect(obj.getElement('$attrs').getString('textOverflow')).assertEqual('TextOverflow.Clip');
      message.notify({name:'textOverflow',value:TextOverflow.Ellipsis});

      await CommonFunc.sleep(2000);
      let strJson2 = inspector.getInspectorByKey('text4');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('textOneJsunit_static_0400 component obj2 is: ' + obj2.getElement('$attrs').getString('textOverflow'));
      expect(obj2.getElement('$attrs').getString('textOverflow')).assertEqual('TextOverflow.Ellipsis');
      done();
    });

    // /*
    //  * @tc.number   textOneJsunit_static_0500
    //  * @tc.name     textOneJsunit_static_0500
    //  * @tc.desc     textOneJsunit_static_0500
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('textOneJsunit_static_0500', Level.LEVEL1, async (done: ()=>void) => {
    //   console.info('textOneJsunit_static_0500 START');
    //   // test the illegal enum value of textOverflow
    //   let message: MessageManagerBase<number|int|string> = AppStorage.get<MessageManagerBase<number|int|string>>("messageManager")!
    //   message.notify({name:'textOverflow',value:4}); No enum TextOverflow with value 4
    //   await CommonFunc.sleep(1000);
    //   message.notify({name:'maxLines',value:1});
    //   await CommonFunc.sleep(2000);
    //   let strJson = inspector.getInspectorByKey('text4');
    //   let obj = JSON.parseJsonElement(strJson);
    //   console.info('textOneJsunit_static_0400 component obj is: ' + obj.getElement('$attrs').getString('textOverflow'));
    //   expect(obj.getElement('$attrs').getString('textOverflow')).assertEqual('TextOverflow.Ellipsis');
    //   done();
    // });

    /**
     * @tc.number   textOneJsunit_static_0600
     * @tc.name     textOneJsunit_static_0600
     * @tc.desc     textOneJsunit_static_0600
     * @tc.level    Level.LEVEL1
     */
    it('textOneJsunit_static_0600', Level.LEVEL1, async (done: ()=>void) => {
      console.info('textOneJsunit_static_0600 START');
      // test the value of lineHeight
      let message: MessageManagerBase<number|int|string> = AppStorage.get<MessageManagerBase<number|int|string>>("messageManager")!
      message.notify({name:'lineHeightNumber',value:20 as double});
      await CommonFunc.sleep(200);
      let strJson = inspector.getInspectorByKey('text5');
      let obj = JSON.parseJsonElement(strJson);
      // console.info('textOneJsunit_static_0600 component obj is: ' + obj.getElement('$attrs').getString('lineHeight'));
      expect(obj.getElement('$attrs').getString('lineHeight')).assertEqual('20.00fp');
      let message2: MessageManagerBase<number|int|string> = AppStorage.get<MessageManagerBase<number|int|string>>("messageManager")!
      message2.notify({name:'lineHeightStr',value:"30fp"});
      await CommonFunc.sleep(200);
      let strJson2 = inspector.getInspectorByKey('text5');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('textOneJsunit_static_0600 component obj is: ' + obj2.getElement('$attrs').getString('lineHeight'));
      expect(obj2.getElement('$attrs').getString('lineHeight')).assertEqual('30.00fp');
      done();
    });
  })
}