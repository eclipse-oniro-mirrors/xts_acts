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

import { beforeEach, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function commonAttrsTransformTest() {

  describe('CommonAttrsTransformTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_TRANSFORM_0100
     * @tc.name       : testCommonAttrsTransform001
     * @tc.desc       : testing transform for common with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsTransform001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransform001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_TRANSFORM_0200
     * @tc.name       : testCommonAttrsTransform002
     * @tc.desc       : testing transform for common with sixteen zeros
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCommonAttrsTransform002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransform002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_TRANSFORM_0300
     * @tc.name       : testCommonAttrsTransform003
     * @tc.desc       : testing transform for common with no values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCommonAttrsTransform003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransform003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_TRANSFORM_0400
     * @tc.name       : testCommonAttrsTransform004
     * @tc.desc       : testing transform for common with default values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsTransform004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransform004()).assertEqual(0)
      done()
    })
  })
}
