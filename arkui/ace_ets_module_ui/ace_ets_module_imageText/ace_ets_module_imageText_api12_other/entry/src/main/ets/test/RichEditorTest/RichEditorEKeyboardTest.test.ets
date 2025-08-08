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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function RichEditorEKeyboardTest() {
  describe('RichEditorEKeyboardTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorEKeyboardTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditorEKeyboardTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorEKeyboardTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("RichEditorEKeyboardTest" == pages.name)) {
          console.info("get RichEditorEKeyboardTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push RichEditorEKeyboardTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorEKeyboardTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RichEditorEKeyboardTest after each called");
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0001
    * @tc.name         RichEditorEKeyboardTest0001
    * @tc.desic        test default
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
     */
    it('RichEditorEKeyboardTest0001', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('RichEditorEKeyboardTest0001 START');
      let strJson = getInspectorByKey('RichEditor');
      let obj: ESObject = JSON.parse(strJson);
      console.log('RichEditorEKeyboardTest-----' + obj.$attrs.enableKeyboardOnFocus);
      expect(obj.$attrs.enableKeyboardOnFocus+'').assertEqual('true');
      console.info("[RichEditorEKeyboardTest0001] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0002
    * @tc.name         RichEditorEKeyboardTest0002
    * @tc.desic        test null
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
     */
    it('RichEditorEKeyboardTest0002', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('RichEditorEKeyboardTest0002 START');
      let strJson = getInspectorByKey('RichEditor1');
      let obj: ESObject = JSON.parse(strJson);
      console.log('RichEditorEKeyboardTest-----' + obj.$attrs.enableKeyboardOnFocus);
      expect(obj.$attrs.enableKeyboardOnFocus+'').assertEqual('true');
      console.info("[RichEditorEKeyboardTest0002] end");
      done();
    });

    /*
   * @tc.number       SUB_ACE_BASIC_ETS_API_0003
   * @tc.name         RichEditorEKeyboardTest0003
   * @tc.desic        test false
   * @tc.size         MediumTest
   * @tc.type         Function
   * @tc.level        1
    */
    it('RichEditorEKeyboardTest0003', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info(' RichEditorEKeyboardTest0003 START');
      let strJson = getInspectorByKey('RichEditor2');
      let obj: ESObject = JSON.parse(strJson);
      console.log('RichEditorEKeyboardTest-----' + obj.$attrs.enableKeyboardOnFocus);
      expect(obj.$attrs.enableKeyboardOnFocus+'').assertEqual('false');
      console.info("[RichEditorEKeyboardTest0003] end");
      done();
    });

    /*
   * @tc.number       SUB_ACE_BASIC_ETS_API_0004
   * @tc.name         RichEditorEKeyboardTest0004
   * @tc.desic        test true
   * @tc.size         MediumTest
   * @tc.type         Function
   * @tc.level        1
    */
    it('RichEditorEKeyboardTest0004', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info(' RichEditorEKeyboardTest0004 START');
      let strJson = getInspectorByKey('RichEditor3');
      let obj: ESObject = JSON.parse(strJson);
      console.log('RichEditorEKeyboardTest-----' + obj.$attrs.enableKeyboardOnFocus);
      expect(obj.$attrs.enableKeyboardOnFocus+'').assertEqual('true');
      console.info("[RichEditorEKeyboardTest0004] end");
      done();
    });
  })
}