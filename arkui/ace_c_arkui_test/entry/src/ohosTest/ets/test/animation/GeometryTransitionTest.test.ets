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

export default function geometryTransitionTest() {

  describe('GeometryTransitionTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testGeometryTransition001
     * @tc.number SUB_ARKUI_CAPI_GEOMETRY_TRANSITION_0100
     * @tc.desc   testing GeometryTransition for signal component with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGeometryTransition001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testGeometryTransition001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testGeometryTransition002
     * @tc.number SUB_ARKUI_CAPI_GEOMETRY_TRANSITION_0200
     * @tc.desc   testing GeometryTransition for signal component with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGeometryTransition002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testGeometryTransition002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testGeometryTransition003
     * @tc.number SUB_ARKUI_CAPI_GEOMETRY_TRANSITION_0300
     * @tc.desc   testing GeometryTransition for double components with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGeometryTransition003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testGeometryTransition003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testGeometryTransition004
     * @tc.number SUB_ARKUI_CAPI_GEOMETRY_TRANSITION_0400
     * @tc.desc   testing GeometryTransition for multiple components with the same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGeometryTransition004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testGeometryTransition004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testGeometryTransition005
     * @tc.number SUB_ARKUI_CAPI_GEOMETRY_TRANSITION_0500
     * @tc.desc   testing GeometryTransition for multiple components with the same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGeometryTransition005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testGeometryTransition005()).assertEqual(0)
      done()
    })

  })
}
