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

export default function DragSetDragEventStrictReportTest() {

  describe('DragSetDragEventStrictReportTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_Drag_SetDragEventStrictReport_0100
     * @tc.name       : SetDragEventStrictReportTest001
     * @tc.desc       : testing SetDragEventStrictReport event callback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('DragSetDragEventStrictReportTest001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.drag_setDragEventStrictReportWidthNode_001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_Drag_SetDragEventStrictReport_0200
     * @tc.name       : SetDragEventStrictReportTest002
     * @tc.desc       : testing SetDragEventStrictReport event callback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('DragSetDragEventStrictReportTest002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.drag_setDragEventStrictReportWidthNode_002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_Drag_SetDragEventStrictReport_0300
     * @tc.name       : SetDragEventStrictReportTest003
     * @tc.desc       : testing SetDragEventStrictReport event callback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('DragSetDragEventStrictReportTest003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.drag_setDragEventStrictReportWidthContext_003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_Drag_SetDragEventStrictReport_0400
     * @tc.name       : SetDragEventStrictReportTest004
     * @tc.desc       : testing SetDragEventStrictReport event callback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('DragSetDragEventStrictReportTest004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.drag_setDragEventStrictReportWidthContext_004()).assertEqual(0)
      done()
    })

  })
}
