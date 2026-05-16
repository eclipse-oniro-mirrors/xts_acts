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

export default function commonAttrsTransitionEffectOpacityTest() {

  describe('CommonAttrsTransitionEffectOpacityTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCommonAttrsTransitionOpacity001
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONEFFECTOPACITY_0100
     * @tc.desc   testing TransitionEffect Opacity for common with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionOpacity001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionOpacity001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionOpacity002
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONEFFECTOPACITY_0200
     * @tc.desc   testing TransitionEffect Opacity for common with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionOpacity002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionOpacity002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionOpacity003
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONEFFECTOPACITY_0300
     * @tc.desc   testing TransitionEffect Opacity for common with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionOpacity003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionOpacity003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionOpacity004
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONEFFECTOPACITY_0400
     * @tc.desc   testing TransitionEffect Opacity for common with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionOpacity004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionOpacity004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionOpacity005
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONEFFECTOPACITY_0500
     * @tc.desc   testing TransitionEffect Opacity for common with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionOpacity005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionOpacity005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionOpacity006
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONEFFECTOPACITY_0600
     * @tc.desc   testing TransitionEffect Opacity for common with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionOpacity006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionOpacity006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionOpacity007
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONEFFECTOPACITY_0700
     * @tc.desc   testing TransitionEffect Opacity for common with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionOpacity007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionOpacity007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionOpacity008
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONEFFECTOPACITY_0800
     * @tc.desc   testing TransitionEffect Opacity for common with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionOpacity008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionOpacity008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionOpacity009
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONEFFECTOPACITY_0900
     * @tc.desc   testing TransitionEffect Opacity for common with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionOpacity009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionOpacity009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionOpacity010
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONEFFECTOPACITY_1000
     * @tc.desc   testing TransitionEffect Opacity for common with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionOpacity010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionOpacity010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionOpacity011
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONEFFECTOPACITY_1100
     * @tc.desc   testing TransitionEffect Opacity for common with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionOpacity011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionOpacity011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionOpacity012
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONEFFECTOPACITY_1200
     * @tc.desc   testing TransitionEffect Opacity for common with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionOpacity012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionOpacity012()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionOpacity013
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONEFFECTOPACITY_1300
     * @tc.desc   testing TransitionEffect Opacity for common with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionOpacity013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionOpacity013()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionOpacity014
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONEFFECTOPACITY_1400
     * @tc.desc   testing TransitionEffect Opacity for common with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionOpacity014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionOpacity014()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionOpacity015
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONEFFECTOPACITY_1500
     * @tc.desc   testing resetAttribute TransitionEffect Opacity for common
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionOpacity015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionOpacity015()).assertEqual(0)
      done()
    })
  })
}
