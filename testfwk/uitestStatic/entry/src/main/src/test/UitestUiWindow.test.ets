/**
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
import { beforeAll, beforeEach, describe, it, expect,TestType, Size, Level } from "../../../hypium/index"
import { Component, Driver, ON, On, MatchPattern, MouseButton, WindowMode, UIElementInfo, UiDirection, PointerMatrix, DisplayRotation, ResizeDirection } from '@ohos.UiTest'
import  hilog  from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import { Utils, startAbility, stopApplication } from './Util.test';
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'uitestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const waitUiReadyMs : int = 1000;
const DeviceErrorCode = 17000005;

async function exitInputMethod() {
  let driver = Driver.create()
  let softKeyBoard = await driver.findComponent(ON.type('Canvas'))
  if (softKeyBoard != null) {
    await driver.pressBack()
  }
}

function sleep(numberMillis: int) {
  const exitTime = new Date().getTime() + numberMillis;
  while (new Date().getTime() < exitTime) { }
  return
}

export default function uitestUiWindowTest() {
  describe('uitestUiWindowTest', (): void => {
    beforeAll(async () : Promise<void> => {
      hilog.info(domain, tag, "uitestUiWindowTest loadup start!!!!!")
      await Utils.msSleep(2000)
      hilog.info(domain, tag, "uitestUiWindowTest loadup over!!!!!")
    })
    beforeEach(async () => {
      await stopApplication('com.uitestScene.acts');
    })

    /*
    * @tc.number: uitestUiWindowTest_0001
    * @tc.name: testSplit_static
    * @tc.desc: change this UiWindow into split screen mode.
    */
    it('testSplit_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      const driver = Driver.create();
      await driver.delayMs(waitUiReadyMs)
      let window1 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
      expect(window1 != null).assertTrue();
      try {
        if (window1 != null) {
          await window1.split();
        }
        await driver.delayMs(waitUiReadyMs)
        let bar = await driver.findComponent(ON.type('DecorBar'))
        expect(bar == null).assertTrue()
      }
      catch (err:BusinessError) {
        if (err.message == 'this device can not support this action') {
          expect(window1 != null).assertTrue()
        } else {
          expect(false).assertTrue()
        }
      }
      await stopApplication('com.uitestScene.acts')
    })

    /*
    * @tc.number: uitestUiWindowTest_0002
    * @tc.name: testResume
    * @tc.desc: change this UiWindow into split screen mode.
    */
    it('testResume', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testResume start `);
      const driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window1 = await driver.findWindow({bundleName:'com.uitestScene.acts'});
      hilog.info(domain, tag, `testResume find window1 success, ${JSON.stringify(window1)}`);
      expect(window1 != null).assertTrue();
      try {
        if (window1 != null) {
          await window1.resume();
          hilog.info(domain, tag, `testResume split resume success`);
        }
      }
      catch (err:BusinessError) {
        hilog.info(domain, tag, `testResume find window1 success, ${JSON.stringify(err)}`);
        if (err.message == 'this device can not support this action') {
          expect(window1 != null).assertTrue()
        } else {
          expect(false).assertTrue()
        }
      }
      hilog.info(domain, tag, `testResume end `);
      await stopApplication('com.uitestScene.acts')
    })

    /*
    * @tc.number: uitestUiWindowTest_0003
    * @tc.name: testWindowResizeA_static
    * @tc.desc: resize this UiWindow to the specified size for the specified direction.
    */
    it('testWindowResizeA_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testWindowResizeA_static start `);
      const driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({bundleName:'com.uitestScene.acts'});
      hilog.info(domain, tag, `testWindowResizeA_static  window , ${JSON.stringify(window)}`);
      expect(window != null).assertTrue();
      try{
        if (window != null) {
          let windowMode = await window.getWindowMode();
          if (windowMode != WindowMode.FLOATING) {
            await window.resume();
          }
          await driver.delayMs(1000);
          let window1 = await driver.findWindow({bundleName:'com.uitestScene.acts'});
          hilog.info(domain, tag, `testWindowResizeA_static  window1 , ${JSON.stringify(window1)}`);
          expect(window1 != null).assertTrue();
          if (window1 != null ) {
            let bounds1 = await window1.getBounds();
            hilog.info(domain, tag, `testWindowResizeA_static bounds1, ${ JSON.stringify(bounds1)} `);
            await window1.resize(600,600,ResizeDirection.RIGHT_DOWN);
            let window2 = await driver.findWindow({bundleName:'com.uitestScene.acts'});
            hilog.info(domain, tag, `testWindowResizeA_static  window2 , ${JSON.stringify(window2)}`);
            expect(window2 != null).assertTrue();
            if (window2 != null) {
              let bounds2 = await window2.getBounds();
              hilog.info(domain, tag, `testWindowResizeA_static bounds2, ${ JSON.stringify(bounds2)} `);
              expect(bounds2 != bounds1).assertTrue();
              await window2.resize(400,400,ResizeDirection.RIGHT_UP);
              let window3 = await driver.findWindow({bundleName:'com.uitestScene.acts'});
              hilog.info(domain, tag, `testWindowResizeA_static  window3 , ${JSON.stringify(window3)}`);
              expect(window3 != null).assertTrue();
              if (window3 != null) {
                let bounds3= await window3.getBounds();
                hilog.info(domain, tag, `testWindowResizeA_static bounds3, ${ JSON.stringify(bounds3)} `);
                expect(bounds3 != bounds2).assertTrue();
                await window3.resize(300,300,ResizeDirection.LEFT_DOWN);
                let window4 = await driver.findWindow({bundleName:'com.uitestScene.acts'});
                hilog.info(domain, tag, `testWindowResizeA_static  window4 , ${JSON.stringify(window4)}`);
                expect(window4 != null).assertTrue();
                if (window4 != null) {
                  let bounds4= await window4.getBounds();
                  hilog.info(domain, tag, `testWindowResizeA_static bounds4, ${ JSON.stringify(bounds4)} `);
                  expect(bounds4 != bounds3).assertTrue();
                  await window4.resize(500,500,ResizeDirection.LEFT_UP);
                  let window5 = await driver.findWindow({bundleName:'com.uitestScene.acts'});
                  hilog.info(domain, tag, `testWindowResizeA_static  window5 , ${JSON.stringify(window5)}`);
                  expect(window5 != null).assertTrue();
                  if (window5 != null) {
                    let bounds5= await window5.getBounds();
                    hilog.info(domain, tag, `testWindowResizeA_static bounds5, ${ JSON.stringify(bounds5)} `);
                    expect(bounds5 != bounds4).assertTrue();
                  }
                }
              }
            }
          }
        }
      }
      catch (err:BusinessError) {
        hilog.info(domain, tag, `testWindowResizeA_static error, ${ JSON.stringify(err)} `);
        if (err.message == 'this device can not support this action') {
          expect(window != null).assertTrue()
        } else {
          expect(false).assertTrue()
        }
      }
      hilog.info(domain, tag, `testWindowResizeA_static end `);
      await stopApplication('com.uitestScene.acts')
    })

    /*
    * @tc.number: uitestUiWindowTest_0004
    * @tc.name: testWindowMoveTo_static
    * @tc.desc: move this UiWindow to the specified points.
    */
    it('testWindowMoveTo_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testWindowMoveTo_static start `);
      const driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({bundleName:'com.uitestScene.acts'});
      hilog.info(domain, tag, `testWindowMoveTo_static window, ${ JSON.stringify(window)} `);
      expect(window != null).assertTrue();
      try{
        if (window != null) {
          let windowMode = await window.getWindowMode();
          if (windowMode != WindowMode.FLOATING) {
            await window.resume();
          }
        }
        let window1 = await driver.findWindow({bundleName:'com.uitestScene.acts'});
        hilog.info(domain, tag, `testWindowMoveTo_static window1, ${ JSON.stringify(window1)} `);
        expect(window1 != null).assertTrue();
        if (window1 != null) {
          let bounds1 = await window1.getBounds();
          hilog.info(domain, tag, `testWindowMoveTo_static bounds1, ${ JSON.stringify(bounds1)} `);
          await window1.moveTo(100,100);
          let window2 = await driver.findWindow({bundleName:'com.uitestScene.acts'});
          hilog.info(domain, tag, `testWindowMoveTo_static window2, ${ JSON.stringify(window2)} `);
          expect(window2 != null).assertTrue();
          if (window2 != null) {
            let bounds2 = await window2.getBounds();
            hilog.info(domain, tag, `testWindowMoveTo_static bounds2, ${ JSON.stringify(bounds2)} `);
            expect(bounds1 != bounds2).assertTrue();
          }
        }
      }
      catch (err:BusinessError) {
        hilog.info(domain, tag, `testWindowMoveTo_static error, ${ JSON.stringify(err)} `);
        if (err.message == 'this device can not support this action') {
          expect(window != null).assertTrue()
        } else {
          expect(false).assertTrue()
        }
      }
      hilog.info(domain, tag, `testWindowMoveTo_static end `);
      await stopApplication('com.uitestScene.acts')
    })

    /*
    * @tc.number: uitestUiWindowTest_0005
    * @tc.name: testWindowMinimize_static
    * @tc.desc: minimize this UiWindow.
    */
    it('testWindowMinimize_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testWindowMinimize_static start `);
      const driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({bundleName:'com.uitestScene.acts'})
      hilog.info(domain, tag, `testWindowMinimize_static window, ${ JSON.stringify(window)} `);
      expect(window != null).assertTrue();
      try{
        if (window != null) {
          await window.minimize();
          await driver.delayMs(waitUiReadyMs)
          let window1 = await driver.findWindow({bundleName:'com.uitestScene.acts'});
          hilog.info(domain, tag, `testWindowMinimize_static window1, ${ JSON.stringify(window1)} `);
          expect(window1  == null).assertTrue();
        }
      }
      catch (err:BusinessError) {
        hilog.info(domain, tag, `testWindowMinimize_static error, ${ JSON.stringify(err)} `);
        if (err.message == 'this device can not support this action') {
          expect(window != null).assertTrue()
        } else {
          expect(false).assertTrue()
        }
      }
      hilog.info(domain, tag, `testWindowMinimize_static end `);
      await stopApplication('com.uitestScene.acts')
    })

    /*
    * @tc.number: uitestUiWindowTest_0006
    * @tc.name: testWindowMaximize_static
    * @tc.desc: maximize this UiWindow.
    */
    it('testWindowMaximize_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testWindowMaximize_static start `);
      const driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({bundleName:'com.uitestScene.acts'});
      expect(window != null).assertTrue();
      try{
        if (window != null) {
          let windowMode = await window.getWindowMode();
          if (windowMode != WindowMode.FLOATING) {
            await window.resume();
          }
        }
        let window2 = await driver.findWindow({bundleName:'com.uitestScene.acts'});
        expect(window2 != null).assertTrue();
        if (window2 != null) {
          await window2.maximize();
          hilog.info(domain, tag, `testWindowMaximize_static maximize sccessful`);
        }
      //  await driver.delayMs(1000);
        let window3 = await driver.findWindow({bundleName:'com.uitestScene.acts'});
        hilog.info(domain, tag, `testWindowMaximize_static window3, ${ JSON.stringify(window3)} `);
        expect(window3 != null).assertTrue();
        if (window3 != null) {
          let mode = await window3.getWindowMode();
          hilog.info(domain, tag, `testWindowMaximize_static mode, ${ JSON.stringify(mode)} `);
          expect(mode == WindowMode.FULLSCREEN).assertTrue();
        }
        await stopApplication('com.uitestScene.acts')
      }
      catch (err:BusinessError) {
        hilog.info(domain, tag, `testWindowMaximize_static error, ${ JSON.stringify(err)} `);
        if (err.message == 'this device can not support this action') {
          expect(window != null).assertTrue()
        } else {
          expect(false).assertTrue()
        }
      }
    })

    /*
    * @tc.number: uitestUiWindowTest_0007
    * @tc.name: testWindowIsFocused
    * @tc.desc: testWindowIsFocused.
    */
    it('testWindowIsFocused', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testWindowIsFocused start `);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        await driver.delayMs(waitUiReadyMs)
        let window = await driver.findWindow({bundleName:'com.uitestScene.acts',focused:true});
        hilog.info(domain, tag, `testWindowIsFocused window, ${JSON.stringify(window)} `);
        expect(window != null).assertTrue();
        if (window != null) {
          await window.focus();
          hilog.info(domain, tag, `testWindowIsFocused focus sccessful`);
          let isFocused = await window.isFocused();
          hilog.info(domain, tag, `testWindowIsFocused isFocused, ${JSON.stringify(isFocused)} `);
          expect(isFocused == true).assertTrue()
        }
      } catch(error) {
        hilog.info(domain, tag, `testWindowIsFocused error, ${JSON.stringify(error)} `);
        expect().assertFail()
      }
      hilog.info(domain, tag, `testWindowIsFocused end `);
      await stopApplication('com.uitestScene.acts')
    })

    /*
    * @tc.number: uitestUiWindowTest_0008
    * @tc.name: testWindowIsActive
    * @tc.desc: testWindowIsFocused.
    */
    it('testWindowIsActive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testWindowIsActive start `);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        await driver.delayMs(waitUiReadyMs)
        let window = await driver.findWindow({bundleName:'com.uitestScene.acts',focused:true, active:true});
        hilog.info(domain, tag, `testWindowIsActive window, ${JSON.stringify(window)} `);
        expect(window != null).assertTrue();
        if (window != null) {
          await window.focus();
          hilog.info(domain, tag, `testWindowIsActive focus sccessful`);
          let isActive = await window.isActive();
          hilog.info(domain, tag, `testWindowIsActive isActive, ${JSON.stringify(isActive)} `);
          expect(isActive == true).assertTrue()
        }
      } catch(error) {
        hilog.info(domain, tag, `testWindowIsActive error, ${JSON.stringify(error)} `);
        expect().assertFail()
      }
      hilog.info(domain, tag, `testWindowIsActive end `);
      await stopApplication('com.uitestScene.acts')
    })

    /*
    * @tc.number: uitestUiWindowTest_0009
    * @tc.name: testWindowBundleName
    * @tc.desc: testWindowBundleName.
    */
    it('testWindowBundleName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testWindowBundleName start `);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        await driver.delayMs(waitUiReadyMs)
        let window = await driver.findWindow({bundleName:'com.uitestScene.acts',focused:true, active:true,title:''});
        hilog.info(domain, tag, `testWindowBundleName window, ${JSON.stringify(window)} `);
        expect(window != null).assertTrue();
        if (window != null) {
          await window.focus();
          hilog.info(domain, tag, `testWindowBundleName focus sccessful`);
          let bundleName = await window.getBundleName();
          hilog.info(domain, tag, `testWindowBundleName bundleName, ${JSON.stringify(bundleName)} `);
          expect(bundleName).assertEqual('com.uitestScene.acts')
        }
      } catch(error) {
        hilog.info(domain, tag, `testWindowBundleName error, ${JSON.stringify(error)} `);
        expect().assertFail()
      }
      hilog.info(domain, tag, `testWindowBundleName end `);
      await stopApplication('com.uitestScene.acts')
    })

    /*
    * @tc.number: uitestUiWindowTest_0010
    * @tc.name: testWindowBounds
    * @tc.desc: getBounds test.
    */
    it('testWindowBounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testWindowBounds start `);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        await driver.delayMs(waitUiReadyMs)
        let window = await driver.findWindow({bundleName:'com.uitestScene.acts',focused:true, active:true,title:''});
        hilog.info(domain, tag, `testWindowBounds window, ${JSON.stringify(window)} `);
        expect(window != null).assertTrue();
        if (window != null) {
          await window.focus();
          hilog.info(domain, tag, `testWindowBounds focus sccessful`);
          let bounds = await window.getBounds();
          hilog.info(domain, tag, `testWindowBounds bounds, ${JSON.stringify(bounds)} `);
          expect(bounds != null).assertTrue()
        }
      } catch(error) {
        hilog.info(domain, tag, `testWindowBounds error, ${JSON.stringify(error)} `);
        expect().assertFail()
      }
      hilog.info(domain, tag, `testWindowBounds end `);
      await stopApplication('com.uitestScene.acts')
    })

    /*
    * @tc.number: uitestUiWindowTest_0011
    * @tc.name: testGetWindowMode_static
    * @tc.desc: get the window mode of this UiWindow.
    */
    it('testGetWindowMode_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testGetWindowMode_static start `);
      const driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window1 = await driver.findWindow({bundleName:'com.uitestScene.acts'});
      hilog.info(domain, tag, `testGetWindowMode window1, ${JSON.stringify(window1)} `);
      expect(window1 != null).assertTrue();
      try {
        if (window1 != null) {
          let mode1 = await window1.getWindowMode();
          hilog.info(domain, tag, `testGetWindowMode_static mode1, ${JSON.stringify(mode1)} `);
          await window1.resume();
          hilog.info(domain, tag, `testGetWindowMode_static resume `);
          let window2 = await driver.findWindow({bundleName:'com.uitestScene.acts'});
          hilog.info(domain, tag, `testGetWindowMode_static window2, ${JSON.stringify(window2)} `);
          expect(window2 != null).assertTrue();
          if (window2 != null) {
            let mode2 = await window2.getWindowMode();
            hilog.info(domain, tag, `testGetWindowMode_static mode2, ${JSON.stringify(mode2)} `);
            if (mode1 == WindowMode.FULLSCREEN) {
              expect(mode2 == WindowMode.FLOATING).assertTrue()
              expect(mode2 != WindowMode.SECONDARY).assertTrue()
              expect(mode2 != WindowMode.PRIMARY).assertTrue()
            } else {
              expect(mode2 == WindowMode.FULLSCREEN).assertTrue()
            }
          }
        }
      }
      catch (err: BusinessError) {
        hilog.info(domain, tag, `testGetWindowMode_static error, ${JSON.stringify(err)} `);
        if (err.message == 'this device can not support this action') {
          expect(window1 != null).assertTrue()
        } else {
          expect(false).assertTrue()
        }
      }
      hilog.info(domain, tag, `testGetWindowMode_static end `);
      await stopApplication('com.uitestScene.acts')
    })

    /*
    * @tc.number: uitestUiWindowTest_0012
    * @tc.name: testWindowTitle
    * @tc.desc: get the window title of this UiWindow.
    */
    it('testWindowTitle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testWindowTitle start `);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        await driver.delayMs(waitUiReadyMs)
        let window = await driver.findWindow({bundleName:'com.uitestScene.acts',focused:true, active:true,title:''});
        hilog.info(domain, tag, `testWindowTitle window, ${JSON.stringify(window)} `);
        expect(window != null).assertTrue();
        if (window != null) {
          await window.focus();
          hilog.info(domain, tag, `testWindowTitle focus sccessful`);
          let title = await window.getTitle();
          hilog.info(domain, tag, `testWindowTitle title, ${JSON.stringify(title)} `);
          expect(title).assertEqual('')
        }
      } catch(error) {
        hilog.info(domain, tag, `testWindowTitle error, ${JSON.stringify(error)} `);
        expect().assertFail()
      }
      hilog.info(domain, tag, `testWindowTitle end `);
      await stopApplication('com.uitestScene.acts')
    })

    /*
    * @tc.number: uitestUiWindowTest_0013
    * @tc.name: testWindowClose_static
    * @tc.desc: close this UiWindow.
    */
    it('testWindowClose_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testWindowClose_static start `);
      const driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({bundleName:'com.uitestScene.acts'});
      hilog.info(domain, tag, `testWindowClose_static window, ${JSON.stringify(window)} `);
      expect(window != null).assertTrue();
      try{
        if (window != null) {
          await window.close();
          hilog.info(domain, tag, `testWindowClose_static close sccessful`);
        }
        let window1 = await driver.findWindow({bundleName:'com.uitestScene.acts'});
        hilog.info(domain, tag, `testWindowClose_static window1, ${JSON.stringify(window1)} `);
        expect(window1 == null).assertTrue()
      }
      catch (err: BusinessError) {
        hilog.info(domain, tag, `testWindowClose_static error, ${JSON.stringify(err)} `);
        if (err.message == 'this device can not support this action') {
          expect(window != null).assertTrue()
        } else {
          expect(false).assertTrue()
        }
      }
      hilog.info(domain, tag, `testWindowClose_static end `);
      await stopApplication('com.uitestScene.acts')
    })
  })
}