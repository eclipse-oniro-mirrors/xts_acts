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
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import Utils  from "../../../ets/MainAbility/common/Utils";
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
function sleep(time: int):Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time * 1000);
  })
}
const waitUiReadyMs = 1000;

export default function  datePickerUIJsunit() {
  describe('datePickerUIJsunit', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("datePickerUIJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DatePicker/datePickerUI',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get datePickerUIJsunit state pages:" + JSON.stringify(pages));
        if (!("datePickerUI" == pages.name)) {
          console.info("get datePickerUIJsunit pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
          console.error("push datePickerUIJsunit page error:" + err);
	        expect().assertFail();
      }
    });


    
    
    /**
     * @tc.number   datePickerUIJsunit_static_0100
     * @tc.name     datePickerUIJsunit_static_0100
     * @tc.desc     datePickerUIJsunit_static_0100
     * @tc.level    Level.LEVEL1
     */
it('datePickerUIJsunit_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
       console.info('datePickerUIJsunit_0100 START');
       await CommonFunc.sleep(1000);
       // get the datePicker component and test attribute to confirm
       let strJson = inspector.getInspectorByKey('datePickerUI');
       let obj = JSON.parseJsonElement(strJson);
        console.info("obj is: " + JSON.stringify(obj));
       expect(obj.getElement('$attrs').getString('lunar')).assertEqual('false');
       done();
    });

   
    
    /**
     * @tc.number   datePickerUIJsunit_static_0200
     * @tc.name     datePickerUIJsunit_static_0200
     * @tc.desc     datePickerUIJsunit_static_0200
     * @tc.level    Level.LEVEL1
     */
it('datePickerUIJsunit_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('datePickerUIJsunit_0200 START');
      // modify the type attribute normal value of datePicker dynamically
      const messageManager = AppStorage.get<MessageManager>('messageManager') as MessageManager
      messageManager.notify({name:'isLunar',value:true})
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = inspector.getInspectorByKey('datePickerUI');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[datePickerUIJsunit_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('lunar')).assertEqual('true');
      messageManager.notify({name:'isLunar',value:false})
      await CommonFunc.sleep(2000);
       let strJson2 = inspector.getInspectorByKey('datePickerUI');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[datePickerUIJsunit_0200] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('lunar')).assertEqual('false');
      done();
    });

  })
}