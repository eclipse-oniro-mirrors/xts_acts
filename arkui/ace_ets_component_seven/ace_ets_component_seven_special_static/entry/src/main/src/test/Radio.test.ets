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

export default function radioGroupJsunit() {
  describe('radioGroupTest', () => {
    beforeAll(() => {
        console.info("radioGroupTest beforeEach start");
        await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/radio',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get radio state success " + JSON.stringify(pages));
        if (!("radio" == pages.name)) {
          console.info("get radio state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push radio page error: " + err);
      }
    });

   
    
    
/**
     * @tc.number   testRadioGroup001_static_01
     * @tc.name     testRadioGroup001_static_01
     * @tc.desc     testRadioGroup001_static_01
     * @tc.level    Level.LEVEL0
     */
it('testRadioGroup001_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[testRadioGroup001_static_01] START");
      let strJson = inspector.getInspectorByKey('RadioOne');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testRadioGroup001_static_01] obj  is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle')).getString('checkedBackgroundColor')).assertEqual('#FF147258');
      expect(JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle')).getString('indicatorColor')).assertEqual('#FF123456');
      expect(JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle')).getString('uncheckedBorderColor')).assertEqual('#FF963852');

      console.info("[testRadioGroup001_static_01] END");
      done();
    });

   
    
    
/**
     * @tc.number   testRadioGroup002_static_02
     * @tc.name     testRadioGroup002_static_02
     * @tc.desc     testRadioGroup002_static_02
     * @tc.level    Level.LEVEL0
     */
it('testRadioGroup002_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[testRadioGroup002_static_02] START");
      let strJson = inspector.getInspectorByKey('RadioOne');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testRadioGroup002_static_02] obj  is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('checked')).assertEqual('true');
      console.info("[testRadioGroup002_static_02] END");
      done();
    });

  })
}
