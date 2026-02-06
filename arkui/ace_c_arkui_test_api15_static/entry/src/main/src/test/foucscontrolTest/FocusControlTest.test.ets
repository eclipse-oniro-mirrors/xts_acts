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

import { expect, describe, it, afterEach,beforeAll, beforeEach, Level } from '../../../../hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import router from '@ohos.router';
import { UtilsTest } from '../Util.test'
import Utils from '../common/Utils';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';

export default function FocusControlTest() {
  describe('FocusControlTest', () => {
    beforeAll((): void => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api15.static", "EntryAbility")
    });
    beforeEach(async () => {
      console.info("FocusControlTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/focuscontrol/focuscontrol',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FocusControlTest  state pages: " + JSON.stringify(pages));
        if (!("focuscontrol" == pages.name)) {
          console.info("get focuscontrol state pages.name: " + JSON.stringify(pages.name));
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push focuscontrol page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info("FocusControlTest after each called");
    });

    
    /**
     * @tc.number   SUB_ARKUI_CAPI_FocusControlTest_TEST001
     * @tc.name     SUB_ARKUI_CAPI_FocusControlTest_TEST001
     * @tc.desc     SUB_ARKUI_CAPI_FocusControlTest_TEST001
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_CAPI_FocusControlTest_TEST001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('button2')
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FF00FF00');
      ;
      done();
    });


  })
}