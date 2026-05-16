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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import window from '@ohos.window';
import common from '@ohos.app.ability.common';
import ohosWindow from '@ohos.window';
import { Driver, ON } from '@ohos.UiTest';
import settings from '@ohos.settings';
import display from '@ohos.display';

function createSysSubWindow(context: common.UIAbilityContext, caseName: string): Promise<window.Window> {
  let config: window.Configuration = {
    name: "systemWindow",
    windowType: window.WindowType.TYPE_DIALOG,
    ctx: context
  };
  return new Promise((resolve, reject) => {
    let subWindowClass: window.Window;
    let minWidth = 0;
    let minHeight = 0;
    window.createWindow(config).then(async (data) => {
      subWindowClass = data;
      console.info(`${caseName} Succeeded in creating the system sub window.`);
      minWidth = Number(subWindowClass.getWindowLimits().minWidth);
      minHeight = Number(subWindowClass.getWindowLimits().minHeight);
      console.log('Window WindowLimits:' + minWidth +' '+ minHeight);
      await data.setUIContent('testability/pages/First/index1');
      console.info(`${caseName} Succeeded in loading the system sub window content.`);
      await data.showWindow();
      console.info(`${caseName} Succeeded in showing the system sub window.`);
      await data.resizeAsync(minWidth+200, minHeight+200);
      await data.moveWindowTo(0, 300);
      console.info(`${caseName} Succeeded in resizing the system sub window.`);
      resolve(data);
    }).catch(async (err: BusinessError) => {
      await subWindowClass.destroyWindow();
      console.info(`${caseName} Succeeded in destroying the sub window.`);
      reject(err);
    });
  })
}

function createSubWindow(windowStage: window.WindowStage, caseName: string): Promise<window.Window> {
  return new Promise((resolve, reject) => {
    let subWindowClass: window.Window;
    let minWidth = 0;
    let minHeight = 0;
    windowStage.createSubWindow('subWindow').then(async (data) => {
      subWindowClass = data;
      console.info(`${caseName} Succeeded in creating the sub window.`);
      minWidth = Number(subWindowClass.getWindowLimits().minWidth);
      minHeight = Number(subWindowClass.getWindowLimits().minHeight);
      console.log('Window WindowLimits:' + minWidth +' '+ minHeight);
      await data.setUIContent('testability/pages/First/index1');
      console.info(`${caseName} Succeeded in loading the sub window content.`);
      await data.showWindow();
      console.info(`${caseName} Succeeded in showing the sub window.`);
      await data.resizeAsync(minWidth+200, minHeight+200);
      console.info(`${caseName} Succeeded in resizing the sub window.`);
      resolve(data);
    }).catch(async (err: BusinessError) => {
      await subWindowClass.destroyWindow();
      console.info(`${caseName} Succeeded in destroying the sub window.`);
      reject(err);
    });
  })
}

