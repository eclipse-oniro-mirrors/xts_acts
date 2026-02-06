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
import { describe, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function RichEditorReturnValuesTest() {
  describe('RichEditorReturnValuesTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorReturnValuesTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditorReturnValues',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorReturnValuesTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("RichEditorReturnValues" == pages.name)) {
          console.info("get RichEditorReturnValuesTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push RichEditorReturnValuesTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorReturnValuesTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RichEditorReturnValuesTest after each called");
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_RichEditor_SetCaretOffsetFalse_0010
    * @tc.name         RichEditorSetCaretOffsetFalse_0010
    * @tc.desc        test return value of setCaretOffset: false
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
    */
    it('RichEditorSetCaretOffsetFalse_0010', Level.LEVEL1, async (done: Function) => {
      console.info('RichEditorSetCaretOffsetFalse_0010 START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('setCaretOffset_false'))
      await CommonFunc.sleep(500);
      await Button.click();
      await CommonFunc.sleep(1000);
      console.info("[RichEditorSetCaretOffsetFalse_0010] click succ");
      console.info("[RichEditorSetCaretOffsetFalse_0010] return: " + AppStorage.get('setCaretOffset_return'));
      expect(AppStorage.get('setCaretOffset_return')).assertEqual(false);
      AppStorage.delete('setCaretOffset_return')
      console.info("[RichEditorSetCaretOffsetFalse_0010] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_RichEditor_SetCaretOffsetTrue_0020
    * @tc.name         RichEditorSetCaretOffsetTrue_0020
    * @tc.desc        test return value of setCaretOffset: true
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
    */
    it('RichEditorSetCaretOffsetTrue_0020', Level.LEVEL1, async (done: Function) => {
      console.info('RichEditorSetCaretOffsetTrue_0020 START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('setCaretOffset_true'))
      await CommonFunc.sleep(500);
      await Button.click();
      await CommonFunc.sleep(1000);
      console.info("[RichEditorSetCaretOffsetTrue_0020] click succ");
      console.info("[RichEditorSetCaretOffsetTrue_0020] return: " + AppStorage.get('setCaretOffset_return'));
      expect(AppStorage.get('setCaretOffset_return')).assertEqual(true);
      AppStorage.delete('setCaretOffset_return')
      console.info("[RichEditorSetCaretOffsetTrue_0020] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_RichEditor_AddImageSpanNumber_0030
    * @tc.name         RichEditorAddImageSpanNumber_0030
    * @tc.desc        test return value of addImageSpan: number
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
    */
    it('RichEditorAddImageSpanNumber_0030', Level.LEVEL1, async (done: Function) => {
      console.info('RichEditorAddImageSpanNumber_0030 START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('addImageSpan_get'))
      await CommonFunc.sleep(500);
      await Button.click();
      await CommonFunc.sleep(1000);
      console.info("[RichEditorAddImageSpanNumber_0030] click succ");
      console.info("[RichEditorAddImageSpanNumber_0030] return: " + AppStorage.get('addImageSpan_return'));
      expect(typeof AppStorage.get('addImageSpan_return')).assertEqual('number');
      expect(AppStorage.get('addImageSpan_return')).assertEqual(1);
      AppStorage.delete('addImageSpan_return')
      console.info("[RichEditorAddImageSpanNumber_0030] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_RichEditor_GetSpansEmptyArray_0040
    * @tc.name         RichEditorGetSpansEmptyArray_0040
    * @tc.desc        test return value of getSpans: Empty array
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
    */
    it('RichEditorGetSpansEmptyArray_0040', Level.LEVEL1, async (done: Function) => {
      console.info('RichEditorGetSpansEmptyArray_0040 START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('getSpans_return_0'))
      await CommonFunc.sleep(500);
      await Button.click();
      await CommonFunc.sleep(1000);
      console.info("[RichEditorGetSpansEmptyArray_0040] click succ");
      console.info("[RichEditorGetSpansEmptyArray_0040] return: " + AppStorage.get('getSpans_return_0'));
      expect(AppStorage.get('getSpans_return_0')).assertEqual(0);
      AppStorage.delete('getSpans_return_0')
      console.info("[RichEditorGetSpansEmptyArray_0040] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_RichEditor_GetSpansNotEmptyArray_0050
    * @tc.name         RichEditorGetSpansNotEmptyArray_0050
    * @tc.desc        test return value of getSpans: Not empty array
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
    */
    it('RichEditorGetSpansNotEmptyArray_0050', Level.LEVEL1, async (done: Function) => {
      console.info('RichEditorGetSpansNotEmptyArray_0050 START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('getSpans_return_1'))
      await CommonFunc.sleep(500);
      await Button.click();
      await CommonFunc.sleep(1000);
      console.info("[RichEditorGetSpansNotEmptyArray_0050] click succ");
      console.info("[RichEditorGetSpansNotEmptyArray_0050] return: " + AppStorage.get('getSpans_return_1'));
      expect(Number(AppStorage.get('getSpans_return_1')) > 0).assertTrue();
      AppStorage.delete('getSpans_return_1')
      console.info("[RichEditorGetSpansNotEmptyArray_0050] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_RichEditor_GetParagraphsEmptyArray_0060
    * @tc.name         RichEditorGetParagraphsEmptyArray_0060
    * @tc.desc        test return value of getParagraphs: Empty array
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
    */
    it('RichEditorGetParagraphsEmptyArray_0060', Level.LEVEL1, async (done: Function) => {
      console.info('RichEditorGetParagraphsEmptyArray_0060 START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('getParagraphs_return_0'))
      await CommonFunc.sleep(500);
      await Button.click();
      await CommonFunc.sleep(1000);
      console.info("[RichEditorGetParagraphsEmptyArray_0060] click succ");
      console.info("[RichEditorGetParagraphsEmptyArray_0060] return: " + AppStorage.get('getParagraphs_return_0'));
      expect(AppStorage.get('getParagraphs_return_0')).assertEqual(0);
      AppStorage.delete('getParagraphs_return_0')
      console.info("[RichEditorGetParagraphsEmptyArray_0060] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_RichEditor_GetParagraphsNotEmptyArray_0070
    * @tc.name         RichEditorGetParagraphsNotEmptyArray_0070
    * @tc.desc        test return value of getParagraphs: Not empty array
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
    */
    it('RichEditorGetParagraphsNotEmptyArray_0070', Level.LEVEL1, async (done: Function) => {
      console.info('RichEditorGetParagraphsNotEmptyArray_0070 START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('getParagraphs_return_1'))
      await CommonFunc.sleep(500);
      await Button.click();
      await CommonFunc.sleep(1000);
      console.info("[RichEditorGetParagraphsNotEmptyArray_0070] click succ");
      console.info("[RichEditorGetParagraphsNotEmptyArray_0070] return: " + AppStorage.get('getParagraphs_return_1'));
      expect(Number(AppStorage.get('getParagraphs_return_1')) > 0).assertTrue();
      AppStorage.delete('getParagraphs_return_1')
      console.info("[RichEditorGetParagraphsNotEmptyArray_0070] end");
      done();
    });
  })
}