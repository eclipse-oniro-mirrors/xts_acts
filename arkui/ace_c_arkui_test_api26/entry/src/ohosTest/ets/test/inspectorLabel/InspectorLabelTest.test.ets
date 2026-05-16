/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

export default function InspectorLabelTest() {

  describe('InspectorLabelTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   InspectorLabelTest_001
     * @tc.number SUB_ACE_ARKUI_INSPECTORLABEL_0100
     * @tc.desc   Test NODE_INSPECTOR_LABEL with normal string value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('InspectorLabelTest_001', Level.LEVEL1, async (done: Function) => {
      console.info('[InspectorLabelTest_001] START');
      expect(nativeFunc.InspectorLabelTest_001()).assertEqual(0);
      console.info('[InspectorLabelTest_001] END');
      done();
    });

    /**
     * @tc.name   InspectorLabelTest_002
     * @tc.number SUB_ACE_ARKUI_INSPECTORLABEL_0200
     * @tc.desc   Test NODE_INSPECTOR_LABEL with empty string value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('InspectorLabelTest_002', Level.LEVEL1, async (done: Function) => {
      console.info('[InspectorLabelTest_002] START');
      expect(nativeFunc.InspectorLabelTest_002()).assertEqual(0);
      console.info('[InspectorLabelTest_002] END');
      done();
    });

    /**
     * @tc.name   InspectorLabelTest_003
     * @tc.number SUB_ACE_ARKUI_INSPECTORLABEL_0300
     * @tc.desc   Test NODE_INSPECTOR_LABEL with nullptr parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InspectorLabelTest_003', Level.LEVEL2, async (done: Function) => {
      console.info('[InspectorLabelTest_003] START');
      expect(nativeFunc.InspectorLabelTest_003()).assertEqual(0);
      console.info('[InspectorLabelTest_003] END');
      done();
    });
  });
}