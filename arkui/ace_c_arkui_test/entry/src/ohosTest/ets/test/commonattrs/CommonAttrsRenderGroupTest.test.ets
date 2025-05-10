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

export default function commonAttrsRenderGroupTest() {

  describe('CommonAttrsRenderGroupTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_RENDERGROUP_0100
     * @tc.name       : testCommonAttrsRenderGroup001
     * @tc.desc       : testing render group for commonAttrs with invalid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsRenderGroup001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsRenderGroup001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_RENDERGROUP_0200
     * @tc.name       : testCommonAttrsRenderGroup002
     * @tc.desc       : testing render group for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsRenderGroup002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsRenderGroup002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_RENDERGROUP_0300
     * @tc.name       : testCommonAttrsRenderGroup003
     * @tc.desc       : testing render group for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsRenderGroup003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsRenderGroup003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_RENDERGROUP_0400
     * @tc.name       : testCommonAttrsRenderGroup004
     * @tc.desc       : testing resetAttribute render group for commonAttrs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsRenderGroup004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsRenderGroup004()).assertEqual(0)
      done()
    })
  })
}