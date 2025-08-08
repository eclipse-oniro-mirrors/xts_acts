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

export default function columnJustifyContentTest() {

  describe('ColumnJustifyContentTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_COLUMN_JUSTIFYCONTENT_0100
     * @tc.name: testColumnJustifyContent001
     * @tc.desc: testing justifyContent for column with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testColumnJustifyContent001', 0, async (done: Function) => {
      expect(nativeFunc.testColumnJustifyContent001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_COLUMN_JUSTIFYCONTENT_0200
     * @tc.name: testColumnJustifyContent002
     * @tc.desc: testing justifyContent for column with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testColumnJustifyContent002', 0, async (done: Function) => {
      expect(nativeFunc.testColumnJustifyContent002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_COLUMN_JUSTIFYCONTENT_0300
     * @tc.name: testColumnJustifyContent003
     * @tc.desc: testing justifyContent for column with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testColumnJustifyContent003', 0, async (done: Function) => {
      expect(nativeFunc.testColumnJustifyContent003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_COLUMN_JUSTIFYCONTENT_0400
     * @tc.name: testColumnJustifyContent004
     * @tc.desc: testing justifyContent for column with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testColumnJustifyContent004', 0, async (done: Function) => {
      expect(nativeFunc.testColumnJustifyContent004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_COLUMN_JUSTIFYCONTENT_0500
     * @tc.name: testColumnJustifyContent005
     * @tc.desc: testing justifyContent for column with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testColumnJustifyContent005', 0, async (done: Function) => {
      expect(nativeFunc.testColumnJustifyContent005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_COLUMN_JUSTIFYCONTENT_0600
     * @tc.name: testColumnJustifyContent006
     * @tc.desc: testing justifyContent for column with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testColumnJustifyContent006', 0, async (done: Function) => {
      expect(nativeFunc.testColumnJustifyContent006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_COLUMN_JUSTIFYCONTENT_0700
     * @tc.name: testColumnJustifyContent007
     * @tc.desc: testing justifyContent for column with unnormal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testColumnJustifyContent007', 0, async (done: Function) => {
      expect(nativeFunc.testColumnJustifyContent007()).assertEqual(0)
      done()
    })
  })
}
