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

export default function unitHeightPercentTest() {

  describe('unitHeightPercentTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_UNIT_HEIGHT_PERCENT_0001
     * @tc.name: testUnitHeightPercent001
     * @tc.desc: testing text for unitHeightPercent with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUnitHeightPercent001', 0, async (done: Function) => {
      expect(nativeFunc.testUnitHeightPercent001()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_UNIT_HEIGHT_PERCENT_0002
     * @tc.name: testUnitHeightPercent002
     * @tc.desc: testing text for unitHeightPercent with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUnitHeightPercent002', 0, async (done: Function) => {
      expect(nativeFunc.testUnitHeightPercent002()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_UNIT_HEIGHT_PERCENT_0003
     * @tc.name: testUnitHeightPercent003
     * @tc.desc: testing text for unitHeightPercent with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUnitHeightPercent003', 0, async (done: Function) => {
      expect(nativeFunc.testUnitHeightPercent003()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_UNIT_HEIGHT_PERCENT_0004
     * @tc.name: testUnitHeightPercent004
     * @tc.desc: testing text for unitHeightPercent with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUnitHeightPercent004', 0, async (done: Function) => {
      expect(nativeFunc.testUnitHeightPercent004()).assertEqual(0)
      done();
    }); 
    /*
     * @tc.number: SUB_ARKUI_CAPI_UNIT_HEIGHT_PERCENT_0005
     * @tc.name: testUnitHeightPercent005
     * @tc.desc: testing text for unitHeightPercent with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUnitHeightPercent005', 0, async (done: Function) => {
      expect(nativeFunc.testUnitHeightPercent005()).assertEqual(0)
      done();
    });     
  })
}
