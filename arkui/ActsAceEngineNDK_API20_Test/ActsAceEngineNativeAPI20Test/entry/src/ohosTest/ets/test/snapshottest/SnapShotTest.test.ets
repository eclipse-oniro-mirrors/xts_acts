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
const ARKUI_ERROR_CODE_INTERNAL_ERROR = 100001;
const ARKUI_ERROR_CODE_COMPONENT_SNAPSHOT_TIMEOUT = 160002;

export default function SnapShotTest() {
  describe('SnapShotTest', () => {
    beforeAll(async (done: Function) => {
      await Utils.pushPage(`snapshottest/snapShotTest`, done);
    });
    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNodeSnapshot_0100
       * @tc.name       : testOHArkUIGetNodeSnapshot0100
       * @tc.desc       : testing OH_ArkUI_GetNodeSnapshot interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetNodeSnapshot0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNodeSnapshot0100 start====");
          let result: number = nativerenderndk.GetNodeSnapshotTest_001();
          console.info(`====>testOHArkUIGetNodeSnapshot0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNodeSnapshot0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNodeSnapshot_0200
       * @tc.name       : testOHArkUIGetNodeSnapshot0200
       * @tc.desc       : testing OH_ArkUI_GetNodeSnapshot interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetNodeSnapshot0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNodeSnapshot0200 start====");
          let result: number = nativerenderndk.GetNodeSnapshotTest_002();
          console.info(`====>testOHArkUIGetNodeSnapshot0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNodeSnapshot0200 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNodeSnapshot_0300
       * @tc.name       : testOHArkUIGetNodeSnapshot0300
       * @tc.desc       : testing OH_ArkUI_GetNodeSnapshot interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIGetNodeSnapshot0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNodeSnapshot0300 start====");
          let result: number = nativerenderndk.GetNodeSnapshotTest_003();
          console.info(`====>testOHArkUIGetNodeSnapshot0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNodeSnapshot0300 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

  })
}