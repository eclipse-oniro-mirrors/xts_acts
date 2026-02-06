'use static';
/*
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index';
import { UtilsTest, startAbility } from './Util.test.ets';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function CheckboxTest() {
  describe('CheckboxTest', () => {
    beforeAll(() => {
      console.info("CheckboxTest beforeEach start");
      await UtilsTest.msSleep(4000);
      await startAbility("com.example.Checkbox.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'testAbility/pages/Index',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Index state success " + JSON.stringify(pages));
        if (!("Index" == pages.name)) {
          console.info("get Index state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push Index page error: " + err);
      }
    });

    

    /**
     * @tc.number   ArkUX_CheckBox_Visual_static_0110
     * @tc.name     ArkUX_CheckBox_Visual_static_0110
     * @tc.desc     ArkUX_CheckBox_Visual_static_0110
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_CheckBox_Visual_static_0110', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_CheckBox_Visual_static_0110 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_CheckBox_Visual_0110');
          console.info('ArkUX_CheckBox_Visual_static_0110 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_CheckBox_Visual_static_0110 obj is: " + JSON.stringify(obj));
          let shape = obj.getElement('$attrs').getString('shape');
          expect(shape).assertEqual("0");
          console.info('ArkUX_CheckBox_Visual_static_0110 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_CheckBox_Visual_static_0110 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });

    

    /**
     * @tc.number   ArkUX_CheckBox_Visual_static_0120
     * @tc.name     ArkUX_CheckBox_Visual_static_0120
     * @tc.desc     ArkUX_CheckBox_Visual_static_0120
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_CheckBox_Visual_static_0120', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_CheckBox_Visual_static_0120 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_CheckBox_Visual_0120');
          console.info('ArkUX_CheckBox_Visual_static_0120 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_CheckBox_Visual_static_0120 obj is: " + JSON.stringify(obj));
          let shape = obj.getElement('$attrs').getString('shape');
          expect(shape).assertEqual("1");
          console.info('ArkUX_CheckBox_Visual_static_0120 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_CheckBox_Visual_static_0120 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });

    

    /**
     * @tc.number   ArkUX_CheckBox_Visual_static_0130
     * @tc.name     ArkUX_CheckBox_Visual_static_0130
     * @tc.desc     ArkUX_CheckBox_Visual_static_0130
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_CheckBox_Visual_static_0130', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_CheckBox_Visual_static_0130 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_CheckBox_Visual_0130');
          console.info('ArkUX_CheckBox_Visual_static_0130 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_CheckBox_Visual_static_0130 obj is: " + JSON.stringify(obj));
          let shape = obj.getElement('$attrs').getString('shape');
          expect(shape).assertEqual("0");
          console.info('ArkUX_CheckBox_Visual_static_0130 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_CheckBox_Visual_static_0130 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });

  })
}