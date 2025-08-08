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

export default function textAlignRulesTest() {

  describe('TextAlignRulesTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGNRULES_0100
     * @tc.name       : testTextAlignRules001
     * @tc.desc       : testing alignRules for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextAlignRules001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAlignRules001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGNRULES_0200
     * @tc.name       : testTextAlignRules002
     * @tc.desc       : testing alignRules for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextAlignRules002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAlignRules002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGNRULES_0300
     * @tc.name       : testTextAlignRules003
     * @tc.desc       : testing alignRules for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextAlignRules003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAlignRules003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGNRULES_0400
     * @tc.name       : testTextAlignRules004
     * @tc.desc       : testing alignRules for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextAlignRules004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAlignRules004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGNRULES_0500
     * @tc.name       : testTextAlignRules005
     * @tc.desc       : testing alignRules for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextAlignRules005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAlignRules005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGNRULES_0600
     * @tc.name       : testTextAlignRules006
     * @tc.desc       : testing alignRules for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextAlignRules006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAlignRules006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGNRULES_0700
     * @tc.name       : testTextAlignRules007
     * @tc.desc       : testing alignRules for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextAlignRules007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAlignRules007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGNRULES_0800
     * @tc.name       : testTextAlignRules008
     * @tc.desc       : testing alignRules for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextAlignRules008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAlignRules008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGNRULES_0900
     * @tc.name       : testTextAlignRules009
     * @tc.desc       : testing alignRules for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextAlignRules009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAlignRules009()).assertEqual(0)
      done()
    })
  })
}
