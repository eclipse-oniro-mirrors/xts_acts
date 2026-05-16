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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../hypium/index';
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { UtilsTest } from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function RippleFieldsTest() {
  describe('RippleFieldsTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("RippleFieldsTest beforeAll start");
      
      await UtilsTest.startAbility("com.arkui.ace.animation20.static", "EntryAbility")
      
    });

    beforeEach(async () => {
      console.info('RippleFieldsTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RippleFieldsTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get RippleFieldsTest state pages:' + JSON.stringify(pages));
        if (!('RippleFieldsTest' == pages.name)) {
          console.info('get RippleFieldsTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push RippleFieldsTest page error:' + err);
      }
      console.info('RippleFieldsTest beforeEach end');
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('RippleFieldsTest after each called');
    });



    /**
     * @tc.number   RippleFieldsTest_static_001
     * @tc.name     RippleFieldsTest_static_001
     * @tc.desc     RippleFieldsTest_static_001
     * @tc.level    Level.LEVEL0
     */
    it("RippleFieldsTest_static_001", Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[RippleFieldsTest_static_001] START");
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let callbackJson = inspector.getInspectorByKey('particleId');

      console.info('InspectorLayoutCallback001 component obj is: ' + JSON.stringify(JSON.parseJsonElement(callbackJson)
        .getElement('$attrs')
        .getArray('rippleFields')));

      console.info("InspectorLayoutCallback001 component obj is: " +
      JSON.stringify(JSON.parseJsonElement(callbackJson)));
      expect(JSON.parseJsonElement(callbackJson)
        .getElement('$attrs')
        .getArray('rippleFields')[0]
        .getDouble('amplitude')).assertEqual(120)

      expect(JSON.parseJsonElement(callbackJson)
        .getElement('$attrs')
        .getArray('rippleFields')[0]
        .getDouble('wavelength')).assertEqual(500)

      expect(JSON.parseJsonElement(callbackJson)
        .getElement('$attrs')
        .getArray('rippleFields')[0]
        .getDouble('attenuation')).assertEqual(0)

      expect(JSON.parseJsonElement(callbackJson)
        .getElement('$attrs')
        .getArray('rippleFields')[0]
        .getDouble('waveSpeed')).assertEqual(220)

      expect(JSON.parseJsonElement(callbackJson)
        .getElement('$attrs')
        .getArray('rippleFields')[0]
        .getElement('center')
        .getString('x')).assertEqual("150.00vp")
      expect(JSON.parseJsonElement(callbackJson)
        .getElement('$attrs')
        .getArray('rippleFields')[0]
        .getElement('center')
        .getString('y')).assertEqual("150.00vp")
      expect(JSON.parseJsonElement(callbackJson)
        .getElement('$attrs')
        .getArray('rippleFields')[0]
        .getElement('region')
        .getString('shape')).assertEqual("RECT")
      expect(JSON.parseJsonElement(callbackJson)
        .getElement('$attrs')
        .getArray('rippleFields')[0]
        .getElement('region')
        .getElement('size')
        .getString('width')).assertEqual("300.00vp")
      expect(JSON.parseJsonElement(callbackJson)
        .getElement('$attrs')
        .getArray('rippleFields')[0]
        .getElement('region')
        .getElement('size')
        .getString('height')).assertEqual("300.00vp")
      expect(JSON.parseJsonElement(callbackJson)
        .getElement('$attrs')
        .getArray('rippleFields')[0]
        .getElement('region')
        .getElement('position')
        .getString('x')).assertEqual("150.00vp")
      expect(JSON.parseJsonElement(callbackJson)
        .getElement('$attrs')
        .getArray('rippleFields')[0]
        .getElement('region')
        .getElement('position')
        .getString('y')).assertEqual("150.00vp")


      console.info("[RippleFieldsTest_static_001] END");
      done();
    });
  })
}
