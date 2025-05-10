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

export default function commonAttrsExpandSafeAreaTest() {

  describe('CommonAttrsExpandSafeAreaTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_EXPANDSAFEAREA_0100
     * @tc.name       : testCommonAttrsExpandSafeArea001
     * @tc.desc       : testing expandsafearea for commonAttrs with valid value
                        {ARKUI_SAFE_AREA_TYPE_SYSTEM}{ARKUI_SAFE_AREA_EDGE_TOP} 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsExpandSafeArea001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsExpandSafeArea001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_EXPANDSAFEAREA_0200
     * @tc.name       : testCommonAttrsExpandSafeArea002
     * @tc.desc       : testing expandsafearea for commonAttrs with valid value
                        0,0 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsExpandSafeArea002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsExpandSafeArea002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_EXPANDSAFEAREA_0300
     * @tc.name       : testCommonAttrsExpandSafeArea003
     * @tc.desc       : testing expandsafearea for commonAttrs with valid value
                        5,9
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsExpandSafeArea003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsExpandSafeArea003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_EXPANDSAFEAREA_0400
     * @tc.name       : testCommonAttrsExpandSafeArea004
     * @tc.desc       : testing resetAttribute expandsafearea for commonAttrs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsExpandSafeArea004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsExpandSafeArea004()).assertEqual(0)
      done()
    })
  })
}