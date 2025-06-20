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

export default function FlexOptionTest() {

  describe('FlexOptionTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_FLEX_OPTION_0100
     * @tc.name: testFlexOption001
     * @tc.desc: testing option for flex with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testFlexOption001', 0, async (done: Function) => {
      expect(nativeFunc.testFlexOption001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_FLEX_OPTION_0200
     * @tc.name: testFlexOption002
     * @tc.desc: testing option for flex with abnormal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testFlexOption002', 0, async (done: Function) => {
      expect(nativeFunc.testFlexOption002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_FLEX_OPTION_0300
     * @tc.name: testFlexOption003
     * @tc.desc: testing option for flex with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testFlexOption003', 0, async (done: Function) => {
      expect(nativeFunc.testFlexOption003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_FLEX_OPTION_0400
     * @tc.name: testFlexOption004
     * @tc.desc: testing option for flex with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testFlexOption004', 0, async (done: Function) => {
      expect(nativeFunc.testFlexOption004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_FLEX_OPTION_0500
     * @tc.name: testFlexOption005
     * @tc.desc: testing option for flex with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testFlexOption005', 0, async (done: Function) => {
      expect(nativeFunc.testFlexOption005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_FLEX_OPTION_0600
     * @tc.name: testFlexOption006
     * @tc.desc: testing option for flex with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testFlexOption006', 0, async (done: Function) => {
      expect(nativeFunc.testFlexOption006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_FLEX_OPTION_0700
     * @tc.name: testFlexOption007
     * @tc.desc: testing option for flex with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testFlexOption007', 0, async (done: Function) => {
      expect(nativeFunc.testFlexOption007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_FLEX_OPTION_0800
     * @tc.name: testFlexOption008
     * @tc.desc: testing option for flex with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testFlexOption008', 0, async (done: Function) => {
      expect(nativeFunc.testFlexOption008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_FLEX_OPTION_0900
     * @tc.name: testFlexOption009
     * @tc.desc: testing option for flex with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testFlexOption009', 0, async (done: Function) => {
      expect(nativeFunc.testFlexOption009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_FLEX_OPTION_1000
     * @tc.name: testFlexOption010
     * @tc.desc: testing option for flex with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testFlexOption010', 0, async (done: Function) => {
      expect(nativeFunc.testFlexOption010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_FLEX_OPTION_1100
     * @tc.name: testFlexOption011
     * @tc.desc: testing option for flex with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testFlexOption011', 0, async (done: Function) => {
      expect(nativeFunc.testFlexOption011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_FLEX_OPTION_1200
     * @tc.name: testFlexOption012
     * @tc.desc: testing option for flex with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testFlexOption012', 0, async (done: Function) => {
      expect(nativeFunc.testFlexOption012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_FLEX_OPTION_1300
     * @tc.name: testFlexOption013
     * @tc.desc: testing option for flex with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testFlexOption013', 0, async (done: Function) => {
      expect(nativeFunc.testFlexOption013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_FLEX_OPTION_1400
     * @tc.name: testFlexOption014
     * @tc.desc: testing option for flex with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testFlexOption014', 0, async (done: Function) => {
      expect(nativeFunc.testFlexOption014()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_FLEX_OPTION_1500
     * @tc.name: testFlexOption015
     * @tc.desc: testing option for flex with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testFlexOption015', 0, async (done: Function) => {
      expect(nativeFunc.testFlexOption015()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_FLEX_OPTION_1600
     * @tc.name: testFlexOption016
     * @tc.desc: testing option for flex with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testFlexOption016', 0, async (done: Function) => {
      expect(nativeFunc.testFlexOption016()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_FLEX_OPTION_1700
     * @tc.name: testFlexOption017
     * @tc.desc: testing option for flex with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testFlexOption017', 0, async (done: Function) => {
      expect(nativeFunc.testFlexOption017()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_FLEX_OPTION_1800
     * @tc.name: testFlexOption018
     * @tc.desc: testing option for flex with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testFlexOption018', 0, async (done: Function) => {
      expect(nativeFunc.testFlexOption018()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_FLEX_OPTION_1900
     * @tc.name: testFlexOption019
     * @tc.desc: testing option for flex with abnormal value of "ArkUI_FlexDirection"
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testFlexOption019', 0, async (done: Function) => {
      expect(nativeFunc.testFlexOption019()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_FLEX_OPTION_2000
     * @tc.name: testFlexOption020
     * @tc.desc: testing option for flex with abnormal value of "ArkUI_FlexWrap" 
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testFlexOption020', 0, async (done: Function) => {
      expect(nativeFunc.testFlexOption020()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_FLEX_OPTION_2100
     * @tc.name: testFlexOption021
     * @tc.desc: testing option for flex with abnormal value of "ArkUI_FlexAlignment" (principal axis)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testFlexOption021', 0, async (done: Function) => {
      expect(nativeFunc.testFlexOption021()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_FLEX_OPTION_2200
     * @tc.name: testFlexOption022
     * @tc.desc: testing option for flex with abnormal value of "ArkUI_ItemAlignment"
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testFlexOption022', 0, async (done: Function) => {
      expect(nativeFunc.testFlexOption022()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_FLEX_OPTION_2300
     * @tc.name: testFlexOption023
     * @tc.desc: testing option for flex with abnormal value of "ArkUI_ItemAlignment"
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testFlexOption023', 0, async (done: Function) => {
      expect(nativeFunc.testFlexOption023()).assertEqual(0)
      done()
    })

  })
}