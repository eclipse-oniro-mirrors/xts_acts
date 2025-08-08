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

export default function RichEditorMaxLinesTest() {
  describe('RichEditorMaxLinesTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorMaxLinesTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditorMaxLinesTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorMaxLinesTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("RichEditorMaxLinesTest" == pages.name)) {
          console.info("get RichEditorMaxLinesTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push RichEditorMaxLinesTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorMaxLinesTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RichEditorMaxLinesTest after each called");
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0001
    * @tc.name         RichEditorMaxLinesTest0001
    * @tc.desic        The MaxLines  set -1
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
     */
    it('RichEditorMaxLinesTest0001', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('RichEditorMaxLinesTest0001 START');
      let strJson = getInspectorByKey('RichEditorMaxLines');
      let obj: ESObject = JSON.parse(strJson);
      console.log('RichEditorMaxLinesTest-----' + obj.$attrs.maxLines);
      expect(obj.$attrs.maxLines).assertEqual('1000000');
      console.info("[RichEditorMaxLinesTest0001] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0002
    * @tc.name         RichEditorMaxLinesTest0002
    * @tc.desic        The MaxLines  set 2.5
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
     */
    it('RichEditorMaxLinesTest0002', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('RichEditorMaxLinesTest0002 START');
      await CommonFunc.sleep(1000);
      let setMaxLength = await driver.findComponent(ON.id('setMaxLine1'))
      await CommonFunc.sleep(500);
      await setMaxLength.click()
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('RichEditorMaxLines');
      let obj: ESObject = JSON.parse(strJson);
      console.log('RichEditorMaxLinesTest-----' + obj.$attrs.maxLines);
      expect(obj.$attrs.maxLines).assertEqual('2');
      console.info("[RichEditorMaxLinesTest0002] end");
      done();
    });

    /*
   * @tc.number       SUB_ACE_BASIC_ETS_API_0003
   * @tc.name         RichEditorMaxLinesTest0003
   * @tc.desic        The MaxLines  set 6
   * @tc.size         MediumTest
   * @tc.type         Function
   * @tc.level        1
    */
    it('RichEditorMaxLinesTest0003', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info(' RichEditorMaxLinesTest0003 START');
      await CommonFunc.sleep(1000);
      let setMaxLength = await driver.findComponent(ON.id('setMaxLine2'))
      await CommonFunc.sleep(500);
      await setMaxLength.click()
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('RichEditorMaxLines');
      let obj: ESObject = JSON.parse(strJson);
      console.log('RichEditorMaxLinesTest-----' + obj.$attrs.maxLines);
      expect(obj.$attrs.maxLines).assertEqual('6');
      console.info("[RichEditorMaxLinesTest0003] end");
      done();
    });

    /*
   * @tc.number       SUB_ACE_BASIC_ETS_API_0004
   * @tc.name         RichEditorMaxLinesTest0004
   * @tc.desic        The MaxLines  set undefined
   * @tc.size         MediumTest
   * @tc.type         Function
   * @tc.level        1
    */
    it('RichEditorMaxLinesTest0004', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info(' RichEditorMaxLinesTest0004 START');
      await CommonFunc.sleep(1000);
      let setMaxLength = await driver.findComponent(ON.id('setMaxLine3'))
      await CommonFunc.sleep(500);
      await setMaxLength.click()
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('RichEditorMaxLines');
      let obj: ESObject = JSON.parse(strJson);
      console.log('RichEditorMaxLinesTest-----' + obj.$attrs.maxLines);
      expect(obj.$attrs.maxLines).assertEqual('1000000');
      console.info("[RichEditorMaxLinesTest0004] end");
      done();
    });
  })
}