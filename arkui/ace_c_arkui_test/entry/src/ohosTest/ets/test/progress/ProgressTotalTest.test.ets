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

export default function progressTotalTest() {

  describe('ProgressTotalTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_PROGRESS_TOTAL_0100
     * @tc.name       : testProgressTotal001
     * @tc.desc       : testing total for Progress with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testProgressTotal001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testProgressTotal001()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_PROGRESS_TOTAL_0200
     * @tc.name       : testProgressTotal002
     * @tc.desc       : testing total for Progress with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testProgressTotal002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testProgressTotal002()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_PROGRESS_TOTAL_0300
     * @tc.name       : testProgressTotal003
     * @tc.desc       : testing total for Progress with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testProgressTotal003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testProgressTotal003()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_PROGRESS_TOTAL_0400
     * @tc.name       : testProgressTotal004
     * @tc.desc       : testing total for Progress with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testProgressTotal004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testProgressTotal004()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_PROGRESS_TOTAL_0500
     * @tc.name       : testProgressTotal005
     * @tc.desc       : testing total for Progress with NULL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testProgressTotal005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testProgressTotal005()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_PROGRESS_TOTAL_0600
     * @tc.name       : testProgressTotal006
     * @tc.desc       : testing total for Progress with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testProgressTotal006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testProgressTotal006()).assertEqual(0)
      done();
    });
  })
}
