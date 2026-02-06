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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach } from '@ohos/hypium'
import nativerenderndk from 'libnoderenderndk.so'
import { ON } from '@kit.TestKit';
import Utils from '../common/Utils';
import { inputMethod } from '@kit.IMEKit';

const ARKUI_ERROR_CODE_NO_ERROR = 0;
const ARKUI_ERROR_CODE_ERROR = 1;

export default function NodeEventTypeTest() {
  describe('NodeEventTypeTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.pushPage(`nodeeventtypetest/NodeEventTypeTest`, done);
    });
    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_NODE_EVENT_ON_ATTACH_0100
       * @tc.name       : testNODE_EVENT_ON_ATTACH0100
       * @tc.desc       : testing NODE_EVENT_ON_ATTACH interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testNODE_EVENT_ON_ATTACH0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testNODE_EVENT_ON_ATTACH0100 start====");
          let result: number = nativerenderndk.NodeEventTypeTest_001();
          console.info(`====>testNODE_EVENT_ON_ATTACH0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testNODE_EVENT_ON_ATTACH0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_NODE_TEXT_ON_DETECT_RESULT_UPDATE_0100
       * @tc.name       : testNODE_TEXT_ON_DETECT_RESULT_UPDATE0100
       * @tc.desc       : testing NODE_TEXT_ON_DETECT_RESULT_UPDATE interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testNODE_TEXT_ON_DETECT_RESULT_UPDATE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testNODE_TEXT_ON_DETECT_RESULT_UPDATE0100 start====");
          let result: number = nativerenderndk.NodeEventTypeTest_005();
          console.info(`====>testNODE_TEXT_ON_DETECT_RESULT_UPDATE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testNODE_TEXT_ON_DETECT_RESULT_UPDATE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_NODE_TEXT_SPAN_ON_LONG_PRESS_0100
       * @tc.name       : testNODE_TEXT_SPAN_ON_LONG_PRESS0100
       * @tc.desc       : testing NODE_TEXT_SPAN_ON_LONG_PRESS interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testNODE_TEXT_SPAN_ON_LONG_PRESS0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testNODE_TEXT_SPAN_ON_LONG_PRESS0100 start====");
          let span = await Utils.driver.findComponent(ON.id('span66'));
          await span.longClick();
          let result: number = nativerenderndk.NodeEventTypeTest_006();
          console.info(`====>testNODE_TEXT_SPAN_ON_LONG_PRESS0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testNODE_TEXT_SPAN_ON_LONG_PRESS0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_NODE_IMAGE_ON_ERROR_0100
       * @tc.name       : testNODE_IMAGE_ON_ERROR0100
       * @tc.desc       : testing NODE_IMAGE_ON_ERROR interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testNODE_IMAGE_ON_ERROR0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testNODE_IMAGE_ON_ERROR0100 start====");
          let result: number = nativerenderndk.NodeEventTypeTest_007();
          console.info(`====>testNODE_IMAGE_ON_ERROR0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testNODE_IMAGE_ON_ERROR0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_NODE_TEXT_INPUT_ON_WILL_CHANGE_0100
       * @tc.name       : testNODE_TEXT_INPUT_ON_WILL_CHANGE0100
       * @tc.desc       : testing NODE_TEXT_INPUT_ON_WILL_CHANGE interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testNODE_TEXT_INPUT_ON_WILL_CHANGE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testNODE_TEXT_INPUT_ON_WILL_CHANGE0100 start====");
          let com = await Utils.driver.findComponent(ON.id('textinput8'));
          await com.inputText('aaaaa');
          let result: number = nativerenderndk.NodeEventTypeTest_008();
          console.info(`====>testNODE_TEXT_INPUT_ON_WILL_CHANGE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testNODE_TEXT_INPUT_ON_WILL_CHANGE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_NODE_TEXT_AREA_ON_WILL_CHANGE_0100
       * @tc.name       : testNODE_TEXT_AREA_ON_WILL_CHANGE0100
       * @tc.desc       : testing NODE_TEXT_AREA_ON_WILL_CHANGE interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testNODE_TEXT_AREA_ON_WILL_CHANGE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testNODE_TEXT_AREA_ON_WILL_CHANGE0100 start====");
          let com = await Utils.driver.findComponent(ON.id('textarea9'));
          await com.inputText('a');
          await inputMethod.getController().stopInputSession();
          let result: number = nativerenderndk.NodeEventTypeTest_009();
          console.info(`====>testNODE_TEXT_AREA_ON_WILL_CHANGE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testNODE_TEXT_AREA_ON_WILL_CHANGE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_NODE_TEXT_PICKER_EVENT_ON_SCROLL_STOP_0100
       * @tc.name       : testNODE_TEXT_PICKER_EVENT_ON_SCROLL_STOP0100
       * @tc.desc       : testing NODE_TEXT_PICKER_EVENT_ON_SCROLL_STOP interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testNODE_TEXT_PICKER_EVENT_ON_SCROLL_STOP0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testNODE_TEXT_PICKER_EVENT_ON_SCROLL_STOP0100 start====");
          let textpicker = await Utils.driver.findComponent(ON.id('textpicker11'));
          await textpicker.scrollToBottom();
          let result: number = nativerenderndk.NodeEventTypeTest_010();
          console.info(`====>testNODE_TEXT_PICKER_EVENT_ON_SCROLL_STOP0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testNODE_TEXT_PICKER_EVENT_ON_SCROLL_STOP0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
     * @tc.number     : SUB_ArkUI_ACE_ENGINE_NODE_CHECKBOX_GROUP_EVENT_ON_CHANGE_0100
     * @tc.name       : testNODE_CHECKBOX_GROUP_EVENT_ON_CHANGE0100
     * @tc.desc       : testing NODE_CHECKBOX_GROUP_EVENT_ON_CHANGE interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
    */
    it('testNODE_CHECKBOX_GROUP_EVENT_ON_CHANGE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testNODE_CHECKBOX_GROUP_EVENT_ON_CHANGE0100 start====");
          let checkbox = await Utils.driver.findComponent(ON.id('Checkbox11'));
          await checkbox.click();
          let result: number = nativerenderndk.NodeEventTypeTest_011();
          console.info(`====>testNODE_CHECKBOX_GROUP_EVENT_ON_CHANGE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testNODE_CHECKBOX_GROUP_EVENT_ON_CHANGE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })
  })
}