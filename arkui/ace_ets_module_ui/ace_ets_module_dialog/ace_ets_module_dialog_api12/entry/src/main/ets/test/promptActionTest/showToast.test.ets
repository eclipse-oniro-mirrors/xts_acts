/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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


export default function showToastTest () {
  describe('showToastTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ShowToastTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/showToast',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ShowToastTest state pages: " + JSON.stringify(pages));
        if (!("ShowToastTest" == pages.name)) {
          console.info("get ShowToastTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ShowToastTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ShowToastTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_PROMPTACTION_BLURSTYLE_0010
    * @tc.name  : showToast_0100
    * @tc.desc  : Set whether the pop-up window is displayed on the app.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('showToast_0100', Level.LEVEL2, async (done: Function) => {
      console.info('showToast_0100 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('backgroundColor'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('backgroundColor');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showToast_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('backgroundColor');
      console.info('[showToast_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_PROMPTACTION_BLURSTYLE_0020
    * @tc.name  : showToast_0200
    * @tc.desc  : Set whether the pop-up window is displayed on the app.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('showToast_0200', Level.LEVEL2, async (done: Function) => {
      console.info('showToast_0200 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('backgroundBlurStyle'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('backgroundBlurStyle');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showToast_0200] component obj is: " + JSON.stringify(obj));
      console.info("[showToast_0200] promptAction: " + JSON.stringify(obj.$attrs.promptAction));
      expect(obj.$attrs.label).assertEqual('backgroundBlurStyle');
      console.info('[showToast_0200] END');
      done();
    });
     /* *
    * @tc.number: SUB_ACE_PROMPTACTION_BLURSTYLE_0020
    * @tc.name  : showToast_0300
    * @tc.desc  : Set whether the pop-up window is displayed on the app.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('showToast_0300', Level.LEVEL2, async (done: Function) => {
      console.info('showToast_0300 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('textColor'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textColor');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showToast_0300] component obj is: " + JSON.stringify(obj));
      console.info("[showToast_0300] promptAction: " + JSON.stringify(obj.$attrs.promptAction));
      expect(obj.$attrs.label).assertEqual('textColor');
      console.info('[showToast_0300] END');
      done();
    });
     /* *
    * @tc.number: SUB_ACE_PROMPTACTION_BLURSTYLE_0040
    * @tc.name  : showToast_0400
    * @tc.desc  : Set whether the pop-up window is displayed on the app.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('showToast_0400', Level.LEVEL2, async (done: Function) => {
      console.info('showToast_0400 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('Shadow'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Shadow');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showToast_0400] component obj is: " + JSON.stringify(obj));
      console.info("[showToast_0400] promptAction: " + JSON.stringify(obj.$attrs.promptAction));
      expect(obj.$attrs.label).assertEqual('Shadow');
      console.info('[showToast_0400] END');
      done();
    });

  })
}