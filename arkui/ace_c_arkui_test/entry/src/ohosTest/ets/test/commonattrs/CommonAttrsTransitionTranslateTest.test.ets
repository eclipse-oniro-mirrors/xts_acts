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

export default function commonAttrsTransitionTranslateTest() {

  describe('CommonAttrsTransitionTranslateTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCommonAttrsTransitionTranslate001
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONTRANSLATE_0100
     * @tc.desc   testing TransitionEffect Translate for commonattrs with invalid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionTranslate001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionTranslate001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionTranslate002
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONTRANSLATE_0200
     * @tc.desc   testing TransitionEffect Translate for commonattrs with invalid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionTranslate002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionTranslate002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionTranslate003
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONTRANSLATE_0300
     * @tc.desc   testing TransitionEffect Translate for commonattrs with invalid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionTranslate003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionTranslate003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionTranslate004
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONTRANSLATE_0400
     * @tc.desc   testing TransitionEffect Translate for commonattrs with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionTranslate004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionTranslate004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionTranslate005
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONTRANSLATE_0500
     * @tc.desc   testing TransitionEffect Translate for commonattrs with invalid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionTranslate005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionTranslate005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionTranslate006
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONTRANSLATE_0600
     * @tc.desc   testing TransitionEffect Translate for commonattrs with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionTranslate006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionTranslate006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionTranslate007
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONTRANSLATE_0700
     * @tc.desc   testing TransitionEffect Translate for commonattrs with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionTranslate007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionTranslate007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTransitionTranslate008
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSITIONTRANSLATE_0800
     * @tc.desc   testing resetAttribute TransitionEffect Translate for commonattrs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTransitionTranslate008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTransitionTranslate008()).assertEqual(0)
      done()
    })
    
  })
}