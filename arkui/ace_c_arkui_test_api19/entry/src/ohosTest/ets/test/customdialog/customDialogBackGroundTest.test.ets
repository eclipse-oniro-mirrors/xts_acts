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

import { expect, describe, it, beforeEach, Level  } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function customDialogBackGroundTest(){

  describe('customDialogBackGroundTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   testCustomDialog001
     * @tc.number SUB_ARKUI_CAPI_POST_FRAME_0100
     * @tc.desc   testing CalendarPicker AutoPlay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialog001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialog001()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testCustomDialog002
     * @tc.number SUB_ARKUI_CAPI_POST_FRAME_0100
     * @tc.desc   testing CalendarPicker AutoPlay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialog002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialog002()).assertEqual(0)
      done();
    });

  })
}