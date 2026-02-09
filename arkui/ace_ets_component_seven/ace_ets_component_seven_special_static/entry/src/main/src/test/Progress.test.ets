'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import router from '@ohos.router'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index'
import Utils from '../../ets/MainAbility/common/Utils'
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'

export default function progressStyleJsunit() {
  describe('progressStyleTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("progressStyleTest beforeEach start");
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")

      let options: router.RouterOptions = {
        url: 'MainAbility/pages/progress',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get progress state success " + JSON.stringify(pages));
        if (!("progress" == pages.name)) {
          console.info("get progress state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push progress page error: " + err);
      }
    });

   
    
    
/**
     * @tc.number   testProgressStyle0001_static_01
     * @tc.name     testProgressStyle0001_static_01
     * @tc.desc     testProgressStyle0001_static_01
     * @tc.level    Level.LEVEL0
     */
it('testProgressStyle0001_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testProgressStyle0001_static_01 START');
      let strJson = inspector.getInspectorByKey('ProgressKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testProgressStyle0001_static_01] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('color')).assertEqual("#FF123456");

      console.info('testProgressStyle0001_static_01 END');
      done();
    });

   
    
    
/**
     * @tc.number   testProgressStyle0002_static_02
     * @tc.name     testProgressStyle0002_static_02
     * @tc.desc     testProgressStyle0002_static_02
     * @tc.level    Level.LEVEL0
     */
it('testProgressStyle0002_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testProgressStyle0002_static_02 START');
      let strJson = inspector.getInspectorByKey('ProgressKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testProgressStyle0002_static_02] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('value')).assertEqual("12.000000");

      console.info('testProgressStyle0002_static_02 END');
      done();
    });

   
    
    
/**
     * @tc.number   testProgressStyle0003_static_03
     * @tc.name     testProgressStyle0003_static_03
     * @tc.desc     testProgressStyle0003_static_03
     * @tc.level    Level.LEVEL0
     */
it('testProgressStyle0003_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testProgressStyle0003_static_03 START');
      let strJson = inspector.getInspectorByKey('ProgressKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testProgressStyle0003_static_03] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('style')).assertEqual('{"strokeWidth":"20.00vp","scaleCount":"30","scaleWidth":"20.00vp"}');
      console.info('testProgressStyle0003_static_03 END');
      done();
    });
  })
}
