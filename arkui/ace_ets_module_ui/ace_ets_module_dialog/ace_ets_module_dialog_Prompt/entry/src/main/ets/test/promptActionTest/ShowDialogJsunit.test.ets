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


export default function ShowDialogJsunit() {
  describe('ShowDialogJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("ShowDialogJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/ShowDialogOptions',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ShowDialogJsunit state pages: " + JSON.stringify(pages));
        if (!("ShowDialogOptions" == pages.name)) {
          console.info("get ShowDialogJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ShowDialogJsunit page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ShowDialogJsunit page error: " + err);
        expect().assertFail();
      }
      done()
    });


   /**
     * @tc.number    ShowDialogJsunit_0100
     * @tc.name      ShowDialogJsunit_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ShowDialogJsunit_0100', Level.LEVEL2, async (done: Function) => {
      console.info('ShowDialogJsunit_0100 START');
	    let driver = await Driver.create()
      let button = await driver.findComponent(ON.id('ShowDialog'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('ShowDialog');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ShowDialogJsunit_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual("PromptActionDialog");
      await driver.triggerKey(2070)
      await CommonFunc.sleep(1000);
      console.info('[ShowDialogJsunit_0100] END');
      done();
    });

  })
}
