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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function DragAndDropTest() {

  describe('DragAndDropTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number    Nullptr_OH_ArkUI_CreateDragActionWithContext
     * @tc.name      DragAndDropTest001
     * @tc.desc      testing interface return nullptr
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('DragAndDropTest001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Nullptr_OH_ArkUI_CreateDragActionWithContext()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number    Nullptr_OH_ArkUI_CreateDragActionWithNode
     * @tc.name      DragAndDropTest002
     * @tc.desc      testing interface return nullptr
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('DragAndDropTest002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Nullptr_OH_ArkUI_CreateDragActionWithNode()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number    DragAndDropTest003
     * @tc.name      DragAndDropTest003
     * @tc.desc      testing interface return nullptr
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('DragAndDropTest003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Nullptr_OH_ArkUI_CreateDragPreviewOption()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })
    /**
     * @tc.number    Nullptr_OH_ArkUI_GestureInterruptInfo_GetGestureEvent
     * @tc.name      NativeGestureTest001
     * @tc.desc      testing interface return nullptr
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('NativeGestureTest001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Nullptr_OH_ArkUI_GestureInterruptInfo_GetGestureEvent()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })
    /**
     * @tc.number    Nullptr_OH_ArkUI_GestureInterruptInfo_GetRecognizer
     * @tc.name      NativeGestureTest002
     * @tc.desc      testing interface return nullptr
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('NativeGestureTest002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Nullptr_OH_ArkUI_GestureInterruptInfo_GetRecognizer()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })
    /**
     * @tc.number    Nullptr_OH_ArkUI_GestureEvent_GetRawInputEvent
     * @tc.name      NativeGestureTest003
     * @tc.desc      testing interface return nullptr
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('NativeGestureTest003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Nullptr_OH_ArkUI_GestureEvent_GetRawInputEvent()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })
    /**
     * @tc.number    Nullptr_OH_ArkUI_TouchRecognizer_GetNodeHandle
     * @tc.name      NativeGestureTest004
     * @tc.desc      testing interface return nullptr
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('NativeGestureTest004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Nullptr_OH_ArkUI_TouchRecognizer_GetNodeHandle()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })
    /**
     * @tc.number    Nullptr_OH_ArkUI_GestureInterrupter_GetUserData
     * @tc.name      NativeGestureTest005
     * @tc.desc      testing interface return nullptr
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('NativeGestureTest005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Nullptr_OH_ArkUI_GestureInterrupter_GetUserData()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })
    /**
     * @tc.number    Nullptr_OH_ArkUI_ParallelInnerGestureEvent_GetUserData
     * @tc.name      NativeGestureTest006
     * @tc.desc      testing interface return nullptr
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('NativeGestureTest006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Nullptr_OH_ArkUI_ParallelInnerGestureEvent_GetUserData()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })
    /**
     * @tc.number    Nullptr_OH_ArkUI_ParallelInnerGestureEvent_GetCurrentRecognizer
     * @tc.name      NativeGestureTest007
     * @tc.desc      testing interface return nullptr
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('NativeGestureTest007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Nullptr_OH_ArkUI_ParallelInnerGestureEvent_GetCurrentRecognizer()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })
    /**
     * @tc.number    Nullptr_OH_ArkUI_NodeEvent_GetNodeHandle
     * @tc.name      NativeNodeTest001
     * @tc.desc      testing interface return nullptr
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('NativeNodeTest001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Nullptr_OH_ArkUI_NodeEvent_GetNodeHandle()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })
    /**
     * @tc.number    Nullptr_OH_ArkUI_NodeEvent_GetInputEvent
     * @tc.name      NativeNodeTest002
     * @tc.desc      testing interface return nullptr
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('NativeNodeTest002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Nullptr_OH_ArkUI_NodeEvent_GetInputEvent()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })
    /**
     * @tc.number    Nullptr_OH_ArkUI_NodeEvent_GetNodeComponentEvent
     * @tc.name      NativeNodeTest003
     * @tc.desc      testing interface return nullptr
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('NativeNodeTest003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Nullptr_OH_ArkUI_NodeEvent_GetNodeComponentEvent()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })
    /**
     * @tc.number    Nullptr_OH_ArkUI_NodeEvent_GetStringAsyncEvent
     * @tc.name      NativeNodeTest004
     * @tc.desc      testing interface return nullptr
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('NativeNodeTest004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Nullptr_OH_ArkUI_NodeEvent_GetStringAsyncEvent()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })
    /**
     * @tc.number    Nullptr_OH_ArkUI_NodeEvent_GetUserData
     * @tc.name      NativeNodeTest005
     * @tc.desc      testing interface return nullptr
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('NativeNodeTest005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Nullptr_OH_ArkUI_NodeEvent_GetUserData()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })
    /**
     * @tc.number    Nullptr_OH_ArkUI_TypeEvent_GetUserData
     * @tc.name      NativeTypeTest001
     * @tc.desc      testing interface return nullptr
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('NativeTypeTest001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Nullptr_OH_ArkUI_CreateSnapshotOptions()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })
    /**
     * @tc.number    Nullptr_OH_ArkUI_VisibleAreaEventOptions_Create
     * @tc.name      NativeTypeTest002
     * @tc.desc      testing interface return nullptr
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('NativeTypeTest002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Nullptr_OH_ArkUI_VisibleAreaEventOptions_Create()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })
    /**
     * @tc.number    Nullptr_OH_ArkUI_UIInputEvent_GetCoastingAxisEvent
     * @tc.name      UiInputTest002
     * @tc.desc      testing interface return nullptr
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('UiInputTest002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Nullptr_OH_ArkUI_UIInputEvent_GetCoastingAxisEvent()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })
    /**
     * @tc.number    Nullptr_OH_ArkUI_NodeEvent_GetTouchTestInfo
     * @tc.name      UiInputTest003
     * @tc.desc      testing interface return nullptr
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('UiInputTest003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Nullptr_OH_ArkUI_NodeEvent_GetTouchTestInfo()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })

  })
}