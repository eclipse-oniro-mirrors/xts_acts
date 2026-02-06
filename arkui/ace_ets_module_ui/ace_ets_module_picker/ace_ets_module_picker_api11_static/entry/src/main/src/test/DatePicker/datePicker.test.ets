'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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
import Utils  from "../../../ets/MainAbility/common/Utils";
import Utils from '../../../ets/MainAbility/common/Utils'
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

export default function datePickerLunarJsunit() {
  describe('datePickerLunarTest', () =>{

    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/DatePicker/datePickerNew',
      }

      try {
        const router = AppStorage.get<Router>("router") as Router
        let pages:router.RouterState = router.getState();
        console.info("[datepicker] current page is: " + JSON.stringify(pages.name));
        if (!('datePicker' == pages.name)) {
          router.pushUrl(options);
        }
      } catch (err) {
        console.info("push datepicker page page error " + JSON.stringify(err));
      }
      await sleep(2);
    });

    afterEach(async (): Promise<void> => {
      console.info('[datepicker] after each called');
      const router = AppStorage.get<Router>("router") as Router
      router.clear();
      await sleep(1)
    });



    
    
    /**
     * @tc.number   testdatePickerLunar001_static
     * @tc.name     testdatePickerLunar001_static
     * @tc.desc     testdatePickerLunar001_static
     * @tc.level    Level.LEVEL1
     */
it('testdatePickerLunar001_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('datePickerLunar testdatePickerLunar001 START');
      await Utils.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('DatePicker');
      console.info("[testdatePickerLunar001] component lunar strJson:" + strJson);
      expect(JSON.parseJsonElement(strJson).getElement('$type')).assertEqual('DatePicker');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('lunar')).assertEqual("true");
      console.info("[testdatePickerLunar001] lunar value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('lunar'));
      done();
    });
  })
}
