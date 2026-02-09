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

export default function DragDragPreviewOptionTest() {

  describe('DragDragPreviewOptionTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   DragDragPreviewOptionTest001
     * @tc.number SUB_ARKUI_CAPI_Drag_DragPreviewOption_0100
     * @tc.desc   testing DragPreviewOption event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DragDragPreviewOptionTest001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.drag_DragPreviewOption_Dispose_001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   DragDragPreviewOptionTest002
     * @tc.number SUB_ARKUI_CAPI_Drag_DragPreviewOption_0200
     * @tc.desc   testing DragPreviewOption event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DragDragPreviewOptionTest002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.drag_DragPreviewOption_SetScaleMode_002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   DragDragPreviewOptionTest003
     * @tc.number SUB_ARKUI_CAPI_Drag_DragPreviewOption_0300
     * @tc.desc   testing DragPreviewOption event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DragDragPreviewOptionTest003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.drag_DragPreviewOption_SetDefaultShadowEnabled_003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   DragDragPreviewOptionTest004
     * @tc.number SUB_ARKUI_CAPI_Drag_DragPreviewOption_0400
     * @tc.desc   testing DragPreviewOption event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DragDragPreviewOptionTest004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.drag_DragPreviewOption_SetDefaultRadiusEnabled_004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   DragDragPreviewOptionTest005
     * @tc.number SUB_ARKUI_CAPI_Drag_DragPreviewOption_0500
     * @tc.desc   testing DragPreviewOption event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DragDragPreviewOptionTest005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.drag_DragPreviewOption_SetNumberBadgeEnabled_005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   DragDragPreviewOptionTest006
     * @tc.number SUB_ARKUI_CAPI_Drag_DragPreviewOption_0600
     * @tc.desc   testing DragPreviewOption event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DragDragPreviewOptionTest006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.drag_DragPreviewOption_SetBadgeNumber_006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   DragDragPreviewOptionTest007
     * @tc.number SUB_ARKUI_CAPI_Drag_DragPreviewOption_0700
     * @tc.desc   testing DragPreviewOption event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DragDragPreviewOptionTest007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.drag_DragPreviewOption_SetDefaultAnimationBeforeLiftingEnabled_007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   DragDragPreviewOptionTest008
     * @tc.number SUB_ARKUI_CAPI_Drag_DragPreviewOption_0800
     * @tc.desc   testing DragPreviewOption event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DragDragPreviewOptionTest008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.drag_DragPreviewOption_SetNodeDragPreviewOption_008()).assertEqual(0)
      done()
    })

  })
}
