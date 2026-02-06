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
const ARKUI_ERROR_CODE_PARAM_INVALID = 401;
const ARKUI_ERROR_CODE_ERROR = 1;

export default function NodeContentTest() {
  describe('NodeContentTest', () => {
    beforeAll(async (done: Function) => {
      await Utils.pushPage(`nodecontent/nodecontentTest`, done);
    });
    /*
      * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUINodeContentRegisterCallback_0100
      * @tc.name       : testOHArkUINodeContentRegisterCallback0100
      * @tc.desc       : testing OH_ArkUI_NodeContent_RegisterCallback  interface
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('testOHArkUINodeContentRegisterCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeContentRegisterCallback0100 start====");
          let result: number = nativerenderndk.RegisterCallbackTest_001()
          console.info(`====>testOHArkUINodeContentRegisterCallback0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeContentRegisterCallback0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUINodeContentRegisterCallback_0200
       * @tc.name       : testOHArkUINodeContentRegisterCallback0200
       * @tc.desc       : testing OH_ArkUI_NodeContent_RegisterCallback  interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUINodeContentRegisterCallback0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeContentRegisterCallback0200 start====");
          let result: number = nativerenderndk.RegisterCallbackTest_002()
          console.info(`====>testOHArkUINodeContentRegisterCallback0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeContentRegisterCallback0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })
    /*
      * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUINodeContentSetUserData_0100
      * @tc.name       : testOHArkUINodeContentSetUserData0100
      * @tc.desc       : testing OH_ArkUI_NodeContent_SetUserData  interface
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('testOHArkUINodeContentSetUserData0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeContentSetUserData0100 start====");
          let result: number = nativerenderndk.SetUserDataTest_001()
          console.info(`====>testOHArkUINodeContentSetUserData0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeContentSetUserData0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUINodeContentSetUserData_0200
       * @tc.name       : testOHArkUINodeContentSetUserData0200
       * @tc.desc       : testing OH_ArkUI_NodeContent_SetUserData  interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUINodeContentSetUserData0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeContentSetUserData0200 start====");
          let result: number = nativerenderndk.SetUserDataTest_002()
          console.info(`====>testOHArkUINodeContentSetUserData0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeContentSetUserData0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })
    /*
      * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUINodeContentAddNode_0100
      * @tc.name       : testOHArkUINodeContentAddNode0100
      * @tc.desc       : testing OH_ArkUI_NodeContent_AddNode  interface
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('testOHArkUINodeContentAddNode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeContentAddNode0100 start====");
          let result: number = nativerenderndk.AddNodeTest_001()
          console.info(`====>testOHArkUINodeContentAddNode0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeContentAddNode0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUINodeContentAddNode_0200
       * @tc.name       : testOHArkUINodeContentAddNode0200
       * @tc.desc       : testing OH_ArkUI_NodeContent_AddNode  interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUINodeContentAddNode0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeContentAddNode0200 start====");
          let result: number = nativerenderndk.AddNodeTest_002()
          console.info(`====>testOHArkUINodeContentAddNode0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeContentAddNode0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })
    /*
      * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUINodeContentRemoveNode_0100
      * @tc.name       : testOHArkUINodeContentRemoveNode0100
      * @tc.desc       : testing OH_ArkUI_NodeContent_RemoveNode  interface
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('testOHArkUINodeContentRemoveNode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeContentRemoveNode0100 start====");
          let result: number = nativerenderndk.RemoveNodeTest_001()
          console.info(`====>testOHArkUINodeContentRemoveNode0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeContentRemoveNode0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUINodeContentRemoveNode_0200
       * @tc.name       : testOHArkUINodeContentRemoveNode0200
       * @tc.desc       : testing OH_ArkUI_NodeContent_RemoveNode  interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUINodeContentRemoveNode0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeContentRemoveNode0200 start====");
          let result: number = nativerenderndk.RemoveNodeTest_002()
          console.info(`====>testOHArkUINodeContentRemoveNode0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeContentRemoveNode0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })
    /*
      * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUINodeContentInsertNode_0100
      * @tc.name       : testOHArkUINodeContentInsertNode0100
      * @tc.desc       : testing OH_ArkUI_NodeContent_InsertNode  interface
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('testOHArkUINodeContentInsertNode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeContentInsertNode0100 start====");
          let result: number = nativerenderndk.InsertNodeTest_001()
          console.info(`====>testOHArkUINodeContentInsertNode0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeContentInsertNode0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUINodeContentInsertNode_0200
       * @tc.name       : testOHArkUINodeContentInsertNode0200
       * @tc.desc       : testing OH_ArkUI_NodeContent_InsertNode  interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUINodeContentInsertNode0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeContentInsertNode0200 start====");
          let result: number = nativerenderndk.InsertNodeTest_002()
          console.info(`====>testOHArkUINodeContentInsertNode0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeContentInsertNode0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })
  })
}