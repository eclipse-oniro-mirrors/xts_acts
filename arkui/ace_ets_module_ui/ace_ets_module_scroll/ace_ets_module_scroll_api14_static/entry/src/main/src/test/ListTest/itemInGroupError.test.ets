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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, ON, UiWindow } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import events_emitter from '@ohos.events.emitter';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { startAbility, UtilsTest } from '../Util.test'

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function itemInGroupError() {
  describe('itemInGroupError', () => {

    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.scroll14.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("itemInGroupError beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/itemInGroupError",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get itemInGroupError state pages:" + JSON.stringify(pages));
        if (!("itemInGroupError" == pages.name)) {
          console.info("get itemInGroupError pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err: Error) {
        console.error("push itemInGroupError page error:" + err);
      }
      console.info("itemInGroupError beforeEach end");
    });


    
    /**
     * @tc.number   itemInGroupError_static_0100
     * @tc.name     itemInGroupError_static_0100
     * @tc.desc     itemInGroupError_static_0100
     * @tc.level    Level.LEVEL0
     */
//it('itemInGroupError_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
    //  // 异常参数
    //   console.info('[itemInGroupError_static_0100] START');
    //   let driver = Driver.create()
    //   let btn1: Component = await driver.findComponent(ON.id('getItemRectInGroup_401')) as Component;
    //   await btn1.click();
    //   await CommonFunc.sleep(1500);
    //   let strJson = inspector.getInspectorByKey('getItemRectInGroup_err_text');
    //   console.info("[itemInGroupError_static_0100] component obj1 is: " +
    //   JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
    //   console.info("[itemInGroupError_static_0100] content: " +
    //   JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
    //     .assertEqual('getItemRectInGroup: 401');
    //   console.info('[itemInGroupError_static_0100] END');
    //   done();
    // });


    
    /**
     * @tc.number   itemInGroupError_static_0200
     * @tc.name     itemInGroupError_static_0200
     * @tc.desc     itemInGroupError_static_0200
     * @tc.level    Level.LEVEL0
     */
it('itemInGroupError_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[itemInGroupError_static_0200] START');
      let driver = Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('getItemRectInGroup_100004')) as Component;
      await btn1.click();
      await CommonFunc.sleep(1500);
      let strJson = inspector.getInspectorByKey('getItemRectInGroup_err_text');
      console.info("[itemInGroupError_static_0200] component obj1 is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      console.info("[itemInGroupError_static_0200] content: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('getItemRectInGroup: 100004');
      console.info('[itemInGroupError_static_0200] END');
      done();
    });


    
    /**
     * @tc.number   itemInGroupError_static_0300
     * @tc.name     itemInGroupError_static_0300
     * @tc.desc     itemInGroupError_static_0300
     * @tc.level    Level.LEVEL0
     */
//it('itemInGroupError_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
    //   // 异常参数
    //   console.info('[itemInGroupError_static_0300] START');
    //   let driver = Driver.create()
    //   let btn1: Component = await driver.findComponent(ON.id('scrollToItemInGroup_401')) as Component;
    //   await btn1.click();
    //   await CommonFunc.sleep(1500);
    //   let strJson = inspector.getInspectorByKey('scrollToItemInGroup_err_text');
    //   console.info("[itemInGroupError_static_0300] component obj1 is: " +
    //   JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
    //   console.info("[itemInGroupError_static_0300] content: " +
    //   JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
    //     .assertEqual('scrollToItemInGroup: 401');
    //   console.info('[itemInGroupError_static_0300] END');
    //   done();
    // });


    
    /**
     * @tc.number   itemInGroupError_static_0400
     * @tc.name     itemInGroupError_static_0400
     * @tc.desc     itemInGroupError_static_0400
     * @tc.level    Level.LEVEL0
     */
it('itemInGroupError_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[itemInGroupError_static_0400] START');
      let driver = Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('scrollToItemInGroup_100004')) as Component;
      await btn1.click();
      await CommonFunc.sleep(1500);
      let strJson = inspector.getInspectorByKey('scrollToItemInGroup_err_text');
      console.info("[itemInGroupError_static_0400] component obj1 is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      console.info("[itemInGroupError_static_0400] content: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('scrollToItemInGroup: 100004');
      console.info('[itemInGroupError_static_0400] END');
      done();
    });
  })
}
