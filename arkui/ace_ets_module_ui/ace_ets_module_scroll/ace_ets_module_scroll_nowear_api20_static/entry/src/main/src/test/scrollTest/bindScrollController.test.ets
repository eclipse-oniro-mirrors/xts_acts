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
import { describe, beforeEach, it, expect, Level, beforeAll, beforeEach, Size, afterEach, TestType } from '../../../../hypium/index';
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

export default function bindScrollController() {
  describe('bindScrollController', () => {

    beforeAll(async() => {
      console.info('bindScrollController beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.scroll.nowear.api20.static', 'EntryAbility')
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info('bindScrollController beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/scroll/bindScrollController',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get bindScrollController state pages:' + JSON.stringify(pages));
        if (!('bindScrollController' == pages.name)) {
          console.info('get bindScrollController pages.name:' + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          // let result = await routerInstance.replaceUrl(options);
          await Utils.sleep(2500);
          // console.info('push bindScrollController page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push bindScrollController page error:' + err);
      }
      console.info('bindScrollController beforeEach end');
    });




    /**
     * @tc.number   bindScrollController_static_001
     * @tc.name     bindScrollController_static_001
     * @tc.desc     bindScrollController_static_001
     * @tc.level    Level.LEVEL0
     */
    it('bindScrollController_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await Utils.sleep(1000);
      let contentSlot = await (driver.findComponent(ON.id('ContentSlot')) as Promise<Component>);
      let rectContentSlot = await contentSlot.getBounds();
      let left = rectContentSlot.left
      let top = rectContentSlot.top
      let right = rectContentSlot.right
      let bottom = rectContentSlot.bottom
      let width: Int = right - left;
      let height: Int = bottom -top;
      console.log(`bindScrollController_static_001  left : ${left} top : ${top} right : ${right} bottom : ${bottom}`)
      await driver.swipe(Math.round(left + width*0.5).toInt(),Math.round(bottom - height/4).toInt(),Math.round(left + width*0.5).toInt(),Math.round(bottom - height/2).toInt());
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('setOnDidScroll');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson4 = inspector.getInspectorByKey('setOnScrollFrameBegin');
      let obj4 = JSON.parseJsonElement(strJson4);
      let strJson5 = inspector.getInspectorByKey('setOnScrollStart');
      let obj5 = JSON.parseJsonElement(strJson5);
      let strJson6 = inspector.getInspectorByKey('setOnScrollStop');
      let obj6 = JSON.parseJsonElement(strJson6);
      let strJson7 = inspector.getInspectorByKey('setOnWillScroll');
      let obj7 = JSON.parseJsonElement(strJson7);


      await Utils.sleep(1000);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('ok');
      expect(obj4.getElement('$attrs').getString('content')).assertEqual('ok');
      expect(obj5.getElement('$attrs').getString('content')).assertEqual('ok');
      expect(obj6.getElement('$attrs').getString('content')).assertEqual('ok');
      expect(obj7.getElement('$attrs').getString('content')).assertEqual('ok');
      done();
    });

    /**
     * @tc.number   bindScrollController_static_002
     * @tc.name     bindScrollController_static_002
     * @tc.desc     bindScrollController_static_002
     * @tc.level    Level.LEVEL0
     */
    it('bindScrollController_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await Utils.sleep(1000);
      let endBtn = await (driver.findComponent(ON.id('end')) as Promise<Component>);
      let startBtn = await (driver.findComponent(ON.id('start')) as Promise<Component>);
      await endBtn.click()
      await Utils.sleep(1000);
      await startBtn.click()
      await Utils.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('setOnReachEnd');
      let obj2 = JSON.parseJsonElement(strJson2);
      let strJson3 = inspector.getInspectorByKey('setOnReachStart');
      let obj3 = JSON.parseJsonElement(strJson3);
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('ok');
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('0okok');
      done();
    });
  })
}