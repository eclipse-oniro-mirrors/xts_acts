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

export default function unitWidthPercentTest() {

  describe('unitWidthPercentTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   testUnitWidthPercent001
     * @tc.number SUB_ARKUI_CAPI_UNIT_WIDTH_PERCENT_0001
     * @tc.desc   testing text for unitWidthPercent with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitWidthPercent001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testUnitWidthPercent001()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testUnitWidthPercent002
     * @tc.number SUB_ARKUI_CAPI_UNIT_WIDTH_PERCENT_0002
     * @tc.desc   testing text for unitWidthPercent with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitWidthPercent002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testUnitWidthPercent002()).assertEqual(0)
      done();
    });  
    /**
     * @tc.name   testUnitWidthPercent003
     * @tc.number SUB_ARKUI_CAPI_UNIT_WIDTH_PERCENT_0003
     * @tc.desc   testing text for unitWidthPercent with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitWidthPercent003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testUnitWidthPercent003()).assertEqual(0)
      done();
    }); 
    /**
     * @tc.name   testUnitWidthPercent004
     * @tc.number SUB_ARKUI_CAPI_UNIT_WIDTH_PERCENT_0004
     * @tc.desc   testing text for unitWidthPercent with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitWidthPercent004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testUnitWidthPercent004()).assertEqual(0)
      done();
    }); 
    /**
     * @tc.name   testUnitWidthPercent005
     * @tc.number SUB_ARKUI_CAPI_UNIT_WIDTH_PERCENT_0005
     * @tc.desc   testing text for unitWidthPercent with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitWidthPercent005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testUnitWidthPercent005()).assertEqual(0)
      done();
    });  
  })
}
