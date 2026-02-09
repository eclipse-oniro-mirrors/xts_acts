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

export default function commonAttrsTransitionEffectRotateTest() {

  describe('CommonAttrsTransitionEffectRotateTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCommonAttrsTransitionRotate001
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONEFFECTROTATE_0100
     * @tc.desc   testing TransitionEffect Rotate for common with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionRotate001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionRotate001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionRotate002
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONEFFECTROTATE_0200
     * @tc.desc   testing TransitionEffect Rotate for common with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionRotate002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionRotate002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionRotate003
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONEFFECTROTATE_0300
     * @tc.desc   testing TransitionEffect Rotate for common with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionRotate003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionRotate003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionRotate004
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONEFFECTROTATE_0400
     * @tc.desc   testing TransitionEffect Rotate for common with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionRotate004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionRotate004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionRotate005
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONEFFECTROTATE_0500
     * @tc.desc   testing TransitionEffect Rotate for common with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionRotate005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionRotate005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionRotate006
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONEFFECTROTATE_0600
     * @tc.desc   testing TransitionEffect Rotate for common with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionRotate006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionRotate006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionRotate007
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONEFFECTROTATE_0700
     * @tc.desc   testing TransitionEffect Rotate for common with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionRotate007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionRotate007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionRotate008
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONEFFECTROTATE_0800
     * @tc.desc   testing resetAttribute TransitionEffect Rotate for common
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionRotate008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionRotate008()).assertEqual(0)
      done()
    })
  })
}