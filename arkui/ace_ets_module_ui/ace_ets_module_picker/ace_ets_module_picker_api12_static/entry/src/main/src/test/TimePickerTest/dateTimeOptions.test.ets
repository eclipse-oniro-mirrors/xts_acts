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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import router from '@ohos.router'
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function dateTimeOptions() {
  describe('dateTimeOptions', () => {

    beforeAll(() => {
      console.info("dateTimeOptions beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.api12.static", "EntryAbility")

      console.info("dateTimeOptions beforeAll end");
    });

    beforeEach(async () => {
      console.info("dateTimeOptions beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TimePicker/dateTimeOptions',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get dateTimeOptions state pages: " + JSON.stringify(pages));
        if (!("dateTimeOptions" == pages.name)) {
          console.info("get dateTimeOptions state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push dateTimeOptions success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push dateTimeOptions page error: " + err);
        expect().assertFail();
      }
    });
    
    /**
     * @tc.number   dateTimeOptions_static_0100
     * @tc.name     dateTimeOptions_static_0100
     * @tc.desc     dateTimeOptions_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('dateTimeOptions_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> =>  {
      console.info('dateTimeOptions_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('dateTimeOptionsXTS')) as Component;
      await button!.click();
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('dateTimeOptionsValue');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[dateTimeOptions_static_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[dateTimeOptions_static_0100] content: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('{"hour":"numeric","minute":"2-digit","second":"numeric"}');
      console.info('[dateTimeOptions_static_0100] END');
      done();
    });

  })
}

