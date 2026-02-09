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
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@kit.BasicServicesKit';
import { Driver, ON } from '@kit.TestKit';
import settings from '@ohos.settings';
import * as LoadContentByName from '../testability/pages/WindowTest/LoadContentByName';
import { StartOptions } from '@kit.AbilityKit';

let sleep = (sleepMs: number) => new Promise < string > (resolve => setTimeout(resolve, sleepMs));

async function startAbility(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
  let want: Want = {
    bundleName: AppStorage.get('bundleName'),
    abilityName: 'StartTestAbility'
  };
  if (options) {
    await context.startAbility(want, options).then(() => {
      console.info(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.info(`${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
    });
  } else {
    await context.startAbility(want).then(() => {
      console.info(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.info(`${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
    });
  }
  await sleep(1000)
  let windowStageStart = AppStorage.get('windowStageStartTest') as window.WindowStage;
  return windowStageStart
}

async function terminateAbility(caseName: string) {
  let pageContext = AppStorage.get('contextTest') as common.UIAbilityContext
  await pageContext.terminateSelf().then(() => {
    console.log(`${caseName} terminateSelf success`);
  }).catch((err: BusinessError) => {
    console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
  });
  await sleep(1000)
}


async function startAbility4(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
  let want: Want = {
    bundleName: AppStorage.get('bundleName'),
    abilityName: 'StartTestAbility4',
  };
  if (options) {
    await context.startAbility(want, options).then(() => {
      console.info(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.info(`${caseName} Failed in starting ability. Cause message: ${err.message}`);
    });
  } else {
    await context.startAbility(want).then(() => {
      console.info(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.info(`${caseName} Failed in starting ability. Cause message: ${err.message}`);
    });
  }
  await sleep(1000)
  let windowStageStart = AppStorage.get('windowStageStartTest4') as window.WindowStage;
  return windowStageStart
}

async function terminateAbility4(caseName: string) {
  let pageContext = AppStorage.get('contextTest4') as common.UIAbilityContext
  await pageContext.terminateSelf().then(() => {
    console.log(`${caseName} terminateSelf success`);
  }).catch((err: BusinessError) => {
    console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
  });
  await sleep(1000)
}

async function startAbility5(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
  let want: Want = {
    bundleName: AppStorage.get('bundleName'),
    abilityName: 'StartTestAbility5',
  };
  if (options) {
    await context.startAbility(want, options).then(() => {
      console.info(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.info(`${caseName} Failed in starting ability. Cause message: ${err.message}`);
    });
  } else {
    await context.startAbility(want).then(() => {
      console.info(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.info(`${caseName} Failed in starting ability. Cause message: ${err.message}`);
    });
  }
  await sleep(1000)
  let windowStageStart = AppStorage.get('windowStageStartTest5') as window.WindowStage;
  return windowStageStart
}

async function terminateAbility5(caseName: string) {
  let pageContext = AppStorage.get('contextTest5') as common.UIAbilityContext
  await pageContext.terminateSelf().then(() => {
    console.log(`${caseName} terminateSelf success`);
  }).catch((err: BusinessError) => {
    console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
  });
  await sleep(1000)
}

export default function windowLayoutTest() {
  describe('windowLayoutTest', async () => {
    let sleep = (sleepMs: number) => new Promise < string > (resolve => setTimeout(resolve, sleepMs));
    let context: common.UIAbilityContext;
    let windowStage: window.WindowStage;
    let isAutoWindow: string = '';
    let isPCStatus: string = '';
    let isFreeWindowMode = false;
    let driver: Driver;
    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context));
      windowStage = AppStorage.get('windowStage') as window.WindowStage;
      //isAutoWindow == '' 非PAD设备
      //isAutoWindow == 'true' PAD设备自由多窗模式
      //isAutoWindow == 'false' PAD设备非自由多窗模式
      isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '', settings.domainName.USER_PROPERTY);
      console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
      isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
      //isPCStatus == '' 非PC设备
      //isPCStatus == '1' PC设备状态栏dock未融合
      //isPCStatus == '0' PC设备状态栏dock融合
      console.info(`beforeAll isPCStatus: ` + isPCStatus);
      let windowClass = windowStage.getMainWindowSync();
      isFreeWindowMode = windowClass.isInFreeWindowMode();
      //isFreeWindowMode == true 自由窗口模式
      //isFreeWindowMode == false 非自由窗口模式
      console.info(`isFreeWindowMode: ${isFreeWindowMode}`);
      driver = Driver.create();
    });
    beforeEach(() => {
    });
    afterEach(async () => {
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
        console.log('afterEach fail cause' + error)
      }
    })
    afterAll(() => {
    });

    /**
     * @tc.name   testStartMoving_0100
     * @tc.number testStartMoving_0100
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testStartMoving_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'startMovingTest_0100';
      await sleep(1000)
      let driver = await Driver.create();
      let windowClass = windowStage.getMainWindowSync();
      await windowClass.setUIContent("testability/pages/WindowTest/StartMoving");
      await sleep(1000)
      let windowPoint = await windowClass.getWindowProperties().windowRect
      console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
      let blank = await driver.findComponent(ON.id('startMoving'))
      await sleep(1000)
      let point = await blank.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x - 50, point.y - 50, 200);
      await sleep(1000)
      let text = await driver.findComponent(ON.id('startMovingText'));
      await sleep(1000)
      let textDragged = await text.getText()
      if (textDragged == 'startMoving success') {
        let windowPointDragged = await windowClass.getWindowProperties().windowRect
        console.info(`${message} windowPoint = ${JSON.stringify(windowPointDragged)}`)
        expect(windowPointDragged.left).assertEqual(windowPoint.left - 50)
        expect(windowPointDragged.top).assertEqual(windowPoint.top - 50)
        await windowClass.setUIContent("testability/pages/Index");
        done()
      } else if (textDragged == 'startMoving 801') {
        await windowClass.setUIContent("testability/pages/Index");
        
        done()
      } else if (textDragged == 'startMoving 1300004') {
        await windowClass.setUIContent("testability/pages/Index");
        
        done()
      } else {
        await windowClass.setUIContent("testability/pages/Index");
        console.error(`${message} Error`);
        expect(true).assertFalse()
        done()
      }
    })
    /**
     * @tc.name   testStartMoving_0200
     * @tc.number testStartMoving_0200
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testStartMoving_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'startMovingTest_0200';
      let windowClass: window.Window;
      let options: window.SubWindowOptions = {
        title: 'testStartMoving_0200',
        decorEnabled: true
      };
      windowStage.createSubWindowWithOptions('testStartMoving_0200', options).then(async (data) => {
        windowClass = data
        await windowClass.setUIContent("testability/pages/WindowTest/StartMoving");
        windowClass.resize(1000, 1200);
        windowClass.moveWindowToAsync(200, 300);
        await windowClass.showWindow();
        await sleep(1000)
        let windowPoint = windowClass.getWindowProperties().windowRect
        console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
        let blank = await driver.findComponent(ON.id('startMoving'))
        await sleep(1000)
        let point = await blank.getBoundsCenter();
        await driver.drag(point.x, point.y, point.x + 100, point.y + 100, 200);
        let text = await driver.findComponent(ON.id('startMovingText'));
        await sleep(1000)
        let textDragged = await text.getText()
        if (textDragged == 'startMoving success') {
          let windowPointDragged = windowClass.getWindowProperties().windowRect
          console.info(`${message} windowPoint = ${JSON.stringify(windowPointDragged)}`)
          expect(windowPointDragged.left).assertEqual(windowPoint.left + 100)
          expect(windowPointDragged.top).assertEqual(windowPoint.top + 100)
        } else if (textDragged == 'startMoving 801') {
          console.info(`${message}textDragged ${JSON.stringify(textDragged)}`)
        } else {
          console.error(`${message} Error`);
          expect(true).assertFalse()
        }
        await windowClass.destroyWindow()
        done();
      }).catch(async (err: BusinessError) => {
        console.error(`${message} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
        if (err.code == 801 || err.code == 1300002) {
          console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
          done();
        } else {
          expect(false).assertFalse();
          done();
        }
      })
    })

    /**
     * @tc.name   testStartMoving_0300
     * @tc.number testStartMoving_0300
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testStartMoving_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'startMovingTest_0300';
      let mainwindowClass = windowStage.getMainWindowSync();
      let windowClass: window.Window;
      let options: window.SubWindowOptions = {
        title: 'subWindow',
        decorEnabled: true
      };
      try {
        mainwindowClass.createSubWindowWithOptions('subWindow', options).then(async (data) => {
          windowClass = data
          await windowClass.setUIContent("testability/pages/WindowTest/StartMoving");
          windowClass.resize(1000, 1200);
          windowClass.moveWindowToAsync(200, 300);
          await windowClass.showWindow()
          await sleep(1000)
          let windowPoint = windowClass.getWindowProperties().windowRect
          console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
          let blank = await driver.findComponent(ON.id('startMoving'))
          await sleep(1000)
          let point = await blank.getBoundsCenter();
          await driver.drag(point.x, point.y, point.x + 100, point.y + 100, 200);
          let text = await driver.findComponent(ON.id('startMovingText'));
          await sleep(1000)
          let textDragged = await text.getText()
          if (textDragged == 'startMoving success') {
            let windowPointDragged = windowClass.getWindowProperties().windowRect
            console.info(`${message} windowPoint = ${JSON.stringify(windowPointDragged)}`)
            expect(windowPointDragged.left).assertEqual(windowPoint.left + 100)
            expect(windowPointDragged.top).assertEqual(windowPoint.top + 100)
          } else if (textDragged == 'startMoving 801') {
            console.info(`${message} textDragged = ${JSON.stringify(textDragged)}`)
          } else {
            console.error(`${message} Error`);
            expect(true).assertFalse()
          }
          await windowClass.destroyWindow()
          // await mainwindowClass.setUIContent("testability/pages/Index");
          done();
        }).catch(async (err: BusinessError) => {
          // await mainwindowClass.setUIContent("testability/pages/Index");
          await windowClass.destroyWindow()
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(false).assertFalse();
            done();
          } else {
            console.error(`${message} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertFalse();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        // await mainwindowClass.setUIContent("testability/pages/Index");
        expect(false).assertFalse();
        done();
      }

    })
    /**
     * @tc.name   testSetResizeByDragEnabledTrue_0100
     * @tc.number testSetResizeByDragEnabledTrue_0100
     * @tc.desc   testSetResizeByDragEnabledTrue_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetResizeByDragEnabledTrue_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testSetResizeByDragEnabledTrueTest_0100';
      let windowClass = windowStage.getMainWindowSync()
      let enabled = true;
      let driver = await Driver.create();
      if (isPCStatus != '') {
        try {
          windowClass.setResizeByDragEnabled(enabled, async (err) => {
            if (err.code == 801) {
              console.error(`${message}  Capability not supported. Failed to call the API due to limited device capabilities`);
              expect(false).assertFalse();
              done();
            } else if (err.code && err.code != 801) {
              console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`)
              expect().assertFail();
              done();
            }
            console.info(`${message} Succeeded in setting the function of disabling the resize by drag window.`);
            let windowPoint = await windowClass.getWindowProperties().windowRect
            console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
            await driver.mouseMoveTo({ x: windowPoint.left + Math.ceil(windowPoint.width / 2), y: windowPoint.top })
            await sleep(2000)
            await driver.mouseDrag({ x: windowPoint.left + Math.ceil(windowPoint.width / 2), y: windowPoint.top }, { x: windowPoint.left + Math.ceil(windowPoint.width / 2), y: windowPoint.top + 100 }, 2000)
            await sleep(1000)
            let windowPointDragged = await windowClass.getWindowProperties().windowRect
            console.info(`${message} windowPointDraged = ${JSON.stringify(windowPointDragged)}`)
            expect(windowPointDragged.width).assertEqual(windowPoint.width)
            expect(windowPointDragged.height).assertEqual(windowPoint.height - 100)
            done()
          });
        } catch (exception) {
          console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
          expect().assertFail();
          done();
        }
      } else {
        console.info(`${message} not support`);
        done()
      }
    })

    /**
     * @tc.name   test_setFollowParentMultiScreenPolicy_401
     * @tc.number SUB_BASIC_WMS_SetFollowParentMultiScreenPolicy_0100
     * @tc.desc   test_setFollowParentMultiScreenPolicy_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setFollowParentMultiScreenPolicy_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_setFollowParentMultiScreenPolicy_401";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWindow = await windowStage.createSubWindow('test_setFollowParentMultiScreenPolicy_401');
      await subWindow.setUIContent('testability/pages/First/index2');
      await subWindow.showWindow();
      try {
        let promise = subWindow.setFollowParentMultiScreenPolicy(null);
        promise.then(() => {
          console.info(msgStr + 'Succeeded  setFollowParentMultiScreenPolicy.');
          expect(true).assertFail();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + `Failed to setFollowParentMultiScreenPolicy . Cause code: ${err.code}, message: ${err.message}`);
          await subWindow.destroyWindow();
          if (err.code == 801) {
            done()
          } else {
            expect(true).assertFail();
            done()
          }
        });
      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        await subWindow.destroyWindow();
        expect(e.code).assertEqual(401);
        done()

      }

    })
    /**
     * @tc.name   test_setFollowParentMultiScreenPolicy_1300002
     * @tc.number SUB_BASIC_WMS_SetFollowParentMultiScreenPolicy_0200
     * @tc.desc   test_setFollowParentMultiScreenPolicy_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setFollowParentMultiScreenPolicy_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_setFollowParentMultiScreenPolicy_1300002";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWindow = await windowStage.createSubWindow('test_setFollowParentMultiScreenPolicy_1300002');
      await subWindow.setUIContent('testability/pages/First/index2');
      await subWindow.showWindow();
      try {
        await subWindow.destroyWindow();
        let promise = subWindow.setFollowParentMultiScreenPolicy(true);
        promise.then(() => {
          console.info(msgStr + 'Succeeded  setFollowParentMultiScreenPolicy.');
          expect(true).assertFail();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + `Failed to setFollowParentMultiScreenPolicy . Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            done()
          } else {
            expect(err.code).assertEqual(1300002);
            done()
          }
        });
      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        await subWindow.destroyWindow();
        expect(true).assertFail();
        done()
      }

    })
    /**
     * @tc.name   test_setFollowParentMultiScreenPolicy_mainWindow_1300004
     * @tc.number SUB_BASIC_WMS_SetFollowParentMultiScreenPolicy_0300
     * @tc.desc   test_setFollowParentMultiScreenPolicy_mainWindow_1300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setFollowParentMultiScreenPolicy_mainWindow_1300004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_setFollowParentMultiScreenPolicy_mainWindow_1300004";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let mainWindow = windowStage.getMainWindowSync();
      try {
        let promise = mainWindow.setFollowParentMultiScreenPolicy(true);
        promise.then(() => {
          console.info(msgStr + 'Succeeded  setFollowParentMultiScreenPolicy.');
          expect(true).assertFail();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + `Failed to setFollowParentMultiScreenPolicy . Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            done()
          } else {
            expect(err.code).assertEqual(1300004);
            done()
          }

        });
      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        expect(true).assertFail();
        done()

      }

    })

    /**
     * @tc.name   test_setFollowParentMultiScreenPolicy_dialogWindow_1300004
     * @tc.number SUB_BASIC_WMS_SetFollowParentMultiScreenPolicy_0400
     * @tc.desc   test_setFollowParentMultiScreenPolicy_dialogWindow_1300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setFollowParentMultiScreenPolicy_dialogWindow_1300004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_setFollowParentMultiScreenPolicy_dialogWindow_1300004";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let config: window.Configuration = {
        name: "test_setFollowParentMultiScreenPolicy_dialogWindow_1300004",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      };
      let windowClass = await window.createWindow(config);
      try {
        let promise = windowClass.setFollowParentMultiScreenPolicy(true);
        promise.then(() => {
          console.info(msgStr + 'Succeeded  setFollowParentMultiScreenPolicy.');
          expect(true).assertFail();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + `Failed to setFollowParentMultiScreenPolicy . Cause code: ${err.code}, message: ${err.message}`);
          await windowClass.destroyWindow();
          if (err.code == 801) {
            done()
          } else {
            expect(err.code).assertEqual(1300004);
            done()
          }
        });
      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        await windowClass.destroyWindow();
        expect(true).assertFail();
        done()

      }

    })

    /**
     * @tc.name   test_subWindow_setFollowParentMultiScreenPolicy_true
     * @tc.number SUB_BASIC_WMS_SetFollowParentMultiScreenPolicy_0500
     * @tc.desc   test_subWindow_setFollowParentMultiScreenPolicy_true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_subWindow_setFollowParentMultiScreenPolicy_true', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "test_subWindow_setFollowParentMultiScreenPolicy_true";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWindow = await windowStage.createSubWindow('test_subWindow_setFollowParentMultiScreenPolicy_true');
      await subWindow.setUIContent('testability/pages/First/index2');
      await subWindow.showWindow();
      try {
        let promise = subWindow.setFollowParentMultiScreenPolicy(true);
        promise.then(async () => {
          console.info(msgStr + 'Succeeded  setFollowParentMultiScreenPolicy.');
          await subWindow.destroyWindow();
          
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + `Failed to setFollowParentMultiScreenPolicy . Cause code: ${err.code}, message: ${err.message}`);
          await subWindow.destroyWindow();
          if (err.code == 801) {
            done()
          } else {
            expect(true).assertFail();
            done()
          }

        });
      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        await subWindow.destroyWindow();
        expect(true).assertFail();
        done()

      }

    })
    /**
     * @tc.name   test_subWindow_setFollowParentMultiScreenPolicy_false
     * @tc.number SUB_BASIC_WMS_SetFollowParentMultiScreenPolicy_0600
     * @tc.desc   test_subWindow_setFollowParentMultiScreenPolicy_false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_subWindow_setFollowParentMultiScreenPolicy_false', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "test_subWindow_setFollowParentMultiScreenPolicy_false";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWindow = await windowStage.createSubWindow('test_subWindow_setFollowParentMultiScreenPolicy_false');
      await subWindow.setUIContent('testability/pages/First/index2');
      await subWindow.showWindow();
      try {
        let promise = subWindow.setFollowParentMultiScreenPolicy(false);
        promise.then(async () => {
          console.info(msgStr + 'Succeeded  setFollowParentMultiScreenPolicy.');
          await subWindow.destroyWindow();
          
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + `Failed to setFollowParentMultiScreenPolicy . Cause code: ${err.code}, message: ${err.message}`);
          await subWindow.destroyWindow();
          if (err.code == 801) {
            done()
          } else {
            expect(true).assertFail();
            done()
          }
        });
      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        await subWindow.destroyWindow();
        expect(true).assertFail();
        done()

      }

    })

    /**
     * @tc.name   test_moveWindowToGlobal_moveConfiguration
     * @tc.number SUB_BASIC_WMS_MOVE_GLOBAL_0100
     * @tc.desc   验证moveWindowToGlobal参数MoveConfiguration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_moveWindowToGlobal_moveConfiguration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_moveWindowToGlobal_moveConfiguration!'
      let options: window.SubWindowOptions = {
        title: message,
        decorEnabled: true,
      };
      try {
        let promise = context.windowStage.createSubWindowWithOptions(message, options)
        promise.then(async (data) => {
          let subWindowClass = data;
          await subWindowClass.setUIContent('testability/pages/WindowTest/StartMoving');
          await subWindowClass.showWindow();
          let displayId = subWindowClass.getWindowProperties().displayId;
          let moveConfiguration: window.MoveConfiguration = {
            displayId: displayId
          }
          let promise = subWindowClass.moveWindowToGlobal(300, 300, moveConfiguration);
          promise.then(async () => {
            console.info(`${message} succeed in moveWindowToGlobal`);
          }).catch((err: BusinessError) => {
            console.error(`${message} promise Failed to moveWindowToGlobal, Cause code ${err.code}, message ${err.message} `);
            expect(err.code).assertEqual(801);
            done();
          });
          await sleep(1000);
          let rect = subWindowClass.getWindowProperties().windowRect;
          console.info(`${message} after moving windowRect:${JSON.stringify(rect)}`);
          expect(rect.left).assertEqual(300);
          expect(rect.top).assertEqual(300);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to test MoveConfiguration, Cause code ${err.code}, message ${err.message} `);
          if (err.code == 1300002 || err.code == 801) {
            done();
          } else {
            expect().assertFail();
            done();
          }
          
        });
      } catch (err) {
        console.log(`${message} Failed to test MoveConfiguration.errcode:${err.code}, Cause:${JSON.stringify(err.message)}`)
        expect().assertFail();
        done();
      }

    });

    /**
     * @tc.name   testRectChangeOptions_off
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0040
     * @tc.desc   Test the function value of testRectChangeOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testRectChangeOptions_off", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msgStr = "testRectChangeOptions_off";
      console.log(msgStr + "begin");
      try {
        let windowClass = await windowStage.getMainWindow();
        let rect: window.Rect = {
          left: 10,
          top: 10,
          width: 10,
          height: 10
        };
        let reason: window.RectChangeReason;
        windowClass.off('windowRectChange');
        console.log(msgStr + 'Succeeded window rect changes');
        
        done();
      } catch (error) {
        if (error.code === 801) {
          console.info(`${msgStr} The current device type does not support to windowRectChange`);
          done();
        } else {
          console.log(msgStr + 'Failed to window rect changes.Data: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testRectChangeReason_enum
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0050
     * @tc.desc   Test the function value of RectChangeReason
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testRectChangeReason_enum", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msgStr = "testRectChangeReason_enum";
      console.log(msgStr + "begin");
      try {
        expect(0).assertEqual(window.RectChangeReason.UNDEFINED);
        console.log(`window.RectChangeReason.UNDEFINED: ${window.RectChangeReason.UNDEFINED}`);
        expect(1).assertEqual(window.RectChangeReason.MAXIMIZE);
        console.log(`window.RectChangeReason.MAXIMIZE: ${window.RectChangeReason.MAXIMIZE}`);
        expect(2).assertEqual(window.RectChangeReason.RECOVER);
        console.log(`window.RectChangeReason.RECOVER: ${window.RectChangeReason.RECOVER}`);
        expect(3).assertEqual(window.RectChangeReason.MOVE);
        console.log(`window.RectChangeReason.MOVE: ${window.RectChangeReason.MOVE}`);
        expect(4).assertEqual(window.RectChangeReason.DRAG);
        console.log(`window.RectChangeReason.DRAG: ${window.RectChangeReason.DRAG}`);
        expect(5).assertEqual(window.RectChangeReason.DRAG_START);
        console.log(`window.RectChangeReason.DRAG_START: ${window.RectChangeReason.DRAG_START}`);
        expect(6).assertEqual(window.RectChangeReason.DRAG_END);
        console.log(`window.RectChangeReason.DRAG_END: ${window.RectChangeReason.DRAG_END}`);
        done();
      } catch (error) {
        console.log(msgStr + 'Failed to testRectChangeReason_enum' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testRectChangeOptions_on_resize
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0600
     * @tc.desc   Test the function value of testRectChangeOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testRectChangeOptions_on_resize", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let msgStr = "testRectChangeOptions_on_resize";
      console.log(msgStr + "begin");
      try {
        let windowClass = await windowStage.getMainWindow();
        let rect: window.Rect = {
          left: 10,
          top: 10,
          width: 10,
          height: 10
        };
        let reason: window.RectChangeReason;
        windowClass.on('windowRectChange', (data: window.RectChangeOptions) => {
          console.log(msgStr + 'Succeeded window rect changes. Data: ' + JSON.stringify(data));
          
          done();
        });
        await windowClass.resize(1000, 1000).then(async () => {
          console.info(msgStr + 'Succeeded in changing the window size.');
          await sleep(500);
          windowClass.off('windowRectChange');
          
          done();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to change the window size. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 1300002) {
            console.info(msgStr + 'This window state is abnormal.');
            windowClass.off('windowRectChange');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        if (error.code === 801) {
          console.info(`${msgStr} The current device type does not support to windowRectChange`);
          done();
        } else {
          console.log(msgStr + 'Failed to window rect changes.Data: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   testRectChangeOptions_on_moveWindowTo
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0700
     * @tc.desc   Test the function value of testRectChangeOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRectChangeOptions_on_moveWindowTo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let msgStr = "testRectChangeOptions_on_moveWindowTo";
      console.log(msgStr + "begin");
      try {
        let windowClass = await windowStage.getMainWindow();
        let rect: window.Rect = {
          left: 10,
          top: 10,
          width: 10,
          height: 10
        };
        let reason: window.RectChangeReason;
        windowClass.on('windowRectChange', (data: window.RectChangeOptions) => {
          console.log(msgStr + 'Succeeded window rect changes. Data: ' + JSON.stringify(data));
          windowClass.off('windowRectChange');
          
          done();
        });
        await windowClass.moveWindowTo(500, 500).then(async () => {
          console.info(msgStr + 'Succeeded in moving the window.');
          await sleep(1000);
          
          done();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to move the window. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 1300002) {
            console.info(msgStr + 'This window state is abnormal..');
            windowClass.off('windowRectChange');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        if (error.code === 801) {
          console.info(`${msgStr} The current device type does not support to windowRectChange`);
          done();
        } else {
          console.log(msgStr + 'Failed to window rect changes.Data: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   testRectChangeOptions_on_TwoCallback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0800
     * @tc.desc   Test the function value of testRectChangeOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testRectChangeOptions_on_TwoCallback", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let msgStr = "testRectChangeOptions_on_TwoCallback";
      console.log(msgStr + "begin");
      let windowClass = await windowStage.getMainWindow();
      let num = 0;
      const callback1 = () => {
        num++;
        console.info(msgStr + 'callback1 is called,num = ' + num);
        windowClass.off('windowRectChange', callback1);
      };
      const callback2 = () => {
        num++;
        console.info(msgStr + 'callback2 is called,num = ' + num);
        windowClass.off('windowRectChange', callback2);
      };
      try {
        let rect: window.Rect = {
          left: 10,
          top: 10,
          width: 10,
          height: 10
        };
        let reason: window.RectChangeReason;
        windowClass.on('windowRectChange', callback1);
        windowClass.on('windowRectChange', callback2);
        await windowClass.resize(800, 1000).then(async () => {
          console.info(msgStr + 'Succeeded in changing the window size.');
          await sleep(500);
          expect(num).assertEqual(2);
          windowClass.off('windowRectChange');
          done();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to change the window size. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 1300002) {
            console.info(msgStr + 'This window state is abnormal.');
            windowClass.off('windowRectChange');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        if (error.code === 801) {
          console.info(`${msgStr} The current device type does not support to windowRectChange`);
          done();
        } else {
          console.log(msgStr + 'Failed to window rect changes.Data: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   testRectChangeOptions_off_callback1
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0900
     * @tc.desc   Test the function value of testRectChangeOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testRectChangeOptions_off_callback1", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let msgStr = "testRectChangeOptions_off_callback1";
      console.log(msgStr + "begin");
      let windowClass = await windowStage.getMainWindow();
      let num = 0;
      const callback1 = () => {
        num++;
        console.info(msgStr + 'callback1 is called,num = ' + num);
        windowClass.off('windowRectChange', callback1);
      };
      const callback2 = () => {
        num--;
        console.info(msgStr + 'callback2 is called,num = ' + num);
        windowClass.off('windowRectChange', callback2);
      };
      try {
        let rect: window.Rect = {
          left: 10,
          top: 10,
          width: 10,
          height: 10
        };
        let reason: window.RectChangeReason;
        windowClass.on('windowRectChange', callback1);
        windowClass.on('windowRectChange', callback2);
        windowClass.off('windowRectChange', callback1);
        await windowClass.resize(1100, 1000).then(async () => {
          console.info(msgStr + 'Succeeded in changing the window size.');
          await sleep(500);
          expect(num).assertEqual(-1);
          windowClass.off('windowRectChange');
          done();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to change the window size. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 1300002) {
            console.info(msgStr + 'This window state is abnormal.');
            windowClass.off('windowRectChange');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        if (error.code === 801) {
          console.info(`${msgStr} The current device type does not support to windowRectChange`);
          done();
        } else {
          console.log(msgStr + 'Failed to window rect changes.Data: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   testRectChangeOptions_off_all_callback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_1000
     * @tc.desc   Test the function value of testRectChangeOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testRectChangeOptions_off_all_callback", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let msgStr = "testRectChangeOptions_off_all_callback";
      console.log(msgStr + "begin");
      let windowClass = await windowStage.getMainWindow();
      let num = 0;
      const callback1 = () => {
        num++;
        console.info(msgStr + 'callback1 is called,num = ' + num);
        windowClass.off('windowRectChange', callback1);
      };
      const callback2 = () => {
        num++;
        console.info(msgStr + 'callback2 is called,num = ' + num);
        windowClass.off('windowRectChange', callback2);
      };
      try {
        let rect: window.Rect = {
          left: 10,
          top: 10,
          width: 10,
          height: 10
        };
        let reason: window.RectChangeReason;
        windowClass.on('windowRectChange', callback1);
        windowClass.on('windowRectChange', callback2);
        windowClass.off('windowRectChange');
        await windowClass.resize(1200, 1000).then(async () => {
          console.info(msgStr + 'Succeeded in changing the window size.');
          await sleep(500);
          expect(num).assertEqual(0);
          windowClass.off('windowRectChange');
          done();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to change the window size. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 1300002) {
            console.info(msgStr + 'This window state is abnormal.');
            windowClass.off('windowRectChange');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        if (error.code === 801) {
          console.info(`${msgStr} The current device type does not support to windowRectChange`);
          done();
        } else {
          console.log(msgStr + 'Failed to window rect changes.Data: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })


    /**
     * @tc.name   test_on_windowRectChange
     * @tc.number test_on_windowRectChange
     * @tc.desc   test_on_windowRectChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_on_windowRectChange", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msgStr = "test_on_windowRectChange";
      console.log(msgStr + "begin");
      let windowClass = await windowStage.getMainWindow();
      try {
        windowClass.on('windowRectChange', (data: window.RectChangeOptions) => {
          console.info(msgStr + 'Succeeded window rect changes. Data: ' + JSON.stringify(data));
          console.info(msgStr + 'Succeeded window rect changes. reason: ' + JSON.stringify(data.reason));
        });
        windowClass.off('windowRectChange');
        console.log(msgStr + 'Succeeded to off the windowRectChange');
        
        done();
      } catch (error) {
        if (error.code === 801) {
          console.info(`${msgStr} The current device type does not support to windowRectChange`);
          done();
        } else {
          console.log(msgStr + 'Failed to window rect changes.Data: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })


    /**
     * @tc.name   test_mainWindow_setWindowMask
     * @tc.number test_mainWindow_setWindowMask
     * @tc.desc   test_mainWindow_setWindowMask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_mainWindow_setWindowMask", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let msgStr = "test_mainWindow_setWindowMask";
      console.log(msgStr + "begin");
      let windowMask: Array<Array<number>> = new Array < Array < number >> ();
      for (let i = 0; i < 500; i++) {
        let arr: Array<number> = new Array < number > (500);
        for (let j = 0; j < 500; j++) {
          if (i + j < 500) {
            arr[j] = 0;
          } else {
            arr[j] = 1;
          }
        }
        windowMask.push(arr);
      }
      console.log(msgStr + " windowMask OK ");
      let windowClass = await windowStage.getMainWindow();
      try {
        let promise = windowClass.setWindowMask(windowMask);
        promise.then(() => {
          console.log(msgStr + 'Succeeded in setting the window mask.');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`Failed to set the window mask. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(1300004);
          done();
        });
      } catch (error) {
        console.log(msgStr + 'Failed to setWindowMask' + JSON.stringify(error.code) + error.message);
        if (error.code == 801) {
          console.log(msgStr + '此设备不支持 setWindowMask');
          
          done();
        } else {
          console.log(msgStr + 'Failed to setWindowMask');
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.name   test_SetFollowParentWindowLayoutEnabled_401
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SetFollowParentWindowLayoutEnabled_0100
     * @tc.desc   test_SetFollowParentWindowLayoutEnabled_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_SetFollowParentWindowLayoutEnabled_401", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let msgStr = "test_SetFollowParentWindowLayoutEnabled_401";
      console.log(msgStr + "begin");
      let subWindowClass: window.Window;
      try {
        let promise = windowStage.createSubWindow('test_SetFollowParentWindowLayoutEnabled_401');
        promise.then(async (data) => {
          subWindowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          let promise2 = subWindowClass.setFollowParentWindowLayoutEnabled(null);
          promise2.then(async () => {
            console.info(msgStr + 'Succeeded in setFollowParentWindowLayoutEnabled ');
            expect(false).assertTrue();
            done();
          }).catch((err: BusinessError) => {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            console.log(msgStr + 'Failed to createSubWindow');
            expect(false).assertTrue();
            done();

          });
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          await subWindowClass.destroyWindow();
          if (err.code == 801) {
            console.log(msgStr + '此设备不支持');
            done();
          } else if (err.code == 401) {
            
            done();
          } else {
            console.log(msgStr + 'Failed to setWindowMask');
            expect(false).assertTrue();
            done();
          }

        });
      } catch (error) {
        console.log(msgStr + 'Failed . Cause code:' + JSON.stringify(error.code) + error.message);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   test_SetFollowParentWindowLayoutEnabled_1300002
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SetFollowParentWindowLayoutEnabled_0200
     * @tc.desc   test_SetFollowParentWindowLayoutEnabled_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_SetFollowParentWindowLayoutEnabled_1300002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let msgStr = "test_SetFollowParentWindowLayoutEnabled_1300002";
      console.log(msgStr + "begin");
      let subWindowClass: window.Window;
      try {
        let promise = windowStage.createSubWindow('test_SetFollowParentWindowLayoutEnabled_1300002');
        promise.then(async (data) => {
          subWindowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          await subWindowClass.destroyWindow();
          let promise2 = subWindowClass.setFollowParentWindowLayoutEnabled(true);
          promise2.then(async () => {
            console.info(msgStr + 'Succeeded in setFollowParentWindowLayoutEnabled ');
            expect(false).assertTrue();
            done();
          }).catch((err: BusinessError) => {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(1300002);
            done();

          });
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          await subWindowClass.destroyWindow();
          if (err.code == 801) {
            console.log(msgStr + '此设备不支持');
            done();
          } else {
            console.log(msgStr + 'Failed to setWindowMask');
            expect(false).assertTrue();
            done();
          }

        });
      } catch (error) {
        console.log(msgStr + 'Failed. Cause code:' + JSON.stringify(error.code) + error.message);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   test_SetFollowParentWindowLayoutEnabled_1300004
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SetFollowParentWindowLayoutEnabled_0300
     * @tc.desc   test_SetFollowParentWindowLayoutEnabled_1300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_SetFollowParentWindowLayoutEnabled_1300004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let msgStr = "test_SetFollowParentWindowLayoutEnabled_1300004";
      console.log(msgStr + "begin");
      let windowClass = await windowStage.getMainWindow();
      try {
        let promise2 = windowClass.setFollowParentWindowLayoutEnabled(true);
        promise2.then(async () => {
          console.info(msgStr + 'Succeeded in setFollowParentWindowLayoutEnabled ');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(1300004);
          done();

        });
      } catch (error) {
        console.error(msgStr + `Failed to create the subwindow. Cause code: ${error.code}, message: ${error.message}`);
        if (error.code == 801) {
          console.log(msgStr + '此设备不支持');
          done();
        } else {
          console.log(msgStr + 'Failed to setWindowMask');
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.name   test_SetFollowParentWindowLayoutEnabled_true
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SetFollowParentWindowLayoutEnabled_0400
     * @tc.desc   test_SetFollowParentWindowLayoutEnabled_true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_SetFollowParentWindowLayoutEnabled_true", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let msgStr = "test_SetFollowParentWindowLayoutEnabled_true";
      console.log(msgStr + "begin");
      let subWindowClass: window.Window;
      let mainWindow = windowStage.getMainWindowSync();
      let mainWindowProwindowRect = mainWindow.getWindowProperties().windowRect;
      console.info(msgStr + 'Succeeded in get mainWindow windowRect. Data: ' + JSON.stringify(mainWindowProwindowRect));
      try {
        let promise = windowStage.createSubWindow('test_SetFollowParentWindowLayoutEnabled_true');
        promise.then(async (data) => {
          subWindowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          await subWindowClass.setUIContent('testability/pages/First/index1');
          await sleep(300);
          await subWindowClass.showWindow();
          let minWidth = Number(subWindowClass.getWindowLimits().minWidth);
          let minHeight = Number(subWindowClass.getWindowLimits().minHeight);
          console.log('Window WindowLimits:' + minWidth + ' ' + minHeight);
          await subWindowClass.resizeAsync(minWidth, minHeight);
          await sleep(300);
          subWindowClass.on('windowSizeChange', async (data) => {
            console.info('Succeeded in enabling the listener for window size changes. Data: ' + JSON.stringify(data));
            let subWindowRect = data;
            expect(Math.abs(subWindowRect.width - mainWindowProwindowRect.width)).assertLessOrEqual(1);
            expect(Math.abs(subWindowRect.height - mainWindowProwindowRect.height)).assertLessOrEqual(1);
            await subWindowClass.destroyWindow();
            done();
          });
          let promise2 = subWindowClass.setFollowParentWindowLayoutEnabled(true);
          promise2.then(async () => {
            console.info(msgStr + 'Succeeded in setFollowParentWindowLayoutEnabled ');
          }).catch(async (err: BusinessError) => {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            await subWindowClass.destroyWindow();
            if (err.code == 801) {
              console.log(msgStr + '此设备不支持');
              done();
            } else {
              console.log(msgStr + 'Failed to setWindowMask');
              expect(false).assertTrue();
              done();
            }

          });
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          await subWindowClass.destroyWindow();
          if (err.code == 801) {
            console.log(msgStr + '此设备不支持');
            done();
          } else {
            console.log(msgStr + 'Failed to getWindowLimits');
            expect(false).assertTrue();
            done();
          }

        });
      } catch (error) {
        console.log(msgStr + 'Failed. Cause code:' + JSON.stringify(error.code) + error.message);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   test_SetFollowParentWindowLayoutEnabled_false
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SetFollowParentWindowLayoutEnabled_0500
     * @tc.desc   test_SetFollowParentWindowLayoutEnabled_false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_SetFollowParentWindowLayoutEnabled_false", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let msgStr = "test_SetFollowParentWindowLayoutEnabled_false";
      console.log(msgStr + "begin");
      let subWindowClass: window.Window;
      try {
        let promise = windowStage.createSubWindow('test_SetFollowParentWindowLayoutEnabled_false');
        promise.then(async (data) => {
          subWindowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          await subWindowClass.setUIContent('testability/pages/First/index1');
          await subWindowClass.showWindow();
          await sleep(300);
          let minWidth = Number(subWindowClass.getWindowLimits().minWidth);
          let minHeight = Number(subWindowClass.getWindowLimits().minHeight);
          console.log('Window WindowLimits:' + minWidth + ' ' + minHeight);
          subWindowClass.resizeAsync(minWidth, minHeight);
          await sleep(100);
          let subWindowRect1 = subWindowClass.getWindowProperties().windowRect;
          console.info(msgStr + 'Succeeded in get  subWindowRect1. Data: ' + JSON.stringify(subWindowRect1));
          let promise2 = subWindowClass.setFollowParentWindowLayoutEnabled(false);
          promise2.then(async () => {
            console.info(msgStr + 'Succeeded in setFollowParentWindowLayoutEnabled ');
            let subWindowRect2 = subWindowClass.getWindowProperties().windowRect;
            console.info(msgStr + 'Succeeded in get  subWindowRect2. Data: ' + JSON.stringify(subWindowRect2));
            expect(Math.abs(subWindowRect1.width - subWindowRect2.width)).assertLessOrEqual(1);
            expect(Math.abs(subWindowRect1.height - subWindowRect2.height)).assertLessOrEqual(1);
            expect(Math.abs(subWindowRect1.left - subWindowRect2.left)).assertLessOrEqual(1);
            expect(Math.abs(subWindowRect1.top - subWindowRect2.top)).assertLessOrEqual(1);
            await subWindowClass.destroyWindow();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            await subWindowClass.destroyWindow();
            if (err.code == 801) {
              console.log(msgStr + '此设备不支持');
              done();
            } else {
              console.log(msgStr + 'Failed to setWindowMask');
              expect(false).assertTrue();
              done();
            }

          });
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          await subWindowClass.destroyWindow();
          if (err.code == 801) {
            console.log(msgStr + '此设备不支持');
            done();
          } else {
            console.log(msgStr + 'Failed to getWindowLimits');
            expect(false).assertTrue();
            done();
          }

        });
      } catch (error) {
        console.log(msgStr + 'Failed. Cause code:' + JSON.stringify(error.code) + error.message);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   teststartMoving401
     * @tc.number SUB_BASIC_WMS_startMoving_401_0100
     * @tc.desc   teststartMoving401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('teststartMoving401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "teststartMoving401";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync();
      try {
        let promise = windowClass.startMoving(null, null);
        promise.then(() => {
          console.info('Succeeded startMoving.');
          expect(false).assertFail();
          done()
        }).catch((err: BusinessError) => {
          console.error(`Failed to startMoving. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertFail();
          done()
        });

      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        expect(e.code).assertEqual(401);
        done()
      }

    })
    /**
     * @tc.name   teststopMoving1300002
     * @tc.number SUB_BASIC_WMS_stopMoving_1300002_0100
     * @tc.desc   teststopMoving1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('teststopMoving1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "teststopMoving1300002";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        let windowClass = await windowStage.createSubWindow('teststopMoving1300002');
        await windowClass.destroyWindow();
        windowClass.stopMoving().then(() => {
          console.info(msgStr + 'Succeeded in stopping moving window.')
          expect(false).assertFail();
          done();
        }).catch((e: BusinessError) => {
          console.error(msgStr + `Failed to stop moving. Cause code: ${e.code}, message: ${e.message}`);
          if (e.code == 801) {
            done();
          } else {
            expect(e.code).assertEqual(1300002);
            done()
          }
        });
      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        if (e.code == 801) {
          done();
        } else {
          expect(e.code).assertEqual(1300002);
          done()
        }
      }

    })
    /**
     * @tc.name   testmoveWindowToAsync_3_parameters
     * @tc.number SUB_BASIC_WMS_moveWindowToAsync_3_parameters_0100
     * @tc.desc   testmoveWindowToAsync_3_parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testmoveWindowToAsync_3_parameters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testmoveWindowToAsync_3_parameters";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let mainWindow = windowStage.getMainWindowSync();
      let displayId = mainWindow.getWindowProperties().displayId;
      console.info(msgStr + 'windowId :' + displayId)
      let moveConfiguration: window.MoveConfiguration = {
        displayId: displayId
      };
      let subWindow = await windowStage.createSubWindow('testmoveWindowToAsync_3_parameters');
      await subWindow.loadContentByName(LoadContentByName.entryName);
      await subWindow.showWindow();
      try {
        let promise = subWindow.moveWindowToAsync(300, 300, moveConfiguration);
        promise.then(async () => {
          console.info(msgStr + 'Succeeded in moving the window.');
          let rect = subWindow.getWindowProperties().windowRect;
          console.info(msgStr + `Get window rect: ` + JSON.stringify(rect));
          
          await subWindow.destroyWindow();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + `Failed to move the window. Cause code: ${err.code}, message: ${err.message}`);
          await subWindow.destroyWindow();
          if (err.code == 801) {
            console.error(`${caseName}  Capability not supported. Failed to call the API due to limited device capabilities`);
            expect(false).assertFalse();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        console.error(msgStr + `Failed. Cause code: ${exception.code}, message: ${exception.message}`);
        await subWindow.destroyWindow();
        expect(false).assertFail();
        done();
      }

    })

    /**
     * @tc.name   testWindowEnableDragNull
     * @tc.number SUB_BASIC_WMS_XTS_SYSTEMAPI_ENABLEDRAG_0100
     * @tc.desc   test the err.code = 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWindowEnableDragNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let windowClass: window.Window;
      let config: window.Configuration = {
        name: 'dialog',
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
        decorEnabled: true,
        title: 'dialog'
      };
      try {
        window.createWindow(config).then(async (data) => {
          windowClass = data;
          await windowClass.setUIContent("testability/pages/Index1")
          await windowClass.resize(800, 1000);
          await windowClass.moveWindowTo(300, 300);
          await windowClass.showWindow();
          await sleep(1000);
          console.info('testWindowEnableDragNull! Succeeded in creating the window. Data:' + JSON.stringify(data));
          try {
            windowClass.enableDrag(null).then(async () => {
              console.info('testWindowEnableDragNull! Succeed in setting window draggable')
              expect().assertFail();
              await windowClass?.destroyWindow();
              done();
            }).catch(async (err: BusinessError) => {
              console.error(`testWindowEnableDragNull! Failed to set window draggable. Cause code: ${err.code}, message: ${err.message}`);
              expect(err.code).assertEqual(801);
              await windowClass?.destroyWindow();
              done();
            })
          } catch (exception) {
            console.error(`testWindowEnableDragNull! Failed to set window draggable. Cause code: ${exception.code}, message: ${exception.message}`);
            expect(exception.code).assertEqual(401);
            await windowClass?.destroyWindow();
            done();
          }
        }).catch(async (err: BusinessError) => {
          console.error(`testWindowEnableDragNull! Failed to create the window. Cause code: ${err.code}, message: ${err.message}`);
          await windowClass?.destroyWindow();
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(`testWindowEnableDragNull! Failed to create the window. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.name   testWindowEnableDragDestroy
     * @tc.number SUB_BASIC_WMS_XTS_SYSTEMAPI_ENABLEDRAG_0200
     * @tc.desc   test the err.code = 1300002 when window destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowEnableDragDestroy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let windowClass: window.Window;
      let caseName = 'testWindowEnableDragDestroy!'
      let config: window.Configuration = {
        name: 'dialog',
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
        decorEnabled: true,
        title: 'dialog'
      };
      try {
        window.createWindow(config).then(async (data) => {
          windowClass = data;
          await windowClass.setUIContent("testability/pages/Index1");
          await windowClass.resize(800, 1000);
          await windowClass.moveWindowTo(300, 300);
          await windowClass.showWindow();
          await sleep(1000);
          console.info(caseName + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
          await windowClass.destroyWindow()
          await sleep(1000);
          try {
            windowClass.enableDrag(true).then(() => {
              console.info(caseName + 'Succeed in setting window draggable')
              expect().assertFail();
              done();
            }).catch((err: BusinessError) => {
              console.error(caseName + `Failed to set window draggable. Cause code: ${err.code}, message: ${err.message}`);
              console.error(caseName + `err.code == 1300002 || err.code == 801: ${err.code == 1300002 || err.code == 801}`);
              expect(err.code == 1300002 || err.code == 801).assertTrue();
              done();
            })
          } catch (exception) {
            console.error(caseName + `Failed to set window draggable. Cause code: ${exception.code}, message: ${exception.message}`);
            expect().assertFail();
            done();
          }

        }).catch((err: BusinessError) => {
          console.error(caseName + `promise Failed to create the window. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(caseName + `Failed to create the window. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testWindowEnableDragTrueSubWindow
     * @tc.number SUB_BASIC_WMS_XTS_SYSTEMAPI_ENABLEDRAG_0300
     * @tc.desc   testWindowEnableDragTrueSubWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWindowEnableDragTrueSubWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let windowClass: window.Window;
        let caseName = 'testWindowEnableDragTrueSubWindow!'
        try {
          windowStage.createSubWindow('test').then(async (data) => {
            windowClass = data;
            await windowClass.setUIContent("testability/pages/Index1");
            await windowClass.resize(800, 1000);
            await windowClass.moveWindowTo(300, 300);
            windowClass.setWindowBackgroundColor('#00ff33')
            await windowClass.showWindow();
            await sleep(1000);
            console.info(caseName + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
            try {
              windowClass.enableDrag(true).then(async () => {
                console.info(caseName + 'Succeed in setting window draggable')
                let windowRect = windowClass.getWindowProperties().windowRect;
                console.log(caseName + `windowRect:${JSON.stringify(windowRect)}`)
                let pointWidth = windowRect.left;
                let pointHeight = windowRect.top + windowRect.height / 2;
                console.log(caseName +
                  `pointWidth:${JSON.stringify(pointWidth)}, pointHeight: ${JSON.stringify(pointHeight)}`)
                await driver.mouseDrag({ x: pointWidth, y: pointHeight }, { x: pointWidth + 50, y: pointHeight }, 200);
                await sleep(300);
                let windowRect2 = windowClass.getWindowProperties().windowRect;
                console.log(caseName + `windowRect2:${JSON.stringify(windowRect2)}`);
                expect(windowRect2.width).assertEqual(windowRect.width - 50);
                await windowClass?.destroyWindow();
                done();
              }).catch(async (err: BusinessError) => {
                console.info(caseName + 'the context..' + windowClass)
                console.error(caseName + `Failed to set window draggable. Cause code: ${err.code}, message: ${err.message}`);
                await windowClass?.destroyWindow();
                expect(err.code).assertEqual(801);
                done();
              })
            } catch (exception) {
              console.error(caseName + `Failed to set window draggable. Cause code: ${exception.code}, message: ${exception.message}`);
              expect().assertFail();
              done();
            }

          }).catch(async (err: BusinessError) => {
            console.error(caseName + `Failed to create the window. Cause code: ${err.code}, message: ${err.message}`);
            await windowClass?.destroyWindow();
            expect().assertFail();
            done();
          });
        } catch (exception) {
          console.error(caseName + `Failed to create the window. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
          done();
        }

      })

    /**
     * @tc.name   testWindowEnableDragFalseSubWindow
     * @tc.number SUB_BASIC_WMS_XTS_SYSTEMAPI_ENABLEDRAG_0400
     * @tc.desc   testWindowEnableDragFalseSubWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWindowEnableDragFalseSubWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let windowClass: window.Window;
        let caseName = 'testWindowEnableDragFalseSubWindow!'
        try {
          windowStage.createSubWindow('test').then(async (data) => {
            windowClass = data;
            await windowClass.setUIContent("testability/pages/Index1");
            await windowClass.resize(800, 1000);
            await windowClass.moveWindowTo(300, 300);
            windowClass.setWindowBackgroundColor('#00ff33')
            await windowClass.showWindow();
            await sleep(500);
            console.info(caseName + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
            try {
              windowClass.enableDrag(false).then(async () => {
                console.info(caseName + 'Succeed in setting window draggable')
                let windowRect = windowClass.getWindowProperties().windowRect;
                console.log(caseName + `windowRect:${JSON.stringify(windowRect)}`)
                let pointWidth = windowRect.left;
                let pointHeight = windowRect.top + windowRect.height / 2;
                console.log(caseName + `pointWidth:${JSON.stringify(pointWidth)}, pointHeight: ${JSON.stringify(pointHeight)}`)
                await driver.mouseDrag({ x: pointWidth, y: pointHeight }, { x: pointWidth + 50, y: pointHeight }, 200);
                await sleep(300);
                let windowRect2 = windowClass.getWindowProperties().windowRect;
                console.log(caseName + `windowRect2:${JSON.stringify(windowRect2)}`);
                expect(windowRect2.width).assertEqual(windowRect.width);
                await windowClass?.destroyWindow();
                done();
              }).catch(async (err: BusinessError) => {
                console.info(caseName + 'the context..' + windowClass)
                console.error(caseName + `Failed to set window draggable. Cause code: ${err.code}, message: ${err.message}`);
                await windowClass?.destroyWindow();
                expect(err.code).assertEqual(801);
                done();
              })
            } catch (exception) {
              console.error(caseName + `Failed to set window draggable. Cause code: ${exception.code}, message: ${exception.message}`);
              expect().assertFail();
              done();
            }

          }).catch(async (err: BusinessError) => {
            console.error(caseName + `Failed to create the window. Cause code: ${err.code}, message: ${err.message}`);
            await windowClass?.destroyWindow();
            expect().assertFail();
            done();
          });
        } catch (exception) {
          console.error(caseName + `Failed to create the window. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
          done();
        }

      })

    /**
     * @tc.name   testWindowEnableDragTrueDialogWindow
     * @tc.number SUB_BASIC_WMS_XTS_SYSTEMAPI_ENABLEDRAG_0500
     * @tc.desc   testWindowEnableDragTrueDialogWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWindowEnableDragTrueDialogWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let windowClass: window.Window;
        let caseName = 'testWindowEnableDragTrueDialogWindow!'
        let config: window.Configuration = {
          name: 'testWindowEnableDragTrueDialogWindow',
          windowType: window.WindowType.TYPE_DIALOG,
          ctx: context
        };
        try {
          window.createWindow(config).then(async (data) => {
            windowClass = data;
            console.info(caseName + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
            await windowClass.setUIContent('testability/pages/Index1')
            console.info(caseName + 'Succeeded in loadContent. Data:' + JSON.stringify(data));
            await windowClass.resize(800, 1000);
            await windowClass.moveWindowTo(300, 300);
            windowClass.setWindowBackgroundColor('#00ff33');
            await windowClass.showWindow();
            await sleep(1000);
            try {
              windowClass.enableDrag(true).then(async () => {
                console.info(caseName + 'Succeed in setting window draggable')
                let windowRect = windowClass.getWindowProperties().windowRect;
                console.log(caseName + `windowRect:${JSON.stringify(windowRect)}`)
                let pointWidth = windowRect.left;
                let pointHeight = windowRect.top + windowRect.height / 2;
                console.log(caseName + `pointWidth:${JSON.stringify(pointWidth)}, pointHeight: ${JSON.stringify(pointHeight)}`)
                await driver.mouseDrag({ x: pointWidth, y: pointHeight }, { x: pointWidth - 50, y: pointHeight }, 200);
                await sleep(300);
                let windowRect2 = windowClass.getWindowProperties().windowRect;
                console.log(caseName + `windowRect2:${JSON.stringify(windowRect2)}`);
                expect(windowRect2.width).assertEqual(windowRect.width + 50);
                await windowClass?.destroyWindow();
                done();
              }).catch(async (err: BusinessError) => {
                console.error(caseName + `Failed to set window draggable. Cause code: ${err.code}, message: ${err.message}`);
                await windowClass?.destroyWindow();
                expect(err.code).assertEqual(801);
                done();
              })
            } catch (exception) {
              console.error(caseName + `Failed to set window draggable. Cause code: ${exception.code}, message: ${exception.message}`);
              expect().assertFail();
              done();
            }
          }).catch(async (err: BusinessError) => {
            console.error(caseName + `Failed to create the window. Cause code: ${err.code}, message: ${err.message}`);
            await windowClass?.destroyWindow();
            expect().assertFail();
            done();
          });
        } catch (exception) {
          console.error(caseName + `Failed to create the window. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testWindowEnableDragFalseDialogWindow
     * @tc.number SUB_BASIC_WMS_XTS_SYSTEMAPI_ENABLEDRAG_0600
     * @tc.desc   testWindowEnableDragFalseDialogWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWindowEnableDragFalseDialogWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let windowClass: window.Window;
        let caseName = 'testWindowEnableDragFalseDialogWindow!'
        let config: window.Configuration = {
          name: 'testWindowEnableDragFalseDialogWindow',
          windowType: window.WindowType.TYPE_DIALOG,
          ctx: context
        };
        try {
          window.createWindow(config).then(async (data) => {
            windowClass = data;
            await windowClass.setUIContent('testability/pages/Index1')
            await windowClass.resize(800, 1000);
            await windowClass.moveWindowTo(300, 300);
            windowClass.setWindowBackgroundColor('#00ff33');
            await windowClass.showWindow();
            await sleep(500);
            console.info(caseName + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
            try {
              windowClass.enableDrag(false).then(async () => {
                console.info(caseName + 'Succeed in setting window draggable')
                let windowRect = windowClass.getWindowProperties().windowRect;
                console.log(caseName + `windowRect:${JSON.stringify(windowRect)}`)
                let pointWidth = windowRect.left;
                let pointHeight = windowRect.top + windowRect.height / 2;
                console.log(caseName + `pointWidth:${JSON.stringify(pointWidth)}, pointHeight: ${JSON.stringify(pointHeight)}`)
                await driver.mouseDrag({ x: pointWidth, y: pointHeight }, { x: pointWidth - 50, y: pointHeight }, 200);
                await sleep(300);
                let windowRect2 = windowClass.getWindowProperties().windowRect;
                console.log(caseName + `windowRect2:${JSON.stringify(windowRect2)}`);
                expect(windowRect2.width).assertEqual(windowRect.width);
                await windowClass?.destroyWindow();
                done();
              }).catch(async (err: BusinessError) => {
                console.info(caseName + 'the context..' + windowClass)
                console.error(caseName + `Failed to set window draggable. Cause code: ${err.code}, message: ${err.message}`);
                await windowClass?.destroyWindow();
                expect(err.code).assertEqual(801);
                done();
              })
            } catch (exception) {
              console.error(caseName + `Failed to set window draggable. Cause code: ${exception.code}, message: ${exception.message}`);
              expect().assertFail();
              done();
            }

          }).catch(async (err: BusinessError) => {
            console.error(caseName + `Failed to create the window. Cause code: ${err.code}, message: ${err.message}`);
            await windowClass?.destroyWindow();
            expect().assertFail();
            done();
          });
        } catch (exception) {
          console.error(caseName + `Failed to create the window. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStartMoving_0400
     * @tc.number SUB_BASIC_WMS_STARTMOVING_0400
     * @tc.desc   验证系统窗调用startmoving移动成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testStartMoving_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testStartMoving_0400';
      console.log(caseName + 'begin.');
      let config: window.Configuration = {
        name: "testStartMoving_0400",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      };
      let windowClass = await window.createWindow(config);
      AppStorage.setOrCreate('windowClass', windowClass);
      try {
        let windowLimits = await windowClass.getWindowLimits();
        console.info(`${caseName} windowLimits = ${JSON.stringify(windowLimits)}`);
        let width = windowLimits.minWidth;
        let height = windowLimits.maxHeight;
        await windowClass.resize(width! + 100, height! + 150);
        await sleep(200);
        await windowClass.setUIContent("testability/pages/WindowTest/StartMoving7");
        await sleep(200);
        await windowClass.showWindow();
        await sleep(200);
        await windowClass.moveWindowTo(100, 100);
        await sleep(200);
        let windowPoint = await windowClass.getWindowProperties().windowRect;
        console.info(`${caseName} windowPoint = ${JSON.stringify(windowPoint)}`);
        let driver = await Driver.create();
        await sleep(1000);
        let blank = await driver.findComponent(ON.id('startMoving'))
        await sleep(1000)
        console.info(`${caseName} blank = ${JSON.stringify(blank)}`);
        let point = await blank.getBoundsCenter();
        console.info(`${caseName} point = ${JSON.stringify(point)}`);
        await driver.drag(point.x, point.y, point.x + 50, point.y + 50, 200);
        await sleep(1000);
        let text = await driver.findComponent(ON.id('startMovingText'));
        await sleep(1000)
        console.info(`${caseName} text = ${JSON.stringify(text)}`);
        let textDragged = await text.getText();
        if (textDragged == 'startMoving success') {
          let windowPointDragged = windowClass.getWindowProperties().windowRect
          console.info(`${caseName} sstartMoving success, windowPoint = ${JSON.stringify(windowPointDragged)}`)
          expect(windowPointDragged.left).assertEqual(windowPoint.left + 50)
          expect(windowPointDragged.top).assertEqual(windowPoint.top + 50)
        } else if (textDragged == 'startMoving 801') {
          console.info(`${caseName} textDragged  = ${JSON.stringify(textDragged)}`)
        } else {
          console.error(`${caseName} Error.`);
          expect(true).assertFalse()
        }
        await windowClass.destroyWindow();
        done();
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        await windowClass.destroyWindow();
        if (err.code === 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testWindowEnableDragTruewithFullScreenMainWindow
     * @tc.number SUB_BASIC_WMS_SYSTEMAPI_ENABLEDRAG_0700
     * @tc.desc   验证全屏主窗调用enabledrag抛1300004错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowEnableDragTruewithFullScreenMainWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testWindowEnableDragTruewithFullScreenMainWindow';
      console.log(caseName + 'begin.');
      try {
        let windowClass = windowStage.getMainWindowSync();
        let windowStatusType = windowClass.getWindowStatus();
        console.info(caseName + ' windowClass.getWindowStatus(). windowStatusType: ' + JSON.stringify(windowStatusType));

        await windowClass.enableDrag(true);
        await sleep(200);
        if (windowStatusType != window.WindowStatusType.FULL_SCREEN) {
          done();
        }

      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        if (err.code == 801) {
          done();
        } else {
          expect(err.code).assertEqual(1300004);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetRelativePositionToParentWindowEnabledwithDestoryedSubWindow
     * @tc.number SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_0100
     * @tc.desc   验证子窗销毁后调用接口报1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetRelativePositionToParentWindowEnabledwithDestoryedSubWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetRelativePositionToParentWindowEnabledwithDestoryedSubWindow';
      console.log(caseName + 'begin.');
      let windowClass = await windowStage.createSubWindow('testSetRelativePositionToParentWindowEnabledwithDestoryedSubWindow');
      await windowClass.destroyWindow();
      try {
        if (isFreeWindowMode == true) {
          windowClass.setRelativePositionToParentWindowEnabled(true).then(async () => {
            console.info(caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
            expect().assertFail();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(1300002);
            done();
          })
        } else {
          done();
        }
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        if (err.code == 801) {
          done();
        } else {
          expect(err.code).assertEqual(1300002);
          done();
        }
      }
    })


    /**
     * @tc.name   testSetRelativePositionToParentWindowEnabledwithUnsupportedWindow
     * @tc.number SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_0200
     * @tc.desc   验证主窗/dialog窗/float/接口报1300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetRelativePositionToParentWindowEnabledwithUnsupportedWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetRelativePositionToParentWindowEnabledwithUnsupportedWindow';
      console.log(caseName + 'begin.');
      if (isFreeWindowMode == true) {
        // 主窗
        try {
          let mainWindow = windowStage.getMainWindowSync();
          await mainWindow.setRelativePositionToParentWindowEnabled(true);
          console.info(caseName + 'main window succeed in calling setRelativePositionToParentWindowEnabled');
          expect().assertFail();
          done();
        } catch (err) {
          console.error(`${caseName} failed main window, err: ${JSON.stringify(err)}`);
          if (err.code === 801) {
            done();
          } else {
            expect(err.code).assertEqual(1300004);
          }
        }
        // dilog窗
        let config: window.Configuration = {
          name: "dialogWindow",
          windowType: window.WindowType.TYPE_DIALOG,
          ctx: context
        };
        let windowClass2 = await window.createWindow(config);
        try {
          await windowClass2.setRelativePositionToParentWindowEnabled(true);
          console.info(caseName + 'dialog window succeed in calling setRelativePositionToParentWindowEnabled');
          expect().assertFail();
          await windowClass2.destroyWindow();
          done();
        } catch (err) {
          console.error(`${caseName} failed dialog window, err: ${JSON.stringify(err)}`);
          await windowClass2.destroyWindow();
          if (err.code == 801) {
            done();
          } else {
            expect(err.code).assertEqual(1300004);
          }
        }

        // 悬浮窗
        let config2: window.Configuration = {
          name: "floatWindow",
          windowType: window.WindowType.TYPE_FLOAT,
          ctx: context
        };
        let subWindowClass: window.Window | undefined;
        console.info(`${caseName} Succeeded in creating the float window.`);
        try {
          window.createWindow(config2).then(async (data) => {
            subWindowClass = data;
            await subWindowClass.setRelativePositionToParentWindowEnabled(true);
            console.info(caseName + 'float window succeed in calling setRelativePositionToParentWindowEnabled');
            await subWindowClass?.destroyWindow();
            expect().assertFail();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(`${caseName} Failed float window. Cause code: ${err.code}, message: ${err.message}`);
            await subWindowClass?.destroyWindow();
            if (err.code === 801) {
              done();
            } else {
              expect(err.code).assertEqual(1300004);
              done();
            }
          });
        } catch (e) {
          console.error(`${caseName} Failed2 float window. Cause: ${JSON.stringify(e)}`);
          await subWindowClass?.destroyWindow();
          expect().assertFail();
          done()
        }
      } else {
        done()
      }
    })

    /**
     * @tc.name   testSetRelativePositionToParentWindowEnabledwithUnsupportedWindowSecondWindow
     * @tc.number SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_0300
     * @tc.desc   验证二级子窗调用接口报1300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetRelativePositionToParentWindowEnabledwithUnsupportedWindowSecondWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetRelativePositionToParentWindowEnabledwithUnsupportedWindowSecondWindow';
      console.log(caseName + 'begin.');
      if (isFreeWindowMode == true) {
        let options: window.SubWindowOptions = {
          title: 'subWindow1',
          decorEnabled: true
        }
        // 二级子窗窗
        let subWindowClass: window.Window | undefined;
        let subWindowClass2: window.Window | undefined;
        console.info(`${caseName} Succeeded in creating the float window.`);
        try {
          windowStage.createSubWindowWithOptions('subWindow1', options).then(async (data) => {
            console.info(caseName + 'sub window 1 create success');
            subWindowClass = data;
            data.createSubWindowWithOptions('subWindow2', options).then(async (data) => {
              console.info(caseName + 'sub window 2 create success');
              subWindowClass2 = data;
              await subWindowClass2.setRelativePositionToParentWindowEnabled(true);
              console.info(caseName + 'sub window succeed in calling setRelativePositionToParentWindowEnabled');
              expect().assertFail();
              await subWindowClass!.destroyWindow();
              await subWindowClass2.destroyWindow();
              done();
            }).catch(async (error: BusinessError) => {
              console.log(caseName + 'Failed to create the subwindow 2. Cause: ' + JSON.stringify(error));
              await subWindowClass2!.destroyWindow();
              await subWindowClass!.destroyWindow();
              if (error.code == 1300002) {
                console.log(caseName + 'device not support')
                done();
              } else if (error.code == 1300004) {

                
                done();
              } else if (error.code == 801) {
                done();
              }
              else {
                expect().assertFail();
                done();
              }
            });
          }).catch((error: BusinessError) => {
            console.error(caseName + 'Failed to create the subwindow 1. Cause: ' + JSON.stringify(error));
            if (error.code == 1300002) {
              console.log(caseName + 'device not support')
              
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (e) {
          console.error(`${caseName} Failed2 float window. Cause: ${JSON.stringify(e)}`);
          await subWindowClass?.destroyWindow();
          await subWindowClass2?.destroyWindow();
          expect().assertFail();
          done()
        }
      } else {
        done()
      }
    })

    /**
     * @tc.name   testSetRelativePositionToParentWindowEnabled
     * @tc.number SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_0400
     * @tc.desc   验证子窗设置enable=true，子窗和主窗左上角重合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetRelativePositionToParentWindowEnabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetRelativePositionToParentWindowEnabled';
      console.log(caseName + 'begin.');
      let mainWindow = windowStage.getMainWindowSync();
      let windowClass = await windowStage.createSubWindow('testSetRelativePositionToParentWindowEnabled');
      await windowClass.setUIContent('testability/pages/First/index2');
      await windowClass.showWindow();
      windowClass.resizeAsync(1000, 1000)
      await sleep(1000);
      try {
        if (isFreeWindowMode == true) {
          windowClass.setRelativePositionToParentWindowEnabled(true).then(async () => {
            console.info(caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
            let windowRect = mainWindow.getWindowProperties().windowRect;
            console.info(`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
            windowClass.moveWindowToAsync(windowRect.left + 20, windowRect.top - 20)
            await sleep(1000)
            let mainWindowProperties = mainWindow.getWindowProperties();
            console.info(`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
            let subWindowProperties = windowClass.getWindowProperties();
            console.info(`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
            let mainLeft = mainWindowProperties.windowRect.left;
            let mainTop = mainWindowProperties.windowRect.top;
            let mainWidth = mainWindowProperties.windowRect.width;
            let mainHeight = mainWindowProperties.windowRect.height;
            let subLeft = subWindowProperties.windowRect.left;
            let subTop = subWindowProperties.windowRect.top;
            let subWidth = subWindowProperties.windowRect.width;
            let subHeight = subWindowProperties.windowRect.height;
            expect(mainTop).assertEqual(subTop);
            expect(mainLeft).assertEqual(subLeft);
            await windowClass.destroyWindow();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
            await windowClass.destroyWindow();
            if (err.code == 801) {
              done();
            } else {
              expect().assertFail();
              done();
            }
          })
        } else {
          await windowClass.destroyWindow();
          done();
        }
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        await windowClass.destroyWindow();
        if (err.code == 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testSetRelativePositionToParentWindowUnEnabled
     * @tc.number SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_0500
     * @tc.desc   验证子窗设置enable=false，子窗和主窗左上角不重合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetRelativePositionToParentWindowUnEnabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetRelativePositionToParentWindowUnEnabled';
      console.log(caseName + 'begin.');
      let mainWindow = windowStage.getMainWindowSync();
      let windowClass = await windowStage.createSubWindow('testSetRelativePositionToParentWindowUnEnabled');
      await windowClass.setUIContent('testability/pages/First/index2');
      await windowClass.showWindow();
      windowClass.resizeAsync(1000, 1000)
      await sleep(1000);
      try {
        if (isFreeWindowMode == true) {
          windowClass.setRelativePositionToParentWindowEnabled(false).then(async () => {
            console.info(caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
            let windowRect = mainWindow.getWindowProperties().windowRect;
            console.info(`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
            windowClass.moveWindowToAsync(windowRect.left + 20, windowRect.top - 20)
            await sleep(1000)
            let mainWindowProperties = mainWindow.getWindowProperties();
            console.info(`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
            let subWindowProperties = windowClass.getWindowProperties();
            console.info(`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
            expect(Math.abs(mainWindowProperties.windowRect.left - subWindowProperties.windowRect.left)).assertLarger(0);
            expect(Math.abs(mainWindowProperties.windowRect.top - subWindowProperties.windowRect.top)).assertLarger(0);
            await windowClass.destroyWindow();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
            await windowClass.destroyWindow();
            if (err.code == 801) {
              done();
            } else {
              expect().assertFail();
              done();
            }
          })
        } else {
          await windowClass.destroyWindow();
          done();
        }
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        await windowClass.destroyWindow();
        if (err.code == 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testSetRelativePositionToParentWindowEnabledwithAnchorTopStart
     * @tc.number SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_0600
     * @tc.desc   验证子窗设置enable=true，anchor=TOP_START，子窗位于主窗左上角
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetRelativePositionToParentWindowEnabledwithAnchorTopStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetRelativePositionToParentWindowEnabledwithAnchorTopStart';
      console.log(caseName + 'begin.');
      let mainWindow = windowStage.getMainWindowSync();
      let windowClass = await windowStage.createSubWindow('testSetRelativePositionToParentWindowEnabledwithAnchorTopStart');
      await windowClass.setUIContent('testability/pages/First/index2');
      await windowClass.showWindow();
      windowClass.resizeAsync(1000, 1000)
      await sleep(1000);
      try {
        if (isFreeWindowMode == true) {
          windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.TOP_START).then(async () => {
            console.info(caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
            let windowRect = mainWindow.getWindowProperties().windowRect;
            console.info(`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
            windowClass.moveWindowToAsync(windowRect.left + 20, windowRect.top - 20)
            await sleep(1000)
            let mainWindowProperties = mainWindow.getWindowProperties();
            console.info(`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
            let subWindowProperties = windowClass.getWindowProperties();
            console.info(`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
            let mainLeft = mainWindowProperties.windowRect.left;
            let mainTop = mainWindowProperties.windowRect.top;
            let mainWidth = mainWindowProperties.windowRect.width;
            let mainHeight = mainWindowProperties.windowRect.height;
            let subLeft = subWindowProperties.windowRect.left;
            let subTop = subWindowProperties.windowRect.top;
            let subWidth = subWindowProperties.windowRect.width;
            let subHeight = subWindowProperties.windowRect.height;
            expect(mainTop).assertEqual(subTop);
            expect(mainLeft).assertEqual(subLeft);
            await windowClass.destroyWindow();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
            await windowClass.destroyWindow();
            if (err.code == 801) {
              done();
            } else {
              expect().assertFail();
              done();
            }
          })
        } else {
          await windowClass.destroyWindow();
          done();
        }
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        await windowClass.destroyWindow();
        if (err.code == 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testSetRelativePositionToParentWindowEnabledwithAnchorTop
     * @tc.number SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_0700
     * @tc.desc   验证子窗设置enable=true，anchor=TOP，子窗位于主窗上边界横向居中点
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetRelativePositionToParentWindowEnabledwithAnchorTop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetRelativePositionToParentWindowEnabledwithAnchorTop';
      console.log(caseName + 'begin.');
      let mainWindow = windowStage.getMainWindowSync();
      let windowClass = await windowStage.createSubWindow('testSetRelativePositionToParentWindowEnabledwithAnchorTop');
      await windowClass.setUIContent('testability/pages/First/index2');
      await windowClass.showWindow();
      windowClass.resizeAsync(1000, 1000)
      await sleep(1000);
      try {
        if (isFreeWindowMode == true) {
          windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.TOP).then(async () => {
            console.info(caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
            let windowRect = mainWindow.getWindowProperties().windowRect;
            console.info(`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
            windowClass.moveWindowToAsync(windowRect.left - 20, windowRect.top + 20)
            await sleep(1000)
            let mainWindowProperties = mainWindow.getWindowProperties();
            console.info(`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
            let subWindowProperties = windowClass.getWindowProperties();
            console.info(`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
            let mainLeft = mainWindowProperties.windowRect.left;
            let mainTop = mainWindowProperties.windowRect.top;
            let mainWidth = mainWindowProperties.windowRect.width;
            let mainHeight = mainWindowProperties.windowRect.height;
            let subLeft = subWindowProperties.windowRect.left;
            let subTop = subWindowProperties.windowRect.top;
            let subWidth = subWindowProperties.windowRect.width;
            let subHeight = subWindowProperties.windowRect.height;
            expect(mainTop).assertEqual(subTop);
            expect(Math.abs(mainLeft - subLeft)).assertEqual(Math.abs((mainWidth + mainLeft) - (subWidth + subLeft)));
            await windowClass.destroyWindow();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
            await windowClass.destroyWindow();
            if (err.code == 801) {
              done();
            } else {
              expect().assertFail();
              done();
            }
          })
        } else {
          await windowClass.destroyWindow();
          done();
        }
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        await windowClass.destroyWindow();
        if (err.code == 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testSetRelativePositionToParentWindowEnabledwithAnchorTopEnd
     * @tc.number SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_0800
     * @tc.desc   验证子窗设置enable=true，anchor=TOP_END，子窗位于主窗右上角
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetRelativePositionToParentWindowEnabledwithAnchorTopEnd', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetRelativePositionToParentWindowEnabledwithAnchorTopEnd';
      console.log(caseName + 'begin.');
      let mainWindow = windowStage.getMainWindowSync();
      let windowClass = await windowStage.createSubWindow('testSetRelativePositionToParentWindowEnabledwithAnchorTopEnd');
      await windowClass.setUIContent('testability/pages/First/index2');
      await windowClass.showWindow();
      windowClass.resizeAsync(1000, 1000)
      await sleep(1000);
      try {
        if (isFreeWindowMode == true) {
          windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.TOP_END).then(async () => {
            console.info(caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
            let windowRect = mainWindow.getWindowProperties().windowRect;
            console.info(`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
            windowClass.moveWindowToAsync(windowRect.left + 20, windowRect.top - 20)
            await sleep(1000)
            let mainWindowProperties = mainWindow.getWindowProperties();
            console.info(`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
            let subWindowProperties = windowClass.getWindowProperties();
            console.info(`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
            let mainLeft = mainWindowProperties.windowRect.left;
            let mainTop = mainWindowProperties.windowRect.top;
            let mainWidth = mainWindowProperties.windowRect.width;
            let mainHeight = mainWindowProperties.windowRect.height;
            let subLeft = subWindowProperties.windowRect.left;
            let subTop = subWindowProperties.windowRect.top;
            let subWidth = subWindowProperties.windowRect.width;
            let subHeight = subWindowProperties.windowRect.height;
            expect(mainTop).assertEqual(subTop);
            expect(Math.abs((mainLeft + mainWidth) - (subLeft + subWidth))).assertLessOrEqual(1);
            await windowClass.destroyWindow();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
            await windowClass.destroyWindow();
            if (err.code == 801) {
              done();
            } else {
              expect().assertFail();
              done();
            }
          })
        } else {
          await windowClass.destroyWindow();
          done();
        }
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        await windowClass.destroyWindow();
        if (err.code == 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testSetRelativePositionToParentWindowEnabledwithAnchorStart
     * @tc.number SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_0900
     * @tc.desc   验证子窗设置enable=true，anchor=START，子窗位于主窗左边界纵向居中点
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetRelativePositionToParentWindowEnabledwithAnchorStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetRelativePositionToParentWindowEnabledwithAnchorStart';
      console.log(caseName + 'begin.');
      let mainWindow = windowStage.getMainWindowSync();
      let windowClass = await windowStage.createSubWindow('testSetRelativePositionToParentWindowEnabledwithAnchorStart');
      await windowClass.setUIContent('testability/pages/First/index2');
      await windowClass.showWindow();
      windowClass.resizeAsync(1000, 1000)
      await sleep(1000);
      try {
        if (isFreeWindowMode == true) {
          windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.START).then(async () => {
            console.info(caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
            let windowRect = mainWindow.getWindowProperties().windowRect;
            console.info(`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
            windowClass.moveWindowToAsync(windowRect.left + 20, windowRect.top - 20)
            await sleep(1000)
            let mainWindowProperties = mainWindow.getWindowProperties();
            console.info(`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
            let subWindowProperties = windowClass.getWindowProperties();
            console.info(`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
            let mainLeft = mainWindowProperties.windowRect.left;
            let mainTop = mainWindowProperties.windowRect.top;
            let mainWidth = mainWindowProperties.windowRect.width;
            let mainHeight = mainWindowProperties.windowRect.height;
            let subLeft = subWindowProperties.windowRect.left;
            let subTop = subWindowProperties.windowRect.top;
            let subWidth = subWindowProperties.windowRect.width;
            let subHeight = subWindowProperties.windowRect.height;
            expect(mainLeft).assertEqual(subLeft);
            expect(Math.abs((subTop + subHeight / 2) - (mainTop + mainHeight / 2))).assertLessOrEqual(1);
            await windowClass.destroyWindow();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
            await windowClass.destroyWindow();
            if (err.code == 801) {
              done();
            } else {
              expect().assertFail();
              done();
            }
          })
        } else {
          await windowClass.destroyWindow();
          done();
        }
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        await windowClass.destroyWindow();
        if (err.code == 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testSetRelativePositionToParentWindowEnabledwithAnchorCenter
     * @tc.number SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_1000
     * @tc.desc   验证子窗设置enable=true，anchor=CENTER，子窗位于主窗窗口横向和纵向居中点
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetRelativePositionToParentWindowEnabledwithAnchorCenter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetRelativePositionToParentWindowEnabledwithAnchorCenter';
      console.log(caseName + 'begin.');
      let mainWindow = windowStage.getMainWindowSync();
      let windowClass = await windowStage.createSubWindow('testSetRelativePositionToParentWindowEnabledwithAnchorCenter');
      await windowClass.setUIContent('testability/pages/First/index2');
      await windowClass.showWindow();
      windowClass.resizeAsync(1000, 1000)
      await sleep(1000);
      try {
        if (isFreeWindowMode == true) {
          windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.CENTER).then(async () => {
            console.info(caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
            let windowRect = mainWindow.getWindowProperties().windowRect;
            console.info(`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
            windowClass.moveWindowToAsync(windowRect.left - 20, windowRect.top + 20)
            await sleep(1000)
            let mainWindowProperties = mainWindow.getWindowProperties();
            console.info(`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
            let subWindowProperties = windowClass.getWindowProperties();
            console.info(`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
            let mainLeft = mainWindowProperties.windowRect.left;
            let mainTop = mainWindowProperties.windowRect.top;
            let mainWidth = mainWindowProperties.windowRect.width;
            let mainHeight = mainWindowProperties.windowRect.height;
            let subLeft = subWindowProperties.windowRect.left;
            let subTop = subWindowProperties.windowRect.top;
            let subWidth = subWindowProperties.windowRect.width;
            let subHeight = subWindowProperties.windowRect.height;
            expect(Math.abs((mainLeft + mainWidth / 2)) - (subLeft + subWidth / 2)).assertLessOrEqual(1)
            expect(Math.abs((subTop + subHeight / 2) - (mainTop + mainHeight / 2))).assertLessOrEqual(1);
            await windowClass.destroyWindow();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
            await windowClass.destroyWindow();
            if (err.code == 801) {
              done();
            } else {
              expect().assertFail();
              done();
            }
          })
        } else {
          await windowClass.destroyWindow();
          done();
        }
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        await windowClass.destroyWindow();
        if (err.code == 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testSetRelativePositionToParentWindowEnabledwithAnchorEnd
     * @tc.number SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_1100
     * @tc.desc   验证子窗设置enable=true，anchor=END，子窗位于主窗右边界纵向居中点
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetRelativePositionToParentWindowEnabledwithAnchorEnd', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetRelativePositionToParentWindowEnabledwithAnchorEnd';
      console.log(caseName + 'begin.');
      let mainWindow = windowStage.getMainWindowSync();
      let windowClass = await windowStage.createSubWindow('testSetRelativePositionToParentWindowEnabledwithAnchorEnd');
      await windowClass.setUIContent('testability/pages/First/index2');
      await windowClass.showWindow();
      windowClass.resizeAsync(1000, 1000)
      await sleep(1000);
      try {
        if (isFreeWindowMode == true) {
          windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.END).then(async () => {
            console.info(caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
            let windowRect = mainWindow.getWindowProperties().windowRect;
            console.info(`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
            mainWindow.moveWindowToAsync(windowRect.left - 20, windowRect.top + 20)
            await sleep(1000)
            let mainWindowProperties = mainWindow.getWindowProperties();
            console.info(`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
            let subWindowProperties = windowClass.getWindowProperties();
            console.info(`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
            let mainLeft = mainWindowProperties.windowRect.left;
            let mainTop = mainWindowProperties.windowRect.top;
            let mainWidth = mainWindowProperties.windowRect.width;
            let mainHeight = mainWindowProperties.windowRect.height;
            let subLeft = subWindowProperties.windowRect.left;
            let subTop = subWindowProperties.windowRect.top;
            let subWidth = subWindowProperties.windowRect.width;
            let subHeight = subWindowProperties.windowRect.height;
            expect(Math.abs((mainLeft + mainWidth) - (subLeft + subWidth))).assertLessOrEqual(1);
            expect(Math.abs((mainTop + mainHeight / 2) - (subTop + subHeight / 2))).assertLessOrEqual(1);
            await windowClass.destroyWindow();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
            await windowClass.destroyWindow();
            if (err.code == 801) {
              done();
            } else {
              expect().assertFail();
              done();
            }
          })
        } else {
          await windowClass.destroyWindow();
          done();
        }
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        await windowClass.destroyWindow();
        if (err.code == 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testSetRelativePositionToParentWindowEnabledwithAnchorBottomStart
     * @tc.number SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_1200
     * @tc.desc   验证子窗设置enable=true，anchor=BOTTOM_START，子窗位于主窗左下角
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetRelativePositionToParentWindowEnabledwithAnchorBottomStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetRelativePositionToParentWindowEnabledwithAnchorBottomStart';
      console.log(caseName + 'begin.');
      let mainWindow = windowStage.getMainWindowSync();
      let windowClass = await windowStage.createSubWindow('testSetRelativePositionToParentWindowEnabledwithAnchorBottomStart');
      await windowClass.setUIContent('testability/pages/First/index2');
      await windowClass.showWindow();
      windowClass.resizeAsync(1000, 1000)
      await sleep(1000);
      try {
        if (isFreeWindowMode == true) {
          windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.BOTTOM_START).then(async () => {
            console.info(caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
            let windowRect = mainWindow.getWindowProperties().windowRect;
            console.info(`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
            mainWindow.moveWindowToAsync(windowRect.left - 20, windowRect.top + 20)
            await sleep(1000)
            let mainWindowProperties = mainWindow.getWindowProperties();
            console.info(`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
            let subWindowProperties = windowClass.getWindowProperties();
            console.info(`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
            let mainLeft = mainWindowProperties.windowRect.left;
            let mainTop = mainWindowProperties.windowRect.top;
            let mainWidth = mainWindowProperties.windowRect.width;
            let mainHeight = mainWindowProperties.windowRect.height;
            let subLeft = subWindowProperties.windowRect.left;
            let subTop = subWindowProperties.windowRect.top;
            let subWidth = subWindowProperties.windowRect.width;
            let subHeight = subWindowProperties.windowRect.height;
            expect(mainLeft).assertEqual(subLeft);
            expect(Math.abs((mainHeight + mainTop) - (subHeight + subTop))).assertLessOrEqual(1);
            await windowClass.destroyWindow();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
            await windowClass.destroyWindow();
            if (err.code == 801) {
              done();
            } else {
              expect().assertFail();
              done();
            }
          })
        } else {
          await windowClass.destroyWindow();
          done();
        }
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        await windowClass.destroyWindow();
        if (err.code == 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testSetRelativePositionToParentWindowEnabledwithAnchorBottom
     * @tc.number SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_1300
     * @tc.desc   验证子窗设置enable=true，anchor=BOTTOM，子窗位于主窗下边界横向居中点
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetRelativePositionToParentWindowEnabledwithAnchorBottom', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetRelativePositionToParentWindowEnabledwithAnchorBottom';
      console.log(caseName + 'begin.');
      let mainWindow = windowStage.getMainWindowSync();
      let windowClass = await windowStage.createSubWindow('testSetRelativePositionToParentWindowEnabledwithAnchorBottom');
      await windowClass.setUIContent('testability/pages/First/index2');
      await windowClass.showWindow();
      windowClass.resizeAsync(1000, 1000)
      await sleep(1000);
      try {
        if (isFreeWindowMode == true) {
          windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.BOTTOM).then(async () => {
            console.info(caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
            let windowRect = mainWindow.getWindowProperties().windowRect;
            console.info(`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
            mainWindow.moveWindowToAsync(windowRect.left + 20, windowRect.top - 20)
            await sleep(1000)
            let mainWindowProperties = mainWindow.getWindowProperties();
            console.info(`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
            let subWindowProperties = windowClass.getWindowProperties();
            console.info(`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
            let mainLeft = mainWindowProperties.windowRect.left;
            let mainTop = mainWindowProperties.windowRect.top;
            let mainWidth = mainWindowProperties.windowRect.width;
            let mainHeight = mainWindowProperties.windowRect.height;
            let subLeft = subWindowProperties.windowRect.left;
            let subTop = subWindowProperties.windowRect.top;
            let subWidth = subWindowProperties.windowRect.width;
            let subHeight = subWindowProperties.windowRect.height;
            expect(Math.abs((mainLeft + mainWidth / 2) - (subLeft + subWidth / 2))).assertLessOrEqual(1);
            expect(Math.abs((mainHeight + mainTop) - (subHeight + subTop))).assertLessOrEqual(1);
            await windowClass.destroyWindow();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
            await windowClass.destroyWindow();
            if (err.code == 801) {
              done();
            } else {
              expect().assertFail();
              done();
            }
          })
        } else {
          await windowClass.destroyWindow();
          done();
        }
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        await windowClass.destroyWindow();
        if (err.code == 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testSetRelativePositionToParentWindowEnabledwithAnchorBottomEnd
     * @tc.number SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_1400
     * @tc.desc   验证子窗设置enable=true，anchor=BOTTOM，子窗位于主窗下边界横向右顶点
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetRelativePositionToParentWindowEnabledwithAnchorBottomEnd', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetRelativePositionToParentWindowEnabledwithAnchorBottomEnd';
      console.log(caseName + 'begin.');
      let mainWindow = windowStage.getMainWindowSync();
      let windowClass = await windowStage.createSubWindow('testSetRelativePositionToParentWindowEnabledwithAnchorBottomEnd');
      await windowClass.setUIContent('testability/pages/First/index2');
      await windowClass.showWindow();
      windowClass.resizeAsync(1000, 1000)
      await sleep(1000);
      try {
        if (isFreeWindowMode == true) {
          windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.BOTTOM_END).then(async () => {
            console.info(caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
            let windowRect = mainWindow.getWindowProperties().windowRect;
            console.info(`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
            mainWindow.moveWindowToAsync(windowRect.left + 20, windowRect.top - 20)
            await sleep(1000)
            let mainWindowProperties = mainWindow.getWindowProperties();
            console.info(`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
            let subWindowProperties = windowClass.getWindowProperties();
            console.info(`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
            let mainLeft = mainWindowProperties.windowRect.left;
            let mainTop = mainWindowProperties.windowRect.top;
            let mainWidth = mainWindowProperties.windowRect.width;
            let mainHeight = mainWindowProperties.windowRect.height;
            let subLeft = subWindowProperties.windowRect.left;
            let subTop = subWindowProperties.windowRect.top;
            let subWidth = subWindowProperties.windowRect.width;
            let subHeight = subWindowProperties.windowRect.height;
            expect(Math.abs((mainWidth + mainLeft) - (subWidth + subLeft))).assertLessOrEqual(1);
            expect(Math.abs((mainHeight + mainTop) - (subHeight + subTop))).assertLessOrEqual(1);
            await windowClass.destroyWindow();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
            await windowClass.destroyWindow();
            if (err.code == 801) {
              done();
            } else {
              expect().assertFail();
              done();
            }
          })
        } else {
          await windowClass.destroyWindow();
          done();
        }
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        await windowClass.destroyWindow();
        if (err.code == 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testSetRelativePositionToParentWindowEnabledwithOffsetXOffSetY
     * @tc.number SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_1500
     * @tc.desc   验证offsetX为正，offsetY为正可以设置成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetRelativePositionToParentWindowEnabledwithOffsetXOffSetY', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetRelativePositionToParentWindowEnabledwithOffsetXOffSetY';
      console.log(caseName + 'begin.');
      let mainWindow = windowStage.getMainWindowSync();
      let windowClass = await windowStage.createSubWindow('testSetRelativePositionToParentWindowEnabledwithOffsetXOffSetY');
      await windowClass.setUIContent('testability/pages/First/index2');
      await windowClass.showWindow();
      windowClass.resizeAsync(1000, 1000)
      await sleep(1000);
      try {
        if (isFreeWindowMode == true) {
          windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.TOP_START, 100, 100).then(async () => {
            console.info(caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
            let windowRect = mainWindow.getWindowProperties().windowRect;
            console.info(`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
            mainWindow.moveWindowToAsync(windowRect.left + 20, windowRect.top - 20)
            await sleep(1000)
            let mainWindowProperties = mainWindow.getWindowProperties();
            console.info(`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
            let subWindowProperties = windowClass.getWindowProperties();
            console.info(`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
            let mainLeft = mainWindowProperties.windowRect.left;
            let mainTop = mainWindowProperties.windowRect.top;
            let mainWidth = mainWindowProperties.windowRect.width;
            let mainHeight = mainWindowProperties.windowRect.height;
            let subLeft = subWindowProperties.windowRect.left;
            let subTop = subWindowProperties.windowRect.top;
            let subWidth = subWindowProperties.windowRect.width;
            let subHeight = subWindowProperties.windowRect.height;
            expect(subLeft).assertEqual(mainLeft + 100);
            expect(subTop).assertEqual(mainTop + 100);
            await windowClass.destroyWindow();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
            await windowClass.destroyWindow();
            if (err.code == 801) {
              done();
            } else {
              expect().assertFail();
              done();
            }
          })
        } else {
          await windowClass.destroyWindow();
          done();
        }
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        await windowClass.destroyWindow();
        if (err.code == 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testSetRelativePositionToParentWindowEnabledwithNegativeOffsetY
     * @tc.number SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_1600
     * @tc.desc   验证offsetX为正，offsetY为负可以设置成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetRelativePositionToParentWindowEnabledwithNegativeOffsetY', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetRelativePositionToParentWindowEnabledwithNegativeOffsetY';
      console.log(caseName + 'begin.');
      let mainWindow = windowStage.getMainWindowSync();
      let windowClass = await windowStage.createSubWindow('testSetRelativePositionToParentWindowEnabledwithNegativeOffsetY');
      await windowClass.setUIContent('testability/pages/First/index2');
      await windowClass.showWindow();
      windowClass.resizeAsync(1000, 1000)
      await sleep(1000);
      try {
        if (isFreeWindowMode == true) {
          windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.TOP_START, 100, -100).then(async () => {
            console.info(caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
            let windowRect = mainWindow.getWindowProperties().windowRect;
            console.info(`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
            mainWindow.moveWindowToAsync(windowRect.left - 20, windowRect.top + 20)
            await sleep(1000)
            let mainWindowProperties = mainWindow.getWindowProperties();
            console.info(`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
            let subWindowProperties = windowClass.getWindowProperties();
            console.info(`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
            let mainLeft = mainWindowProperties.windowRect.left;
            let mainTop = mainWindowProperties.windowRect.top;
            let mainWidth = mainWindowProperties.windowRect.width;
            let mainHeight = mainWindowProperties.windowRect.height;
            let subLeft = subWindowProperties.windowRect.left;
            let subTop = subWindowProperties.windowRect.top;
            let subWidth = subWindowProperties.windowRect.width;
            let subHeight = subWindowProperties.windowRect.height;
            expect(subLeft).assertEqual(mainLeft + 100);
            expect(subTop).assertEqual(Math.abs(mainTop - 100));
            await windowClass.destroyWindow();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
            await windowClass.destroyWindow();
            if (err.code == 801) {
              done();
            } else {
              expect().assertFail();
              done();
            }
          })
        } else {
          await windowClass.destroyWindow();
          done();
        }
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        await windowClass.destroyWindow();
        if (err.code == 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testSetRelativePositionToParentWindowEnabledwithNegativeOffsetX
     * @tc.number SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_1700
     * @tc.desc   验证offsetX为负，offsetY为正可以设置成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetRelativePositionToParentWindowEnabledwithNegativeOffsetX', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetRelativePositionToParentWindowEnabledwithNegativeOffsetX';
      console.log(caseName + 'begin.');
      let mainWindow = windowStage.getMainWindowSync();
      let windowClass = await windowStage.createSubWindow('testSetRelativePositionToParentWindowEnabledwithNegativeOffsetX');
      await windowClass.setUIContent('testability/pages/First/index2');
      await windowClass.showWindow();
      windowClass.resizeAsync(1000, 1000)
      await sleep(1000);
      try {
        if (isFreeWindowMode == true) {
          windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.TOP_START, -100, 100).then(async () => {
            console.info(caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
            let windowRect = mainWindow.getWindowProperties().windowRect;
            console.info(`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
            mainWindow.moveWindowToAsync(windowRect.left - 20, windowRect.top + 20)
            await sleep(1000)
            let mainWindowProperties = mainWindow.getWindowProperties();
            console.info(`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
            let subWindowProperties = windowClass.getWindowProperties();
            console.info(`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
            let mainLeft = mainWindowProperties.windowRect.left;
            let mainTop = mainWindowProperties.windowRect.top;
            let mainWidth = mainWindowProperties.windowRect.width;
            let mainHeight = mainWindowProperties.windowRect.height;
            let subLeft = subWindowProperties.windowRect.left;
            let subTop = subWindowProperties.windowRect.top;
            let subWidth = subWindowProperties.windowRect.width;
            let subHeight = subWindowProperties.windowRect.height;
            expect(subLeft).assertEqual(Math.abs(mainLeft - 100));
            expect(subTop).assertEqual(mainTop + 100);
            await windowClass.destroyWindow();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
            await windowClass.destroyWindow();
            if (err.code == 801) {
              done();
            } else {
              expect().assertFail();
              done();
            }
          })
        } else {
          await windowClass.destroyWindow();
          done();
        }
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        await windowClass.destroyWindow();
        if (err.code == 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testSetRelativePositionToParentWindowEnabledwithNegativeOffsetXOffsetY
     * @tc.number SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_1800
     * @tc.desc   验证offsetX为负，offsetY为负可以设置成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetRelativePositionToParentWindowEnabledwithNegativeOffsetXOffsetY', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetRelativePositionToParentWindowEnabledwithNegativeOffsetXOffsetY';
      console.log(caseName + 'begin.');
      let mainWindow = windowStage.getMainWindowSync();
      let windowClass = await windowStage.createSubWindow('testSetRelativePositionToParentWindowEnabledwithNegativeOffsetXOffsetY');
      await windowClass.setUIContent('testability/pages/First/index2');
      await windowClass.showWindow();
      windowClass.resizeAsync(1000, 1000)
      await sleep(1000);
      try {
        if (isFreeWindowMode == true) {
          windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.TOP_START, -100, -100).then(async () => {
            console.info(caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
            let windowRect = mainWindow.getWindowProperties().windowRect;
            console.info(`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
            mainWindow.moveWindowToAsync(windowRect.left - 20, windowRect.top + 20)
            await sleep(1000)
            let mainWindowProperties = mainWindow.getWindowProperties();
            console.info(`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
            let subWindowProperties = windowClass.getWindowProperties();
            console.info(`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
            let mainLeft = mainWindowProperties.windowRect.left;
            let mainTop = mainWindowProperties.windowRect.top;
            let mainWidth = mainWindowProperties.windowRect.width;
            let mainHeight = mainWindowProperties.windowRect.height;
            let subLeft = subWindowProperties.windowRect.left;
            let subTop = subWindowProperties.windowRect.top;
            let subWidth = subWindowProperties.windowRect.width;
            let subHeight = subWindowProperties.windowRect.height;
            expect(subLeft).assertEqual(Math.abs(mainLeft - 100));
            expect(subTop).assertEqual(Math.abs(mainTop - 100));
            await windowClass.destroyWindow();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
            await windowClass.destroyWindow();
            if (err.code == 801) {
              done();
            } else {
              expect().assertFail();
              done();
            }
          })
        } else {
          await windowClass.destroyWindow();
          done();
        }
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        await windowClass.destroyWindow();
        if (err.code == 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testWindowAnchorEnum
     * @tc.number SUB_BASIC_WMS_WINDOW_ANCHOR_0100
     * @tc.desc   WindowAnchor枚举值验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWindowAnchorEnum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testWindowAnchorEnum';
      console.log(caseName + 'begin.');
      try {
        console.info(`${caseName} enum WindowAnchor: : ${JSON.stringify(window.WindowAnchor)}`);
        expect(window.WindowAnchor.TOP_START).assertEqual(0);
        expect(window.WindowAnchor.TOP).assertEqual(1);
        expect(window.WindowAnchor.TOP_END).assertEqual(2);
        expect(window.WindowAnchor.START).assertEqual(3);
        expect(window.WindowAnchor.CENTER).assertEqual(4);
        expect(window.WindowAnchor.END).assertEqual(5);
        expect(window.WindowAnchor.BOTTOM_START).assertEqual(6);
        expect(window.WindowAnchor.BOTTOM).assertEqual(7);
        expect(window.WindowAnchor.BOTTOM_END).assertEqual(8);
        done();
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOnandOffRectChangeInGlobalDisplaywithMainWindow
     * @tc.number SUB_BASIC_WMS_FUNCTION_ON_GLOBAL_RECT_0100
     * @tc.desc   验证主窗on(type: 'rectChangeInGlobalDisplay')接口重复注册多次
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnandOffRectChangeInGlobalDisplaywithMainWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testOnandOffRectChangeInGlobalDisplaywithMainWindow';
      console.log(caseName + 'begin.');
      let windowStageStart = await startAbility(caseName, context);
      let windowClass = windowStageStart.getMainWindowSync();
      let timer = 0;
      try {
        const callback = (cb: window.RectChangeOptions) => {
          console.log(caseName + ' cb: ' + JSON.stringify(cb));
          timer++;
        };
        windowClass.on('rectChangeInGlobalDisplay', callback);
        windowClass.on('rectChangeInGlobalDisplay', callback);
        windowClass.on('rectChangeInGlobalDisplay', callback);
        windowClass.moveWindowToAsync(50, 50);
        await sleep(200);
        console.log(caseName + ' timer: ' + timer);
        if (isFreeWindowMode == true) {
          expect(timer).assertEqual(1);
        } else {
          expect(timer).assertEqual(0);
        }
        windowClass.off('rectChangeInGlobalDisplay');
        await terminateAbility(caseName);
        done();
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        windowClass.off('rectChangeInGlobalDisplay');
        await terminateAbility(caseName);
        if (err.code == 801) {
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testOnandOffRectChangeInGlobalDisplaywithMainWindowRegisterTwotimes
     * @tc.number SUB_BASIC_WMS_FUNCTION_ON_GLOBAL_RECT_0200
     * @tc.desc   验证主窗on(type: 'rectChangeInGlobalDisplay')接口注册多次
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnandOffRectChangeInGlobalDisplaywithMainWindowRegisterTwotimes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testOnandOffRectChangeInGlobalDisplaywithMainWindowRegisterTwotimes';
      console.log(caseName + 'begin.');
      let windowStageStart = await startAbility(caseName, context);
      let windowClass = windowStageStart.getMainWindowSync();
      let timer1 = 0;
      let timer2 = 0;
      try {
        const callback1 = (cb1: window.RectChangeOptions) => {
          console.log(caseName + ' cb1: ' + JSON.stringify(cb1));
          timer1++;
        };
        windowClass.on('rectChangeInGlobalDisplay', callback1);
        const callback2 = (cb2: window.RectChangeOptions) => {
          console.log(caseName + ' cb2: ' + JSON.stringify(cb2));
          timer2++;
        };
        windowClass.on('rectChangeInGlobalDisplay', callback2);
        windowClass.moveWindowToAsync(50, 50);
        await sleep(200);
        console.log(caseName + ' timer1: ' + timer1);
        console.log(caseName + ' timer2: ' + timer2);
        if (isFreeWindowMode == true) {
          expect(timer1).assertEqual(1);
          expect(timer2).assertEqual(1);
        } else {
          expect(timer1).assertEqual(0);
          expect(timer2).assertEqual(0);
        }
        windowClass.off('rectChangeInGlobalDisplay');
        await terminateAbility(caseName);
        done();
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        windowClass.off('rectChangeInGlobalDisplay');
        await terminateAbility(caseName);
        if (err.code == 801) {
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testOnandOffRectChangeInGlobalDisplaywithMainWindowUnregister
     * @tc.number SUB_BASIC_WMS_FUNCTION_ON_GLOBAL_RECT_0300
     * @tc.desc   验证主窗on(type: 'rectChangeInGlobalDisplay')接口解注册
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnandOffRectChangeInGlobalDisplaywithMainWindowUnregister', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testOnandOffRectChangeInGlobalDisplaywithMainWindowUnregister';
      console.log(caseName + 'begin.');
      let windowStageStart = await startAbility(caseName, context);
      let windowClass = windowStageStart.getMainWindowSync();
      let timer1 = 0;
      try {
        const callback1 = (cb1: window.RectChangeOptions) => {
          console.log(caseName + ' cb1: ' + JSON.stringify(cb1));
          timer1++;
        };
        windowClass.on('rectChangeInGlobalDisplay', callback1);
        windowClass.moveWindowToAsync(50, 50);
        await sleep(200);
        console.log(caseName + ' timer1: ' + timer1);
        if (isFreeWindowMode == true) {
          expect(timer1).assertEqual(1);
        } else {
          expect(timer1).assertEqual(0);
        }
        windowClass.off('rectChangeInGlobalDisplay', callback1);
        windowClass.moveWindowToAsync(30, 30);
        await sleep(200);
        console.log(caseName + ' timer1: ' + timer1);
        if (isFreeWindowMode == true) {
          expect(timer1).assertEqual(1);
        } else {
          expect(timer1).assertEqual(0);
        }
        windowClass.off('rectChangeInGlobalDisplay');
        await terminateAbility(caseName);
        done();
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        windowClass.off('rectChangeInGlobalDisplay');
        await terminateAbility(caseName);
        if (err.code == 801) {
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testOnandOffRectChangeInGlobalDisplayUnregisterOne
     * @tc.number SUB_BASIC_WMS_FUNCTION_ON_GLOBAL_RECT_0400
     * @tc.desc   验证主窗on(type: 'rectChangeInGlobalDisplay')接口注册多次解注册其中一个
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnandOffRectChangeInGlobalDisplayUnregisterOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testOnandOffRectChangeInGlobalDisplayUnregisterOne';
      console.log(caseName + 'begin.');
      let windowStageStart = await startAbility(caseName, context);
      let windowClass = windowStageStart.getMainWindowSync();
      let timer1 = 0;
      let timer2 = 0;
      try {
        const callback1 = (cb1: window.RectChangeOptions) => {
          console.log(caseName + ' cb1: ' + JSON.stringify(cb1));
          timer1++;
        };
        windowClass.on('rectChangeInGlobalDisplay', callback1);
        const callback2 = (cb2: window.RectChangeOptions) => {
          console.log(caseName + ' cb2: ' + JSON.stringify(cb2));
          timer2++;
        };
        windowClass.on('rectChangeInGlobalDisplay', callback2);
        windowClass.moveWindowToAsync(50, 50);
        await sleep(200);
        console.log(caseName + ' before off, timer1: ' + timer1);
        console.log(caseName + ' before off, timer2: ' + timer2);
        if (isFreeWindowMode == true) {
          expect(timer1).assertEqual(1);
          expect(timer2).assertEqual(1);
        } else {
          expect(timer1).assertEqual(0);
          expect(timer2).assertEqual(0);
        }

        windowClass.off('rectChangeInGlobalDisplay', callback1);
        windowClass.moveWindowToAsync(30, 30);
        await sleep(200);
        console.log(caseName + ' after off, timer1: ' + timer1);
        console.log(caseName + ' after off, timer2: ' + timer2);
        if (isFreeWindowMode == true) {
          expect(timer1).assertEqual(1);
          expect(timer2).assertEqual(2);
        } else {
          expect(timer1).assertEqual(0);
          expect(timer2).assertEqual(0);
        }

        windowClass.off('rectChangeInGlobalDisplay');
        await terminateAbility(caseName);
        done();
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        windowClass.off('rectChangeInGlobalDisplay');
        await terminateAbility(caseName);
        if (err.code == 801) {
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testOnandOffRectChangeInGlobalDisplayUnregisterAll
     * @tc.number SUB_BASIC_WMS_FUNCTION_ON_GLOBAL_RECT_0500
     * @tc.desc   验证主窗on(type: 'rectChangeInGlobalDisplay')接口注册多次解注册所有
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnandOffRectChangeInGlobalDisplayUnregisterAll', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testOnandOffRectChangeInGlobalDisplayUnregisterAll';
      console.log(caseName + 'begin.');
      let windowStageStart = await startAbility(caseName, context);
      let windowClass = windowStageStart.getMainWindowSync();
      let timer1 = 0;
      let timer2 = 0;
      try {
        const callback1 = (cb1: window.RectChangeOptions) => {
          console.log(caseName + ' cb1: ' + JSON.stringify(cb1));
          timer1++;
        };
        windowClass.on('rectChangeInGlobalDisplay', callback1);
        const callback2 = (cb2: window.RectChangeOptions) => {
          console.log(caseName + ' cb2: ' + JSON.stringify(cb2));
          timer2++;
        };
        windowClass.on('rectChangeInGlobalDisplay', callback2);
        windowClass.moveWindowToAsync(50, 50);
        await sleep(200);
        console.log(caseName + ' before off, timer1: ' + timer1);
        console.log(caseName + ' before off, timer2: ' + timer2);
        if (isFreeWindowMode == true) {
          expect(timer1).assertEqual(1);
          expect(timer2).assertEqual(1);
        } else {
          expect(timer1).assertEqual(0);
          expect(timer2).assertEqual(0);
        }

        windowClass.off('rectChangeInGlobalDisplay');
        windowClass.moveWindowToAsync(30, 30);
        await sleep(200);
        console.log(caseName + ' after off, timer1: ' + timer1);
        console.log(caseName + ' after off, timer2: ' + timer2);
        if (isFreeWindowMode == true) {
          expect(timer1).assertEqual(1);
          expect(timer2).assertEqual(1);
        } else {
          expect(timer1).assertEqual(0);
          expect(timer2).assertEqual(0);
        }

        await terminateAbility(caseName);
        done();
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        windowClass.off('rectChangeInGlobalDisplay');
        await terminateAbility(caseName);
        if (err.code == 801) {
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testOnandOffRectChangeInGlobalDisplaywithDestoryedMainWindow
     * @tc.number SUB_BASIC_WMS_FUNCTION_ON_GLOBAL_RECT_0600
     * @tc.desc   验证主窗销毁后调用on(type: 'rectChangeInGlobalDisplay')接口
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnandOffRectChangeInGlobalDisplaywithDestoryedMainWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testOnandOffRectChangeInGlobalDisplaywithDestoryedMainWindow';
      console.log(caseName + 'begin.');
      let windowStageStart = await startAbility(caseName, context);
      let windowClass = windowStageStart.getMainWindowSync();
      await windowClass.destroyWindow();
      let timer1 = 0;
      try {
        const callback1 = (cb1: window.RectChangeOptions) => {
          console.log(caseName + ' cb1: ' + JSON.stringify(cb1));
          timer1++;
        };
        windowClass.on('rectChangeInGlobalDisplay', callback1);
        console.log(caseName + ' timer1: ' + timer1);
        await terminateAbility(caseName);
        done();
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        await terminateAbility(caseName);
        if (err.code == 801) {
          done()
        } else {
          expect(err.code).assertEqual(1300002)
          done();
        }
      }
    })

    /**
     * @tc.name   testOnandOffRectChangeInGlobalDisplaywithSubWindow
     * @tc.number SUB_BASIC_WMS_FUNCTION_ON_GLOBAL_RECT_0700
     * @tc.desc   验证子窗on(type: 'rectChangeInGlobalDisplay')接口注册多次解注册其中一个
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnandOffRectChangeInGlobalDisplaywithSubWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testOnandOffRectChangeInGlobalDisplaywithSubWindow';
      console.log(caseName + 'begin.');
      let subWindowClass = await windowStage.createSubWindow('testOnandOffRectChangeInGlobalDisplaywithSubWindow');
      await sleep(200);
      await subWindowClass.setUIContent('testability/pages/First/index2');
      await subWindowClass.showWindow();
      await sleep(300);
      let timer1 = 0;
      try {
        const callback1 = (cb1: window.RectChangeOptions) => {
          console.log(caseName + ' cb1: ' + JSON.stringify(cb1));
          timer1++;
        };
        subWindowClass.on('rectChangeInGlobalDisplay', callback1);
        subWindowClass.moveWindowToAsync(30, 30);
        await sleep(200);
        console.log(caseName + ' timer1: ' + timer1);
        expect(timer1).assertEqual(1);
        subWindowClass.off('rectChangeInGlobalDisplay', callback1);
        subWindowClass.moveWindowToAsync(50, 50);
        await sleep(200);
        console.log(caseName + ' after off, timer1: ' + timer1);
        expect(timer1).assertEqual(1);
        await subWindowClass.destroyWindow();
        done();
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        await subWindowClass.destroyWindow();
        if (err.code == 801) {
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testOnandOffRectChangeInGlobalDisplaywithDialogWindow
     * @tc.number SUB_BASIC_WMS_FUNCTION_ON_GLOBAL_RECT_0800
     * @tc.desc   验证dialog窗on(type: 'rectChangeInGlobalDisplay')接口注册多次解注册其中一个
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnandOffRectChangeInGlobalDisplaywithDialogWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testOnandOffRectChangeInGlobalDisplaywithDialogWindow';
      console.log(caseName + 'begin.');
      let config: window.Configuration = {
        name: "testOnandOffRectChangeInGlobalDisplaywithSubWindow",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      };
      let subWindowClass = await window.createWindow(config);
      await sleep(200);
      await subWindowClass.setUIContent('testability/pages/First/index2');
      await subWindowClass.showWindow();
      await sleep(300);
      let timer1 = 0;
      try {
        const callback1 = (cb1: window.RectChangeOptions) => {
          console.log(caseName + ' cb1: ' + JSON.stringify(cb1));
          timer1++;
        };
        subWindowClass.on('rectChangeInGlobalDisplay', callback1);
        subWindowClass.moveWindowToAsync(30, 30);
        await sleep(200);
        console.log(caseName + ' timer1: ' + timer1);
        expect(timer1).assertEqual(1);
        subWindowClass.off('rectChangeInGlobalDisplay', callback1);
        subWindowClass.moveWindowToAsync(50, 50);
        await sleep(200);
        console.log(caseName + ' after off, timer1: ' + timer1);
        expect(timer1).assertEqual(1);
        await subWindowClass.destroyWindow();
        done();
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        await subWindowClass.destroyWindow();
        if (err.code == 801) {
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testMoveWindowToGlobalDisplay
     * @tc.number SUB_BASIC_WMS_FUNCTION_MOVE_WINDOW_TO_GLOBAL_RECT_0100
     * @tc.desc   验证moveWindowToGlobalDisplay移动窗口位置正常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMoveWindowToGlobalDisplay', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testMoveWindowToGlobalDisplay';
      console.log(caseName + 'begin.');
      let windowStageStart = await startAbility(caseName, context);
      let windowClass = windowStageStart.getMainWindowSync();
      let timer1 = 0;
      let timer2 = 0;
      try {
        let cbData1: window.RectChangeOptions | undefined;
        let cbData2: window.RectChangeOptions | undefined;
        const callback1 = (cb1: window.RectChangeOptions) => {
          console.log(caseName + ' cb1: ' + JSON.stringify(cb1));
          cbData1 = cb1;
          timer1++;
        };
        const callback2 = (cb2: window.RectChangeOptions) => {
          console.log(caseName + ' cb2: ' + JSON.stringify(cb2));
          cbData2 = cb2;
          timer2++;
        };
        windowClass.on('rectChangeInGlobalDisplay', callback1);
        windowClass.on('windowRectChange', callback2);
        await windowClass.moveWindowToGlobalDisplay(30, 30);
        await sleep(200)
        console.log(caseName + ' timer1: ' + timer1);
        console.log(caseName + ' timer2: ' + timer2);
        if (isFreeWindowMode == true) {
          expect(timer1).assertEqual(1);
          expect(timer2).assertEqual(1);
          expect(cbData1?.rect.left).assertEqual(cbData2?.rect.left);
          expect(cbData1?.rect.top).assertEqual(cbData2?.rect.top);
          expect(cbData1?.rect.width).assertEqual(cbData2?.rect.width);
          expect(cbData1?.rect.height).assertEqual(cbData2?.rect.height);
        } else {
          expect(timer1).assertEqual(0);
          expect(timer2).assertEqual(0);
        }

        windowClass.off('rectChangeInGlobalDisplay');
        windowClass.off('windowRectChange');
        await terminateAbility(caseName);
        done();
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        windowClass.off('rectChangeInGlobalDisplay');
        windowClass.off('windowRectChange');
        await terminateAbility(caseName);
        if (err.code == 801 || err.code == 1300010) {
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testMoveWindowToGlobalDisplaywithDestoryedWindow
     * @tc.number SUB_BASIC_WMS_FUNCTION_MOVE_WINDOW_TO_GLOBAL_RECT_0200
     * @tc.desc   验证moveWindowToGlobalDisplay接口窗口状态异常调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMoveWindowToGlobalDisplaywithDestoryedWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testMoveWindowToGlobalDisplaywithDestoryedWindow';
      console.log(caseName + 'begin.');
      let windowClass = await windowStage.createSubWindow('testMoveWindowToGlobalDisplaywithDestoryedWindow')
      await windowClass.destroyWindow();
      try {
        await windowClass.moveWindowToGlobalDisplay(30, 30);
        await sleep(200);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(1300002);
        done();
      }
    })

    /**
     * @tc.name   testMoveWindowToGlobalDisplaywithDifferentWindowMode
     * @tc.number SUB_BASIC_WMS_FUNCTION_MOVE_WINDOW_TO_GLOBAL_RECT_0200
     * @tc.desc   验证moveWindowToGlobalDisplay接口全屏窗口调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMoveWindowToGlobalDisplaywithDifferentWindowMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testMoveWindowToGlobalDisplaywithDifferentWindowMode';
      console.log(caseName + 'begin.');
      let windowStageStart = await startAbility(caseName, context);
      let windowClass = windowStageStart.getMainWindowSync();
      try {
        let windowStatus = windowClass.getWindowStatus();
        console.log(caseName + ' windowStatus: ' + JSON.stringify(windowStatus));
        if (windowStatus == window.WindowStatusType.FLOATING) {
          await windowClass.moveWindowToGlobalDisplay(100, 100);
          await sleep(200);
          await windowClass.maximize();
          await sleep(200);
          let windowStatus2 = windowClass.getWindowStatus();
          console.log(caseName + ' windowStatus2: ' + JSON.stringify(windowStatus2));
          expect(windowStatus2).assertEqual(window.WindowStatusType.FULL_SCREEN);
          await windowClass.moveWindowToGlobalDisplay(100, 100);
          await sleep(200);
          await windowClass.maximize(window.MaximizePresentation.ENTER_IMMERSIVE);
          await sleep(200);
          let windowStatus3 = windowClass.getWindowStatus();
          console.log(caseName + ' windowStatus3: ' + JSON.stringify(windowStatus3));
          expect(windowStatus3).assertEqual(window.WindowStatusType.MAXIMIZE);
          await windowClass.moveWindowToGlobalDisplay(100, 100);
          await sleep(200);
          await terminateAbility(caseName);
          expect().assertFail();
          done();
        } else {
          await windowClass.moveWindowToGlobalDisplay(100, 100);
          await sleep(200);
          await terminateAbility(caseName);
          expect().assertFail();
          done();
        }
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        await terminateAbility(caseName);
        if (err.code == 801) {
          done()
        } else {
          expect(err.code).assertEqual(1300010);
          done();
        }
      }
    })

    /**
     * @tc.name   testMoveWindowToGlobalDisplaywithPositionOutofRange
     * @tc.number SUB_BASIC_WMS_FUNCTION_MOVE_WINDOW_TO_GLOBAL_RECT_0300
     * @tc.desc   验证moveWindowToGlobalDisplay接口入参越界测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMoveWindowToGlobalDisplaywithPositionOutofRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testMoveWindowToGlobalDisplaywithPositionOutofRange';
      console.log(caseName + 'begin.');
      let windowStageStart = await startAbility(caseName, context);
      let windowClass = windowStageStart.getMainWindowSync();
      try {
        const maxInt = 2 ** 31 - 1;
        await windowClass.moveWindowToGlobalDisplay(maxInt, maxInt);
        await sleep(200);
        await terminateAbility(caseName);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        await terminateAbility(caseName);
        if (err.code == 801 || err.code == 1300010) {
          done()
        } else {
          expect(err.code).assertEqual(1300016);
          done();
        }
      }
    })

    /**
     * @tc.name   testClientToGlobalDisplayandGlobalDisplayToClient
     * @tc.number SUB_BASIC_WMS_FUNCTION_CLIENT_AND_GLOBAL_DISPLAY_CHANGE_0100
     * @tc.desc   验证组件相对主窗和主屏的接口坐标转化场景
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClientToGlobalDisplayandGlobalDisplayToClient', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testClientToGlobalDisplayandGlobalDisplayToClient';
      console.log(caseName + 'begin.');
      let subWindowClass = await windowStage.createSubWindow('testClientToGlobalDisplayandGlobalDisplayToClient')
      await sleep(200);
      await subWindowClass.setUIContent('testability/pages/First/index2');
      await subWindowClass.showWindow();
      await sleep(300)
      try {
        let globalRect = subWindowClass.getWindowProperties().globalDisplayRect;
        console.log(caseName + ' globalRect: ' + JSON.stringify(globalRect));
        let position = subWindowClass.clientToGlobalDisplay(100, 100);
        console.log(caseName + ' position: ' + JSON.stringify(position));
        let position2 = subWindowClass.globalDisplayToClient(position.x, position.y);
        console.log(caseName + ' position2: ' + JSON.stringify(position2));
        expect(position2.x).assertEqual(100);
        expect(position2.y).assertEqual(100);
        await subWindowClass.destroyWindow()
        done();
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        await subWindowClass.destroyWindow()
        if (err.code == 801) {
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testClientToGlobalDisplaywithDestoryedWindow
     * @tc.number SUB_BASIC_WMS_FUNCTION_CLIENT_AND_GLOBAL_DISPLAY_CHANGE_0200
     * @tc.desc   验证clientToGlobalDisplay接口窗口异常状态调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClientToGlobalDisplaywithDestoryedWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testClientToGlobalDisplaywithDestoryedWindow';
      console.log(caseName + 'begin.');
      let windowClass = await windowStage.createSubWindow('testMoveWindowToGlobalDisplaywithDestoryedWindow')
      await windowClass.destroyWindow();
      try {
        let position = windowClass.clientToGlobalDisplay(100, 100);
        console.log(caseName + ' position: ' + JSON.stringify(position));
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(1300002)
        done();
      }
    })

    /**
     * @tc.name   testClientToGlobalDisplaywithPositionOutofRange
     * @tc.number SUB_BASIC_WMS_FUNCTION_CLIENT_AND_GLOBAL_DISPLAY_CHANGE_0300
     * @tc.desc   验证clientToGlobalDisplay接口入参越界
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClientToGlobalDisplaywithPositionOutofRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testClientToGlobalDisplaywithPositionOutofRange';
      console.log(caseName + 'begin.');
      let windowClass = await windowStage.createSubWindow('testClientToGlobalDisplaywithPositionOutofRange')
      await windowClass.setUIContent('testability/pages/First/index2');
      await windowClass.showWindow();
      windowClass.moveWindowToAsync(50, 50);
      await sleep(1000);
      try {
        const maxInt = 2 ** 31 - 1;
        let position = windowClass.clientToGlobalDisplay(maxInt, maxInt);
        console.log(caseName + ' position: ' + JSON.stringify(position));
        await windowClass.destroyWindow();
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        await windowClass.destroyWindow();
        if (err.code == 801) {
          done()
        } else {
          expect(err.code).assertEqual(1300016)
          done();
        }
      }
    })

    /**
     * @tc.name   testGlobalDisplayToClientwithDestroyedWindow
     * @tc.number SUB_BASIC_WMS_FUNCTION_CLIENT_AND_GLOBAL_DISPLAY_CHANGE_0400
     * @tc.desc   验证globalDisplayToClient接口窗口异常状态调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGlobalDisplayToClientwithDestroyedWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testGlobalDisplayToClientwithDestroyedWindow';
      console.log(caseName + 'begin.');
      let windowClass = await windowStage.createSubWindow('testGlobalDisplayToClientwithDestroyedWindow')
      await windowClass.destroyWindow()
      try {
        let position = windowClass.globalDisplayToClient(100, 100);
        console.log(caseName + ' position: ' + JSON.stringify(position));
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(1300002)
        done()
      }
    })

    /**
     * @tc.name   testOffRectChangeInGlobalDisplaywithDestroyedSubwindow
     * @tc.number SUB_BASIC_WMS_OFF_RECT_CHANGE_IN_GLOBAL_DISPLAY_WITH_DESTROYED_SUBWINDOW
     * @tc.desc   验证销毁后的子窗调用OffRectChangeInGlobalDisplay接口抛1300002错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOffRectChangeInGlobalDisplaywithDestroyedSubwindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testOffRectChangeInGlobalDisplaywithDestroyedSubwindow';
      console.log(caseName + 'begin.');
      let windowClass = await windowStage.createSubWindow('testOffRectChangeInGlobalDisplaywithDestroyedSubwindow')
      await windowClass.destroyWindow()
      try {
        windowClass.off('rectChangeInGlobalDisplay')
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(1300002)
        done()
      }
    })

    /**
     * @tc.name   testGlobalDisplayToClientwithOutofRange
     * @tc.number SUB_BASIC_WMS_GLOBAL_DISPLAY_TO_CLIENT_WITH_INVAILD_PARAMETERS
     * @tc.desc   验证子窗调用globalDisplayToClient入参超出int值抛1300016错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGlobalDisplayToClientwithOutofRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGlobalDisplayToClientwithOutofRange';
      console.log(caseName + 'begin.');
      let windowClass = await windowStage.createSubWindow('testGlobalDisplayToClientwithOutofRange')
      await sleep(200);
      await windowClass.setUIContent('testability/pages/First/index2');
      await windowClass.showWindow();
      await sleep(200)
      await windowClass.moveWindowTo(-50, -50);
      await sleep(200);
      try {
        const maxInt = 2 ** 31 - 1;
        windowClass.globalDisplayToClient(maxInt, maxInt);
        await windowClass.destroyWindow()
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        await windowClass.destroyWindow();
        if (err.code == 801) {
          done()
        } else {
          expect(err.code).assertEqual(1300016)
          done()
        }
      }
    })

    /**
     * @tc.name   testSetContentAspectRatio_0100
     * @tc.number SUB_BASIC_WMS_SET_CONTENT_ASPECTRATIO_0100
     * @tc.desc   loadcontent前设置宽高比，标题栏按照默认37vp生效
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetContentAspectRatio_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetContentAspectRatio_0100';
      console.log(caseName + 'begin.');
      let windowStageStart = await startAbility4(caseName, context);
      try {
        let windowClass = windowStageStart.getMainWindowSync();
        let windowStatus = windowClass.getWindowStatus();
        console.log(caseName + ' windowStatus: ' + JSON.stringify(windowStatus));
        if (windowStatus != window.WindowStatusType.FLOATING) {
          await windowClass.recover();
        }
        await windowClass.setContentAspectRatio(1.0, false, true);
        await sleep(200);
        let storage: LocalStorage = new LocalStorage();
        await windowClass.loadContent('testability/pages/First/index2', storage);
        await sleep(200);
        let drawableRect = windowClass.getWindowProperties().drawableRect;
        console.log(caseName + ' drawableRect: ' + JSON.stringify(drawableRect));
        if (isFreeWindowMode == true) {
          expect(Math.abs(drawableRect.width - drawableRect.height)).assertEqual(0)
          let windowDecHeight = windowClass.getWindowDecorHeight();
          console.log(caseName + ' windowDecHeight: ' + JSON.stringify(windowDecHeight));
          expect(windowDecHeight).assertEqual(37)
          await terminateAbility4(caseName);
          done();
        } else {
          expect(Math.abs(drawableRect.width - drawableRect.height)).assertLarger(0)
          await terminateAbility4(caseName);
          done();
        }

      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        await terminateAbility4(caseName)
        if (err.code == 801) {
          done()
        } else {
          expect().assertFail();
          done()
        }
      }
    })

    /**
     * @tc.name   testSetContentAspectRatio_0200
     * @tc.number SUB_BASIC_WMS_SET_CONTENT_ASPECTRATIO_0200
     * @tc.desc   应用退后台后设置新的比例
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetContentAspectRatio_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetContentAspectRatio_0200';
      console.log(caseName + 'begin.');
      if (isPCStatus != '') {
        let windowStageStart = await startAbility(caseName, context);
        try {
          let windowClass = windowStageStart.getMainWindowSync();
          await windowClass.setContentAspectRatio(1.2, false, true);
          await sleep(200);
          let drawableRect1 = windowClass.getWindowProperties().drawableRect;
          console.log(caseName + ' drawableRect1: ' + JSON.stringify(drawableRect1));
          let height1 = Math.round(drawableRect1.width / 1.2);
          console.log(caseName + ' height1: ' + height1);
          expect(Math.abs(height1 - drawableRect1.height)).assertLessOrEqual(3);
          await windowClass.minimize();
          await sleep(200);
          await windowClass.setContentAspectRatio(1.5, true, false);
          await sleep(200);
          let drawableRect2 = windowClass.getWindowProperties().drawableRect;
          console.log(caseName + ' drawableRect2: ' + JSON.stringify(drawableRect2));
          await windowClass.restore();
          await sleep(200);
          let drawableRect3 = windowClass.getWindowProperties().drawableRect;
          console.log(caseName + ' drawableRect3: ' + JSON.stringify(drawableRect3));
          let height3 = Math.round(drawableRect3.width / 1.2);
          console.log(caseName + ' height3: ' + height3);
          expect(Math.abs(height3 - drawableRect3.height)).assertLessOrEqual(3);
          let driver = await Driver.create();
          await sleep(200)
          let windowPoint = await windowClass.getWindowProperties().windowRect
          console.info(`${caseName} windowPoint = ${JSON.stringify(windowPoint)}`)
          await driver.mouseMoveTo({ x: windowPoint.left + Math.ceil(windowPoint.width / 2), y: windowPoint.top })
          await sleep(2000)
          await driver.mouseDrag({ x: windowPoint.left + Math.ceil(windowPoint.width / 2), y: windowPoint.top }, { x: windowPoint.left + Math.ceil(windowPoint.width / 2), y: windowPoint.top + 100 }, 2000)
          await sleep(1000)
          let drawableRect4 = windowClass.getWindowProperties().drawableRect;
          console.log(caseName + ' drawableRect4: ' + JSON.stringify(drawableRect4));
          let height4 = Math.round(drawableRect4.width / 1.5);
          console.log(caseName + ' height4: ' + height4);
          expect(Math.abs(height4 - drawableRect4.height)).assertLessOrEqual(3);
          await windowClass.resetAspectRatio();
          await sleep(200)
          await terminateAbility(caseName);
          done();
        } catch (err) {
          console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
          await terminateAbility(caseName)
          expect().assertFail();
          done()
        }
      } else {
        done()
      }
    })

    /**
     * @tc.name   testSetContentAspectRatio_0300
     * @tc.number SUB_BASIC_WMS_SET_CONTENT_ASPECTRATIO_0300
     * @tc.desc   setContentAspetRatio接口参数取值类型覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetContentAspectRatio_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetContentAspectRatio_0300';
      console.log(caseName + 'begin.');
      if (isPCStatus != '') {
        let windowStageStart = await startAbility(caseName + '_1', context);
        try {
          let windowClass = windowStageStart.getMainWindowSync();
          await windowClass.setContentAspectRatio(1.2, true, true);
          await sleep(200);
          let driver = await Driver.create();
          await sleep(200)
          let windowPoint = await windowClass.getWindowProperties().windowRect
          console.info(`${caseName} windowPoint = ${JSON.stringify(windowPoint)}`)
          await driver.mouseMoveTo({ x: windowPoint.left + Math.ceil(windowPoint.width / 2), y: windowPoint.top })
          await sleep(2000)
          await driver.mouseDrag({ x: windowPoint.left + Math.ceil(windowPoint.width / 2), y: windowPoint.top },
            { x: windowPoint.left + Math.ceil(windowPoint.width / 2), y: windowPoint.top + 100 }, 2000)
          await sleep(1000)
          let drawableRect1 = windowClass.getWindowProperties().drawableRect;
          console.log(caseName + ' drawableRect1: ' + JSON.stringify(drawableRect1));
          let height1 = Math.round(drawableRect1.width / 1.2);
          console.log(caseName + ' height1: ' + height1);
          expect(Math.abs(height1 - drawableRect1.height)).assertLessOrEqual(3);
          await windowClass.minimize();
          await sleep(200);
          await windowClass.setContentAspectRatio(1.5, true, false);
          await sleep(200);
          let drawableRect2 = windowClass.getWindowProperties().drawableRect;
          console.log(caseName + ' drawableRect2: ' + JSON.stringify(drawableRect2));
          await windowClass.restore();
          await sleep(200);
          let drawableRect3 = windowClass.getWindowProperties().drawableRect;
          console.log(caseName + ' drawableRect3: ' + JSON.stringify(drawableRect3));
          let height3 = Math.round(drawableRect3.width / 1.2);
          console.log(caseName + ' height3: ' + height3);
          expect(Math.abs(height3 - drawableRect3.height)).assertLessOrEqual(3);
          let windowPoint2 = await windowClass.getWindowProperties().windowRect
          console.info(`${caseName} windowPoint = ${JSON.stringify(windowPoint2)}`)
          await driver.mouseMoveTo({ x: windowPoint2.left + Math.ceil(windowPoint2.width / 2), y: windowPoint2.top })
          await sleep(2000)
          await driver.mouseDrag({ x: windowPoint2.left + Math.ceil(windowPoint2.width / 2), y: windowPoint2.top },
            { x: windowPoint2.left + Math.ceil(windowPoint2.width / 2), y: windowPoint2.top + 100 }, 2000)
          await sleep(1000)

          let drawableRect4 = windowClass.getWindowProperties().drawableRect;
          console.log(caseName + ' drawableRect4: ' + JSON.stringify(drawableRect4));
          let height4 = Math.round(drawableRect4.width / 1.5);
          console.log(caseName + ' height4: ' + height4);
          expect(Math.abs(height4 - drawableRect4.height)).assertLessOrEqual(3);
          await windowClass.resetAspectRatio();
          await sleep(200)
          await terminateAbility(caseName);
          done();
        } catch (err) {
          console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
          await terminateAbility(caseName)
          expect().assertFail();
          done()
        }
      } else {
        done()
      }
    })

    /**
     * @tc.name   testSetContentAspectRatio_0400
     * @tc.number SUB_BASIC_WMS_SET_CONTENT_ASPECTRATIO_0500
     * @tc.desc   setContentAspectRatio错误码校验1300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetContentAspectRatio_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetContentAspectRatio_0400';
      console.log(caseName + 'begin.');
      let subWindowClass: window.Window | undefined;
      try {
        subWindowClass = await windowStage.createSubWindow('testSetContentAspectRatio_0400');
        await sleep(200);
        await subWindowClass.setUIContent('testability/pages/First/index2');
        await subWindowClass.showWindow();
        await subWindowClass.setContentAspectRatio(1.0, false, false);
        console.log(`${caseName} sub window setContentAspectRatio succeed. `);
        await subWindowClass?.destroyWindow()
        expect().assertFail();
        done()
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        await subWindowClass?.destroyWindow()
        if (err.code == 801) {
          done()
        } else {
          expect(err.code).assertEqual(1300004);
        }
      }

      let dialogWindowClass: window.Window | undefined;
      let config: window.Configuration = {
        name: "testSetContentAspectRatio_0400_dialog_window",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      };
      try {
        dialogWindowClass = await window.createWindow(config);
        await sleep(200);
        await dialogWindowClass.setUIContent('testability/pages/First/index2');
        await dialogWindowClass.showWindow();
        await dialogWindowClass.setContentAspectRatio(1.0, false);
        console.log(`${caseName} dialog window setContentAspectRatio succeed. `);
        await dialogWindowClass?.destroyWindow()
        expect().assertFail();
        done()
      } catch (err) {
        console.error(`${caseName} failed2, err: ${JSON.stringify(err)}`);
        await dialogWindowClass?.destroyWindow()
        if (err.code == 801) {
          done()
        } else {
          expect(err.code).assertEqual(1300004);
          done()
        }
      }
    })

    /**
     * @tc.name   testSetContentAspectRatio_0500
     * @tc.number SUB_BASIC_WMS_SET_CONTENT_ASPECTRATIO_0600
     * @tc.desc   setContentAspectRatio错误码校验1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetContentAspectRatio_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testSetContentAspectRatio_0500';
      console.log(caseName + 'begin.');
      let windowStageStart = await startAbility(caseName, context);
      try {
        let windowClass = windowStageStart.getMainWindowSync();
        let windowLimits = windowClass.getWindowLimits();
        console.log(caseName + ' windowLimits: ' + JSON.stringify(windowLimits));
        let decorHeight = windowClass.getWindowDecorHeight();
        console.log(caseName + ' decorHeight: ' + JSON.stringify(decorHeight));
        let minRatio = windowLimits.minWidth as number / (windowLimits.maxHeight as number - decorHeight);
        console.log(caseName + ' minRatio: ' + JSON.stringify(minRatio));
        let maxRatio = windowLimits.maxWidth as number / (windowLimits.minWidth as number - decorHeight);
        console.log(caseName + ' maxRatio: ' + JSON.stringify(maxRatio));
        await windowClass.setContentAspectRatio(maxRatio + 0.1);
        await windowClass.setContentAspectRatio(-1);
        await windowClass.setContentAspectRatio(0);
        await terminateAbility(caseName);
        expect().assertFail();
        done()
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        await terminateAbility(caseName);
        if (err.code == 801) {
          done()
        } else {
          expect(err.code).assertEqual(1300016);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetContentAspectRatio_0600
     * @tc.number SUB_BASIC_WMS_SET_CONTENT_ASPECTRATIO_0700
     * @tc.desc   setContentAspectRatio全屏调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetContentAspectRatio_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetContentAspectRatio_0600';
      console.log(caseName + 'begin.');
      if (isFreeWindowMode == true) {
        let windowStageStart = await startAbility(caseName, context);
        try {
          let windowClass = windowStageStart.getMainWindowSync();
          let windowLimits = windowClass.getWindowLimits();
          console.log(caseName + ' windowLimits: ' + JSON.stringify(windowLimits));
          await windowClass.maximize();
          await sleep(200);
          let drawableRect = windowClass.getWindowProperties().drawableRect;
          console.log(caseName + ' drawableRect: ' + JSON.stringify(drawableRect));
          let ratio = drawableRect.width / drawableRect.height;
          console.log(caseName + ' ratio: ' + JSON.stringify(ratio));
          await windowClass.setContentAspectRatio(1.0);
          let drawableRect2 = windowClass.getWindowProperties().drawableRect;
          console.log(caseName + ' drawableRect2: ' + JSON.stringify(drawableRect2));
          let ratio2 = drawableRect2.width / drawableRect2.height;
          console.log(caseName + ' ratio2: ' + JSON.stringify(ratio2));
          expect(ratio).assertEqual(ratio2)
          await terminateAbility(caseName);
          done()
        } catch (err) {
          console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
          await terminateAbility(caseName);
          expect().assertFail();
          done();
        }
      } else {
        done()
      }
    })

    /**
     * @tc.name   testEnumPixelUnit
     * @tc.number testEnumPixelUnit
     * @tc.desc   testEnumPixelUnit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnumPixelUnit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testEnumPixelUnit';
      console.log(caseName + 'begin.');
      try {
        console.log(caseName + ' PixelUnit: ' + JSON.stringify(window.PixelUnit))
        expect(window.PixelUnit.PX).assertEqual(0);
        expect(window.PixelUnit.VP).assertEqual(1);
        done();
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testEnumOcclusionState
     * @tc.number testEnumOcclusionState
     * @tc.desc   testEnumOcclusionState
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnumOcclusionState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testEnumOcclusionState';
      console.log(caseName + 'begin.');
      try {
        console.log(caseName + ' OcclusionState: ' + JSON.stringify(window.OcclusionState))
        expect(window.OcclusionState.NO_OCCLUSION).assertEqual(0);
        expect(window.OcclusionState.PARTIAL_OCCLUSION).assertEqual(1);
        expect(window.OcclusionState.FULL_OCCLUSION).assertEqual(2);
        done();
      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_BASIC_WMS_TEST_WINDOW_LIMIT_VP_0100
     * @tc.name       testGetWindowLimitsVPwithFloatWindow
     * @tc.desc       testGetWindowLimitsVPwithFloatWindow
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testGetWindowLimitsVPwithFloatWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testGetWindowLimitsVPwithFloatWindow';
      console.log(caseName + 'begin');
      let subWindowClass: window.Window | undefined;
      let config: window.Configuration = {
        name: "testGetWindowLimitsVPwithFloatWindow",
        windowType: window.WindowType.TYPE_FLOAT,
        ctx: context
      };
      let canIUseRes = canIUse('SystemCapability.Window.SessionManager');
      console.log(`${caseName} canIUse SystemCapability.Window.SessionManager: ${canIUseRes}`);
      try {
        window.createWindow(config).then(async (data) => {
          subWindowClass = data;
          await subWindowClass.setUIContent('testability/pages/Index2');
          await subWindowClass.showWindow();
          let windowLimits = subWindowClass.getWindowLimits();
          console.log(`${caseName} windowLimits: ${JSON.stringify(windowLimits)}`);
          if (canIUseRes) {
            expect(windowLimits.minWidth).assertEqual(1)
            expect(windowLimits.minHeight).assertEqual(1)
          }
          await subWindowClass?.destroyWindow();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(`${caseName} Failed in showWindow. Cause code: ${err.code}, message: ${err.message}`);
          await subWindowClass?.destroyWindow();
          if (canIUseRes) {
            expect(err.code).assertEqual(1300002)
          } else {
            expect(err.code).assertEqual(801)
          }
          done()
        });
      } catch (err) {
        console.error(`${caseName} :Failed. Cause code: ${err.code}, message: ${err.message}`);
        await subWindowClass?.destroyWindow();
        expect().assertFail();
        done()
      }
    });

    /**
     * @tc.number     SUB_BASIC_WMS_TEST_WINDOW_LIMIT_VP_0200
     * @tc.name       testGetWindowLimitsVPwithDialogWindow
     * @tc.desc       testGetWindowLimitsVPwithDialogWindow
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testGetWindowLimitsVPwithDialogWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testGetWindowLimitsVPwithDialogWindow';
      console.log(caseName + 'begin');
      let subWindowClass: window.Window | undefined;
      let config: window.Configuration = {
        name: "testGetWindowLimitsVPwithDialogWindow",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      };
      let canIUseRes = canIUse('SystemCapability.Window.SessionManager');
      console.log(`${caseName} canIUse SystemCapability.Window.SessionManager: ${canIUseRes}`);
      try {
        subWindowClass = await window.createWindow(config);
        await subWindowClass.setUIContent('testability/pages/Index2');
        await subWindowClass.showWindow();
        let windowLimits = subWindowClass.getWindowLimitsVP();
        console.log(`${caseName} windowLimits: ${JSON.stringify(windowLimits)}`);
        if (canIUseRes) {
          expect(windowLimits.minWidth).assertLarger(1)
          expect(windowLimits.minHeight).assertLarger(1)
        }
        await subWindowClass?.destroyWindow();
        done()
      } catch (err) {
        console.error(`${caseName} :Failed. Cause code: ${err.code}, message: ${err.message}`);
        await subWindowClass?.destroyWindow();
        if (!canIUseRes) {
          expect(err.code).assertEqual(801)
          done()
        } else {
          expect().assertFail();
          done()
        }
      }
    });

    /**
     * @tc.number     SUB_BASIC_WMS_TEST_WINDOW_LIMIT_VP_0300
     * @tc.name       testGetWindowLimitsVPwithDestoryedWindow
     * @tc.desc       testGetWindowLimitsVPwithDestoryedWindow
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testGetWindowLimitsVPwithDestoryedWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testGetWindowLimitsVPwithDestoryedWindow';
      console.log(caseName + 'begin');
      let subWindowClass: window.Window | undefined;
      let config: window.Configuration = {
        name: "testGetWindowLimitsVPwithDestoryedWindow",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      };
      let canIUseRes = canIUse('SystemCapability.Window.SessionManager');
      console.log(`${caseName} canIUse SystemCapability.Window.SessionManager: ${canIUseRes}`);
      subWindowClass = await window.createWindow(config);
      await subWindowClass.setUIContent('testability/pages/Index2');
      await subWindowClass.showWindow();
      await subWindowClass.destroyWindow();
      try {
        let windowLimits = subWindowClass.getWindowLimitsVP();
        console.log(`${caseName} windowLimits: ${JSON.stringify(windowLimits)}`);
        expect().assertFail();
        done()
      } catch (err) {
        console.error(`${caseName} :Failed. Cause code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(1300002);
        done();
      }
    });

    /**
     * @tc.number     SUB_BASIC_WMS_TEST_WINDOW_LIMIT_VP_0400
     * @tc.name       testGetWindowLimitsVPSetWindowLimitsVP
     * @tc.desc       testGetWindowLimitsVPSetWindowLimitsVP
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testGetWindowLimitsVPSetWindowLimitsVP', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testGetWindowLimitsVPSetWindowLimitsVP';
      console.log(caseName + 'begin');
      let windowClass: window.Window | undefined;
      let windowStageStart = await startAbility5(caseName, context);
      let canIUseRes = canIUse('SystemCapability.Window.SessionManager');
      console.log(`${caseName} canIUse SystemCapability.Window.SessionManager: ${canIUseRes}`);
      try {
        windowClass = windowStageStart.getMainWindowSync();
        await windowClass?.setUIContent('testability/pages/Index2');
        await windowClass?.showWindow();
        let windowLimits = windowClass?.getWindowLimitsVP();
        console.log(`${caseName} windowLimits: ${JSON.stringify(windowLimits)}`);
        let setWindowLimits: window.WindowLimits = {
          minWidth: windowLimits.minWidth as number + 10,
          minHeight: windowLimits.minHeight as number + 10,
          maxWidth: windowLimits.maxWidth as number - 10,
          maxHeight: windowLimits.maxHeight as number - 10,
          pixelUnit: window.PixelUnit.VP
        }
        await windowClass?.setWindowLimits(setWindowLimits);
        let windowLimits2 = windowClass?.getWindowLimitsVP();
        console.log(`${caseName} windowLimits2: ${JSON.stringify(windowLimits2)}`);

        if (canIUseRes) {
          expect(windowLimits2.minWidth).assertEqual(setWindowLimits.minWidth)
          expect(windowLimits2.minHeight).assertEqual(setWindowLimits.minHeight)
          expect(windowLimits2.maxWidth).assertEqual(setWindowLimits.maxWidth)
          expect(windowLimits2.maxHeight).assertEqual(setWindowLimits.maxHeight)
        }
        await terminateAbility5(caseName);
        done()
      } catch (err) {
        console.error(`${caseName} :Failed. Cause code: ${err.code}, message: ${err.message}`);
        await windowClass?.destroyWindow();
        await terminateAbility5(caseName);
        if (err.code === 801) {
          done()
        } else {
          expect().assertFail();
          done()
        }
      }
    });

    /**
     * @tc.number     SUB_BASIC_WMS_TEST_WINDOW_LIMIT_VP_0500
     * @tc.name       testGetWindowLimitsVPSetWindowLimitsPX
     * @tc.desc       testGetWindowLimitsVPSetWindowLimitsPX
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testGetWindowLimitsVPSetWindowLimitsPX', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testGetWindowLimitsVPSetWindowLimitsPX';
      console.log(caseName + 'begin');
      let windowClass: window.Window | undefined;
      let windowStageStart = await startAbility5(caseName, context);
      let canIUseRes = canIUse('SystemCapability.Window.SessionManager');
      console.log(`${caseName} canIUse SystemCapability.Window.SessionManager: ${canIUseRes}`);
      try {
        windowClass = windowStageStart.getMainWindowSync();
        await windowClass?.setUIContent('testability/pages/Index2');
        await windowClass?.showWindow();
        let windowLimits = windowClass?.getWindowLimitsVP();
        console.log(`${caseName} windowLimits: ${JSON.stringify(windowLimits)}`);
        let setWindowLimits: window.WindowLimits = {
          minWidth: vp2px(windowLimits.minWidth as number + 10),
          minHeight: vp2px(windowLimits.minHeight as number + 10),
          maxWidth: vp2px(windowLimits.maxWidth as number - 10),
          maxHeight: vp2px(windowLimits.maxHeight as number - 10),
          pixelUnit: window.PixelUnit.PX
        }
        await windowClass?.setWindowLimits(setWindowLimits);
        let windowLimits2 = windowClass?.getWindowLimitsVP();
        console.log(`${caseName} windowLimits2: ${JSON.stringify(windowLimits2)}`);

        if (canIUseRes) {
          expect(Math.abs(windowLimits2.minWidth as number - (windowLimits.minWidth as number + 10))).assertLessOrEqual(2);
          expect(Math.abs(windowLimits2.minHeight as number - (windowLimits.minHeight as number + 10))).assertLessOrEqual(2);
          expect(Math.abs(windowLimits2.maxWidth as number - (windowLimits.maxWidth as number - 10))).assertLessOrEqual(2);
          expect(Math.abs(windowLimits2.maxHeight as number - (windowLimits.maxHeight as number - 10))).assertLessOrEqual(2);
        }
        await terminateAbility5(caseName)
        done()
      } catch (err) {
        console.error(`${caseName} :Failed. Cause code: ${err.code}, message: ${err.message}`);
        await windowClass?.destroyWindow();
        await terminateAbility5(caseName)
        if (err.code === 801) {
          done()
        } else {
          expect().assertFail();
          done()
        }
      }
    });


    /**
     * @tc.number     SUB_WMS_SYSTEM_PROPERTIES_WINDOW_SIZE_0100
     * @tc.name       testEnvSystemPropertiesWindowSizewithMainwindow
     * @tc.desc       testEnvSystemPropertiesWindowSizewithMainwindow
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testEnvSystemPropertiesWindowSizewithMainwindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testEnvSystemPropertiesWindowSizewithMainwindow';
      console.log(caseName + 'begin');
      let windowSizeWidth = 0;
      let windowSizeheight = 0;
      let driver = await Driver.create();
      let windowClass: window.Window | undefined;
      let windowStageStart = await startAbility4(caseName, context);
      windowClass = windowStageStart.getMainWindowSync();
      await windowClass.setUIContent('testability/pages/Index3');
      await windowClass.showWindow();
      await sleep(1000)
      let canIUseRes = canIUse('SystemCapability.Window.SessionManager');
      console.log(`${caseName} canIUse SystemCapability.Window.SessionManager: ${canIUseRes}`);
      let isFreeMode = windowClass.isInFreeWindowMode();
      console.log(`${caseName} isFreeMode: ${isFreeMode}`);
      try {
        if (!canIUseRes || !isFreeMode) {
          await terminateAbility4(caseName)
          done();
        } else {
          let windowLimits = windowClass.getWindowLimits()
          console.log(caseName + ' windowLimits: ' + JSON.stringify(windowLimits));
          const callback = async (size: window.Size) => {
            console.log(caseName + ' callback size: ' + JSON.stringify(size));
            windowSizeWidth = size.width;
            windowSizeheight = size.height

          }
          windowClass.on('windowSizeChange', callback);
          await windowClass.resize(windowLimits.minWidth as number + 1000, windowLimits.minHeight as number + 1000);
          await sleep(1000)

          let btnClick = await driver.findComponent(ON.id('index3Btn'))
          await sleep(1000)
          await btnClick.click();
          await sleep(1000)
          let windowSizeVPWidth = AppStorage.get('windowSizeVP width') as number;
          let windowSizeVPHeight = AppStorage.get('windowSizeVP height') as number;
          let windowSizePXWidth = AppStorage.get('windowSizePX width') as number;
          let windowSizePXHeight = AppStorage.get('windowSizePX height') as number;
          console.log(caseName + ' windowSizeVP width: ' + windowSizeVPWidth + ',height , ' + windowSizeVPHeight)
          console.log(caseName + ' windowSizePX width:: ' + windowSizePXWidth + ',height , ' + windowSizePXHeight)
          let widthPx2Vp = px2vp(windowSizeWidth);
          let heightPx2Vp = px2vp(windowSizeheight);
          console.log(caseName + ' widthPx2Vp: ' + widthPx2Vp)
          console.log(caseName + ' heightPx2Vp: ' + heightPx2Vp)
          expect(windowSizeWidth).assertEqual(windowSizePXWidth);
          expect(windowSizeheight).assertEqual(windowSizePXHeight);
          expect(widthPx2Vp).assertEqual(windowSizeVPWidth);
          expect(heightPx2Vp).assertEqual(windowSizeVPHeight);
          await terminateAbility4(caseName)
          done()
        }
      } catch (err) {
        console.error(`${caseName} :Failed. Cause code: ${err.code}, message: ${err.message}`);
        await terminateAbility4(caseName)
        expect().assertFail();
        done()
      }
    });


    /**
     * @tc.number     SUB_WMS_SYSTEM_PROPERTIES_WINDOW_SIZE_0200
     * @tc.name       testEnvSystemPropertiesWindowSizewithSubwindow
     * @tc.desc       testEnvSystemPropertiesWindowSizewithSubwindow
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testEnvSystemPropertiesWindowSizewithSubwindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testEnvSystemPropertiesWindowSizewithSubwindow';
      console.log(caseName + 'begin');
      let windowSizeWidth = 0;
      let windowSizeheight = 0;
      let driver = await Driver.create();
      let windowClass = await windowStage.createSubWindow('testEnvSystemPropertiesWindowSizewithSubwindow')
      await windowClass.setUIContent('testability/pages/Index3');
      await windowClass.showWindow();
      let canIUseRes = canIUse('SystemCapability.Window.SessionManager');
      console.log(`${caseName} canIUse SystemCapability.Window.SessionManager: ${canIUseRes}`);
      let isFreeMode = windowClass.isInFreeWindowMode();
      console.log(`${caseName} isFreeMode:${isFreeMode}`);
      try {
        if (!canIUseRes || !isFreeMode) {
          await windowClass.destroyWindow()
          done();
        } else {
          let windowLimits = windowClass.getWindowLimits()
          console.log(caseName + ' windowLimits: ' + JSON.stringify(windowLimits));
          const callback = async (size: window.Size) => {
            console.log(caseName + ' callback size: ' + JSON.stringify(size));
            windowSizeWidth = size.width;
            windowSizeheight = size.height

          }
          windowClass.on('windowSizeChange', callback);
          await windowClass.resize(windowLimits.minWidth as number + 1000, windowLimits.minHeight as number + 1000);
          await sleep(1000)

          let btnClick = await driver.findComponent(ON.id('index3Btn'))
          await sleep(1000)
          await btnClick.click();
          await sleep(1000)
          let windowSizeVPWidth = AppStorage.get('windowSizeVP width') as number;
          let windowSizeVPHeight = AppStorage.get('windowSizeVP height') as number;
          let windowSizePXWidth = AppStorage.get('windowSizePX width') as number;
          let windowSizePXHeight = AppStorage.get('windowSizePX height') as number;
          console.log(caseName + ' windowSizeVP width: ' + windowSizeVPWidth + ',height , ' + windowSizeVPHeight)
          console.log(caseName + ' windowSizePX width:: ' + windowSizePXWidth + ',height , ' + windowSizePXHeight)
          let widthPx2Vp = px2vp(windowSizeWidth);
          let heightPx2Vp = px2vp(windowSizeheight);
          console.log(caseName + ' widthPx2Vp: ' + widthPx2Vp)
          console.log(caseName + ' heightPx2Vp: ' + heightPx2Vp)
          expect(windowSizeWidth).assertEqual(windowSizePXWidth);
          expect(windowSizeheight).assertEqual(windowSizePXHeight);
          expect(widthPx2Vp).assertEqual(windowSizeVPWidth);
          expect(heightPx2Vp).assertEqual(windowSizeVPHeight);
          await windowClass.destroyWindow()
          done()
        }
      } catch (err) {
        console.error(`${caseName} :Failed. Cause code: ${err.code}, message: ${err.message}`);
        await windowClass?.destroyWindow()
        expect().assertFail();
        done()
      }
    });
    /**
      * @tc.name testSystemProperties
      * @tc.number SUB_WMS_testSystemProperties_0100
      * @tc.desc testSystemProperties
      * @tc.type FUNCTION
      * @tc.size MEDIUMTEST
      * @tc.level LEVEL0
      */
    it('testSystemProperties', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testSystemProperties ';
      console.log(caseName + 'begin');
      try {
        console.info(caseName + ' SystemProperties: ' + JSON.stringify(SystemProperties));
        expect(SystemProperties.WINDOW_AVOID_AREA).assertEqual('system.window.avoidarea');
        expect(SystemProperties.WINDOW_AVOID_AREA_PX).assertEqual('system.window.avoidarea.px');
        expect(SystemProperties.WINDOW_SIZE).assertEqual('system.window.size');
        expect(SystemProperties.WINDOW_SIZE_PX).assertEqual('system.window.size.px');
        done();
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        expect().assertFail();
        done()
      }
    });



  })
}