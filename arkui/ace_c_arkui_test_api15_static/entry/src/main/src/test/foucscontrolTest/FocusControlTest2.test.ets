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

import { expect, describe, it, afterEach, beforeEach, Level,beforeAll } from '../../../../hypium';
import { Driver, ON, PointerMatrix, Rect,Component } from '@ohos.UiTest';
import router from '@ohos.router';
import { UtilsTest } from '../Util.test'
import Utils from '../common/Utils';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';

export default function FocusControlTest2(){
  describe('FocusControlTest2',  () =>{
    beforeAll((): void => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api15.static", "EntryAbility")
    });
    beforeEach(async () =>{
      console.info("FocusControlTest2 beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/focuscontrol/focuscontrol2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FocusControlTest2  state pages: " + JSON.stringify(pages));
        if (!("focuscontrol2" == pages.name)) {
          console.info("get focuscontrol2 state pages.name: " + JSON.stringify(pages.name));
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push focuscontrol2 page error: " + err);
        expect().assertFail();
      }
    });

     afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info("FocusControlTest2 after each called");
    });

    
    /**
     * @tc.number   SUB_ARKUI_CAPI_FocusControlTest_TEST002
     * @tc.name     SUB_ARKUI_CAPI_FocusControlTest_TEST002
     * @tc.desc     SUB_ARKUI_CAPI_FocusControlTest_TEST002
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_CAPI_FocusControlTest_TEST002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      // click "transferKey2
      let button:Component | null = await driver.findComponent(ON.id('transferKey2')) ;
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
      // click button1
      let button1x:Component | null = await driver.findComponent(ON.id('button1xxx'));
      await (button1x?.click() as Promise<void>);
      await Utils.sleep(2500);
      let strJson = inspector.getInspectorByKey('button1xxx')
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00');;
      done();
    }) 


  })
}