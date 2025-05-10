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
    
    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context))
      windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_UIEXTENSION_WINDOW_JS_API_0100
     * @tc.name      : testUIExtensionHostWindowProxyRect
     * @tc.desc      : Obtain the area that the window rect 
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testUIExtensionHostWindowProxyRect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testUIExtensionHostWindowProxyRectTest';
      console.log(caseName + 'start run');
      let windowClass = windowStage.getMainWindowSync();
      windowClass.setUIContent('testability/pages/WindowTest/EmbeddedComponentPage');
      await sleep(2000);
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('button'));
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_UIEXTENSION_WINDOW_JS_API_0200
     * @tc.name      : testUIExtensionHostRectChange
     * @tc.desc      : Listen the change of rect
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
          subWindowClass.setUIContent('testability/pages/WindowTest/EmbeddedComponentRectPage')
          await subWindowClass.resizeAsync(1000, 1200)
          await subWindowClass.moveWindowToAsync(300, 200)
          subWindowClass.showWindow()

          console.log(caseName + 'after createSubWindow')

          await sleep(1000)
          let driver = Driver.create()
          let btn = await driver.findComponent(ON.id('button'))

          if (btn == undefined) {
            console.log(caseName + 'device not support')
          } else {
            await btn.click()
            await sleep(1000)

            await subWindowClass.resizeAsync(1200, 800)
            await subWindowClass.moveWindowToAsync(0, 0)

            let hw = await driver.findComponent(ON.id('testNum'))
            let testNum = await hw.getText()
            console.log(caseName + 'testNum : ' + testNum)
            expect(testNum == '2').assertTrue()
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_UIEXTENSION_OFFRECTCHANGE_JS_API_0100
     * @tc.name      : testUIExtensionHostOffRectChange01
     * @tc.desc      : testUIExtensionHostOffRectChange01 Register twice and unregister one
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
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
          subWindowClass.setUIContent('testability/pages/WindowTest/EmbeddedComponentRectPage')
          await subWindowClass.resizeAsync(1000, 1200)
          await subWindowClass.moveWindowToAsync(300, 200)
          subWindowClass.showWindow()

          console.log(caseName + 'after createSubWindow')

          await sleep(1000)
          let driver = Driver.create()
          let btn = await driver.findComponent(ON.id('off_single'))

          if (btn == undefined) {
            console.log(caseName + 'device not support')
          } else {
            // 点击按钮 执行两次on('rectChange')， 并执行一个off('rectchange')
            await btn.click()
            await sleep(1000)

            // 触发两次rectChange
            await subWindowClass.resizeAsync(1200, 800)
            await subWindowClass.moveWindowToAsync(0, 0)

            let hw = await driver.findComponent(ON.id('testNum'))
            let testNum = await hw.getText()
            console.log(caseName + 'testNum : ' + testNum)
            // 只有一个回调函数被响应
            expect(testNum == '2').assertTrue()
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_UIEXTENSION_OFFRECTCHANGE_JS_API_0200
     * @tc.name      : testUIExtensionHostOffRectChange02
     * @tc.desc      : testUIExtensionHostOffRectChange02 register twice and unregister all of them
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
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
          subWindowClass.setUIContent('testability/pages/WindowTest/EmbeddedComponentRectPage')
          await subWindowClass.resizeAsync(1000, 1200)
          await subWindowClass.moveWindowToAsync(300, 200)
          subWindowClass.showWindow()

          console.log(caseName + 'after createSubWindow')

          await sleep(1000)
          let driver = Driver.create()
          let btn = await driver.findComponent(ON.id('off_all'))

          if (btn == undefined) {
            console.log(caseName + 'device not support')
          } else {
            // 点击按钮 执行两次on('rectChange')， 并执行一个off('rectchange')
            await btn.click()
            await sleep(1000)

            // 触发两次rectChange
            await subWindowClass.resizeAsync(1200, 800)
            await subWindowClass.moveWindowToAsync(0, 0)

            let hw = await driver.findComponent(ON.id('testNum'))
            let testNum = await hw.getText()
            console.log(caseName + 'testNum : ' + testNum)
            // 没有回调函数被响应
            expect(testNum == '0').assertTrue()
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_UIEXTENSION_RECTCHANGE_JS_API_0200
     * @tc.name      : testUIExtensionHostRectChangeErrorCode401
     * @tc.desc      : testUIExtensionHostRectChangeErrorCode401 when got a callback with null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
          subWindowClass.setUIContent('testability/pages/WindowTest/EmbeddedComponentRectPage')
          await subWindowClass.resizeAsync(1000, 1200)
          await subWindowClass.moveWindowToAsync(300, 200)
          subWindowClass.showWindow()

          console.log(caseName + 'after createSubWindow')

          await sleep(1000)
          let driver = Driver.create()
          let btn = await driver.findComponent(ON.id('button401'))

          // 只针对pc设别
          if (btn == undefined) {
            console.log(caseName + 'device not support')
          } else {

            // 点击执行注册rectChange， 回调函数传null
            await btn.click()
            await sleep(1000)

            await subWindowClass.resizeAsync(1200, 800)
            await subWindowClass.moveWindowToAsync(0, 0)

            let hw = await driver.findComponent(ON.id('errorMessage'))
            let testNum = await hw.getText()
            console.log(caseName + 'testNum : ' + testNum)
            // 传null，错误码为401
            expect(testNum == '401').assertTrue()
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_UIEXTENSION_OCCUPYEVENTS_JS_API_0100
     * @tc.name      : testUIExtensionHostOccupyEvents
     * @tc.desc      : testUIExtensionHostOccupyEvents with click and longPress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
          subWindowClass.setUIContent('testability/pages/WindowTest/EmbeddedComponentOccupyPage')
          await subWindowClass.resizeAsync(1000, 1200)
          await subWindowClass.moveWindowToAsync(300, 200)
          subWindowClass.showWindow()

          console.log(caseName + 'after createSubWindow')

          await sleep(1000)
          let driver = Driver.create()
          // UEC独占事件按钮
          let btn = await driver.findComponent(ON.id('button'))
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_UIEXTENSION_OCCUPYEVENTS_ERRORCODE_JS_API_0100
     * @tc.name      : testUIExtensionHostOccupyEvents_ErrorCode401
     * @tc.desc      : testUIExtensionHostOccupyEvents_ErrorCode401 when got arguments null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
          subWindowClass.setUIContent('testability/pages/WindowTest/EmbeddedComponentOccupyPage')
          await subWindowClass.resizeAsync(1000, 1200)
          await subWindowClass.moveWindowToAsync(300, 200)
          subWindowClass.showWindow()

          console.log(caseName + 'after createSubWindow')

          await sleep(1000)
          let driver = Driver.create()
          // 设置独占事件
          let btn = await driver.findComponent(ON.id('button401'))

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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_UIEXTENSION_AVOIDAREA_ERRORCODE_JS_API_0100
     * @tc.name      : testUIExtensionHostGetAvoidArea_ErrorCode401
     * @tc.desc      : testUIExtensionHostGetAvoidArea_ErrorCode401 when got argument -1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
          subWindowClass.setUIContent('testability/pages/WindowTest/EmbeddedComponentErrorCodePage')
          await subWindowClass.resizeAsync(1000, 1200)
          await subWindowClass.moveWindowToAsync(300, 200)
          subWindowClass.showWindow()

          console.log(caseName + 'after createSubWindow')

          await sleep(1000)
          let driver = Driver.create()
          // 设置独占事件
          let btn = await driver.findComponent(ON.id('getWindowAvoidArea401'))

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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_UIEXTENSION_AVOIDAREA_ERRORCODE_JS_API_0200
     * @tc.name      : testUIExtensionHostOnAvoidAreaChange_ErrorCode401
     * @tc.desc      : testUIExtensionHostOnAvoidAreaChange_ErrorCode401 when got callback with null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
          subWindowClass.setUIContent('testability/pages/WindowTest/EmbeddedComponentErrorCodePage')
          await subWindowClass.resizeAsync(1000, 1200)
          await subWindowClass.moveWindowToAsync(300, 200)
          subWindowClass.showWindow()

          console.log(caseName + 'after createSubWindow')

          await sleep(1000)
          let driver = Driver.create()
          // 设置独占事件
          let btn = await driver.findComponent(ON.id('onAvoidAreaChange401'))

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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_UIEXTENSION_WINDOWSIZECHANGE_ERRORCODE_JS_API_0100
     * @tc.name      : testUIExtensionHostOnWindowSizeChange_ErrorCode401
     * @tc.desc      : testUIExtensionHostOnWindowSizeChange_ErrorCode401 when got callback with null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
          subWindowClass.setUIContent('testability/pages/WindowTest/EmbeddedComponentErrorCodePage')
          await subWindowClass.resizeAsync(1000, 1200)
          await subWindowClass.moveWindowToAsync(300, 200)
          subWindowClass.showWindow()

          console.log(caseName + 'after createSubWindow')

          await sleep(1000)
          let driver = Driver.create()
          // 设置独占事件
          let btn = await driver.findComponent(ON.id('onWindowSizeChange401'))

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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_UIEXTENSION_CREATESUBWINDOWWITHOPTIONS_ERRORCODE_JS_API_0100
     * @tc.name      : testUIExtensionHostOnWindowSizeChange_ErrorCode401
     * @tc.desc      : testUIExtensionHostOnWindowSizeChange_ErrorCode401 when got callback with null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
          subWindowClass.setUIContent('testability/pages/WindowTest/EmbeddedComponentErrorCodePage')
          await subWindowClass.resizeAsync(1000, 1200)
          await subWindowClass.moveWindowToAsync(300, 200)
          subWindowClass.showWindow()

          console.log(caseName + 'after createSubWindow')

          await sleep(1000)
          let driver = Driver.create()
          // extensionWindow?.createSubWindowWithOptions('createSubWindowWithOptions401', null)
          let btn = await driver.findComponent(ON.id('createSubWindowWithOptions401'))

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
    
  })
}

