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

import { expect, describe, it, afterEach, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function refreshOffsetTest() {

  describe('RefreshOffsetTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_REFRESH_OFFSET_0100
     * @tc.name       : testRefreshOffset001
     * @tc.desc       : testing value for Progress with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRefreshOffset001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRefreshOffset001()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_REFRESH_OFFSET_0200
     * @tc.name       : testRefreshOffset002
     * @tc.desc       : testing value for Progress with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRefreshOffset002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRefreshOffset002()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_REFRESH_OFFSET_0300
     * @tc.name       : testRefreshOffset003
     * @tc.desc       : testing value for Progress with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRefreshOffset003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRefreshOffset003()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_REFRESH_OFFSET_0400
     * @tc.name       : testRefreshOffset004
     * @tc.desc       : testing value for Progress with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRefreshOffset004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRefreshOffset004()).assertEqual(0)
      done();
    })

  })
}
