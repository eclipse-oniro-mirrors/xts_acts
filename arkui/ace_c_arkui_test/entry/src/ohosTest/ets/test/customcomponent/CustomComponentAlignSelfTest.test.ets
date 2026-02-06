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

export default function customComponentAlignSelfTest() {

  describe('CustomComponentAlignSelfTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ALIGNSELF_0100
     * @tc.name: testCustomComponentAlignSelf001
     * @tc.desc: testing alignSelf for row with auto value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCustomComponentAlignSelf001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentAlignSelf001()).assertEqual(0)
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ALIGNSELF_0200
     * @tc.name: testCustomComponentAlignSelf002
     * @tc.desc: testing alignSelf for row with start value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCustomComponentAlignSelf002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentAlignSelf002()).assertEqual(0)
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ALIGNSELF_0300
     * @tc.name: testCustomComponentAlignSelf003
     * @tc.desc: testing alignSelf for row with center value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCustomComponentAlignSelf003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentAlignSelf003()).assertEqual(0)
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ALIGNSELF_0400
     * @tc.name: testCustomComponentAlignSelf004
     * @tc.desc: testing alignSelf for row with end value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCustomComponentAlignSelf004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentAlignSelf004()).assertEqual(0)
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ALIGNSELF_0500
     * @tc.name: testCustomComponentAlignSelf005
     * @tc.desc: testing alignSelf for row with end value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCustomComponentAlignSelf005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentAlignSelf005()).assertEqual(0)
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ALIGNSELF_0600
     * @tc.name: testCustomComponentAlignSelf006
     * @tc.desc: testing alignSelf for row with baseline value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCustomComponentAlignSelf006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentAlignSelf006()).assertEqual(0)
      done();
    })
  })
}
