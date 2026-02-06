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

import { expect, describe, it, afterEach, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function unitBorderRadiusPercentTest() {

  describe('unitBorderRadiusPercentTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_UNIT_BORDER_RADIUS_PERCENT_0001
     * @tc.name: testUnitBorderRadiusPercent001
     * @tc.desc: testing text for unitBorderRadiusPercent with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUnitBorderRadiusPercent001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testUnitBorderRadiusPercent001()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_UNIT_BORDER_RADIUS_PERCENT_0002
     * @tc.name: testUnitBorderRadiusPercent002
     * @tc.desc: testing text for unitBorderRadiusPercent with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUnitBorderRadiusPercent002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testUnitBorderRadiusPercent002()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_UNIT_BORDER_RADIUS_PERCENT_0003
     * @tc.name: testUnitBorderRadiusPercent003
     * @tc.desc: testing text for unitBorderRadiusPercent with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUnitBorderRadiusPercent003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testUnitBorderRadiusPercent003()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_UNIT_BORDER_RADIUS_PERCENT_0004
     * @tc.name: testUnitBorderRadiusPercent004
     * @tc.desc: testing text for unitBorderRadiusPercent with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUnitBorderRadiusPercent004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testUnitBorderRadiusPercent004()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_UNIT_BORDER_RADIUS_PERCENT_0005
     * @tc.name: testUnitBorderRadiusPercent005
     * @tc.desc: testing text for unitBorderRadiusPercent with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUnitBorderRadiusPercent005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testUnitBorderRadiusPercent005()).assertEqual(0)
      done();
    });    
  })
}
