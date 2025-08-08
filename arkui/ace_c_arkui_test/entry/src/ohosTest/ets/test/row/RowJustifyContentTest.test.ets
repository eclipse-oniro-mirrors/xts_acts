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

export default function rowJustifyContentTest() {

  describe('RowJustifyContentTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_ROW_JUSTIFYCONTENT_0100
     * @tc.name: testRowJustifyContent001
     * @tc.desc: testing justifyContent for row with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testRowJustifyContent001', 0, async (done: Function) => {
      expect(nativeFunc.testRowJustifyContent001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_ROW_JUSTIFYCONTENT_0200
     * @tc.name: testRowJustifyContent002
     * @tc.desc: testing justifyContent for row with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testRowJustifyContent002', 0, async (done: Function) => {
      expect(nativeFunc.testRowJustifyContent002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_ROW_JUSTIFYCONTENT_0300
     * @tc.name: testRowJustifyContent003
     * @tc.desc: testing justifyContent for row with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testRowJustifyContent003', 0, async (done: Function) => {
      expect(nativeFunc.testRowJustifyContent003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_ROW_JUSTIFYCONTENT_0400
     * @tc.name: testRowJustifyContent004
     * @tc.desc: testing justifyContent for row with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testRowJustifyContent004', 0, async (done: Function) => {
      expect(nativeFunc.testRowJustifyContent004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_ROW_JUSTIFYCONTENT_0500
     * @tc.name: testRowJustifyContent005
     * @tc.desc: testing justifyContent for row with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testRowJustifyContent005', 0, async (done: Function) => {
      expect(nativeFunc.testRowJustifyContent005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_ROW_JUSTIFYCONTENT_0600
     * @tc.name: testRowJustifyContent006
     * @tc.desc: testing justifyContent for row with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testRowJustifyContent006', 0, async (done: Function) => {
      expect(nativeFunc.testRowJustifyContent006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_ROW_JUSTIFYCONTENT_0700
     * @tc.name: testRowJustifyContent007
     * @tc.desc: testing justifyContent for row with unnormal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testRowJustifyContent007', 0, async (done: Function) => {
      expect(nativeFunc.testRowJustifyContent007()).assertEqual(0)
      done()
    })
  })
}
