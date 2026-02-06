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

import { describe, it, expect, TestType, Size, Level, beforeAll } from '@ohos/hypium'
import nativerenderndk from 'libnoderenderndk.so'
import Utils from '../common/Utils';


const ARKUI_ERROR_CODE_NO_ERROR = 0;
const ARKUI_ERROR_CODE_ERROR = 1;
const ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL = 0;
const ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER = -2;

export default function AccessibilityTypeTest() {
  describe('AccessibilityTypeTest', () => {
    beforeAll(async (done: Function) => {
      await Utils.pushPage(`nodeeventtypetest/AccessibilitycallbackTest`, done);
    });
    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_INVALID_0100
       * @tc.name       : testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_INVALID0100
       * @tc.desc       : testing ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_INVALID interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_INVALID0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_INVALID0100 start====");
          let result: number = nativerenderndk.ActionTypeTest_001();
          console.info(`====>testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_INVALID0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_INVALID0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_LONG_CLICK_0100
       * @tc.name       : testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_LONG_CLICK0100
       * @tc.desc       : testing ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_LONG_CLICK interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_LONG_CLICK0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_LONG_CLICK0100 start====");
          let result: number = nativerenderndk.ActionTypeTest_002();
          console.info(`====>testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_LONG_CLICK0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_LONG_CLICK0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SCROLL_FORWARD_0100
       * @tc.name       : testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SCROLL_FORWARD0100
       * @tc.desc       : testing ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SCROLL_FORWARD interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SCROLL_FORWARD0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SCROLL_FORWARD0100 start====");
          let result: number = nativerenderndk.ActionTypeTest_003();
          console.info(`====>testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SCROLL_FORWARD0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SCROLL_FORWARD0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SCROLL_BACKWARD_0100
       * @tc.name       : testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SCROLL_BACKWARD0100
       * @tc.desc       : testing ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SCROLL_BACKWARD interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SCROLL_BACKWARD0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SCROLL_BACKWARD0100 start====");
          let result: number = nativerenderndk.ActionTypeTest_004();
          console.info(`====>testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SCROLL_BACKWARD0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SCROLL_BACKWARD0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_COPY_0100
       * @tc.name       : testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_COPY0100
       * @tc.desc       : testing ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_COPY interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_COPY0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_COPY0100 start====");
          let result: number = nativerenderndk.ActionTypeTest_005();
          console.info(`====>testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_COPY0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_COPY0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_PASTE_0100
       * @tc.name       : testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_PASTE0100
       * @tc.desc       : testing ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_PASTE interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_PASTE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_PASTE0100 start====");
          let result: number = nativerenderndk.ActionTypeTest_006();
          console.info(`====>testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_PASTE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_PASTE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_CUT_0100
       * @tc.name       : testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_CUT0100
       * @tc.desc       : testing ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_CUT interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_CUT0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_CUT0100 start====");
          let result: number = nativerenderndk.ActionTypeTest_007();
          console.info(`====>testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_CUT0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_CUT0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SELECT_TEXT_0100
       * @tc.name       : testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SELECT_TEXT0100
       * @tc.desc       : testing ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SELECT_TEXT interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SELECT_TEXT0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SELECT_TEXT0100 start====");
          let result: number = nativerenderndk.ActionTypeTest_008();
          console.info(`====>testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SELECT_TEXT0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SELECT_TEXT0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SET_TEXT_0100
       * @tc.name       : testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SET_TEXT0100
       * @tc.desc       : testing ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SET_TEXT interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SET_TEXT0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SET_TEXT0100 start====");
          let result: number = nativerenderndk.ActionTypeTest_009();
          console.info(`====>testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SET_TEXT0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SET_TEXT0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SET_CURSOR_POSITION_0100
       * @tc.name       : testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SET_CURSOR_POSITION0100
       * @tc.desc       : testing ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SET_CURSOR_POSITION interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SET_CURSOR_POSITION0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SET_CURSOR_POSITION0100 start====");
          let result: number = nativerenderndk.ActionTypeTest_010();
          console.info(`====>testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SET_CURSOR_POSITION0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SET_CURSOR_POSITION0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_INVALID_0100
       * @tc.name       : testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_INVALID0100
       * @tc.desc       : testing ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_INVALID interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_INVALID0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_INVALID0100 start====");
          let result: number = nativerenderndk.EventTypeTest_001();
          console.info(`====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_INVALID0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_INVALID0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_LONG_CLICKED_0100
       * @tc.name       : testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_LONG_CLICKED0100
       * @tc.desc       : testing ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_LONG_CLICKED interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_LONG_CLICKED0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_LONG_CLICKED0100 start====");
          let result: number = nativerenderndk.EventTypeTest_002();
          console.info(`====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_LONG_CLICKED0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_LONG_CLICKED0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_SELECTED_0100
       * @tc.name       : testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_SELECTED0100
       * @tc.desc       : testing ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_SELECTED interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_SELECTED0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_SELECTED0100 start====");
          let result: number = nativerenderndk.EventTypeTest_003();
          console.info(`====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_SELECTED0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_SELECTED0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_TEXT_UPDATE_0100
       * @tc.name       : testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_TEXT_UPDATE0100
       * @tc.desc       : testing ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_TEXT_UPDATE interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_TEXT_UPDATE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_TEXT_UPDATE0100 start====");
          let result: number = nativerenderndk.EventTypeTest_004();
          console.info(`====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_TEXT_UPDATE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_TEXT_UPDATE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_PAGE_STATE_UPDATE_0100
       * @tc.name       : testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_PAGE_STATE_UPDATE0100
       * @tc.desc       : testing ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_PAGE_STATE_UPDATE interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_PAGE_STATE_UPDATE0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_PAGE_STATE_UPDATE0100 start====");
          let result: number = nativerenderndk.EventTypeTest_005();
          console.info(`====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_PAGE_STATE_UPDATE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_PAGE_STATE_UPDATE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_PAGE_CONTENT_UPDATE_0100
       * @tc.name       : testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_PAGE_CONTENT_UPDATE0100
       * @tc.desc       : testing ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_PAGE_CONTENT_UPDATE interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_PAGE_CONTENT_UPDATE0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_PAGE_CONTENT_UPDATE0100 start====");
          let result: number = nativerenderndk.EventTypeTest_006();
          console.info(`====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_PAGE_CONTENT_UPDATE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_PAGE_CONTENT_UPDATE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_SCROLLED_0100
       * @tc.name       : testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_SCROLLED0100
       * @tc.desc       : testing ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_SCROLLED interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_SCROLLED0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_SCROLLED0100 start====");
          let result: number = nativerenderndk.EventTypeTest_007();
          console.info(`====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_SCROLLED0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_SCROLLED0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_REQUEST_ACCESSIBILITY_FOCUS_0100
       * @tc.name       : testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_REQUEST_ACCESSIBILITY_FOCUS0100
       * @tc.desc       : testing ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_REQUEST_ACCESSIBILITY_FOCUS interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_REQUEST_ACCESSIBILITY_FOCUS0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_REQUEST_ACCESSIBILITY_FOCUS0100 start====");
          let result: number = nativerenderndk.EventTypeTest_008();
          console.info(`====>testACCESSIBILITY_NATIVE_EVENT_TYPE_REQUEST_ACCESSIBILITY_FOCUS0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_REQUEST_ACCESSIBILITY_FOCUS0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_PAGE_OPEN_0100
       * @tc.name       : testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_PAGE_OPEN0100
       * @tc.desc       : testing ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_PAGE_OPEN interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_PAGE_OPEN0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_PAGE_OPEN0100 start====");
          let result: number = nativerenderndk.EventTypeTest_009();
          console.info(`====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_PAGE_OPEN0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_PAGE_OPEN0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_PAGE_CLOSE_0100
       * @tc.name       : testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_PAGE_CLOSE0100
       * @tc.desc       : testing ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_PAGE_CLOSE interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_PAGE_CLOSE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_PAGE_CLOSE0100 start====");
          let result: number = nativerenderndk.EventTypeTest_010();
          console.info(`====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_PAGE_CLOSE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_PAGE_CLOSE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_ANNOUNCE_FOR_ACCESSIBILITY_0100
       * @tc.name       : testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_ANNOUNCE_FOR_ACCESSIBILITY0100
       * @tc.desc       : testing ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_ANNOUNCE_FOR_ACCESSIBILITY interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_ANNOUNCE_FOR_ACCESSIBILITY0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_ANNOUNCE_FOR_ACCESSIBILITY0100 start====");
          let result: number = nativerenderndk.EventTypeTest_011();
          console.info(`====>testACCESSIBILITY_NATIVE_EVENT_TYPE_ANNOUNCE_FOR_ACCESSIBILITY0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_ANNOUNCE_FOR_ACCESSIBILITY0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_FOCUS_NODE_UPDATE_0100
       * @tc.name       : testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_FOCUS_NODE_UPDATE0100
       * @tc.desc       : testing ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_FOCUS_NODE_UPDATE interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_FOCUS_NODE_UPDATE0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_FOCUS_NODE_UPDATE0100 start====");
          let result: number = nativerenderndk.EventTypeTest_012();
          console.info(`====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_FOCUS_NODE_UPDATE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_FOCUS_NODE_UPDATE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL_0100
       * @tc.name       : testARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL0100
       * @tc.desc       : testing ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL0100 start====");
          let result: number = nativerenderndk.AcessbilityErrorCodeTest_001();
          console.info(`====>testARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER_0100
       * @tc.name       : testARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER0100
       * @tc.desc       : testing ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER0100 start====");
          let result: number = nativerenderndk.AcessbilityErrorCodeTest_002();
          console.info(`====>testARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

  })
}