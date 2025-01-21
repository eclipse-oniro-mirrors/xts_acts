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

async function doIt(pageTag: string, testType: number, done?: Function) {
  Utils.emitEvent(pageTag, testType, 8888)
}

export default function commonAttrsJustifyContentTest() {

  describe('CommonAttrsJustifyContentTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_COMMONATTRS_JUSTIFYCONTENT_0100
     * @tc.name: testCommonAttrsJustifyContent001
     * @tc.desc: testing justifyContent for row with start value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCommonAttrsJustifyContent001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsJustifyContent001()).assertEqual(0)
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_COMMONATTRS_JUSTIFYCONTENT_0200
     * @tc.name: testCommonAttrsJustifyContent002
     * @tc.desc: testing justifyContent for row with center value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCommonAttrsJustifyContent002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsJustifyContent002()).assertEqual(0)
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_COMMONATTRS_JUSTIFYCONTENT_0300
     * @tc.name: testCommonAttrsJustifyContent003
     * @tc.desc: testing justifyContent for row with end value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCommonAttrsJustifyContent003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsJustifyContent003()).assertEqual(0)
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_COMMONATTRS_JUSTIFYCONTENT_0400
     * @tc.name: testCommonAttrsJustifyContent004
     * @tc.desc: testing justifyContent for row with space between value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCommonAttrsJustifyContent004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsJustifyContent004()).assertEqual(0)
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_COMMONATTRS_JUSTIFYCONTENT_0500
     * @tc.name: testCommonAttrsJustifyContent005
     * @tc.desc: testing justifyContent for row with space around value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCommonAttrsJustifyContent005', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsJustifyContent005()).assertEqual(0)
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_COMMONATTRS_JUSTIFYCONTENT_0600
     * @tc.name: testCommonAttrsJustifyContent006
     * @tc.desc: testing justifyContent for row with space evenly value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCommonAttrsJustifyContent006', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsJustifyContent006()).assertEqual(0)
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_COMMONATTRS_JUSTIFYCONTENT_0700
     * @tc.name: testCommonAttrsJustifyContent007
     * @tc.desc: testing justifyContent for column with start value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCommonAttrsJustifyContent007', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsJustifyContent007()).assertEqual(0)
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_COMMONATTRS_JUSTIFYCONTENT_0800
     * @tc.name: testCommonAttrsJustifyContent008
     * @tc.desc: testing justifyContent for column with center value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCommonAttrsJustifyContent008', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsJustifyContent008()).assertEqual(0)
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_COMMONATTRS_JUSTIFYCONTENT_0900
     * @tc.name: testCommonAttrsJustifyContent009
     * @tc.desc: testing justifyContent for column with end value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCommonAttrsJustifyContent009', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsJustifyContent009()).assertEqual(0)
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_COMMONATTRS_JUSTIFYCONTENT_1000
     * @tc.name: testCommonAttrsJustifyContent010
     * @tc.desc: testing justifyContent for column with space between value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCommonAttrsJustifyContent010', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsJustifyContent010()).assertEqual(0)
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_COMMONATTRS_JUSTIFYCONTENT_1100
     * @tc.name: testCommonAttrsJustifyContent011
     * @tc.desc: testing justifyContent for column with space around value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCommonAttrsJustifyContent011', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsJustifyContent011()).assertEqual(0)
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_COMMONATTRS_JUSTIFYCONTENT_1200
     * @tc.name: testCommonAttrsJustifyContent012
     * @tc.desc: testing justifyContent for column with space evenly value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCommonAttrsJustifyContent012', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsJustifyContent012()).assertEqual(0)
      done();
    })
  })
}
