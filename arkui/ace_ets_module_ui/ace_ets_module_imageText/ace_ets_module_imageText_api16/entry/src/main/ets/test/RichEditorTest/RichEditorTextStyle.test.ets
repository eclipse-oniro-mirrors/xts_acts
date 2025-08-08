/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function RichEditorTextStyle() {
  describe('RichEditorTextStyle', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorTextStyle beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditorTextStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorTextStyle state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("RichEditorTextStyle" == pages.name)) {
          console.info("get RichEditorTextStyle state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push RichEditorTextStyle page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorTextStyle page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RichEditorTextStyle after each called");
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0001
    * @tc.name         RichEditorTextStyle0001
    * @tc.desic        The halfLeading variable is added to the RichEditorTextStyle 
                           and RichEditorTextStyleResult objects of the RichEditor component.
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
     */
    it('RichEditorTextStyle0001', 0, async (done: Function) => {
        let driver = Driver.create();
        console.info('RichEditorTextStyle RichEditorTextStyle0001 START');
        await CommonFunc.sleep(1000);
        let set = await driver.findComponent(ON.id('setTypingStyle1'))
        await CommonFunc.sleep(500);
        await set.click();
        await CommonFunc.sleep(500);
        let get = await driver.findComponent(ON.id('getTypingStyle'))
        await CommonFunc.sleep(500);
        await get.click();
        await CommonFunc.sleep(500);
        let strJson = getInspectorByKey('RichEditor_Text');
        let obj: ESObject = JSON.parse(strJson);
        console.log('addOrDelText0001---obj.$attrs.content---' +
         JSON.stringify(obj.$attrs.content));
        expect('' + obj.$attrs.content).assertEqual("true");
        console.info("[RichEditorTextStyle0001] end");
        done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0002
    * @tc.name         RichEditorTextStyle0002
    * @tc.desic        The halfLeading variable is added to the RichEditorTextStyle 
                           and RichEditorTextStyleResult objects of the RichEditor component.
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
     */
    it('RichEditorTextStyle0002', 0, async (done: Function) => {
        let driver = Driver.create();
        console.info('RichEditorTextStyle RichEditorTextStyle0002 START');
        await CommonFunc.sleep(1000);
        let set = await driver.findComponent(ON.id('setTypingStyle2'))
        await CommonFunc.sleep(500);
        await set.click();
        await CommonFunc.sleep(500);
        let get = await driver.findComponent(ON.id('getTypingStyle'))
        await CommonFunc.sleep(500);
        await get.click();
        await CommonFunc.sleep(500);
        let strJson = getInspectorByKey('RichEditor_Text');
        let obj: ESObject = JSON.parse(strJson);
        console.log('addOrDelText0001---obj.$attrs.content---' +
         JSON.stringify(obj.$attrs.content));
        expect('' + obj.$attrs.content).assertEqual("false");
        console.info("[RichEditorTextStyle0002] end");
        done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0003
    * @tc.name         RichEditorTextStyle0003
    * @tc.desic        The halfLeading variable is added to the RichEditorTextStyle 
                           and RichEditorTextStyleResult objects of the RichEditor component.
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
     */
    it('RichEditorTextStyle0003', 0, async (done: Function) => {
        let driver = Driver.create();
        console.info('RichEditorTextStyle RichEditorTextStyle0003 START');
        await CommonFunc.sleep(1000);
        let set = await driver.findComponent(ON.id('setTypingStyle3'))
        await CommonFunc.sleep(500);
        await set.click();
        await CommonFunc.sleep(500);
        let get = await driver.findComponent(ON.id('getTypingStyle'))
        await CommonFunc.sleep(500);
        await get.click();
        await CommonFunc.sleep(500);
        let strJson = getInspectorByKey('RichEditor_Text');
        let obj: ESObject = JSON.parse(strJson);
        console.log('addOrDelText0001---obj.$attrs.content---' +
         JSON.stringify(obj.$attrs.content));
        expect('' + obj.$attrs.content).assertEqual("");
        console.info("[RichEditorTextStyle0003] end");
        done();
    });


    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0004
    * @tc.name         RichEditorTextStyle0004
    * @tc.desic        The halfLeading variable is added to the RichEditorTextStyle 
                           and RichEditorTextStyleResult objects of the RichEditor component.
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
     */
    it('RichEditorTextStyle0004', 0, async (done: Function) => {
        let driver = Driver.create();
        console.info('RichEditorTextStyle RichEditorTextStyle0004 START');
        await CommonFunc.sleep(1000);
        let update = await driver.findComponent(ON.id('updateSpanStyle1'))
        await CommonFunc.sleep(500);
        await update.click();
        await CommonFunc.sleep(500);
        let get = await driver.findComponent(ON.id('getSpans'))
        await CommonFunc.sleep(500);
        await get.click();
        await CommonFunc.sleep(500);
        let strJson = getInspectorByKey('RichEditor_Text2');
        let obj: ESObject = JSON.parse(strJson);
        console.log('addOrDelText0001---obj.$attrs.content---' +
         JSON.stringify(obj.$attrs.content));
        expect('' + obj.$attrs.content).assertEqual("true");
        console.info("[RichEditorTextStyle0004] end");
        done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0005
    * @tc.name         RichEditorTextStyle0005
    * @tc.desic        The halfLeading variable is added to the RichEditorTextStyle 
                           and RichEditorTextStyleResult objects of the RichEditor component.
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
     */
    it('RichEditorTextStyle0005', 0, async (done: Function) => {
        let driver = Driver.create();
        console.info('RichEditorTextStyle RichEditorTextStyle0005 START');
        await CommonFunc.sleep(1000);
        let update = await driver.findComponent(ON.id('updateSpanStyle2'))
        await CommonFunc.sleep(500);
        await update.click();
        await CommonFunc.sleep(500);
        let get = await driver.findComponent(ON.id('getSpans'))
        await CommonFunc.sleep(500);
        await get.click();
        await CommonFunc.sleep(500);
        let strJson = getInspectorByKey('RichEditor_Text2');
        let obj: ESObject = JSON.parse(strJson);
        console.log('addOrDelText0001---obj.$attrs.content---' +
         JSON.stringify(obj.$attrs.content));
        expect('' + obj.$attrs.content).assertEqual("false");
        console.info("[RichEditorTextStyle0005] end");
        done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0006
    * @tc.name         RichEditorTextStyle0006
    * @tc.desic        The halfLeading variable is added to the RichEditorTextStyle 
                           and RichEditorTextStyleResult objects of the RichEditor component.
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
     */
    it('RichEditorTextStyle0006', 0, async (done: Function) => {
        let driver = Driver.create();
        console.info('RichEditorTextStyle RichEditorTextStyle0006 START');
        await CommonFunc.sleep(1000);
        let update = await driver.findComponent(ON.id('updateSpanStyle3'))
        await CommonFunc.sleep(500);
        await update.click();
        await CommonFunc.sleep(500);
        let get = await driver.findComponent(ON.id('getSpans'))
        await CommonFunc.sleep(500);
        await get.click();
        await CommonFunc.sleep(500);
        let strJson = getInspectorByKey('RichEditor_Text2');
        let obj: ESObject = JSON.parse(strJson);
        console.log('addOrDelText0001---obj.$attrs.content---' +
         JSON.stringify(obj.$attrs.content));
        expect('' + obj.$attrs.content).assertEqual("false");
        console.info("[RichEditorTextStyle0006] end");
        done();
    });

  })
}