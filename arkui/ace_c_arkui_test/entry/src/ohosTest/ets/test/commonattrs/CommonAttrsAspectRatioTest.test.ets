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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function commonAttrsAspectRatioTest() {

  describe('CommonAttrsAspectRatioTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_ASPECTRATIO_0100
     * @tc.name       : testCommonAttrsAspectRatioTest001
     * @tc.desc       : testing aspectratio for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAspectRatioTest001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAspectRatioTest001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_ASPECTRATIO_0200
     * @tc.name       : testCommonAttrsAspectRatioTest002
     * @tc.desc       : testing aspectratio for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAspectRatioTest002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAspectRatioTest002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_ASPECTRATIO_0300
     * @tc.name       : testCommonAttrsAspectRatioTest003
     * @tc.desc       : testing aspectratio for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAspectRatioTest003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAspectRatioTest003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_ASPECTRATIO_0400
     * @tc.name       : testCommonAttrsAspectRatioTest004
     * @tc.desc       : testing aspectratio for commonAttrs with invalid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAspectRatioTest004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAspectRatioTest004()).assertEqual(0)
      done()
    })
  })
}