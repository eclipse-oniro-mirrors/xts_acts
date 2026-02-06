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
import { Driver, ON } from "@ohos.UiTest"
import window from '@ohos.window';
import ohosWindow from '@ohos.window';
import common from '@ohos.app.ability.common';
import settings from '@ohos.settings';
import deviceInfo from '@ohos.deviceInfo';
export default function extensionWindowPropertiesTest() {
  describe('extensionWindowProperties_test', () => {
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context : common.UIAbilityContext;
    let windowStage:ohosWindow.WindowStage;
    let isPCStatus:string = '';
    let isAutoWindow:string = '';
    let driver: Driver;

    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context))
      windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
      let mainWindow = windowStage.getMainWindowSync();
      mainWindow.resizeAsync(1500,1000);
      mainWindow.moveWindowToAsync(1200,200);
      driver = Driver.create();
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.name   testUIExtensionHostWindowProxyRect
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_UIEXTENSION_WINDOW_JS_API_0100
     * @tc.desc   Obtain the area that the window rect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUIExtensionHostWindowProxyRect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testUIExtensionHostWindowProxyRectTest';
      console.log(caseName + 'start run');
      let windowClass = windowStage.getMainWindowSync();
      await windowClass.setUIContent('testability/pages/WindowTest/EmbeddedComponentPage');
      await sleep(2000);
      let btn = await driver.findComponent(ON.id('Button'));
      console.log(caseName + ' btn1 : ' + btn);

      if (btn == undefined) {
        console.log(caseName + 'device not support')
        done()
      } else {
        await btn.click();
        await sleep(1000);
        let btn2 = await driver.findComponent(ON.id('HelloWorld'));

        let txt = await btn2.getText();
        console.log(caseName + ' btn2 : ' + txt);
        expect(txt == 'true').assertTrue();
        done()
      }
    })


    /**
     * @tc.name   testUIExtensionHostRectChange
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_UIEXTENSION_WINDOW_JS_API_0200
     * @tc.desc   Listen the change of rect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUIExtensionHostRectChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testUIExtensionHostRectChange';
      console.log(caseName + 'start run');
      try {
        let options: window.SubWindowOptions = {
          title: 'subWindow',
          decorEnabled: true
        }
        console.log(caseName + 'start run')
        await windowStage.createSubWindowWithOptions('subWindowRectChange', options).then(async (subWindowClass) => {
          await subWindowClass.setUIContent('testability/pages/WindowTest/EmbeddedComponentRectPage')
          subWindowClass.resizeAsync(1000, 1200)
          subWindowClass.moveWindowToAsync(300, 200)
          await subWindowClass.showWindow()

          console.log(caseName + 'after createSubWindow')

          await sleep(1000)
          let btn = await driver.findComponent(ON.id('button'))
          console.log(caseName + ' btn : ' + btn);
          if (btn == undefined) {
            console.log(caseName + 'device not support')
          } else {
            await btn.click()
            await sleep(1000)

            subWindowClass.resizeAsync(1200, 800)
            await sleep(300);
            console.log(caseName + 'resizeAsync success');
            subWindowClass.moveWindowToAsync(0, 0)

            let hw = await driver.findComponent(ON.id('testNum'))
            let testNum = await hw.getText()
            console.log(caseName + 'testNum : ' + testNum)
            // pad设备不支持监听，rectChange报801
            expect(testNum == '2' || testNum == '801').assertTrue()
            await subWindowClass.destroyWindow()
          }
        }).catch((error: BusinessError) => {
          console.log(caseName + 'Failed to create the subwindow. Cause: ' + JSON.stringify(error));
          if (error.code == 1300002) {
            console.log(caseName + 'device not support')
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        console.log(caseName + 'Failed ' + JSON.stringify(exception))
        expect().assertFail()
      }
      done()
    })

    /**
     * @tc.name   testUIExtensionHostOffRectChange01
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_UIEXTENSION_OFFRECTCHANGE_JS_API_0100
     * @tc.desc   testUIExtensionHostOffRectChange01 Register twice and unregister one
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUIExtensionHostOffRectChange01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'testUIExtensionHostOffRectChange01 ';
      console.log(caseName + 'start run');
      try {
        let options: window.SubWindowOptions = {
          title: 'subWindow',
          decorEnabled: true
        }
        console.log(caseName + 'start run')
        await windowStage.createSubWindowWithOptions('subWindowOffRectChange1', options).then(async (subWindowClass) => {
          await subWindowClass.setUIContent('testability/pages/WindowTest/EmbeddedComponentRectPage')
          subWindowClass.resizeAsync(1000, 1200)
          subWindowClass.moveWindowToAsync(300, 200)
          await subWindowClass.showWindow()

          console.log(caseName + 'after createSubWindow')

          await sleep(1000)
          let btn = await driver.findComponent(ON.id('off_single'))
          console.log(caseName + ' btn : ' + btn);
          if (btn == undefined) {
            console.log(caseName + 'device not support')
          } else {
            // 点击按钮 执行两次on('rectChange')， 并执行一个off('rectchange')
            await btn.click()
            await sleep(1000)

            // 触发两次rectChange
            subWindowClass.resizeAsync(1200, 800)
            subWindowClass.moveWindowToAsync(0, 0)

            let hw = await driver.findComponent(ON.id('testNum'))
            let testNum = await hw.getText()
            console.log(caseName + 'testNum : ' + testNum)
            // 只有一个回调函数被响应, pad设备不支持监听，rectChange报801
            expect(testNum == '2' || testNum == '801').assertTrue()
            await subWindowClass.destroyWindow()
          }
        }).catch((error: BusinessError) => {
          console.log(caseName + 'Failed to create the subwindow. Cause: ' + JSON.stringify(error));
          if (error.code == 1300002) {
            console.log(caseName + 'device not support')
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        console.log(caseName + 'Failed ' + JSON.stringify(exception))
        expect().assertFail()
      }
      done()
    })

    /**
     * @tc.name   testUIExtensionHostOffRectChange02
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_UIEXTENSION_OFFRECTCHANGE_JS_API_0200
     * @tc.desc   testUIExtensionHostOffRectChange02 register twice and unregister all of them
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUIExtensionHostOffRectChange02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'testUIExtensionHostOffRectChange02 ';
      console.log(caseName + 'start run');
      try {
        let options: window.SubWindowOptions = {
          title: 'subWindow',
          decorEnabled: true
        }
        console.log(caseName + 'start run')
        await windowStage.createSubWindowWithOptions('subWindowOffRectChange2', options).then(async (subWindowClass) => {
          await subWindowClass.setUIContent('testability/pages/WindowTest/EmbeddedComponentRectPage')
          subWindowClass.resizeAsync(1000, 1200)
          subWindowClass.moveWindowToAsync(300, 200)
          await subWindowClass.showWindow()

          console.log(caseName + 'after createSubWindow')

          await sleep(1000)
          let btn = await driver.findComponent(ON.id('off_all'))
          console.log(caseName + ' btn : ' + btn);
          if (btn == undefined) {
            console.log(caseName + 'device not support')
          } else {
            // 点击按钮 执行两次on('rectChange')， 并执行一个off('rectchange')
            await btn.click()
            await sleep(1000)

            // 触发两次rectChange
            subWindowClass.resizeAsync(1200, 800)
            subWindowClass.moveWindowToAsync(0, 0)

            let hw = await driver.findComponent(ON.id('testNum'))
            let testNum = await hw.getText()
            console.log(caseName + 'testNum : ' + testNum)
            // 没有回调函数被响应, 设备不支持监听时报801
            expect(testNum == '0' || testNum == '801').assertTrue()
            await subWindowClass.destroyWindow()
          }
        }).catch((error: BusinessError) => {
          console.log(caseName + 'Failed to create the subwindow. Cause: ' + JSON.stringify(error));
          if (error.code == 1300002) {
            console.log(caseName + 'device not support')
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        console.log(caseName + 'Failed ' + JSON.stringify(exception))
        expect().assertFail()
      }
      done()
    })

    /**
     * @tc.name   testUIExtensionHostRectChangeErrorCode401
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_UIEXTENSION_RECTCHANGE_JS_API_0200
     * @tc.desc   testUIExtensionHostRectChangeErrorCode401 when got a callback with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUIExtensionHostRectChangeErrorCode401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testUIExtensionHostRectChangeErrorCode401 ';
      console.log(caseName + 'start run');
      try {
        let options: window.SubWindowOptions = {
          title: 'subWindow',
          decorEnabled: true
        }
        console.log(caseName + 'start run')
        await windowStage.createSubWindowWithOptions('subWindowRectChange401', options).then(async (subWindowClass) => {
          await subWindowClass.setUIContent('testability/pages/WindowTest/EmbeddedComponentRectPage')
          subWindowClass.resizeAsync(1000, 1200)
          subWindowClass.moveWindowToAsync(300, 200)
          await subWindowClass.showWindow()

          console.log(caseName + 'after createSubWindow')

          await sleep(1000)
          let btn = await driver.findComponent(ON.id('button401'))
          console.log(caseName + ' btn : ' + btn);
          // 只针对pc设别
          if (btn == undefined) {
            console.log(caseName + 'device not support')
          } else {

            // 点击执行注册rectChange， 回调函数传null
            await btn.click()
            await sleep(1000)

            subWindowClass.resizeAsync(1200, 800)
            subWindowClass.moveWindowToAsync(0, 0)

            let hw = await driver.findComponent(ON.id('errorMessage'))
            let testNum = await hw.getText()
            console.log(caseName + 'testNum : ' + testNum)
            // 传null，错误码为401, 设备不支持监听时报801
            expect(testNum == '401' || testNum == '801').assertTrue()
            await subWindowClass.destroyWindow()
          }
        }).catch((error: BusinessError) => {
          console.log(caseName + 'Failed to create the subwindow. Cause: ' + JSON.stringify(error));
          if (error.code == 1300002) {
            console.log(caseName + 'device not support')
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        console.log(caseName + 'Failed ' + JSON.stringify(exception))
        expect().assertFail()
      }
      done()
    })

    /**
     * @tc.name   testUIExtensionHostOccupyEvents
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_UIEXTENSION_OCCUPYEVENTS_JS_API_0100
     * @tc.desc   testUIExtensionHostOccupyEvents with click and longPress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUIExtensionHostOccupyEvents', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testUIExtensionHostOccupyEvents ';
      console.log(caseName + 'start run');
      try {
        let options: window.SubWindowOptions = {
          title: 'subWindow',
          decorEnabled: true
        }
        console.log(caseName + 'start run')
        await windowStage.createSubWindowWithOptions('subWindowOccupyEvents', options).then(async (subWindowClass) => {
          await subWindowClass.setUIContent('testability/pages/WindowTest/EmbeddedComponentOccupyPage')
          subWindowClass.resizeAsync(1000, 1200)
          subWindowClass.moveWindowToAsync(300, 200)
          await subWindowClass.showWindow()

          console.log(caseName + 'after createSubWindow')

          await sleep(1000)
          // UEC独占事件按钮
          let btn = await driver.findComponent(ON.id('button'))
          console.log(caseName + ' btn : ' + btn);
          // UEC点击事件按钮
          let btnClick = await driver.findComponent(ON.id('clickBtn'))
          // UEC点击事件响应次数
          let clickNum = await driver.findComponent(ON.id('clickNum'))
          // 宿主点击事件相应次数
          let clickNumParent = await driver.findComponent(ON.id('clickNumParent'))
          // UEC长按事件响应次数
          let longPressNum = await driver.findComponent(ON.id('longPressNum'))
          // 宿主长按事件响应次数
          let longPressNumParent = await driver.findComponent(ON.id('longPressNumParent'))

          // 只针对pc设备
          if (btn == undefined) {
            console.log(caseName + 'device not support')
          } else {
            // 点击开启UEC组件click和longPress独占事件
            await btn.click()
            await sleep(1000)

            let clickNumParentText1 = await clickNumParent.getText()
            console.log(caseName + 'clickNumParentText1 : ' + clickNumParentText1)

            // 触发UEC组件click事件
            await btnClick.click()
            await sleep(500)

            let clickNumText = await clickNum.getText()
            console.log(caseName + 'clickNumText : ' + clickNumText)
            // 子组件响应次数为1
            expect(clickNumText == '1').assertTrue()

            let clickNumParentText2 = await clickNumParent.getText()
            console.log(caseName + 'clickNumParentText2 : ' + clickNumParentText2)
            // 宿主不响应点击事件
            expect(clickNumParentText1 == clickNumParentText2).assertTrue()

            // 触发UEC组件长按事件
            await btnClick.longClick()
            let longPressNumText = await longPressNum.getText()
            let longPressNumParentText = await longPressNumParent.getText()
            console.log(caseName + 'longPressNumText : ' + longPressNumText + '; longPressNumParentText : ' + longPressNumParentText)
            // UEC响应长按事件
            expect(longPressNumText != '0').assertTrue()
            // 宿主不响应长按事件
            expect(longPressNumParentText == '0').assertTrue()
            await subWindowClass.destroyWindow()
          }
        }).catch((error: BusinessError) => {
          console.log(caseName + 'Failed to create the subwindow. Cause: ' + JSON.stringify(error));
          if (error.code == 1300002) {
            console.log(caseName + 'device not support')
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        console.log(caseName + 'Failed ' + JSON.stringify(exception))
        expect().assertFail()
      }
      done()
    })

    /**
     * @tc.name   testUIExtensionHostOccupyEvents_ErrorCode401
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_UIEXTENSION_OCCUPYEVENTS_ERRORCODE_JS_API_0100
     * @tc.desc   testUIExtensionHostOccupyEvents_ErrorCode401 when got arguments null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUIExtensionHostOccupyEvents_ErrorCode401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testUIExtensionHostOccupyEvents_ErrorCode401 ';
      console.log(caseName + 'start run');
      try {
        let options: window.SubWindowOptions = {
          title: 'subWindow',
          decorEnabled: true
        }
        console.log(caseName + 'start run')
        await windowStage.createSubWindowWithOptions('subWindowOccupyEvents', options).then(async (subWindowClass) => {
          await subWindowClass.setUIContent('testability/pages/WindowTest/EmbeddedComponentOccupyPage')
          subWindowClass.resizeAsync(1000, 1200)
          subWindowClass.moveWindowToAsync(300, 200)
          await subWindowClass.showWindow()

          console.log(caseName + 'after createSubWindow')

          await sleep(1000)
          // 设置独占事件
          let btn = await driver.findComponent(ON.id('button401'))
          console.log(caseName + ' btn : ' + btn);
          // 只针对pc设备
          if (btn == undefined) {
            console.log(caseName + 'device not support')
          } else {
            // 点击执行extensionWindow?.occupyEvents(null)
            await btn.click()
            await sleep(1000)

            // 获取接口返回信息
            let errorMessage = await driver.findComponent(ON.id('longPressNum1'))
            let errorMessageText = await errorMessage.getText()
            console.log(caseName + 'errorMessageText : ' + errorMessageText)
            expect(errorMessageText == '401').assertTrue()
            await subWindowClass.destroyWindow()
          }
        }).catch((error: BusinessError) => {
          console.log(caseName + 'Failed to create the subwindow. Cause: ' + JSON.stringify(error));
          if (error.code == 1300002) {
            console.log(caseName + 'device not support')
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        console.log(caseName + 'Failed ' + JSON.stringify(exception))
        expect().assertFail()
      }
      done()
    })


    /**
     * @tc.name   testUIExtensionHostGetAvoidArea_ErrorCode401
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_UIEXTENSION_AVOIDAREA_ERRORCODE_JS_API_0100
     * @tc.desc   testUIExtensionHostGetAvoidArea_ErrorCode401 when got argument -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUIExtensionHostGetAvoidArea_ErrorCode401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testUIExtensionHostGetAvoidArea_ErrorCode401 ';
      console.log(caseName + 'start run');
      try {
        let options: window.SubWindowOptions = {
          title: 'subWindow',
          decorEnabled: true
        }
        console.log(caseName + 'start run')
        await windowStage.createSubWindowWithOptions('subWindowOccupyEvents', options).then(async (subWindowClass) => {
          await subWindowClass.setUIContent('testability/pages/WindowTest/EmbeddedComponentErrorCodePage')
          subWindowClass.resizeAsync(1000, 1200)
          subWindowClass.moveWindowToAsync(300, 200)
          await subWindowClass.showWindow()

          console.log(caseName + 'after createSubWindow')

          await sleep(1000)
          // 设置独占事件
          let btn = await driver.findComponent(ON.id('getWindowAvoidArea401'))
          console.log(caseName + ' btn : ' + btn);
          // 只针对pc设备
          if (btn == undefined) {
            console.log(caseName + 'device not support')
          } else {
            // 点击执行extensionWindow?.getWindowAvoidArea401(-1)
            await btn.click()
            await sleep(1000)

            // 获取接口返回信息
            let errorMessage = await driver.findComponent(ON.id('errorMessage'))
            let errorMessageText = await errorMessage.getText()
            console.log(caseName + 'errorMessageText : ' + errorMessageText)
            expect(errorMessageText == '401').assertTrue()
            await subWindowClass.destroyWindow()
          }
        }).catch((error: BusinessError) => {
          console.log(caseName + 'Failed to create the subwindow. Cause: ' + JSON.stringify(error));
          if (error.code == 1300002) {
            console.log(caseName + 'device not support')
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        console.log(caseName + 'Failed ' + JSON.stringify(exception))
        expect().assertFail()
      }
      done()
    })

    /**
     * @tc.name   testUIExtensionHostOnAvoidAreaChange_ErrorCode401
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_UIEXTENSION_AVOIDAREA_ERRORCODE_JS_API_0200
     * @tc.desc   testUIExtensionHostOnAvoidAreaChange_ErrorCode401 when got callback with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUIExtensionHostOnAvoidAreaChange_ErrorCode401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testUIExtensionHostOnAvoidAreaChange_ErrorCode401 ';
      console.log(caseName + 'start run');
      try {
        let options: window.SubWindowOptions = {
          title: 'subWindow',
          decorEnabled: true
        }
        console.log(caseName + 'start run')
        await windowStage.createSubWindowWithOptions('subWindowOccupyEvents', options).then(async (subWindowClass) => {
          await subWindowClass.setUIContent('testability/pages/WindowTest/EmbeddedComponentErrorCodePage')
          subWindowClass.resizeAsync(1000, 1200)
          subWindowClass.moveWindowToAsync(300, 200)
          await subWindowClass.showWindow()

          console.log(caseName + 'after createSubWindow')

          await sleep(1000)
          // 设置独占事件
          let btn = await driver.findComponent(ON.id('onAvoidAreaChange401'))
          console.log(caseName + ' btn : ' + btn);
          // 只针对pc设备
          if (btn == undefined) {
            console.log(caseName + 'device not support')
          } else {
            // 点击执行extensionWindow?.on('avoidAreaChange', null)
            await btn.click()
            await sleep(1000)

            // 获取接口返回信息
            let errorMessage = await driver.findComponent(ON.id('errorMessage'))
            let errorMessageText = await errorMessage.getText()
            console.log(caseName + 'errorMessageText : ' + errorMessageText)
            expect(errorMessageText == '401').assertTrue()
            await subWindowClass.destroyWindow()
          }
        }).catch((error: BusinessError) => {
          console.log(caseName + 'Failed to create the subwindow. Cause: ' + JSON.stringify(error));
          if (error.code == 1300002) {
            console.log(caseName + 'device not support')
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        console.log(caseName + 'Failed ' + JSON.stringify(exception))
        expect().assertFail()
      }
      done()
    })

    /**
     * @tc.name   testUIExtensionHostOnWindowSizeChange_ErrorCode401
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_UIEXTENSION_WINDOWSIZECHANGE_ERRORCODE_JS_API_0100
     * @tc.desc   testUIExtensionHostOnWindowSizeChange_ErrorCode401 when got callback with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUIExtensionHostOnWindowSizeChange_ErrorCode401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testUIExtensionHostOnWindowSizeChange_ErrorCode401 ';
      console.log(caseName + 'start run');
      try {
        let options: window.SubWindowOptions = {
          title: 'subWindow',
          decorEnabled: true
        }
        console.log(caseName + 'start run')
        await windowStage.createSubWindowWithOptions('subWindowOccupyEvents', options).then(async (subWindowClass) => {
          await subWindowClass.setUIContent('testability/pages/WindowTest/EmbeddedComponentErrorCodePage')
          subWindowClass.resizeAsync(1000, 1200)
          subWindowClass.moveWindowToAsync(300, 200)
          subWindowClass.showWindow()

          console.log(caseName + 'after createSubWindow')

          await sleep(1000)
          // 设置独占事件
          let btn = await driver.findComponent(ON.id('onWindowSizeChange401'))
          console.log(caseName + ' btn : ' + btn);
          // 只针对pc设备
          if (btn == undefined) {
            console.log(caseName + 'device not support')
          } else {
            // 点击执行extensionWindow?.on('onWindowSizeChange401', null)
            await btn.click()
            await sleep(1000)

            // 获取接口返回信息
            let errorMessage = await driver.findComponent(ON.id('errorMessage'))
            let errorMessageText = await errorMessage.getText()
            console.log(caseName + 'errorMessageText : ' + errorMessageText)
            expect(errorMessageText == '401').assertTrue()
            await subWindowClass.destroyWindow()
          }
        }).catch((error: BusinessError) => {
          console.log(caseName + 'Failed to create the subwindow. Cause: ' + JSON.stringify(error));
          if (error.code == 1300002) {
            console.log(caseName + 'device not support')
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        console.log(caseName + 'Failed ' + JSON.stringify(exception))
        expect().assertFail()
      }
      done()
    })

    /**
     * @tc.name   testUIExtensionHostCreateSubWindowWithOptions_ErrorCode401
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_UIEXTENSION_CREATESUBWINDOWWITHOPTIONS_ERRORCODE_JS_API_0100
     * @tc.desc   testUIExtensionHostOnWindowSizeChange_ErrorCode401 when got callback with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUIExtensionHostCreateSubWindowWithOptions_ErrorCode401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testUIExtensionHostCreateSubWindowWithOptions_ErrorCode401 ';
      console.log(caseName + 'start run');
      try {
        let options: window.SubWindowOptions = {
          title: 'subWindow',
          decorEnabled: true
        }
        console.log(caseName + 'start run')
        await windowStage.createSubWindowWithOptions('subWindowOccupyEvents', options).then(async (subWindowClass) => {
          await subWindowClass.setUIContent('testability/pages/WindowTest/EmbeddedComponentErrorCodePage')
          subWindowClass.resizeAsync(1000, 1200)
          subWindowClass.moveWindowToAsync(300, 200)
          await subWindowClass.showWindow()

          console.log(caseName + 'after createSubWindow')

          await sleep(1000)
          // extensionWindow?.createSubWindowWithOptions('createSubWindowWithOptions401', null)
          let btn = await driver.findComponent(ON.id('createSubWindowWithOptions401'))
          console.log(caseName + ' btn : ' + btn);
          // 只针对pc设备
          if (btn == undefined) {
            console.log(caseName + 'device not support')
          } else {
            // 执行extensionWindow?.createSubWindowWithOptions('createSubWindowWithOptions401', null)
            await btn.click()
            await sleep(1000)

            // 获取接口返回信息
            let errorMessage = await driver.findComponent(ON.id('errorMessage'))
            let errorMessageText = await errorMessage.getText()
            console.log(caseName + 'errorMessageText : ' + errorMessageText)
            expect(errorMessageText == '401').assertTrue()
            await subWindowClass.destroyWindow()
          }
        }).catch((error: BusinessError) => {
          console.log(caseName + 'Failed to create the subwindow. Cause: ' + JSON.stringify(error));
          if (error.code == 1300002) {
            console.log(caseName + 'device not support')
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        console.log(caseName + 'Failed ' + JSON.stringify(exception))
        expect().assertFail()
      }
      done()
    })


    /**
     * @tc.name   testOnuiExtensionLimitChange_DestoryedSubWindow
     * @tc.number SUB_BASIC_WMS_WINDOW_ON_UIEXTENSION_SECURElIMITCHANGE_ERROECODE_0100
     * @tc.desc   testOnuiExtensionLimitChange_DestoryedSubWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOnuiExtensionLimitChange_DestoryedSubWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done: Function) => {
      let caseName = 'testOnuiExtensionLimitChange_DestoryedSubWindow';
      let subWindowClass =  await windowStage.createSubWindow('testOnuiExtensionLimitChange_DestoryedSubWindow');
      await subWindowClass.destroyWindow();
      try {
        const callback = (data: boolean) => {};
        subWindowClass.on("uiExtensionSecureLimitChange", callback);
        expect().assertFail();
        done()
      } catch (error) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(error)}`);
        if (error.code === 801) {
          done();
        } else {
          expect(error.code).assertEqual(1300002);
          done();
        }
      }
    })
    /**
     * @tc.name   testOffuiExtensionLimitChange_DestoryedSubWindow
     * @tc.number SUB_BASIC_WMS_WINDOW_ON_UIEXTENSION_SECURElIMITCHANGE_ERROECODE_0200
     * @tc.desc   testOffuiExtensionLimitChange_DestoryedSubWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOffuiExtensionLimitChange_DestoryedSubWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done: Function) => {
      let caseName = 'testOffuiExtensionLimitChange_DestoryedSubWindow';
      let subWindowClass = await windowStage.createSubWindow('testOffuiExtensionLimitChange_DestoryedSubWindow');
      await subWindowClass.destroyWindow();
      try {
        const callback = (data: boolean) => {};
        subWindowClass.off("uiExtensionSecureLimitChange", callback);
        expect().assertFail();
        done()
      } catch (error) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(error)}`);
        if (error.code === 801) {
          done();
        } else {
          expect(error.code).assertEqual(1300002);
          done();
        }
      }
    })


    /**
     * @tc.name   testCreateSubWindowWithOptionsFollowTrue
     * @tc.number SUB_WMS_UEC_CREATE_SUBWINDOW_FOLLOW_0100
     * @tc.desc   验证UEC创建的子窗生命周期跟随UEC组件
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSubWindowWithOptionsFollowTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testCreateSubWindowWithOptionsFollowTrue ';
      console.log(caseName + 'start run');
      let isSupport = canIUse('SystemCapability.Window.SessionManager')
      console.log(caseName + ' isSupport: ' + isSupport);
      if (!isSupport) {
        done()
      } else {
        let subWindowClass: window.Window | undefined;
        try {
          subWindowClass = await windowStage.createSubWindow('testCreateSubWindowWithOptionsFollowTrue');
          await subWindowClass.setUIContent('testability/pages/WindowTest/EmbeddedComponentCreateSubWindowOptionsTruePage');
          await subWindowClass.showWindow();
          await sleep(2000);
          // extensionWindow?.createSubWindowWithOptions
          let btn = await driver.findComponent(ON.id('createSubWindowWithOptionsTrue'))
          console.log(caseName + ' btn : ' + btn);
          if (btn != null) {
            await btn.click()
            await sleep(1000)
            // 获取接口返回信息
            let errorMessage = await driver.findComponent(ON.id('errorMessage'))
            let errorMessageText = await errorMessage.getText()
            console.log(caseName + 'errorMessageText : ' + errorMessageText)
            if (errorMessageText == 'success') {
              let tempWnd = window.findWindow('createSubWindowWithOptionsTrue');
              expect(tempWnd == null).assertTrue();
              // Uec组件显示
              let changeUecVisible = await driver.findComponent(ON.id('changeVisibleBtn'))
              console.log(caseName + ' changeUecVisible : ' + changeUecVisible);
              await sleep(1000)
              await changeUecVisible.click()
              await sleep(1000)
              let tempWnd2 = window.findWindow('createSubWindowWithOptionsTrue');
              expect(tempWnd2 != null).assertTrue();
              await subWindowClass.destroyWindow()
              done();
            } else if (errorMessageText == '801') {
              await subWindowClass.destroyWindow()
              done();
            } else {
              expect().assertFail()
              await subWindowClass.destroyWindow()
              done();
            }
           } else {
              await subWindowClass.destroyWindow()
              done();
           }
        } catch (exception) {
          console.error(caseName + 'Failed, cause:  ' + JSON.stringify(exception))
          await subWindowClass?.destroyWindow()
          expect().assertFail()
          done()
        }
      }

    })

    /**
     * @tc.name   testCreateSubWindowWithOptionsFollowFalse
     * @tc.number SUB_WMS_UEC_CREATE_SUBWINDOW_FOLLOW_0200
     * @tc.desc   testCreateSubWindowWithOptionsFollowFalse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSubWindowWithOptionsFollowFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testCreateSubWindowWithOptionsFollowFalse';
      console.log(caseName + 'start run');
      let isSupport = canIUse('SystemCapability.Window.SessionManager')
      console.log(caseName + ' isSupport: ' + isSupport);
      if (!isSupport) {
        done()
      } else {
        let subWindowClass: window.Window | undefined;
        try {
          subWindowClass = await windowStage.createSubWindow('testCreateSubWindowWithOptionsFollowFalse');
          await subWindowClass.setUIContent('testability/pages/WindowTest/EmbeddedComponentCreateSubWindowOptionsFalsePage');
          await subWindowClass.showWindow();
          await sleep(2000);
          // extensionWindow?.createSubWindowWithOptions
          let btn = await driver.findComponent(ON.id('createSubWindowWithOptionsFalse'))
          console.log(caseName + ' btn : ' + btn);
          if (btn != null) {
            await btn.click()
            await sleep(1000)
            // 获取接口返回信息
            let errorMessage = await driver.findComponent(ON.id('errorMessage'))
            let errorMessageText = await errorMessage.getText()
            console.log(caseName + 'errorMessageText : ' + errorMessageText)
            if (errorMessageText == 'success') {
              let tempWnd = window.findWindow('createSubWindowWithOptionsFalse');
              expect(tempWnd == null).assertTrue();
              // Uec组件显示
              let changeUecVisible = await driver.findComponent(ON.id('changeVisibleBtn'))
              console.log(caseName + ' changeUecVisible : ' + changeUecVisible);
              await sleep(1000)
              await changeUecVisible.click()
              await sleep(1000)
              let tempWnd2 = window.findWindow('createSubWindowWithOptionsFalse');
              expect(tempWnd2 == null).assertTrue();
              await subWindowClass.destroyWindow()
              done();
            } else if (errorMessageText == '801') {
              await subWindowClass.destroyWindow()
              done();
            } else {
              expect().assertFail()
              await subWindowClass.destroyWindow()
              done();
            }
          } else {
            await subWindowClass.destroyWindow()
            done();
          }
        } catch (exception) {
          console.error(caseName + 'Failed, cause:  ' + JSON.stringify(exception))
          await subWindowClass?.destroyWindow()
          expect().assertFail()
          done()
        }
      }

    })

  })
}

