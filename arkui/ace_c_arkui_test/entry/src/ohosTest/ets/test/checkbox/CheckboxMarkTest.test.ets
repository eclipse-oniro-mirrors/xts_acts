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

export default function checkboxMarkTest() {

  describe('CheckboxMarkTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCheckboxMark001
     * @tc.number SUB_ARKUI_CAPI_CHECKBOX_MARK_0100
     * @tc.desc   testing mark for checkbox with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckboxMark001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCheckboxMark001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCheckboxMark002
     * @tc.number SUB_ARKUI_CAPI_CHECKBOX_MARK_0200
     * @tc.desc   testing mark for checkbox with default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckboxMark002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCheckboxMark002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCheckboxMark003
     * @tc.number SUB_ARKUI_CAPI_CHECKBOX_MARK_0300
     * @tc.desc   testing mark for checkbox with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckboxMark003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCheckboxMark003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCheckboxMark004
     * @tc.number SUB_ARKUI_CAPI_CHECKBOX_MARK_0400
     * @tc.desc   testing mark for checkbox with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckboxMark004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCheckboxMark004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCheckboxMark005
     * @tc.number SUB_ARKUI_CAPI_CHECKBOX_MARK_0500
     * @tc.desc   testing mark for checkbox with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckboxMark005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCheckboxMark005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCheckboxMark006
     * @tc.number SUB_ARKUI_CAPI_CHECKBOX_MARK_0600
     * @tc.desc   testing mark for checkbox with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckboxMark006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCheckboxMark006()).assertEqual(0)
      done()
    })

  })
}
