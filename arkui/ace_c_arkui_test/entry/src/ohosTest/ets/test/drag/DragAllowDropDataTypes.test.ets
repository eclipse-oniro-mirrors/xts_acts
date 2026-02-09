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

export default function DragAllowDropDataTypesTest() {

  describe('DragAllowDropDataTypesTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   DragSetNodeAllowedDropDataTypesTest001
     * @tc.number SUB_ARKUI_CAPI_Drag_SetNodeAllowedDropDataTypes_0100
     * @tc.desc   testing SetNodeAllowedDropDataTypes event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DragSetNodeAllowedDropDataTypesTest001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.drag_setNodeAllowedDropDataTypes_001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   DisallowNodeAnyDropDataTypesTest002
     * @tc.number SUB_ARKUI_CAPI_Drag_DisallowNodeAnyDropDataTypes_0200
     * @tc.desc   testing DisallowNodeAnyDropDataTypes event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DisallowNodeAnyDropDataTypesTest002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.drag_disallowNodeAnyDropDataTypes_002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   AllowNodeAllDropDataTypesTest003
     * @tc.number SUB_ARKUI_CAPI_Drag_AllowNodeAllDropDataTypes_0300
     * @tc.desc   testing AllowNodeAllDropDataTypes event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AllowNodeAllDropDataTypesTest003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.drag_allowNodeAllDropDataTypes_003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   DragSetNodeDraggableTest004
     * @tc.number SUB_ARKUI_CAPI_Drag_SetNodeDraggable_0400
     * @tc.desc   testing setNodeDraggable event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DragSetNodeDraggableTest004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.drag_setNodeDraggable_004()).assertEqual(0)
      done()
    })

  })
}
