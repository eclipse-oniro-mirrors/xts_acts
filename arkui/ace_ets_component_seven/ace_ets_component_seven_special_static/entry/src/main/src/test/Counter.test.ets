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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index'
import Utils from '../../ets/MainAbility/common/Utils';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'

export default function counterJsunit() {
  describe('ActsAceCounterTest', () => {
    beforeAll(() => {
      console.info("ActsAceCounterTest beforeEach start");
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });
    beforeAll(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/counter',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Counter state success " + JSON.stringify(pages));
        if (!("counter" == pages.name)) {
          console.info("get Counter state success " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);;
          await Utils.sleep(2000);
          // console.info("push Counter page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Counter page error: " + err);
      }
    });

   
    
    
/**
     * @tc.number   testCounter01_static_01
     * @tc.name     testCounter01_static_01
     * @tc.desc     testCounter01_static_01
     * @tc.level    Level.LEVEL0
     */
it('testCounter01_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testCounter01_static_01] START');
      let strJson = inspector.getInspectorByKey('Counter');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testCounter01_static_01] obj is : " + JSON.stringify(obj.getElement('$attrs')));
      expect(true).assertEqual(true);
      console.info('[testCounter01_static_01] END');
      done();
    });

    
    
    
/**
     * @tc.number   testCounter02_static_02
     * @tc.name     testCounter02_static_02
     * @tc.desc     testCounter02_static_02
     * @tc.level    Level.LEVEL0
     */
it('testCounter02_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testCounter02_static_02] START');
      let strJson = inspector.getInspectorByKey('Counter');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testCounter02_static_02] obj is : " + JSON.stringify(obj.getElement('$attrs')));
      expect(true).assertEqual(true);
      console.info('[testCounter02_static_02] END');
      done();
    });
  })
}
