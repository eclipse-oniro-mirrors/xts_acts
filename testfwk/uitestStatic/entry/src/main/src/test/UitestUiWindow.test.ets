/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { beforeAll, afterAll, beforeEach, describe, it, expect, TestType, Size, Level } from "../../../hypium/index"
import {
  Component,
  Driver,
  ON,
  On,
  MatchPattern,
  MouseButton,
  WindowMode,
  UIElementInfo,
  UiDirection,
  PointerMatrix,
  DisplayRotation,
  ResizeDirection,
  UiWindow
} from '@kit.TestKit'
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import display from '@ohos.display';
import { Utils, startAbility, stopApplication } from './Util.test';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'uitestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const waitUiReadyMs: int = 1000;
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
  while (new Date().getTime() < exitTime) {
  }
  return
}

async function initSpite(driver: Driver, window: UiWindow | null) {
  if (window != null) {
    try {
      let windowMode = await window.getWindowMode();
      if (windowMode != WindowMode.FLOATING) {
        await window.resume();
        await driver.delayMs(8000);
      }
      await window.maximize();
    } catch (error) {
      console.log(`${tag}, initSpite error,${JSON.stringify(error)}`);
    }
  } else {
    console.log(`${tag}, initSpite null`);
  }
  await driver.delayMs(3000);
}

async function maxUiWindow(driver: Driver, window: UiWindow | null): Promise<boolean> {
  if (window != null) {
    try {
      let windowMode = await window.getWindowMode();
      if (windowMode == WindowMode.FULLSCREEN) {
        console.log(`${tag}, maxUiWindow FULLSCREEN`);
        return true;
      }
      await window.maximize();
      await driver.delayMs(3000);
      return true;
    } catch (error) {
      console.log(`${tag}, maxUiWindow error,${JSON.stringify(error)}`);
      return false;
    }
  } else {
    console.log(`${tag}, maxUiWindow null`);
    return false;
  }
}

