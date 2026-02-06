/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function editMenuOptions() {
  describe('editMenuOptions', () => {
    beforeEach(async (done: Function) => {
      console.info("editMenuOptions beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/editMenuOptionsApi16',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get editMenuOptions state pages: " + JSON.stringify(pages));
        if (!("editMenuOptionsApi16" == pages.name)) {
          console.info("get editMenuOptions state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push editMenuOptions success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push editMenuOptions page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   editMenuOptions0001
     * @tc.number SUB_ACE_editMenuOptions0001
     * @tc.desc   The labelinfo property is added to the customized menu of the text component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('editMenuOptions0001', Level.LEVEL0, async (done: Function) => {
        let driver = Driver.create();
        console.info('editMenuOptions editMenuOptions0001 START');
        await CommonFunc.sleep(500);
        await CommonFunc.sleep(500);
        let text = await driver.findComponent(ON.id('text'));
        await CommonFunc.sleep(500);
        await text.longClick();
        await CommonFunc.sleep(500);
        let button = await driver.findComponent(ON.text('123456'));
        await CommonFunc.sleep(500);
        await button?.click();
        let search2 = await driver.findComponent(ON.id('search2'));
        await CommonFunc.sleep(500);
        await search2.click();
        await CommonFunc.sleep(500);
        let strJson = getInspectorByKey('textLabelInfo');
        let obj: ESObject = JSON.parse(strJson);
        console.log('editMenuOptions0001---obj.$attrs---' +
         JSON.stringify(obj.$attrs));
        console.log('editMenuOptions0001---obj.$attrs.content---' +
         JSON.stringify(obj.$attrs.content));
        expect('' + obj.$attrs.content).assertEqual("abc123456");
        console.info("[editMenuOptions0001] end");
        done();
    });

    /**
     * @tc.name   editMenuOptions0002
     * @tc.number SUB_ACE_editMenuOptions0002
     * @tc.desc   The labelinfo property is added to the customized menu of the textArea component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('editMenuOptions0002', Level.LEVEL0, async (done: Function) => {
        let driver = Driver.create();
        console.info('editMenuOptions editMenuOptions0002 START');
        await CommonFunc.sleep(500);
        await CommonFunc.sleep(500);
        let textArea = await driver.findComponent(ON.id('textArea'));
        await CommonFunc.sleep(500);
        await textArea.longClick();
        await CommonFunc.sleep(500);
        let button = await driver.findComponent(ON.text('111111'));
        await CommonFunc.sleep(500);
        await button?.click();
        let search2 = await driver.findComponent(ON.id('search2'));
        await CommonFunc.sleep(500);
        await search2.click();
        await CommonFunc.sleep(500);
        let strJson = getInspectorByKey('textAreaLabelInfo');
        let obj: ESObject = JSON.parse(strJson);
        console.log('editMenuOptions0002---obj.$attrs---' +
         JSON.stringify(obj.$attrs));
        console.log('editMenuOptions0002---obj.$attrs.content---' +
         JSON.stringify(obj.$attrs.content));
        expect('' + obj.$attrs.content).assertEqual("");
        
        console.info("[editMenuOptions0002] end");
        done();
    });

    /**
     * @tc.name   editMenuOptions0003
     * @tc.number SUB_ACE_editMenuOptions0003
     * @tc.desc   The labelinfo property is added to the customized menu of the textInput component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('editMenuOptions0003', Level.LEVEL0, async (done: Function) => {
        let driver = Driver.create();
        console.info('editMenuOptions editMenuOptions0003 START');
        await CommonFunc.sleep(500);
        await CommonFunc.sleep(500);
        let textInput = await driver.findComponent(ON.id('textInput'));
        await CommonFunc.sleep(500);
        await textInput.longClick();
        await CommonFunc.sleep(500);
        let button = await driver.findComponent(ON.text('custom2'));
        await CommonFunc.sleep(500);
        await button?.click();
        let search2 = await driver.findComponent(ON.id('search2'));
        await CommonFunc.sleep(500);
        await search2.click();
        await CommonFunc.sleep(500);
        let strJson = getInspectorByKey('textInputLabelInfo');
        let obj: ESObject = JSON.parse(strJson);
        console.log('editMenuOptions0003---obj.$attrs---' +
         JSON.stringify(obj.$attrs));
        console.log('editMenuOptions0003---obj.$attrs.content---' +
         JSON.stringify(obj.$attrs.content));
        expect('' + obj.$attrs.content).assertEqual("2222222");
        console.info("[editMenuOptions0003] end");
        done();
    });

    /**
     * @tc.name   editMenuOptions0004
     * @tc.number SUB_ACE_editMenuOptions0004
     * @tc.desc   The labelinfo property is added to the customized menu of the richEditor component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('editMenuOptions0004', Level.LEVEL0, async (done: Function) => {
        let driver = Driver.create();
        console.info('editMenuOptions editMenuOptions0004 START');
        await CommonFunc.sleep(500);
        await CommonFunc.sleep(500);
        let richEditor = await driver.findComponent(ON.id('richEditor'));
        await CommonFunc.sleep(500);
        await richEditor.longClick();
        await CommonFunc.sleep(500);
        let button = await driver.findComponent(ON.text('123456'));
        await CommonFunc.sleep(500);
        await button.click();
        console.log('editMenuOptions0004 button click succ');
        let search2 = await driver.findComponent(ON.id('search2'));
        await CommonFunc.sleep(500);
        await search2.click();
        await CommonFunc.sleep(500);
        let strJson = getInspectorByKey('richEditorLabelInfo');
        let obj: ESObject = JSON.parse(strJson);
        console.log('editMenuOptions0004---obj.$attrs---' +
         JSON.stringify(obj.$attrs));
        console.log('editMenuOptions0004---obj.$attrs.content---' +
         JSON.stringify(obj.$attrs.content));
        expect('' + obj.$attrs.content).assertEqual("abc123456");
        console.info("[editMenuOptions0004] end");
        done();
    });

    /**
     * @tc.name   editMenuOptions0005
     * @tc.number SUB_ACE_editMenuOptions0005
     * @tc.desc   The labelinfo property is added to the customized menu of the search component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('editMenuOptions0005', Level.LEVEL0, async (done: Function) => {
        let driver = Driver.create();
        console.info('editMenuOptions editMenuOptions0005 START');
        await CommonFunc.sleep(500);
        await CommonFunc.sleep(500);
        let search = await driver.findComponent(ON.id('search'));
        await CommonFunc.sleep(500);
        await search.longClick();
        await CommonFunc.sleep(500);
        let button = await driver.findComponent(ON.text('111111'));
        await CommonFunc.sleep(500);
        await button.click();
        console.log('editMenuOptions0005 button click succ');
        let search2 = await driver.findComponent(ON.id('search2'));
        await CommonFunc.sleep(500);
        await search2.click();
        await CommonFunc.sleep(500);
        let strJson = getInspectorByKey('searchLabelInfo');
        let obj: ESObject = JSON.parse(strJson);
        console.log('editMenuOptions0005---obj.$attrs---' +
         JSON.stringify(obj.$attrs));
        console.log('editMenuOptions0005---obj.$attrs.content---' +
         JSON.stringify(obj.$attrs.content));
        expect('' + obj.$attrs.content).assertEqual("");
        console.info("[editMenuOptions0005] end");
        done();
    });
  })
}
