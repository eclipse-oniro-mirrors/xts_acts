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

export default function commonAttrsTransformCenterTest() {

  describe('CommonAttrsTransformCenterTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSFORMCENTER_0100
     * @tc.name       : testCommonAttrsTransformCenter001
     * @tc.desc       : testing transformCenter for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsTransformCenter001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransformCenter001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSFORMCENTER_0200
     * @tc.name       : testCommonAttrsTransformCenter002
     * @tc.desc       : testing transformCenter for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsTransformCenter002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransformCenter002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSFORMCENTER_0300
     * @tc.name       : testCommonAttrsTransformCenter003
     * @tc.desc       : testing transformCenter for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsTransformCenter003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransformCenter003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSFORMCENTER_0400
     * @tc.name       : testCommonAttrsTransformCenter004
     * @tc.desc       : testing transformCenter for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsTransformCenter004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransformCenter004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSFORMCENTER_0500
     * @tc.name       : testCommonAttrsTransformCenter005
     * @tc.desc       : testing transformCenter for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsTransformCenter005', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransformCenter005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSFORMCENTER_0600
     * @tc.name       : testCommonAttrsTransformCenter006
     * @tc.desc       : testing transformCenter for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsTransformCenter006', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransformCenter006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSFORMCENTER_0700
     * @tc.name       : testCommonAttrsTransformCenter007
     * @tc.desc       : testing resetAttribute transformCenter for commonAttrs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsTransformCenter007', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransformCenter007()).assertEqual(0)
      done()
    })
  })
}