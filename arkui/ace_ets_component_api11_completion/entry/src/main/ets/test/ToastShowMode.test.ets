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
import router from '@ohos.router';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../MainAbility/utils/Common';
import { MessageManager, Callback } from '../MainAbility/utils/MessageManager';


export default function ToastShowMode() {
  describe('ToastShowMode', () => {
    beforeEach(async (done: Function) => {
      console.info("ToastShowMode beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ToastShowMode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ToastShowMode state pages: " + JSON.stringify(pages));
        if (!("ToastShowMode" == pages.name)) {
          console.info("get ToastShowMode state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ToastShowMode success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ToastShowMode page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_PROMPTACTION_BLURSTYLE_0010
    * @tc.name  : ToastShowMode_0100
    * @tc.desc  : Set whether the pop-up window is displayed on the app.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('ToastShowMode_0100', 0, async (done: Function) => {
      console.info('ToastShowMode_0100 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('ShowMode_p1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ShowMode_p1');
      console.info("[ToastShowMode_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.label).assertEqual('DEFAULT');
      console.info('[ToastShowMode_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_PROMPTACTION_BLURSTYLE_0020
    * @tc.name  : ToastShowMode_0200
    * @tc.desc  : Set whether the pop-up window is displayed on the app.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('ToastShowMode_0200', 0, async (done: Function) => {
      console.info('ToastShowMode_0200 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('ShowMode_p2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ShowMode_p2');
      console.info("[ToastShowMode_0200] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[ToastShowMode_0200] promptAction: " + JSON.stringify(JSON.parse(strJson).$attrs.promptAction));
      expect(JSON.parse(strJson).$attrs.label).assertEqual('TOP_MOST');
      console.info('[ToastShowMode_0200] END');
      done();
    });
  })
}