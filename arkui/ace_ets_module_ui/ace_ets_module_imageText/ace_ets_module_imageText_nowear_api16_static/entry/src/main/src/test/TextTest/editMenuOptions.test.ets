'use static';
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function editMenuOptions() {
  describe('editMenuOptions', () : void => {
    beforeAll(() => {
      console.info("editMenuOptions beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api16.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("editMenuOptions beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/editMenuOptions",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get editMenuOptions state pages:" + "");
        if (!("TextClockApi" == pages.name)) {
          console.info("get editMenuOptions pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push editMenuOptions page error:" + err);
      }
      console.info("editMenuOptions beforeEach end");
    });
    afterEach(()=>{
      await CommonFunc.sleep(2000);
      const routerInstance = AppStorage.get<Router>("router") as Router
      routerInstance.replaceUrl({ url:'MainAbility/pages/index/index' })
      await CommonFunc.sleep(2000);
    })
    
    /**
     * @tc.number   editMenuOptions_static_0001
     * @tc.name     editMenuOptions_static_0001
     * @tc.desc     editMenuOptions_static_0001
     * @tc.level    Level.LEVEL0
     */
it('editMenuOptions_static_0001', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      let driver = Driver.create();
      console.info('editMenuOptions editMenuOptions0001 START');
      await CommonFunc.sleep(500);
      let text = await (driver.findComponent(ON.id('text')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await text.longClick();
      await CommonFunc.sleep(500);
      let button = await (driver.findComponent(ON.text('123456')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await button.click();
      let search2 = await (driver.findComponent(ON.id('search2')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await search2.click();
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('textLabelInfo');
      let obj = JSON.parseJsonElement(strJson);
      console.log('editMenuOptions0001---obj.$attrs---' + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      console.log('editMenuOptions0001---obj.$attrs.content---' + obj.getElement('$attrs').getString('content'));
      expect('' + obj.getElement('$attrs').getString('content')).assertEqual("abc123456");
      console.info("[editMenuOptions0001] end");
      done();
    });


    /**
     * @tc.number   editMenuOptions_static_0002
     * @tc.name     editMenuOptions_static_0002
     * @tc.desc     editMenuOptions_static_0002
     * @tc.level    Level.LEVEL0
     */
it('editMenuOptions_static_0002', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      let driver = Driver.create();
      console.info('editMenuOptions editMenuOptions0002 START');
      await CommonFunc.sleep(500);
      let textArea = await (driver.findComponent(ON.id('textArea')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await textArea.longClick();
      await CommonFunc.sleep(500);
      let button = await (driver.findComponent(ON.text('111111')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await button.click();
      let search2 = await (driver.findComponent(ON.id('search2')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await search2.click();
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('textAreaLabelInfo');
      let obj = JSON.parseJsonElement(strJson);
      console.log('editMenuOptions0002---obj.$attrs---' + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      console.log('editMenuOptions0002---obj.$attrs.content---' + obj.getElement('$attrs').getString('content'));
      expect('' + obj.getElement('$attrs').getString('content')).assertEqual("");
      console.info("[editMenuOptions0002] end");
      done();
    });

    
    /**
     * @tc.number   editMenuOptions_static_0003
     * @tc.name     editMenuOptions_static_0003
     * @tc.desc     editMenuOptions_static_0003
     * @tc.level    Level.LEVEL0
     */
it('editMenuOptions_static_0003', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      let driver = Driver.create();
      console.info('editMenuOptions editMenuOptions0003 START');
      await CommonFunc.sleep(500);
      let textInput = await (driver.findComponent(ON.id('textInput')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await textInput.longClick();
      await CommonFunc.sleep(500);
      let button = await (driver.findComponent(ON.text('custom2')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await button.click();
      let search2 = await (driver.findComponent(ON.id('search2')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await search2.click();
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('textInputLabelInfo');
      let obj = JSON.parseJsonElement(strJson);
      console.log('editMenuOptions0003---obj.$attrs---' + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      console.log('editMenuOptions0003---obj.$attrs.content---' + obj.getElement('$attrs').getString('content'));
      expect('' + obj.getElement('$attrs').getString('content')).assertEqual("2222222");
      console.info("[editMenuOptions0003] end");
      done();
    });

    
    /**
     * @tc.number   editMenuOptions_static_0004
     * @tc.name     editMenuOptions_static_0004
     * @tc.desc     editMenuOptions_static_0004
     * @tc.level    Level.LEVEL0
     */
it('editMenuOptions_static_0004', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      let driver = Driver.create();
      console.info('editMenuOptions editMenuOptions0004 START');
      await CommonFunc.sleep(500);
      let richEditor = await (driver.findComponent(ON.id('richEditor')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await richEditor.longClick();
      await CommonFunc.sleep(500);
      let button = await (driver.findComponent(ON.text('123456')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await button.click();
      console.log('editMenuOptions0004 button click succ');
      let search2 = await (driver.findComponent(ON.id('search2')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await search2.click();
      await CommonFunc.sleep(500);


        let strJson = inspector.getInspectorByKey('richEditorLabelInfo');
        let obj = JSON.parseJsonElement(strJson);
        console.log('editMenuOptions0004---obj.$attrs---' + JSON.stringifyJsonElement(obj.getElement('$attrs')));
        console.log('editMenuOptions0004---obj.$attrs.content---' + obj.getElement('$attrs').getString('content'));
        expect('' + obj.getElement('$attrs').getString('content')).assertEqual("abc123456");

      console.info("[editMenuOptions0004] end");
      done();
    });

    
    /**
     * @tc.number   editMenuOptions_static_0005
     * @tc.name     editMenuOptions_static_0005
     * @tc.desc     editMenuOptions_static_0005
     * @tc.level    Level.LEVEL0
     */
it('editMenuOptions_static_0005', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      let driver = Driver.create();
      console.info('editMenuOptions editMenuOptions0005 START');
      await CommonFunc.sleep(500);
      let search = await (driver.findComponent(ON.id('search')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await search.longClick();
      await CommonFunc.sleep(500);
      let button = await (driver.findComponent(ON.text('111111')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await button.click();
      console.log('editMenuOptions0005 button click succ');
      let search2 = await (driver.findComponent(ON.id('search2')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await search2.click();
      await CommonFunc.sleep(500);


        let strJson = inspector.getInspectorByKey('searchLabelInfo');
        let obj = JSON.parseJsonElement(strJson);
        console.log('editMenuOptions0005---obj.$attrs---' + JSON.stringifyJsonElement(obj.getElement('$attrs')));
        console.log('editMenuOptions0005---obj.$attrs.content---' + obj.getElement('$attrs').getString('content'));
        expect('' + obj.getElement('$attrs').getString('content')).assertEqual("");

      console.info("[editMenuOptions0005] end");
      done();
    });
  })
}
