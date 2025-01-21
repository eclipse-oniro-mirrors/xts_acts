/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../MainAbility/utils/Common';
import {MessageManager,Callback} from '../MainAbility/utils/MessageManager';


export default function TextPickerDialogJsunit() {
  describe('TextPickerDialogJsunit', function () {
    beforeEach(async function (done) {
      console.info("TextPickerDialogJsunit beforeEach start");
      let options = {
        uri: 'MainAbility/pages/TextPickerDialogOptions',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextPickerDialogJsunit state pages: " + JSON.stringify(pages));
        if (!("TextPickerDialogOptions" == pages.name)) {
          console.info("get TextPickerDialogJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push TextPickerDialogJsunit page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextPickerDialogJsunit page error: " + err);
        expect().assertFail();
      }
      done()
    });


    it('TextPickerDialogJsunit_0100', 0, async function (done) {
      console.info('TextPickerDialogJsunit_0100 START');
	    let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('TextPickerDialog'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('TextPickerDialog');
      let obj = JSON.parse(strJson);
      console.info("[TextPickerDialogJsunit_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual("TextPickerDialog");
      console.info('[TextPickerDialogJsunit_0100] END');
      done();
    });
  })
}
