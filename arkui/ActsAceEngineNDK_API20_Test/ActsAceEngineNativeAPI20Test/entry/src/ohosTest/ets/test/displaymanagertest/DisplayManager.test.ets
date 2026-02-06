/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll } from '@ohos/hypium'
import displaymanager from 'libdisplaymanager.so'
import { BusinessError } from '@kit.BasicServicesKit';
const Success = 0;
export default function DisplayManagerTest() {
  describe('DisplayManagerTest', () => {

    /**
     * @tc.number  : SUB_OH_ArkuiAiAnalysisFinish_3300
     * @tc.name    : SUB_OH_ArkuiAiAnalysisFinish_3300
     * @tc.desc    : Test ArkuiAiAnalysisFinish
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_ArkuiAiAnalysisFinish_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_ArkuiAiAnalysisFinish_3300 start====");
          let result: number = displaymanager.ArkuiAiAnalysisFinish();
          console.info("====> SUB_OH_ArkuiAiAnalysisFinish_3300 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_ArkuiAiAnalysisFinish_3300 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  : SUB_OH_ArkuiAiAnalysisDisabled_3400
     * @tc.name    : SUB_OH_ArkuiAiAnalysisDisabled_3400
     * @tc.desc    : Test ArkuiAiAnalysisDisabled
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_ArkuiAiAnalysisDisabled_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_ArkuiAiAnalysisDisabled_3400 start====");
          let result: number = displaymanager.ArkuiAiAnalysisDisabled();
          console.info("====> SUB_OH_ArkuiAiAnalysisDisabled_3400 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_ArkuiAiAnalysisDisabled_3400 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  : SUB_OH_ArkuiAiAnalysisUnsupported_3500
     * @tc.name    : SUB_OH_ArkuiAiAnalysisUnsupported_3500
     * @tc.desc    : Test ArkuiAiAnalysisUnsupported
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_ArkuiAiAnalysisUnsupported_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_ArkuiAiAnalysisUnsupported_3500 start====");
          let result: number = displaymanager.ArkuiAiAnalysisUnsupported();
          console.info("====> SUB_OH_ArkuiAiAnalysisUnsupported_3500 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_ArkuiAiAnalysisUnsupported_3500 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  : SUB_OH_ArkuiAiAnalysisOngoing_3600
     * @tc.name    : SUB_OH_ArkuiAiAnalysisOngoing_3600
     * @tc.desc    : Test ArkuiAiAnalysisOngoing
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_ArkuiAiAnalysisOngoing_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_ArkuiAiAnalysisOngoing_3600 start====");
          let result: number = displaymanager.ArkuiAiAnalysisOngoing();
          console.info("====> SUB_OH_ArkuiAiAnalysisOngoing_3600 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_ArkuiAiAnalysisOngoing_3600 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  : SUB_OH_ArkuiAiAnalysisStopped_3700
     * @tc.name    : SUB_OH_ArkuiAiAnalysisStopped_3700
     * @tc.desc    : Test ArkuiAiAnalysisStopped
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_ArkuiAiAnalysisStopped_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_ArkuiAiAnalysisStopped_3700 start====");
          let result: number = displaymanager.ArkuiAiAnalysisStopped();
          console.info("====> SUB_OH_ArkuiAiAnalysisStopped_3700 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_ArkuiAiAnalysisStopped_3700 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  : SUB_OH_ArkuiNodeUndefined_3800
     * @tc.name    : SUB_OH_ArkuiNodeUndefined_3800
     * @tc.desc    : Test ArkuiNodeUndefined
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_ArkuiNodeUndefined_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_ArkuiNodeUndefined_3800 start====");
          let result: number = displaymanager.ArkuiNodeUndefined();
          console.info("====> SUB_OH_ArkuiNodeUndefined_3800 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_ArkuiNodeUndefined_3800 catch err: " + err);
          expect().assertFail();
        }
      })
  })
}