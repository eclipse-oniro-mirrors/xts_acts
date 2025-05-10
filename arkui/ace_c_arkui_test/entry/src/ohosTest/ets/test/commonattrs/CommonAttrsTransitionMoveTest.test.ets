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

export default function commonAttrsTransitionEffectMoveTest() {

  describe('CommonAttrsTransitionEffectMoveTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSITIONMOVE_0100
     * @tc.name       : testCommonAttrsTransitionMove001
     * @tc.desc       : testing TransitionEffect Move for commonAttrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsTransitionMove001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionMove001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSITIONMOVE_0200
     * @tc.name       : testCommonAttrsTransitionMove002
     * @tc.desc       : testing TransitionEffect Move for commonAttrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsTransitionMove002', 0, async (done: Function) => {
        expect(nativeFunc.testCommonAttrsTransitionMove002()).assertEqual(0)
        done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSITIONMOVE_0300
     * @tc.name       : testCommonAttrsTransitionMove003
     * @tc.desc       : testing TransitionEffect Move for commonAttrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     */
    it('testCommonAttrsTransitionMove003', 0, async (done: Function) => {
        expect(nativeFunc.testCommonAttrsTransitionMove003()).assertEqual(0)
        done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSITIONMOVE_0400
     * @tc.name       : testCommonAttrsTransitionMove004
     * @tc.desc       : testing TransitionEffect Move for commonAttrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     */
    it('testCommonAttrsTransitionMove004', 0, async (done: Function) => {
        expect(nativeFunc.testCommonAttrsTransitionMove004()).assertEqual(0)
        done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSITIONMOVE_0500
     * @tc.name       : testCommonAttrsTransitionMove005
     * @tc.desc       : testing TransitionEffect Move for commonAttrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     */
    it('testCommonAttrsTransitionMove005', 0, async (done: Function) => {
        expect(nativeFunc.testCommonAttrsTransitionMove005()).assertEqual(0)
        done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSITIONMOVE_0600
     * @tc.name       : testCommonAttrsTransitionMove006
     * @tc.desc       : testing TransitionEffect Move for commonAttrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     */
    it('testCommonAttrsTransitionMove006', 0, async (done: Function) => {
        expect(nativeFunc.testCommonAttrsTransitionMove006()).assertEqual(0)
        done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSITIONMOVE_0700
     * @tc.name       : testCommonAttrsTransitionMove007
     * @tc.desc       : testing resetAttribute TransitionEffect Move for commonAttrs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     */
    it('testCommonAttrsTransitionMove007', 0, async (done: Function) => {
        expect(nativeFunc.testCommonAttrsTransitionMove007()).assertEqual(0)
        done()
    })
  })
}