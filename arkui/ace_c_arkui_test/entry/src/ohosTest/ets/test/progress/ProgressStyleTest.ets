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

export default function progressStyleTest() {

  describe('ProgressStyleTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_PROGRESS_STYLE_0100
     * @tc.name       : testProgressStyle001
     * @tc.desc       : testing style for Progress with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testProgressStyle001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testProgressStyle001()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_PROGRESS_STYLE_0200
     * @tc.name       : testProgressStyle002
     * @tc.desc       : testing style for Progress with ARKUI_PROGRESS_TYPE_RING value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testProgressStyle002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testProgressStyle002()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_PROGRESS_STYLE_0300
     * @tc.name       : testProgressStyle003
     * @tc.desc       : testing style for Progress with ARKUI_PROGRESS_TYPE_ECLIPSE value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testProgressStyle003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testProgressStyle003()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_PROGRESS_STYLE_0400
     * @tc.name       : testProgressStyle004
     * @tc.desc       : testing style for Progress with ARKUI_PROGRESS_TYPE_SCALE_RING value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testProgressStyle004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testProgressStyle004()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_PROGRESS_STYLE_0500
     * @tc.name       : testProgressStyle005
     * @tc.desc       : testing style for Progress with ARKUI_PROGRESS_TYPE_CAPSULE value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testProgressStyle005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testProgressStyle005()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_PROGRESS_STYLE_0600
     * @tc.name       : testProgressStyle006
     * @tc.desc       : testing style for Progress with ARKUI_PROGRESS_TYPE_LINEAR value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testProgressStyle006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testProgressStyle006()).assertEqual(0)
      done();
    });
  })
}
