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

import { expect, describe, it, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function unitMarginPercentTest() {

  describe('unitMarginPercentTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_UNIT_MARGIN_PERCENT_0001
     * @tc.name: testUnitMarginPercent001
     * @tc.desc: testing text for unitMarginPercent with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUnitMarginPercent001', 0, async (done: Function) => {
      expect(nativeFunc.testUnitMarginPercent001()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_UNIT_MARGIN_PERCENT_0002
     * @tc.name: testUnitMarginPercent002
     * @tc.desc: testing text for unitMarginPercent with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUnitMarginPercent002', 0, async (done: Function) => {
      expect(nativeFunc.testUnitMarginPercent002()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_UNIT_MARGIN_PERCENT_0003
     * @tc.name: testUnitMarginPercent003
     * @tc.desc: testing text for unitMarginPercent with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUnitMarginPercent003', 0, async (done: Function) => {
      expect(nativeFunc.testUnitMarginPercent003()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_UNIT_MARGIN_PERCENT_0004
     * @tc.name: testUnitMarginPercent004
     * @tc.desc: testing text for unitMarginPercent with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUnitMarginPercent004', 0, async (done: Function) => {
      expect(nativeFunc.testUnitMarginPercent004()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_UNIT_MARGIN_PERCENT_0005
     * @tc.name: testUnitMarginPercent005
     * @tc.desc: testing text for unitMarginPercent with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUnitMarginPercent005', 0, async (done: Function) => {
      expect(nativeFunc.testUnitMarginPercent005()).assertEqual(0)
      done();
    });
  })
}
