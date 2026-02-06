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
import mindsporendk from 'libmindsporendk.so'

const ARKUI_ERROR_CODE_NO_ERROR = 0;
const ARKUI_ERROR_CODE_ERROR = 1;

export default function MindSporeFormatTest() {
  describe('MindSporeFormatTest', () => {
    beforeAll(async (done: Function) => {
    });
    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_FORMAT_NCHW_0100
       * @tc.name       : testformattest_001
       * @tc.desc       : testing OH_AI_FORMAT_NCHW interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testformattest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testformattest_001 start====");
          let result: number = mindsporendk.FormatTest_001();
          console.info(`====>testformattest_001 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testformattest_001 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_FORMAT_NHWC4_0100
       * @tc.name       : testformattest_002
       * @tc.desc       : testing OH_AI_FORMAT_NHWC4 interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testformattest_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testformattest_002 start====");
          let result: number = mindsporendk.FormatTest_002();
          console.info(`====>testformattest_002 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testformattest_002 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_FORMAT_HWCK_0100
       * @tc.name       : testformattest_003
       * @tc.desc       : testing OH_AI_FORMAT_HWCK interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testformattest_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testformattest_003 start====");
          let result: number = mindsporendk.FormatTest_003();
          console.info(`====>testformattest_003 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testformattest_003 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_FORMAT_KCHW_0100
       * @tc.name       : testformattest_004
       * @tc.desc       : testing OH_AI_FORMAT_KCHW interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testformattest_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testformattest_004 start====");
          let result: number = mindsporendk.FormatTest_004();
          console.info(`====>testformattest_004 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testformattest_004 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_FORMAT_CKHW_0100
       * @tc.name       : testformattest_005
       * @tc.desc       : testing OH_AI_FORMAT_CKHW interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testformattest_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testformattest_005 start====");
          let result: number = mindsporendk.FormatTest_005();
          console.info(`====>testformattest_005 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testformattest_005 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_FORMAT_KHWC_0100
       * @tc.name       : testformattest_006
       * @tc.desc       : testing OH_AI_FORMAT_KHWC interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testformattest_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testformattest_006 start====");
          let result: number = mindsporendk.FormatTest_006();
          console.info(`====>testformattest_006 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testformattest_006 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_FORMAT_CHWK_0100
       * @tc.name       : testformattest_007
       * @tc.desc       : testing OH_AI_FORMAT_CHWK interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testformattest_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testformattest_007 start====");
          let result: number = mindsporendk.FormatTest_007();
          console.info(`====>testformattest_007 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testformattest_007 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_FORMAT_HW_0100
       * @tc.name       : testformattest_008
       * @tc.desc       : testing OH_AI_FORMAT_HW interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testformattest_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testformattest_008 start====");
          let result: number = mindsporendk.FormatTest_008();
          console.info(`====>testformattest_008 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testformattest_008 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_FORMAT_HW4_0100
       * @tc.name       : testformattest_009
       * @tc.desc       : testing OH_AI_FORMAT_HW4 interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testformattest_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testformattest_009 start====");
          let result: number = mindsporendk.FormatTest_009();
          console.info(`====>testformattest_009 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testformattest_009 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_FORMAT_NC_0100
       * @tc.name       : testformattest_010
       * @tc.desc       : testing OH_AI_FORMAT_NC interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testformattest_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testformattest_010 start====");
          let result: number = mindsporendk.FormatTest_010();
          console.info(`====>testformattest_010 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testformattest_010 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_FORMAT_NC4_0100
       * @tc.name       : testformattest_011
       * @tc.desc       : testing OH_AI_FORMAT_NC4 interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testformattest_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testformattest_011 start====");
          let result: number = mindsporendk.FormatTest_011();
          console.info(`====>testformattest_011 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testformattest_011 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_FORMAT_NC4HW4_0100
       * @tc.name       : testformattest_012
       * @tc.desc       : testing OH_AI_FORMAT_NC4HW4 interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testformattest_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testformattest_012 start====");
          let result: number = mindsporendk.FormatTest_012();
          console.info(`====>testformattest_012 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testformattest_012 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_FORMAT_NCDHW_0100
       * @tc.name       : testformattest_013
       * @tc.desc       : testing OH_AI_FORMAT_NCDHW interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testformattest_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testformattest_013 start====");
          let result: number = mindsporendk.FormatTest_013();
          console.info(`====>testformattest_013 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testformattest_013 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_FORMAT_NWC_0100
       * @tc.name       : testformattest_014
       * @tc.desc       : testing OH_AI_FORMAT_NWC interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testformattest_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testformattest_014 start====");
          let result: number = mindsporendk.FormatTest_014();
          console.info(`====>testformattest_014 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testformattest_014 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_FORMAT_NCW_0100
       * @tc.name       : testformattest_015
       * @tc.desc       : testing OH_AI_FORMAT_NCW interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testformattest_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testformattest_015 start====");
          let result: number = mindsporendk.FormatTest_015();
          console.info(`====>testformattest_015 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testformattest_015 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })
  })
}
