/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll,beforeEach} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { canIUse } from "@internal.full.global";
import display from '@ohos.display';
import { Driver } from '@ohos.UiTest';
import { ON } from '@ohos.UiTest';
import window from '@ohos.window';
import uiExtension from '@ohos.arkui.uiExtension';
import { UIContext } from '@ohos.arkui.UIContext';
import { AppStorage , LocalStorage } from '@ohos.arkui.stateManagement';
import type { AsyncCallback, Callback} from '@ohos.base'
import common from '@ohos.app.ability.common';
import deviceInfo from '@ohos.deviceInfo';
import Want from '@ohos.app.ability.Want';
import bundleManager from '@ohos.bundle.bundleManager';
import StartOptions from '@ohos.app.ability.StartOptions'
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
async function startAbility(caseName: string, context: common.UIAbilityContext, options?: StartOptions) : Promise<window.WindowStage> {
    
        let want: Want = {
            bundleName: "com.example.actswindowtest.static",
            abilityName: 'StartAbility'
        };
        if (options) {
            context.startAbility(want, options).then(() => {
                hilog.info(domain, tag, `${caseName} Succeeded in starting ability.`);
            }).catch((err: Error):PromiseLike<void>|undefined => {
                hilog.info(domain, tag, `${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
            });
        } else {
            context.startAbility(want).then(() => {
                hilog.info(domain, tag, `${caseName} Succeeded in starting ability.`);
            }).catch((err: Error):PromiseLike<void>|undefined => {
                hilog.info(domain, tag, `${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
            });
        }
        await Utils.msSleep(1000)
        let windowStageStart:window.WindowStage = AppStorage.get<window.WindowStage>('windowStageStart') as window.WindowStage;
        return windowStageStart;
    
}
async function terminateAbility(caseName: string) {
    let pageContext:common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('pageContext') as common.UIAbilityContext
    try {
        if (pageContext !== null && pageContext !== undefined) {
            console.log(`${caseName} terminateSelf begin`);
        }
        pageContext.terminateSelf().then(() => {
            console.log(`${caseName} terminateSelf success`);
        }).catch((err: Error):PromiseLike<void>|undefined => {
            console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
        });
    } catch (e) {
        console.error(`${caseName} pageContext.terminateSelf fail, err: ${JSON.stringify(e)}`);
    }
    await Utils.msSleep(1000)
}
export default function UIExtensionTest() {

    describe("UIExtensionTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'WindowZindexTest describe start');
        let windowStage: window.WindowStage | undefined;
        let win: window.Window | undefined;
        let tempWnd: window.Window | undefined;
        let subWin: window.Window | undefined;
        let context: common.UIAbilityContext | undefined;
        let windowclassArr:Array<window.Window>;
        let windowClass: window.Window | undefined;
        let isFreeWindowMode:boolean = false;
        let deviceType:string = deviceInfo.deviceType;
        hilog.info(domain, tag, `deviceType: ${deviceType}`);
        beforeAll(async () => {
            try {
                windowStage = AppStorage.get<window.WindowStage>('windowStage') as window.WindowStage;
                let mainWindowClass:window.Window = windowStage!.getMainWindowSync();
                isFreeWindowMode = mainWindowClass.isInFreeWindowMode();
                win = AppStorage.get<window.Window>('mainWindow') as window.Window;
                windowClass = AppStorage.get<window.Window>('mainWindow') as window.Window;
                context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
            } catch (e) {
                hilog.info(domain, tag, '%{public}s', 'getANI fail = ' + JSON.stringify(e));
            }

            hilog.info(domain, tag, '%{public}s', 'getANI windowStage = ' + JSON.stringify(windowStage));
            hilog.info(domain, tag, '%{public}s', 'getANI win = ' + JSON.stringify(win));
            
            try{
                windowclassArr = await windowStage!.getSubWindow();
                hilog.info(domain, tag,`brforeAll getSubWindow success. Cause: ${JSON.stringify(windowclassArr)}`);
                if(windowclassArr.length!=0){
                    for(let i = 0;i<windowclassArr.length;i++){
                        await windowclassArr[i].destroyWindow();
                        hilog.info(domain, tag,`brforeAll destroyWindow windowclassArr ${i} success`);
                    }
                }
            }catch (err) {
                hilog.error(domain, tag,`brforeAll destroyWindow failed`+ err);
            }
        })
        
        /**
     * @tc.name   testUIExtensionHostWindowProxyRectTest
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_UIEXTENSION_WINDOWPROXY_JS_API_0100
     * @tc.desc   Obtain the configuration of window transition animations in specific scenarios.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUIExtensionHostWindowProxyRectTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName = 'testUIExtensionHostWindowProxyRectTest';
        console.log(caseName + 'start run');
        if (deviceType !== '2in1') {
          console.log(caseName + 'device not support')
          done()
        } else {
          let windowClass = windowStage!.getMainWindowSync();
          await windowClass!.setUIContent('pages/WindowTest/EmbeddedComponentPage');
          await Utils.msSleep(2000);
          let driver: Driver = Driver.create();
          let btn = await driver.findComponent(ON.id('Button'));
          console.log(caseName + ' btn1 : ' + btn);
          await btn!.click();
          await Utils.msSleep(1000);
          let btn2 = await driver.findComponent(ON.id('HelloWorld'));
  
          let txt = await btn2!.getText();
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
    it('testUIExtensionHostRectChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName = 'testUIExtensionHostRectChange';
        console.log(caseName + 'start run');
        try {
          let options: window.SubWindowOptions = {
            title: 'subWindow',
            decorEnabled: true
          }
          console.log(caseName + 'start run')
          windowStage!.createSubWindowWithOptions('subWindowRectChange', options).then(async (subWindowClass: window.Window) => {
            await subWindowClass!.setUIContent('pages/WindowTest/EmbeddedComponentRectPage')
            subWindowClass!.resizeAsync(1000, 1200)
            subWindowClass!.moveWindowToAsync(300, 200)
            await subWindowClass!.showWindow()
  
            console.log(caseName + 'after createSubWindow')
  
            await Utils.msSleep(1000)
            let driver: Driver = Driver.create();
            let btn = await driver.findComponent(ON.id('button'))
            console.log(caseName + ' btn : ' + btn);
            if (deviceType !== '2in1') {
              console.log(caseName + 'device not support')
            } else {
              await btn!.click()
              await Utils.msSleep(1000)
  
              subWindowClass!.resizeAsync(1200, 800)
              await Utils.msSleep(300);
              console.log(caseName + 'resizeAsync success');
              subWindowClass!.moveWindowToAsync(0, 0)
  
              let hw = await driver.findComponent(ON.id('testNum'))
              let testNum = await hw!.getText()
              console.log(caseName + 'testNum : ' + testNum)
              // pad设备不支持监听，rectChange报801
              expect(testNum == '2' || testNum == '801').assertTrue()
              await subWindowClass!.destroyWindow()
            }
            done()
          }).catch((error: Error) => {
            console.log(caseName + 'Failed to create the subwindow. Cause: ' + JSON.stringify(error));
            if (error.code == 1300002) {
              console.log(caseName + 'device not support')
  
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (exception) {
          console.log(caseName + 'Failed ' + exception.code + exception.message)
          expect().assertFail()
          done()
        }
      })
  
      /**
       * @tc.name   testUIExtensionHostOffRectChange01
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_UIEXTENSION_OFFRECTCHANGE_JS_API_0100
       * @tc.desc   testUIExtensionHostOffRectChange01 Register twice and unregister one
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testUIExtensionHostOffRectChange01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let caseName = 'testUIExtensionHostOffRectChange01 ';
        console.log(caseName + 'start run');
        try {
          let options: window.SubWindowOptions = {
            title: 'subWindow',
            decorEnabled: true
          }
          console.log(caseName + 'start run')
          windowStage!.createSubWindowWithOptions('subWindowOffRectChange1', options).then(async (subWindowClass: window.Window) => {
            await subWindowClass!.setUIContent('pages/WindowTest/EmbeddedComponentRectPage')
            subWindowClass!.resizeAsync(1000, 1200)
            subWindowClass!.moveWindowToAsync(300, 200)
            await subWindowClass!.showWindow()
  
            console.log(caseName + 'after createSubWindow')
  
            await Utils.msSleep(1000)
            let driver: Driver = Driver.create();
            let btn = await driver.findComponent(ON.id('off_single'))
            console.log(caseName + ' btn : ' + btn);
            if (deviceType !== '2in1') {
              console.log(caseName + 'device not support')
            } else {
              // 点击按钮 执行两次on('rectChange')， 并执行一个off('rectchange')
              await btn!.click()
              await Utils.msSleep(1000)
  
              // 触发两次rectChange
              subWindowClass!.resizeAsync(1200, 800)
              subWindowClass!.moveWindowToAsync(0, 0)
  
              let hw = await driver.findComponent(ON.id('testNum'))
              let testNum = await hw!.getText()
              console.log(caseName + 'testNum : ' + testNum)
              // 只有一个回调函数被响应, pad设备不支持监听，rectChange报801
              expect(testNum == '2' || testNum == '801').assertTrue()
              await subWindowClass!.destroyWindow()
            }
            done()
          }).catch((error: Error) => {
            console.log(caseName + 'Failed to create the subwindow. Cause: ' + JSON.stringify(error));
            if (error.code == 1300002) {
              console.log(caseName + 'device not support')
  
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (exception) {
          console.log(caseName + 'Failed ' + exception.code + exception.message)
          expect().assertFail()
          done()
        }
      })
  
      /**
       * @tc.name   testUIExtensionHostOffRectChange02
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_UIEXTENSION_OFFRECTCHANGE_JS_API_0200
       * @tc.desc   testUIExtensionHostOffRectChange02 register twice and unregister all of them
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testUIExtensionHostOffRectChange02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let caseName = 'testUIExtensionHostOffRectChange02 ';
        console.log(caseName + 'start run');
        try {
          let options: window.SubWindowOptions = {
            title: 'subWindow',
            decorEnabled: true
          }
          console.log(caseName + 'start run')
          windowStage!.createSubWindowWithOptions('subWindowOffRectChange2', options).then(async (subWindowClass: window.Window) => {
            await subWindowClass!.setUIContent('pages/WindowTest/EmbeddedComponentRectPage')
            subWindowClass!.resizeAsync(1000, 1200)
            subWindowClass!.moveWindowToAsync(300, 200)
            await subWindowClass!.showWindow()
  
            console.log(caseName + 'after createSubWindow')
  
            await Utils.msSleep(1000)
            let driver: Driver = Driver.create();
            let btn = await driver.findComponent(ON.id('off_all'))
            console.log(caseName + ' btn : ' + btn);
            if (deviceType !== '2in1') {
              console.log(caseName + 'device not support')
            } else {
              // 点击按钮 执行两次on('rectChange')， 并执行一个off('rectchange')
              await btn!.click()
              await Utils.msSleep(1000)
  
              // 触发两次rectChange
              subWindowClass!.resizeAsync(1200, 800)
              subWindowClass!.moveWindowToAsync(0, 0)
  
              let hw = await driver.findComponent(ON.id('testNum'))
              let testNum = await hw!.getText()
              console.log(caseName + 'testNum : ' + testNum)
              // 没有回调函数被响应, 设备不支持监听时报801
              expect(testNum == '0' || testNum == '801').assertTrue()
              await subWindowClass!.destroyWindow()
            }
            done()
          }).catch((error: Error) => {
            console.log(caseName + 'Failed to create the subwindow. Cause: ' + JSON.stringify(error));
            if (error.code == 1300002) {
              console.log(caseName + 'device not support')
  
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (exception) {
          console.log(caseName + 'Failed ' + exception.code + exception.message)
          expect().assertFail()
        }
      })
  
      /**
       * @tc.name   testUIExtensionHostOccupyEvents
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_UIEXTENSION_OCCUPYEVENTS_JS_API_0100
       * @tc.desc   testUIExtensionHostOccupyEvents with click and longPress
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('testUIExtensionHostOccupyEvents', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName = 'testUIExtensionHostOccupyEvents ';
        console.log(caseName + 'start run');
        try {
          let options: window.SubWindowOptions = {
            title: 'subWindow',
            decorEnabled: true
          }
          console.log(caseName + 'start run')
          windowStage!.createSubWindowWithOptions('subWindowOccupyEvents', options).then(async (subWindowClass: window.Window) => {
            await subWindowClass!.setUIContent('pages/WindowTest/EmbeddedComponentOccupyPage')
            subWindowClass!.resizeAsync(1000, 1200)
            subWindowClass!.moveWindowToAsync(300, 200)
            await subWindowClass!.showWindow()
  
            console.log(caseName + 'after createSubWindow')
  
            await Utils.msSleep(1000)
            let driver: Driver = Driver.create();
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
            if (deviceType !== '2in1') {
              console.log(caseName + 'device not support')
            } else {
              // 点击开启UEC组件click和longPress独占事件
              await btn!.click()
              await Utils.msSleep(1000)
  
              let clickNumParentText1 = await clickNumParent!.getText()
              console.log(caseName + 'clickNumParentText1 : ' + clickNumParentText1)
  
              // 触发UEC组件click事件
              await btnClick!.click()
              await Utils.msSleep(500)
  
              let clickNumText = await clickNum!.getText()
              console.log(caseName + 'clickNumText : ' + clickNumText)
              // 子组件响应次数为1
              expect(clickNumText == '1').assertTrue()
  
              let clickNumParentText2 = await clickNumParent!.getText()
              console.log(caseName + 'clickNumParentText2 : ' + clickNumParentText2)
              // 宿主不响应点击事件
              expect(clickNumParentText1 == clickNumParentText2).assertTrue()
  
              // 触发UEC组件长按事件
              await btnClick!.longClick()
              let longPressNumText = await longPressNum!.getText()
              let longPressNumParentText = await longPressNumParent!.getText()
              console.log(caseName + 'longPressNumText : ' + longPressNumText + '; longPressNumParentText : ' + longPressNumParentText)
              // UEC响应长按事件
              expect(longPressNumText != '0').assertTrue()
              // 宿主不响应长按事件
              expect(longPressNumParentText == '0').assertTrue()
              await subWindowClass!.destroyWindow()
            }
            done()
          }).catch((error: Error) => {
            console.log(caseName + 'Failed to create the subwindow. Cause: ' + JSON.stringify(error));
            if (error.code == 1300002) {
              console.log(caseName + 'device not support')
  
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (exception) {
          console.log(caseName + 'Failed ' + exception.code + exception.message)
          expect().assertFail()
          done()
        }
      })
  
      /**
       * @tc.name   testUIExtensionHostCreateSubWindowWithOptions1
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_UIEXTENSION_CREATESUBWINDOWWITHOPTIONS_0100
       * @tc.desc   testUIExtensionHostCreateSubWindowWithOptions1
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('testUIExtensionHostCreateSubWindowWithOptions1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName = 'testUIExtensionHostCreateSubWindowWithOptions1 ';
        console.log(caseName + 'start run');
        try {
          let options: window.SubWindowOptions = {
            title: 'subWindow',
            decorEnabled: true
          }
          console.log(caseName + 'start run')
          windowStage!.createSubWindowWithOptions('subWindowOccupyEvents', options).then(async (subWindowClass: window.Window) => {
            await subWindowClass!.setUIContent('pages/WindowTest/EmbeddedComponentErrorCodePage')
            subWindowClass!.resizeAsync(1000, 1200)
            subWindowClass!.moveWindowToAsync(300, 200)
            await subWindowClass!.showWindow()
  
            console.log(caseName + 'after createSubWindow')
  
            await Utils.msSleep(1000)
            // extensionWindow?.createSubWindowWithOptions('', null)
            let driver: Driver = Driver.create();
            let btn = await driver.findComponent(ON.id('createSubWindowWithOptions1'))
            console.log(caseName + ' btn : ' + btn);
            // 只针对pc设备
            if (deviceType !== '2in1') {
              console.log(caseName + 'device not support')
            } else {
              // 执行extensionWindow?.createSubWindowWithOptions('', null)
              await btn!.click()
              await Utils.msSleep(1000)
  
              // 获取接口返回信息
              let errorMessage = await driver.findComponent(ON.id('errorMessage'))
              let errorMessageText = await errorMessage!.getText()
              console.log(caseName + 'errorMessageText : ' + errorMessageText)
              if(errorMessageText === 'success'){
                await subWindowClass!.destroyWindow()
                done();
              }else if(errorMessageText === '801'){
                await subWindowClass!.destroyWindow()
                done();
              }else{
                await subWindowClass!.destroyWindow()
                expect(false).assertTrue();
                done();
              }
              
            }
            done()
          }).catch((error: Error) => {
            console.log(caseName + 'Failed to create the subwindow. Cause: ' + JSON.stringify(error));
            if (error.code == 1300002) {
              console.log(caseName + 'device not support')
  
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (exception) {
          console.log(caseName + 'Failed ' + exception.code + exception.message)
          expect().assertFail()
          done()
        }
      })
      /**
       * @tc.name   testUIExtensionHostCreateSubWindowWithOptions2
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_UIEXTENSION_CREATESUBWINDOWWITHOPTIONS_0200
       * @tc.desc   testUIExtensionHostCreateSubWindowWithOptions2
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       * 
       */
      it('testUIExtensionHostCreateSubWindowWithOptions2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName = 'testUIExtensionHostCreateSubWindowWithOptions2 ';
        console.log(caseName + 'start run');
        try {
          let options: window.SubWindowOptions = {
            title: 'subWindow',
            decorEnabled: true
          }
          console.log(caseName + 'start run')
          windowStage!.createSubWindowWithOptions('subWindowOccupyEvents', options).then(async (subWindowClass: window.Window) => {
            await subWindowClass!.setUIContent('pages/WindowTest/EmbeddedComponentErrorCodePage')
            subWindowClass!.resizeAsync(1000, 1200)
            subWindowClass!.moveWindowToAsync(300, 200)
            await subWindowClass!.showWindow()
  
            console.log(caseName + 'after createSubWindow')
  
            await Utils.msSleep(1000)
            let driver: Driver = Driver.create();
            // extensionWindow?.createSubWindowWithOptions('', null)
            let btn = await driver.findComponent(ON.id('createSubWindowWithOptions2'))
            console.log(caseName + ' btn : ' + btn);
            // 只针对pc设备
            if (deviceType !== '2in1') {
              console.log(caseName + 'device not support')
            } else {
              // 执行extensionWindow?.createSubWindowWithOptions('', null)
              await btn!.click()
              await Utils.msSleep(1000)
  
              // 获取接口返回信息
              let errorMessage = await driver.findComponent(ON.id('errorMessage'))
              let errorMessageText = await errorMessage!.getText()
              console.log(caseName + 'errorMessageText : ' + errorMessageText)
              if(errorMessageText === '401'){
                await subWindowClass!.destroyWindow()
                done();
              }else if(errorMessageText === '801'){
                await subWindowClass!.destroyWindow()
                done();
              }else{
                await subWindowClass!.destroyWindow()
                expect(false).assertTrue();
                done();
              }
              
            }
            done()
          }).catch((error: Error) => {
            console.log(caseName + 'Failed to create the subwindow. Cause: ' + JSON.stringify(error));
            if (error.code == 1300002) {
              console.log(caseName + 'device not support')
  
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (exception) {
          console.log(caseName + 'Failed ' + exception.code + exception.message)
          expect().assertFail()
          done()
        }
      })
  
      /**
       * @tc.name   testOnuiExtensionLimitChange_DestoryedSubWindow
       * @tc.number SUB_BASIC_WMS_WINDOW_ON_UIEXTENSION_SECURElIMITCHANGE_ERROECODE_0100
       * @tc.desc   testOnuiExtensionLimitChange_DestoryedSubWindow
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testOnuiExtensionLimitChange_DestoryedSubWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName = 'testOnuiExtensionLimitChange_DestoryedSubWindow';
        let subWindowClass = await windowStage!.createSubWindow('testOnuiExtensionLimitChange_DestoryedSubWindow');
        await subWindowClass!.destroyWindow();
        try {
          const callback = (data: boolean) => { };
          subWindowClass!.onUiExtensionSecureLimitChange(callback);
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
      it('testOffuiExtensionLimitChange_DestoryedSubWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName = 'testOffuiExtensionLimitChange_DestoryedSubWindow';
        let subWindowClass = await windowStage!.createSubWindow('testOffuiExtensionLimitChange_DestoryedSubWindow');
        await subWindowClass!.destroyWindow();
        try {
          const callback = (data: boolean) => { };
          subWindowClass!.offUiExtensionSecureLimitChange(callback);
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
      it('testCreateSubWindowWithOptionsFollowTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName = 'testCreateSubWindowWithOptionsFollowTrue ';
        console.log(caseName + 'start run');
        let isSupport = canIUse('SystemCapability.Window.SessionManager')
        console.log(caseName + ' isSupport: ' + isSupport);
        if (!isSupport) {
          done()
        } else {
          let subWindowClass: window.Window | undefined;
          try {
            subWindowClass = await windowStage!.createSubWindow('testCreateSubWindowWithOptionsFollowTrue');
            await subWindowClass!.setUIContent('pages/WindowTest/EmbeddedComponentCreateSubWindowOptionsTruePage');
            await subWindowClass!.showWindow();
            await Utils.msSleep(2000);
            // extensionWindow?.createSubWindowWithOptions
            let driver: Driver = Driver.create();
            let btn = await driver.findComponent(ON.id('createSubWindowWithOptionsTrue'))
            console.log(caseName + ' btn : ' + btn);
            if (deviceType === '2in1') {
              await btn!.click()
              await Utils.msSleep(1000)
              // 获取接口返回信息
              let errorMessage = await driver.findComponent(ON.id('errorMessage'))
              let errorMessageText = await errorMessage!.getText()
              console.log(caseName + 'errorMessageText : ' + errorMessageText)
              if (errorMessageText == 'success') {
                let tempWnd = window.findWindow('testCreateSubWindowWithOptionsFollowTrue');
                expect(tempWnd !== null).assertTrue();
                // Uec组件显示
                let changeUecVisible = await driver.findComponent(ON.id('changeVisibleBtn'))
                console.log(caseName + ' changeUecVisible : ' + changeUecVisible);
                await Utils.msSleep(1000)
                await changeUecVisible!.click()
                await Utils.msSleep(1000)
                let subWin = await driver.findComponent(ON.id('subWin'))
                expect(subWin === null).assertTrue();
                await subWindowClass!.destroyWindow()
                done();
              } else if (errorMessageText == '801') {
                await subWindowClass!.destroyWindow()
                done();
              } else {
                expect().assertFail()
                await subWindowClass!.destroyWindow()
                done();
              }
            } else {
              await subWindowClass!.destroyWindow()
              done();
            }
          } catch (exception) {
            console.error(caseName + 'Failed, cause:  ' + exception.code + exception.message)
            await subWindowClass!.destroyWindow()
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
      it('testCreateSubWindowWithOptionsFollowFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName = 'testCreateSubWindowWithOptionsFollowFalse';
        console.log(caseName + 'start run');
        let isSupport = canIUse('SystemCapability.Window.SessionManager')
        console.log(caseName + ' isSupport: ' + isSupport);
        if (!isSupport) {
          done()
        } else {
          let subWindowClass: window.Window | undefined;
          try {
            subWindowClass = await windowStage!.createSubWindow('testCreateSubWindowWithOptionsFollowFalse');
            await subWindowClass!.setUIContent('pages/WindowTest/EmbeddedComponentCreateSubWindowOptionsFalsePage');
            await subWindowClass!.showWindow();
            await Utils.msSleep(2000);
            // extensionWindow?.createSubWindowWithOptions
            let driver: Driver = Driver.create();
            let btn = await driver.findComponent(ON.id('createSubWindowWithOptionsFalse'))
            console.log(caseName + ' btn : ' + btn);
            if (deviceType === '2in1') {
              await btn!.click()
              await Utils.msSleep(1000)
              // 获取接口返回信息
              let errorMessage = await driver.findComponent(ON.id('errorMessage'))
              let errorMessageText = await errorMessage!.getText()
              console.log(caseName + 'errorMessageText : ' + errorMessageText)
              if (errorMessageText == 'success') {
                // 隐藏UEC组件
                let changeUecVisible = await driver.findComponent(ON.id('changeVisibleBtn'))
                console.log(caseName + ' changeUecVisible : ' + changeUecVisible);
                await changeUecVisible!.click()
                await Utils.msSleep(1000)
                // 断言组件隐藏后子窗消失
                let subWin = await driver.findComponent(ON.id('subWin'));
                console.log(caseName + ' subWin : ' + subWin);
                expect(subWin !== undefined).assertTrue();
                await subWindowClass!.destroyWindow()
                done();
              } else if (errorMessageText == '801') {
                await subWindowClass!.destroyWindow()
                done();
              } else {
                expect().assertFail()
                await subWindowClass!.destroyWindow()
                done();
              }
            } else {
              await subWindowClass!.destroyWindow()
              done();
            }
          } catch (exception) {
            console.error(caseName + 'Failed, cause:  ' + exception.code + exception.message)
            await subWindowClass!.destroyWindow()
            expect().assertFail()
            done()
          }
        }
  
      })
  
      /**
       * @tc.name   SUB_WMS_UEC_offAvoidAreaChange_0100
       * @tc.number SUB_WMS_UEC_offAvoidAreaChange_0100
       * @tc.desc   SUB_WMS_UEC_offAvoidAreaChange_0100
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('SUB_WMS_UEC_offAvoidAreaChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName = 'SUB_WMS_UEC_offAvoidAreaChange_0100';
        console.log(caseName + 'start run');
        let subWindowClass: window.Window | undefined;
        try {
          subWindowClass = await windowStage!.createSubWindow('testGetWindowAvoidArea_TYPE_CUTOUT1');
          await subWindowClass!.setUIContent('pages/WindowTest/EmbeddedComponentGetWindowAvoidAreaPage');
          await subWindowClass!.showWindow();
          await Utils.msSleep(2000);
          // extensionWindow?.createSubWindowWithOptions
          let driver: Driver = Driver.create();
          let btn = await driver.findComponent(ON.id('offAvoidAreaChange'))
          console.log(caseName + ' btn : ' + btn);
          if (deviceType === '2in1') {
            await btn!.click()
            await Utils.msSleep(1000)
            // 获取接口返回信息
            let errorMessage = await driver.findComponent(ON.id('errorMessage'))
            let errorMessageText = await errorMessage!.getText()
            console.log(caseName + 'errorMessageText : ' + errorMessageText);
            expect(errorMessageText).assertEqual('success');
            done();
          } else {
            await subWindowClass!.destroyWindow()
            done();
          }
        } catch (exception) {
          console.error(caseName + 'Failed, cause:  ' + exception.code + exception.message)
          await subWindowClass!.destroyWindow()
          expect().assertFail()
          done()
        }
  
  
      })

      /**
       * @tc.name   testGetWindowAvoidArea_TYPE_CUTOUT
       * @tc.number SUB_WMS_UEC_getWindowAvoidArea_0100
       * @tc.desc   testGetWindowAvoidArea_TYPE_CUTOUT
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testGetWindowAvoidArea_TYPE_CUTOUT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName = 'testGetWindowAvoidArea_TYPE_CUTOUT';
        console.log(caseName + 'start run');
        let subWindowClass: window.Window | undefined;
        try {
          subWindowClass = await windowStage!.createSubWindow('testGetWindowAvoidArea_TYPE_CUTOUT');
          await subWindowClass!.setUIContent('pages/WindowTest/EmbeddedComponentGetWindowAvoidAreaPage');
          await subWindowClass!.showWindow();
          await Utils.msSleep(2000);
          // extensionWindow?.createSubWindowWithOptions
          let driver: Driver = Driver.create();
          let btn = await driver.findComponent(ON.id('getWindowAvoidAreaCUTOUT'))
          console.log(caseName + ' btn : ' + btn);
          if (deviceType === '2in1') {
            await btn!.click()
            await Utils.msSleep(1000)
            // 获取接口返回信息
            let errorMessage = await driver.findComponent(ON.id('errorMessage'))
            let errorMessageText = await errorMessage!.getText()
            console.log(caseName + 'errorMessageText : ' + errorMessageText);
  
            if (errorMessageText == 'success') {
              let flag = await driver.findComponent(ON.id('flag'))
              console.log(caseName + 'flag : ' + flag);
              let flagtext = await flag!.getText();
              console.log(caseName + 'flagtext : ' + flagtext);
              expect(flagtext).assertEqual('true');
              await subWindowClass!.destroyWindow()
              done();
            } else if (errorMessageText == '801') {
              await subWindowClass!.destroyWindow()
              done();
            } else {
              expect().assertFail()
              await subWindowClass!.destroyWindow()
              done();
            }
          } else {
            await subWindowClass!.destroyWindow()
            done();
          }
        } catch (exception) {
          console.error(caseName + 'Failed, cause:  ' + exception.code + exception.message)
          await subWindowClass!.destroyWindow()
          expect().assertFail()
          done()
        }
  
  
      })
      /**
       * @tc.name   testGetWindowAvoidArea_TYPE_SYSTEM_GESTURE
       * @tc.number SUB_WMS_UEC_getWindowAvoidArea_0200
       * @tc.desc   testGetWindowAvoidArea_TYPE_SYSTEM_GESTURE
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testGetWindowAvoidArea_TYPE_SYSTEM_GESTURE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName = 'testGetWindowAvoidArea_TYPE_SYSTEM_GESTURE';
        console.log(caseName + 'start run');
        let subWindowClass: window.Window | undefined;
        try {
          subWindowClass = await windowStage!.createSubWindow('testGetWindowAvoidArea_TYPE_SYSTEM_GESTURE');
          await subWindowClass!.setUIContent('pages/WindowTest/EmbeddedComponentGetWindowAvoidAreaPage');
          await subWindowClass!.showWindow();
          await Utils.msSleep(2000);
          // extensionWindow?.createSubWindowWithOptions
          let driver: Driver = Driver.create();
          let btn = await driver.findComponent(ON.id('getWindowAvoidAreaGESTURE'))
          console.log(caseName + ' btn : ' + btn);
          if (deviceType === '2in1') {
            await btn!.click()
            await Utils.msSleep(1000)
            // 获取接口返回信息
            let errorMessage = await driver.findComponent(ON.id('errorMessage'))
            let errorMessageText = await errorMessage!.getText()
            console.log(caseName + 'errorMessageText : ' + errorMessageText);
  
            if (errorMessageText == 'success') {
              let flag = await driver.findComponent(ON.id('flag'))
              console.log(caseName + 'flag : ' + flag);
              let flagtext = await flag!.getText();
              console.log(caseName + 'flagtext : ' + flagtext);
              expect(flagtext).assertEqual('true');
              await subWindowClass!.destroyWindow()
              done();
            } else if (errorMessageText == '801') {
              await subWindowClass!.destroyWindow()
              done();
            } else {
              expect().assertFail()
              await subWindowClass!.destroyWindow()
              done();
            }
          } else {
            await subWindowClass!.destroyWindow()
            done();
          }
        } catch (exception) {
          console.error(caseName + 'Failed, cause:  ' + exception.code + exception.message)
          await subWindowClass!.destroyWindow()
          expect().assertFail()
          done()
        }
  
  
      })
      /**
       * @tc.name   testGetWindowAvoidArea_TYPE_KEYBOARD
       * @tc.number SUB_WMS_UEC_getWindowAvoidArea_0300
       * @tc.desc   testGetWindowAvoidArea_TYPE_KEYBOARD
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testGetWindowAvoidArea_TYPE_KEYBOARD', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName = 'testGetWindowAvoidArea_TYPE_KEYBOARD';
        console.log(caseName + 'start run');
        let subWindowClass: window.Window | undefined;
        try {
          subWindowClass = await windowStage!.createSubWindow('testGetWindowAvoidArea_TYPE_KEYBOARD');
          await subWindowClass!.setUIContent('pages/WindowTest/EmbeddedComponentGetWindowAvoidAreaPage');
          await subWindowClass!.showWindow();
          await Utils.msSleep(2000);
          // extensionWindow?.createSubWindowWithOptions
          let driver: Driver = Driver.create();
          let btn = await driver.findComponent(ON.id('getWindowAvoidAreaKEYBOARD'))
          console.log(caseName + ' btn : ' + btn);
          if (deviceType === '2in1') {
            await btn!.click()
            await Utils.msSleep(1000)
            // 获取接口返回信息
            let errorMessage = await driver.findComponent(ON.id('errorMessage'))
            let errorMessageText = await errorMessage!.getText()
            console.log(caseName + 'errorMessageText : ' + errorMessageText);
  
            if (errorMessageText == 'success') {
              let flag = await driver.findComponent(ON.id('flag'))
              console.log(caseName + 'flag : ' + flag);
              let flagtext = await flag!.getText();
              console.log(caseName + 'flagtext : ' + flagtext);
              expect(flagtext).assertEqual('true');
              await subWindowClass!.destroyWindow()
              done();
            } else if (errorMessageText == '801') {
              await subWindowClass!.destroyWindow()
              done();
            } else {
              expect().assertFail()
              await subWindowClass!.destroyWindow()
              done();
            }
          } else {
            await subWindowClass!.destroyWindow()
            done();
          }
        } catch (exception) {
          console.error(caseName + 'Failed, cause:  ' + exception.code + exception.message)
          await subWindowClass!.destroyWindow()
          expect().assertFail()
          done()
        }
  
  
      })
      /**
       * @tc.name   testGetWindowAvoidArea_TYPE_NAVIGATION_INDICATOR
       * @tc.number SUB_WMS_UEC_getWindowAvoidArea_0400
       * @tc.desc   testGetWindowAvoidArea_TYPE_NAVIGATION_INDICATOR
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testGetWindowAvoidArea_TYPE_NAVIGATION_INDICATOR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName = 'testGetWindowAvoidArea_TYPE_NAVIGATION_INDICATOR';
        console.log(caseName + 'start run');
        let subWindowClass: window.Window | undefined;
        try {
          subWindowClass = await windowStage!.createSubWindow('testGetWindowAvoidArea_TYPE_NAVIGATION_INDICATOR');
          await subWindowClass!.setUIContent('pages/WindowTest/EmbeddedComponentGetWindowAvoidAreaPage');
          await subWindowClass!.showWindow();
          await Utils.msSleep(2000);
          // extensionWindow?.createSubWindowWithOptions
          let driver: Driver = Driver.create();
          let btn = await driver.findComponent(ON.id('getWindowAvoidAreaNAVIGATION_INDICATOR'))
          console.log(caseName + ' btn : ' + btn);
          if (deviceType === '2in1') {
            await btn!.click()
            await Utils.msSleep(1000)
            // 获取接口返回信息
            let errorMessage = await driver.findComponent(ON.id('errorMessage'))
            let errorMessageText = await errorMessage!.getText()
            console.log(caseName + 'errorMessageText : ' + errorMessageText);
  
            if (errorMessageText == 'success') {
              let flag = await driver.findComponent(ON.id('flag'))
              console.log(caseName + 'flag : ' + flag);
              let flagtext = await flag!.getText();
              console.log(caseName + 'flagtext : ' + flagtext);
              expect(flagtext).assertEqual('true');
              await subWindowClass!.destroyWindow()
              done();
            } else if (errorMessageText == '801') {
              await subWindowClass!.destroyWindow()
              done();
            } else {
              expect().assertFail()
              await subWindowClass!.destroyWindow()
              done();
            }
          } else {
            await subWindowClass!.destroyWindow()
            done();
          }
        } catch (exception) {
          console.error(caseName + 'Failed, cause:  ' + exception.code + exception.message)
          await subWindowClass!.destroyWindow()
          expect().assertFail()
          done()
        }
  
  
      })
      /**
       * @tc.name   testOnWindowSizeChange
       * @tc.number SUB_WMS_UEC_OnWindowSizeChange_0100
       * @tc.desc   testOnWindowSizeChange
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testOnWindowSizeChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName = 'testOnWindowSizeChange';
        console.log(caseName + 'start run');
        let subWindowClass: window.Window | undefined;
        try {
          subWindowClass = await windowStage!.createSubWindow('testOnWindowSizeChange');
          await subWindowClass!.setUIContent('pages/WindowTest/EmbeddedComponentGetWindowAvoidAreaPage');
          await subWindowClass!.showWindow();
          await Utils.msSleep(2000);
          // extensionWindow?.createSubWindowWithOptions
          let driver: Driver = Driver.create();
          let btn = await driver.findComponent(ON.id('windowSizeChange'))
          console.log(caseName + ' btn : ' + btn);
          if (deviceType === '2in1') {
            await btn!.click()
            await Utils.msSleep(1000)
            // 获取接口返回信息
            let errorMessage = await driver.findComponent(ON.id('errorMessage'))
            let errorMessageText = await errorMessage!.getText()
            console.log(caseName + 'errorMessageText : ' + errorMessageText);
  
            if (errorMessageText == 'success') {
              let windowSizeChangeWidth = await driver.findComponent(ON.id('windowSizeChangeWidth'))
              console.log(caseName + 'windowSizeChangeWidth : ' + windowSizeChangeWidth);
              await windowSizeChangeWidth!.click();
              await Utils.msSleep(1000);
              let flag = await driver.findComponent(ON.id('flag'))
              console.log(caseName + 'flag : ' + flag);
              let flagtext = await flag!.getText();
              console.log(caseName + 'flagtext : ' + flagtext);
              expect(flagtext).assertEqual('true');
              await subWindowClass!.destroyWindow()
              done();
            } else if (errorMessageText == '801') {
              await subWindowClass!.destroyWindow()
              done();
            } else {
              expect().assertFail()
              await subWindowClass!.destroyWindow()
              done();
            }
          } else {
            await subWindowClass!.destroyWindow()
            done();
          }
        } catch (exception) {
          console.error(caseName + 'Failed, cause:  ' + exception.code + exception.message)
          await subWindowClass!.destroyWindow()
          expect().assertFail()
          done()
        }
  
  
      })
      /**
       * @tc.name   testOffWindowSizeChange
       * @tc.number SUB_WMS_UEC_OffWindowSizeChange_0100
       * @tc.desc   testOffWindowSizeChange
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testOffWindowSizeChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName = 'testOffWindowSizeChange';
        console.log(caseName + 'start run');
        let subWindowClass: window.Window | undefined;
        try {
          subWindowClass = await windowStage!.createSubWindow('testOffWindowSizeChange');
          await subWindowClass!.setUIContent('pages/WindowTest/EmbeddedComponentGetWindowAvoidAreaPage');
          await subWindowClass!.showWindow();
          await Utils.msSleep(2000);
          // extensionWindow?.createSubWindowWithOptions
          let driver: Driver = Driver.create();
          let btn = await driver.findComponent(ON.id('offWindowSizeChange'))
          console.log(caseName + ' btn : ' + btn);
          if (deviceType === '2in1') {
            await btn!.click()
            await Utils.msSleep(1000)
            // 获取接口返回信息
            let errorMessage = await driver.findComponent(ON.id('errorMessage'))
            let errorMessageText = await errorMessage!.getText()
            console.log(caseName + 'errorMessageText : ' + errorMessageText);
  
            if (errorMessageText == 'success') {
              let windowSizeChangeWidth = await driver.findComponent(ON.id('windowSizeChangeWidth'))
              console.log(caseName + 'windowSizeChangeWidth : ' + windowSizeChangeWidth);
              await windowSizeChangeWidth!.click();
              await Utils.msSleep(1000);
              let flag = await driver.findComponent(ON.id('flag'))
              console.log(caseName + 'flag : ' + flag);
              let flagtext = await flag!.getText();
              console.log(caseName + 'flagtext : ' + flagtext);
              expect(flagtext !== 'true').assertTrue();
              await subWindowClass!.destroyWindow()
              done();
            } else if (errorMessageText == '801') {
              await subWindowClass!.destroyWindow()
              done();
            } else {
              expect().assertFail()
              await subWindowClass!.destroyWindow()
              done();
            }
          } else {
            await subWindowClass!.destroyWindow()
            done();
          }
        } catch (exception) {
          console.error(caseName + 'Failed, cause:  ' + exception.code + exception.message)
          await subWindowClass!.destroyWindow()
          expect().assertFail()
          done()
        }
  
  
      })
      /**
       * @tc.name   testOnRectChange
       * @tc.number SUB_WMS_UEC_OnRectChange_0100
       * @tc.desc   testOnRectChange
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testOnRectChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName = 'testOnRectChange';
        console.log(caseName + 'start run');
        let subWindowClass: window.Window | undefined;
        try {
          subWindowClass = await windowStage!.createSubWindow('testOnRectChange');
          await subWindowClass!.setUIContent('pages/WindowTest/EmbeddedComponentGetWindowAvoidAreaPage');
          await subWindowClass!.showWindow();
          await Utils.msSleep(2000);
          // extensionWindow?.createSubWindowWithOptions
          let driver: Driver = Driver.create();
          let btn = await driver.findComponent(ON.id('rectChange'))
          console.log(caseName + ' btn : ' + btn);
          if (deviceType === '2in1') {
            await btn!.click()
            await Utils.msSleep(1000)
            // 获取接口返回信息
            let errorMessage = await driver.findComponent(ON.id('errorMessage'))
            let errorMessageText = await errorMessage!.getText()
            console.log(caseName + 'errorMessageText : ' + errorMessageText);
  
            if (errorMessageText == 'success') {
              let RectChangeHeight = await driver.findComponent(ON.id('RectChangeHeight'))
              console.log(caseName + 'RectChangeHeight : ' + RectChangeHeight);
              await RectChangeHeight!.click();
              await Utils.msSleep(1000);
              let flag = await driver.findComponent(ON.id('flag'))
              console.log(caseName + 'flag : ' + flag);
              let flagtext = await flag!.getText();
              console.log(caseName + 'flagtext : ' + flagtext);
              expect(flagtext).assertEqual('true');
              await subWindowClass!.destroyWindow()
              done();
            } else if (errorMessageText == '801') {
              await subWindowClass!.destroyWindow()
              done();
            } else {
              expect().assertFail()
              await subWindowClass!.destroyWindow()
              done();
            }
          } else {
            await subWindowClass!.destroyWindow()
            done();
          }
        } catch (exception) {
          console.error(caseName + 'Failed, cause:  ' + exception.code + exception.message)
          await subWindowClass!.destroyWindow()
          expect().assertFail()
          done()
        }
  
  
      })
  
      /**
       * @tc.name   testEventFlagEnum
       * @tc.number SUB_WMS_UEC_EVENTFLAG_ENUM_0100
       * @tc.desc   testEventFlagEnum
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testEventFlagEnum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName = 'testEventFlagEnum';
        console.log(caseName + 'start run');
        try {
          expect(uiExtension.EventFlag.EVENT_NONE).assertEqual(0x00000000)
          expect(uiExtension.EventFlag.EVENT_PAN_GESTURE_LEFT).assertEqual(0x00000001)
          expect(uiExtension.EventFlag.EVENT_PAN_GESTURE_RIGHT).assertEqual(0x00000002)
          expect(uiExtension.EventFlag.EVENT_PAN_GESTURE_UP).assertEqual(0x00000004)
          expect(uiExtension.EventFlag.EVENT_PAN_GESTURE_DOWN).assertEqual(0x00000008)
          expect(uiExtension.EventFlag.EVENT_CLICK).assertEqual(0x00000100)
          expect(uiExtension.EventFlag.EVENT_LONG_PRESS).assertEqual(0x00000200)
          expect(uiExtension.RectChangeReason.HOST_WINDOW_RECT_CHANGE).assertEqual(0x0001)
          done()
        } catch (exception) {
          console.error(caseName + 'Failed, cause:  ' + exception.code + exception.message)
          expect().assertFail()
          done()
        }
  
  
      })
      
    })

}