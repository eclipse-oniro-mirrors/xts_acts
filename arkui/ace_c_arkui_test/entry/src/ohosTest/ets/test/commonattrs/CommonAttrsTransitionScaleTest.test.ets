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

export default function commonAttrsTransitionEffectScaleTest() {

  describe('CommonAttrsTransitionEffectScaleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSITIONSCALE_0100
     * @tc.name       : testCommonAttrsTransitionScale001
     * @tc.desc       : testing TransitionEffect Scale for commonattrs with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsTransitionScale001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionScale001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSITIONSCALE_0200
     * @tc.name       : testCommonAttrsTransitionScale002
     * @tc.desc       : testing TransitionEffect Scale for commonattrs with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsTransitionScale002', 0, async (done: Function) => {
        expect(nativeFunc.testCommonAttrsTransitionScale002()).assertEqual(0)
        done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSITIONSCALE_0300
     * @tc.name       : testCommonAttrsTransitionScale003
     * @tc.desc       : testing TransitionEffect Scale for commonattrs with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsTransitionScale003', 0, async (done: Function) => {
        expect(nativeFunc.testCommonAttrsTransitionScale003()).assertEqual(0)
        done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSITIONSCALE_0400
     * @tc.name       : testCommonAttrsTransitionScale004
     * @tc.desc       : testing TransitionEffect Scale for commonattrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     */
    it('testCommonAttrsTransitionScale004', 0, async (done: Function) => {
        expect(nativeFunc.testCommonAttrsTransitionScale004()).assertEqual(0)
        done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSITIONSCALE_0500
     * @tc.name       : testCommonAttrsTransitionScale005
     * @tc.desc       : testing TransitionEffect Scale for commonattrs with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     */
    it('testCommonAttrsTransitionScale005', 0, async (done: Function) => {
        expect(nativeFunc.testCommonAttrsTransitionScale005()).assertEqual(0)
        done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSITIONSCALE_0600
     * @tc.name       : testCommonAttrsTransitionScale006
     * @tc.desc       : testing TransitionEffect Scale for commonattrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     */
    it('testCommonAttrsTransitionScale006', 0, async (done: Function) => {
        expect(nativeFunc.testCommonAttrsTransitionScale006()).assertEqual(0)
        done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSITIONSCALE_0700
     * @tc.name       : testCommonAttrsTransitionScale007
     * @tc.desc       : testing resetAttribute TransitionEffect Scale for commonattrs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     */
    it('testCommonAttrsTransitionScale007', 0, async (done: Function) => {
        expect(nativeFunc.testCommonAttrsTransitionScale007()).assertEqual(0)
        done()
    })
  })
}