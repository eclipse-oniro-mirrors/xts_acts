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

export default function ButtonTypeTest() {

  describe('ButtonTypeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_BUTTON_TYPE_0100
     * @tc.name: testButtonType001
     * @tc.desc: testing Type for button with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testButtonType001', 0, async (done: Function) => {
      expect(nativeFunc.testButtonType001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_BUTTON_TYPE_0200
     * @tc.name: testButtonType002
     * @tc.desc: testing Type for button with capsule value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testButtonType002', 0, async (done: Function) => {
      expect(nativeFunc.testButtonType002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_BUTTON_TYPE_0300
     * @tc.name: testButtonType003
     * @tc.desc: testing Type for button with circle value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testButtonType003', 0, async (done: Function) => {
      expect(nativeFunc.testButtonType003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_BUTTON_TYPE_0400
     * @tc.name: testButtonType004
     * @tc.desc: testing Type for button with invalid value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testButtonType004', 0, async (done: Function) => {
      expect(nativeFunc.testButtonType004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_BUTTON_TYPE_0500
     * @tc.name: testButtonType005
     * @tc.desc: testing Type for button with invalid value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testButtonType005', 0, async (done: Function) => {
      expect(nativeFunc.testButtonType005()).assertEqual(0)
      done()
    })

  })
}