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
import { Router, UIContext } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import { Component, Driver, ON, UiWindow } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { AppStorage } from '@ohos.arkui.stateManagement'
import {
  Button,
  ButtonAttribute,
  ClickEvent,
  Column,
  Entry,
  Image,
  ImageFit,
  Scroller,
  Text,
  TextAttribute,
} from '@ohos.arkui.component'
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { startAbility, UtilsTest } from '../Util.test.ets';

export default function stackFromEndList() {

  describe('stackFromEndList', () => {
    beforeAll(() => {
      console.info("stackFromEndList beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.scroll18.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("stackFromEndList beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/stackFromEndList",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear()
        let pages = router.getState();
        console.info("get   state pages:" + JSON.stringify(pages));
        if (!("stackFromEndList" == pages.name)) {
          console.info("get stackFromEndList pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
        }
      } catch (err) {
        console.error("push stackFromEndList page error:" + err);
      }
      console.info("stackFromEndList beforeEach end");
    });
    
    
/**
     * @tc.number   stackFromEndList_static_0100
     * @tc.name     stackFromEndList_static_0100
     * @tc.desc     stackFromEndList_static_0100
     * @tc.level    Level.LEVEL0
     */
it('stackFromEndList_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[stackFromEndList_static_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('list_stackFromEnd');
      console.info("[stackFromEndList_static_0100] component obj1 is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('List');

      let list1 = CommonFunc.getComponentRectOnScreen('list_stackFromEnd');
      console.info('[stackFromEndList_static_0100] list1.top: ' + list1.top);
      let listItem1 = CommonFunc.getComponentRectOnScreen('stackFromEnd_1');
      console.info('[stackFromEndList_static_0100] listItem1.top: ' + listItem1.top);
      await CommonFunc.sleep(1000);
      const uiContext = AppStorage.get<UIContext>('uiContext')!;
      console.info(`[stackFromEndList_static_0100] listItem1.top - vp2px(2) - list1.top=
      ${(listItem1.top - uiContext.vp2px(2) - list1.top)}`);
      expect(Math.abs(Math.floor(listItem1.top - uiContext.vp2px(2) - list1.top)) <= 1).assertTrue();
      console.info('[stackFromEndList_static_0100] END');
      done();
    });

    
    
/**
     * @tc.number   stackFromEndList_static_0200
     * @tc.name     stackFromEndList_static_0200
     * @tc.desc     stackFromEndList_static_0200
     * @tc.level    Level.LEVEL0
     */
it('stackFromEndList_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[stackFromEndList_static_0200] START');
      let driver = Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('list_stackFromEnd_true')) as Component;
      await btn1.click();
      await CommonFunc.sleep(1500);
      let strJson = inspector.getInspectorByKey('list_stackFromEnd');
      console.info("[stackFromEndList_static_0200] component obj1 is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('List');

      let list1 = CommonFunc.getComponentRectOnScreen('list_stackFromEnd');
      console.info('[stackFromEndList_static_0200] list1.bottom: ' + list1.bottom);
      let listItem5 = CommonFunc.getComponentRectOnScreen('stackFromEnd_5');
      console.info('[stackFromEndList_static_0200] listItem5.bottom: ' + listItem5.bottom);
      await CommonFunc.sleep(1000);
      const uiContext = AppStorage.get<UIContext>('uiContext')!;
      console.info(`[stackFromEndList_static_0200] list1.bottom - vp2px(2) - listItem5.bottom=
      ${(list1.bottom - uiContext.vp2px(2) - listItem5.bottom)}`);
      expect(Math.abs(Math.floor(list1.bottom - uiContext.vp2px(2) - listItem5.bottom)) <= 1).assertTrue();
      console.info('[stackFromEndList_static_0200] END');
      done();
    });
  })
}