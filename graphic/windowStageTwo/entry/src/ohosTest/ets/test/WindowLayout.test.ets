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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level} from '@ohos/hypium';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@kit.BasicServicesKit';
import { Driver, ON } from '@kit.TestKit';
import settings from '@ohos.settings';
import * as LoadContentByName from '../testability/pages/WindowTest/LoadContentByName';

export default function windowLayoutTest() {
  describe('windowLayoutTest', async () => {
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context: common.UIAbilityContext;
    let windowStage: window.WindowStage;
    let isAutoWindow: string = '';
    let isPCStatus: string = '';
    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context));
      windowStage = AppStorage.get('windowStage') as window.WindowStage;
      //isAutoWindow == '' 非PAD设备
      //isAutoWindow == 'true' PAD设备自由多窗模式
      //isAutoWindow == 'false' PAD设备非自由多窗模式
      isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '',settings.domainName.USER_PROPERTY);
      console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
      isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
      //isPCStatus == '' 非PC设备
      //isPCStatus == '1' PC设备状态栏dock未融合
      //isPCStatus == '0' PC设备状态栏dock融合
      console.info(`beforeAll isPCStatus: `+ isPCStatus);
    });
    beforeEach(() => {
    });
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
    });

    /**
     * @tc.number    : testStartMoving_0100
     * @tc.name      : testStartMoving_0100
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
        expect(true).assertTrue();
        done()
      } else if (textDragged == 'startMoving 1300004') {
        await windowClass.setUIContent("testability/pages/Index");
        expect(true).assertTrue();
        done()
      }else {
        await windowClass.setUIContent("testability/pages/Index");
        console.error(`${message} Error`);
        expect(true).assertFalse()
        done()
      }
    })
/**
     * @tc.number    : testStartMoving_0200
     * @tc.name      : testStartMoving_0200
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testStartMoving_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'startMovingTest_0200';
      let windowClass:window.Window;
      let options: window.SubWindowOptions = {
        title: 'testStartMoving_0200',
        decorEnabled: true
      };
      windowStage.createSubWindowWithOptions('testStartMoving_0200', options).then(async (data) => {
        windowClass = data
        await windowClass.setUIContent("testability/pages/WindowTest/StartMoving");
        windowClass.resize(1000, 1200)
        await windowClass.showWindow()
        await sleep(1000)
        let driver = Driver.create();
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
          expect(true).assertTrue();
        } else {
          console.error(`${message} Error`);
          expect(true).assertFalse()
        }
        await windowClass.destroyWindow()
        // await sleep(10000)
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
     * @tc.number    : testStartMoving_0300
     * @tc.name      : testStartMoving_0300
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testStartMoving_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'startMovingTest_0300';
      let mainwindowClass = windowStage.getMainWindowSync();
      let windowClass:window.Window;
      let options: window.SubWindowOptions = {
        title: 'subWindow',
        decorEnabled: true
      };
      try {
        mainwindowClass.createSubWindowWithOptions('subWindow', options).then(async (data) => {
          windowClass = data
          await windowClass.setUIContent("testability/pages/WindowTest/StartMoving");
          windowClass.resize(1000, 1200)
          await windowClass.showWindow()
          await sleep(1000)
          let driver = Driver.create();
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
            expect(true).assertTrue();
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
     * @tc.number    : testSetResizeByDragEnabledTrue_0100
     * @tc.name      : testSetResizeByDragEnabledTrue_0100
     * @tc.desc      :
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
        await driver.mouseMoveTo({x: windowPoint.left + Math.ceil(windowPoint.width / 2), y: windowPoint.top})
        await sleep(2000)
        await driver.mouseDrag({x: windowPoint.left + Math.ceil(windowPoint.width / 2), y: windowPoint.top}, {x: windowPoint.left + Math.ceil(windowPoint.width / 2), y: windowPoint.top + 100},2000)
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
     * @tc.number     : SUB_BASIC_WMS_SetFollowParentMultiScreenPolicy_0100
     * @tc.name       : test_setFollowParentMultiScreenPolicy_401
     * @tc.desc       : test_setFollowParentMultiScreenPolicy_401
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
          console.info(msgStr +'Succeeded  setFollowParentMultiScreenPolicy.');
          expect(true).assertFail();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr +`Failed to setFollowParentMultiScreenPolicy . Cause code: ${err.code}, message: ${err.message}`);
          await subWindow.destroyWindow();
          if(err.code == 801){
            done()
          }else{
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
     * @tc.number     : SUB_BASIC_WMS_SetFollowParentMultiScreenPolicy_0200
     * @tc.name       : test_setFollowParentMultiScreenPolicy_1300002
     * @tc.desc       : test_setFollowParentMultiScreenPolicy_1300002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
          console.info(msgStr +'Succeeded  setFollowParentMultiScreenPolicy.');
          expect(true).assertFail();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr +`Failed to setFollowParentMultiScreenPolicy . Cause code: ${err.code}, message: ${err.message}`);
          if(err.code == 801){
            done()
          }else{
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
     * @tc.number     : SUB_BASIC_WMS_SetFollowParentMultiScreenPolicy_0300
     * @tc.name       : test_setFollowParentMultiScreenPolicy_mainWindow_1300004
     * @tc.desc       : test_setFollowParentMultiScreenPolicy_mainWindow_1300004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_setFollowParentMultiScreenPolicy_mainWindow_1300004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_setFollowParentMultiScreenPolicy_mainWindow_1300004";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let mainWindow = windowStage.getMainWindowSync();
      try {
        let promise = mainWindow.setFollowParentMultiScreenPolicy(true);
        promise.then(() => {
          console.info(msgStr +'Succeeded  setFollowParentMultiScreenPolicy.');
          expect(true).assertFail();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr +`Failed to setFollowParentMultiScreenPolicy . Cause code: ${err.code}, message: ${err.message}`);
          if(err.code == 801){
            done()
          }else{
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
     * @tc.number     : SUB_BASIC_WMS_SetFollowParentMultiScreenPolicy_0400
     * @tc.name       : test_setFollowParentMultiScreenPolicy_dialogWindow_1300004
     * @tc.desc       : test_setFollowParentMultiScreenPolicy_dialogWindow_1300004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
          console.info(msgStr +'Succeeded  setFollowParentMultiScreenPolicy.');
          expect(true).assertFail();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr +`Failed to setFollowParentMultiScreenPolicy . Cause code: ${err.code}, message: ${err.message}`);
          await windowClass.destroyWindow();
          if(err.code == 801){
            done()
          }else{
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
     * @tc.number     : SUB_BASIC_WMS_SetFollowParentMultiScreenPolicy_0500
     * @tc.name       : test_subWindow_setFollowParentMultiScreenPolicy_true
     * @tc.desc       : test_subWindow_setFollowParentMultiScreenPolicy_true
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_subWindow_setFollowParentMultiScreenPolicy_true', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "test_subWindow_setFollowParentMultiScreenPolicy_true";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWindow = await windowStage.createSubWindow('test_subWindow_setFollowParentMultiScreenPolicy_true');
      await subWindow.setUIContent('testability/pages/First/index2');
      await subWindow.showWindow();
      try {
        let promise = subWindow.setFollowParentMultiScreenPolicy(true);
        promise.then(async () => {
          console.info(msgStr +'Succeeded  setFollowParentMultiScreenPolicy.');
          await subWindow.destroyWindow();
          expect(true).assertTrue();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr +`Failed to setFollowParentMultiScreenPolicy . Cause code: ${err.code}, message: ${err.message}`);
          await subWindow.destroyWindow();
          if(err.code == 801){
            done()
          }else{
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
     * @tc.number     : SUB_BASIC_WMS_SetFollowParentMultiScreenPolicy_0600
     * @tc.name       : test_subWindow_setFollowParentMultiScreenPolicy_false
     * @tc.desc       : test_subWindow_setFollowParentMultiScreenPolicy_false
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_subWindow_setFollowParentMultiScreenPolicy_false', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "test_subWindow_setFollowParentMultiScreenPolicy_false";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWindow = await windowStage.createSubWindow('test_subWindow_setFollowParentMultiScreenPolicy_false');
      await subWindow.setUIContent('testability/pages/First/index2');
      await subWindow.showWindow();
      try {
        let promise = subWindow.setFollowParentMultiScreenPolicy(false);
        promise.then(async () => {
          console.info(msgStr +'Succeeded  setFollowParentMultiScreenPolicy.');
          await subWindow.destroyWindow();
          expect(true).assertTrue();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr +`Failed to setFollowParentMultiScreenPolicy . Cause code: ${err.code}, message: ${err.message}`);
          await subWindow.destroyWindow();
          if(err.code == 801){
            done()
          }else{
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
     * @tc.number     : SUB_BASIC_WMS_MOVE_GLOBAL_0100
     * @tc.name       : test_moveWindowToGlobal_moveConfiguration
     * @tc.desc       : 验证moveWindowToGlobal参数MoveConfiguration
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
          if (err.code == 1300002 || err.code == 801){
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.log(`${message} Failed to test MoveConfiguration.errcode:${err.code}, Cause:${JSON.stringify(err.message)}`)
        expect().assertFail();
        done();
      }

    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0040
     * @tc.name      : testRectChangeOptions_off
     * @tc.desc      : Test the function value of testRectChangeOptions
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testRectChangeOptions_off", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
        expect(true).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0050
     * @tc.name      : testRectChangeReason_enum
     * @tc.desc      : Test the function value of RectChangeReason
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0600
     * @tc.name      : testRectChangeOptions_on_resize
     * @tc.desc      : Test the function value of testRectChangeOptions
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
          expect(true).assertTrue();
          done();
        });
        await windowClass.resize(1000, 1000).then(async () => {
          console.info(msgStr + 'Succeeded in changing the window size.');
          await sleep(500);
          windowClass.off('windowRectChange');
          expect(true).assertTrue();
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
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0700
         * @tc.name      : testRectChangeOptions_on_moveWindowTo
         * @tc.desc      : Test the function value of testRectChangeOptions
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
    it("testRectChangeOptions_on_moveWindowTo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
          expect(true).assertTrue();
          done();
        });
        await windowClass.moveWindowTo(500, 500).then(async () => {
          console.info(msgStr + 'Succeeded in moving the window.');
          await sleep(1000);
          expect(true).assertTrue();
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
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0800
         * @tc.name      : testRectChangeOptions_on_TwoCallback
         * @tc.desc      : Test the function value of testRectChangeOptions
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
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
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0900
         * @tc.name      : testRectChangeOptions_off_callback1
         * @tc.desc      : Test the function value of testRectChangeOptions
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
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
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_1000
         * @tc.name      : testRectChangeOptions_off_all_callback
         * @tc.desc      : Test the function value of testRectChangeOptions
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
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
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_ON_WINDOW_RECTCHANGE_0100
         * @tc.name      : test_on_windowRectChange
         * @tc.desc      : test_on_windowRectChange
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */

    it("test_on_windowRectChange", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
        expect(true).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_WINDOWMASK_0100
     * @tc.name      : test_mainWindow_setWindowMask
     * @tc.desc      : test_mainWindow_setWindowMask
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
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
          expect(true).assertTrue();
          done();
        } else {
          console.log(msgStr + 'Failed to setWindowMask');
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SetFollowParentWindowLayoutEnabled_0100
     * @tc.name      : test_SetFollowParentWindowLayoutEnabled_401
     * @tc.desc      :  test_SetFollowParentWindowLayoutEnabled_401
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
            console.info(msgStr + 'Succeeded in setFollowParentWindowLayoutEnabled ' );
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
          } else if(err.code == 401){
            expect(true).assertTrue();
            done();
          }else {
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SetFollowParentWindowLayoutEnabled_0200
     * @tc.name      : test_SetFollowParentWindowLayoutEnabled_1300002
     * @tc.desc      :  test_SetFollowParentWindowLayoutEnabled_1300002
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
            console.info(msgStr + 'Succeeded in setFollowParentWindowLayoutEnabled ' );
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SetFollowParentWindowLayoutEnabled_0300
     * @tc.name      : test_SetFollowParentWindowLayoutEnabled_1300004
     * @tc.desc      :  test_SetFollowParentWindowLayoutEnabled_1300004
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("test_SetFollowParentWindowLayoutEnabled_1300004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let msgStr = "test_SetFollowParentWindowLayoutEnabled_1300004";
      console.log(msgStr + "begin");
      let windowClass = await windowStage.getMainWindow();
      try {
          let promise2 = windowClass.setFollowParentWindowLayoutEnabled(true);
          promise2.then(async () => {
            console.info(msgStr + 'Succeeded in setFollowParentWindowLayoutEnabled ' );
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SetFollowParentWindowLayoutEnabled_0400
     * @tc.name      : test_SetFollowParentWindowLayoutEnabled_true
     * @tc.desc      :  test_SetFollowParentWindowLayoutEnabled_true
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
          console.log('Window WindowLimits:' + minWidth +' '+ minHeight);
          subWindowClass.resizeAsync(minWidth,minHeight);
          await sleep(300);
          subWindowClass.on('windowSizeChange', async (data) => {
            console.info('Succeeded in enabling the listener for window size changes. Data: ' + JSON.stringify(data));
            let subWindowRect = data;
            expect(Math.abs(subWindowRect.width-mainWindowProwindowRect.width)).assertLessOrEqual(1);
            expect(Math.abs(subWindowRect.height-mainWindowProwindowRect.height)).assertLessOrEqual(1);
            await subWindowClass.destroyWindow();
            done();
          });
          let promise2 = subWindowClass.setFollowParentWindowLayoutEnabled(true);
          promise2.then(async () => {
            console.info(msgStr + 'Succeeded in setFollowParentWindowLayoutEnabled ' );
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SetFollowParentWindowLayoutEnabled_0500
     * @tc.name      : test_SetFollowParentWindowLayoutEnabled_false
     * @tc.desc      :  test_SetFollowParentWindowLayoutEnabled_false
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
          await sleep(300);
          await subWindowClass.showWindow();
          let minWidth = Number(subWindowClass.getWindowLimits().minWidth);
          let minHeight = Number(subWindowClass.getWindowLimits().minHeight);
          console.log('Window WindowLimits:' + minWidth +' '+ minHeight);
          subWindowClass.resizeAsync(minWidth,minHeight);
          let subWindowRect1 = subWindowClass.getWindowProperties().windowRect;
          console.info(msgStr + 'Succeeded in get  subWindowRect1. Data: ' + JSON.stringify(subWindowRect1));
          let promise2 = subWindowClass.setFollowParentWindowLayoutEnabled(false);
          promise2.then(async () => {
            console.info(msgStr + 'Succeeded in setFollowParentWindowLayoutEnabled ' );
            let subWindowRect2 = subWindowClass.getWindowProperties().windowRect;
            console.info(msgStr + 'Succeeded in get  subWindowRect2. Data: ' + JSON.stringify(subWindowRect2));
            expect(Math.abs(subWindowRect1.width-subWindowRect2.width)).assertLessOrEqual(1);
            expect(Math.abs(subWindowRect1.height-subWindowRect2.height)).assertLessOrEqual(1);
            expect(Math.abs(subWindowRect1.left-subWindowRect2.left)).assertLessOrEqual(1);
            expect(Math.abs(subWindowRect1.top-subWindowRect2.top)).assertLessOrEqual(1);
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
     * @tc.number     : SUB_BASIC_WMS_startMoving_401_0100
     * @tc.name       : teststartMoving401
     * @tc.desc       : teststartMoving401
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('teststartMoving401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "teststartMoving401";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync();
      try {
        let promise = windowClass.startMoving(null,null);
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
     * @tc.number     : SUB_BASIC_WMS_stopMoving_1300002_0100
     * @tc.name       : teststopMoving1300002
     * @tc.desc       : teststopMoving1300002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('teststopMoving1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "teststopMoving1300002";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        let windowClass = await windowStage.createSubWindow('teststopMoving1300002');
        await windowClass.destroyWindow();
        windowClass.stopMoving().then(() => {
          console.info(msgStr +'Succeeded in stopping moving window.')
          expect(false).assertFail();
          done();
        }).catch((e: BusinessError) => {
          console.error(msgStr +`Failed to stop moving. Cause code: ${e.code}, message: ${e.message}`);
          if(e.code == 801){
            done();
          }else{
            expect(e.code).assertEqual(1300002);
            done()
          }
        });
      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        if(e.code == 801){
          done();
        }else{
          expect(e.code).assertEqual(1300002);
          done()
        }
      }

    })
    /**
     * @tc.number     : SUB_BASIC_WMS_moveWindowToAsync_3_parameters_0100
     * @tc.name       : testmoveWindowToAsync_3_parameters
     * @tc.desc       : testmoveWindowToAsync_3_parameters
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testmoveWindowToAsync_3_parameters',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testmoveWindowToAsync_3_parameters";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let mainWindow = windowStage.getMainWindowSync();
      let displayId = mainWindow.getWindowProperties().displayId;
      console.info(msgStr +'windowId :'+displayId)
      let moveConfiguration: window.MoveConfiguration = {
        displayId: displayId
      };
      let subWindow = await windowStage.createSubWindow('testmoveWindowToAsync_3_parameters');
      await subWindow.loadContentByName(LoadContentByName.entryName);
      await  subWindow.showWindow();
      try {
      let promise = subWindow.moveWindowToAsync(300, 300, moveConfiguration);
      promise.then(async () => {
        console.info(msgStr +'Succeeded in moving the window.');
        let rect = subWindow.getWindowProperties().windowRect;
        console.info(msgStr +`Get window rect: ` + JSON.stringify(rect));
        expect(true).assertTrue();
        await subWindow.destroyWindow();
        done()
      }).catch(async (err: BusinessError) => {
        console.error(msgStr +`Failed to move the window. Cause code: ${err.code}, message: ${err.message}`);
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
      console.error(msgStr +`Failed. Cause code: ${exception.code}, message: ${exception.message}`);
      await subWindow.destroyWindow();
      expect(false).assertFail();
      done();
      }

    })

    /**
     * @tc.number     : SUB_BASIC_WMS_XTS_SYSTEMAPI_ENABLEDRAG_0100
     * @tc.name       : testWindowEnableDragNull
     * @tc.desc       : test the err.code = 401
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testWindowEnableDragNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
     * @tc.number     : SUB_BASIC_WMS_XTS_SYSTEMAPI_ENABLEDRAG_0200
     * @tc.name       : testWindowEnableDragDestroy
     * @tc.desc       : test the err.code = 1300002 when window destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
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
     * @tc.number     : SUB_BASIC_WMS_XTS_SYSTEMAPI_ENABLEDRAG_0300
     * @tc.name       : testWindowEnableDragTrueSubWindow
     * @tc.desc       : testWindowEnableDragTrueSubWindow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testWindowEnableDragTrueSubWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let windowClass: window.Window;
        let driver: Driver = Driver.create();
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
                await driver.mouseDrag({x: pointWidth, y: pointHeight}, {x: pointWidth + 50, y: pointHeight}, 200);
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
     * @tc.number     : SUB_BASIC_WMS_XTS_SYSTEMAPI_ENABLEDRAG_0400
     * @tc.name       : testWindowEnableDragFalseSubWindow
     * @tc.desc       : testWindowEnableDragFalseSubWindow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testWindowEnableDragFalseSubWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let windowClass: window.Window;
        let driver: Driver = Driver.create();
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
                await driver.mouseDrag({x: pointWidth, y: pointHeight}, {x: pointWidth + 50, y: pointHeight}, 200);
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
     * @tc.number     : SUB_BASIC_WMS_XTS_SYSTEMAPI_ENABLEDRAG_0500
     * @tc.name       : testWindowEnableDragTrueDialogWindow
     * @tc.desc       : testWindowEnableDragTrueDialogWindow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testWindowEnableDragTrueDialogWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let windowClass: window.Window;
        let driver: Driver = Driver.create();
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
                await driver.mouseDrag({x: pointWidth, y: pointHeight}, {x: pointWidth - 50, y: pointHeight}, 200);
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
     * @tc.number     : SUB_BASIC_WMS_XTS_SYSTEMAPI_ENABLEDRAG_0600
     * @tc.name       : testWindowEnableDragFalseDialogWindow
     * @tc.desc       : testWindowEnableDragFalseDialogWindow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testWindowEnableDragFalseDialogWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let windowClass: window.Window;
        let driver: Driver = Driver.create();
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
                await driver.mouseDrag({x: pointWidth, y: pointHeight}, {x: pointWidth - 50, y: pointHeight}, 200);
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
     * @tc.number    : SUB_BASIC_WMS_STARTMOVING_0400
     * @tc.name      : testStartMoving_0400
     * @tc.desc      : 验证系统窗调用startmoving移动成功
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
        await windowClass.resize(windowLimits.minWidth, windowLimits.minHeight);
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
        let point = await blank.getBoundsCenter();
        await driver.drag(point.x, point.y, point.x + 50, point.y + 50, 200);
        await sleep(1000);
        let text = await driver.findComponent(ON.id('startMovingText'));
        await sleep(1000)
        let textDragged = await text.getText();
        if (textDragged == 'startMoving success') {
          let windowPointDragged = windowClass.getWindowProperties().windowRect
          console.info(`${caseName} sstartMoving success, windowPoint = ${JSON.stringify(windowPointDragged)}`)
          expect(windowPointDragged.left).assertEqual(windowPoint.left + 50)
          expect(windowPointDragged.top).assertEqual(windowPoint.top + 50)
        } else if (textDragged == 'startMoving 801') {
          expect(true).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_SYSTEMAPI_ENABLEDRAG_0700
     * @tc.name      : testWindowEnableDragTruewithFullScreenMainWindow
     * @tc.desc      :  验证全屏主窗调用enabledrag抛1300004错误码
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testWindowEnableDragTruewithFullScreenMainWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testWindowEnableDragTruewithFullScreenMainWindow';
      console.log(caseName + 'begin.');
      try {
      let windowClass =  windowStage.getMainWindowSync();
      let windowStatusType = windowClass.getWindowStatus();
      console.info(caseName + ' windowClass.getWindowStatus(). windowStatusType: ' + JSON.stringify(windowStatusType));

        await windowClass.enableDrag(true);
        await sleep(200);
        if (windowStatusType != window.WindowStatusType.FULL_SCREEN) {
          done();
        }

      } catch (err) {
        console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
        if(err.code == 801){
          done();
        }else{
          expect(err.code).assertEqual(1300004);
          done();
        }


      }
    })

  })
}