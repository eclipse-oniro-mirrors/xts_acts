/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function ToastExample() {
  describe('ToastExample', () => {
    beforeEach(async (done: Function) => {
      console.info("ToastExample beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/ToastExample',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ToastExample state pages: ' + JSON.stringify(pages));
        if (!('ToastExample' == pages.name)) {
          console.info('get ToastExample state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push ToastExample success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ToastExample page error: ' + err);
        expect().assertFail();
      }
      done();
    })

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ToastExample after each called");
    });

    /**
     * @tc.number SUB_ACE_ToastExample_0100
     * @tc.name ToastExample_0100
     * @tc.desc To test that the promptAction.closeToast
     * @tc.level: Level 1
     * @tc.type : Function
     * @tc.size : MEDIUMTEST
     */
    it('ToastExample_0100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('ToastExample_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.text('openToast'));
      await button.click();
      await CommonFunc.sleep(2000);
      let toast = await driver.findComponent(ON.text('Toast Massage'));
      expect(toast != null).assertTrue()
      console.info('closeDialogTest_0100 0  ok');
      await CommonFunc.sleep(1500);

      let closeErrBtn = await driver.findComponent(ON.text('closeToastError'));
      await closeErrBtn.click();
      let code: string | undefined = AppStorage.get('103401Code')
      expect(code).assertEqual('103401');
      AppStorage.delete('103401Code'); 
      await CommonFunc.sleep(1000);
      let closeBtn = await driver.findComponent(ON.text('closeToast'));
      await closeBtn.click();
      await CommonFunc.sleep(2000);
      toast = await driver.findComponent(ON.text('Toast Massage'));
      expect(toast == null).assertTrue()
      console.info('ToastExample_0100 END');
      done();
    });
  })
}