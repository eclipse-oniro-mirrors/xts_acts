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

export default function commonAttrsAlignTest() {

  describe('CommonAttrsAlignTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCommonAttrsAlign001
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_0100
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign002
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_0200
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign003
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_0300
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign004
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_0400
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign005
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_0500
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign006
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_0600
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign007
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_0700
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign008
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_0800
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign009
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_0900
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign010
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_1000
     * @tc.desc   testing align for button with default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign011
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_1100
     * @tc.desc   testing align for button with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign012
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_1200
     * @tc.desc   testing align for button with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign012()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign013
     * @tc.number SUB_ARKUI_CAPI_STACK_ALIGN_1300
     * @tc.desc   testing align for stack with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign013()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign014
     * @tc.number SUB_ARKUI_CAPI_STACK_ALIGN_1400
     * @tc.desc   testing align for stack with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign014()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign015
     * @tc.number SUB_ARKUI_CAPI_STACK_ALIGN_1500
     * @tc.desc   testing align for stack with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign015()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign016
     * @tc.number SUB_ARKUI_CAPI_STACK_ALIGN_1600
     * @tc.desc   testing align for stack with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign016()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign017
     * @tc.number SUB_ARKUI_CAPI_STACK_ALIGN_1700
     * @tc.desc   testing align for stack with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign017', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign017()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign018
     * @tc.number SUB_ARKUI_CAPI_STACK_ALIGN_1800
     * @tc.desc   testing align for stack with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign018', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign018()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign019
     * @tc.number SUB_ARKUI_CAPI_STACK_ALIGN_1900
     * @tc.desc   testing align for stack with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign019', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign019()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign020
     * @tc.number SUB_ARKUI_CAPI_STACK_ALIGN_2000
     * @tc.desc   testing align for stack with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign020', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign020()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign021
     * @tc.number SUB_ARKUI_CAPI_STACK_ALIGN_2100
     * @tc.desc   testing align for stack with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign021', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign021()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign022
     * @tc.number SUB_ARKUI_CAPI_STACK_ALIGN_2200
     * @tc.desc   testing align for stack with default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign022', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign022()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign023
     * @tc.number SUB_ARKUI_CAPI_STACK_ALIGN_2300
     * @tc.desc   testing align for stack with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign023', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign023()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign024
     * @tc.number SUB_ARKUI_CAPI_STACK_ALIGN_2400
     * @tc.desc   testing align for stack with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign024', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign024()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign025
     * @tc.number SUB_ARKUI_CAPI_STACK_ALIGN_2500
     * @tc.desc   testing align for stack with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign025', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign025()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign026
     * @tc.number SUB_ARKUI_CAPI_STACK_ALIGN_2600
     * @tc.desc   testing align for stack with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign026', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign026()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign027
     * @tc.number SUB_ARKUI_CAPI_STACK_ALIGN_2700
     * @tc.desc   testing align for stack with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign027', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign027()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign028
     * @tc.number SUB_ARKUI_CAPI_STACK_ALIGN_2800
     * @tc.desc   testing align for stack with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign028', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign028()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign029
     * @tc.number SUB_ARKUI_CAPI_STACK_ALIGN_2900
     * @tc.desc   testing align for stack with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign029', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign029()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign030
     * @tc.number SUB_ARKUI_CAPI_STACK_ALIGN_3000
     * @tc.desc   testing align for stack with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign030', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign030()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign031
     * @tc.number SUB_ARKUI_CAPI_STACK_ALIGN_3100
     * @tc.desc   testing align for stack with default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign031', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign031()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign032
     * @tc.number SUB_ARKUI_CAPI_STACK_ALIGN_3200
     * @tc.desc   testing align for stack with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign032', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign032()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign033
     * @tc.number SUB_ARKUI_CAPI_TEXT_ALIGN_3300
     * @tc.desc   testing align for text with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign033', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign033()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign034
     * @tc.number SUB_ARKUI_CAPI_TEXT_ALIGN_3400
     * @tc.desc   testing align for text with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign034', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign034()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign035
     * @tc.number SUB_ARKUI_CAPI_TEXT_ALIGN_3500
     * @tc.desc   testing align for text with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign035', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign035()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign036
     * @tc.number SUB_ARKUI_CAPI_TEXT_ALIGN_3600
     * @tc.desc   testing align for text with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign036', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign036()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign037
     * @tc.number SUB_ARKUI_CAPI_TEXT_ALIGN_3700
     * @tc.desc   testing align for text with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign037', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign037()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign038
     * @tc.number SUB_ARKUI_CAPI_TEXT_ALIGN_3800
     * @tc.desc   testing align for text with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign038', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign038()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign039
     * @tc.number SUB_ARKUI_CAPI_TEXT_ALIGN_3900
     * @tc.desc   testing align for text with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign039', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign039()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign040
     * @tc.number SUB_ARKUI_CAPI_TEXT_ALIGN_4000
     * @tc.desc   testing align for text with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign040', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign040()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign041
     * @tc.number SUB_ARKUI_CAPI_TEXT_ALIGN_4100
     * @tc.desc   testing align for text with default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign041', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign041()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign042
     * @tc.number SUB_ARKUI_CAPI_TEXT_ALIGN_4200
     * @tc.desc   testing align for text with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign042', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign042()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAlign043
     * @tc.number SUB_ARKUI_CAPI_TEXT_ALIGN_4300
     * @tc.desc   testing resetAttribute align for text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlign043', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign043()).assertEqual(0)
      done()
    })
  })
}
