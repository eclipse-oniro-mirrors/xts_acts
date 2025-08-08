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

export default function toggleClipTest() {

  describe('ToggleClipTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_CLIP_0100
     * @tc.name       : testToggleClip001
     * @tc.desc       : testing clip for toggle with normal rect value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testToggleClip001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleClip001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_CLIP_0200
     * @tc.name       : testToggleClip002
     * @tc.desc       : testing clip for toggle with abnormal rect value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testToggleClip002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleClip002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_CLIP_0300
     * @tc.name       : testToggleClip003
     * @tc.desc       : testing clip for toggle with large rect value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testToggleClip003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleClip003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_CLIP_0400
     * @tc.name       : testToggleClip004
     * @tc.desc       : testing clip for toggle with normal circle value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testToggleClip004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleClip004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_CLIP_0500
     * @tc.name       : testToggleClip005
     * @tc.desc       : testing clip for toggle with abnormal circle value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testToggleClip005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleClip005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_CLIP_0600
     * @tc.name       : testToggleClip006
     * @tc.desc       : testing clip for toggle with large circle value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testToggleClip006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleClip006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_CLIP_0700
     * @tc.name       : testToggleClip007
     * @tc.desc       : testing clip for toggle with normal ellipse value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testToggleClip007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleClip007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_CLIP_0800
     * @tc.name       : testToggleClip008
     * @tc.desc       : testing clip for toggle with abnormal ellipse value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testToggleClip008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleClip008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_CLIP_0900
     * @tc.name       : testToggleClip009
     * @tc.desc       : testing clip for toggle with large ellipse value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testToggleClip009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleClip009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_CLIP_1000
     * @tc.name       : testToggleClip010
     * @tc.desc       : testing clip for toggle with normal path value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testToggleClip010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleClip010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_CLIP_1100
     * @tc.name       : testToggleClip011
     * @tc.desc       : testing clip for toggle with abnormal path value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testToggleClip011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleClip011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_CLIP_1200
     * @tc.name       : testToggleClip012
     * @tc.desc       : testing clip for toggle with large path value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testToggleClip012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleClip012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_CLIP_1300
     * @tc.name       : testToggleClip013
     * @tc.desc       : testing clip for toggle with normal bool value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testToggleClip013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleClip013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_CLIP_1400
     * @tc.name       : testToggleClip014
     * @tc.desc       : testing clip for toggle with normal bool value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testToggleClip014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleClip014()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_CLIP_1500
     * @tc.name       : testToggleClip015
     * @tc.desc       : testing clip for toggle with abnormal bool value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testToggleClip015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleClip015()).assertEqual(0)
      done()
    })

  })
}
