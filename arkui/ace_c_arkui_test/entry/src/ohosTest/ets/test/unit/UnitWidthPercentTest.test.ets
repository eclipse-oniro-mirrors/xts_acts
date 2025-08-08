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

export default function unitWidthPercentTest() {

  describe('unitWidthPercentTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_UNIT_WIDTH_PERCENT_0001
     * @tc.name: testUnitWidthPercent001
     * @tc.desc: testing text for unitWidthPercent with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUnitWidthPercent001', 0, async (done: Function) => {
      expect(nativeFunc.testUnitWidthPercent001()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_UNIT_WIDTH_PERCENT_0002
     * @tc.name: testUnitWidthPercent002
     * @tc.desc: testing text for unitWidthPercent with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUnitWidthPercent002', 0, async (done: Function) => {
      expect(nativeFunc.testUnitWidthPercent002()).assertEqual(0)
      done();
    });  
    /*
     * @tc.number: SUB_ARKUI_CAPI_UNIT_WIDTH_PERCENT_0003
     * @tc.name: testUnitWidthPercent003
     * @tc.desc: testing text for unitWidthPercent with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUnitWidthPercent003', 0, async (done: Function) => {
      expect(nativeFunc.testUnitWidthPercent003()).assertEqual(0)
      done();
    }); 
    /*
     * @tc.number: SUB_ARKUI_CAPI_UNIT_WIDTH_PERCENT_0004
     * @tc.name: testUnitWidthPercent004
     * @tc.desc: testing text for unitWidthPercent with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUnitWidthPercent004', 0, async (done: Function) => {
      expect(nativeFunc.testUnitWidthPercent004()).assertEqual(0)
      done();
    }); 
    /*
     * @tc.number: SUB_ARKUI_CAPI_UNIT_WIDTH_PERCENT_0005
     * @tc.name: testUnitWidthPercent005
     * @tc.desc: testing text for unitWidthPercent with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUnitWidthPercent005', 0, async (done: Function) => {
      expect(nativeFunc.testUnitWidthPercent005()).assertEqual(0)
      done();
    });  
  })
}
