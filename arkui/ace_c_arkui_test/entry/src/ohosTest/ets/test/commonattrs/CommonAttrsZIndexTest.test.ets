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

export default function commonAttrsZIndexTest() {

  describe('CommonAttrsZIndexTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ZINDEX_0100
     * @tc.name       : testCommonAttrsZIndex001
     * @tc.desc       : testing zindex for commonattrs with valid value 0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsZIndex001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsZIndex001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ZINDEX_0200
     * @tc.name       : testCommonAttrsZIndex002
     * @tc.desc       : testing zindex for commonattrs with valid value 1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsZIndex002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsZIndex002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ZINDEX_0300
     * @tc.name       : testCommonAttrsZIndex003
     * @tc.desc       : testing zindex for commonattrs with valid value 2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsZIndex003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsZIndex003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ZINDEX_0400
     * @tc.name       : testCommonAttrsZIndex004
     * @tc.desc       : testing zindex for commonattrs with valid value 300
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsZIndex004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsZIndex004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ZINDEX_0500
     * @tc.name       : testCommonAttrsZIndex005
     * @tc.desc       : testing zindex for commonattrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsZIndex005', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsZIndex005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ZINDEX_0600
     * @tc.name       : testCommonAttrsZIndex006
     * @tc.desc       : testing resetAttribute zindex for commonattrs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsZIndex006', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsZIndex006()).assertEqual(0)
      done()
    })
  })
}