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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';


export default function AlertDialogJsunit() {
  describe('AlertDialogJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("AlertDialogJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AlertDialog/AlertDialogParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlertDialogJsunit state pages: " + JSON.stringify(pages));
        if (!("AlertDialogParam" == pages.name)) {
          console.info("get AlertDialogJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push AlertDialogJsunit page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlertDialogJsunit page error: " + err);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.number    AlertDialogJsunit_0100
     * @tc.name      AlertDialogJsunit_0100
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */

    it('AlertDialogJsunit_0100', Level.LEVEL2, async (done: Function) => {
      console.info('AlertDialogJsunit_0100 START');
	    let driver = await Driver.create()
      let button = await driver.findComponent(ON.id('AlertDialogJsunit_0100'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('AlertDialogJsunit_0100');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[AlertDialogJsunit_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual("one button dialog");
	    await driver.pressBack();
	    await CommonFunc.sleep(500);
	  
      let button2 = await driver.findComponent(ON.id('AlertDialog2'));
      await button2.click();
      await CommonFunc.sleep(1000);
	    let strJson2 = getInspectorByKey('AlertDialog2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[AlertDialogJsunit_0100] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.label).assertEqual("two button dialog");
      await driver.triggerKey(2070)
      await CommonFunc.sleep(1000);
      console.info('[AlertDialogJsunit_0100] END');
      done();
    });

  })
}
