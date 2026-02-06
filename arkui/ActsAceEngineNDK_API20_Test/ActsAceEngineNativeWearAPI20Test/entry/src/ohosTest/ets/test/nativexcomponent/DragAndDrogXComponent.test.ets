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

import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from "@ohos/hypium";
import nativexcomponent from 'libnativexcomponent.so';
import Utils from "../common/Utils";
import { ON, Component, Point, Driver } from "@kit.TestKit";

const FLOAT = -0.1;
const ARKUI_DRAG_STATUS_UNKNOWN = -1;
const ARKUI_ERROR_CODE_NO_ERROR = 0;
const ARKUI_DRAG_STATUS_STARTED = ARKUI_ERROR_CODE_NO_ERROR;
const ARKUI_DROP_OPERATION_MOVE = 1;
const ARKUI_DRAG_STATUS_ENDED = ARKUI_DROP_OPERATION_MOVE;
const ARKUI_DRAG_RESULT_CANCELED = 2;
const ARKUI_ERROR_CODE_PARAM_INVALID = 401;
const ARKUI_ERROR_CODE_BUFFER_SIZE_ERROR = 106202

export default function DragAndDrogXComponent() {
  describe('DragAndDrogXComponent', () => {
    let ImageComponentOne: Component;
    let ImageComponentOnePoint: Point;
    let ImageComponentTwo: Component;
    let ImageComponentTwoPoint: Point;
    let ImageComponentThree: Component;
    let ImageComponentThreePoint: Point;
    beforeAll(async (done: Function) => {
      await Utils.pushPageNoClear(`NativeXComponent/DragAndDrogXComponent`);
      ImageComponentOne = await Utils.driver.findComponent(ON.id('ImageOne'));
      ImageComponentOnePoint = await ImageComponentOne.getBoundsCenter();
      console.info(`====>ComponentPoint x====${ImageComponentOnePoint.x} y====${ImageComponentOnePoint.y}`);
      ImageComponentTwo = await Utils.driver.findComponent(ON.id('ImageTwo'));
      ImageComponentTwoPoint = await ImageComponentTwo.getBoundsCenter();
      console.info(`====>ComponentPoint x====${ImageComponentTwoPoint.x} y====${ImageComponentTwoPoint.y}`);
      ImageComponentThree = await Utils.driver.findComponent(ON.id('ImageThree'));
      ImageComponentThreePoint = await ImageComponentThree.getBoundsCenter();
      console.info(`====>ComponentPoint x====${ImageComponentThreePoint.x} y====${ImageComponentThreePoint.y}`);
      done();
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_ARKUI_DRAG_RESULT_CANCELED_0100
     * @tc.name      testGetDragResult
     * @tc.desc      Test ArkUI_FocusMove.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testGetDragResult', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_DRAG_RESULT_CANCELED_0100 start<====`);
        let Result: number = nativexcomponent.GetDragResult();
        expect(ARKUI_DRAG_RESULT_CANCELED).assertEqual(Result);
        done();
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_DRAG_RESULT_CANCELED_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_ARKUI_DROP_OPERATION_MOVE_0100
     * @tc.name      testGetDropOperationResult
     * @tc.desc      Test ArkUI_FocusMove.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testGetDropOperationResult', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_DROP_OPERATION_MOVE_0100 start<====`);
        let Result: number = nativexcomponent.GetDropOperationResult();
        expect(ARKUI_DROP_OPERATION_MOVE).assertEqual(Result);
        done();
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_DROP_OPERATION_MOVE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_ARKUI_PRE_DRAG_STATUS_UNKNOWN_0100
     * @tc.name      testGetOnPreDragResult0100
     * @tc.desc      Test ArkUI_FocusMove.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testGetOnPreDragResult0100', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_PRE_DRAG_STATUS_UNKNOWN_0100 start<====`);
        let Result: number = nativexcomponent.GetOnPreDragResult(-1);
        expect(-1).assertEqual(Result);
        done();
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_PRE_DRAG_STATUS_UNKNOWN_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_ARKUI_PRE_DRAG_STATUS_ACTION_DETECTING_0100
     * @tc.name      testGetOnPreDragResult0200
     * @tc.desc      Test ArkUI_FocusMove.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testGetOnPreDragResult0200', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_PRE_DRAG_STATUS_ACTION_DETECTING_0100 start<====`);
        let Result: number = nativexcomponent.GetOnPreDragResult(0);
        expect(0).assertEqual(Result);
        done();
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_PRE_DRAG_STATUS_ACTION_DETECTING_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_ARKUI_PRE_DRAG_STATUS_READY_TO_TRIGGER_DRAG_0100
     * @tc.name      testGetOnPreDragResult0300
     * @tc.desc      Test ArkUI_FocusMove.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testGetOnPreDragResult0300', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_PRE_DRAG_STATUS_READY_TO_TRIGGER_DRAG_0100 start<====`);
        let Result: number = nativexcomponent.GetOnPreDragResult(1);
        expect(1).assertEqual(Result);
        done();
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_PRE_DRAG_STATUS_READY_TO_TRIGGER_DRAG_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_ARKUI_PRE_DRAG_STATUS_PREVIEW_LIFT_STARTED_0100
     * @tc.name      testGetOnPreDragResult0400
     * @tc.desc      Test ArkUI_FocusMove.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testGetOnPreDragResult0400', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_PRE_DRAG_STATUS_PREVIEW_LIFT_STARTED_0100 start<====`);
        let Result: number = nativexcomponent.GetOnPreDragResult(2);
        expect(2).assertEqual(Result);
        done();
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_PRE_DRAG_STATUS_PREVIEW_LIFT_STARTED_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_ARKUI_PRE_DRAG_STATUS_PREVIEW_LIFT_FINISHED_0100
     * @tc.name      testGetOnPreDragResult0500
     * @tc.desc      Test ArkUI_FocusMove.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testGetOnPreDragResult0500', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_PRE_DRAG_STATUS_PREVIEW_LIFT_FINISHED_0100 start<====`);
        let Result: number = nativexcomponent.GetOnPreDragResult(3);
        expect(3).assertEqual(Result);
        done();
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_PRE_DRAG_STATUS_PREVIEW_LIFT_FINISHED_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_ARKUI_PRE_DRAG_STATUS_PREVIEW_LANDING_STARTED_0100
     * @tc.name      testGetOnPreDragResult0600
     * @tc.desc      Test ArkUI_FocusMove.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testGetOnPreDragResult0600', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await Utils.driver.longClickAt(ImageComponentOnePoint, 1500);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_PRE_DRAG_STATUS_PREVIEW_LANDING_STARTED_0100 start<====`);
        let Result: number = nativexcomponent.GetOnPreDragResult(4);
        expect(4).assertEqual(Result);
        done();
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_PRE_DRAG_STATUS_PREVIEW_LANDING_STARTED_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_ARKUI_PRE_DRAG_STATUS_PREVIEW_LANDING_FINISHED_0100
     * @tc.name      testGetOnPreDragResult0700
     * @tc.desc      Test ArkUI_FocusMove.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testGetOnPreDragResult0700', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await Utils.driver.longClickAt(ImageComponentOnePoint, 1500);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_PRE_DRAG_STATUS_PREVIEW_LANDING_FINISHED_0100 start<====`);
        let Result: number = nativexcomponent.GetOnPreDragResult(5);
        expect(5).assertEqual(Result);
        done();
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_PRE_DRAG_STATUS_PREVIEW_LANDING_FINISHED_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_ARKUI_PRE_DRAG_STATUS_CANCELED_BEFORE_DRAG_0100
     * @tc.name      testGetOnPreDragResult0800
     * @tc.desc      Test ArkUI_FocusMove.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testGetOnPreDragResult0800', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await Utils.simulateByShell(`uinput -T -d 608 864 -i 700 -d 608 1974 -u 608 1974 -u 608 864`);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_PRE_DRAG_STATUS_CANCELED_BEFORE_DRAG_0100 start<====`);
        let Result: number = nativexcomponent.GetOnPreDragResult(6);
        expect(6).assertEqual(Result);
        done();
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_PRE_DRAG_STATUS_CANCELED_BEFORE_DRAG_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_ARKUI_DRAG_PREVIEW_SCALE_AUTO_0100
     * @tc.name      testDragPreviewOptionSetScaleMode
     * @tc.desc      Test ArkUI_FocusMove.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragPreviewOptionSetScaleMode', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_PRE_DRAG_STATUS_CANCELED_BEFORE_DRAG_0100 start<====`);
        let Result: number = nativexcomponent.DragPreviewOptionSetScaleMode();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done();
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_PRE_DRAG_STATUS_CANCELED_BEFORE_DRAG_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_ARKUI_DRAG_STATUS_UNKNOWN_0100
     * @tc.name      testDragAndDropInfoGetDragStatusUnknown
     * @tc.desc      Test ArkUI_FocusMove.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragAndDropInfoGetDragStatusUnknown', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_DRAG_STATUS_UNKNOWN_0100 start<====`);
        let Result: number = nativexcomponent.DragAndDropInfoGetDragStatusUnknown();
        expect(ARKUI_DRAG_STATUS_UNKNOWN).assertEqual(Result);
        done();
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_DRAG_STATUS_UNKNOWN_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_ARKUI_DRAG_STATUS_STARTED_0100
     * @tc.name      testDragAndDropInfoGetDragStatusStarted
     * @tc.desc      Test ArkUI_FocusMove.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragAndDropInfoGetDragStatusStarted', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentThree.click();
        await Utils.sleep(1000);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_DRAG_STATUS_STARTED_0100 start<====`);
        let Result: number = nativexcomponent.DragAndDropInfoGetDragStatusStarted();
        expect(ARKUI_DRAG_STATUS_STARTED).assertEqual(Result);
        done();
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_DRAG_STATUS_STARTED_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_ARKUI_DRAG_STATUS_ENDED_0100
     * @tc.name      testDragAndDropInfoGetDragStatusEnded
     * @tc.desc      Test ArkUI_FocusMove.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragAndDropInfoGetDragStatusEnded', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentThree.click();
        await Utils.sleep(1000);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_DRAG_STATUS_ENDED_0100 start<====`);
        let Result: number = nativexcomponent.DragAndDropInfoGetDragStatusEnded();
        expect(ARKUI_DRAG_STATUS_ENDED).assertEqual(Result);
        done();
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_DRAG_STATUS_ENDED_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_DISABLEDEFAULTDROPANIMATION_0100
     * @tc.name      testDragEventDisableDefaultDropAnimationOk
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventDisableDefaultDropAnimationOk', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_DISABLEDEFAULTDROPANIMATION_0100 start<====`);
        let Result: number = nativexcomponent.DragEventDisableDefaultDropAnimationOk();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_DISABLEDEFAULTDROPANIMATION_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_DISABLEDEFAULTDROPANIMATION_0200
     * @tc.name      testDragEventDisableDefaultDropAnimationParamInvalid
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventDisableDefaultDropAnimationParamInvalid', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_DISABLEDEFAULTDROPANIMATION_0200 start<====`);
        let Result: number = nativexcomponent.DragEventDisableDefaultDropAnimationParamInvalid();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_DISABLEDEFAULTDROPANIMATION_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_SETSUGGESTEDDROPOPERATION_0100
     * @tc.name      testDragEventSetSuggestedDropOperationOk
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventSetSuggestedDropOperationOk', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_SETSUGGESTEDDROPOPERATION_0100 start<====`);
        let Result: number = nativexcomponent.DragEventSetSuggestedDropOperationOk();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_SETSUGGESTEDDROPOPERATION_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_SETSUGGESTEDDROPOPERATION_0200
     * @tc.name      testDragEventSetSuggestedDropOperationParamInvalid
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventSetSuggestedDropOperationParamInvalid', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_SETSUGGESTEDDROPOPERATION_0200 start<====`);
        let Result: number = nativexcomponent.DragEventSetSuggestedDropOperationParamInvalid();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_SETSUGGESTEDDROPOPERATION_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_SETDRAGRESULT_0100
     * @tc.name      testDragEventSetDragResultOk
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventSetDragResultOk', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_SETDRAGRESULT_0100 start<====`);
        let Result: number = nativexcomponent.DragEventSetDragResultOk();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_SETDRAGRESULT_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_SETDRAGRESULT_0200
     * @tc.name      testDragEventSetDragResultParamInvalid
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventSetDragResultParamInvalid', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_SETDRAGRESULT_0200 start<====`);
        let Result: number = nativexcomponent.DragEventSetDragResultParamInvalid();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_SETDRAGRESULT_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_SETDATA_0100
     * @tc.name      testDragEventSetDataOk
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventSetDataOk', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_SETDATA_0100 start<====`);
        let Result: number = nativexcomponent.DragEventSetDataOk();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_SETDATA_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_SETDATA_0200
     * @tc.name      testDragEventSetDataParamInvalid
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventSetDataParamInvalid', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_SETDATA_0200 start<====`);
        let Result: number = nativexcomponent.DragEventSetDataParamInvalid();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_SETDATA_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_SETDATALOADPARAMS_0100
     * @tc.name      testDragEventSetDataLoadParamsOk
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventSetDataLoadParamsOk', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_SETDATALOADPARAMS_0100 start<====`);
        let Result: number = nativexcomponent.DragEventSetDataLoadParamsOk();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_SETDATALOADPARAMS_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_SETDATALOADPARAMS_0200
     * @tc.name      testDragEventSetDataLoadParamsParamInvalid
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventSetDataLoadParamsParamInvalid', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_SETDATALOADPARAMS_0200 start<====`);
        let Result: number = nativexcomponent.DragEventSetDataLoadParamsParamInvalid();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_SETDATALOADPARAMS_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETUDMFDATA_0100
     * @tc.name      testDragEventGetUdmfDataOk
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventGetUdmfDataOk', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETUDMFDATA_0100 start<====`);
        let Result: number = nativexcomponent.DragEventGetUdmfDataOk();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETUDMFDATA_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETUDMFDATA_0200
     * @tc.name      testDragEventGetUdmfDataParamInvalid
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventGetUdmfDataParamInvalid', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETUDMFDATA_0200 start<====`);
        let Result: number = nativexcomponent.DragEventGetUdmfDataParamInvalid();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETUDMFDATA_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDATATYPECOUNT_0100
     * @tc.name      testDragEventGetDataTypeCountOk
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventGetDataTypeCountOk', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDATATYPECOUNT_0100 start<====`);
        let Result: number = nativexcomponent.DragEventGetDataTypeCountOk();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDATATYPECOUNT_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDATATYPECOUNT_0200
     * @tc.name      testDragEventGetDataTypeCountParamInvalid
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventGetDataTypeCountParamInvalid', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDATATYPECOUNT_0200 start<====`);
        let Result: number = nativexcomponent.DragEventGetDataTypeCountParamInvalid();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDATATYPECOUNT_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDATATYPES_0100
     * @tc.name      testDragEventGetDataTypesOk
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventGetDataTypesOk', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDATATYPES_0100 start<====`);
        let Result: number = nativexcomponent.DragEventGetDataTypesOk();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDATATYPES_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDATATYPES_0200
     * @tc.name      testDragEventGetDataTypesParamInvalid
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventGetDataTypesParamInvalid', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDATATYPES_0200 start<====`);
        let Result: number = nativexcomponent.DragEventGetDataTypesParamInvalid();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDATATYPES_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDATATYPES_0300
     * @tc.name      testDragEventGetDataTypesBufferSizeError
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventGetDataTypesBufferSizeError', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDATATYPES_0300 start<====`);
        let Result: number = nativexcomponent.DragEventGetDataTypesBufferSizeError();
        expect(ARKUI_ERROR_CODE_BUFFER_SIZE_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDATATYPES_0300 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDRAGRESULT_0100
     * @tc.name      testDragEventGetDragResultOk
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventGetDragResultOk', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDRAGRESULT_0100 start<====`);
        let Result: number = nativexcomponent.DragEventGetDragResultOk();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDRAGRESULT_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDRAGRESULT_0200
     * @tc.name      testDragEventGetDragResultParamInvalid
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventGetDragResultParamInvalid', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDRAGRESULT_0200 start<====`);
        let Result: number = nativexcomponent.DragEventGetDragResultParamInvalid();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDRAGRESULT_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDROPOPERATION_0100
     * @tc.name      testDragEventGetDropOperationOk
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventGetDropOperationOk', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDROPOPERATION_0100 start<====`);
        let Result: number = nativexcomponent.DragEventGetDropOperationOk();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDROPOPERATION_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDROPOPERATION_0200
     * @tc.name      testDragEventGetDropOperationParamInvalid
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventGetDropOperationParamInvalid', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDROPOPERATION_0200 start<====`);
        let Result: number = nativexcomponent.DragEventGetDropOperationParamInvalid();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDROPOPERATION_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETTOUCHPOINTXTOGLOBALDISPLAY_0100
     * @tc.name      testGetDragTouchPointDisplayX
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testGetDragTouchPointDisplayX', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDROPOPERATION_0100 start<====`);
        let Result: number = nativexcomponent.GetDragTouchPointDisplayX();
        expect(FLOAT).assertLess(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDROPOPERATION_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETTOUCHPOINTYTOGLOBALDISPLAY_0100
     * @tc.name      testGetDragTouchPointDisplayY
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testGetDragTouchPointDisplayY', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDROPOPERATION_0100 start<====`);
        let Result: number = nativexcomponent.GetDragTouchPointDisplayY();
        expect(FLOAT).assertLess(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDROPOPERATION_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETMODIFIERKEYSTATES_0100
     * @tc.name      testDragEventGetModifierKeyStatesOk
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventGetModifierKeyStatesOk', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETMODIFIERKEYSTATES_0100 start<====`);
        let Result: number = nativexcomponent.DragEventGetModifierKeyStatesOk();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETMODIFIERKEYSTATES_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETMODIFIERKEYSTATES_0200
     * @tc.name      testDragEventGetModifierKeyStatesParamInvalid
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventGetModifierKeyStatesParamInvalid', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETMODIFIERKEYSTATES_0200 start<====`);
        let Result: number = nativexcomponent.DragEventGetModifierKeyStatesParamInvalid();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETMODIFIERKEYSTATES_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDISPLAYID_0100
     * @tc.name      testDragEventGetDisplayIdOk
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventGetDisplayIdOk', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDISPLAYID_0100 start<====`);
        let Result: number = nativexcomponent.DragEventGetDisplayIdOk();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDISPLAYID_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDISPLAYID_0200
     * @tc.name      testDragEventGetDisplayIdParamInvalid
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventGetDisplayIdParamInvalid', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDISPLAYID_0200 start<====`);
        let Result: number = nativexcomponent.DragEventGetDisplayIdParamInvalid();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDISPLAYID_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_STARTDATALOADING_0100
     * @tc.name      testDragEventStartDataLoadingOk
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventStartDataLoadingOk', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_STARTDATALOADING_0100 start<====`);
        let Result: number = nativexcomponent.DragEventStartDataLoadingOk();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_STARTDATALOADING_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_STARTDATALOADING_0200
     * @tc.name      testDragEventStartDataLoadingParamInvalid
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventStartDataLoadingParamInvalid', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_STARTDATALOADING_0200 start<====`);
        let Result: number = nativexcomponent.DragEventStartDataLoadingParamInvalid();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_STARTDATALOADING_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_CANCELDATALOADING_0100
     * @tc.name      testDragEventCancelDataLoadingOk
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventCancelDataLoadingOk', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_CANCELDATALOADING_0100 start<====`);
        let Result: number = nativexcomponent.DragEventCancelDataLoadingOk(globalThis.UIcontext);
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_CANCELDATALOADING_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_CANCELDATALOADING_0200
     * @tc.name      testDragEventCancelDataLoadingParamInvalid
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventCancelDataLoadingParamInvalid', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_CANCELDATALOADING_0200 start<====`);
        let Result: number = nativexcomponent.DragEventCancelDataLoadingParamInvalid();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_CANCELDATALOADING_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DISABLEDROPDATAPREFETCHONNODE_0100
     * @tc.name      testDisableDropDataPrefetchOnNodeOk
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDisableDropDataPrefetchOnNodeOk', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DISABLEDROPDATAPREFETCHONNODE_0100 start<====`);
        let Result: number = nativexcomponent.DisableDropDataPrefetchOnNodeOk();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DISABLEDROPDATAPREFETCHONNODE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DISABLEDROPDATAPREFETCHONNODE_0200
     * @tc.name      testDisableDropDataPrefetchOnNodeParamInvalid
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDisableDropDataPrefetchOnNodeParamInvalid', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DISABLEDROPDATAPREFETCHONNODE_0200 start<====`);
        let Result: number = nativexcomponent.DisableDropDataPrefetchOnNodeParamInvalid();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DISABLEDROPDATAPREFETCHONNODE_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGACTION_SETDATALOADPARAMS_0100
     * @tc.name      testDragActionSetDataLoadParamsOk
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragActionSetDataLoadParamsOk', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGACTION_SETDATALOADPARAMS_0100 start<====`);
        let Result: number = nativexcomponent.DragActionSetDataLoadParamsOk();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGACTION_SETDATALOADPARAMS_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGACTION_SETDATALOADPARAMS_0200
     * @tc.name      testDragActionSetDataLoadParamsParamInvalid
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragActionSetDataLoadParamsParamInvalid', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGACTION_SETDATALOADPARAMS_0200 start<====`);
        let Result: number = nativexcomponent.DragActionSetDataLoadParamsParamInvalid();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGACTION_SETDATALOADPARAMS_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDRAGSOURCE_0100
     * @tc.name      testDragEventGetDragSourceOk
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventGetDragSourceOk', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDRAGSOURCE_0100 start<====`);
        let Result: number = nativexcomponent.DragEventGetDragSourceOk();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDRAGSOURCE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDRAGSOURCE_0200
     * @tc.name      testDragEventGetDragSourceParamInvalid
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventGetDragSourceParamInvalid', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDRAGSOURCE_0200 start<====`);
        let Result: number = nativexcomponent.DragEventGetDragSourceParamInvalid();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_GETDRAGSOURCE_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_ISREMOTE_0100
     * @tc.name      testDragEventIsRemoteOk
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventIsRemoteOk', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_ISREMOTE_0100 start<====`);
        let Result: number = nativexcomponent.DragEventIsRemoteOk();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_ISREMOTE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_ISREMOTE_0200
     * @tc.name      testDragEventIsRemoteParamInvalid
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testDragEventIsRemoteParamInvalid', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ImageComponentOne.dragTo(ImageComponentTwo);
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_ISREMOTE_0200 start<====`);
        let Result: number = nativexcomponent.DragEventIsRemoteParamInvalid();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_DRAGEVENT_ISREMOTE_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ENABLEDROPDISALLOWEDBADGE_0100
     * @tc.name      testEnableDropDisallowedBadgeOk
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testEnableDropDisallowedBadgeOk', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ENABLEDROPDISALLOWEDBADGE_0100 start<====`);
        let Result: number = nativexcomponent.EnableDropDisallowedBadgeOk();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ENABLEDROPDISALLOWEDBADGE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number    SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ENABLEDROPDISALLOWEDBADGE_0200
     * @tc.name      testEnableDropDisallowedBadgeParamInvalid
     * @tc.desc      Test get native xcomopnent key event action works.
     * @tc.level     LEVEL1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('testEnableDropDisallowedBadgeParamInvalid', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ENABLEDROPDISALLOWEDBADGE_0200 start<====`);
        let Result: number = nativexcomponent.EnableDropDisallowedBadgeParamInvalid();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ENABLEDROPDISALLOWEDBADGE_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
  })
}