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

export default function unitPaddingPercentTest() {

  describe('unitPaddingPercentTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_UNIT_PADDING_PERCENT_0001
     * @tc.name: testUnitPaddingPercent001
     * @tc.desc: testing text for unitPaddingPercent with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUnitPaddingPercent001', 0, async (done: Function) => {
      expect(nativeFunc.testUnitPaddingPercent001()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_UNIT_PADDING_PERCENT_0002
     * @tc.name: testUnitPaddingPercent002
     * @tc.desc: testing text for unitPaddingPercent with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUnitPaddingPercent002', 0, async (done: Function) => {
      expect(nativeFunc.testUnitPaddingPercent002()).assertEqual(0)
      done();
    }); 
    /*
     * @tc.number: SUB_ARKUI_CAPI_UNIT_PADDING_PERCENT_0003
     * @tc.name: testUnitPaddingPercent003
     * @tc.desc: testing text for unitPaddingPercent with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUnitPaddingPercent003', 0, async (done: Function) => {
      expect(nativeFunc.testUnitPaddingPercent003()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_UNIT_PADDING_PERCENT_0004
     * @tc.name: testUnitPaddingPercent004
     * @tc.desc: testing text for unitPaddingPercent with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUnitPaddingPercent004', 0, async (done: Function) => {
      expect(nativeFunc.testUnitPaddingPercent004()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_UNIT_PADDING_PERCENT_0005
     * @tc.name: testUnitPaddingPercent005
     * @tc.desc: testing text for unitPaddingPercent with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUnitPaddingPercent005', 0, async (done: Function) => {
      expect(nativeFunc.testUnitPaddingPercent005()).assertEqual(0)
      done();
    });
  })
}