export default function uitestUiWindowTest() {
  describe('uitestUiWindowTest', (): void => {
    let driver: Driver | undefined;
    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, "uitestUiWindowTest loadup start!!!!!")
      driver = Driver.create();
      await Utils.msSleep(1000);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let window = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' });
      await driver!.delayMs(waitUiReadyMs);
      await initSpite(driver!, window);
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, "uitestUiWindowTest loadup over!!!!!")
    })
    beforeEach(async () => {
      await stopApplication('com.uitestScene.acts');
    })
    afterAll(async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      const driver = Driver.create();
      await driver!.delayMs(waitUiReadyMs);
      let window = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' });
      await driver!.delayMs(waitUiReadyMs);
      await maxUiWindow(driver!, window);
      await driver!.delayMs(waitUiReadyMs);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name testFindWindowWithId_static
     * @tc.number uitestUiWindowTest_0014
     * @tc.desc findWindow with id.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testFindWindowWithId_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testFindWindowWithId_static start !!!!");
      try {
        let disPlay = display.getDefaultDisplaySync();
        hilog.info(domain, tag, `testFindWindowWithId_static id, ${JSON.stringify(disPlay)}`);
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver!.delayMs(waitUiReadyMs);
        let window = await driver!.findWindow({ bundleName: 'com.uitestScene.acts', displayId: disPlay.id.toInt() });
        hilog.info(domain, tag, `testFindWindowWithId_static window , ${JSON.stringify(window)}`);
        expect(window != null).assertTrue();
        if (window != null) {
          let name = await window.getBundleName();
          hilog.info(domain, tag, `testFindWindowWithId_static name , ${JSON.stringify(name)}`);
          expect(name == 'com.uitestScene.acts').assertTrue();
          let uiId = await window.getDisplayId();
          hilog.info(domain, tag, `testFindWindowWithId_static uiId , ${JSON.stringify(uiId)}`);
          expect(uiId).assertEqual(disPlay.id);
        }
      } catch (error) {
        hilog.info(domain, tag, `testFindWindowWithId_static error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testFindWindowWithId_static over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name testSplit_static
     * @tc.number uitestUiWindowTest_0001
     * @tc.desc change this UiWindow into split screen mode
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testSplit_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs);
      let window1 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' });
      expect(window1 != null).assertTrue();
      try {
        if (window1 != null) {
          await window1.split();
          await driver!.delayMs(waitUiReadyMs * 2)
        }
        let scbCom = await driver!.findComponent(ON.id('scb_block_cover'));
        hilog.info(domain, tag, `testSplit_static scbCom, ${JSON.stringify(scbCom)}`);
        if (scbCom != null) {
          expect(scbCom != null).assertTrue();
        } else {
          let testLabel = await driver!.findComponent(ON.text('test label'));
          hilog.info(domain, tag, `testSplit_static testLabel, ${JSON.stringify(testLabel)}`);
          if (testLabel != null) {
            await testLabel.click();
            await driver!.delayMs(waitUiReadyMs);
            let window2 = await driver!.findWindow({bundleName:'com.uitestScene.acts'});
            await driver!.delayMs(waitUiReadyMs);
            expect(window2 != null).assertTrue();
            if (window2 != null) {
              let window2Mode = await window2.getWindowMode();
              expect(window2Mode == WindowMode.PRIMARY).assertTrue();
            }
            let testWindow = await driver!.findWindow({bundleName:'com.uitest.acts.static'});
            expect(testWindow != null).assertTrue();
            if (testWindow != null) {
              let testWindowMode = await testWindow.getWindowMode();
              expect(testWindowMode == WindowMode.SECONDARY).assertTrue();
            }
          }
        }
      } catch (err) {
        err = err as BusinessError;
        if (err.message == 'this device can not support this action') {
          expect(window1 != null).assertTrue();
          expect((err as BusinessError).code).assertEqual(DeviceErrorCode);
        } else {
          expect(false).assertTrue();
        }
      }
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name testResume_static
     * @tc.number uitestUiWindowTest_0002
     * @tc.desc change this UiWindow into split screen mode
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testResume_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testResume_static start `);
      const driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let window = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' });
      expect(window != null).assertTrue();
      try {
        if (window != null) {
          await window.resume();
          await driver!.delayMs(waitUiReadyMs);
        }
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `testResume_static resume error, ${JSON.stringify(err)}`);
        if (err.message == 'this device can not support this action') {
          expect(window != null).assertTrue();
          expect(err.code).assertEqual(DeviceErrorCode);
        } else {
          expect(false).assertTrue()
        }
      }
      hilog.info(domain, tag, `testResume end `);
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name testWindowResizeA_static
     * @tc.number uitestUiWindowTest_0003
     * @tc.desc resize this UiWindow to the specified size for the specified direction.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testWindowResizeA_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testWindowResizeA_static start `);
      const driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let window = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' });
      hilog.info(domain, tag, `testWindowResizeA_static  window , ${JSON.stringify(window)}`);
      expect(window != null).assertTrue();
      try {
        if (window != null) {
          let windowMode = await window.getWindowMode();
          if (windowMode != WindowMode.FLOATING) {
            await window.resume();
          }
          await driver!.delayMs(1000);
          let window1 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' });
          hilog.info(domain, tag, `testWindowResizeA_static  window1 , ${JSON.stringify(window1)}`);
          expect(window1 != null).assertTrue();
          if (window1 != null) {
            let bounds1 = await window1.getBounds();
            hilog.info(domain, tag, `testWindowResizeA_static bounds1, ${JSON.stringify(bounds1)} `);
            await window1.resize(600, 600, ResizeDirection.RIGHT_DOWN);
            let window2 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' });
            hilog.info(domain, tag, `testWindowResizeA_static  window2 , ${JSON.stringify(window2)}`);
            expect(window2 != null).assertTrue();
            if (window2 != null) {
              let bounds2 = await window2.getBounds();
              hilog.info(domain, tag, `testWindowResizeA_static bounds2, ${JSON.stringify(bounds2)} `);
              expect(bounds2 != bounds1).assertTrue();
              await window2.resize(400, 400, ResizeDirection.RIGHT_UP);
              let window3 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' });
              hilog.info(domain, tag, `testWindowResizeA_static  window3 , ${JSON.stringify(window3)}`);
              expect(window3 != null).assertTrue();
              if (window3 != null) {
                let bounds3 = await window3.getBounds();
                hilog.info(domain, tag, `testWindowResizeA_static bounds3, ${JSON.stringify(bounds3)} `);
                expect(bounds3 != bounds2).assertTrue();
                await window3.resize(300, 300, ResizeDirection.LEFT_DOWN);
                let window4 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' });
                hilog.info(domain, tag, `testWindowResizeA_static  window4 , ${JSON.stringify(window4)}`);
                expect(window4 != null).assertTrue();
                if (window4 != null) {
                  let bounds4 = await window4.getBounds();
                  hilog.info(domain, tag, `testWindowResizeA_static bounds4, ${JSON.stringify(bounds4)} `);
                  expect(bounds4 != bounds3).assertTrue();
                  await window4.resize(500, 500, ResizeDirection.LEFT_UP);
                  let window5 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' });
                  hilog.info(domain, tag, `testWindowResizeA_static  window5 , ${JSON.stringify(window5)}`);
                  expect(window5 != null).assertTrue();
                  if (window5 != null) {
                    let bounds5 = await window5.getBounds();
                    hilog.info(domain, tag, `testWindowResizeA_static bounds5, ${JSON.stringify(bounds5)} `);
                    expect(bounds5 != bounds4).assertTrue();
                  }
                }
              }
            }
          }
        }
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `testWindowResizeA_static error, ${JSON.stringify(err)} `);
        if (err.message == 'this device can not support this action') {
          expect(window != null).assertTrue();
          expect(err.code).assertEqual(DeviceErrorCode);
        } else {
          expect(false).assertTrue()
        }
      }
      hilog.info(domain, tag, `testWindowResizeA_static end `);
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name testWindowMoveTo_static
     * @tc.number uitestUiWindowTest_0004
     * @tc.desc move this UiWindow to the specified points.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testWindowMoveTo_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testWindowMoveTo_static start `);
      const driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let window = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' });
      hilog.info(domain, tag, `testWindowMoveTo_static window, ${JSON.stringify(window)} `);
      expect(window != null).assertTrue();
      try {
        if (window != null) {
          let windowMode = await window.getWindowMode();
          if (windowMode != WindowMode.FLOATING) {
            await window.resume();
          }
        }
        let window1 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' });
        hilog.info(domain, tag, `testWindowMoveTo_static window1, ${JSON.stringify(window1)} `);
        expect(window1 != null).assertTrue();
        if (window1 != null) {
          let bounds1 = await window1.getBounds();
          hilog.info(domain, tag, `testWindowMoveTo_static bounds1, ${JSON.stringify(bounds1)} `);
          await window1.moveTo(100, 100);
          let window2 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' });
          hilog.info(domain, tag, `testWindowMoveTo_static window2, ${JSON.stringify(window2)} `);
          expect(window2 != null).assertTrue();
          if (window2 != null) {
            let bounds2 = await window2.getBounds();
            hilog.info(domain, tag, `testWindowMoveTo_static bounds2, ${JSON.stringify(bounds2)} `);
            expect(bounds1 != bounds2).assertTrue();
          }
        }
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `testWindowMoveTo_static error, ${JSON.stringify(err)} `);
        if (err.message == 'this device can not support this action') {
          expect(err.code).assertEqual(DeviceErrorCode);
          expect(window != null).assertTrue();
        } else {
          expect(false).assertTrue()
        }
      }
      hilog.info(domain, tag, `testWindowMoveTo_static end `);
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name testWindowMinimize_static
     * @tc.number uitestUiWindowTest_0005
     * @tc.desc minimize this UiWindow.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testWindowMinimize_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testWindowMinimize_static start `);
      const driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let window = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' })
      hilog.info(domain, tag, `testWindowMinimize_static window, ${JSON.stringify(window)} `);
      expect(window != null).assertTrue();
      try {
        if (window != null) {
          await window.minimize();
          await driver!.delayMs(waitUiReadyMs)
          let window1 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' });
          hilog.info(domain, tag, `testWindowMinimize_static window1, ${JSON.stringify(window1)} `);
          expect(window1 == null).assertTrue();
        }
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `testWindowMinimize_static error, ${JSON.stringify(err)} `);
        if (err.message == 'this device can not support this action') {
          expect(window != null).assertTrue();
          expect(err.code).assertEqual(DeviceErrorCode);
        } else {
          expect(false).assertTrue()
        }
      }
      hilog.info(domain, tag, `testWindowMinimize_static end `);
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name testWindowMaximize_static
     * @tc.number uitestUiWindowTest_0006
     * @tc.desc maximize this UiWindow.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testWindowMaximize_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testWindowMaximize_static start `);
      const driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let window = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' });
      expect(window != null).assertTrue();
      try {
        if (window != null) {
          let windowMode = await window.getWindowMode();
          if (windowMode != WindowMode.FLOATING) {
            await window.resume();
          }
        }
        let window2 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' });
        expect(window2 != null).assertTrue();
        if (window2 != null) {
          await window2.maximize();
          hilog.info(domain, tag, `testWindowMaximize_static maximize sccessful`);
        }
        //  await driver!.delayMs(1000);
        let window3 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' });
        hilog.info(domain, tag, `testWindowMaximize_static window3, ${JSON.stringify(window3)} `);
        expect(window3 != null).assertTrue();
        if (window3 != null) {
          let mode = await window3.getWindowMode();
          hilog.info(domain, tag, `testWindowMaximize_static mode, ${JSON.stringify(mode)} `);
          expect(mode == WindowMode.FULLSCREEN).assertTrue();
        }
        await stopApplication('com.uitestScene.acts')
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `testWindowMaximize_static error, ${JSON.stringify(err)} `);
        if (err.message == 'this device can not support this action') {
          expect(window != null).assertTrue();
          expect(err.code).assertEqual(DeviceErrorCode);
        } else {
          expect(false).assertTrue()
        }
      }
    })

    /**
     * @tc.name testWindowIsFocused
     * @tc.number uitestUiWindowTest_0007
     * @tc.desc testWindowIsFocused.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testWindowIsFocused', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testWindowIsFocused start `);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        await driver!.delayMs(waitUiReadyMs)
        let window = await driver!.findWindow({ bundleName: 'com.uitestScene.acts', focused: true });
        hilog.info(domain, tag, `testWindowIsFocused window, ${JSON.stringify(window)} `);
        expect(window != null).assertTrue();
        if (window != null) {
          await window.focus();
          hilog.info(domain, tag, `testWindowIsFocused focus sccessful`);
          let isFocused = await window.isFocused();
          hilog.info(domain, tag, `testWindowIsFocused isFocused, ${JSON.stringify(isFocused)} `);
          expect(isFocused == true).assertTrue()
        }
      } catch (error) {
        hilog.info(domain, tag, `testWindowIsFocused error, ${JSON.stringify(error)} `);
        expect().assertFail()
      }
      hilog.info(domain, tag, `testWindowIsFocused end `);
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name testWindowIsActive
     * @tc.number uitestUiWindowTest_0008
     * @tc.desc testWindowIsFocused.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testWindowIsActive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testWindowIsActive start `);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        await driver!.delayMs(waitUiReadyMs)
        let window = await driver!.findWindow({ bundleName: 'com.uitestScene.acts', focused: true, active: true });
        hilog.info(domain, tag, `testWindowIsActive window, ${JSON.stringify(window)} `);
        expect(window != null).assertTrue();
        if (window != null) {
          await window.focus();
          hilog.info(domain, tag, `testWindowIsActive focus sccessful`);
          let isActive = await window.isActive();
          hilog.info(domain, tag, `testWindowIsActive isActive, ${JSON.stringify(isActive)} `);
          expect(isActive == true).assertTrue()
        }
      } catch (error) {
        hilog.info(domain, tag, `testWindowIsActive error, ${JSON.stringify(error)} `);
        expect().assertFail()
      }
      hilog.info(domain, tag, `testWindowIsActive end `);
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name testWindowBundleName
     * @tc.number uitestUiWindowTest_0009
     * @tc.desc testWindowBundleName.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testWindowBundleName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testWindowBundleName start `);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        await driver!.delayMs(waitUiReadyMs)
        let window = await driver!.findWindow({
          bundleName: 'com.uitestScene.acts',
          focused: true,
          active: true,
          title: ''
        });
        hilog.info(domain, tag, `testWindowBundleName window, ${JSON.stringify(window)} `);
        expect(window != null).assertTrue();
        if (window != null) {
          await window.focus();
          hilog.info(domain, tag, `testWindowBundleName focus sccessful`);
          let bundleName = await window.getBundleName();
          hilog.info(domain, tag, `testWindowBundleName bundleName, ${JSON.stringify(bundleName)} `);
          expect(bundleName).assertEqual('com.uitestScene.acts')
        }
      } catch (error) {
        hilog.info(domain, tag, `testWindowBundleName error, ${JSON.stringify(error)} `);
        expect().assertFail()
      }
      hilog.info(domain, tag, `testWindowBundleName end `);
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name testWindowBounds
     * @tc.number uitestUiWindowTest_0010
     * @tc.desc getBounds test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testWindowBounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testWindowBounds start `);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        await driver!.delayMs(waitUiReadyMs)
        let window = await driver!.findWindow({
          bundleName: 'com.uitestScene.acts',
          focused: true,
          active: true,
          title: ''
        });
        hilog.info(domain, tag, `testWindowBounds window, ${JSON.stringify(window)} `);
        expect(window != null).assertTrue();
        if (window != null) {
          await window.focus();
          hilog.info(domain, tag, `testWindowBounds focus sccessful`);
          let bounds = await window.getBounds();
          hilog.info(domain, tag, `testWindowBounds bounds, ${JSON.stringify(bounds)} `);
          expect(bounds != null).assertTrue()
        }
      } catch (error) {
        hilog.info(domain, tag, `testWindowBounds error, ${JSON.stringify(error)} `);
        expect().assertFail()
      }
      hilog.info(domain, tag, `testWindowBounds end `);
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name testGetWindowMode_static
     * @tc.number uitestUiWindowTest_0011
     * @tc.desc get the window mode of this UiWindow.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testGetWindowMode_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testGetWindowMode_static start `);
      const driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let window1 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' });
      hilog.info(domain, tag, `testGetWindowMode window1, ${JSON.stringify(window1)} `);
      expect(window1 != null).assertTrue();
      try {
        if (window1 != null) {
          let mode1 = await window1.getWindowMode();
          hilog.info(domain, tag, `testGetWindowMode_static mode1, ${JSON.stringify(mode1)} `);
          await window1.resume();
          hilog.info(domain, tag, `testGetWindowMode_static resume `);
          let window2 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' });
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
      } catch (err) {
        err = err as BusinessError;
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

    /**
     * @tc.name testWindowTitle
     * @tc.number uitestUiWindowTest_0012
     * @tc.desc get the window title of this UiWindow.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testWindowTitle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testWindowTitle start `);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        await driver!.delayMs(waitUiReadyMs)
        let window = await driver!.findWindow({
          bundleName: 'com.uitestScene.acts',
          focused: true,
          active: true,
          title: ''
        });
        hilog.info(domain, tag, `testWindowTitle window, ${JSON.stringify(window)} `);
        expect(window != null).assertTrue();
        if (window != null) {
          await window.focus();
          hilog.info(domain, tag, `testWindowTitle focus sccessful`);
          let title = await window.getTitle();
          hilog.info(domain, tag, `testWindowTitle title, ${JSON.stringify(title)} `);
          expect(title).assertEqual('')
        }
      } catch (error) {
        hilog.info(domain, tag, `testWindowTitle error, ${JSON.stringify(error)} `);
        expect().assertFail()
      }
      hilog.info(domain, tag, `testWindowTitle end `);
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name testWindowClose_static
     * @tc.number uitestUiWindowTest_0013
     * @tc.desc close this UiWindow.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testWindowClose_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testWindowClose_static start `);
      const driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let window = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' });
      hilog.info(domain, tag, `testWindowClose_static window, ${JSON.stringify(window)} `);
      expect(window != null).assertTrue();
      try {
        if (window != null) {
          await window.close();
          hilog.info(domain, tag, `testWindowClose_static close sccessful`);
        }
        let window1 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' });
        hilog.info(domain, tag, `testWindowClose_static window1, ${JSON.stringify(window1)} `);
        expect(window1 == null).assertTrue()
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `testWindowClose_static error, ${JSON.stringify(err)} `);
        if (err.message == 'this device can not support this action') {
          expect(window != null).assertTrue();
          expect(err.code).assertEqual(DeviceErrorCode);
        } else {
          expect(false).assertTrue();
        }
      }
      hilog.info(domain, tag, `testWindowClose_static end `);
      await stopApplication('com.uitestScene.acts');
    })
  })
}