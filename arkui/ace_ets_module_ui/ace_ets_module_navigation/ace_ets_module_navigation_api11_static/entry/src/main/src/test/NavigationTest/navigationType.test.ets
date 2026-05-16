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

import { describe, beforeEach, beforeAll, afterEach, it, expect, Level} from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, Component, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager,Callback  } from '../../../ets/MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector'
import common from '@ohos.app.ability.common';
import { UtilsTest, startAbility } from '../Util.test';
import {SharedTransitionEffectType,Color} from '@ohos.arkui.component';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
export default function navigationTypeTest() {
  describe('navigationTypeTest', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.navigation.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/navigationType',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get navigationType state success " + JSON.stringify(pages));
        if (!("navigationType" == pages.name)) {
          console.info("get navigationType state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          console.info("push navigationType page success ");
        }
      } catch (err) {
        console.error("push navigationType page error: " + err);
      }
    });

    
/**
     * @tc.number   ArkUX_Navigation_static_1600
     * @tc.name     ArkUX_Navigation_static_1600
     * @tc.desc     ArkUX_Navigation_static_1600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Navigation_static_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Navigation_static_1600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Navigation_1600');
          console.info('ArkUX_Navigation_static_1600 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Navigation_static_1600 JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('mode')).assertEqual("NavigationMode.AUTO");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('minContentWidth')).assertEqual("50.00vp");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('navBarWidth')).assertEqual("100.00vp");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('navBarWidthRange')).assertEqual("50.00vp, 300.00vp");
          console.info('ArkUX_Navigation_static_1600 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Navigation_static_1600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    })

    
/**
     * @tc.number   ArkUX_Navigation_static_1700
     * @tc.name     ArkUX_Navigation_static_1700
     * @tc.desc     ArkUX_Navigation_static_1700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Navigation_static_1700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Navigation_static_1700 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Navigation_1700');
          console.info('ArkUX_Navigation_static_1700 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Navigation_static_1700 JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('mode')).assertEqual("NavigationMode.STACK");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('minContentWidth')).assertEqual("20000.00vp");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('navBarWidth')).assertEqual("15000.00vp");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('navBarWidthRange')).assertEqual("10000.00vp, 30000.00vp");
          console.info('ArkUX_Navigation_static_1700 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Navigation_static_1700 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    })

    
/**
     * @tc.number   ArkUX_Navigation_static_1800
     * @tc.name     ArkUX_Navigation_static_1800
     * @tc.desc     ArkUX_Navigation_static_1800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Navigation_static_1800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Navigation_static_1800 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Navigation_1800');
          console.info('ArkUX_Navigation_static_1800 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Navigation_static_1800 JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('mode')).assertEqual("NavigationMode.SPLIT");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('minContentWidth')).assertEqual("30.00vp");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('navBarWidth')).assertEqual("100.00vp");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('navBarWidthRange')).assertEqual("10.00vp, 20.00vp");
          console.info('ArkUX_Navigation_static_1800 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Navigation_static_1800 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
/**
     * @tc.number   ArkUX_Navigation_static_1900
     * @tc.name     ArkUX_Navigation_static_1900
     * @tc.desc     ArkUX_Navigation_static_1900
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Navigation_static_1900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Navigation_static_1900 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Navigation_1900');
          console.info('ArkUX_Navigation_static_1900 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Navigation_static_1900 JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('mode')).assertEqual("NavigationMode.AUTO");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('minContentWidth')).assertEqual("360.00vp");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('navBarWidth')).assertEqual("100.00vp");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('navBarWidthRange')).assertEqual("240.00vp, 432.00vp");
          console.info('ArkUX_Navigation_static_1900 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Navigation_static_1900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
/**
     * @tc.number   ArkUX_Navigation_static_2000
     * @tc.name     ArkUX_Navigation_static_2000
     * @tc.desc     ArkUX_Navigation_static_2000
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Navigation_static_2000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Navigation_static_2000 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Navigation_2000');
          console.info('ArkUX_Navigation_static_2000 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Navigation_static_2000 JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('mode')).assertEqual("NavigationMode.SPLIT");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('minContentWidth')).assertEqual("100.00vp");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('navBarWidth')).assertEqual("100.00vp");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('navBarWidthRange')).assertEqual("100.00vp, 100.00vp");
          console.info('ArkUX_Navigation_static_2000 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Navigation_static_2000 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
/**
     * @tc.number   ArkUX_Navigation_static_2100
     * @tc.name     ArkUX_Navigation_static_2100
     * @tc.desc     ArkUX_Navigation_static_2100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Navigation_static_2100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Navigation_static_2100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Navigation_2100');
          console.info('ArkUX_Navigation_static_2100 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Navigation_static_2100 JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('mode')).assertEqual("NavigationMode.SPLIT");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('minContentWidth')).assertEqual("40.00%");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('navBarWidth')).assertEqual("30.00%");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('navBarWidthRange')).assertEqual("20.00%, 50.00%");
          console.info('ArkUX_Navigation_static_2100 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Navigation_static_2100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
  });
};