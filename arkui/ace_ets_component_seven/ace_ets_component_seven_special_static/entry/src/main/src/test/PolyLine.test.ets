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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index'
import Utils from '../../ets/MainAbility/common/Utils';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'

export default function polyLineJsunit() {
  describe('ActsAcepolyLineTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("ActsAcepolyLineTest beforeEach start");
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")

      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/polyLine',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get polyLine state success " + JSON.stringify(pages));
        if (!("polyLine" == pages.name)) {
          console.info("get polyLine state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push polyLine page error: " + err);
      }
    });

    
    
/**
     * @tc.number   testpolyLine_static_01
     * @tc.name     testpolyLine_static_01
     * @tc.desc     testpolyLine_static_01
     * @tc.level    Level.LEVEL0
     */
it('testpolyLine_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testpolyLine] START');
      let strJson = inspector.getInspectorByKey('polyLine');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testpolyLine] obj is : " + JSON.stringify(obj!.getElement('$attrs')));

      //原生数据
      let strJson1 = inspector.getInspectorByKey('polyLine1');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[testpolyLine] obj is : " + JSON.stringify(obj1!.getElement('$attrs')));

      //与原生做对比
      console.info("[testpolyLine] obj points is : " + JSON.stringifyJsonElement(obj!.getElement('$attrs').getElement('points')));
      console.info("[testpolyLine] obj1 points is : " + JSON.stringifyJsonElement(obj1!.getElement('$attrs').getElement('points')));
      expect(obj!.getElement('$attrs').getBoolean('points')).assertEqual(obj1!.getElement('$attrs').getBoolean('points'));

      console.info('[testpolyLine] END');
      done();
    });
  })
}
