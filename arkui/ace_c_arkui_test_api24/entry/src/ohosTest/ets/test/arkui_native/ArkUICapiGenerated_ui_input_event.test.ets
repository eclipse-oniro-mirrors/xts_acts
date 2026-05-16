/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import arkuiCapiTest from 'libarkuicapigen.so'


export default function arkuiNativeCapiUiInputEvent() {
  describe('UiInputEvent (ui_input_event)', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(50);
      done();
    });

    /**
     * @tc.number  TestArkUICapi_455
     * @tc.name    TestArkUICapi_455
     * @tc.desc    Case: TestArkUICapi_455. API: ARKUI_UIINPUTEVENT_TYPE_DIGITAL_CROWN. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_455', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_455()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_456
     * @tc.name    TestArkUICapi_456
     * @tc.desc    Case: TestArkUICapi_456. API: ARKUI_CROWNEVENT_ACTION_UNKNOWN. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_456', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_456()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_457
     * @tc.name    TestArkUICapi_457
     * @tc.desc    Case: TestArkUICapi_457. API: ARKUI_CROWNEVENT_ACTION_UPDATE. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_457', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_457()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_458
     * @tc.name    TestArkUICapi_458
     * @tc.desc    Case: TestArkUICapi_458. API: ARKUI_CROWNEVENT_ACTION_END. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_458', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_458()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_459
     * @tc.name    TestArkUICapi_459
     * @tc.desc    Case: TestArkUICapi_459. API: OH_ArkUI_PointerEvent_CreateClonedPointerEvent. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_459', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_459()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_460
     * @tc.name    TestArkUICapi_460
     * @tc.desc    Case: TestArkUICapi_460. API: OH_ArkUI_PointerEvent_CreatePointerEvent. Note: non-ASCII details are
     *             in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_460', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_460()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_461
     * @tc.name    TestArkUICapi_461
     * @tc.desc    Case: TestArkUICapi_461. API: OH_ArkUI_PointerEvent_DestroyClonedPointerEvent, ArkUI_UIInputEvent.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_461', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_461()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_462
     * @tc.name    TestArkUICapi_462
     * @tc.desc    Case: TestArkUICapi_462. API: OH_ArkUI_ClonedEvent_SetActionType, ArkUI_UIInputEvent. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_462', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_462()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_463
     * @tc.name    TestArkUICapi_463
     * @tc.desc    Case: TestArkUICapi_463. API: OH_ArkUI_ClonedEvent_SetSourceType, ArkUI_UIInputEvent. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_463', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_463()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_464
     * @tc.name    TestArkUICapi_464
     * @tc.desc    Case: TestArkUICapi_464. API: OH_ArkUI_ClonedEvent_SetToolType, ArkUI_UIInputEvent. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_464', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_464()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_465
     * @tc.name    TestArkUICapi_465
     * @tc.desc    Case: TestArkUICapi_465. API: OH_ArkUI_ClonedEvent_SetPressure, ArkUI_UIInputEvent. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_465', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_465()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_466
     * @tc.name    TestArkUICapi_466
     * @tc.desc    Case: TestArkUICapi_466. API: OH_ArkUI_ClonedEvent_SetPressureByIndex, ArkUI_UIInputEvent. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_466', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_466()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_467
     * @tc.name    TestArkUICapi_467
     * @tc.desc    Case: TestArkUICapi_467. API: OH_ArkUI_ClonedEvent_SetEventTime, ArkUI_UIInputEvent. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_467', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_467()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_468
     * @tc.name    TestArkUICapi_468
     * @tc.desc    Case: TestArkUICapi_468. API: OH_ArkUI_ClonedEvent_SetDeviceId, ArkUI_UIInputEvent. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_468', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_468()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_469
     * @tc.name    TestArkUICapi_469
     * @tc.desc    Case: TestArkUICapi_469. API: OH_ArkUI_ClonedEvent_SetTargetDisplayId, ArkUI_UIInputEvent. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_469', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_469()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_470
     * @tc.name    TestArkUICapi_470
     * @tc.desc    Case: TestArkUICapi_470. API: OH_ArkUI_ClonedEvent_SetChangedFingerId, ArkUI_UIInputEvent. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_470', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_470()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_471
     * @tc.name    TestArkUICapi_471
     * @tc.desc    Case: TestArkUICapi_471. API: OH_ArkUI_ClonedEvent_SetFingerIdByIndex, ArkUI_UIInputEvent. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_471', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_471()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_472
     * @tc.name    TestArkUICapi_472
     * @tc.desc    Case: TestArkUICapi_472. API: OH_ArkUI_ClonedEvent_SetChangedWindowPosition, ArkUI_UIInputEvent.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_472', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_472()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_473
     * @tc.name    TestArkUICapi_473
     * @tc.desc    Case: TestArkUICapi_473. API: OH_ArkUI_ClonedEvent_SetWindowPositionByIndex, ArkUI_UIInputEvent.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_473', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_473()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_474
     * @tc.name    TestArkUICapi_474
     * @tc.desc    Case: TestArkUICapi_474. API: OH_ArkUI_ClonedEvent_SetChangedScreenPosition, ArkUI_UIInputEvent.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_474', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_474()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_475
     * @tc.name    TestArkUICapi_475
     * @tc.desc    Case: TestArkUICapi_475. API: OH_ArkUI_ClonedEvent_SetScreenPositionByIndex, ArkUI_UIInputEvent.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_475', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_475()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_476
     * @tc.name    TestArkUICapi_476
     * @tc.desc    Case: TestArkUICapi_476. API: OH_ArkUI_ClonedEvent_SetChangedGlobalDisplayPosition,
     *             ArkUI_UIInputEvent. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_476', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_476()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_477
     * @tc.name    TestArkUICapi_477
     * @tc.desc    Case: TestArkUICapi_477. API: OH_ArkUI_ClonedEvent_SetGlobalDisplayPositionByIndex,
     *             ArkUI_UIInputEvent. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_477', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_477()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_478
     * @tc.name    TestArkUICapi_478
     * @tc.desc    Case: TestArkUICapi_478. API: OH_ArkUI_ClonedEvent_SetHandleId, ArkUI_UIInputEvent. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_478', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_478()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_479
     * @tc.name    TestArkUICapi_479
     * @tc.desc    Case: TestArkUICapi_479. API: OH_ArkUI_ClonedEvent_SetTiltAngle, ArkUI_UIInputEvent. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_479', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_479()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_480
     * @tc.name    TestArkUICapi_480
     * @tc.desc    Case: TestArkUICapi_480. API: OH_ArkUI_ClonedEvent_SetRollAngle, ArkUI_UIInputEvent. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_480', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_480()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_481
     * @tc.name    TestArkUICapi_481
     * @tc.desc    Case: TestArkUICapi_481. API: OH_ArkUI_ClonedEvent_SetPressedKeys, ArkUI_UIInputEvent. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_481', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_481()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_482
     * @tc.name    TestArkUICapi_482
     * @tc.desc    Case: TestArkUICapi_482. API: OH_ArkUI_ClonedEvent_SetChangedTouchArea, ArkUI_UIInputEvent. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_482', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_482()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_483
     * @tc.name    TestArkUICapi_483
     * @tc.desc    Case: TestArkUICapi_483. API: OH_ArkUI_ClonedEvent_SetTouchAreaByIndex, ArkUI_UIInputEvent. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_483', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_483()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_484
     * @tc.name    TestArkUICapi_484
     * @tc.desc    Case: TestArkUICapi_484. API: OH_ArkUI_ClonedEvent_SetChangedInteractionHand, ArkUI_UIInputEvent.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_484', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_484()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_485
     * @tc.name    TestArkUICapi_485
     * @tc.desc    Case: TestArkUICapi_485. API: OH_ArkUI_ClonedEvent_SetInteractionHandByIndex, ArkUI_UIInputEvent.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_485', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_485()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_486
     * @tc.name    TestArkUICapi_486
     * @tc.desc    Case: TestArkUICapi_486. API: OH_ArkUI_ClonedEvent_SetPressedTimeByIndex, ArkUI_UIInputEvent. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_486', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_486()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_487
     * @tc.name    TestArkUICapi_487
     * @tc.desc    Case: TestArkUICapi_487. API: OH_ArkUI_ClonedEvent_SetPinchAxisScaleValue, ArkUI_UIInputEvent. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_487', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_487()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_488
     * @tc.name    TestArkUICapi_488
     * @tc.desc    Case: TestArkUICapi_488. API: OH_ArkUI_ClonedEvent_SetHorizontalAxisScaleValue, ArkUI_UIInputEvent.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_488', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_488()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_489
     * @tc.name    TestArkUICapi_489
     * @tc.desc    Case: TestArkUICapi_489. API: OH_ArkUI_ClonedEvent_SetVerticalAxisScaleValue, ArkUI_UIInputEvent.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_489', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_489()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_490
     * @tc.name    TestArkUICapi_490
     * @tc.desc    Case: TestArkUICapi_490. API: OH_ArkUI_ClonedEvent_SetScrollStep, ArkUI_UIInputEvent. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_490', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_490()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_491
     * @tc.name    TestArkUICapi_491
     * @tc.desc    Case: TestArkUICapi_491. API: OH_ArkUI_ClonedEvent_SetMouseButton, ArkUI_UIInputEvent. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_491', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_491()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_492
     * @tc.name    TestArkUICapi_492
     * @tc.desc    Case: TestArkUICapi_492. API: OH_ArkUI_ClonedEvent_SetRawDeltaX, ArkUI_UIInputEvent. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_492', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_492()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_493
     * @tc.name    TestArkUICapi_493
     * @tc.desc    Case: TestArkUICapi_493. API: OH_ArkUI_ClonedEvent_SetRawDeltaY, ArkUI_UIInputEvent. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_493', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_493()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_494
     * @tc.name    TestArkUICapi_494
     * @tc.desc    Case: TestArkUICapi_494. API: OH_ArkUI_ClonedEvent_SetPressedButtons, ArkUI_UIInputEvent. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_494', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_494()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_495
     * @tc.name    TestArkUICapi_495
     * @tc.desc    Case: TestArkUICapi_495. API: OH_ArkUI_PointerEvent_PostClonedEventWithStrategy, ArkUI_NodeHandle.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_495', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_495()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_496
     * @tc.name    TestArkUICapi_496
     * @tc.desc    Case: TestArkUICapi_496. API: OH_ArkUI_DigitalCrownEvent_GetEventTime, ArkUI_UIInputEvent. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_496', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_496()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_497
     * @tc.name    TestArkUICapi_497
     * @tc.desc    Case: TestArkUICapi_497. API: OH_ArkUI_DigitalCrownEvent_GetAngularVelocity, ArkUI_UIInputEvent.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_497', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_497()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_498
     * @tc.name    TestArkUICapi_498
     * @tc.desc    Case: TestArkUICapi_498. API: OH_ArkUI_DigitalCrownEvent_GetDegree, ArkUI_UIInputEvent. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_498', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_498()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_499
     * @tc.name    TestArkUICapi_499
     * @tc.desc    Case: TestArkUICapi_499. API: OH_ArkUI_DigitalCrownEvent_GetAction, ArkUI_UIInputEvent. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_499', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_499()).assertEqual(0)
      done()
    })

/**
     * @tc.number  TestArkUICapi_500
     * @tc.name    TestArkUICapi_500
     * @tc.desc    Case: TestArkUICapi_500. API: OH_ArkUI_DigitalCrownEvent_SetStopPropagation, ArkUI_UIInputEvent. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_500', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_500()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  SUB_ArkUI_NativeAPI_ClonedEvent_SetSourceType_0100
     * @tc.name    TestArkUICapi_501
     * @tc.desc    OH_ArkUI_ClonedEvent_SetSourceType with ARKUI_SOURCE_TYPE_TOUCH (1) test.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_501', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_501()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  SUB_ArkUI_NativeAPI_ClonedEvent_SetSourceType_0200
     * @tc.name    TestArkUICapi_502
     * @tc.desc    OH_ArkUI_ClonedEvent_SetSourceType with ARKUI_SOURCE_TYPE_MOUSE (2) test.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_502', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_502()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  SUB_ArkUI_NativeAPI_ClonedEvent_SetSourceType_0300
     * @tc.name    TestArkUICapi_503
     * @tc.desc    OH_ArkUI_ClonedEvent_SetSourceType with ARKUI_SOURCE_TYPE_KEYBOARD (3) test.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_503', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_503()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  SUB_ArkUI_NativeAPI_ClonedEvent_SetSourceType_0400
     * @tc.name    TestArkUICapi_504
     * @tc.desc    OH_ArkUI_ClonedEvent_SetSourceType with ARKUI_SOURCE_TYPE_TOUCHPAD (4) test.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_504', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_504()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  SUB_ArkUI_NativeAPI_ClonedEvent_SetSourceType_0500
     * @tc.name    TestArkUICapi_505
     * @tc.desc    OH_ArkUI_ClonedEvent_SetSourceType with ARKUI_SOURCE_TYPE_JOYSTICK (5) test.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_505', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_505()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  SUB_ArkUI_NativeAPI_ClonedEvent_SetToolType_0100
     * @tc.name    TestArkUICapi_508
     * @tc.desc    OH_ArkUI_ClonedEvent_SetToolType with ARKUI_TOOL_TYPE_FINGER (1) test.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_508', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_508()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  SUB_ArkUI_NativeAPI_ClonedEvent_SetToolType_0200
     * @tc.name    TestArkUICapi_509
     * @tc.desc    OH_ArkUI_ClonedEvent_SetToolType with ARKUI_TOOL_TYPE_PEN (2) test.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_509', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_509()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  SUB_ArkUI_NativeAPI_ClonedEvent_SetToolType_0300
     * @tc.name    TestArkUICapi_510
     * @tc.desc    OH_ArkUI_ClonedEvent_SetToolType with ARKUI_TOOL_TYPE_MOUSE (3) test.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_510', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_510()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  SUB_ArkUI_NativeAPI_ClonedEvent_SetToolType_0400
     * @tc.name    TestArkUICapi_511
     * @tc.desc    OH_ArkUI_ClonedEvent_SetToolType with ARKUI_TOOL_TYPE_TOUCHPAD (4) test.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_511', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_511()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  SUB_ArkUI_NativeAPI_ClonedEvent_SetToolType_0500
     * @tc.name    TestArkUICapi_512
     * @tc.desc    OH_ArkUI_ClonedEvent_SetToolType with ARKUI_TOOL_TYPE_JOYSTICK (5) test.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_512', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_512()).assertEqual(0)
      done()
    })

  });
}
