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

export default function customComponentLayoutConstraintTest() {

  describe('CustomComponentLayoutConstraintTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LAYOUTCONSTRAINT_CREATE_0001
     * @tc.name       : testLayoutConstraintCreate001
     * @tc.desc       : testing height for layoutConstraintCreate with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testLayoutConstraintCreate001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testLayoutConstraintCreate001()).assertEqual(0);
      done();
    });
    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LAYOUTCONSTRAINT_COPY_0001
     * @tc.name       : testLayoutConstraintCopy001
     * @tc.desc       : testing height for layoutConstraintCopy with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testLayoutConstraintCopy001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testLayoutConstraintCopy001()).assertEqual(0);
      done();
    });
    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LAYOUTCONSTRAINT_MIN_WIDTH_0001
     * @tc.name       : testLayoutConstraintMinWidth001
     * @tc.desc       : testing height for layoutConstraintMinWidth with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testLayoutConstraintMinWidth001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testLayoutConstraintMinWidth001()).assertEqual(0);
      done();
    });
    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LAYOUTCONSTRAINT_MIN_WIDTH_0002
     * @tc.name       : testLayoutConstraintMinWidth002
     * @tc.desc       : testing height for layoutConstraintMinWidth with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testLayoutConstraintMinWidth002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testLayoutConstraintMinWidth002()).assertEqual(0);
      done();
    });
    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LAYOUTCONSTRAINT_MAX_WIDTH_0001
     * @tc.name       : testLayoutConstraintMaxWidth001
     * @tc.desc       : testing height for layoutConstraintMaxWidth with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testLayoutConstraintMaxWidth001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testLayoutConstraintMaxWidth001()).assertEqual(0);
      done();
    });
    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LAYOUTCONSTRAINT_MAX_WIDTH_0002
     * @tc.name       : testLayoutConstraintMaxWidth002
     * @tc.desc       : testing height for layoutConstraintMaxWidth with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testLayoutConstraintMaxWidth002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testLayoutConstraintMaxWidth002()).assertEqual(0);
      done();
    });
    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LAYOUTCONSTRAINT_MIN_HEIGHT_0001
     * @tc.name       : testLayoutConstraintMinHeight001
     * @tc.desc       : testing height for layoutConstraintMinHeight with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testLayoutConstraintMinHeight001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testLayoutConstraintMinHeight001()).assertEqual(0);
      done();
    });
    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LAYOUTCONSTRAINT_MIN_HEIGHT_0002
     * @tc.name       : testLayoutConstraintMinHeight002
     * @tc.desc       : testing height for layoutConstraintMinHeight with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testLayoutConstraintMinHeight002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testLayoutConstraintMinHeight002()).assertEqual(0);
      done();
    });
    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LAYOUTCONSTRAINT_MAX_HEIGHT_0001
     * @tc.name       : testLayoutConstraintMaxHeight001
     * @tc.desc       : testing height for layoutConstraintMaxHeight with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testLayoutConstraintMaxHeight001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testLayoutConstraintMaxHeight001()).assertEqual(0);
      done();
    });
    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LAYOUTCONSTRAINT_MAX_HEIGHT_0002
     * @tc.name       : testLayoutConstraintMaxHeight002
     * @tc.desc       : testing height for layoutConstraintMaxHeight with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testLayoutConstraintMaxHeight002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testLayoutConstraintMaxHeight002()).assertEqual(0);
      done();
    });
    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LAYOUTCONSTRAINT_PERCENT_REFERENCE_WIDTH_0001
     * @tc.name       : testLayoutConstraintPercentReferenceWidth001
     * @tc.desc       : testing height for layoutConstraintPercentReferenceWidth with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testLayoutConstraintPercentReferenceWidth001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testLayoutConstraintPercentReferenceWidth001()).assertEqual(0);
      done();
    });
    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LAYOUTCONSTRAINT_PERCENT_REFERENCE_WIDTH_0002
     * @tc.name       : testLayoutConstraintPercentReferenceWidth002
     * @tc.desc       : testing height for layoutConstraintPercentReferenceWidth with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testLayoutConstraintPercentReferenceWidth002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testLayoutConstraintPercentReferenceWidth002()).assertEqual(0);
      done();
    });
    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LAYOUTCONSTRAINT_PERCENT_REFERENCE_HEIGHT_0001
     * @tc.name       : testLayoutConstraintPercentReferenceHeight001
     * @tc.desc       : testing height for layoutConstraintPercentReferenceHeight with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testLayoutConstraintPercentReferenceHeight001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testLayoutConstraintPercentReferenceHeight001()).assertEqual(0);
      done();
    });
    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LAYOUTCONSTRAINT_PERCENT_REFERENCE_HEIGHT_0002
     * @tc.name       : testLayoutConstraintPercentReferenceHeight002
     * @tc.desc       : testing height for layoutConstraintPercentReferenceHeight with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testLayoutConstraintPercentReferenceHeight002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testLayoutConstraintPercentReferenceHeight002()).assertEqual(0);
      done();
    });
    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LAYOUTCONSTRAINT_MEASURED_SIZE_0001
     * @tc.name       : testLayoutConstraintMeasuredSize001
     * @tc.desc       : testing height for layoutConstraintMeasuredSize with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testLayoutConstraintMeasuredSize001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testLayoutConstraintMeasuredSize001()).assertEqual(0);
      done();
    });
    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LAYOUTCONSTRAINT_MEASURED_SIZE_0002
     * @tc.name       : testLayoutConstraintMeasuredSize002
     * @tc.desc       : testing height for layoutConstraintMeasuredSize with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testLayoutConstraintMeasuredSize002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testLayoutConstraintMeasuredSize002()).assertEqual(0);
      done();
    });
    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LAYOUTCONSTRAINT_LAYOUT_POSTIONT_0001
     * @tc.name       : testLayoutConstraintLayoutPosition001
     * @tc.desc       : testing height for layoutConstraintLayoutPosition with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testLayoutConstraintLayoutPosition001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testLayoutConstraintLayoutPosition001()).assertEqual(0);
      done();
    });
    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LAYOUTCONSTRAINT_LAYOUT_POSTIONT_0002
     * @tc.name       : testLayoutConstraintLayoutPosition002
     * @tc.desc       : testing height for layoutConstraintLayoutPosition with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testLayoutConstraintLayoutPosition002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testLayoutConstraintLayoutPosition002()).assertEqual(0);
      done();
    });
    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LAYOUTCONSTRAINT_MEASURE_NODE_0001
     * @tc.name       : testLayoutConstraintMeasureNode001
     * @tc.desc       : testing height for layoutConstraintMeasureNode with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testLayoutConstraintMeasureNode001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testLayoutConstraintMeasureNode001()).assertEqual(0);
      done();
    });
    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LAYOUTCONSTRAINT_MEASURE_NODE_0002
     * @tc.name       : testLayoutConstraintMeasureNode002
     * @tc.desc       : testing height for layoutConstraintMeasureNode with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testLayoutConstraintMeasureNode002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testLayoutConstraintMeasureNode002()).assertEqual(0);
      done();
    });
    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LAYOUTCONSTRAINT_LAYOUT_NODE_0001
     * @tc.name       : testLayoutConstraintLayoutNode001
     * @tc.desc       : testing height for layoutConstraintLayoutNode with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testLayoutConstraintLayoutNode001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testLayoutConstraintLayoutNode001()).assertEqual(0);
      done();
    });
    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LAYOUTCONSTRAINT_LAYOUT_NODE_0002
     * @tc.name       : testLayoutConstraintLayoutNode002
     * @tc.desc       : testing height for layoutConstraintLayoutNode with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testLayoutConstraintLayoutNode002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testLayoutConstraintLayoutNode002()).assertEqual(0);
      done();
    });
  })
}
