/*
* Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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

import pointer from '@ohos.multimodalInput.pointer'
import window from '@ohos.window'
import image from '@ohos.multimedia.image'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
export default function Pointer_test() {
  describe('Pointer_test', function () {

    const errCode = {
      COMMON_PARAMETER_CODE: 401
    }
    const errMsg = {
      PARAMETER_COUNT_MSG: `Parameter count error`,
      PARAMETER_TYPE_MSG: `Parameter error. The type of type must be string.`,
      PARAMETER_VISIBLE_TYPE_MSG: `Parameter error. The type of visible must be boolean.`,
      PARAMETER_SPEED_TYPE_MSG: `Parameter error. The type of speed must be number.`,
      PARAMETER_WINDOWID_TYPE_MSG: `Parameter error. The type of windowId must be number.`,
      PARAMETER_CALLBACK_TYPE_MSG: `Parameter error. The type of callback must be function.`
    }

    /**
     * @tc.number MultimodalInputPointer_Test_001
     * @tc.name Pointer_SetPointerVisibleSync_Test_001
     * @tc.desc Pointer interface SetPointerVisibleSync test
     * @tc.level Level3
     * @tc.size SmallTest
     * @tc.type Function
     */
    it('Pointer_SetPointerVisibleSync_Test_001', 0, async function (done) {
      console.info(`Pointer_SetPointerVisibleSync_Test_001 enter`);
      try {
        pointer.setPointerVisibleSync(true);
      } catch (error) {
        expect(false).assertTrue();
        console.log(`Set pointer visible failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
      }
      done();
    })

    /**
     * @tc.number MultimodalInputPointer_Test_002
     * @tc.name Pointer_IsPointerVisibleSync_Test_002
     * @tc.desc Pointer interface isPointerVisibleSync test
     * @tc.level Level3
     * @tc.size SmallTest
     * @tc.type Function
     */
    it('Pointer_IsPointerVisibleSync_Test_002', 0, async function (done) {
      console.info(`Pointer_IsPointerVisibleSync_Test_002 enter`);
      try {
        let visible = pointer.isPointerVisibleSync();
        console.log(`Get pointer visible success, visible: ${JSON.stringify(visible)}`);
      } catch (error) {
        expect(false).assertTrue();
        console.log(`Get pointer visible failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
      }
      done();
    })

    /**
     * @tc.number MultimodalInputPointer_Test_003
     * @tc.name Pointer_GetPointerStyleSync_Test_003
     * @tc.desc Pointer interface getPointerStyleSync test
     * @tc.level Level3
     * @tc.size SmallTest
     * @tc.type Function
     */
    it('Pointer_GetPointerStyleSync_Test_003', 0, async function (done) {
      console.info(`Pointer_GetPointerStyleSync_Test_003 enter`);
      try {
        let style = pointer.getPointerStyleSync(-1);
        console.log(`getPointerStyleSync success, style: ${JSON.stringify(style)}`);
      } catch (error) {
        expect(false).assertTrue();
        console.log(`getPointerStyleSync failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
      }
      done();
    })

    /**
     * @tc.number MultimodalInputPointer_Test_004
     * @tc.name Pointer_PointerVisibleTest_001
     * @tc.desc Pointer interface SetPointerVisible test
     * @tc.level Level3
     * @tc.size SmallTest
     * @tc.type Function
     */
    it('Pointer_PointerVisibleTest_001', 0, async function (done) {
      console.info(`Pointer_SetPointerVisibleTest_001 enter`);
      try {
        pointer.setPointerVisible(false, (err, data) => {
          if (err) {
            console.info(`Pointer_SetPointerVisibleTest_001 failed, err=${JSON.stringify(err)}`);
            expect(false).assertTrue();
          } else {
            console.info(`Pointer_SetPointerVisibleTest_001 success_1. data=${JSON.stringify(data)}`);
            expect(true).assertTrue();
          }
        });
      } catch (error) {
        console.info(`Pointer_SetPointerVisibleTest_001 error`);
        expect(false).assertTrue();
      }
      try {
        await pointer.isPointerVisible().then(data => {
          console.info(`Pointer_PointerVisibleTest_001 success_2, data=${JSON.stringify(data)}`);
          expect(data == false).assertTrue();
          done();
        }).catch((err) => {
          console.info(`Pointer_PointerVisibleTest_001 failed, err=${JSON.stringify(err)}`);
          expect(false).assertTrue();
        });
      } catch (error) {
        console.info(`Pointer_SetPointerVisibleTest_001 error`);
        expect(false).assertTrue();
      }
      console.info(`Pointer_PointerVisibleTest_001 exit`);
    })

    /**
     * @tc.number MultimodalInputPointer_Test_005
     * @tc.name Pointer_PointerVisibleTest_002
     * @tc.desc Pointer interface SetPointerVisible test
     * @tc.level Level3
     * @tc.size SmallTest
     * @tc.type Function
     */
    it('Pointer_PointerVisibleTest_002', 0, async function (done) {
      console.info(`Pointer_PointerVisibleTest_002 enter`);
      var result = canIUse("SystemCapability.MultimodalInput.Input.Pointer");
      console.info('Pointer_PointerVisibleTest_002 segregate result=' + result);
      if (result) {
        try {
          await pointer.setPointerVisible(true).then(data => {
            console.info(`Pointer_PointerVisibleTest_002 success_1, data=${JSON.stringify(data)}`);
            expect(true).assertTrue();
          }).catch((err) => {
            console.info(`Pointer_PointerVisibleTest_002 failed, err=${JSON.stringify(err)}`);
            expect(false).assertTrue();
          });
        } catch (error) {
          console.info(`Pointer_PointerVisibleTest_002 error`);
          expect(false).assertTrue();
        }
        try {
          pointer.isPointerVisible((err, data) => {
            if (err) {
              console.info(`Pointer_PointerVisibleTest_002 failed, err=${JSON.stringify(err)}`);
              expect(false).assertTrue();
            } else {
              console.info(`Pointer_PointerVisibleTest_002 success_2, data=${JSON.stringify(data)}`);
              expect(data == true).assertTrue();
              done();
            }
          });
        } catch (error) {
          console.info(`Pointer_PointerVisibleTest_002 error`);
          expect(false).assertTrue();
        }
      } else {
        expect(true).assertTrue();
        console.info('Pointer_PointerVisibleTest_002 SystemCapability.MultimodalInput.Input.Pointer segregate');
        done();
      }
      console.info(`Pointer_PointerVisibleTest_002 exit`);
    })

    /**
     * @tc.number MultimodalInputPointer_Test_006
     * @tc.name Pointer_SetPointerStyle_001
     * @tc.desc Pointer interface SetPointerStyle test
     * @tc.level Level3
     * @tc.size SmallTest
     * @tc.type Function
     */
    it('Pointer_SetPointerStyle_001', 0, async function (done) {
      console.info(`SetPointerStyle_001 enter`);
      function getPropertiesPromise(windowClass) {
        return new Promise((resolve, reject) => {
          windowClass.getProperties(async (err, data) => {
            if (err && err.code != 0) {
              console.info(`SetPointerStyle_001 failed, err=${JSON.stringify(err)}`);
              expect(false).assertTrue();
            }
            try {
              var windowId = data.id;
              await pointer.setPointerStyle(windowId, 4).then(() => {
                expect(true).assertTrue();
                console.info(`SetPointerStyle_001 success`);
                resolve();
              }).catch((err) => {
                expect(false).assertTrue();
                console.info(`SetPointerStyle_001 failed_1, err=${JSON.stringify(err)}`);
              });
            } catch (error) {
              console.info(`SetPointerStyle_001 error`);
              expect(false).assertTrue();
              reject(error);
            }
          })
        })
      }
      var result = canIUse("SystemCapability.MultimodalInput.Input.Pointer");
      console.info('Pointer_SetPointerStyle_001 segregate result=' + result);
      if (result) {
        window.getTopWindow(async (err, data) => {
          console.info(`case:SetPointerStyle_001 enter`);
          var windowClass = data;
          if (err && err.code != 0) {
            console.info(`case:SetPointerStyle_001,getTopWindow failed, err=${JSON.stringify(err)}`);
            return;
          }
          console.info(`case:SetPointerStyle_001 ===========`);
          await getPropertiesPromise(data);
          console.info(`case:SetPointerStyle_001 exit`);
          done();
        })
      } else {
        expect(true).assertTrue();
        console.info('Pointer_SetPointerStyle_001 SystemCapability.MultimodalInput.Input.Pointer segregate');
        done();
      }
    })

    /**
     * @tc.number MultimodalInputPointer_Test_007
     * @tc.name Pointer_SetPointerStyle_002
     * @tc.desc Pointer interface SetPointerStyle test
     * @tc.level Level3
     * @tc.size SmallTest
     * @tc.type Function
     */
    it('Pointer_SetPointerStyle_002', 0, async function (done) {
      console.info(`SetPointerStyle_002 enter`);
      function getPropertiesPromise(windowClass) {
        return new Promise((resolve, reject) => {
          windowClass.getProperties((err, data) => {
            if (err && err.code != 0) {
              console.info(`SetPointerStyle_002 failed, err=${JSON.stringify(err)}`);
              expect(false).assertTrue();
            }
            try {
              var windowId = data.id;
              pointer.setPointerStyle(windowId, 4, (err) => {
              try{
                if (err) {
                  console.info(`SetPointerStyle_002 failed_1, err=${JSON.stringify(err)}`);
                  expect(false).assertTrue();
                } else {
                  console.info(`SetPointerStyle_002 success`);
                  expect(true).assertTrue();
                }
              }catch(error){
                console.info(`SetPointerStyle_002 assert fail`);
              }
                resolve();
              });
            } catch (error) {
              console.info(`SetPointerStyle_002 error`);
              expect(false).assertTrue();
              reject(error);
            }
          })
        })
      }
      var result = canIUse("SystemCapability.MultimodalInput.Input.Pointer");
      console.info('Pointer_SetPointerStyle_002 segregate result=' + result);
      if (result) {
        window.getTopWindow(async (err, data) => {
          console.info(`case:SetPointerStyle_002 enter`);
          var windowClass = data;
          if (err && err.code != 0) {
            console.info(`case:SetPointerStyle_002,getTopWindow failed, err=${JSON.stringify(err)}`);
            return;
          }
          console.info(`case:SetPointerStyle_002 ===========`);
          await getPropertiesPromise(data);
          console.info(`case:SetPointerStyle_002 exit`);
          done();
        })
      } else {
        expect(true).assertTrue();
        console.info('Pointer_SetPointerStyle_002 SystemCapability.MultimodalInput.Input.Pointer segregate');
        done();
      }
    })

    /**
     * @tc.number MultimodalInputPointer_Test_008
     * @tc.name Pointer_GetPointerStyle_001
     * @tc.desc Pointer interface GetPointerStyle test
     * @tc.level Level3
     * @tc.size SmallTest
     * @tc.type Function
     */
    it('Pointer_GetPointerStyle_001', 0, async function (done) {
      console.info(`GetPointerStyle_001 enter`);
      function getPropertiesPromise(windowClass) {
        return new Promise((resolve, reject) => {
          windowClass.getProperties(async (err, data) => {
            if (err && err.code != 0) {
              console.info(`GetPointerStyle_001 failed, err=${JSON.stringify(err)}`);
              expect(false).assertTrue();
            }
            try {
              var windowId = data.id;
              await pointer.getPointerStyle(windowId).then((data) => {
                console.info(`GetPointerStyle_001 success, data=${JSON.stringify(data)}`);
                expect(typeof (data)).assertEqual("number");
                resolve();
              }).catch((err) => {
                console.info(`GetPointerStyle_001 failed_1, err=${JSON.stringify(err)}`);
                expect(false).assertTrue();
              });
            } catch (error) {
              console.info(`GetPointerStyle_001 error`);
              expect(false).assertTrue();
              reject(error);
            }
          })
        })
      }
      var result = canIUse("SystemCapability.MultimodalInput.Input.Pointer");
      console.info('Pointer_GetPointerStyle_001 segregate result=' + result);
      if (result) {
        window.getTopWindow(async (err, data) => {
          console.info(`case:GetPointerStyle_001 enter`);
          var windowClass = data;
          if (err && err.code != 0) {
            console.info(`case:GetPointerStyle_001,getTopWindow failed, err=${JSON.stringify(err)}`);
            return;
          }
          console.info(`case:GetPointerStyle_001 ===========`);
          await getPropertiesPromise(data);
          console.info(`case:GetPointerStyle_001 exit`);
          done();
        })
      } else {
        expect(true).assertTrue();
        console.info('Pointer_GetPointerStyle_001 SystemCapability.MultimodalInput.Input.Pointer segregate');
        done();
      }
    })

    /**
     * @tc.number MultimodalInputPointer_Test_009
     * @tc.name Pointer_GetPointerStyle_002
     * @tc.desc Pointer interface GetPointerStyle test
     * @tc.level Level3
     * @tc.size SmallTest
     * @tc.type Function
     */
    it('Pointer_GetPointerStyle_002', 0, async function (done) {
      console.info(`GetPointerStyle_002 enter`);
      function getPropertiesPromise(windowClass) {
        return new Promise((resolve, reject) => {
          windowClass.getProperties((err, data) => {
            if (err && err.code != 0) {
              console.info(`GetPointerStyle_002 failed, err=${JSON.stringify(err)}`);
              reject();
            }
            try {
              var windowId = data.id;
              pointer.getPointerStyle(windowId, (err, data) => {
                if (err) {
                  console.info(`GetPointerStyle_002 failed_1, err=${JSON.stringify(err)}`);
                  expect(false).assertTrue();
                  reject();
                } else {
                  console.info(`GetPointerStyle_002 success, data=` + typeof (data));
                  expect(data).assertInstanceOf('Number');
                  resolve();
                }
              })
            } catch (error) {
              console.info(`GetPointerStyle_002 error=${JSON.stringify(error)}`);
              expect(false).assertTrue();
              reject(error);
            }
          })
        })
      }
      var result = canIUse("SystemCapability.MultimodalInput.Input.Pointer");
      console.info('Pointer_GetPointerStyle_002 segregate result=' + result);
      if (result) {
        window.getTopWindow(async (err, data) => {
          console.info(`case:GetPointerStyle_002 enter`);
          var windowClass = data;
          if (err && err.code != 0) {
            console.info(`case:GetPointerStyle_002,getTopWindow failed, err=${JSON.stringify(err)}`);
            done();
            return;
          }
          console.info(`case:GetPointerStyle_002 ===========`);
          await getPropertiesPromise(data);
          console.info(`case:GetPointerStyle_002 exit`);
          done();
        })
      } else {
        expect(true).assertTrue();
        console.info('Pointer_GetPointerStyle_002 SystemCapability.MultimodalInput.Input.Pointer segregate');
        done();
      }
    })

    /**
     * @tc.number MultimodalInputPointer_Test_010
     * @tc.name Pointer_PointerStyle_test
     * @tc.desc Pointer interface PointerStyle test
     * @tc.level Level3
     * @tc.size SmallTest
     * @tc.type Function
     */
    it('Pointer_PointerStyle_test', 0, function () {
      console.info('Pointer_PointerStyle_test = ' + pointer.PointerStyle.DEFAULT);
      expect(pointer.PointerStyle.DEFAULT == 0).assertTrue();

      console.info('Pointer_EAST_test = ' + pointer.PointerStyle.EAST);
      expect(pointer.PointerStyle.EAST == 1).assertTrue();

      console.info('Pointer_WEST_test = ' + pointer.PointerStyle.WEST);
      expect(pointer.PointerStyle.WEST == 2).assertTrue();

      console.info('Pointer_SOUTH_test = ' + pointer.PointerStyle.SOUTH);
      expect(pointer.PointerStyle.SOUTH == 3).assertTrue();

      console.info('Pointer_NORTH_test = ' + pointer.PointerStyle.NORTH);
      expect(pointer.PointerStyle.NORTH == 4).assertTrue();

      console.info('Pointer_WEST_EAST_test = ' + pointer.PointerStyle.WEST_EAST);
      expect(pointer.PointerStyle.WEST_EAST == 5).assertTrue();

      console.info('Pointer_NORTH_SOUTH_test = ' + pointer.PointerStyle.NORTH_SOUTH);
      expect(pointer.PointerStyle.NORTH_SOUTH == 6).assertTrue();

      console.info('Pointer_NORTH_EAST_test = ' + pointer.PointerStyle.NORTH_EAST);
      expect(pointer.PointerStyle.NORTH_EAST == 7).assertTrue();

      console.info('Pointer_NORTH_WEST_test = ' + pointer.PointerStyle.NORTH_WEST);
      expect(pointer.PointerStyle.NORTH_WEST == 8).assertTrue();

      console.info('Pointer_SOUTH_EAST_test = ' + pointer.PointerStyle.SOUTH_EAST);
      expect(pointer.PointerStyle.SOUTH_EAST == 9).assertTrue();

      console.info('Pointer_SOUTH_WEST_test = ' + pointer.PointerStyle.SOUTH_WEST);
      expect(pointer.PointerStyle.SOUTH_WEST == 10).assertTrue();

      console.info('Pointer_NORTH_EAST_SOUTH_WEST_test = ' + pointer.PointerStyle.NORTH_EAST_SOUTH_WEST);
      expect(pointer.PointerStyle.NORTH_EAST_SOUTH_WEST == 11).assertTrue();

      console.info('Pointer_NORTH_WEST_SOUTH_EAST_test = ' + pointer.PointerStyle.NORTH_WEST_SOUTH_EAST);
      expect(pointer.PointerStyle.NORTH_WEST_SOUTH_EAST == 12).assertTrue();

      console.info('Pointer_CROSS_test = ' + pointer.PointerStyle.CROSS);
      expect(pointer.PointerStyle.CROSS == 13).assertTrue();

      console.info('Pointer_CURSOR_COPY_test = ' + pointer.PointerStyle.CURSOR_COPY);
      expect(pointer.PointerStyle.CURSOR_COPY == 14).assertTrue();

      console.info('Pointer_CURSOR_FORBID_test = ' + pointer.PointerStyle.CURSOR_FORBID);
      expect(pointer.PointerStyle.CURSOR_FORBID == 15).assertTrue();

      console.info('Pointer_COLOR_SUCKER_test = ' + pointer.PointerStyle.COLOR_SUCKER);
      expect(pointer.PointerStyle.COLOR_SUCKER == 16).assertTrue();

      console.info('Pointer_HAND_GRABBING_test = ' + pointer.PointerStyle.HAND_GRABBING);
      expect(pointer.PointerStyle.HAND_GRABBING == 17).assertTrue();

      console.info('Pointer_HAND_OPEN_test = ' + pointer.PointerStyle.HAND_OPEN);
      expect(pointer.PointerStyle.HAND_OPEN == 18).assertTrue();

      console.info('Pointer_HAND_POINTING_test = ' + pointer.PointerStyle.HAND_POINTING);
      expect(pointer.PointerStyle.HAND_POINTING == 19).assertTrue();

      console.info('Pointer_HELP_test = ' + pointer.PointerStyle.HELP);
      expect(pointer.PointerStyle.HELP == 20).assertTrue();

      console.info('Pointer_MOVE_test = ' + pointer.PointerStyle.MOVE);
      expect(pointer.PointerStyle.MOVE == 21).assertTrue();

      console.info('Pointer_RESIZE_LEFT_RIGHT_test = ' + pointer.PointerStyle.RESIZE_LEFT_RIGHT);
      expect(pointer.PointerStyle.RESIZE_LEFT_RIGHT == 22).assertTrue();

      console.info('Pointer_RESIZE_UP_DOWN_test = ' + pointer.PointerStyle.RESIZE_UP_DOWN);
      expect(pointer.PointerStyle.RESIZE_UP_DOWN == 23).assertTrue();

      console.info('Pointer_SCREENSHOT_CHOOSE_test = ' + pointer.PointerStyle.SCREENSHOT_CHOOSE);
      expect(pointer.PointerStyle.SCREENSHOT_CHOOSE == 24).assertTrue();

      console.info('Pointer_SCREENSHOT_CURSOR_test = ' + pointer.PointerStyle.SCREENSHOT_CURSOR);
      expect(pointer.PointerStyle.SCREENSHOT_CURSOR == 25).assertTrue();

      console.info('Pointer_TEXT_CURSOR_test = ' + pointer.PointerStyle.TEXT_CURSOR);
      expect(pointer.PointerStyle.TEXT_CURSOR == 26).assertTrue();

      console.info('Pointer_ZOOM_IN_test = ' + pointer.PointerStyle.ZOOM_IN);
      expect(pointer.PointerStyle.ZOOM_IN == 27).assertTrue();

      console.info('Pointer_ZOOM_OUT_test = ' + pointer.PointerStyle.ZOOM_OUT);
      expect(pointer.PointerStyle.ZOOM_OUT == 28).assertTrue();

      console.info('Pointer_MIDDLE_BTN_EAST_test = ' + pointer.PointerStyle.MIDDLE_BTN_EAST);
      expect(pointer.PointerStyle.MIDDLE_BTN_EAST == 29).assertTrue();

      console.info('Pointer_MIDDLE_BTN_WEST_test = ' + pointer.PointerStyle.MIDDLE_BTN_WEST);
      expect(pointer.PointerStyle.MIDDLE_BTN_WEST == 30).assertTrue();

      console.info('Pointer_MIDDLE_BTN_SOUTH_test = ' + pointer.PointerStyle.MIDDLE_BTN_SOUTH);
      expect(pointer.PointerStyle.MIDDLE_BTN_SOUTH == 31).assertTrue();

      console.info('Pointer_MIDDLE_BTN_NORTH_test = ' + pointer.PointerStyle.MIDDLE_BTN_NORTH);
      expect(pointer.PointerStyle.MIDDLE_BTN_NORTH == 32).assertTrue();

      console.info('Pointer_MIDDLE_BTN_NORTH_SOUTH_test = ' + pointer.PointerStyle.MIDDLE_BTN_NORTH_SOUTH);
      expect(pointer.PointerStyle.MIDDLE_BTN_NORTH_SOUTH == 33).assertTrue();

      console.info('Pointer_MIDDLE_BTN_NORTH_EAST_test = ' + pointer.PointerStyle.MIDDLE_BTN_NORTH_EAST);
      expect(pointer.PointerStyle.MIDDLE_BTN_NORTH_EAST == 34).assertTrue();

      console.info('Pointer_MIDDLE_BTN_NORTH_WEST_test = ' + pointer.PointerStyle.MIDDLE_BTN_NORTH_WEST);
      expect(pointer.PointerStyle.MIDDLE_BTN_NORTH_WEST == 35).assertTrue();

      console.info('Pointer_MIDDLE_BTN_SOUTH_EAST_test = ' + pointer.PointerStyle.MIDDLE_BTN_SOUTH_EAST);
      expect(pointer.PointerStyle.MIDDLE_BTN_SOUTH_EAST == 36).assertTrue();

      console.info('Pointer_MIDDLE_BTN_SOUTH_WEST_test = ' + pointer.PointerStyle.MIDDLE_BTN_SOUTH_WEST);
      expect(pointer.PointerStyle.MIDDLE_BTN_SOUTH_WEST == 37).assertTrue();

      console.info('Pointer_MIDDLE_BTN_NORTH_SOUTH_WEST_EAST_test = ' + pointer.PointerStyle.MIDDLE_BTN_NORTH_SOUTH_WEST_EAST);
      expect(pointer.PointerStyle.MIDDLE_BTN_NORTH_SOUTH_WEST_EAST == 38).assertTrue();

      console.info('Pointer_HORIZONTAL_TEXT_CURSOR_test = ' + pointer.PointerStyle.HORIZONTAL_TEXT_CURSOR);
      expect(pointer.PointerStyle.HORIZONTAL_TEXT_CURSOR == 39).assertTrue();

      console.info('Pointer_CURSOR_CROSS_test = ' + pointer.PointerStyle.CURSOR_CROSS);
      expect(pointer.PointerStyle.CURSOR_CROSS == 40).assertTrue();

      console.info('Pointer_CURSOR_CIRCLE_test = ' + pointer.PointerStyle.CURSOR_CIRCLE);
      expect(pointer.PointerStyle.CURSOR_CIRCLE == 41).assertTrue();
    })

    /**
     * @tc.number MultimodalInputPointer_Test_011
     * @tc.name Pointer_PointerStyle_Loading_test
     * @tc.desc Pointer interface PointerStyle test
     * @tc.level Level3
     * @tc.size SmallTest
     * @tc.type Function
     */
    it('Pointer_PointerStyle_Loading_test', 0, function () {
      console.info('Pointer_LOADING_test = ' + pointer.PointerStyle.LOADING);
      expect(pointer.PointerStyle.LOADING == 42).assertTrue();
    })

    /**
     * @tc.number MultimodalInputPointer_Test_012
     * @tc.name Pointer_PointerStyle_Running_test
     * @tc.desc Pointer interface PointerStyle test
     * @tc.level Level3
     * @tc.size SmallTest
     * @tc.type Function
     */
    it('Pointer_PointerStyle_Running_test', 0, function () {
      console.info('Pointer_RUNNING_test = ' + pointer.PointerStyle.RUNNING);
      expect(pointer.PointerStyle.RUNNING == 43).assertTrue();
    })

    /**
     * @tc.number MultimodalInputPointer_Test_013
     * @tc.name Touchpad_RightClickType_test
     * @tc.desc Pointer interface PointerStyle test
     * @tc.level Level3
     * @tc.size SmallTest
     * @tc.type Function
     */
    it('Touchpad_RightClickType_test', 0, function () {
      console.info('Touchpad_TOUCHPAD_RIGHT_BUTTON_test = ' + pointer.RightClickType.TOUCHPAD_RIGHT_BUTTON);
      expect(pointer.RightClickType.TOUCHPAD_RIGHT_BUTTON == 1).assertTrue();

      console.info('Touchpad_TOUCHPAD_LEFT_BUTTON_test = ' + pointer.RightClickType.TOUCHPAD_LEFT_BUTTON);
      expect(pointer.RightClickType.TOUCHPAD_LEFT_BUTTON == 2).assertTrue();

      console.info('Touchpad_TOUCHPAD_TWO_FINGER_TAP_test = ' + pointer.RightClickType.TOUCHPAD_TWO_FINGER_TAP);
      expect(pointer.RightClickType.TOUCHPAD_TWO_FINGER_TAP == 3).assertTrue();
    })
    
    /**
     * @tc.number MultimodalInputPointer_Test_014
     * @tc.name Pointer_PointerVisibleTest_Exception_Test_001
     * @tc.desc Pointer interface PointerVisible exception test
     * @tc.level Level4
     * @tc.size SmallTest
     * @tc.type Function
     */
    it('Pointer_PointerVisibleTest_Exception_Test_001', 0, async function (done) {
      console.info(`Pointer_PointerVisibleTest_Exception_Test_001 enter`);
      try {
        await pointer.setPointerVisible();
      } catch (error) {
        console.info(`PointerVisibleTest_Exception_Test_001: ${JSON.stringify(error, [`code`, `message`])}`);
        expect(error.code).assertEqual(errCode.COMMON_PARAMETER_CODE);
        expect(error.message).assertEqual(errMsg.PARAMETER_VISIBLE_TYPE_MSG);
      }
      try {
        pointer.isPointerVisible((error, data) => {
          if (error) {
            console.info(`PointerVisibleTest_Exception_Test_001 failed, err=${JSON.stringify(error)}`);
            expect(false).assertTrue();
          } else {
            console.info(`PointerVisibleTest_Exception_Test_001 success`);
            expect(data).assertInstanceOf('Boolean');
          }
          done();
        });
      } catch (error) {
        console.info(`PointerVisibleTest_Exception_Test_001: ${JSON.stringify(error, [`code`, `message`])}`);
      }
      console.info(`Pointer_PointerVisibleTest_Exception_Test_001 exit`);
    })

    /**
     * @tc.number MultimodalInputPointer_Test_015
     * @tc.name Pointer_PointerVisibleTest_Exception_Test_002
     * @tc.desc Pointer interface PointerVisible exception test
     * @tc.level Level4
     * @tc.size SmallTest
     * @tc.type Function
     */
    it('Pointer_PointerVisibleTest_Exception_Test_002', 0, async function (done) {
      console.info(`Pointer_PointerVisibleTest_Exception_Test_002 enter`);
      try {
        pointer.setPointerVisible(`state`, (error, data) => {
          if (error) {
            console.info(`PointerVisibleTest_Exception_Test_002 failed, err=${JSON.stringify(error)}`);
            expect(false).assertTrue();
          } else {
            console.info(`PointerVisibleTest_Exception_Test_002 success`);
            expect(true).assertTrue();
          }
        });
      } catch (error) {
        console.info(`PointerVisibleTest_Exception_Test_002: ${JSON.stringify(error, [`code`, `message`])}`);
        expect(error.code).assertEqual(errCode.COMMON_PARAMETER_CODE);
        expect(error.message).assertEqual(errMsg.PARAMETER_VISIBLE_TYPE_MSG);
      }

      try {
        await pointer.isPointerVisible(null);
      } catch (error) {
        console.info(`PointerVisibleTest_Exception_Test_002: ${JSON.stringify(error, [`code`, `message`])}`);
        expect(error.code).assertEqual(errCode.COMMON_PARAMETER_CODE);
        expect(error.message).assertEqual(errMsg.PARAMETER_CALLBACK_TYPE_MSG);
      }
      console.info(`Pointer_PointerVisibleTest_Exception_Test_002 exit`);
      done();
    })

    /**
     * @tc.number MultimodalInputPointer_Test_016
     * @tc.name Pointer_PointerStyleTest_Exception_Test_001
     * @tc.desc Pointer interface PointerStyle exception test
     * @tc.level Level4
     * @tc.size SmallTest
     * @tc.type Function
     */
    it('Pointer_PointerStyleTest_Exception_Test_001', 0, async function (done) {
      console.info(`Pointer_PointerStyleTest_Exception_Test_001 enter`);
      try {
        await pointer.setPointerStyle(10, 10, null);
      } catch (error) {
        console.info(`PointerStyleTest_Exception_Test_001: ${JSON.stringify(error, [`code`, `message`])}`);
        expect(error.code).assertEqual(errCode.COMMON_PARAMETER_CODE);
        expect(error.message).assertEqual(errMsg.PARAMETER_CALLBACK_TYPE_MSG);
      }

      try {
        await pointer.getPointerStyle(10, null).then((data) => {
          console.info(`PointerStyleTest_Exception_Test_001 success`);
          expect(true).assertTrue();
        }, (error) => {
          console.info(`PointerStyleTest_Exception_Test_001 failed, err=${JSON.stringify(error)}`);
          expect(false).assertTrue();
        });
      } catch (error) {
        console.info(`PointerStyleTest_Exception_Test_001: ${JSON.stringify(error, [`code`, `message`])}`);
        expect(error.code).assertEqual(errCode.COMMON_PARAMETER_CODE);
        expect(error.message).assertEqual(errMsg.PARAMETER_CALLBACK_TYPE_MSG);
      }
      console.info(`Pointer_PointerStyleTest_Exception_Test_001 exit`);
      done();
    })

    /**
     * @tc.number MultimodalInputPointer_Test_017
     * @tc.name Pointer_PointerStyleTest_Exception_Test_002
     * @tc.desc Pointer interface PointerStyle exception test
     * @tc.level Level4
     * @tc.size SmallTest
     * @tc.type Function
     */
    it('Pointer_PointerStyleTest_Exception_Test_002', 0, async function (done) {
      console.info(`Pointer_PointerStyleTest_Exception_Test_002 enter`);
      try {
        await pointer.setPointerStyle().then((data) => {
          console.info(`PointerStyleTest_Exception_Test_002 success`);
          expect(true).assertTrue();
        }, (error) => {
          console.info(`PointerStyleTest_Exception_Test_002 failed, err=${JSON.stringify(error)}`);
          expect(false).assertTrue();
        });
      } catch (error) {
        console.info(`PointerStyleTest_Exception_Test_002 success`);
        expect(error.code).assertEqual(errCode.COMMON_PARAMETER_CODE);
        expect(error.message).assertEqual(errMsg.PARAMETER_WINDOWID_TYPE_MSG);
      }

      try {
        await pointer.getPointerStyle();
      } catch (error) {
        console.info(`PointerStyleTest_Exception_Test_002: ${JSON.stringify(error, [`code`, `message`])}`);
        expect(error.code).assertEqual(errCode.COMMON_PARAMETER_CODE);
        expect(error.message).assertEqual(errMsg.PARAMETER_WINDOWID_TYPE_MSG);
      }
      console.info(`Pointer_PointerStyleTest_Exception_Test_002 exit`);
      done();
    })

    /**
     * @tc.number MultimodalInputPointer_Test_018
     * @tc.name Pointer_SetPointerStyleSyncTest_Test_001
     * @tc.desc Pointer interface PointerStyle exception test
     * @tc.level Level3
     * @tc.size SmallTest
     * @tc.type Function
     */
    it('Pointer_SetPointerStyleSyncTest_Test_001', 0, async function (done) {
      console.info(`Pointer_SetPointerStyleSyncTest_Test_001 enter`);
      try {
        pointer.setPointerStyleSync(10, 10);
      } catch (error) {
        console.info(`Pointer_SetPointerStyleSyncTest_Test_001 success`);
        expect(error.code).assertEqual(errCode.COMMON_PARAMETER_CODE);
        expect(error.message).assertEqual(errMsg.PARAMETER_WINDOWID_TYPE_MSG);
      }
      console.info(`Pointer_SetPointerStyleSyncTest_Test_001 exit`);
      done();
    })

    /**
     * @tc.number MultimodalInputPointer_Test_019
     * @tc.name Pointer_setCustomCursorTest_Test_001
     * @tc.desc set custom cursor test
     * @tc.level Level3
     * @tc.size SmallTest
     * @tc.type Function
     */
    it('Pointer_setCustomCursorTest_Test_001', 0, async function (done) {
      console.info(`Pointer_setCustomCursorSyncTest_Test_001 enter`);
      const color = new ArrayBuffer(96);
      let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } };
      image.createPixelMap(color, opts).then((pixelMap) => {
        console.log('Succeeded in creating pixelmap.');
        try {
          pointer.setCustomCursorSync(0, pixelMap, 25, 25);
          expect(true).assertTrue();
        } catch (error) {
          expect(false).assertTrue();
        }
      })
      console.info(`Pointer_setCustomCursorSyncTest_Test_001 exit`);
      done();
    })

    /**
     * @tc.number MultimodalInputPointer_Test_020
     * @tc.name Pointer_setCustomCursorTest_Test_002
     * @tc.desc set custom cursor test
     * @tc.level Level3
     * @tc.size SmallTest
     * @tc.type Function
     */
    it('Pointer_setCustomCursorTest_Test_002', 0, async function (done) {
      console.info(`Pointer_setCustomCursorTest_Test_002 enter`);
      const color = new ArrayBuffer(96);
      let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
      image.createPixelMap(color, opts).then((pixelMap) => {
        console.log('Succeeded in creating pixelmap.');
        try {
          pointer.setCustomCursor(0, pixelMap, 0, 0).then(() => {
            console.log(`setCustomCursor success`);
            expect(true).assertTrue();
          });
        } catch (error) {
          expect(false).assertTrue();
        }
      })
      console.info(`Pointer_setCustomCursorTest_Test_002 exit`);
      done();
    })

    /**
     * @tc.number MultimodalInputPointer_Test_021
     * @tc.name Pointer_setCustomCursorTest_Exception_Test_001
     * @tc.desc Set custom cursor test
     * @tc.level Level4
     * @tc.size SmallTest
     * @tc.type Function
     */
    it('Pointer_setCustomCursorTest_Exception_Test_001', 0, async function (done) {
      console.info(`Pointer_setCustomCursorTest_Exception_Test_001 enter`);
      try {
        pointer.setCustomCursorSync(0, 1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code).assertEqual(errCode.COMMON_PARAMETER_CODE);
      }
      console.info(`Pointer_setCustomCursorTest_Exception_Test_001 exit`);
      done();
    })
  })
}