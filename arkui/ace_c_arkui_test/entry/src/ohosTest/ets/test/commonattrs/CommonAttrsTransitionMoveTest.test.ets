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

export default function commonAttrsTransitionEffectMoveTest() {

  describe('CommonAttrsTransitionEffectMoveTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCommonAttrsTransitionMove001
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONMOVE_0100
     * @tc.desc   testing TransitionEffect Move for commonAttrs with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionMove001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionMove001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionMove002
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONMOVE_0200
     * @tc.desc   testing TransitionEffect Move for commonAttrs with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionMove002', Level.LEVEL1, async (done: Function) => {
        expect(nativeFunc.testCommonAttrsTransitionMove002()).assertEqual(0)
        done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionMove003
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONMOVE_0300
     * @tc.desc   testing TransitionEffect Move for commonAttrs with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionMove003', Level.LEVEL1, async (done: Function) => {
        expect(nativeFunc.testCommonAttrsTransitionMove003()).assertEqual(0)
        done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionMove004
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONMOVE_0400
     * @tc.desc   testing TransitionEffect Move for commonAttrs with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionMove004', Level.LEVEL1, async (done: Function) => {
        expect(nativeFunc.testCommonAttrsTransitionMove004()).assertEqual(0)
        done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionMove005
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONMOVE_0500
     * @tc.desc   testing TransitionEffect Move for commonAttrs with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionMove005', Level.LEVEL1, async (done: Function) => {
        expect(nativeFunc.testCommonAttrsTransitionMove005()).assertEqual(0)
        done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionMove006
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONMOVE_0600
     * @tc.desc   testing TransitionEffect Move for commonAttrs with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionMove006', Level.LEVEL1, async (done: Function) => {
        expect(nativeFunc.testCommonAttrsTransitionMove006()).assertEqual(0)
        done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionMove007
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONMOVE_0700
     * @tc.desc   testing resetAttribute TransitionEffect Move for commonAttrs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionMove007', Level.LEVEL1, async (done: Function) => {
        expect(nativeFunc.testCommonAttrsTransitionMove007()).assertEqual(0)
        done()
    })
  })
}