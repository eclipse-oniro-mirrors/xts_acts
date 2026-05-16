import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';

import common from '@ohos.app.ability.common';

import { inputDevice } from '@kit.InputKit';
import { inputConsumer } from '@kit.InputKit';
import { KeyEvent, Action, KeyCode } from '@kit.InputKit';
import { AsyncCallback } from '@kit.BasicServicesKit';
import { BusinessError } from "@ohos.base"

import { infraredEmitter } from '@kit.InputKit';
import { image } from '@kit.ImageKit';

import pointer from '@ohos.multimodalInput.pointer';
import window from '@ohos.window';
import { AppStorage } from '@ohos.arkui.stateManagement'

import { inputDevice, pointer } from '@kit.InputKit';

import { KeyCode } from '@ohos.multimodalInput.keyCode';

let domain: int = 0x0000; 
let tag: string = 'testTag'; 

export default function PointerComplementTest() {

  describe("PointerComplementTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_setPointerStyle_0150
     * @tc.number SUB_MMI_Input_Api_Pointer_setPointerStyle_0150
     * @tc.desc   Normal interface call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_Pointer_setPointerStyle_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_setPointerStyle_0150";
        hilog.info(domain, tag, `${caseName} enter`);
        let ifSetPointerStyleSuccess = 0;
        let list = [pointer.PointerStyle.DEFAULT, pointer.PointerStyle.EAST, pointer.PointerStyle.WEST
          , pointer.PointerStyle.SOUTH, pointer.PointerStyle.NORTH, pointer.PointerStyle.WEST_EAST
          , pointer.PointerStyle.NORTH_SOUTH, pointer.PointerStyle.NORTH_EAST, pointer.PointerStyle.NORTH_WEST
          , pointer.PointerStyle.SOUTH_EAST, pointer.PointerStyle.SOUTH_WEST, pointer.PointerStyle.NORTH_EAST_SOUTH_WEST
          , pointer.PointerStyle.NORTH_WEST_SOUTH_EAST, pointer.PointerStyle.CROSS, pointer.PointerStyle.CURSOR_COPY
          , pointer.PointerStyle.CURSOR_FORBID, pointer.PointerStyle.COLOR_SUCKER, pointer.PointerStyle.HAND_GRABBING
          , pointer.PointerStyle.HAND_OPEN, pointer.PointerStyle.HAND_POINTING, pointer.PointerStyle.HELP
          , pointer.PointerStyle.MOVE, pointer.PointerStyle.RESIZE_LEFT_RIGHT
          , pointer.PointerStyle.RESIZE_UP_DOWN, pointer.PointerStyle.SCREENSHOT_CHOOSE,
          pointer.PointerStyle.SCREENSHOT_CURSOR
          , pointer.PointerStyle.TEXT_CURSOR, pointer.PointerStyle.ZOOM_IN, pointer.PointerStyle.ZOOM_OUT
          , pointer.PointerStyle.MIDDLE_BTN_EAST, pointer.PointerStyle.MIDDLE_BTN_WEST,
          pointer.PointerStyle.MIDDLE_BTN_SOUTH
          , pointer.PointerStyle.MIDDLE_BTN_NORTH, pointer.PointerStyle.MIDDLE_BTN_NORTH_SOUTH,
          pointer.PointerStyle.MIDDLE_BTN_NORTH_EAST
          , pointer.PointerStyle.MIDDLE_BTN_NORTH_WEST, pointer.PointerStyle.MIDDLE_BTN_SOUTH_EAST,
          pointer.PointerStyle.MIDDLE_BTN_SOUTH_WEST
          , pointer.PointerStyle.MIDDLE_BTN_NORTH_SOUTH_WEST_EAST, pointer.PointerStyle.HORIZONTAL_TEXT_CURSOR,
          pointer.PointerStyle.CURSOR_CROSS
          , pointer.PointerStyle.CURSOR_CIRCLE, pointer.PointerStyle.LOADING, pointer.PointerStyle.RUNNING
          , pointer.PointerStyle.MIDDLE_BTN_EAST_WEST, pointer.PointerStyle.RUNNING_LEFT,
          pointer.PointerStyle.RUNNING_RIGHT
          , pointer.PointerStyle.AECH_DEVELOPER_DEFINED_ICON, pointer.PointerStyle.SCREENRECORDER_CURSOR,
          pointer.PointerStyle.LASER_CURSOR
          , pointer.PointerStyle.LASER_CURSOR_DOT, pointer.PointerStyle.LASER_CURSOR_DOT_RED,
          pointer.PointerStyle.DEVELOPER_DEFINED_ICON
        ];
        try {
          for (let i = 0; i < list.length; i++) {
            pointer.setPointerStyle(10, list[i], (error: BusinessError<void> | null, data: undefined) => {
              console.log(`Set pointer style success`);
              console.log(`${caseName} Set pointer ${error}`);
            });
          }
          ifSetPointerStyleSuccess++;
          expect(ifSetPointerStyleSuccess).assertEqual(1);
          done();
        } catch (error) {
          console.error(`Set pointer style failed, error: ${error}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_setPointerStyle_0350
     * @tc.number SUB_MMI_Input_Api_Pointer_setPointerStyle_0350
     * @tc.desc   Test the first value transmission -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_Pointer_setPointerStyle_0350", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_setPointerStyle_0350";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          pointer.setPointerStyle(-1, pointer.PointerStyle.CROSS,
            (error: BusinessError<void> | null, data: undefined) => {
              console.log(`${caseName} Set pointer style success ${error}`);
              if (error) {
                expect(error.code).assertEqual(202);
                done();
              } else {
                console.log(`${caseName} Set pointer style success`);
                expect().assertFail();
                done();
              }
            });
        } catch (error) {
          console.error(`${caseName} Set pointer style failed, error: ${error.code}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_setPointerStyle_0450
     * @tc.number SUB_MMI_Input_Api_Pointer_setPointerStyle_0450
     * @tc.desc   Test the first value transmission -1(promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_Pointer_setPointerStyle_0450", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_setPointerStyle_0450";
        hilog.info(domain, tag, `${caseName} enter`);
        let ifSetPointerStyleSuccess = 0;
        try {
          await pointer.setPointerStyle(-1, pointer.PointerStyle.CROSS).then(() => {
            console.log(`Set pointer style success`);
            expect().assertFail();
            done();
          });
        } catch (error) {
          console.error(`${caseName} Set pointer style failed, error: ${error.code}`);
          expect(error.code).assertEqual(202);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_setPointerStyleSync_0150
     * @tc.number SUB_MMI_Input_Api_Pointer_setPointerStyleSync_0150
     * @tc.desc   Test setPointerStyleSync interface to set the mouse style type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_Pointer_setPointerStyleSync_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_setPointerStyleSync_0150";
        hilog.info(domain, tag, `${caseName} enter`);
        let ifSetPointerStyleSyncSuccess = 0;
        let list = [pointer.PointerStyle.DEFAULT, pointer.PointerStyle.EAST, pointer.PointerStyle.WEST
          , pointer.PointerStyle.SOUTH, pointer.PointerStyle.NORTH, pointer.PointerStyle.WEST_EAST
          , pointer.PointerStyle.NORTH_SOUTH, pointer.PointerStyle.NORTH_EAST, pointer.PointerStyle.NORTH_WEST
          , pointer.PointerStyle.SOUTH_EAST, pointer.PointerStyle.SOUTH_WEST, pointer.PointerStyle.NORTH_EAST_SOUTH_WEST
          , pointer.PointerStyle.NORTH_WEST_SOUTH_EAST, pointer.PointerStyle.CROSS, pointer.PointerStyle.CURSOR_COPY
          , pointer.PointerStyle.CURSOR_FORBID, pointer.PointerStyle.COLOR_SUCKER, pointer.PointerStyle.HAND_GRABBING
          , pointer.PointerStyle.HAND_OPEN, pointer.PointerStyle.HAND_POINTING, pointer.PointerStyle.HELP
          , pointer.PointerStyle.MOVE, pointer.PointerStyle.RESIZE_LEFT_RIGHT
          , pointer.PointerStyle.RESIZE_UP_DOWN, pointer.PointerStyle.SCREENSHOT_CHOOSE,
          pointer.PointerStyle.SCREENSHOT_CURSOR
          , pointer.PointerStyle.TEXT_CURSOR, pointer.PointerStyle.ZOOM_IN, pointer.PointerStyle.ZOOM_OUT
          , pointer.PointerStyle.MIDDLE_BTN_EAST, pointer.PointerStyle.MIDDLE_BTN_WEST,
          pointer.PointerStyle.MIDDLE_BTN_SOUTH
          , pointer.PointerStyle.MIDDLE_BTN_NORTH, pointer.PointerStyle.MIDDLE_BTN_NORTH_SOUTH,
          pointer.PointerStyle.MIDDLE_BTN_NORTH_EAST
          , pointer.PointerStyle.MIDDLE_BTN_NORTH_WEST, pointer.PointerStyle.MIDDLE_BTN_SOUTH_EAST,
          pointer.PointerStyle.MIDDLE_BTN_SOUTH_WEST
          , pointer.PointerStyle.MIDDLE_BTN_NORTH_SOUTH_WEST_EAST, pointer.PointerStyle.HORIZONTAL_TEXT_CURSOR,
          pointer.PointerStyle.CURSOR_CROSS
          , pointer.PointerStyle.CURSOR_CIRCLE, pointer.PointerStyle.LOADING, pointer.PointerStyle.RUNNING
          , pointer.PointerStyle.MIDDLE_BTN_EAST_WEST, pointer.PointerStyle.RUNNING_LEFT,
          pointer.PointerStyle.RUNNING_RIGHT
          , pointer.PointerStyle.AECH_DEVELOPER_DEFINED_ICON, pointer.PointerStyle.SCREENRECORDER_CURSOR,
          pointer.PointerStyle.LASER_CURSOR
          , pointer.PointerStyle.LASER_CURSOR_DOT, pointer.PointerStyle.LASER_CURSOR_DOT_RED,
          pointer.PointerStyle.DEVELOPER_DEFINED_ICON
        ];
        try {
          for (let i = 0; i < list.length; i++) {
            pointer.setPointerStyleSync(-1, list[i]);
          }
          expect().assertFail();
          done();
          console.log(`${caseName} Set pointer style success`);
        } catch (error) {
          console.error(`${caseName} getPointerSize failed, error: ${error.code}`);
          expect(error.code).assertEqual(202);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_getPointerStyle_0150
     * @tc.number SUB_MMI_Input_Api_Pointer_getPointerStyle_0150
     * @tc.desc   Test callback getPointerStyle interface to get the mouse style type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_Pointer_getPointerStyle_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_getPointerStyle_0150";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let windowId: int = 100;
          pointer.getPointerStyle(windowId,
            (error: BusinessError<void> | null, style: pointer.PointerStyle | undefined) => {
              console.log(`Get pointer style success, style: ${JSON.stringify(style)}`);
              expect(style == pointer.PointerStyle.DEFAULT || style == pointer.PointerStyle.EAST ||
                style == pointer.PointerStyle.WEST || style == pointer.PointerStyle.SOUTH ||
                style == pointer.PointerStyle.NORTH || style == pointer.PointerStyle.WEST_EAST ||
                style == pointer.PointerStyle.NORTH_SOUTH || style == pointer.PointerStyle.NORTH_EAST ||
                style == pointer.PointerStyle.NORTH_WEST || style == pointer.PointerStyle.SOUTH_EAST ||
                style == pointer.PointerStyle.SOUTH_WEST || style == pointer.PointerStyle.NORTH_EAST_SOUTH_WEST ||
                style == pointer.PointerStyle.NORTH_WEST_SOUTH_EAST || style == pointer.PointerStyle.CROSS ||
                style == pointer.PointerStyle.CURSOR_COPY || style == pointer.PointerStyle.CURSOR_FORBID ||
                style == pointer.PointerStyle.COLOR_SUCKER || style == pointer.PointerStyle.HAND_GRABBING ||
                style == pointer.PointerStyle.HAND_OPEN || style == pointer.PointerStyle.HAND_POINTING ||
                style == pointer.PointerStyle.HELP || style == pointer.PointerStyle.MOVE ||
                style == pointer.PointerStyle.RESIZE_LEFT_RIGHT || style == pointer.PointerStyle.RESIZE_UP_DOWN ||
                style == pointer.PointerStyle.SCREENSHOT_CHOOSE || style == pointer.PointerStyle.SCREENSHOT_CURSOR ||
                style == pointer.PointerStyle.TEXT_CURSOR || style == pointer.PointerStyle.ZOOM_IN ||
                style == pointer.PointerStyle.ZOOM_OUT || style == pointer.PointerStyle.MIDDLE_BTN_EAST ||
                style == pointer.PointerStyle.MIDDLE_BTN_WEST || style == pointer.PointerStyle.MIDDLE_BTN_SOUTH ||
                style == pointer.PointerStyle.MIDDLE_BTN_NORTH ||
                style == pointer.PointerStyle.MIDDLE_BTN_NORTH_SOUTH ||
                style == pointer.PointerStyle.MIDDLE_BTN_NORTH_EAST ||
                style == pointer.PointerStyle.MIDDLE_BTN_NORTH_WEST ||
                style == pointer.PointerStyle.MIDDLE_BTN_SOUTH_EAST ||
                style == pointer.PointerStyle.MIDDLE_BTN_SOUTH_WEST ||
                style == pointer.PointerStyle.MIDDLE_BTN_NORTH_SOUTH_WEST_EAST ||
                style == pointer.PointerStyle.HORIZONTAL_TEXT_CURSOR ||
                style == pointer.PointerStyle.CURSOR_CROSS || style == pointer.PointerStyle.CURSOR_CIRCLE ||
                style == pointer.PointerStyle.LOADING || style == pointer.PointerStyle.RUNNING ||
                style == pointer.PointerStyle.MIDDLE_BTN_EAST_WEST ||
                style == pointer.PointerStyle.SCREENRECORDER_CURSOR).assertTrue();
              done();
            });
        } catch (error) {
          console.info(`${caseName} Get pointer style failed, error: ${error}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_getPointerStyle_0250
     * @tc.number SUB_MMI_Input_Api_Pointer_getPointerStyle_0250
     * @tc.desc   Test callback getPointerStyle interface to get the mouse style type(promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_Pointer_getPointerStyle_0250", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_getPointerStyle_0250";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let windowId: int = 100;
          await pointer.getPointerStyle(windowId).then((style: pointer.PointerStyle) => {
            console.log(`${caseName} Get pointer style success, style: ${JSON.stringify(style)}`);
            expect(style == pointer.PointerStyle.DEFAULT || style == pointer.PointerStyle.EAST ||
              style == pointer.PointerStyle.WEST || style == pointer.PointerStyle.SOUTH ||
              style == pointer.PointerStyle.NORTH || style == pointer.PointerStyle.WEST_EAST ||
              style == pointer.PointerStyle.NORTH_SOUTH || style == pointer.PointerStyle.NORTH_EAST ||
              style == pointer.PointerStyle.NORTH_WEST || style == pointer.PointerStyle.SOUTH_EAST ||
              style == pointer.PointerStyle.SOUTH_WEST || style == pointer.PointerStyle.NORTH_EAST_SOUTH_WEST ||
              style == pointer.PointerStyle.NORTH_WEST_SOUTH_EAST || style == pointer.PointerStyle.CROSS ||
              style == pointer.PointerStyle.CURSOR_COPY || style == pointer.PointerStyle.CURSOR_FORBID ||
              style == pointer.PointerStyle.COLOR_SUCKER || style == pointer.PointerStyle.HAND_GRABBING ||
              style == pointer.PointerStyle.HAND_OPEN || style == pointer.PointerStyle.HAND_POINTING ||
              style == pointer.PointerStyle.HELP || style == pointer.PointerStyle.MOVE ||
              style == pointer.PointerStyle.RESIZE_LEFT_RIGHT || style == pointer.PointerStyle.RESIZE_UP_DOWN ||
              style == pointer.PointerStyle.SCREENSHOT_CHOOSE || style == pointer.PointerStyle.SCREENSHOT_CURSOR ||
              style == pointer.PointerStyle.TEXT_CURSOR || style == pointer.PointerStyle.ZOOM_IN ||
              style == pointer.PointerStyle.ZOOM_OUT || style == pointer.PointerStyle.MIDDLE_BTN_EAST ||
              style == pointer.PointerStyle.MIDDLE_BTN_WEST || style == pointer.PointerStyle.MIDDLE_BTN_SOUTH ||
              style == pointer.PointerStyle.MIDDLE_BTN_NORTH ||
              style == pointer.PointerStyle.MIDDLE_BTN_NORTH_SOUTH ||
              style == pointer.PointerStyle.MIDDLE_BTN_NORTH_EAST ||
              style == pointer.PointerStyle.MIDDLE_BTN_NORTH_WEST ||
              style == pointer.PointerStyle.MIDDLE_BTN_SOUTH_EAST ||
              style == pointer.PointerStyle.MIDDLE_BTN_SOUTH_WEST ||
              style == pointer.PointerStyle.MIDDLE_BTN_NORTH_SOUTH_WEST_EAST ||
              style == pointer.PointerStyle.HORIZONTAL_TEXT_CURSOR ||
              style == pointer.PointerStyle.CURSOR_CROSS || style == pointer.PointerStyle.CURSOR_CIRCLE ||
              style == pointer.PointerStyle.LOADING || style == pointer.PointerStyle.RUNNING ||
              style == pointer.PointerStyle.MIDDLE_BTN_EAST_WEST ||
              style == pointer.PointerStyle.SCREENRECORDER_CURSOR).assertTrue();
            done();
          });
        } catch (error) {
          console.info(`${caseName} Get pointer style failed, error: ${error}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_getPointerStyle_0350
     * @tc.number SUB_MMI_Input_Api_Pointer_getPointerStyle_0350
     * @tc.desc   Test the first value transmission -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_Pointer_getPointerStyle_0350", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_getPointerStyle_0350";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          pointer.getPointerStyle(-1, (error: BusinessError<void> | null, style: pointer.PointerStyle | undefined) => {
            console.log(`Get pointer style success, style: ${JSON.stringify(style)}`);
            expect(style == pointer.PointerStyle.DEFAULT || style == pointer.PointerStyle.EAST ||
              style == pointer.PointerStyle.WEST || style == pointer.PointerStyle.SOUTH ||
              style == pointer.PointerStyle.NORTH || style == pointer.PointerStyle.WEST_EAST ||
              style == pointer.PointerStyle.NORTH_SOUTH || style == pointer.PointerStyle.NORTH_EAST ||
              style == pointer.PointerStyle.NORTH_WEST || style == pointer.PointerStyle.SOUTH_EAST ||
              style == pointer.PointerStyle.SOUTH_WEST || style == pointer.PointerStyle.NORTH_EAST_SOUTH_WEST ||
              style == pointer.PointerStyle.NORTH_WEST_SOUTH_EAST || style == pointer.PointerStyle.CROSS ||
              style == pointer.PointerStyle.CURSOR_COPY || style == pointer.PointerStyle.CURSOR_FORBID ||
              style == pointer.PointerStyle.COLOR_SUCKER || style == pointer.PointerStyle.HAND_GRABBING ||
              style == pointer.PointerStyle.HAND_OPEN || style == pointer.PointerStyle.HAND_POINTING ||
              style == pointer.PointerStyle.HELP || style == pointer.PointerStyle.MOVE ||
              style == pointer.PointerStyle.RESIZE_LEFT_RIGHT || style == pointer.PointerStyle.RESIZE_UP_DOWN ||
              style == pointer.PointerStyle.SCREENSHOT_CHOOSE || style == pointer.PointerStyle.SCREENSHOT_CURSOR ||
              style == pointer.PointerStyle.TEXT_CURSOR || style == pointer.PointerStyle.ZOOM_IN ||
              style == pointer.PointerStyle.ZOOM_OUT || style == pointer.PointerStyle.MIDDLE_BTN_EAST ||
              style == pointer.PointerStyle.MIDDLE_BTN_WEST || style == pointer.PointerStyle.MIDDLE_BTN_SOUTH ||
              style == pointer.PointerStyle.MIDDLE_BTN_NORTH ||
              style == pointer.PointerStyle.MIDDLE_BTN_NORTH_SOUTH ||
              style == pointer.PointerStyle.MIDDLE_BTN_NORTH_EAST ||
              style == pointer.PointerStyle.MIDDLE_BTN_NORTH_WEST ||
              style == pointer.PointerStyle.MIDDLE_BTN_SOUTH_EAST ||
              style == pointer.PointerStyle.MIDDLE_BTN_SOUTH_WEST ||
              style == pointer.PointerStyle.MIDDLE_BTN_NORTH_SOUTH_WEST_EAST ||
              style == pointer.PointerStyle.HORIZONTAL_TEXT_CURSOR ||
              style == pointer.PointerStyle.CURSOR_CROSS || style == pointer.PointerStyle.CURSOR_CIRCLE ||
              style == pointer.PointerStyle.LOADING || style == pointer.PointerStyle.RUNNING ||
              style == pointer.PointerStyle.MIDDLE_BTN_EAST_WEST ||
              style == pointer.PointerStyle.SCREENRECORDER_CURSOR).assertTrue();
            done();
          });
        } catch (error) {
          console.info(`${caseName} Get pointer style failed, error: ${error}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_getPointerStyleSync_0150
     * @tc.number SUB_MMI_Input_Api_Pointer_getPointerStyleSync_0150
     * @tc.desc   Test callback getPointerStyle interface to get the mouse style type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_Pointer_getPointerStyleSync_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_getPointerStyleSync_0150";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let windowId: int = 100;
          let style: pointer.PointerStyle = pointer.getPointerStyleSync(windowId);
          expect(style == pointer.PointerStyle.DEFAULT || style == pointer.PointerStyle.EAST ||
            style == pointer.PointerStyle.WEST || style == pointer.PointerStyle.SOUTH ||
            style == pointer.PointerStyle.NORTH || style == pointer.PointerStyle.WEST_EAST ||
            style == pointer.PointerStyle.NORTH_SOUTH || style == pointer.PointerStyle.NORTH_EAST ||
            style == pointer.PointerStyle.NORTH_WEST || style == pointer.PointerStyle.SOUTH_EAST ||
            style == pointer.PointerStyle.SOUTH_WEST || style == pointer.PointerStyle.NORTH_EAST_SOUTH_WEST ||
            style == pointer.PointerStyle.NORTH_WEST_SOUTH_EAST || style == pointer.PointerStyle.CROSS ||
            style == pointer.PointerStyle.CURSOR_COPY || style == pointer.PointerStyle.CURSOR_FORBID ||
            style == pointer.PointerStyle.COLOR_SUCKER || style == pointer.PointerStyle.HAND_GRABBING ||
            style == pointer.PointerStyle.HAND_OPEN || style == pointer.PointerStyle.HAND_POINTING ||
            style == pointer.PointerStyle.HELP || style == pointer.PointerStyle.MOVE ||
            style == pointer.PointerStyle.RESIZE_LEFT_RIGHT || style == pointer.PointerStyle.RESIZE_UP_DOWN ||
            style == pointer.PointerStyle.SCREENSHOT_CHOOSE || style == pointer.PointerStyle.SCREENSHOT_CURSOR ||
            style == pointer.PointerStyle.TEXT_CURSOR || style == pointer.PointerStyle.ZOOM_IN ||
            style == pointer.PointerStyle.ZOOM_OUT || style == pointer.PointerStyle.MIDDLE_BTN_EAST ||
            style == pointer.PointerStyle.MIDDLE_BTN_WEST || style == pointer.PointerStyle.MIDDLE_BTN_SOUTH ||
            style == pointer.PointerStyle.MIDDLE_BTN_NORTH ||
            style == pointer.PointerStyle.MIDDLE_BTN_NORTH_SOUTH ||
            style == pointer.PointerStyle.MIDDLE_BTN_NORTH_EAST ||
            style == pointer.PointerStyle.MIDDLE_BTN_NORTH_WEST ||
            style == pointer.PointerStyle.MIDDLE_BTN_SOUTH_EAST ||
            style == pointer.PointerStyle.MIDDLE_BTN_SOUTH_WEST ||
            style == pointer.PointerStyle.MIDDLE_BTN_NORTH_SOUTH_WEST_EAST ||
            style == pointer.PointerStyle.HORIZONTAL_TEXT_CURSOR ||
            style == pointer.PointerStyle.CURSOR_CROSS || style == pointer.PointerStyle.CURSOR_CIRCLE ||
            style == pointer.PointerStyle.LOADING || style == pointer.PointerStyle.RUNNING ||
            style == pointer.PointerStyle.MIDDLE_BTN_EAST_WEST ||
            style == pointer.PointerStyle.SCREENRECORDER_CURSOR).assertTrue();
          done();
        } catch (error) {
          console.info(`${caseName} Get pointer style failed, error: ${error}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_setPointerVisible_0150
     * @tc.number SUB_MMI_Input_Api_Pointer_setPointerVisible_0150
     * @tc.desc   Test callback setPointerVisible interface to show or hide the mouse pointer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_Pointer_setPointerVisible_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_setPointerVisible_0150";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let flag: number = 0;
          pointer.setPointerVisible(true, (error: BusinessError<void> | null, data: undefined) => {
            if (error) {
              console.info(`${caseName} Set pointer visible failed, err=${error}`);
              expect(error.code).assertEqual(801);
              done();
            } else {
              flag += 1;
              console.info(`${caseName} Set pointer visible success, data=${JSON.stringify(data)}`);
              expect(flag).assertEqual(1);
              done();
            }
          });
        } catch (error) {
          console.info(`${caseName} Set pointer visible failed, error: ${error}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_setPointerVisible_0250
     * @tc.number SUB_MMI_Input_Api_Pointer_setPointerVisible_0250
     * @tc.desc   Test callback setPointerVisible interface to show or hide the mouse pointer(false).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_Pointer_setPointerVisible_0250", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_setPointerVisible_0250";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let flag: number = 0;
          pointer.setPointerVisible(false, (error: BusinessError<void> | null, data: undefined) => {
            if (error) {
              console.info(`${caseName} Set pointer visible failed, err=${error}`);
              expect(error.code).assertEqual(801);
              done();
            } else {
              flag += 1;
              console.info(`${caseName} Set pointer visible success, data=${JSON.stringify(data)}`);
              expect(flag).assertEqual(1);
              done();
            }
          });
        } catch (error) {
          console.info(`${caseName} Set pointer visible failed, error: ${error}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_setPointerVisible_0350
     * @tc.number SUB_MMI_Input_Api_Pointer_setPointerVisible_0350
     * @tc.desc   Test callback setPointerVisible interface to show or hide the mouse pointer(promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_Pointer_setPointerVisible_0350", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_setPointerVisible_0350";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let flag: number = 0;
          await pointer.setPointerVisible(true).then(() => {
            flag += 1;
            console.info(`${caseName} Set pointer visible success, data=`);
            expect(flag).assertEqual(1);
            done();
          });
        } catch (error) {
          console.info(`${caseName} Set pointer visible failed, error: ${error}`);
          expect(error.code).assertEqual(801);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_setPointerVisible_0450
     * @tc.number SUB_MMI_Input_Api_Pointer_setPointerVisible_0450
     * @tc.desc   Test callback setPointerVisible interface to show or hide the mouse pointer(false)(promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_Pointer_setPointerVisible_0450", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_setPointerVisible_0450";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let flag: number = 0;
          await pointer.setPointerVisible(false).then(() => {
            flag += 1;
            console.info(`${caseName} Set pointer visible success`);
            expect(flag).assertEqual(1);
            done();
          });
        } catch (error) {
          console.info(`${caseName} Set pointer visible failed, error: ${error}`);
          expect(error.code).assertEqual(801);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_setPointerVisibleSync_0150
     * @tc.number SUB_MMI_Input_Api_Pointer_setPointerVisibleSync_0150
     * @tc.desc   Test setPointerVisibleSync interface to show or hide the mouse pointer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_Pointer_setPointerVisibleSync_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_setPointerVisibleSync_0150";
        hilog.info(domain, tag, `${caseName} enter`);
        let ifSetPointerVisibleSyncSuccess = 0;
        try {
          pointer.setPointerVisibleSync(false);
          console.info(`${caseName} Set pointer visible success`);
          ifSetPointerVisibleSyncSuccess++;
          expect(ifSetPointerVisibleSyncSuccess).assertEqual(1);
          done();
        } catch (error) {
          console.info(`${caseName} Set pointer visible failed, error: ${error.code}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_setPointerVisibleSync_0250
     * @tc.number SUB_MMI_Input_Api_Pointer_setPointerVisibleSync_0250
     * @tc.desc   Test setPointerVisibleSync interface to show or hide the mouse pointer(true).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_Pointer_setPointerVisibleSync_0250", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_setPointerVisibleSync_0250";
        hilog.info(domain, tag, `${caseName} enter`);
        let ifSetPointerVisibleSyncSuccess = 0;
        try {
          pointer.setPointerVisibleSync(true);
          console.info(`${caseName} Set pointer visible success`);
          ifSetPointerVisibleSyncSuccess++;
          expect(ifSetPointerVisibleSyncSuccess).assertEqual(1);
          done();
        } catch (error) {
          console.info(`${caseName} Set pointer visible failed, error: ${error.code}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_isPointerVisible_0150
     * @tc.number SUB_MMI_Input_Api_Pointer_isPointerVisible_0150
     * @tc.desc   Test callback isPointerVisible interface to get the status of the mouse pointer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_Pointer_isPointerVisible_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_isPointerVisible_0150";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          pointer.setPointerVisibleSync(true);
          console.info(`${caseName} Set pointer visible success`);
          try {
            pointer.isPointerVisible((error: BusinessError<void> | null, visible: boolean | undefined) => {
              if (error) {
                console.info(`${caseName} Get pointer visible failed, error: ${JSON.stringify(error,
                  [`code`, `message`])}`);
                expect().assertFail();
                done();
              } else {
                console.info(`${caseName} Get pointer visible success, visible: ${JSON.stringify(visible)}`);
                expect(visible).assertEqual(true);
                done();
              }
            });
          } catch (error) {
            console.info(`${caseName} Get pointer visible failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            expect().assertFail();
            done();
          }
        } catch (error) {
          console.info(`${caseName} Set pointer visible failed, error: ${error.code}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_isPointerVisible_0250
     * @tc.number SUB_MMI_Input_Api_Pointer_isPointerVisible_0250
     * @tc.desc   Test callback isPointerVisible interface to get the display or hide status of the mouse pointer(promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_Pointer_isPointerVisible_0250", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_isPointerVisible_0250";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          pointer.setPointerVisibleSync(true);
          console.info(`${caseName} Set pointer visible success`);
          try {
            pointer.isPointerVisible().then((visible: boolean) => {
              console.log(`Get pointer visible success, visible: ${JSON.stringify(visible)}`);
              expect(visible).assertEqual(true);
              done();
            });
          } catch (error) {
            console.info(`${caseName} Get pointer visible failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            expect().assertFail();
            done();
          }
        } catch (error) {
          console.info(`${caseName} Get pointer visible failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_isPointerVisible_0350
     * @tc.number SUB_MMI_Input_Api_Pointer_isPointerVisible_0350
     * @tc.desc   Test callback isPointerVisible interface to get the status of the mouse pointer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_Pointer_isPointerVisible_0350", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_isPointerVisible_0350";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          pointer.setPointerVisibleSync(false);
          console.info(`${caseName} Set pointer visible success`);
          try {
            pointer.isPointerVisible((error: BusinessError<void> | null, visible: boolean | undefined) => {
              if (error) {
                console.info(`${caseName} Get pointer visible failed, error: ${JSON.stringify(error,
                  [`code`, `message`])}`);
                expect().assertFail();
                done();
              } else {
                console.info(`${caseName} Get pointer visible success, visible: ${JSON.stringify(visible)}`);
                expect(visible).assertEqual(false);
                done();
              }
            });
          } catch (error) {
            console.info(`${caseName} Get pointer visible failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            expect().assertFail();
            done();
          }
        } catch (error) {
          console.info(`${caseName} Set pointer visible failed, error: ${error.code}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_isPointerVisible_0450
     * @tc.number SUB_MMI_Input_Api_Pointer_isPointerVisible_0450
     * @tc.desc   Test callback isPointerVisible interface to get the display or hide status of the mouse pointer(promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_Pointer_isPointerVisible_0450", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_isPointerVisible_0450";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          pointer.setPointerVisibleSync(false);
          console.info(`${caseName} Set pointer visible success`);
          try {
            pointer.isPointerVisible().then((visible: boolean) => {
              console.log(`Get pointer visible success, visible: ${JSON.stringify(visible)}`);
              expect(visible).assertEqual(false);
              done();
            });
          } catch (error) {
            console.info(`${caseName} Get pointer visible failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            expect().assertFail();
            done();
          }
        } catch (error) {
          console.info(`${caseName} Get pointer visible failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_isPointerVisibleSync_0150
     * @tc.number SUB_MMI_Input_Api_Pointer_isPointerVisibleSync_0150
     * @tc.desc   Test isPointerVisibleSync interface to get the display or hide status of the mouse pointer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_Pointer_isPointerVisibleSync_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_isPointerVisibleSync_0150";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          pointer.setPointerVisibleSync(true);
          console.info(`${caseName} Set pointer visible success`);
          let visible: boolean = pointer.isPointerVisibleSync();
          console.info(`${caseName} Get pointer visible success, visible: ${JSON.stringify(visible)}`);
          expect(visible).assertEqual(true);
          done();
        } catch (error) {
          console.info(`${caseName} Get pointer visible failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_isPointerVisibleSync_0250
     * @tc.number SUB_MMI_Input_Api_Pointer_isPointerVisibleSync_0250
     * @tc.desc   Test isPointerVisibleSync interface to get the display or hide status of the mouse pointer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_Pointer_isPointerVisibleSync_0250", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_isPointerVisibleSync_0250";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          pointer.setPointerVisibleSync(false);
          console.info(`${caseName} Set pointer visible success`);
          let visible: boolean = pointer.isPointerVisibleSync();
          console.info(`${caseName} Get pointer visible success, visible: ${JSON.stringify(visible)}`);
          expect(visible).assertEqual(false);
          done();
        } catch (error) {
          console.info(`${caseName} Get pointer visible failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_setCustomCursor_0150
     * @tc.number SUB_MMI_Input_Api_Pointer_setCustomCursor_0150
     * @tc.desc   Test promise setCustomCursor interface to set the custom cursor style.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursor_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursor_0150";
        hilog.info(domain, tag, `${caseName} enter`);
        let ifSetCustomCursorSuccess = 0;
        let width: int = 64;
        let height: int = 64;
        const buffer = new ArrayBuffer(width * height * 4);
        const pixelView = new Uint8Array(buffer);
        for (let i = 0; i < pixelView.length; i += 4) {
          pixelView[i] = 0xFF;
          pixelView[i+1] = 0x00;
          pixelView[i+2] = 0x00;
          pixelView[i+3] = 0xFF;
        }
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { width: width, height: height }
        };
        let img = image.createPixelMapSync(buffer, opts);
        let fnCallBack = () => {
          console.log("setCustomCursor success");
        };
        let windowId: int = 100;
        try {
          pointer.setCustomCursor(windowId, img, 25, 25).then(fnCallBack);
          ifSetCustomCursorSuccess++;
          expect(ifSetCustomCursorSuccess).assertEqual(1);
          done();
        } catch (error) {
          console.error(`setCustomCursor failed, error: ${error.code}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_setCustomCursor_0350
     * @tc.number SUB_MMI_Input_Api_Pointer_setCustomCursor_0350
     * @tc.desc   Test abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursor_0350", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursor_0350";
        hilog.info(domain, tag, `${caseName} enter`);
        let ifSetCustomCursorSuccess = 0;
        let width: int = 64;
        let height: int = 64;
        const buffer = new ArrayBuffer(width * height * 4);
        const pixelView = new Uint8Array(buffer);
        for (let i = 0; i < pixelView.length; i += 4) {
          pixelView[i] = 0xFF;
          pixelView[i+1] = 0x00;
          pixelView[i+2] = 0x00;
          pixelView[i+3] = 0xFF;
        }
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { width: width, height: height }
        };
        let img = image.createPixelMapSync(buffer, opts);
        let fnCallBack = () => {
          console.log(`${caseName} setCustomCursor success`);
        };
        let windowId: int = 100;
        try {
          pointer.setCustomCursor(windowId, img, -25, 25).then(fnCallBack);
          console.error(`${caseName} setCustomCursor success`);
          ifSetCustomCursorSuccess++;
          expect(ifSetCustomCursorSuccess).assertEqual(1);
          done();
        } catch (error) {
          console.error(`${caseName} setCustomCursor failed, error: ${error.code}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0150
     * @tc.number SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0150
     * @tc.desc   Test setCustomCursorSync interface to set the custom cursor style.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0150";
        hilog.info(domain, tag, `${caseName} enter`);
        let ifSetCustomCursorSyncSuccess = 0;
        let width: int = 64;
        let height: int = 64;
        const buffer = new ArrayBuffer(width * height * 4);
        const pixelView = new Uint8Array(buffer);
        for (let i = 0; i < pixelView.length; i += 4) {
          pixelView[i] = 0xFF;
          pixelView[i+1] = 0x00;
          pixelView[i+2] = 0x00;
          pixelView[i+3] = 0xFF;
        }
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { width: width, height: height }
        };
        let img = image.createPixelMapSync(buffer, opts);
        let fnCallBack = () => {
          console.log("setCustomCursor success");
        };
        let windowId: int = 100;
        try {
          pointer.setCustomCursorSync(windowId, img, 25, 25);
          ifSetCustomCursorSyncSuccess++;
          expect(ifSetCustomCursorSyncSuccess).assertEqual(1);
          done();
        } catch (error) {
          console.error(`setCustomCursor failed, error: ${error}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_setCustomCursor_0250
     * @tc.number SUB_MMI_Input_Api_Pointer_setCustomCursor_0250
     * @tc.desc   Test abnormal parameters and report error code 26500001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursor_0250", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursor_0250";
        hilog.info(domain, tag, `${caseName} enter`);
        let ifSetCustomCursorSuccess = 0;
        let width: int = 64;
        let height: int = 64;
        const buffer = new ArrayBuffer(width * height * 4);
        const pixelView = new Uint8Array(buffer);
        for (let i = 0; i < pixelView.length; i += 4) {
          pixelView[i] = 0xFF;
          pixelView[i+1] = 0x00;
          pixelView[i+2] = 0x00;
          pixelView[i+3] = 0xFF;
        }
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { width: width, height: height }
        };
        let pixelMap = image.createPixelMapSync(buffer, opts);
        let customCursor: pointer.CustomCursor = { pixelMap: pixelMap, focusX: 25, focusY: 25 };
        let customConfig: pointer.CursorConfig = { followSystem: false };
        let windowId: int = 1000000;
        try {
          await pointer.setCustomCursor(windowId, customCursor, customConfig).then(() => {
            console.log(`${caseName} setCustomCursor success`);
            expect().assertFail();
            done();
          });
        } catch (error) {
          console.error(`${caseName} setCustomCursor failed, error: ${error.code}`);
          expect(error.code).assertEqual(26500001);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

  })

}