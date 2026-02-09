/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import libnativetype from 'libnativetype.so'
import Utils from '../common/Utils';

const OS_ACCOUNT_ERR_INVALID_PARAMETER = 12300002;
const ARKUI_ERROR_CODE_NODE_INDEX_INVALID = 106200;
const ARKUI_ERROR_CODE_GET_INFO_FAILED = 106201;

export default function NavigationErrorCodeTest() {
  describe('NavigationErrorCodeTest', () => {
    beforeAll(async (done: Function) => {
      await Utils.pushPage(`NativeType/NavigationTest`, done);
    });
    /**
     * @tc.name   testArkUIACEErrorCode1600
     * @tc.number SUB_ArkUI_ACE_ErrorCode_1600
     * @tc.desc   testing ARKUI_ERROR_CODE_NON_SCROLLABLE_CONTAINER ErrorCode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACEErrorCode1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ArkUI_ACE_ErrorCode_1600 start<====`);
        await Utils.sleep(500);


        let Result: number = libnativetype.ErrorCodeNodeIndexInvalid();
        expect(ARKUI_ERROR_CODE_NODE_INDEX_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ArkUI_ACE_ErrorCode_1600 catch err: ` + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
        done()
      }
    })
    /**
     * @tc.name   testArkUIACEErrorCode1700
     * @tc.number SUB_ArkUI_ACE_ErrorCode_1700
     * @tc.desc   testing ARKUI_ERROR_CODE_NON_SCROLLABLE_CONTAINER ErrorCode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACEErrorCode1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ArkUI_ACE_ErrorCode_1700 start<====`);
        await Utils.sleep(500);
        let Result: number = libnativetype.ErrorCodeGetInfoFailed();
        expect(ARKUI_ERROR_CODE_GET_INFO_FAILED).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ArkUI_ACE_ErrorCode_1700 catch err: ` + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
        done()
      }
    })
  })
}