export default function windowManageTest() {
  describe('windowManage_test', () => {
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context : common.UIAbilityContext;
    let windowStage: ohosWindow.WindowStage;
    let windowClass: window.Window;
    let displayId: number | undefined;
    let isPCStatus: string = '';
    let isAutoWindow: string = '';
    let isFreeWindowMode = false;
    let driver: Driver;
    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context))
      windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
      windowClass = windowStage.getMainWindowSync();
      displayId = windowClass.getWindowProperties().displayId;
      //isAutoWindow == '' 非PAD设备
      //isAutoWindow == 'true' PAD设备自由多窗模式
      //isAutoWindow == 'false' PAD设备非自由多窗模式
      isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '',settings.domainName.USER_PROPERTY);
      console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
      isFreeWindowMode = windowClass.isInFreeWindowMode();
      //isFreeWindowMode == true 自由窗口模式
      //isFreeWindowMode == false 非自由窗口模式
      console.info(`isFreeWindowMode: ${isFreeWindowMode}`);
      isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
      //isPCStatus == '' 非PC设备
      //isPCStatus == '1' PC设备状态栏dock未融合
      //isPCStatus == '0' PC设备状态栏dock融合
      console.info(`beforeAll isPCStatus: `+ isPCStatus);
      driver = Driver.create();
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async ()=>{
      try {
        await sleep(1000)
        let mainWindowClass = windowStage.getMainWindowSync()
        let mainID = mainWindowClass.getWindowProperties().id
        let lastWindow = await window.getLastWindow(context)
        let lastID = lastWindow.getWindowProperties().id
        while (mainID != lastID) {
          await lastWindow.destroyWindow()
          await sleep(1000)
          lastWindow = await window.getLastWindow(context)
          lastID = lastWindow.getWindowProperties().id
      }
      } catch (error) {
        console.log('afterEach fail cause'+error)
      }
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.name   testGetWindowsByCoordinatenullWindow
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1000
     * @tc.desc   Get windows by coordinate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWindowsByCoordinatenullWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testGetWindowsByCoordinatenullWindow';
      let mainWindowClass: window.Window = windowStage.getMainWindowSync();
      let displayId = display.getDefaultDisplaySync().id;
      let width = display.getDefaultDisplaySync().width;
      let height = display.getDefaultDisplaySync().height;
      if(isPCStatus != ''){
        try{
          await mainWindowClass.minimize();
          await sleep(1000);
          window.getWindowsByCoordinate(displayId, 0, width/2,height/2).then(async (data) => {
            console.info(`${caseName} The window displayId is:` + displayId);
            console.info(`${caseName} Succeeded in getting window from point. Data: + JSON.stringify(data)`);
            expect(data.length).assertEqual(0);
            await mainWindowClass.restore();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(`${caseName} Failed to get window from point. Cause code: ${err.code}, message: ${err.message}`);
            await mainWindowClass.restore();
            expect().assertFail();
            done();
          });
        }catch(err){
          console.error(`${caseName} Error. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code === 801) {
            done();
          } else {
            expect().assertFail();
            done();
          }
        }

      }else{
        done();
      }
    })
    /**
     * @tc.name   testGetWindowsByCoordinateWithSystemWindow
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0100
     * @tc.desc   Get windows by coordinate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWindowsByCoordinateWithSystemWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'TestGetWindowsByCoordinateWithSystemWindow';
      let subWindowClass: window.Window;
      createSysSubWindow(context, caseName).then(async (data) => {
        subWindowClass = data;
        await sleep(1000);
        window.getWindowsByCoordinate(displayId).then(async (data) => {
          await subWindowClass.destroyWindow();
          console.info(`${caseName} The window displayId is: ` + displayId);
          console.info(`${caseName} Succeeded in getting window from point. Data: ` + JSON.stringify(data));
          expect(data.length).assertEqual(2);
          done();
        }).catch(async (err: BusinessError) => {
          await subWindowClass.destroyWindow();
          console.error(`${caseName} Failed to get window from point. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      }).catch((err: BusinessError) => {
        if (err.code === 801) {
          console.error(`${caseName} The current device type does not support to resize.`);
          done();
        } else {
          console.error(`${caseName} Error. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      });
    })
    /**
     * @tc.name   testGetWindowsByCoordinateWithSubWindow
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0200
     * @tc.desc   Get windows by coordinate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWindowsByCoordinateWithSubWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'TestGetWindowsByCoordinateWithSubWindow';
      let subWindowClass: window.Window;
      createSubWindow(windowStage, caseName).then(async (data) => {
        subWindowClass = data;
        await sleep(1000);
        window.getWindowsByCoordinate(displayId).then(async (data) => {
          await subWindowClass.destroyWindow();
          console.info(`${caseName} The window displayId is: ` + displayId);
          console.info(`${caseName} Succeeded in getting window from point. Data: ` + JSON.stringify(data));
          expect(data.length).assertEqual(2);
          done();
        }).catch(async (err: BusinessError) => {
          await subWindowClass.destroyWindow();
          console.error(`${caseName} Failed to get window from point. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      }).catch((err: BusinessError) => {
        if (err.code === 801) {
          console.info(`${caseName} The current device type does not support to resize.`);
          done();
        } else {
          console.error(`${caseName} Error. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      });
    })
    /**
     * @tc.name   testGetWindowsByCoordinateWithWinNumberIs3
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0300
     * @tc.desc   Get windows by coordinate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWindowsByCoordinateWithWinNumberIs3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'TestGetWindowsByCoordinateWithWinNumberIs3';
      let subWindowClass: window.Window;
      createSubWindow(windowStage, caseName).then(async (data) => {
        subWindowClass = data;
        await sleep(1000);
        window.getWindowsByCoordinate(displayId, 3).then(async (data) => {
          await subWindowClass.destroyWindow();
          console.info(`${caseName} The window displayId is: ` + displayId);
          console.info(`${caseName} Succeeded in getting window from point. Data: ` + JSON.stringify(data));
          expect(data.length).assertEqual(2);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to get window from point. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      }).catch((err: BusinessError) => {
        if (err.code === 801) {
          console.info(`${caseName} The current device type does not support to resize.`);
          done();
        } else {
          console.error(`${caseName} Error. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      });
    })
    /**
     * @tc.name   testGetWindowsByCoordinateWithNegativeWinNumber
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0400
     * @tc.desc   Get windows by coordinate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWindowsByCoordinateWithNegativeWinNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'TestGetWindowsByCoordinateWithNegativeWinNumber';
      let subWindowClass: window.Window;
      createSubWindow(windowStage, caseName).then(async (data) => {
        subWindowClass = data;
        await sleep(1000);
        window.getWindowsByCoordinate(displayId, -1).then(async (data) => {
          await subWindowClass.destroyWindow();
          console.info(`${caseName} The window displayId is: ` + displayId);
          console.info(`${caseName} Succeeded in getting window from point. Data: ` + JSON.stringify(data));
          expect(data.length).assertEqual(2);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to get window from point. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      }).catch((err: BusinessError) => {
        if (err.code === 801) {
          console.info(`${caseName} The current device type does not support to resize.`);
          done();
        } else {
          console.error(`${caseName} Error. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      });
    })
    /**
     * @tc.name   testGetWindowsByCoordinateWithNegativeWinNumBerAndXY
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0500
     * @tc.desc   Get windows by coordinate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWindowsByCoordinateWithNegativeWinNumBerAndXY', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'TestGetWindowsByCoordinateWithNegativeWinNumBerAndXY';
      let subWindowClass: window.Window;
      createSubWindow(windowStage, caseName).then(async (data) => {
        subWindowClass = data;
        await sleep(1000);
        window.getWindowsByCoordinate(displayId, 0, -1, -1).then(async (data) => {
          await subWindowClass.destroyWindow();
          console.info(`${caseName} The window displayId is: ` + displayId);
          console.info(`${caseName} Succeeded in getting window from point. Data: ` + JSON.stringify(data));
          expect(data.length).assertEqual(2);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to get window from point. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      }).catch((err: BusinessError) => {
        if (err.code === 801) {
          console.info(`${caseName} The current device type does not support to resize.`);
          done();
        } else {
          console.error(`${caseName} Error. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      });
    })
    /**
     * @tc.name   testGetWindowsByCoordinateWithNegativeXY
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0600
     * @tc.desc   Get windows by coordinate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWindowsByCoordinateWithNegativeXY', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'testGetWindowsByCoordinateWithNegativeXY';
      let subWindowClass: window.Window;
      createSubWindow(windowStage, caseName).then(async (data) => {
        subWindowClass = data;
        await sleep(1000);
        window.getWindowsByCoordinate(displayId, 3, -1, -1).then(async (data) => {
          await subWindowClass.destroyWindow();
          console.info(`${caseName} The window displayId is: ` + displayId);
          console.info(`${caseName} Succeeded in getting window from point. Data: ` + JSON.stringify(data));
          expect(data.length).assertEqual(2);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to get window from point. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      }).catch((err: BusinessError) => {
        if (err.code === 801) {
          console.info(`${caseName} The current device type does not support to resize.`);
          done();
        } else {
          console.error(`${caseName} Error. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      });
    })
    /**
     * @tc.name   testGetWindowsByCoordinateWithTwoSubWindow
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0700
     * @tc.desc   Get windows by coordinate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWindowsByCoordinateWithTwoSubWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'TestGetWindowsByCoordinateWithTwoSubWindow';
      let subWindowClass: window.Window;
      let sysSubWindowClass: window.Window;
      createSysSubWindow(context, caseName).then((data) => {
        sysSubWindowClass = data;
        createSubWindow(windowStage, caseName).then(async (data) => {
          subWindowClass = data;
          await sleep(1000);
          window.getWindowsByCoordinate(displayId).then(async (data) => {
            await subWindowClass.destroyWindow();
            await sysSubWindowClass.destroyWindow();
            console.info(`${caseName} The window displayId is: ` + displayId);
            console.info(`${caseName} Succeeded in getting window from point. Data: ` + JSON.stringify(data));
            expect(data.length).assertEqual(3);
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} Failed to get window from point. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          });
        })
      }).catch((err: BusinessError) => {
        if (err.code === 801) {
          console.info(`${caseName} The current device type does not support to resize.`);
          done();
        } else {
          console.error(`${caseName} Error. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      });
    })
    /**
     * @tc.name   testGetWindowsByCoordinateWithInvalidDisPlayId
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0800
     * @tc.desc   Get windows by coordinate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWindowsByCoordinateWithInvalidDisPlayId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'TestGetWindowsByCoordinateWithInvalidDisPlayId';
      try {
        window.getWindowsByCoordinate(123).then((data) => {
          console.info(`${caseName} Succeeded in getting window from point. Data: ` + JSON.stringify(data));
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to get window from point. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      } catch (exception) {
        if (exception.code === 801) {
          console.info(`${caseName} The current device type does not support to get window from point.`);
          done();
        } else {
          console.error(`${caseName} Failed to get window from point. Cause code: ${exception.code}, message: ${exception.message}`);
          expect(exception.code).assertEqual(401);
          done();
        }
      }
    })
    /**
     * @tc.name   testGetWindowsByCoordinateWithNegativeX
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0900
     * @tc.desc   Get windows by coordinate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWindowsByCoordinateWithNegativeX', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'testGetWindowsByCoordinateWithNegativeX';
      let subWindowClass: window.Window;
      createSubWindow(windowStage, caseName).then(async (data) => {
        subWindowClass = data;
        await sleep(1000);
        window.getWindowsByCoordinate(displayId, 3, -1).then(async (data) => {
          await subWindowClass.destroyWindow();
          console.info(`${caseName} The window displayId is: ` + displayId);
          console.info(`${caseName} Succeeded in getting window from point. Data: ` + JSON.stringify(data));
          expect(data.length).assertEqual(2);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to get window from point. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      }).catch((err: BusinessError) => {
        if (err.code === 801) {
          console.info(`${caseName} The current device type does not support to resize.`);
          done();
        } else {
          console.error(`${caseName} Error. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      });
    })

    
    /**
     * @tc.name   testOnWindowStageClose
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0900
     * @tc.desc   Listener for window stage close event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnWindowStageClose', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'TestOnWindowStageClose';
      try {
        if(isFreeWindowMode){
          let closeBtn = await driver.findComponent(ON.id('EnhanceCloseBtn'));
          let count = 0;
          windowStage.on('windowStageClose', () => {
            console.info(`${caseName} Succeeded in enabling the listener for window stage close event.`);
            count++;
            return true;
          });
          await closeBtn.click();
          await sleep(1000);
          console.info(`${caseName} count is: ${count}`);
          expect(count).assertEqual(1);
          done();
        }else{
          done();
        }
        
      } catch (exception) {
        if (exception.code === 801) {
          console.info(`${caseName} The current device type does not support to listener for window stage close event.`);
          windowStage.off('windowStageClose');
          done();
        } else {
          console.error(`${caseName} Failed to enable the listener for window stage close event. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   testOnWindowStageCloseRepeat
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1000
     * @tc.desc   Listener for window stage close event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnWindowStageCloseRepeat',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'TestOnWindowStageCloseRepeat';
      try {
        if(isFreeWindowMode){
          let closeBtn = await driver.findComponent(ON.id('EnhanceCloseBtn'));
          let count1 = 0;
          let count2 = 0;
          const closeFunc1 = () => {
            console.info(`${caseName} func1 Succeeded in enabling the listener for window stage close event.`);
            count1++;
            return true;
          }
          const closeFunc2 = () => {
            console.info(`${caseName} func2 Succeeded in enabling the listener for window stage close event.`);
            count2++;
            return true;
          }
          windowStage.on('windowStageClose', closeFunc1);
          windowStage.on('windowStageClose', closeFunc2);
          await closeBtn.click();
          await sleep(1000);
          console.info(`${caseName} count1 is: ${count1}, count2 is: ${count2}`);
          expect(count1).assertEqual(0);
          expect(count2).assertEqual(1);
          done();
        }else{
          done();
        }
        
      } catch (exception) {
        if (exception.code === 801) {
          console.info(`${caseName} The current device type does not support to listener for window stage close event.`);
          windowStage.off('windowStageClose')
          done();
        } else {
          console.error(`${caseName} Failed to enable the listener for window stage close event. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   testOnWindowStageCloseOff
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1100
     * @tc.desc   Listener for window stage close event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnWindowStageCloseOff', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'TestOnWindowStageCloseOff';
      try {
        if(isFreeWindowMode){
          let closeBtn = await driver.findComponent(ON.id('EnhanceCloseBtn'));
          let count1 = 0;
          let count2 = 0;
          const closeFunc1 = () => {
            console.info(`${caseName} func1 Succeeded in enabling the listener for window stage close event.`);
            count1++;
            return true;
          }
          const closeFunc2 = () => {
            console.info(`${caseName} func2 Succeeded in enabling the listener for window stage close event.`);
            count2++;
            return true;
          }
          windowStage.on('windowStageClose', closeFunc2);
          windowStage.off('windowStageClose', closeFunc2);
          windowStage.on('windowStageClose', closeFunc1);
          await closeBtn.click();
          await sleep(1000);
          console.info(`${caseName} count1 is: ${count1}, count2 is: ${count2}`);
          expect(count1).assertEqual(1);
          expect(count2).assertEqual(0);
          done();
        }else{
          done();
        }
        
      } catch (exception) {
        if (exception.code === 801) {
          console.info(`${caseName} The current device type does not support to listener for window stage close event.`);
          windowStage.off('windowStageClose');
          done();
        } else {
          console.error(`${caseName} Failed to enable the listener for window stage close event. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   testSetWindowTopmost
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1200
     * @tc.desc   Set the window to be top most.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWindowTopmost', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'TestSetWindowTopmost';
      try {
        windowClass.setWindowTopmost(false).then(() => {
          console.info(`${caseName} Succeeded in setting the window to be top most.`);
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to set the window to be top most. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      } catch (exception) {
        if (exception.code === 801) {
          console.info(`${caseName} The current device type does not support to setWindowTopmost`);
          done();
        } else {
          console.error(`${caseName} Failed to set the window to be top most. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   testSetWindowTopmostInSubWindow
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1300
     * @tc.desc   Set the window to be top most.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWindowTopmostInSubWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'TestSetWindowTopmostInSubWindow';
      let subWindowClass = await windowStage.createSubWindow('subWindow');
      console.info(`${caseName} Succeeded in creating the sub window.`);
      await subWindowClass.setUIContent('testability/pages/First/index1');
      console.info(`${caseName} Succeeded in loading the sub window content.`);
      await subWindowClass.showWindow();
      try {
        windowClass.setWindowTopmost(true).then(async () => {
          console.info(`${caseName} Succeeded in setting the window to be top most.`);
          expect(true).assertTrue();
          await windowClass.setWindowTopmost(false)
          await subWindowClass.destroyWindow();
          done();
        }).catch(async (err: BusinessError) => {
          console.error(`${caseName} Failed to set the window to be top most. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      } catch (exception) {
        if (exception.code === 801) {
          console.info(`${caseName} The current device type does not support to setWindowTopmost`);
          await subWindowClass.destroyWindow();
          done();
        } else {
          console.error(`${caseName} Failed to set the window to be top most. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   testSetWindowTopmostUnauthorized
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1400
     * @tc.desc   Set the window to be top most.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowTopmostUnauthorized',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'TestSetWindowTopmostUnauthorized';
      let subWindowClass = await windowStage.createSubWindow('subWindow');
      console.info(`${caseName} Succeeded in creating the sub window.`);
      await subWindowClass.setUIContent('testability/pages/First/index1');
      console.info(`${caseName} Succeeded in loading the sub window content.`);
      await subWindowClass.showWindow();
      try {
        subWindowClass.setWindowTopmost(false).then(() => {
          console.info(`${caseName} Succeeded in setting the window to be top most.`);
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to set the window to be top most. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      } catch (exception) {
        if (exception.code === 801) {
          console.info(`${caseName} The current device type does not support to setWindowTopmost`);
          await subWindowClass.destroyWindow();
          done();
        } else {
          console.error(`${caseName} Unauthorized operation.. Cause code: ${exception.code}, message: ${exception.message}`);
          expect(exception.code).assertEqual(1300004);
          await subWindowClass.destroyWindow();
          done();
        }
      }
    })
    /**
     * @tc.name   testSetWindowMaximizeButtonVisible
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1500
     * @tc.desc   Set whether to display the maximize, minimize buttons of main window.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowMaximizeButtonVisible', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) =>  {
      let caseName = 'TestSetWindowMaximizeButtonVisible';
      try {
        let count:boolean = false;
        windowClass.setWindowTitleButtonVisible(false, false);
        console.info(`${caseName} Succeeded in setting false to display the maximize buttons of main window.`);
        await sleep(1000);
        windowClass.on('windowTitleButtonRectChange', (titleButtonRect) => {
          console.info(`${caseName} Succeeded in enabling the listener for window title buttons area changes. Data: ` + JSON.stringify(titleButtonRect));
          count = true;
          console.info(`${caseName} windowTitleButtonRectChange count: `+ count);
        });
        windowClass.setWindowTitleButtonVisible(true, true);
        console.info(`${caseName} Succeeded in setting true to display the maximize buttons of main window.`);
        await sleep(1000);
        console.info(`${caseName}  count: `+ count);
        if(isFreeWindowMode){
          expect(count).assertEqual(true);
          windowClass.off('windowTitleButtonRectChange');
          done();
        }else{
          expect(count).assertEqual(false);
          windowClass.off('windowTitleButtonRectChange');
          done();
        }
      } catch (exception) {
        if (exception.code === 801) {
          console.info(`${caseName} The current device type does not support to set whether to display the maximize buttons of main window.`);
          windowClass.off('windowTitleButtonRectChange');
          done();
        } else if(!isFreeWindowMode){
          expect(exception.code).assertEqual(1300002);
          done();
        }
        else {
          console.error(`${caseName} Failed to set whether to display the maximize buttons of main window. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   testSetWindowMaximizeButtonVisibleUndefined
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1600
     * @tc.desc   Set whether to display the maximize, minimize buttons of main window.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowMaximizeButtonVisibleUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) =>  {
      let caseName = 'TestSetWindowMaximizeButtonVisibleUndefined';
      try {
        windowClass.setWindowTitleButtonVisible(undefined, undefined);
        console.info(`${caseName} Succeeded in setting undefined to display the maximize buttons of main window.`);
        expect(false).assertTrue();
        done();
      } catch (exception) {
        if (exception.code === 801) {
          console.error(`${caseName} The current device type does not support to set whether to display the maximize buttons of main window.`);
          done();
        } else if (exception.code === 401) {
          console.error(`${caseName} Parameter error. message: ${exception.message}`);
          done();
        } else {
          console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   testSetWindowMaximizeButtonVisibleInSubWindow
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1700
     * @tc.desc   Set whether to display the maximize, minimize buttons of main window.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowMaximizeButtonVisibleInSubWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'TestSetWindowMaximizeButtonVisibleInSubWindow';
      let subWindowClass = await windowStage.createSubWindow('TestSetWindowMaximizeButtonVisibleInSubWindow');
      console.info(`${caseName} Succeeded in creating the sub window.`);
      await subWindowClass.setUIContent('testability/pages/First/index1');
      console.info(`${caseName} Succeeded in loading the sub window content.`);
      await subWindowClass.showWindow();
      await sleep(1000);
      try {
        subWindowClass.setWindowTitleButtonVisible(false, false);
        console.info(`${caseName} Succeeded in setting whether to display the maximize buttons of main window.`)
        expect(false).assertTrue();
        done();
      } catch (exception) {
        if (exception.code === 801) {
          console.error(`${caseName} The current device type does not support to resize.`);
          await subWindowClass.destroyWindow();
          done();
        } else {
          console.error(`${caseName} Unauthorized operation. Cause code: ${exception.code}, message: ${exception.message}`);
          expect(exception.code).assertEqual(1300004);
          await subWindowClass.destroyWindow();
          done();
        }
      }
    })
    /**
     * @tc.name   testRestoreBySubWindow
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1800
     * @tc.desc   After the app main window is minimized, if the Ability is not in the background state, you can restore app main window.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRestoreBySubWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'TestRestoreBySubWindow';
      let subWindowClass = await windowStage.createSubWindow('TestRestoreBySubWindow');
      console.info(`${caseName} Succeeded in creating the sub window.`);
      await subWindowClass.setUIContent('testability/pages/First/index1');
      console.info(`${caseName} Succeeded in loading the sub window content.`);
      await subWindowClass.showWindow();
      subWindowClass.restore().then(async () => {
        console.info(`${caseName} Succeeded in restoring the window.`);
        expect(false).assertTrue();
        done();
      }).catch(async (err: BusinessError) => {
        console.error(`${caseName} Unauthorized operation. Cause code: ${err.code}, message: ${err.message}`);
        expect(1300004).assertEqual(err.code);
        await subWindowClass.destroyWindow();
        done();
      });
    })
  })
}

