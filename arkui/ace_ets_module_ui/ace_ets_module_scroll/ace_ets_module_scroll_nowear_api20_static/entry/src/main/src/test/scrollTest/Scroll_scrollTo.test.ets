/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  describe,
  beforeEach,
  it,
  expect,
  Level,
  beforeAll,
  beforeEach,
  Size,
  afterEach,
  TestType
} from '../../../../hypium/index';
import { Color } from '@ohos.arkui.component'
import router from '@ohos.router';
import CommonFunc from '../common/Common';
import Utils from '../common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

export default function Scroll_scrollTo() {
  describe('Scroll_scrollTo', () => {

    beforeAll(async () => {
      console.info('Scroll_scrollTo beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.scroll.nowear.api20.static', 'EntryAbility')
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info('Scroll_scrollTo beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/scroll/Scroll_scrollTo',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get Scroll_scrollTo state pages:' + JSON.stringify(pages));
        if (!('Scroll_scrollTo' == pages.name)) {
          console.info('get Scroll_scrollTo pages.name:' + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await Utils.sleep(2500);
        }
      } catch (err) {
        console.error('push Scroll_scrollTo page error:' + err);
      }
      console.info('Scroll_scrollTo beforeEach end');
    });

    /**
     * @tc.number   Scroll_scrollTo_static_001
     * @tc.name     Scroll_scrollTo_static_001
     * @tc.desc     Scroll_scrollTo_static_001
     * @tc.level    Level.LEVEL0
     */
    it('Scroll_scrollTo_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('Button1'));
      await (btn1?.click() as Promise<void>);
      console.log('[Scroll_scrollTo_static_001] 0')
      await Utils.sleep(2000);
      let itemTest = await driver.findComponent(ON.text('Item_1_3'));
      console.log('[Scroll_scrollTo_static_001] 1')
      expect(!!itemTest).assertTrue();
      done();
    });

    /**
     * @tc.number   Scroll_scrollTo_static_002
     * @tc.name     Scroll_scrollTo_static_002
     * @tc.desc     Scroll_scrollTo_static_002
     * @tc.level    Level.LEVEL0
     */
    it('Scroll_scrollTo_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('Button2'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(2000);
      let itemTest = await driver.findComponent(ON.text('Item_2_1'));
      console.log('[Scroll_scrollTo_static_002] 1')
      expect(!!itemTest).assertTrue();
      done();
    });
  })
}