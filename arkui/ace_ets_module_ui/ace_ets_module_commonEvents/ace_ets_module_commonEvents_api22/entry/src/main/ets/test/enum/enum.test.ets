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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

export default function EnumTest() {

  describe('EnumTest', () => {

    beforeEach(async (done: Function) => {
      console.info("EnumTest beforeEach start");
      done();
    });

    /**
     * @tc.number    DragPreviewMode_001
     * @tc.name      DragPreviewMode_001
     * @tc.desc      DragPreviewMode
     * @tc.level:    Level 3
     * @tc.type :
     * @tc.size :
     */
    it('DragPreviewMode_001', Level.LEVEL3, async (done: Function) => {
      console.info('DragPreviewMode_001 START');
      expect(DragPreviewMode.ENABLE_DRAG_ITEM_GRAY_EFFECT).assertEqual(5);
      console.info("[DragPreviewMode_001] end");
      done();
    });

    /**
     * @tc.number    DragPreviewMode_002
     * @tc.name      DragPreviewMode_002
     * @tc.desc      DragPreviewMode
     * @tc.level:    Level 3
     * @tc.type :
     * @tc.size :
     */
    it('DragPreviewMode_002', Level.LEVEL3, async (done: Function) => {
      console.info('DragPreviewMode_002 START');
      expect(DragPreviewMode.ENABLE_MULTI_TILE_EFFECT).assertEqual(6);
      console.info("[DragPreviewMode_002] end");
      done();
    });

    /**
     * @tc.number    TouchType_001
     * @tc.name      TouchType_001
     * @tc.desc      TouchType
     * @tc.level:    Level 3
     * @tc.type :
     * @tc.size :
     */
    it('TouchType_001', Level.LEVEL3, async (done: Function) => {
      console.info('TouchType_001 START');
      expect(TouchType.HOVER_ENTER).assertEqual(9);
      console.info("[TouchType_001] end");
      done();
    });

    /**
     * @tc.number    TouchType_002
     * @tc.name      TouchType_002
     * @tc.desc      TouchType
     * @tc.level:    Level 3
     * @tc.type :
     * @tc.size :
     */
    it('TouchType_002', Level.LEVEL3, async (done: Function) => {
      console.info('TouchType_002 START');
      expect(TouchType.HOVER_MOVE).assertEqual(10);
      console.info("[TouchType_002] end");
      done();
    });

    /**
     * @tc.number    TouchType_003
     * @tc.name      TouchType_003
     * @tc.desc      TouchType
     * @tc.level:    Level 3
     * @tc.type :
     * @tc.size :
     */
    it('TouchType_003', Level.LEVEL3, async (done: Function) => {
      console.info('TouchType_003 START');
      expect(TouchType.HOVER_EXIT).assertEqual(11);
      console.info("[TouchType_003] end");
      done();
    });

    /**
     * @tc.number    TouchType_004
     * @tc.name      TouchType_004
     * @tc.desc      TouchType
     * @tc.level:    Level 3
     * @tc.type :
     * @tc.size :
     */
    it('TouchType_004', Level.LEVEL3, async (done: Function) => {
      console.info('TouchType_004 START');
      expect(TouchType.HOVER_CANCEL).assertEqual(12);
      console.info("[TouchType_004] end");
      done();
    });

    /**
     * @tc.number    InteractionHand_001
     * @tc.name      InteractionHand_001
     * @tc.desc      InteractionHand
     * @tc.level:    Level 3
     * @tc.type :
     * @tc.size :
     */
    it('InteractionHand_001', Level.LEVEL3, async (done: Function) => {
      console.info('InteractionHand_001 START');
      expect(InteractionHand.NONE).assertEqual(0);
      console.info("[InteractionHand_001] end");
      done();
    });

    /**
     * @tc.number    InteractionHand_002
     * @tc.name      InteractionHand_002
     * @tc.desc      InteractionHan
     * @tc.level:    Level 3
     * @tc.type :
     * @tc.size :
     */
    it('InteractionHand_002', Level.LEVEL3, async (done: Function) => {
      console.info('InteractionHand_002 START');
      expect(InteractionHand.LEFT).assertEqual(1);
      console.info("[InteractionHand_002] end");
      done();
    });

    /**
     * @tc.number    InteractionHand_003
     * @tc.name      InteractionHand_003
     * @tc.desc      InteractionHand
     * @tc.level:    Level 3
     * @tc.type :
     * @tc.size :
     */
    it('InteractionHand_003', Level.LEVEL3, async (done: Function) => {
      console.info('InteractionHand_003 START');
      expect(InteractionHand.RIGHT).assertEqual(2);
      console.info("[InteractionHand_003] end");
      done();
    });

    /**
     * @tc.number    MouseAction_001
     * @tc.name      MouseAction_001
     * @tc.desc      TouchType
     * @tc.level:    Level 3
     * @tc.type :
     * @tc.size :
     */
    it('MouseAction_001', Level.LEVEL3, async (done: Function) => {
      console.info('MouseAction_001 START');
      expect(MouseAction.CANCEL).assertEqual(13);
      console.info("[MouseAction_001] end");
      done();
    });

    /**
     * @tc.number    KeySource_001
     * @tc.name      KeySource_001
     * @tc.desc      KeySource
     * @tc.level:    Level 3
     * @tc.type :
     * @tc.size :
     */
    it('KeySource_001', Level.LEVEL3, async (done: Function) => {
      console.info('KeySource_001 START');
      expect(KeySource.Unknown).assertEqual(0);
      console.info("[KeySource_001] end");
      done();
    });

    /**
     * @tc.number    KeySource_002
     * @tc.name      KeySource_002
     * @tc.desc      KeySource
     * @tc.level:    Level 3
     * @tc.type :
     * @tc.size :
     */
    it('KeySource_002', Level.LEVEL3, async (done: Function) => {
      console.info('KeySource_002 START');
      expect(KeySource.JOYSTICK).assertEqual(5);
      console.info("[KeySource_002] end");
      done();
    });

    /**
     * @tc.number    CrownAction_001
     * @tc.name      CrownAction_001
     * @tc.desc      CrownAction
     * @tc.level:    Level 3
     * @tc.type :
     * @tc.size :
     */
    it('CrownAction_001', Level.LEVEL3, async (done: Function) => {
      console.info('CrownAction_001 START');
      expect(CrownAction.BEGIN).assertEqual(0);
      console.info("[CrownAction_001] end");
      done();
    });

    /**
     * @tc.number    CrownAction_002
     * @tc.name      CrownAction_002
     * @tc.desc      CrownAction
     * @tc.level:    Level 3
     * @tc.type :
     * @tc.size :
     */
    it('CrownAction_002', Level.LEVEL3, async (done: Function) => {
      console.info('CrownAction_002 START');
      expect(CrownAction.UPDATE).assertEqual(1);
      console.info("[CrownAction_002] end");
      done();
    });

    /**
     * @tc.number    CrownAction_003
     * @tc.name      CrownAction_003
     * @tc.desc      CrownAction
     * @tc.level:    Level 3
     * @tc.type :
     * @tc.size :
     */
    it('CrownAction_003', Level.LEVEL3, async (done: Function) => {
      console.info('CrownAction_003 START');
      expect(CrownAction.END).assertEqual(2);
      console.info("[CrownAction_003] end");
      done();
    });

    /**
     * @tc.number    ResponseRegionSupportedTool_001
     * @tc.name      ResponseRegionSupportedTool_001
     * @tc.desc      ResponseRegionSupportedTool
     * @tc.level:    Level 3
     * @tc.type :
     * @tc.size :
     */
    it('ResponseRegionSupportedTool_001', Level.LEVEL3, async (done: Function) => {
      console.info('ResponseRegionSupportedTool_001 START');
      expect(ResponseRegionSupportedTool.ALL).assertEqual(0);
      console.info("[ResponseRegionSupportedTool_001] end");
      done();
    });

    /**
     * @tc.number    ResponseRegionSupportedTool_002
     * @tc.name      ResponseRegionSupportedTool_002
     * @tc.desc      ResponseRegionSupportedTool
     * @tc.level:    Level 3
     * @tc.type :
     * @tc.size :
     */
    it('ResponseRegionSupportedTool_002', Level.LEVEL3, async (done: Function) => {
      console.info('ResponseRegionSupportedTool_002 START');
      expect(ResponseRegionSupportedTool.FINGER).assertEqual(1);
      console.info("[ResponseRegionSupportedTool_002] end");
      done();
    });

    /**
     * @tc.number    ResponseRegionSupportedTool_003
     * @tc.name      ResponseRegionSupportedTool_003
     * @tc.desc      ResponseRegionSupportedTool
     * @tc.level:    Level 3
     * @tc.type :
     * @tc.size :
     */
    it('ResponseRegionSupportedTool_003', Level.LEVEL3, async (done: Function) => {
      console.info('ResponseRegionSupportedTool_003 START');
      expect(ResponseRegionSupportedTool.PEN).assertEqual(2);
      console.info("[ResponseRegionSupportedTool_003] end");
      done();
    });

    /**
     * @tc.number    ResponseRegionSupportedTool_004
     * @tc.name      ResponseRegionSupportedTool_004
     * @tc.desc      ResponseRegionSupportedTool
     * @tc.level:    Level 3
     * @tc.type :
     * @tc.size :
     */
    it('ResponseRegionSupportedTool_004', Level.LEVEL3, async (done: Function) => {
      console.info('ResponseRegionSupportedTool_004 START');
      expect(ResponseRegionSupportedTool.MOUSE).assertEqual(3);
      console.info("[ResponseRegionSupportedTool_004] end");
      done();
    });

    /**
     * @tc.number    AxisType_001
     * @tc.name      AxisType_001
     * @tc.desc      ResponseRegionSupportedTool
     * @tc.level:    Level 3
     * @tc.type :
     * @tc.size :
     */
    it('AxisType_001', Level.LEVEL3, async (done: Function) => {
      console.info('AxisType_001 START');
      expect(AxisType.VERTICAL_AXIS).assertEqual(0);
      console.info("[AxisType_001] end");
      done();
    });

    /**
     * @tc.number    AxisType_002
     * @tc.name      AxisType_002
     * @tc.desc      ResponseRegionSupportedTool
     * @tc.level:    Level 3
     * @tc.type :
     * @tc.size :
     */
    it('AxisType_002', Level.LEVEL3, async (done: Function) => {
      console.info('AxisType_002 START');
      expect(AxisType.HORIZONTAL_AXIS).assertEqual(1);
      console.info("[AxisType_002] end");
      done();
    });

    /**
     * @tc.number    AxisType_003
     * @tc.name      AxisType_003
     * @tc.desc      ResponseRegionSupportedTool
     * @tc.level:    Level 3
     * @tc.type :
     * @tc.size :
     */
    it('AxisType_003', Level.LEVEL3, async (done: Function) => {
      console.info('AxisType_003 START');
      expect(AxisType.PINCH_AXIS).assertEqual(2);
      console.info("[AxisType_003] end");
      done();
    });

    /**
     * @tc.number    GesturePriority_003
     * @tc.name      GesturePriority_003
     * @tc.desc      GesturePriority
     * @tc.level:    Level 3
     * @tc.type :
     * @tc.size :
     */
    it('GesturePriority_003', Level.LEVEL3, async (done: Function) => {
      console.info('GesturePriority_003 START');
      expect(GesturePriority.NORMAL).assertEqual(0);
      console.info("[GesturePriority_003] end");
      done();
    });

    /**
     * @tc.number    SourceType_001
     * @tc.name      SourceType_001
     * @tc.desc      GesturePriority
     * @tc.level:    Level 3
     * @tc.type :
     * @tc.size :
     */
    it('SourceType_001', Level.LEVEL3, async (done: Function) => {
      console.info('SourceType_001 START');
      expect(SourceType.KEY).assertEqual(4);
      console.info("[SourceType_001] end");
      done();
    });

    /**
     * @tc.number    SourceType_002
     * @tc.name      SourceType_002
     * @tc.desc      GesturePriority
     * @tc.level:    Level 3
     * @tc.type :
     * @tc.size :
     */
    it('SourceType_002', Level.LEVEL3, async (done: Function) => {
      console.info('SourceType_002 START');
      expect(SourceType.JOYSTICK).assertEqual(5);
      console.info("[SourceType_002] end");
      done();
    });
  })
}