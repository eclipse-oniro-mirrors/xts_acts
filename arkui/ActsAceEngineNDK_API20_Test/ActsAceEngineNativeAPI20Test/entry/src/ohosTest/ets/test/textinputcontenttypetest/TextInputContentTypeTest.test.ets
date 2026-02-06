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

const ARKUI_ERROR_CODE_NO_ERROR = 0;
const ARKUI_ERROR_CODE_ERROR = 1;

export default function TextInputContentTypeTest() {
  describe('TextInputContentTypeTest', () => {
    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_TEXTINPUT_CONTENT_TYPE_PASSPORT_NUMBER_0100
       * @tc.name       : testARKUI_TEXTINPUT_CONTENT_TYPE_PASSPORT_NUMBER0100
       * @tc.desc       : testing ARKUI_TEXTINPUT_CONTENT_TYPE_PASSPORT_NUMBER interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_TEXTINPUT_CONTENT_TYPE_PASSPORT_NUMBER0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_TEXTINPUT_CONTENT_TYPE_PASSPORT_NUMBER0100 start====");
          let result: number = nativerenderndk.TextInputContentTypeTest_001();
          console.info(`====>testARKUI_TEXTINPUT_CONTENT_TYPE_PASSPORT_NUMBER0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_TEXTINPUT_CONTENT_TYPE_PASSPORT_NUMBER0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_TEXTINPUT_CONTENT_TYPE_VALIDITY_0100
       * @tc.name       : testARKUI_TEXTINPUT_CONTENT_TYPE_VALIDITY0100
       * @tc.desc       : testing ARKUI_TEXTINPUT_CONTENT_TYPE_VALIDITY interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_TEXTINPUT_CONTENT_TYPE_VALIDITY0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_TEXTINPUT_CONTENT_TYPE_VALIDITY0100 start====");
          let result: number = nativerenderndk.TextInputContentTypeTest_002();
          console.info(`====>testARKUI_TEXTINPUT_CONTENT_TYPE_VALIDITY0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_TEXTINPUT_CONTENT_TYPE_VALIDITY0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_TEXTINPUT_CONTENT_TYPE_ISSUE_AT_0100
       * @tc.name       : testARKUI_TEXTINPUT_CONTENT_TYPE_ISSUE_AT0100
       * @tc.desc       : testing ARKUI_TEXTINPUT_CONTENT_TYPE_ISSUE_AT interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_TEXTINPUT_CONTENT_TYPE_ISSUE_AT0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_TEXTINPUT_CONTENT_TYPE_ISSUE_AT0100 start====");
          let result: number = nativerenderndk.TextInputContentTypeTest_003();
          console.info(`====>testARKUI_TEXTINPUT_CONTENT_TYPE_ISSUE_AT0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_TEXTINPUT_CONTENT_TYPE_ISSUE_AT0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_TEXTINPUT_CONTENT_TYPE_ORGANIZATION_0100
       * @tc.name       : testARKUI_TEXTINPUT_CONTENT_TYPE_ORGANIZATION0100
       * @tc.desc       : testing ARKUI_TEXTINPUT_CONTENT_TYPE_ORGANIZATION interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_TEXTINPUT_CONTENT_TYPE_ORGANIZATION0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_TEXTINPUT_CONTENT_TYPE_ORGANIZATION0100 start====");
          let result: number = nativerenderndk.TextInputContentTypeTest_004();
          console.info(`====>testARKUI_TEXTINPUT_CONTENT_TYPE_ORGANIZATION0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_TEXTINPUT_CONTENT_TYPE_ORGANIZATION0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_TEXTINPUT_CONTENT_TYPE_TAX_ID_0100
       * @tc.name       : testARKUI_TEXTINPUT_CONTENT_TYPE_TAX_ID0100
       * @tc.desc       : testing ARKUI_TEXTINPUT_CONTENT_TYPE_TAX_ID interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_TEXTINPUT_CONTENT_TYPE_TAX_ID0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_TEXTINPUT_CONTENT_TYPE_TAX_ID0100 start====");
          let result: number = nativerenderndk.TextInputContentTypeTest_005();
          console.info(`====>testARKUI_TEXTINPUT_CONTENT_TYPE_TAX_ID0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_TEXTINPUT_CONTENT_TYPE_TAX_ID0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_TEXTINPUT_CONTENT_TYPE_ADDRESS_CITY_AND_STATE_0100
       * @tc.name       : testARKUI_TEXTINPUT_CONTENT_TYPE_ADDRESS_CITY_AND_STATE0100
       * @tc.desc       : testing ARKUI_TEXTINPUT_CONTENT_TYPE_ADDRESS_CITY_AND_STATE interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_TEXTINPUT_CONTENT_TYPE_ADDRESS_CITY_AND_STATE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_TEXTINPUT_CONTENT_TYPE_ADDRESS_CITY_AND_STATE0100 start====");
          let result: number = nativerenderndk.TextInputContentTypeTest_006();
          console.info(`====>testARKUI_TEXTINPUT_CONTENT_TYPE_ADDRESS_CITY_AND_STATE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_TEXTINPUT_CONTENT_TYPE_ADDRESS_CITY_AND_STATE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_TEXTINPUT_CONTENT_TYPE_FLIGHT_NUMBER_0100
       * @tc.name       : testARKUI_TEXTINPUT_CONTENT_TYPE_FLIGHT_NUMBER0100
       * @tc.desc       : testing ARKUI_TEXTINPUT_CONTENT_TYPE_FLIGHT_NUMBER interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_TEXTINPUT_CONTENT_TYPE_FLIGHT_NUMBER0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_TEXTINPUT_CONTENT_TYPE_FLIGHT_NUMBER0100 start====");
          let result: number = nativerenderndk.TextInputContentTypeTest_007();
          console.info(`====>testARKUI_TEXTINPUT_CONTENT_TYPE_FLIGHT_NUMBER0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_TEXTINPUT_CONTENT_TYPE_FLIGHT_NUMBER0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_NUMBER_0100
       * @tc.name       : testARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_NUMBER0100
       * @tc.desc       : testing ARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_NUMBER interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_NUMBER0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_NUMBER0100 start====");
          let result: number = nativerenderndk.TextInputContentTypeTest_008();
          console.info(`====>testARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_NUMBER0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_NUMBER0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_FILE_NUMBER_0100
       * @tc.name       : testARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_FILE_NUMBER0100
       * @tc.desc       : testing ARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_FILE_NUMBER interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_FILE_NUMBER0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_FILE_NUMBER0100 start====");
          let result: number = nativerenderndk.TextInputContentTypeTest_009();
          console.info(`====>testARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_FILE_NUMBER0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_FILE_NUMBER0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_PLATE_0100
       * @tc.name       : testARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_PLATE0100
       * @tc.desc       : testing ARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_PLATE interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_PLATE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_PLATE0100 start====");
          let result: number = nativerenderndk.TextInputContentTypeTest_010();
          console.info(`====>testARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_PLATE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_PLATE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_TEXTINPUT_CONTENT_TYPE_ENGINE_NUMBER_0100
       * @tc.name       : testARKUI_TEXTINPUT_CONTENT_TYPE_ENGINE_NUMBER0100
       * @tc.desc       : testing ARKUI_TEXTINPUT_CONTENT_TYPE_ENGINE_NUMBER interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_TEXTINPUT_CONTENT_TYPE_ENGINE_NUMBER0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_TEXTINPUT_CONTENT_TYPE_ENGINE_NUMBER0100 start====");
          let result: number = nativerenderndk.TextInputContentTypeTest_011();
          console.info(`====>testARKUI_TEXTINPUT_CONTENT_TYPE_ENGINE_NUMBER0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_TEXTINPUT_CONTENT_TYPE_ENGINE_NUMBER0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_CHASSIS_NUMBER_0100
       * @tc.name       : testARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_CHASSIS_NUMBER0100
       * @tc.desc       : testing ARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_CHASSIS_NUMBER interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_CHASSIS_NUMBER0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_CHASSIS_NUMBER0100 start====");
          let result: number = nativerenderndk.TextInputContentTypeTest_012();
          console.info(`====>testARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_CHASSIS_NUMBER0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_CHASSIS_NUMBER0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_TEXT_VERTICAL_ALIGNMENT_BASELINE_0100
       * @tc.name       : testARKUI_TEXT_VERTICAL_ALIGNMENT_BASELINE0100
       * @tc.desc       : testing ARKUI_TEXT_VERTICAL_ALIGNMENT_BASELINE interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_TEXT_VERTICAL_ALIGNMENT_BASELINE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_TEXT_VERTICAL_ALIGNMENT_BASELINE0100 start====");
          let result: number = nativerenderndk.TextVerticalAlignmentTest_001();
          console.info(`====>testARKUI_TEXT_VERTICAL_ALIGNMENT_BASELINE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_TEXT_VERTICAL_ALIGNMENT_BASELINE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })
    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_TEXT_VERTICAL_ALIGNMENT_BOTTOM_0100
       * @tc.name       : testARKUI_TEXT_VERTICAL_ALIGNMENT_BOTTOM0100
       * @tc.desc       : testing ARKUI_TEXT_VERTICAL_ALIGNMENT_BOTTOM interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_TEXT_VERTICAL_ALIGNMENT_BOTTOM0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_TEXT_VERTICAL_ALIGNMENT_BOTTOM0100 start====");
          let result: number = nativerenderndk.TextVerticalAlignmentTest_002();
          console.info(`====>testARKUI_TEXT_VERTICAL_ALIGNMENT_BOTTOM0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_TEXT_VERTICAL_ALIGNMENT_BOTTOM0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_TEXT_VERTICAL_ALIGNMENT_CENTER_0100
       * @tc.name       : testARKUI_TEXT_VERTICAL_ALIGNMENT_CENTER0100
       * @tc.desc       : testing ARKUI_TEXT_VERTICAL_ALIGNMENT_CENTER interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_TEXT_VERTICAL_ALIGNMENT_CENTER0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_TEXT_VERTICAL_ALIGNMENT_CENTER0100 start====");
          let result: number = nativerenderndk.TextVerticalAlignmentTest_003();
          console.info(`====>testARKUI_TEXT_VERTICAL_ALIGNMENT_CENTER0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_TEXT_VERTICAL_ALIGNMENT_CENTER0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })
    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_TEXT_VERTICAL_ALIGNMENT_TOP_0100
       * @tc.name       : testARKUI_TEXT_VERTICAL_ALIGNMENT_TOP0100
       * @tc.desc       : testing ARKUI_TEXT_VERTICAL_ALIGNMENT_TOP interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_TEXT_VERTICAL_ALIGNMENT_TOP0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_TEXT_VERTICAL_ALIGNMENT_TOP0100 start====");
          let result: number = nativerenderndk.TextVerticalAlignmentTest_004();
          console.info(`====>testARKUI_TEXT_VERTICAL_ALIGNMENT_TOP0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_TEXT_VERTICAL_ALIGNMENT_TOP0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_TEXTINPUT_TYPE_ONE_TIME_CODE_0100
       * @tc.name       : testARKUI_TEXTINPUT_TYPE_ONE_TIME_CODE0100
       * @tc.desc       : testing ARKUI_TEXTINPUT_TYPE_ONE_TIME_CODE interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_TEXTINPUT_TYPE_ONE_TIME_CODE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_TEXTINPUT_TYPE_ONE_TIME_CODE0100 start====");
          let result: number = nativerenderndk.TextInputTypeTest_001();
          console.info(`====>testARKUI_TEXTINPUT_TYPE_ONE_TIME_CODE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_TEXTINPUT_TYPE_ONE_TIME_CODE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_TEXTAREA_TYPE_ONE_TIME_CODE_0100
       * @tc.name       : testARKUI_TEXTAREA_TYPE_ONE_TIME_CODE0100
       * @tc.desc       : testing ARKUI_TEXTAREA_TYPE_ONE_TIME_CODE  interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_TEXTAREA_TYPE_ONE_TIME_CODE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_TEXTAREA_TYPE_ONE_TIME_CODE0100 start====");
          let result: number = nativerenderndk.TextAreaTypeTest_001();
          console.info(`====>testARKUI_TEXTAREA_TYPE_ONE_TIME_CODE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_TEXTAREA_TYPE_ONE_TIME_CODE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_TEXT_COPY_OPTIONS_NONE_0100
       * @tc.name       : testARKUI_TEXT_COPY_OPTIONS_NONE0100
       * @tc.desc       : testing ARKUI_TEXT_COPY_OPTIONS_NONE interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_TEXT_COPY_OPTIONS_NONE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_TEXT_COPY_OPTIONS_NONE0100 start====");
          let result: number = nativerenderndk.TextCopyOptionsTest_001();
          console.info(`====>testARKUI_TEXT_COPY_OPTIONS_NONE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_TEXT_COPY_OPTIONS_NONE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_TEXT_COPY_OPTIONS_IN_APP_0100
       * @tc.name       : testARKUI_TEXT_COPY_OPTIONS_IN_APP0100
       * @tc.desc       : testing ARKUI_TEXT_COPY_OPTIONS_IN_APP interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_TEXT_COPY_OPTIONS_IN_APP0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_TEXT_COPY_OPTIONS_IN_APP0100 start====");
          let result: number = nativerenderndk.TextCopyOptionsTest_002();
          console.info(`====>testARKUI_TEXT_COPY_OPTIONS_IN_APP0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_TEXT_COPY_OPTIONS_IN_APP0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_TEXT_COPY_OPTIONS_LOCAL_DEVICE_0100
       * @tc.name       : testARKUI_TEXT_COPY_OPTIONS_LOCAL_DEVICE0100
       * @tc.desc       : testing ARKUI_TEXT_COPY_OPTIONS_LOCAL_DEVICE interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_TEXT_COPY_OPTIONS_LOCAL_DEVICE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_TEXT_COPY_OPTIONS_LOCAL_DEVICE0100 start====");
          let result: number = nativerenderndk.TextCopyOptionsTest_003();
          console.info(`====>testARKUI_TEXT_COPY_OPTIONS_LOCAL_DEVICE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_TEXT_COPY_OPTIONS_LOCAL_DEVICE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_TEXT_COPY_OPTIONS_CROSS_DEVICE_0100
       * @tc.name       : testARKUI_TEXT_COPY_OPTIONS_CROSS_DEVICE0100
       * @tc.desc       : testing ARKUI_TEXT_COPY_OPTIONS_CROSS_DEVICE interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_TEXT_COPY_OPTIONS_CROSS_DEVICE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_TEXT_COPY_OPTIONS_CROSS_DEVICE0100 start====");
          let result: number = nativerenderndk.TextCopyOptionsTest_004();
          console.info(`====>testARKUI_TEXT_COPY_OPTIONS_CROSS_DEVICE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_TEXT_COPY_OPTIONS_CROSS_DEVICE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_FOCUS_WRAP_MODE_DEFAULT_0100
       * @tc.name       : testARKUI_FOCUS_WRAP_MODE_DEFAULT0100
       * @tc.desc       : testing ARKUI_FOCUS_WRAP_MODE_DEFAULT interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_FOCUS_WRAP_MODE_DEFAULT0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_FOCUS_WRAP_MODE_DEFAULT0100 start====");
          let result: number = nativerenderndk.FocusWrapModeTest_001();
          console.info(`====>testARKUI_FOCUS_WRAP_MODE_DEFAULT0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_FOCUS_WRAP_MODE_DEFAULT0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_FOCUS_WRAP_WITH_ARROW_0100
       * @tc.name       : testARKUI_FOCUS_WRAP_WITH_ARROW0100
       * @tc.desc       : testing ARKUI_FOCUS_WRAP_WITH_ARROW interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_FOCUS_WRAP_WITH_ARROW0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_FOCUS_WRAP_WITH_ARROW0100 start====");
          let result: number = nativerenderndk.FocusWrapModeTest_002();
          console.info(`====>testARKUI_FOCUS_WRAP_WITH_ARROW0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_FOCUS_WRAP_WITH_ARROW0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

   /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_CONTENT_CLIP_MODE_CONTENT_ONLY_0100
       * @tc.name       : testARKUI_CONTENT_CLIP_MODE_CONTENT_ONLY0100
       * @tc.desc       : testing ARKUI_CONTENT_CLIP_MODE_CONTENT_ONLY interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_CONTENT_CLIP_MODE_CONTENT_ONLY0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_CONTENT_CLIP_MODE_CONTENT_ONLY0100 start====");
          let result: number = nativerenderndk.ContentClipModeTest_001();
          console.info(`====>testARKUI_CONTENT_CLIP_MODE_CONTENT_ONLY0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_CONTENT_CLIP_MODE_CONTENT_ONLY0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_CONTENT_CLIP_MODE_BOUNDARY_0100
       * @tc.name       : testARKUI_CONTENT_CLIP_MODE_BOUNDARY0100
       * @tc.desc       : testing ARKUI_CONTENT_CLIP_MODE_BOUNDARY interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_CONTENT_CLIP_MODE_BOUNDARY0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_CONTENT_CLIP_MODE_BOUNDARY0100 start====");
          let result: number = nativerenderndk.ContentClipModeTest_002();
          console.info(`====>testARKUI_CONTENT_CLIP_MODE_BOUNDARY0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_CONTENT_CLIP_MODE_BOUNDARY0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_CONTENT_CLIP_MODE_SAFE_AREA_0100
       * @tc.name       : testARKUI_CONTENT_CLIP_MODE_SAFE_AREA0100
       * @tc.desc       : testing ARKUI_CONTENT_CLIP_MODE_SAFE_AREA interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_CONTENT_CLIP_MODE_SAFE_AREA0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_CONTENT_CLIP_MODE_SAFE_AREA0100 start====");
          let result: number = nativerenderndk.ContentClipModeTest_003();
          console.info(`====>testARKUI_CONTENT_CLIP_MODE_SAFE_AREA0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_CONTENT_CLIP_MODE_SAFE_AREA0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_WATER_FLOW_LAYOUT_MODE_ALWAYS_TOP_DOWN_0100
       * @tc.name       : testARKUI_WATER_FLOW_LAYOUT_MODE_ALWAYS_TOP_DOWN0100
       * @tc.desc       : testing ARKUI_WATER_FLOW_LAYOUT_MODE_ALWAYS_TOP_DOWN interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_WATER_FLOW_LAYOUT_MODE_ALWAYS_TOP_DOWN0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_WATER_FLOW_LAYOUT_MODE_ALWAYS_TOP_DOWN0100 start====");
          let result: number = nativerenderndk.WaterFlowLayoutModeTest_001();
          console.info(`====>testARKUI_WATER_FLOW_LAYOUT_MODE_ALWAYS_TOP_DOWN0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_WATER_FLOW_LAYOUT_MODE_ALWAYS_TOP_DOWN0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_WATER_FLOW_LAYOUT_MODE_SLIDING_WINDOW_0100
       * @tc.name       : testARKUI_WATER_FLOW_LAYOUT_MODE_SLIDING_WINDOW0100
       * @tc.desc       : testing ARKUI_WATER_FLOW_LAYOUT_MODE_SLIDING_WINDOW interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_WATER_FLOW_LAYOUT_MODE_SLIDING_WINDOW0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_WATER_FLOW_LAYOUT_MODE_SLIDING_WINDOW0100 start====");
          let result: number = nativerenderndk.WaterFlowLayoutModeTest_002();
          console.info(`====>testARKUI_WATER_FLOW_LAYOUT_MODE_SLIDING_WINDOW0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_WATER_FLOW_LAYOUT_MODE_SLIDING_WINDOW0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_HIT_TEST_MODE_BLOCK_HIERARCHY_0100
       * @tc.name       : testARKUI_HIT_TEST_MODE_BLOCK_HIERARCHY0100
       * @tc.desc       : testing ARKUI_HIT_TEST_MODE_BLOCK_HIERARCHY interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_HIT_TEST_MODE_BLOCK_HIERARCHY0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_HIT_TEST_MODE_BLOCK_HIERARCHY0100 start====");
          let result: number = nativerenderndk.HitTestModeTest_001();
          console.info(`====>testARKUI_HIT_TEST_MODE_BLOCK_HIERARCHY0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_HIT_TEST_MODE_BLOCK_HIERARCHY0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_HIT_TEST_MODE_BLOCK_DESCENDANTS_0100
       * @tc.name       : testARKUI_HIT_TEST_MODE_BLOCK_DESCENDANTS0100
       * @tc.desc       : testing ARKUI_HIT_TEST_MODE_BLOCK_DESCENDANTS interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_HIT_TEST_MODE_BLOCK_DESCENDANTS0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_HIT_TEST_MODE_BLOCK_DESCENDANTS0100 start====");
          let result: number = nativerenderndk.HitTestModeTest_002();
          console.info(`====>testARKUI_HIT_TEST_MODE_BLOCK_DESCENDANTS0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_HIT_TEST_MODE_BLOCK_DESCENDANTS0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_PAGE_FLIP_MODE_CONTINUOUS_0100
       * @tc.name       : testARKUI_PAGE_FLIP_MODE_CONTINUOUS0100
       * @tc.desc       : testing ARKUI_PAGE_FLIP_MODE_CONTINUOUS interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_PAGE_FLIP_MODE_CONTINUOUS0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_PAGE_FLIP_MODE_CONTINUOUS0100 start====");
          let result: number = nativerenderndk.PageFlipModeTest_001();
          console.info(`====>testARKUI_PAGE_FLIP_MODE_CONTINUOUS0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_PAGE_FLIP_MODE_CONTINUOUS0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_PAGE_FLIP_MODE_SINGLE_0100
       * @tc.name       : testARKUI_PAGE_FLIP_MODE_SINGLE0100
       * @tc.desc       : testing ARKUI_PAGE_FLIP_MODE_SINGLE interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_PAGE_FLIP_MODE_SINGLE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_PAGE_FLIP_MODE_SINGLE0100 start====");
          let result: number = nativerenderndk.PageFlipModeTest_002();
          console.info(`====>testARKUI_PAGE_FLIP_MODE_SINGLE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_PAGE_FLIP_MODE_SINGLE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_SWIPER_NO_ANIMATION_0100
       * @tc.name       : testARKUI_SWIPER_NO_ANIMATION0100
       * @tc.desc       : testing ARKUI_SWIPER_NO_ANIMATION interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_SWIPER_NO_ANIMATION0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_SWIPER_NO_ANIMATION0100 start====");
          let result: number = nativerenderndk.SwiperAnimationModeTest_001();
          console.info(`====>testARKUI_SWIPER_NO_ANIMATION0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_SWIPER_NO_ANIMATION0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_SWIPER_DEFAULT_ANIMATION_0100
       * @tc.name       : testARKUI_SWIPER_DEFAULT_ANIMATION0100
       * @tc.desc       : testing ARKUI_SWIPER_DEFAULT_ANIMATION interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_SWIPER_DEFAULT_ANIMATION0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_SWIPER_DEFAULT_ANIMATION0100 start====");
          let result: number = nativerenderndk.SwiperAnimationModeTest_002();
          console.info(`====>testARKUI_SWIPER_DEFAULT_ANIMATION0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_SWIPER_DEFAULT_ANIMATION0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_SWIPER_FAST_ANIMATION_0100
       * @tc.name       : testARKUI_SWIPER_FAST_ANIMATION0100
       * @tc.desc       : testing ARKUI_SWIPER_FAST_ANIMATION interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_SWIPER_FAST_ANIMATION0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_SWIPER_FAST_ANIMATION0100 start====");
          let result: number = nativerenderndk.SwiperAnimationModeTest_003();
          console.info(`====>testARKUI_SWIPER_FAST_ANIMATION0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_SWIPER_FAST_ANIMATION0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_IMAGE_SPAN_ALIGNMENT_FOLLOW_PARAGRAPH_0100
       * @tc.name       : testARKUI_IMAGE_SPAN_ALIGNMENT_FOLLOW_PARAGRAPH0100
       * @tc.desc       : testing ARKUI_IMAGE_SPAN_ALIGNMENT_FOLLOW_PARAGRAPH interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_IMAGE_SPAN_ALIGNMENT_FOLLOW_PARAGRAPH0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_IMAGE_SPAN_ALIGNMENT_FOLLOW_PARAGRAPH0100 start====");
          let result: number = nativerenderndk.ImageSpanAlignmentTest_001();
          console.info(`====>testARKUI_IMAGE_SPAN_ALIGNMENT_FOLLOW_PARAGRAPH0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_IMAGE_SPAN_ALIGNMENT_FOLLOW_PARAGRAPH0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_BUTTON_ROUNDED_RECTANGLE_0100
       * @tc.name       : testARKUI_BUTTON_ROUNDED_RECTANGLE0100
       * @tc.desc       : testing ARKUI_BUTTON_ROUNDED_RECTANGLE interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_BUTTON_ROUNDED_RECTANGLE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_BUTTON_ROUNDED_RECTANGLE0100 start====");
          let result: number = nativerenderndk.ButtonTypeTest_001();
          console.info(`====>testARKUI_BUTTON_ROUNDED_RECTANGLE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_BUTTON_ROUNDED_RECTANGLE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYBOARD_APPEARANCE_NONE_IMMERSIVE_0100
       * @tc.name       : testARKUI_KEYBOARD_APPEARANCE_NONE_IMMERSIVE0100
       * @tc.desc       : testing ARKUI_KEYBOARD_APPEARANCE_NONE_IMMERSIVE interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_KEYBOARD_APPEARANCE_NONE_IMMERSIVE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_KEYBOARD_APPEARANCE_NONE_IMMERSIVE0100 start====");
          let result: number = nativerenderndk.KeyboardAppearanceTest_001();
          console.info(`====>testARKUI_KEYBOARD_APPEARANCE_NONE_IMMERSIVE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_KEYBOARD_APPEARANCE_NONE_IMMERSIVE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYBOARD_APPEARANCE_IMMERSIVE_0100
       * @tc.name       : testARKUI_KEYBOARD_APPEARANCE_IMMERSIVE0100
       * @tc.desc       : testing ARKUI_KEYBOARD_APPEARANCE_IMMERSIVE interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_KEYBOARD_APPEARANCE_IMMERSIVE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_KEYBOARD_APPEARANCE_IMMERSIVE0100 start====");
          let result: number = nativerenderndk.KeyboardAppearanceTest_002();
          console.info(`====>testARKUI_KEYBOARD_APPEARANCE_IMMERSIVE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_KEYBOARD_APPEARANCE_IMMERSIVE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYBOARD_APPEARANCE_LIGHT_IMMERSIVE_0100
       * @tc.name       : testARKUI_KEYBOARD_APPEARANCE_LIGHT_IMMERSIVE0100
       * @tc.desc       : testing ARKUI_KEYBOARD_APPEARANCE_LIGHT_IMMERSIVE interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_KEYBOARD_APPEARANCE_LIGHT_IMMERSIVE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_KEYBOARD_APPEARANCE_LIGHT_IMMERSIVE0100 start====");
          let result: number = nativerenderndk.KeyboardAppearanceTest_003();
          console.info(`====>testARKUI_KEYBOARD_APPEARANCE_LIGHT_IMMERSIVE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_KEYBOARD_APPEARANCE_LIGHT_IMMERSIVE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYBOARD_APPEARANCE_DARK_IMMERSIVE_0100
       * @tc.name       : testARKUI_KEYBOARD_APPEARANCE_DARK_IMMERSIVE0100
       * @tc.desc       : testing ARKUI_KEYBOARD_APPEARANCE_DARK_IMMERSIVE interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_KEYBOARD_APPEARANCE_DARK_IMMERSIVE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_KEYBOARD_APPEARANCE_DARK_IMMERSIVE0100 start====");
          let result: number = nativerenderndk.KeyboardAppearanceTest_004();
          console.info(`====>testARKUI_KEYBOARD_APPEARANCE_DARK_IMMERSIVE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_KEYBOARD_APPEARANCE_DARK_IMMERSIVE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_SAFE_AREA_TYPE_KEYBOARD_0100
       * @tc.name       : testARKUI_SAFE_AREA_TYPE_KEYBOARD0100
       * @tc.desc       : testing ARKUI_SAFE_AREA_TYPE_KEYBOARD interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_SAFE_AREA_TYPE_KEYBOARD0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_SAFE_AREA_TYPE_KEYBOARD0100 start====");
          let result: number = nativerenderndk.SafeAreaTypeTest_001();
          console.info(`====>testARKUI_SAFE_AREA_TYPE_KEYBOARD0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_SAFE_AREA_TYPE_KEYBOARD0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_SAFE_AREA_EDGE_START_0100
       * @tc.name       : testARKUI_SAFE_AREA_EDGE_START0100
       * @tc.desc       : testing ARKUI_SAFE_AREA_EDGE_START interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_SAFE_AREA_EDGE_START0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_SAFE_AREA_EDGE_START0100 start====");
          let result: number = nativerenderndk.SafeAreaEdgeTest_001();
          console.info(`====>testARKUI_SAFE_AREA_EDGE_START0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_SAFE_AREA_EDGE_START0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_SAFE_AREA_EDGE_END_0100
       * @tc.name       : testARKUI_SAFE_AREA_EDGE_END0100
       * @tc.desc       : testing ARKUI_SAFE_AREA_EDGE_END interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_SAFE_AREA_EDGE_END0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_SAFE_AREA_EDGE_END0100 start====");
          let result: number = nativerenderndk.SafeAreaEdgeTest_002();
          console.info(`====>testARKUI_SAFE_AREA_EDGE_END0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_SAFE_AREA_EDGE_END0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_BLUR_STYLE_ACTIVE_POLICY_FOLLOWS_WINDOW_ACTIVE_STATE_0100
       * @tc.name       : testARKUI_BLUR_STYLE_ACTIVE_POLICY_FOLLOWS_WINDOW_ACTIVE_STATE0100
       * @tc.desc       : testing ARKUI_BLUR_STYLE_ACTIVE_POLICY_FOLLOWS_WINDOW_ACTIVE_STATE interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_BLUR_STYLE_ACTIVE_POLICY_FOLLOWS_WINDOW_ACTIVE_STATE0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testARKUI_BLUR_STYLE_ACTIVE_POLICY_FOLLOWS_WINDOW_ACTIVE_STATE0100 start====");
          let result: number = nativerenderndk.BlurStyleActivePolicyTest_001();
          console.info(`====>testARKUI_BLUR_STYLE_ACTIVE_POLICY_FOLLOWS_WINDOW_ACTIVE_STATE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_BLUR_STYLE_ACTIVE_POLICY_FOLLOWS_WINDOW_ACTIVE_STATE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_BLUR_STYLE_ACTIVE_POLICY_ALWAYS_INACTIVE_0100
       * @tc.name       : testARKUI_BLUR_STYLE_ACTIVE_POLICY_ALWAYS_INACTIVE0100
       * @tc.desc       : testing ARKUI_BLUR_STYLE_ACTIVE_POLICY_ALWAYS_INACTIVE interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_BLUR_STYLE_ACTIVE_POLICY_ALWAYS_INACTIVE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_BLUR_STYLE_ACTIVE_POLICY_ALWAYS_INACTIVE0100 start====");
          let result: number = nativerenderndk.BlurStyleActivePolicyTest_002();
          console.info(`====>testARKUI_BLUR_STYLE_ACTIVE_POLICY_ALWAYS_INACTIVE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_BLUR_STYLE_ACTIVE_POLICY_ALWAYS_INACTIVE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_SCROLL_ALIGNMENT_CENTER_0100
       * @tc.name       : testARKUI_SCROLL_ALIGNMENT_CENTER0100
       * @tc.desc       : testing ARKUI_SCROLL_ALIGNMENT_CENTER interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_SCROLL_ALIGNMENT_CENTER0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_SCROLL_ALIGNMENT_CENTER0100 start====");
          let result: number = nativerenderndk.ScrollAlignmentTest_001();
          console.info(`====>testARKUI_SCROLL_ALIGNMENT_CENTER0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_SCROLL_ALIGNMENT_CENTER0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_SCROLL_ALIGNMENT_END_0100
       * @tc.name       : testARKUI_SCROLL_ALIGNMENT_END0100
       * @tc.desc       : testing ARKUI_SCROLL_ALIGNMENT_END interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_SCROLL_ALIGNMENT_END0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_SCROLL_ALIGNMENT_END0100 start====");
          let result: number = nativerenderndk.ScrollAlignmentTest_002();
          console.info(`====>testARKUI_SCROLL_ALIGNMENT_END0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_SCROLL_ALIGNMENT_END0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_SCROLL_ALIGNMENT_AUTO_0100
       * @tc.name       : testARKUI_SCROLL_ALIGNMENT_AUTO0100
       * @tc.desc       : testing ARKUI_SCROLL_ALIGNMENT_AUTO interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_SCROLL_ALIGNMENT_AUTO0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_SCROLL_ALIGNMENT_AUTO0100 start====");
          let result: number = nativerenderndk.ScrollAlignmentTest_003();
          console.info(`====>testARKUI_SCROLL_ALIGNMENT_AUTO0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_SCROLL_ALIGNMENT_AUTO0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_EFFECT_EDGE_START_0100
       * @tc.name       : testARKUI_EFFECT_EDGE_START0100
       * @tc.desc       : testing ARKUI_EFFECT_EDGE_START interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_EFFECT_EDGE_START0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_EFFECT_EDGE_START0100 start====");
          let result: number = nativerenderndk.EffectEdgeTest_001();
          console.info(`====>testARKUI_EFFECT_EDGE_START0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_EFFECT_EDGE_START0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_ARKUI_EFFECT_EDGE_END_0100
       * @tc.name       : testARKUI_EFFECT_EDGE_END0100
       * @tc.desc       : testing ARKUI_EFFECT_EDGE_END interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testARKUI_EFFECT_EDGE_END0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_EFFECT_EDGE_END0100 start====");
          let result: number = nativerenderndk.EffectEdgeTest_002();
          console.info(`====>testARKUI_EFFECT_EDGE_END0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_EFFECT_EDGE_END0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

  })
}
