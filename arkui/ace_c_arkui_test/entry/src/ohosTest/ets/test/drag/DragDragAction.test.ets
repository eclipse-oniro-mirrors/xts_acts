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

import { beforeEach, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function DragDragActionTest() {

  describe('DragDragActionTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DragAction_0100
     * @tc.name       : DragActionTest001
     * @tc.desc       : testing DragAction event callback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('DragActionTest001', 0, async (done: Function) => {
      expect(nativeFunc.drag_DragAction_Dispose_001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DragAction_0200
     * @tc.name       : DragActionTest002
     * @tc.desc       : testing SetPointerId event callback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('DragActionTest002', 0, async (done: Function) => {
      expect(nativeFunc.drag_DragAction_SetPointerId_002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SetPixelMaps_0300
     * @tc.name       : SetPixelMapsTest003
     * @tc.desc       : testing SetPointerId event callback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('DragActionTest003', 0, async (done: Function) => {
      expect(nativeFunc.drag_DragAction_SetPixelMaps_003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DragAction_0400
     * @tc.name       : DragActionTest004
     * @tc.desc       : testing SetTouchPointX event callback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('DragActionTest004', 0, async (done: Function) => {
      expect(nativeFunc.drag_DragAction_SetTouchPointX_004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_Drag_DragAction_0500
     * @tc.name       : DragActionTest005
     * @tc.desc       : testing SetTouchPointY event callback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('DragActionTest005', 0, async (done: Function) => {
      expect(nativeFunc.drag_DragAction_SetTouchPointY_005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_Drag_DragAction_0600
     * @tc.name       : DragActionTest006
     * @tc.desc       : testing SetDragPreviewOption event callback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('DragActionTest006', 0, async (done: Function) => {
      expect(nativeFunc.drag_DragAction_SetDragPreviewOption_006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_Drag_DragAction_0700
     * @tc.name       : DragActionTest007
     * @tc.desc       : testing RegisterStatusListener event callback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('DragActionTest007', 0, async (done: Function) => {
      expect(nativeFunc.drag_DragAction_RegisterStatusListener_007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_Drag_DragAction_0800
     * @tc.name       : DragActionTest008
     * @tc.desc       : testing UnregisterStatusListener event callback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('DragActionTest008', 0, async (done: Function) => {
      expect(nativeFunc.drag_DragAction_UnregisterStatusListener_008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_Drag_DragAction_0900
     * @tc.name       : DragActionTest009
     * @tc.desc       : testing UnregisterStatusListener event callback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('DragActionTest009', 0, async (done: Function) => {
      expect(nativeFunc.drag_DragAction_StartDrag_009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_Drag_DragAction_0010
     * @tc.name       : DragActionTest0010
     * @tc.desc       : testing UnregisterStatusListener event callback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('DragAndDropInfoTest0010', 0, async (done: Function) => {
      expect(nativeFunc.drag_DragAction_DragAndDropInfo_0010()).assertEqual(0)
      done()
    })

  })
}
