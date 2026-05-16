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

export default function scrollPropertiesTest() {

  describe('scrollPropertiesTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("scrollPropertiesTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.scroll.api24.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("scrollPropertiesTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/scroll/scrollPropertiesTest",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get scrollPropertiesTest state pages:" + JSON.stringify(pages));
        if (!("scrollPropertiesTest" == pages.name)) {
          console.info("get scrollPropertiesTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
        }
      } catch (err) {
        console.error("push scrollPropertiesTest page error:" + err);
      }
      console.info("scrollPropertiesTest beforeEach end");
    });

    /**
     * @tc.name   autoAdjustScrollBarMargin_static_0100
     * @tc.number SUB_ARKUI_SCROLL_AUTOADJUSTSCROLLBARMARGIN_STATIC_0100
     * @tc.desc   Test Scroll autoAdjustScrollBarMargin property with true value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('autoAdjustScrollBarMargin_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[autoAdjustScrollBarMargin_static_0100] START');

      let strJson = inspector.getInspectorByKey('scroll_autoAdjust_true');
      console.info("[autoAdjustScrollBarMargin_static_0100] autoAdjustScrollBarMargin: " +
        JSON.parseJsonElement(strJson).getElement('$attrs').getString('autoAdjustScrollBarMargin'));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('autoAdjustScrollBarMargin'))
        .assertEqual('true');
      console.info('[autoAdjustScrollBarMargin_static_0100] END');
      done();
    })

    /**
     * @tc.name   autoAdjustScrollBarMargin_static_0200
     * @tc.number SUB_ARKUI_SCROLL_AUTOADJUSTSCROLLBARMARGIN_STATIC_0200
     * @tc.desc   Test Scroll autoAdjustScrollBarMargin property with false value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('autoAdjustScrollBarMargin_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[autoAdjustScrollBarMargin_static_0200] START');

      let strJson = inspector.getInspectorByKey('scroll_autoAdjust_false');
      console.info("[autoAdjustScrollBarMargin_static_0200] autoAdjustScrollBarMargin: " +
        JSON.parseJsonElement(strJson).getElement('$attrs').getString('autoAdjustScrollBarMargin'));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('autoAdjustScrollBarMargin'))
        .assertEqual('false');
      console.info('[autoAdjustScrollBarMargin_static_0200] END');
      done();
    })

    /**
     * @tc.name   autoAdjustScrollBarMargin_static_0300
     * @tc.number SUB_ARKUI_SCROLL_AUTOADJUSTSCROLLBARMARGIN_STATIC_0300
     * @tc.desc   Test Scroll autoAdjustScrollBarMargin property with undefined value, should restore to default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('autoAdjustScrollBarMargin_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[autoAdjustScrollBarMargin_static_0300] START');

      let strJson = inspector.getInspectorByKey('scroll_autoAdjust_undefined');
      console.info("[autoAdjustScrollBarMargin_static_0300] autoAdjustScrollBarMargin: " +
        JSON.parseJsonElement(strJson).getElement('$attrs').getString('autoAdjustScrollBarMargin'));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('autoAdjustScrollBarMargin'))
        .assertEqual('false');
      console.info('[autoAdjustScrollBarMargin_static_0300] END');
      done();
    })

    /**
     * @tc.name   enableScrollWithMouse_static_0100
     * @tc.number SUB_ARKUI_SCROLL_ENABLESCROLLWITHMOUSE_STATIC_0100
     * @tc.desc   Test Scroll enableScrollWithMouse property with true value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('enableScrollWithMouse_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[enableScrollWithMouse_static_0100] START');

      let strJson = inspector.getInspectorByKey('scroll_enableMouse_true');
      console.info("[enableScrollWithMouse_static_0100] enableScrollWithMouse: " +
        JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('enableScrollWithMouse'));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('enableScrollWithMouse'))
        .assertEqual(true);
      console.info('[enableScrollWithMouse_static_0100] END');
      done();
    })

    /**
     * @tc.name   enableScrollWithMouse_static_0200
     * @tc.number SUB_ARKUI_SCROLL_ENABLESCROLLWITHMOUSE_STATIC_0200
     * @tc.desc   Test Scroll enableScrollWithMouse property with false value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('enableScrollWithMouse_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[enableScrollWithMouse_static_0200] START');

      let strJson = inspector.getInspectorByKey('scroll_enableMouse_false');
      console.info("[enableScrollWithMouse_static_0200] enableScrollWithMouse: " +
        JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('enableScrollWithMouse'));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('enableScrollWithMouse'))
        .assertEqual(false);
      console.info('[enableScrollWithMouse_static_0200] END');
      done();
    })

    /**
     * @tc.name   enableScrollWithMouse_static_0300
     * @tc.number SUB_ARKUI_SCROLL_ENABLESCROLLWITHMOUSE_STATIC_0300
     * @tc.desc   Test Scroll enableScrollWithMouse property with undefined value, should restore to default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('enableScrollWithMouse_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[enableScrollWithMouse_static_0300] START');

      let strJson = inspector.getInspectorByKey('scroll_enableMouse_undefined');
      console.info("[enableScrollWithMouse_static_0300] enableScrollWithMouse: " +
        JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('enableScrollWithMouse'));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('enableScrollWithMouse'))
        .assertEqual(false);
      console.info('[enableScrollWithMouse_static_0300] END');
      done();
    })
  })
}