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

export default function commonAttrsOffsetTest() {

  describe('CommonAttrsOffsetTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_OFFSET_0100
     * @tc.name       : testCommonAttrsOffset001
     * @tc.desc       : testing offset for commonattrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsOffset001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsOffset001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_OFFSET_0200
     * @tc.name       : testCommonAttrsOffset002
     * @tc.desc       : testing offset for commonattrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsOffset002', Level.LEVEL1, async (done: Function) => {
        expect(nativeFunc.testCommonAttrsOffset002()).assertEqual(0)
        done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_OFFSET_0300
     * @tc.name       : testCommonAttrsOffset003
     * @tc.desc       : testing offset for commonattrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsOffset003', Level.LEVEL1, async (done: Function) => {
        expect(nativeFunc.testCommonAttrsOffset003()).assertEqual(0)
        done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_OFFSET_0400
     * @tc.name       : testCommonAttrsOffset004
     * @tc.desc       : testing offset for commonattrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsOffset004', Level.LEVEL1, async (done: Function) => {
        expect(nativeFunc.testCommonAttrsOffset004()).assertEqual(0)
        done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_OFFSET_0500
     * @tc.name       : testCommonAttrsOffset005
     * @tc.desc       : testing offset for commonattrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsOffset005', Level.LEVEL1, async (done: Function) => {
        expect(nativeFunc.testCommonAttrsOffset005()).assertEqual(0)
        done()
    })   

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_OFFSET_0600
     * @tc.name       : testCommonAttrsOffset006
     * @tc.desc       : testing resetAttribute offset for commonattrs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsOffset006', Level.LEVEL1, async (done: Function) => {
        expect(nativeFunc.testCommonAttrsOffset006()).assertEqual(0)
        done()
    })
  })
}