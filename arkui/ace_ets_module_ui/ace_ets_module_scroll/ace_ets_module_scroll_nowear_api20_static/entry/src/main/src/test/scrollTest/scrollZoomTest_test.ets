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

import events_emitter from '@ohos.events.emitter';
import { Color, $r } from '@ohos.arkui.component'
import {
  describe,
  beforeEach,
  it,
  expect,
  Level,
  beforeAll,
  Size,
  TestType,
  afterEach
} from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../common/Common';

import { Driver, ON, MouseButton, Component, Rect } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { startAbility, UtilsTest } from '../Util.test.ets';

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function ScrollZoomTest() {
  describe('ScrollZoomTest', () => {
    const SLEEP_TIME_1000 = 1000;
    const SLEEP_TIME_2000 = 2000;
    beforeAll(async (): Promise<void> => {
      console.info('ScrollZoomTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.scroll.nowear.api20.static', 'EntryAbility')
    });
    beforeEach(async (): Promise<void> => {
      console.info('ScrollZoomTest beforeEach start');
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get ScrollZoomTest state pages:' + JSON.stringify(pages));
        if (!('scrollZoom' == pages.name)) {
          console.info('get  ScrollZoomTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.replaceUrl({
            url: 'MainAbility/pages/scroll/scrollZoom',
          });
          await CommonFunc.sleep(SLEEP_TIME_2000);
        }
      } catch (err) {
        console.error('push ScrollZoomTest page error:' + err);
      }
      console.info('ScrollZoomTest foreEach end');
    });

    /**
     * @tc.number   ScrollZoom_static_0100
     * @tc.name     ScrollZoom_static_0100
     * @tc.desc     ScrollZoom_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('ScrollZoom_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'ScrollZoom_static_0100';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create()
      let image = await driver.findComponent(ON.id('img_zoom'));
      if (image) {
        image.pinchIn(0.5);
      }
      await CommonFunc.sleep(SLEEP_TIME_2000);
      let strJson1 = inspector.getInspectorByKey('scroll_didZoom');
      let content1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')
      console.info('[ScrollZoom_static_0100] content1: ' + JSON.stringify(content1));
      expect(content1).assertEqual('onDidZoom: 1');
      let strJson2 = inspector.getInspectorByKey('scroll_Start');
      let content2 = JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')
      console.info('[ScrollZoom_static_0100] content2: ' + JSON.stringify(content2));
      expect(content2).assertEqual('onZoomStart');
      let strJson3 = inspector.getInspectorByKey('scroll_Stop');
      let content3 = JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content')
      console.info('[ScrollZoom_static_0100] content3: ' + JSON.stringify(content3));
      expect(content3).assertEqual('onZoomStop');
      console.info('[' + tagName + '] END============================');
      done();
    });
    /**
     * @tc.number   ScrollZoom_static_0200
     * @tc.name     ScrollZoom_static_0200
     * @tc.desc     ScrollZoom_static_0200
     * @tc.level    Level.LEVEL2
     */
    it('ScrollZoom_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'ScrollZoom_static_0200';
      console.info('[' + tagName + '] START============================');
      let strJson = inspector.getInspectorByKey('scroll_zoom');
      let zoomScale = JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('zoomScale')
      console.info('[ScrollZoom_static_0200] zoomScale: ' + JSON.stringify(zoomScale));
      expect(zoomScale).assertEqual(1);
      console.info('[' + tagName + '] END============================');
      done();
    });

  })
}
