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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function ui_input_event_booleanTest() {

  describe('ui_input_event_booleanTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number   OH_ArkUI_GestureInterruptInfo_GetSystemFlag_False
     * @tc.name     ui_input_event_booleanTest001
     * @tc.desc     testing interface return boolean
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('ui_input_event_booleanTest001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.False_OH_ArkUI_GestureInterruptInfo_GetSystemFlag()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   OH_ArkUI_GestureInterruptInfo_GetSystemFlag_True
     * @tc.name     ui_input_event_booleanTest002
     * @tc.desc     testing interface return boolean
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('ui_input_event_booleanTest002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.True_OH_ArkUI_GestureInterruptInfo_GetSystemFlag()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })

  })
}