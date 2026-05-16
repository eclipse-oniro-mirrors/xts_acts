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

export default function VelocityFieldsTest() {
  describe('VelocityFieldsTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("VelocityFieldsTest beforeAll start");
      
      await UtilsTest.startAbility("com.arkui.ace.animation20.static", "EntryAbility")
      
    });

    beforeEach(async () => {
      console.info('VelocityFieldsTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/VelocityFieldsTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get VelocityFieldsTest state pages:' + JSON.stringify(pages));
        if (!('VelocityFieldsTest' == pages.name)) {
          console.info('get VelocityFieldsTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push VelocityFieldsTest page error:' + err);
      }
      console.info('VelocityFieldsTest beforeEach end');
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('VelocityFieldsTest after each called');
    });



    /**
     * @tc.number   VelocityFieldsTest_static_001
     * @tc.name     VelocityFieldsTest_static_001
     * @tc.desc     VelocityFieldsTest_static_001
     * @tc.level    Level.LEVEL0
     */
    it("VelocityFieldsTest_static_001", Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[VelocityFieldsTest_static_001] START");
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let callbackJson = inspector.getInspectorByKey('particleId2');

      console.info('InspectorLayoutCallback001 component obj is: ' + JSON.stringify(JSON.parseJsonElement(callbackJson)
        .getElement('$attrs')
        .getArray('velocityFields')));

      console.info("InspectorLayoutCallback001 component obj is: " +
      JSON.stringify(JSON.parseJsonElement(callbackJson)));

      expect(JSON.parseJsonElement(callbackJson)
        .getElement('$attrs')
        .getArray('velocityFields')[0]
        .getElement('region')
        .getString('shape')).assertEqual("RECT")
      expect(JSON.parseJsonElement(callbackJson)
        .getElement('$attrs')
        .getArray('velocityFields')[0]
        .getElement('region')
        .getElement('size')
        .getString('width')).assertEqual("200.00vp")
      expect(JSON.parseJsonElement(callbackJson)
        .getElement('$attrs')
        .getArray('velocityFields')[0]
        .getElement('region')
        .getElement('size')
        .getString('height')).assertEqual("200.00vp")
      expect(JSON.parseJsonElement(callbackJson)
        .getElement('$attrs')
        .getArray('velocityFields')[0]
        .getElement('region')
        .getElement('position')
        .getString('x')).assertEqual("150.00vp")
      expect(JSON.parseJsonElement(callbackJson)
        .getElement('$attrs')
        .getArray('velocityFields')[0]
        .getElement('region')
        .getElement('position')
        .getString('y')).assertEqual("150.00vp")


      console.info("[VelocityFieldsTest_static_001] END");
      done();
    });
  })
}
