'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { UtilsTest } from '../Util.test';

export default function getFrameNodeScroller() {

  describe('getFrameNodeScroller', () => {
    beforeAll(async (): Promise<void> => {
      console.info("getFrameNodeScroller beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.scroll.api24.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("getFrameNodeScroller beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/FrameNode/getFrameNodeScroller",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get getFrameNodeScroller state pages:" + JSON.stringify(pages));
        if (!("getFrameNodeScroller" == pages.name)) {
          console.info("get getFrameNodeScroller pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
        }
      } catch (err) {
        console.error("push getFrameNodeScroller page error:" + err);
      }
      console.info("getFrameNodeScroller beforeEach end");
    });

    /**
     * @tc.name   getFrameNodeScroller_static_0100
     * @tc.number SUB_ARKUI_SCROLLER_GETFRAMENODE_STATIC_TEST_0100
     * @tc.desc   Set getFrameNode for the scroller.getFrameNode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getFrameNodeScroller_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[getFrameNodeScroller_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('bind_grid_getFrameNode'));
      await (btn?.click() as Promise<void>);
      console.info("[getFrameNodeScroller_static_0100] Click getFrameNode.");
      await CommonFunc.sleep(1500);

      let strJson = inspector.getInspectorByKey('bind_gridNode_result');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info('[getFrameNodeScroller_static_0100] content: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("Bind success：Grid");
      console.info('[getFrameNodeScroller_static_0100] END');
      done();
    });

    /**
     * @tc.name   getFrameNodeScroller_static_0200
     * @tc.number SUB_ARKUI_SCROLLER_GETFRAMENODE_STATIC_TEST_0200
     * @tc.desc   Set getFrameNode for the scroller.getFrameNode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getFrameNodeScroller_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[getFrameNodeScroller_static_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('bind_grid_offy'));
      await (btn?.click() as Promise<void>);
      console.info("[getFrameNodeScroller_static_0200] Click 120 offset.");
      await CommonFunc.sleep(1500);
      let btn2 = await driver.findComponent(ON.id('bind_grid_offTop'));
      await (btn2?.click() as Promise<void>);
      console.info("[getFrameNodeScroller_static_0200] Click top offset.");
      await CommonFunc.sleep(1500);
      let btn3 = await driver.findComponent(ON.id('bind_grid_readOff'));
      await (btn3?.click() as Promise<void>);
      console.info("[getFrameNodeScroller_static_0200] Click read offset.");
      await CommonFunc.sleep(1500);

      let strJson = inspector.getInspectorByKey('bind_grid_offset_text');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info('[getFrameNodeScroller_static_0200] content: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("Grid default yOffset: 0");
      console.info('[getFrameNodeScroller_static_0200] END');
      done();
    });
  });
}