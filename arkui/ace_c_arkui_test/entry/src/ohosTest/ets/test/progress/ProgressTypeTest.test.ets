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

export default function progressTypeTest() {

  describe('ProgressTypeTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   testProgressType001
     * @tc.number SUB_ARKUI_CAPI_PROGRESS_TYPE_0100
     * @tc.desc   testing type for Progress with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressType001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testProgressType001()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testProgressType002
     * @tc.number SUB_ARKUI_CAPI_PROGRESS_TYPE_0200
     * @tc.desc   testing type for Progress with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressType002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testProgressType002()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testProgressType003
     * @tc.number SUB_ARKUI_CAPI_PROGRESS_TYPE_0300
     * @tc.desc   testing type for Progress with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressType003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testProgressType003()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testProgressType004
     * @tc.number SUB_ARKUI_CAPI_PROGRESS_TYPE_0400
     * @tc.desc   testing type for Progress with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressType004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testProgressType004()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testProgressType005
     * @tc.number SUB_ARKUI_CAPI_PROGRESS_TYPE_0500
     * @tc.desc   testing type for Progress with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressType005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testProgressType005()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testProgressType006
     * @tc.number SUB_ARKUI_CAPI_PROGRESS_TYPE_0600
     * @tc.desc   testing type for Progress with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressType006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testProgressType006()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testProgressType007
     * @tc.number SUB_ARKUI_CAPI_PROGRESS_TYPE_0700
     * @tc.desc   testing type for Progress with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressType007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testProgressType007()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testProgressType008
     * @tc.number SUB_ARKUI_CAPI_PROGRESS_TYPE_0800
     * @tc.desc   testing type for Progress with NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressType008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testProgressType008()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testProgressType009
     * @tc.number SUB_ARKUI_CAPI_PROGRESS_TYPE_0900
     * @tc.desc   testing type for Progress with default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressType009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testProgressType009()).assertEqual(0)
      done();
    });
  })
}
