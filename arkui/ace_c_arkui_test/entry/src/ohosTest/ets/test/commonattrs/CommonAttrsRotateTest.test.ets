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

export default function commonAttrsRotateTest() {

  describe('CommonAttrsRotateTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMNROW_ROTATE_0100
     * @tc.name       : testCommonAttrsRotate001
     * @tc.desc       : testing rotate for commonAttrs with valid value 0,0,0,0,0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsRotate001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsRotate001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMNROW_ROTATE_0200
     * @tc.name       : testCommonAttrsRotate002
     * @tc.desc       : testing rotate for commonAttrs with valid value 1,1,1,45,0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsRotate002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsRotate002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMNROW_ROTATE_0300
     * @tc.name       : testCommonAttrsRotate003
     * @tc.desc       : testing rotate for commonAttrs with valid value 1,1,1,-45,0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsRotate003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsRotate003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMNROW_ROTATE_0400
     * @tc.name       : testCommonAttrsRotate004
     * @tc.desc       : testing rotate for commonAttrs with valid value -1,-1,-1,45,0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsRotate004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsRotate004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMNROW_ROTATE_0500
     * @tc.name       : testCommonAttrsRotate005
     * @tc.desc       : testing rotate for commonAttrs with valid value -1,-1,-1,-45,0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsRotate005', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsRotate005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMNROW_ROTATE_0600
     * @tc.name       : testCommonAttrsRotate006
     * @tc.desc       : testing rotate for commonAttrs with valid value 1,-1,1,45,10
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsRotate006', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsRotate006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMNROW_ROTATE_0700
     * @tc.name       : testCommonAttrsRotate007
     * @tc.desc       : testing rotate for commonAttrs with valid value -1,1,-1,45,-10
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsRotate007', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsRotate007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMNROW_ROTATE_0800
     * @tc.name       : testCommonAttrsRotate008
     * @tc.desc       : testing rotate for commonAttrs with valid value ,,,45,
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsRotate008', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsRotate008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMNROW_ROTATE_0900
     * @tc.name       : testCommonAttrsRotate009
     * @tc.desc       : testing resetAttribute rotate for commonAttrs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsRotate009', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsRotate009()).assertEqual(0)
      done()
    })
  })
}