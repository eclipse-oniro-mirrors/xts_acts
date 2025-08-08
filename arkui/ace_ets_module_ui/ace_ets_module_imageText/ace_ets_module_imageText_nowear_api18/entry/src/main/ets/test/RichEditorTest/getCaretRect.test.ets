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

import { describe, beforeEach, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function getCaretRect() {
  describe('getCaretRect', () => {
    beforeEach(async (done: Function) => {
      console.info("getCaretRect beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/getCaretRect',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getCaretRect state pages: " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("getCaretRect" == pages.name)) {
          console.info("get getCaretRect state pages.name: " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push getCaretRect success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getCaretRect page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         getCaretRect0001
     * @tc.desic        Returns the position of the cursor relative to the RichEditor 
                          component. If the cursor does not blink, undefined is returned.
     */
    it('getCaretRect0001', 0, async (done: Function) => {
      console.info("[getCaretRect0001] start");
      let driver = Driver.create();
      console.info('getCaretRect getCaretRect0001 START');
      await CommonFunc.sleep(500);
      let but = await driver.findComponent(ON.id('but'));
      await CommonFunc.sleep(500);
      await but.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('text');
      let obj: ESObject = JSON.parse(strJson);
      console.log('addOrDelText0001---obj.$attrs.content---' +
        JSON.stringify(obj.$attrs.content));
      expect('' + obj.$attrs.content).assertEqual("undefined");
      console.info("[getCaretRect0001] end");
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         getCaretRect0002
     * @tc.desic        Returns the position of the cursor relative to the RichEditor 
                          component. If the cursor does not blink, undefined is returned.
     */
    it('getCaretRect0002', 0, async (done: Function) => {
      console.info("[getCaretRect0002] start");
      let driver = Driver.create();
      console.info('getCaretRect getCaretRect0002 START');
      await CommonFunc.sleep(500);
      let richEditor = await driver.findComponent(ON.id('richEditor'));
      await CommonFunc.sleep(500);
      await richEditor.click();
      await CommonFunc.sleep(500);
      let but = await driver.findComponent(ON.id('but'));
      await CommonFunc.sleep(500);
      await but.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('text');
      let obj: ESObject = JSON.parse(strJson);
      console.log('addOrDelText0001---obj.$attrs.content---' +
        JSON.stringify(obj.$attrs.content));
      expect('' + obj.$attrs.content).assertEqual("succ");
      console.info("[getCaretRect0002] end");
      done();
    });

    
  })
}