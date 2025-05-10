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

export default function commonAttrsAlignTest() {

  describe('CommonAttrsAlignTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_0100
     * @tc.name       : testCommonAttrsAlign001
     * @tc.desc       : testing align for button with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_0200
     * @tc.name       : testCommonAttrsAlign002
     * @tc.desc       : testing align for button with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_0300
     * @tc.name       : testCommonAttrsAlign003
     * @tc.desc       : testing align for button with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_0400
     * @tc.name       : testCommonAttrsAlign004
     * @tc.desc       : testing align for button with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_0500
     * @tc.name       : testCommonAttrsAlign005
     * @tc.desc       : testing align for button with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign005', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_0600
     * @tc.name       : testCommonAttrsAlign006
     * @tc.desc       : testing align for button with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign006', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_0700
     * @tc.name       : testCommonAttrsAlign007
     * @tc.desc       : testing align for button with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign007', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_0800
     * @tc.name       : testCommonAttrsAlign008
     * @tc.desc       : testing align for button with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign008', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_0900
     * @tc.name       : testCommonAttrsAlign009
     * @tc.desc       : testing align for button with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign009', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_1000
     * @tc.name       : testCommonAttrsAlign010
     * @tc.desc       : testing align for button with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign010', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_1100
     * @tc.name       : testCommonAttrsAlign011
     * @tc.desc       : testing align for button with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCommonAttrsAlign011', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_1200
     * @tc.name       : testCommonAttrsAlign012
     * @tc.desc       : testing align for button with valid value
                        ARKUI_ALIGNMENT_TOP_START
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCommonAttrsAlign012', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_1300
     * @tc.name       : testCommonAttrsAlign013
     * @tc.desc       : testing align for stack with valid value
                        ARKUI_ALIGNMENT_TOP
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign013', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_1400
     * @tc.name       : testCommonAttrsAlign014
     * @tc.desc       : testing align for stack with valid value
                        ARKUI_ALIGNMENT_TOP_END
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign014', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign014()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_1500
     * @tc.name       : testCommonAttrsAlign015
     * @tc.desc       : testing align for stack with valid value
                        ARKUI_ALIGNMENT_CENTER_START
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign015', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign015()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_1600
     * @tc.name       : testCommonAttrsAlign016
     * @tc.desc       : testing align for stack with valid value
                        ARKUI_ALIGNMENT_CENTER
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign016', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign016()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_1700
     * @tc.name       : testCommonAttrsAlign017
     * @tc.desc       : testing align for stack with valid value
                        ARKUI_ALIGNMENT_CENTER_END
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign017', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign017()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_1800
     * @tc.name       : testCommonAttrsAlign018
     * @tc.desc       : testing align for stack with valid value
                        ARKUI_ALIGNMENT_BOTTOM_START
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign018', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign018()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_1900
     * @tc.name       : testCommonAttrsAlign019
     * @tc.desc       : testing align for stack with valid value
                        ARKUI_ALIGNMENT_BOTTOM
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign019', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign019()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_2000
     * @tc.name       : testCommonAttrsAlign020
     * @tc.desc       : testing align for stack with valid value
                        ARKUI_ALIGNMENT_BOTTOM_END
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign020', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign020()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_2100
     * @tc.name       : testCommonAttrsAlign021
     * @tc.desc       : testing align for stack with valid value
                        -1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign021', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign021()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_2200
     * @tc.name       : testCommonAttrsAlign022
     * @tc.desc       : testing align for stack with default value
                        9
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign022', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign022()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_2300
     * @tc.name       : testCommonAttrsAlign023
     * @tc.desc       : testing align for stack with abnormal value
                        ARKUI_ALIGNMENT_TOP_START
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign023', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign023()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_2400
     * @tc.name       : testCommonAttrsAlign024
     * @tc.desc       : testing align for stack with valid value
                        ARKUI_ALIGNMENT_TOP
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign024', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign024()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_2500
     * @tc.name       : testCommonAttrsAlign025
     * @tc.desc       : testing align for stack with valid value
                        ARKUI_ALIGNMENT_TOP_END
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign025', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign025()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_2600
     * @tc.name       : testCommonAttrsAlign026
     * @tc.desc       : testing align for stack with valid value
                        ARKUI_ALIGNMENT_CENTER_START
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign026', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign026()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_2700
     * @tc.name       : testCommonAttrsAlign027
     * @tc.desc       : testing align for stack with valid value
                        ARKUI_ALIGNMENT_CENTER
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign027', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign027()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_2800
     * @tc.name       : testCommonAttrsAlign028
     * @tc.desc       : testing align for stack with valid value
                        ARKUI_ALIGNMENT_CENTER_END
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign028', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign028()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_2900
     * @tc.name       : testCommonAttrsAlign029
     * @tc.desc       : testing align for stack with valid value
                        ARKUI_ALIGNMENT_BOTTOM_START
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign029', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign029()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_3000
     * @tc.name       : testCommonAttrsAlign030
     * @tc.desc       : testing align for stack with valid value
                        ARKUI_ALIGNMENT_BOTTOM
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign030', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign030()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_3100
     * @tc.name       : testCommonAttrsAlign031
     * @tc.desc       : testing align for stack with default value
                        ARKUI_ALIGNMENT_BOTTOM_END
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign031', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign031()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_3200
     * @tc.name       : testCommonAttrsAlign032
     * @tc.desc       : testing align for stack with abnormal value
                        ARKUI_ALIGNMENT_TOP_START
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign032', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign032()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_3300
     * @tc.name       : testCommonAttrsAlign033
     * @tc.desc       : testing align for text with valid value
                        ARKUI_ALIGNMENT_TOP
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign033', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign033()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_3400
     * @tc.name       : testCommonAttrsAlign034
     * @tc.desc       : testing align for text with valid value
                        ARKUI_ALIGNMENT_TOP_END
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign034', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign034()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_3500
     * @tc.name       : testCommonAttrsAlign035
     * @tc.desc       : testing align for text with valid value
                        ARKUI_ALIGNMENT_CENTER_START
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign035', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign035()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_3600
     * @tc.name       : testCommonAttrsAlign036
     * @tc.desc       : testing align for text with valid value
                        ARKUI_ALIGNMENT_CENTER
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign036', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign036()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_3700
     * @tc.name       : testCommonAttrsAlign037
     * @tc.desc       : testing align for text with valid value
                        ARKUI_ALIGNMENT_END
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign037', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign037()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_3800
     * @tc.name       : testCommonAttrsAlign038
     * @tc.desc       : testing align for text with valid value
                        ARKUI_ALIGNMENT_BOTTOM_START
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign038', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign038()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_3900
     * @tc.name       : testCommonAttrsAlign039
     * @tc.desc       : testing align for text with valid value
                        ARKUI_ALIGNMENT_BOTTOM
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign039', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign039()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_4000
     * @tc.name       : testCommonAttrsAlign040
     * @tc.desc       : testing align for text with valid value
                        ARKUI_ALIGNMENT_BOTTOM_END
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign040', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign040()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_4100
     * @tc.name       : testCommonAttrsAlign041
     * @tc.desc       : testing align for text with default value
                        -1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign041', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign041()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_4200
     * @tc.name       : testCommonAttrsAlign042
     * @tc.desc       : testing align for text with abnormal value
                        9
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign042', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign042()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_4300
     * @tc.name       : testCommonAttrsAlign043
     * @tc.desc       : testing resetAttribute align for text
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign043', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign043()).assertEqual(0)
      done()
    })
  })
}
