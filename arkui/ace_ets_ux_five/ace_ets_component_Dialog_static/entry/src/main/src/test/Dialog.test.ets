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
import { beforeEach, describe, expect, it, Level, beforeAll } from '../../../hypium/index';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'

export default function DialogTest() {
  describe('DialogTest', () => {
    beforeAll(() => {
      console.info("DialogTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.example.Dialog.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/index/Index',
      };
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
     * @tc.number   ArkUX_Dialog_Visual_static_0060
     * @tc.name     ArkUX_Dialog_Visual_static_0060
     * @tc.desc     ArkUX_Dialog_Visual_static_0060
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Dialog_Visual_static_0060', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Dialog_Visual_0060 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Dialog_Visual_0060');
          console.info('ArkUX_Dialog_Visual_static_0060 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Dialog_Visual_static_0060 obj is: " + JSON.stringify(obj));
          let fontSize = obj.getElement('$attrs').getString('fontSize');
          expect(fontSize).assertEqual("20.00fp");
          console.info('ArkUX_Dialog_Visual_static_0060 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Dialog_Visual_static_0060 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
  })
}