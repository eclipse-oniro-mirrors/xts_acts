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
const ARKUI_ERROR_CODE_PARAM_INVALID = 401;
const ARKUI_ERROR_CODE_GET_INFO_FAILED = 106201;
const ARKUI_ERROR_CODE_BUFFER_SIZE_ERROR = 106202;
const ARKUI_ERROR_CODE_NODE_INDEX_INVALID = 106200;

export default function NavigationTest() {
  describe('NavigationTest', () => {
    beforeAll(async (done: Function) => {
      await Utils.pushPage(`nodenapitest/navigationTest`, done);
    });
    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavigationId_0100
       * @tc.name       : testOHArkUIGetNavigationId0100
       * @tc.desc       : testing OH_ArkUI_GetNavigationId interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetNavigationId0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavigationId0100 start====");
          let result: number = nativerenderndk.GetNavigationIdTest_001();
          console.info(`====>testOHArkUIGetNavigationId0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavigationId0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavigationId_0200
       * @tc.name       : testOHArkUIGetNavigationId0200
       * @tc.desc       : testing OH_ArkUI_GetNavigationId interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetNavigationId0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavigationId0200 start====");
          let result: number = nativerenderndk.GetNavigationIdTest_002();
          console.info(`====>testOHArkUIGetNavigationId0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavigationId0200 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavigationId_0300
       * @tc.name       : testOHArkUIGetNavigationId0300
       * @tc.desc       : testing OH_ArkUI_GetNavigationId interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetNavigationId0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavigationId0300 start====");
          let result: number = nativerenderndk.GetNavigationIdTest_003();
          console.info(`====>testOHArkUIGetNavigationId0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavigationId0300 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
     * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavigationId_0400
     * @tc.name       : testOHArkUIGetNavigationId0400
     * @tc.desc       : testing OH_ArkUI_GetNavigationId interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
   */
    it('testOHArkUIGetNavigationId0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavigationId0400 start====");
          let result: number = nativerenderndk.GetNavigationIdTest_004();
          console.info(`====>testOHArkUIGetNavigationId0400 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR );
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavigationId0400 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavigationId_0500
       * @tc.name       : testOHArkUIGetNavigationId0500
       * @tc.desc       : testing OH_ArkUI_GetNavigationId interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetNavigationId0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavigationId0500 start====");
          let result: number = nativerenderndk.GetNavigationIdTest_005();
          console.info(`====>testOHArkUIGetNavigationId0500 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavigationId0500 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavigationId_0600
       * @tc.name       : testOHArkUIGetNavigationId0600
       * @tc.desc       : testing OH_ArkUI_GetNavigationId interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetNavigationId0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavigationId0600 start====");
          let result: number = nativerenderndk.GetNavigationIdTest_006();
          console.info(`====>testOHArkUIGetNavigationId0600 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR );
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavigationId0600 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })
    /*
   * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavDestinationName_0100
   * @tc.name       : testOHArkUIGetNavDestinationName0100
   * @tc.desc       : testing OH_ArkUI_GetNavDestinationName interface
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 1
   */
    it('testOHArkUIGetNavDestinationName0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavDestinationName0100 start====");
          let result: number = nativerenderndk.GetNavDestinationNameTest_001();
          console.info(`====>testOHArkUIGetNavDestinationName0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavDestinationName0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavDestinationName_0200
       * @tc.name       : testOHArkUIGetNavDestinationName0200
       * @tc.desc       : testing OH_ArkUI_GetNavDestinationName interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetNavDestinationName0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavDestinationName0200 start====");
          let result: number = nativerenderndk.GetNavDestinationNameTest_002();
          console.info(`====>testOHArkUIGetNavDestinationName0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavDestinationName0200 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavDestinationName_0300
       * @tc.name       : testOHArkUIGetNavDestinationName0300
       * @tc.desc       : testing OH_ArkUI_GetNavDestinationName interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetNavDestinationName0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavDestinationName0300 start====");
          let result: number = nativerenderndk.GetNavDestinationNameTest_003();
          console.info(`====>testOHArkUIGetNavDestinationName0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavDestinationName0300 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavDestinationName_0400
       * @tc.name       : testOHArkUIGetNavDestinationName0400
       * @tc.desc       : testing OH_ArkUI_GetNavDestinationName interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetNavDestinationName0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavDestinationName0400 start====");
          let result: number = nativerenderndk.GetNavDestinationNameTest_004();
          console.info(`====>testOHArkUIGetNavDestinationName0400 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavDestinationName0400 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavDestinationName_0500
       * @tc.name       : testOHArkUIGetNavDestinationName0500
       * @tc.desc       : testing OH_ArkUI_GetNavDestinationName interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetNavDestinationName0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavDestinationName0500 start====");
          let result: number = nativerenderndk.GetNavDestinationNameTest_005();
          console.info(`====>testOHArkUIGetNavDestinationName0500 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavDestinationName0500 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavDestinationName_0600
       * @tc.name       : testOHArkUIGetNavDestinationName0600
       * @tc.desc       : testing OH_ArkUI_GetNavDestinationName interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetNavDestinationName0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavDestinationName0600 start====");
          let result: number = nativerenderndk.GetNavDestinationNameTest_006();
          console.info(`====>testOHArkUIGetNavDestinationName0600 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavDestinationName0600 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
    * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavStackLength_0100
    * @tc.name       : testOHArkUIGetNavStackLength0100
    * @tc.desc       : testing OH_ArkUI_GetNavStackLength interface
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOHArkUIGetNavStackLength0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavStackLength0100 start====");
          let result: number = nativerenderndk.GetNavStackLengthTest_001();
          console.info(`====>testOHArkUIGetNavStackLength0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavStackLength0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavStackLength_0200
       * @tc.name       : testOHArkUIGetNavStackLength0200
       * @tc.desc       : testing OH_ArkUI_GetNavStackLength interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetNavStackLength0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavStackLength0200 start====");
          let result: number = nativerenderndk.GetNavStackLengthTest_002();
          console.info(`====>testOHArkUIGetNavStackLength0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavStackLength0200 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavStackLength_0300
       * @tc.name       : testOHArkUIGetNavStackLength0300
       * @tc.desc       : testing OH_ArkUI_GetNavStackLength interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetNavStackLength0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavStackLength0300 start====");
          let result: number = nativerenderndk.GetNavStackLengthTest_003();
          console.info(`====>testOHArkUIGetNavStackLength0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavStackLength0300 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavDestinationNameByIndex_0100
       * @tc.name       : testOHArkUIGetNavDestinationNameByIndex0100
       * @tc.desc       : testing OH_ArkUI_GetNavDestinationNameByIndex interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetNavDestinationNameByIndex0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavDestinationNameByIndex0100 start====");
          let result: number = nativerenderndk.GetNavDestinationNameByIndexTest_001();
          console.info(`====>testOHArkUIGetNavDestinationNameByIndex0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavDestinationNameByIndex0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavDestinationNameByIndex_0200
       * @tc.name       : testOHArkUIGetNavDestinationNameByIndex0200
       * @tc.desc       : testing OH_ArkUI_GetNavDestinationNameByIndex interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetNavDestinationNameByIndex0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavDestinationNameByIndex0200 start====");
          let result: number = nativerenderndk.GetNavDestinationNameByIndexTest_002();
          console.info(`====>testOHArkUIGetNavDestinationNameByIndex0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavDestinationNameByIndex0200 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavDestinationNameByIndex_0300
       * @tc.name       : testOHArkUIGetNavDestinationNameByIndex0300
       * @tc.desc       : testing OH_ArkUI_GetNavDestinationNameByIndex interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetNavDestinationNameByIndex0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavDestinationNameByIndex0300 start====");
          let result: number = nativerenderndk.GetNavDestinationNameByIndexTest_003();
          console.info(`====>testOHArkUIGetNavDestinationNameByIndex0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavDestinationNameByIndex0300 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavDestinationNameByIndex_0400
       * @tc.name       : testOHArkUIGetNavDestinationNameByIndex0400
       * @tc.desc       : testing OH_ArkUI_GetNavDestinationNameByIndex interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetNavDestinationNameByIndex0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavDestinationNameByIndex0400 start====");
          let result: number = nativerenderndk.GetNavDestinationNameByIndexTest_004();
          console.info(`====>testOHArkUIGetNavDestinationNameByIndex0400 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavDestinationNameByIndex0400 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavDestinationNameByIndex_0500
       * @tc.name       : testOHArkUIGetNavDestinationNameByIndex0500
       * @tc.desc       : testing OH_ArkUI_GetNavDestinationNameByIndex interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetNavDestinationNameByIndex0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavDestinationNameByIndex0500 start====");
          let result: number = nativerenderndk.GetNavDestinationNameByIndexTest_005();
          console.info(`====>testOHArkUIGetNavDestinationNameByIndex0500 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavDestinationNameByIndex0500 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavDestinationNameByIndex_0600
       * @tc.name       : testOHArkUIGetNavDestinationNameByIndex0600
       * @tc.desc       : testing OH_ArkUI_GetNavDestinationNameByIndex interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetNavDestinationNameByIndex0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavDestinationNameByIndex0600 start====");
          let result: number = nativerenderndk.GetNavDestinationNameByIndexTest_006();
          console.info(`====>testOHArkUIGetNavDestinationNameByIndex0600 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavDestinationNameByIndex0600 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavDestinationNameByIndex_0700
       * @tc.name       : testOHArkUIGetNavDestinationNameByIndex0700
       * @tc.desc       : testing OH_ArkUI_GetNavDestinationNameByIndex interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetNavDestinationNameByIndex0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavDestinationNameByIndex0700 start====");
          let result: number = nativerenderndk.GetNavDestinationNameByIndexTest_007();
          console.info(`====>testOHArkUIGetNavDestinationNameByIndex0700 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavDestinationNameByIndex0700 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
   * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavDestinationId_0100
   * @tc.name       : testOHArkUIGetNavDestinationId0100
   * @tc.desc       : testing OH_ArkUI_GetNavDestinationId interface
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 1
   */
    it('testOHArkUIGetNavDestinationId0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavDestinationId0100 start====");
          let result: number = nativerenderndk.GetNavDestinationIdTest_001();
          console.info(`====>testOHArkUIGetNavDestinationId0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavDestinationId0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavDestinationId_0200
       * @tc.name       : testOHArkUIGetNavDestinationId0200
       * @tc.desc       : testing OH_ArkUI_GetNavDestinationId interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetNavDestinationId0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavDestinationId0200 start====");
          let result: number = nativerenderndk.GetNavDestinationIdTest_002();
          console.info(`====>testOHArkUIGetNavDestinationId0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavDestinationId0200 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavDestinationId_0300
       * @tc.name       : testOHArkUIGetNavDestinationId0300
       * @tc.desc       : testing OH_ArkUI_GetNavDestinationId interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetNavDestinationId0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavDestinationId0300 start====");
          let result: number = nativerenderndk.GetNavDestinationIdTest_003();
          console.info(`====>testOHArkUIGetNavDestinationId0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavDestinationId0300 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavDestinationId_0400
       * @tc.name       : testOHArkUIGetNavDestinationId0400
       * @tc.desc       : testing OH_ArkUI_GetNavDestinationId interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetNavDestinationId0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavDestinationId0400 start====");
          let result: number = nativerenderndk.GetNavDestinationIdTest_004();
          console.info(`====>testOHArkUIGetNavDestinationId0400 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavDestinationId0400 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavDestinationId_0500
       * @tc.name       : testOHArkUIGetNavDestinationId0500
       * @tc.desc       : testing OH_ArkUI_GetNavDestinationId interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetNavDestinationId0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavDestinationId0500 start====");
          let result: number = nativerenderndk.GetNavDestinationIdTest_005();
          console.info(`====>testOHArkUIGetNavDestinationId0500 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavDestinationId0500 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavDestinationId_0600
       * @tc.name       : testOHArkUIGetNavDestinationId0600
       * @tc.desc       : testing OH_ArkUI_GetNavDestinationId interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetNavDestinationId0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavDestinationId0600 start====");
          let result: number = nativerenderndk.GetNavDestinationIdTest_006();
          console.info(`====>testOHArkUIGetNavDestinationId0600 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavDestinationId0600 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavDestinationState_0100
       * @tc.name       : testOHArkUIGetNavDestinationState0100
       * @tc.desc       : testing OH_ArkUI_GetNavDestinationState interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetNavDestinationState0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavDestinationState0100 start====");
          let result: number = nativerenderndk.GetNavDestinationStateTest_001();
          console.info(`====>testOHArkUIGetNavDestinationState0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavDestinationState0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavDestinationState_0200
       * @tc.name       : testOHArkUIGetNavDestinationState0200
       * @tc.desc       : testing OH_ArkUI_GetNavDestinationState interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetNavDestinationState0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavDestinationState0200 start====");
          let result: number = nativerenderndk.GetNavDestinationStateTest_002();
          console.info(`====>testOHArkUIGetNavDestinationState0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavDestinationState0200 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
        * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavDestinationState_0300
        * @tc.name       : testOHArkUIGetNavDestinationState0300
        * @tc.desc       : testing OH_ArkUI_GetNavDestinationState interface
        * @tc.size       : MediumTest
        * @tc.type       : Function
        * @tc.level      : Level 1
        */
    it('testOHArkUIGetNavDestinationState0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavDestinationState0300 start====");
          let result: number = nativerenderndk.GetNavDestinationStateTest_003();
          console.info(`====>testOHArkUIGetNavDestinationState0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavDestinationState0300 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
        * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavDestinationState_0400
        * @tc.name       : testOHArkUIGetNavDestinationState0400
        * @tc.desc       : testing OH_ArkUI_GetNavDestinationState interface
        * @tc.size       : MediumTest
        * @tc.type       : Function
        * @tc.level      : Level 1
        */
    it('testOHArkUIGetNavDestinationState0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavDestinationState0400 start====");
          let result: number = nativerenderndk.GetNavDestinationStateTest_004();
          console.info(`====>testOHArkUIGetNavDestinationState0400 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavDestinationState0400 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
         * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavDestinationIndex_0100
         * @tc.name       : testOHArkUIGetNavDestinationIndex0100
         * @tc.desc       : testing OH_ArkUI_GetNavDestinationIndex interface
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
    it('testOHArkUIGetNavDestinationIndex0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavDestinationIndex0100 start====");
          let result: number = nativerenderndk.GetNavDestinationIndexTest_001();
          console.info(`====>testOHArkUIGetNavDestinationIndex0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavDestinationIndex0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavDestinationIndex_0200
       * @tc.name       : testOHArkUIGetNavDestinationIndex0200
       * @tc.desc       : testing OH_ArkUI_GetNavDestinationIndex interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetNavDestinationIndex0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavDestinationIndex0200 start====");
          let result: number = nativerenderndk.GetNavDestinationIndexTest_002();
          console.info(`====>testOHArkUIGetNavDestinationIndex0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavDestinationIndex0200 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
        * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavDestinationIndex_0300
        * @tc.name       : testOHArkUIGetNavDestinationIndex0300
        * @tc.desc       : testing OH_ArkUI_GetNavDestinationIndex interface
        * @tc.size       : MediumTest
        * @tc.type       : Function
        * @tc.level      : Level 1
        */
    it('testOHArkUIGetNavDestinationIndex0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavDestinationIndex0300 start====");
          let result: number = nativerenderndk.GetNavDestinationIndexTest_003();
          console.info(`====>testOHArkUIGetNavDestinationIndex0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavDestinationIndex0300 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
        * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNavDestinationIndex_0400
        * @tc.name       : testOHArkUIGetNavDestinationIndex0400
        * @tc.desc       : testing OH_ArkUI_GetNavDestinationIndex interface
        * @tc.size       : MediumTest
        * @tc.type       : Function
        * @tc.level      : Level 1
        */
    it('testOHArkUIGetNavDestinationIndex0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNavDestinationIndex0400 start====");
          let result: number = nativerenderndk.GetNavDestinationIndexTest_004();
          console.info(`====>testOHArkUIGetNavDestinationIndex0400 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNavDestinationIndex0400 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })
    /*
      * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetRouterPageIndex_0100
      * @tc.name       : testOHArkUIGetRouterPageIndex0100
      * @tc.desc       : testing OH_ArkUI_GetRouterPageIndex interface
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('testOHArkUIGetRouterPageIndex0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetRouterPageIndex0100 start====");
          let result: number = nativerenderndk.GetRouterPageIndexTest_001();
          console.info(`====>testOHArkUIGetRouterPageIndex0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetRouterPageIndex0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetRouterPageIndex_0200
       * @tc.name       : testOHArkUIGetRouterPageIndex0200
       * @tc.desc       : testing OH_ArkUI_GetRouterPageIndex interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetRouterPageIndex0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetRouterPageIndex0200 start====");
          let result: number = nativerenderndk.GetRouterPageIndexTest_002();
          console.info(`====>testOHArkUIGetRouterPageIndex0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetRouterPageIndex0200 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetRouterPageIndex_0300
       * @tc.name       : testOHArkUIGetRouterPageIndex0300
       * @tc.desc       : testing OH_ArkUI_GetRouterPageIndex interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetRouterPageIndex0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetRouterPageIndex0300 start====");
          let result: number = nativerenderndk.GetRouterPageIndexTest_003();
          console.info(`====>testOHArkUIGetRouterPageIndex0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetRouterPageIndex0300 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetRouterPageIndex_0400
       * @tc.name       : testOHArkUIGetRouterPageIndex0400
       * @tc.desc       : testing OH_ArkUI_GetRouterPageIndex interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetRouterPageIndex0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetRouterPageIndex0400 start====");
          let result: number = nativerenderndk.GetRouterPageIndexTest_004();
          console.info(`====>testOHArkUIGetRouterPageIndex0400 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetRouterPageIndex0400 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
    * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetRouterPageName_0100
    * @tc.name       : testOHArkUIGetRouterPageName0100
    * @tc.desc       : testing OH_ArkUI_GetRouterPageName interface
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOHArkUIGetRouterPageName0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetRouterPageName0100 start====");
          let result: number = nativerenderndk.GetRouterPageNameTest_001();
          console.info(`====>testOHArkUIGetRouterPageName0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetRouterPageName0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetRouterPageName_0200
       * @tc.name       : testOHArkUIGetRouterPageName0200
       * @tc.desc       : testing OH_ArkUI_GetRouterPageName interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetRouterPageName0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetRouterPageName0200 start====");
          let result: number = nativerenderndk.GetRouterPageNameTest_002();
          console.info(`====>testOHArkUIGetRouterPageName0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetRouterPageName0200 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetRouterPageName_0300
       * @tc.name       : testOHArkUIGetRouterPageName0300
       * @tc.desc       : testing OH_ArkUI_GetRouterPageName interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetRouterPageName0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetRouterPageName0300 start====");
          let result: number = nativerenderndk.GetRouterPageNameTest_003();
          console.info(`====>testOHArkUIGetRouterPageName0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetRouterPageName0300 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
    * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetRouterPageName_0400
    * @tc.name       : testOHArkUIGetRouterPageName0400
    * @tc.desc       : testing OH_ArkUI_GetRouterPageName interface
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOHArkUIGetRouterPageName0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetRouterPageName0400 start====");
          let result: number = nativerenderndk.GetRouterPageNameTest_004();
          console.info(`====>testOHArkUIGetRouterPageName0400 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetRouterPageName0400 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetRouterPageName_0500
       * @tc.name       : testOHArkUIGetRouterPageName0500
       * @tc.desc       : testing OH_ArkUI_GetRouterPageName interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetRouterPageName0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetRouterPageName0500 start====");
          let result: number = nativerenderndk.GetRouterPageNameTest_005();
          console.info(`====>testOHArkUIGetRouterPageName0500 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetRouterPageName0500 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetRouterPageName_0600
       * @tc.name       : testOHArkUIGetRouterPageName0600
       * @tc.desc       : testing OH_ArkUI_GetRouterPageName interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetRouterPageName0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetRouterPageName0600 start====");
          let result: number = nativerenderndk.GetRouterPageNameTest_006();
          console.info(`====>testOHArkUIGetRouterPageName0600 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetRouterPageName0600 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetRouterPagePath_0100
       * @tc.name       : testOHArkUIGetRouterPagePath0100
       * @tc.desc       : testing OH_ArkUI_GetRouterPagePath interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetRouterPagePath0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetRouterPagePath0100 start====");
          let result: number = nativerenderndk.GetRouterPagePathTest_001();
          console.info(`====>testOHArkUIGetRouterPagePath0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetRouterPagePath0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetRouterPagePath_0200
       * @tc.name       : testOHArkUIGetRouterPagePath0200
       * @tc.desc       : testing OH_ArkUI_GetRouterPagePath interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetRouterPagePath0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetRouterPagePath0200 start====");
          let result: number = nativerenderndk.GetRouterPagePathTest_002();
          console.info(`====>testOHArkUIGetRouterPagePath0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetRouterPagePath0200 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetRouterPagePath_0300
       * @tc.name       : testOHArkUIGetRouterPagePath0300
       * @tc.desc       : testing OH_ArkUI_GetRouterPagePath interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetRouterPagePath0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetRouterPagePath0300 start====");
          let result: number = nativerenderndk.GetRouterPagePathTest_003();
          console.info(`====>testOHArkUIGetRouterPagePath0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetRouterPagePath0300 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetRouterPagePath_0400
       * @tc.name       : testOHArkUIGetRouterPagePath0400
       * @tc.desc       : testing OH_ArkUI_GetRouterPagePath interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetRouterPagePath0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetRouterPagePath0400 start====");
          let result: number = nativerenderndk.GetRouterPagePathTest_004();
          console.info(`====>testOHArkUIGetRouterPagePath0400 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetRouterPagePath0400 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetRouterPagePath_0500
       * @tc.name       : testOHArkUIGetRouterPagePath0500
       * @tc.desc       : testing OH_ArkUI_GetRouterPagePath interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetRouterPagePath0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetRouterPagePath0500 start====");
          let result: number = nativerenderndk.GetRouterPagePathTest_005();
          console.info(`====>testOHArkUIGetRouterPagePath0500 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetRouterPagePath0500 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetRouterPagePath_0600
       * @tc.name       : testOHArkUIGetRouterPagePath0600
       * @tc.desc       : testing OH_ArkUI_GetRouterPagePath interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetRouterPagePath0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetRouterPagePath0600 start====");
          let result: number = nativerenderndk.GetRouterPagePathTest_006();
          console.info(`====>testOHArkUIGetRouterPagePath0600 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetRouterPagePath0600 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
   * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetRouterPageState_0100
   * @tc.name       : testOHArkUIGetRouterPageState0100
   * @tc.desc       : testing OH_ArkUI_GetRouterPageState interface
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 1
   */
    it('testOHArkUIGetRouterPageState0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetRouterPageState0100 start====");
          let result: number = nativerenderndk.GetRouterPageStateTest_001();
          console.info(`====>testOHArkUIGetRouterPageState0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetRouterPageState0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetRouterPageState_0200
       * @tc.name       : testOHArkUIGetRouterPageState0200
       * @tc.desc       : testing OH_ArkUI_GetRouterPageState interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetRouterPageState0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetRouterPageState0200 start====");
          let result: number = nativerenderndk.GetRouterPageStateTest_002();
          console.info(`====>testOHArkUIGetRouterPageState0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetRouterPageState0200 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetRouterPageState_0300
       * @tc.name       : testOHArkUIGetRouterPageState0300
       * @tc.desc       : testing OH_ArkUI_GetRouterPageState interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetRouterPageState0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetRouterPageState0300 start====");
          let result: number = nativerenderndk.GetRouterPageStateTest_003();
          console.info(`====>testOHArkUIGetRouterPageState0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetRouterPageState0300 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetRouterPageState_0400
       * @tc.name       : testOHArkUIGetRouterPageState0400
       * @tc.desc       : testing OH_ArkUI_GetRouterPageState interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetRouterPageState0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetRouterPageState0400 start====");
          let result: number = nativerenderndk.GetRouterPageStateTest_004();
          console.info(`====>testOHArkUIGetRouterPageState0400 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetRouterPageState0400 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetRouterPageId_0100
       * @tc.name       : testOHArkUIGetRouterPageId0100
       * @tc.desc       : testing OH_ArkUI_GetRouterPageId interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetRouterPageId0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetRouterPageId0100 start====");
          let result: number = nativerenderndk.GetRouterPageIdTest_001();
          console.info(`====>testOHArkUIGetRouterPageId0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetRouterPageId0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetRouterPageId_0200
       * @tc.name       : testOHArkUIGetRouterPageId0200
       * @tc.desc       : testing OH_ArkUI_GetRouterPageId interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetRouterPageId0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetRouterPageId0200 start====");
          let result: number = nativerenderndk.GetRouterPageIdTest_002();
          console.info(`====>testOHArkUIGetRouterPageId0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetRouterPageId0200 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
        * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetRouterPageId_0300
        * @tc.name       : testOHArkUIGetRouterPageId0300
        * @tc.desc       : testing OH_ArkUI_GetRouterPageId interface
        * @tc.size       : MediumTest
        * @tc.type       : Function
        * @tc.level      : Level 1
        */
    it('testOHArkUIGetRouterPageId0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetRouterPageId0300 start====");
          let result: number = nativerenderndk.GetRouterPageIdTest_003();
          console.info(`====>testOHArkUIGetRouterPageId0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetRouterPageId0300 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
        * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetRouterPageId_0400
        * @tc.name       : testOHArkUIGetRouterPageId0400
        * @tc.desc       : testing OH_ArkUI_GetRouterPageId interface
        * @tc.size       : MediumTest
        * @tc.type       : Function
        * @tc.level      : Level 1
        */
    it('testOHArkUIGetRouterPageId0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetRouterPageId0400 start====");
          let result: number = nativerenderndk.GetRouterPageIdTest_004();
          console.info(`====>testOHArkUIGetRouterPageId0400 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetRouterPageId0400 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
        * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetRouterPageId_0500
        * @tc.name       : testOHArkUIGetRouterPageId0500
        * @tc.desc       : testing OH_ArkUI_GetRouterPageId interface
        * @tc.size       : MediumTest
        * @tc.type       : Function
        * @tc.level      : Level 1
        */
    it('testOHArkUIGetRouterPageId0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetRouterPageId0500 start====");
          let result: number = nativerenderndk.GetRouterPageIdTest_005();
          console.info(`====>testOHArkUIGetRouterPageId0500 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetRouterPageId0500 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
        * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetRouterPageId_0600
        * @tc.name       : testOHArkUIGetRouterPageId0600
        * @tc.desc       : testing OH_ArkUI_GetRouterPageId interface
        * @tc.size       : MediumTest
        * @tc.type       : Function
        * @tc.level      : Level 1
        */
    it('testOHArkUIGetRouterPageId0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetRouterPageId0600 start====");
          let result: number = nativerenderndk.GetRouterPageIdTest_006();
          console.info(`====>testOHArkUIGetRouterPageId0600 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetRouterPageId0600 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })
  })
}