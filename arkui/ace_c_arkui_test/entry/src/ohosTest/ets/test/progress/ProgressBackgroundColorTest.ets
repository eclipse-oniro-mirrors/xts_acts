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

import { expect, describe, it, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function progressBackgroundColorTest() {

  describe('ProgressBackgroundColorTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_PROGRESS_BACKGROUNDCOLOR_0100
     * @tc.name       : testProgressBackgroundColor001
     * @tc.desc       : testing backgroundColor for Progress with red value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testProgressBackgroundColor001', 0, async (done: Function) => {
      expect(nativeFunc.testProgressBackgroundColor001()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_PROGRESS_BACKGROUNDCOLOR_0200
     * @tc.name       : testProgressBackgroundColor002
     * @tc.desc       : testing backgroundColor for Progress with boundary value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testProgressBackgroundColor002', 0, async (done: Function) => {
      expect(nativeFunc.testProgressBackgroundColor002()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_PROGRESS_BACKGROUNDCOLOR_0300
     * @tc.name       : testProgressBackgroundColor003
     * @tc.desc       : testing backgroundColor for Progress with boundary value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testProgressBackgroundColor003', 0, async (done: Function) => {
      expect(nativeFunc.testProgressBackgroundColor003()).assertEqual(0)
      done();
    });
  })
}
