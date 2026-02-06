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

export default function setListEvent() {
  describe('setListEvent', () => {
    beforeAll(() => {
      console.info("setListEvent beforeEach start");

      
      await UtilsTest.startAbility("com.arkui.ace.scroll18.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("setListEvent beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/setListEvent",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get setListEvent state pages:" + JSON.stringify(pages));
        if (!("setListEvent" == pages.name)) {
          console.info("get setListEvent pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push setListEvent page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push setListEvent page error:" + err);
      }
      console.info("setListEvent beforeEach end");
    });

    
    
/**
     * @tc.number   setListEvent_static_0100
     * @tc.name     setListEvent_static_0100
     * @tc.desc     setListEvent_static_0100
     * @tc.level    Level.LEVEL0
     */
it('setListEvent_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[setListEvent_static_0100] START');
      let driver = Driver.create()
      let btnEvent: Component = await driver.findComponent(ON.id('List_addCommonEvent_02')) as Component;
      await btnEvent.click();
      await CommonFunc.sleep(1500);

      let swipeScroll = CommonFunc.getComponentRectOnScreen('key_listItem_set');
      let top = swipeScroll.top;
      let right = swipeScroll.right;
      let left = swipeScroll.left;
      let bottom = swipeScroll.bottom;
      console.info("setListEvent_static_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      await driver.swipe((Math.round(left + width / 2)).toInt(), (Math.round(top + height * 0.8)).toInt(),
        (Math.round(left + width / 2)).toInt(),
        (Math.round(top + height * 0.2)).toInt());
      await CommonFunc.sleep(2000);
      let btn: Component = await driver.findComponent(ON.id('List_setOnReach_02')) as Component;
      await btn.click();
      await CommonFunc.sleep(1500);

      let btn1: Component = await driver.findComponent(ON.id('List_setOnWill_02')) as Component;
      await btn1.click();
      await CommonFunc.sleep(1500);
      let strJson1 = inspector.getInspectorByKey('List_setOnWill_02');
      console.info("[setListEvent_static_0100] content1: " +
     JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
        .assertEqual('setOnWillScroll_setOnDidScroll');

      let btn2: Component = await driver.findComponent(ON.id('List_setOnScroll_02')) as Component;
      await btn2.click();
      await CommonFunc.sleep(1500);
      let strJson2 = inspector.getInspectorByKey('List_setOnScroll_02');
      console.info("[setListEvent_static_0100] content2: " +
      JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
        .assertEqual('setOnScrollStart_setOnScrollStop');

      let btn3: Component = await driver.findComponent(ON.id('List_setOnScrollIndex_02')) as Component;
      await btn3.click();
      await CommonFunc.sleep(1500);
      let strJson3 = inspector.getInspectorByKey('List_setOnScrollIndex_02');
      console.info("[setListEvent_static_0100] content3: " +
      JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
        .assertEqual('setOnScrollFrameBegin_setOnScrollIndex');

      let btn4: Component = await driver.findComponent(ON.id('Scroll_VisibleChange_02')) as Component;
      await btn4.click();
      await CommonFunc.sleep(1500);
      let strJson4 = inspector.getInspectorByKey('Scroll_VisibleChange_02');
      console.info("[setListEvent_static_0100] content4: " +
      JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
        .assertEqual('setOnScrollVisibleContentChange');
      console.info('[setListEvent_static_0100] END');
      done();
    });
  })
}
