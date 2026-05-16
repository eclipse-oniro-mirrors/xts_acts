'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import { Component, Driver, ON, UiWindow } from '@ohos.UiTest';
import CommonFunc from '../common/Common';
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

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function bindScrollControllerTest() {
  describe('bindScrollControllerTest', (): void => {

    beforeAll(async (): Promise<void> => {
      console.info('SearchTypeTest beforeEach start');
      await UtilsTest.startAbility('com.arkui.ace.scroll.nowear.api20.static', 'EntryAbility');

    });

    beforeEach(async (): Promise<void> => {
      console.info('BindScrollControllerTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/bindScrollController',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get BindScrollControllerTest state pages:' + JSON.stringify(pages));
        if (!('bindScrollControllerTest' == pages.name)) {
          console.info('get BindScrollControllerTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push BindScrollControllerTest page error:' + err);
      }
      console.info('BindScrollControllerTest beforeEach end');
    });


    /**
     * @tc.number   bindScrollControllerTest_static_0100
     * @tc.name     bindScrollControllerTest_static_0100
     * @tc.desc     bindScrollControllerTest_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('bindScrollControllerTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[bindScrollControllerTest_static_0100] START');
      let driver = Driver.create()
      let bindScrollController: Component = await driver.findComponent(ON.id('bindController')) as Component;
      await (bindScrollController?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let setOn: Component = await driver.findComponent(ON.id('setOn')) as Component;
      await (setOn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let scrollerBy: Component = await driver.findComponent(ON.id('scrollerBy')) as Component;
      await (scrollerBy?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('scrollOffset');
      let content = JSON.parseJsonElement(strJson).getElement('$attrs').getString('content');
      await CommonFunc.sleep(1000);
      console.info('[bindScrollControllerTest_static_0100] content: ' + content);
      expect(parseInt(content) > 0)
        .assertEqual(true);
      console.info('[bindScrollControllerTest_static_0100] END');
      done();
    });


    /**
     * @tc.number   bindScrollControllerTest_static_0200
     * @tc.name     bindScrollControllerTest_static_0200
     * @tc.desc     bindScrollControllerTest_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('bindScrollControllerTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[bindScrollControllerTest_static_0200] START');
      let strJson = inspector.getInspectorByKey('ScrollAttribute');
      console.info('[bindScrollControllerTest_static_0200] content: ' +
      JSON.parseJsonElement(strJson).getElement('$attrs'));
      expect(!!JSON.parseJsonElement(strJson).getElement('$attrs'))
        .assertEqual(true);
      console.info('[bindScrollControllerTest_static_0200] END');
      done();
    });
  })
}
