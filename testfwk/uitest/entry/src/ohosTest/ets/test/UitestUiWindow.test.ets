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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base';
import { display } from '@kit.ArkUI'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const delegator: AbilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const waitUiReadyMs: number = 1000;
const TestTag = 'uitestUiWindowTest';
const WindowsErrorCode = 17000005;

async function startAbility(bundleName: string, abilityName: string) {
  await delegator.executeShellCommand(`aa start -b ${bundleName} -a ${abilityName}`).then(result => {
    console.info(`${TestTag}, start abilityFinished: ${result}`)
  }).catch((err: BusinessError) => {
    console.error(`${TestTag}, start abilityFailed: ${err}`)
  })
}

async function stopApplication(bundleName: string) {
  await delegator.executeShellCommand(`aa force-stop ${bundleName} `).then(result => {
    console.info(`${TestTag}, stop application finished: ${result}`)
  }).catch((err: BusinessError) => {
    console.error(`${TestTag},stop application failed: ${err}`)
  })
}

async function setFloat(driver: Driver) {
  let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
  console.log(`${TestTag}, setFloat findWindow, ${JSON.stringify(window)}`);
  let windowMode = await window.getWindowMode()
  console.log(`${TestTag}, setFloat getWindowMode, ${JSON.stringify(windowMode)}`);
  if (windowMode != WindowMode.FLOATING) {
    await window.resume()
    console.log(`${TestTag}, setFloat resume success`);
  }
}

async function setFull(driver: Driver) {
  let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
  console.log(`${TestTag}, setFull findWindow, ${JSON.stringify(window)}`);
  let windowMode = await window.getWindowMode()
  console.log(`${TestTag}, setFull getWindowMode, ${JSON.stringify(windowMode)}`);
  if (windowMode != WindowMode.FULLSCREEN) {
    await window.resume()
    console.log(`${TestTag}, setFloat resume success`);
  }
}

async function firstSplit(driver: Driver) {
  await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
  await driver.delayMs(waitUiReadyMs);
  let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' });
  console.log(`${TestTag}, firstSplit window,${JSON.stringify(window)}`);
  if (window != null) {
    try {
      let windowMode = await window.getWindowMode();
      if (windowMode != WindowMode.FLOATING) {
        await window.resume();
        await driver.delayMs(8000);
      }
    } catch (error) {
      console.log(`${TestTag}, firstSplit resume error,${JSON.stringify(error)}`);
    }
  }
  await stopApplication('com.uitestScene.acts');
}

async function setSplit(driver: Driver) {
  let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
  console.log(`${TestTag}, setSplit window,${JSON.stringify(window)}`);
  await window.split()
  await driver.delayMs(waitUiReadyMs * 2)
  let scbCom = await driver.findComponent(ON.id('scb_block_cover'))
  console.log(`${TestTag}, setSplit scbCom,${JSON.stringify(scbCom)}`);
  if (scbCom != null) {
    await startAbility('com.uitest.acts', 'EntryAbility')
    await driver.delayMs(waitUiReadyMs * 2)
    let btn0 = await driver.findComponent(ON.text('稍后提示'))
    console.log(`${TestTag}, setSplit scbCom,${JSON.stringify(btn0)}`);
    if (btn0 != null) {
      await btn0.click()
      await driver.delayMs(waitUiReadyMs * 7)
    }
    let btn = await driver.findComponent(ON.text('下一步'))
    if (btn != null) {
      await btn.click()
      await driver.delayMs(waitUiReadyMs * 3)
      let btn1 = await driver.findComponent(ON.text('完成'))
      if (btn1 != null) {
        await btn1.click()
        await driver.delayMs(waitUiReadyMs * 7)
      }
    }
    let btn3 = await driver.findComponent(ON.text('下一步'))
    if (btn3 != null) {
      await btn3.click()
      await driver.delayMs(waitUiReadyMs * 3)
      let btn1 = await driver.findComponent(ON.text('完成'))
      if (btn1 != null) {
        await btn1.click()
        await driver.delayMs(waitUiReadyMs * 7)
      }
    }
    let btn1 = await driver.findComponent(ON.text('完成'))
    if (btn1 != null) {
      await btn1.click()
      await driver.delayMs(waitUiReadyMs * 7)
    }
    let btn2 = await driver.findComponent(ON.text('点击显示操作按钮'))
    if (btn2 != null) {
      await driver.delayMs(waitUiReadyMs * 7)
    }
  } else {
    let testLabel = await driver.findComponent(ON.text('test label'));
    await driver.delayMs(waitUiReadyMs * 2)
    await testLabel.click()
  }
}

async function envRecovery(driver: Driver) {
  try {
    let scbCom = await driver.findComponent(ON.id('scb_block_cover'))
    if (scbCom != null) {
      await driver.pressBack()
      await driver.delayMs(waitUiReadyMs * 3)
    }
    let resumeWindow = await driver.findWindow({ bundleName: 'com.uitest.acts' })
    if (resumeWindow != null) {
      await resumeWindow.resume()
    }
  } catch (error) {
    console.log('envRecovery error is ' + error)
    expect(error.code == WindowsErrorCode).assertTrue()
  }
}


export default function uiUiWindowTest() {
  describe('uitestUiWindowTest', () => {
    let driver: Driver
    beforeAll(async () => {
      driver = Driver.create();
      await driver.delayMs(1000);
      await firstSplit(driver);
    })

    beforeEach(async () => {
      await stopApplication('com.uitestScene.acts');
    })

    afterAll(async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      const driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' });
      console.log(`${TestTag}, afterAll window,${JSON.stringify(window)}`);
      if (window != null) {
        try {
          let windowMode = await window.getWindowMode();
          if (windowMode != WindowMode.FLOATING) {
            await window.resume();
          }
          await window.maximize();
        } catch (error) {
          console.log(`${TestTag}, afterAll maximize error,${JSON.stringify(error)}`);
        }
      }
      await driver.delayMs(waitUiReadyMs);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testApi9_UiWindow_getBundleName
     * @tc.number uitestUiWindowTest_002
     * @tc.desc   get the bundleName of this UiWindow.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_UiWindow_getBundleName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
      let name = await window.getBundleName()
      expect(name == 'com.uitestScene.acts').assertTrue()
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name   testApi9_UiWindow_getTitle
     * @tc.number uitestUiWindowTest_003
     * @tc.desc   get the title of this UiWindow.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_UiWindow_getTitle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
      let title = await window.getTitle()
      expect(title == '').assertTrue()
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name   testApi9_UiWindow_Attr
     * @tc.number uitestUiWindowTest_007
     * @tc.desc   set the focused status of this UiWindow.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_UiWindow_Attr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({
        bundleName: 'com.uitestScene.acts',
        focused: true,
        actived: true,
        title: ''
      })
      await window.focus()
      await driver.delayMs(waitUiReadyMs)
      let isFocused = await window.isFocused()
      let isActived = await window.isActived()
      expect(isFocused == true).assertTrue()
      expect(isActived == true).assertTrue()
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name   testWindowResume_split
     * @tc.number uitestUiWindowTest_new001
     * @tc.desc   Call the resume interface in split-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowResume_split', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      try {
        await setSplit(driver)
        await driver.delayMs(waitUiReadyMs)
        let windowSplit = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        console.log(`${TestTag}, testWindowResume_split setSplit windowSplit,${JSON.stringify(windowSplit)}`);
        let splitMode = await windowSplit.getWindowMode()
        console.log(`${TestTag}, testWindowResume_split setSplit splitMode,${JSON.stringify(splitMode)}`);
        expect(splitMode == WindowMode.PRIMARY).assertTrue()

        let isActive1 = await windowSplit.isActive()
        console.log(`${TestTag}, testWindowResume_split isActive1,${JSON.stringify(isActive1)}`);
        expect(isActive1).assertFalse();
        let falseFocused = await windowSplit.isFocused()
        console.log(`${TestTag}, testWindowResume_split falseFocused,${JSON.stringify(falseFocused)}`);
        expect(falseFocused).assertFalse()
        let falseActived = await windowSplit.isActived()
        console.log(`${TestTag}, testWindowResume_split falseActived,${JSON.stringify(falseActived)}`);
        expect(falseActived).assertFalse()
        await windowSplit.resume()
        await driver.delayMs(waitUiReadyMs)
        let window2 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        console.log(`${TestTag}, testWindowResume_split findWindow2 success,${JSON.stringify(window2)}`);
        let windowmode2 = await window2.getWindowMode()
        console.log(`${TestTag}, testWindowResume_split getWindowMode2 success,${JSON.stringify(windowmode2)}`);
        expect(windowmode2 == WindowMode.FLOATING).assertTrue()
      } catch (error) {
        console.log('testWindowResume_split1 error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
      await envRecovery(driver)
    })

    /**
     * @tc.name   testSplit_split1
     * @tc.number uitestUiWindowTest_new002
     * @tc.desc   Call the split interface in split-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSplit_split1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      try {
        await setFull(driver)
        await driver.delayMs(waitUiReadyMs)
        let windowFull = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        console.log(`${TestTag}, testSplit_split1 setFull windowFull, ${JSON.stringify(windowFull)}`);
        let fullMode = await windowFull.getWindowMode()
        console.log(`${TestTag}, testSplit_split1 setFull fullMode, ${JSON.stringify(fullMode)}`);
        expect(fullMode == WindowMode.FULLSCREEN).assertTrue()

        await setSplit(driver)
        await driver.delayMs(waitUiReadyMs)
        let windowSplit = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        await windowSplit.split()
        await driver.delayMs(waitUiReadyMs)
        let window3 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' });
        console.log(`${TestTag}, testSplit_split1 findWindow3 success,${JSON.stringify(window3)}`);
        let windowMode = await window3.getWindowMode();
        console.log(`${TestTag}, testSplit_split1 getWindowMode success,${JSON.stringify(windowMode)}`);
        expect(windowMode == WindowMode.PRIMARY).assertTrue();
      } catch (error) {
        console.log('testSplit error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
      await envRecovery(driver)
    })

    /**
     * @tc.name   testSplit_split2
     * @tc.number uitestUiWindowTest_new003
     * @tc.desc   Call the split interface in split-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSplit_split2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      console.log(`${TestTag}, testSplit_split2 start`);
      let btn1 = await driver.findComponent(ON.text('完成'))
      if (btn1 != null) {
        await btn1.click()
        await driver.delayMs(waitUiReadyMs * 7)
      }
      await driver.delayMs(waitUiReadyMs);
      try {
        await setFloat(driver)
        await driver.delayMs(waitUiReadyMs)
        let windowFloat = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        console.log(`${TestTag}, testSplit_split2 setFloat windowFloat, ${JSON.stringify(windowFloat)}`);
        let floatMode = await windowFloat.getWindowMode()
        console.log(`${TestTag}, testSplit_split2 setFloat floatMode, ${JSON.stringify(floatMode)}`);
        expect(floatMode == WindowMode.FLOATING).assertTrue()

        await setSplit(driver)
        await driver.delayMs(waitUiReadyMs)
        let window2 = await driver.findWindow({ bundleName: 'com.uitest.acts' });
        console.log(`${TestTag}, testSplit_split2 window2: ${JSON.stringify(window2)}`);
        await window2.split();
        await driver.delayMs(waitUiReadyMs * 3)
        let btn = await driver.findComponent(ON.text('完成'))
        if (btn != null) {
          await btn.click()
          await driver.delayMs(waitUiReadyMs * 7)
        }
        let window4 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' });
        console.log(`${TestTag}, testSplit_split2 findWindow4 success: ${JSON.stringify(window4)}`);
        let windowMode1 = await window4.getWindowMode();
        console.log(`${TestTag}, testSplit_split2 getWindowMode1 success: ${JSON.stringify(windowMode1)}`);
        expect(windowMode1 == WindowMode.SECONDARY).assertTrue();
      } catch (error) {
        console.log('testSplit error is ' + error);
        expect(error.code == WindowsErrorCode).assertTrue();
      }
      await envRecovery(driver)
    })

    /**
     * @tc.name   testWindowMoveTo_full
     * @tc.number uitestUiWindowTest_new004
     * @tc.desc   Call the moveTo interface in fullscreen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowMoveTo_full', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      try {
        await setFull(driver)
        await driver.delayMs(waitUiReadyMs)
        let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        await window1.moveTo(100, 100)
      } catch (error) {
        console.log('testWindowMoveTo_full error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
    })

    /**
     * @tc.name   testWindowMoveTo_float
     * @tc.number uitestUiWindowTest_new005
     * @tc.desc   Call the moveTo interface in float.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowMoveTo_float', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      try {
        await setFloat(driver)
        await driver.delayMs(waitUiReadyMs)
        let windowFloat = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        let bounds1 = await windowFloat.getBounds()
        await windowFloat.moveTo(100, 100)
        await driver.delayMs(waitUiReadyMs)
        let window2 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        console.log(`${TestTag}, testWindowMoveTo_float findWindow2 success, ${JSON.stringify(window2)}`);
        let bounds2 = await window2.getBounds()
        console.log(`${TestTag}, testWindowMoveTo_float getBounds2 success, ${JSON.stringify(bounds2)}`);
        expect(bounds1.left != bounds2.left).assertTrue()
        await window2.moveTo(bounds1.left, bounds1.top)
      } catch (error) {
        console.log('testWindowMoveTo_float error is' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
    })

    /**
     * @tc.name   testWindowMoveTo_split
     * @tc.number uitestUiWindowTest_new006
     * @tc.desc   Call the moveTo interface in split-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowMoveTo_split', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      try {
        await setSplit(driver)
        await driver.delayMs(waitUiReadyMs)
        let windowSplit = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        await windowSplit.moveTo(100, 100)
      } catch (error) {
        console.log('testWindowMoveTo_split1 error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
      await envRecovery(driver)
    })

    /**
     * @tc.name   testWindowResize_full
     * @tc.number uitestUiWindowTest_new007
     * @tc.desc   Call the resize interface in fullscreen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowResize_full', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      try {
        await setFull(driver)
        await driver.delayMs(waitUiReadyMs)
        let windowFull = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        await windowFull.resize(600, 600, ResizeDirection.RIGHT_DOWN)
      } catch (error) {
        console.log('testWindowResize_full error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
    })

    /**
     * @tc.name   testWindowResizeA_float
     * @tc.number uitestUiWindowTest_new008
     * @tc.desc   Call the resize interface in float.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowResizeA_float', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      try {
        await setFloat(driver)
        await driver.delayMs(waitUiReadyMs)
        let windowFloat = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        let bounds1 = await windowFloat.getBounds()
        let bounds1x = Math.floor(bounds1.right - bounds1.left)
        let bounds1y = Math.floor(bounds1.bottom - bounds1.top)
        let resizex = Math.floor(bounds1x / 2)
        let resizey = Math.floor(bounds1y / 2)
        await windowFloat.resize(resizex, resizey, ResizeDirection.RIGHT_DOWN)
        console.log(`${TestTag}, testWindowResizeA_float windowFloat.resize success `);
        await driver.delayMs(waitUiReadyMs)
        let window2 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        console.log(`${TestTag}, testWindowResizeA_float findWindow2 success, ${JSON.stringify(window2)}`);
        let bounds2 = await window2.getBounds()
        console.log(`${TestTag}, testWindowResizeA_float getBounds2 success, ${JSON.stringify(bounds2)}`);
        expect(bounds2.right != bounds1.right).assertTrue()
        await window2.resize(bounds1x, bounds1y, ResizeDirection.RIGHT_DOWN)

        let window3 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        let bounds3 = await window2.getBounds()
        await window3.resize(resizex, resizey, ResizeDirection.LEFT_DOWN)
        await driver.delayMs(waitUiReadyMs)
        let window4 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        console.log(`${TestTag}, testWindowResizeA_float findWindow4 success, ${JSON.stringify(window4)}`);
        let bounds4 = await window4.getBounds()
        console.log(`${TestTag}, testWindowResizeA_float getBounds4 success, ${JSON.stringify(bounds4)}`);
        expect(bounds3.bottom != bounds4.bottom).assertTrue()
        await window4.resize(bounds1x, bounds1y, ResizeDirection.LEFT_DOWN)
      } catch (error) {
        console.log('testWindowResizeA_float error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
    })

    /**
     * @tc.name   testWindowResizeA_UP_float
     * @tc.number uitestUiWindowTest_new009
     * @tc.desc   in a float state, Call the resize interface to adjust the window size from the top of the window.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowResizeA_UP_float', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      try {
        await setFloat(driver)
        await driver.delayMs(waitUiReadyMs)
        let floatbtn = await driver.findComponent(ON.id('floatingButtonMaximize'))
        if (floatbtn == null) {
          let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
          let bounds1 = await window1.getBounds()
          let bounds1x = Math.floor(bounds1.right - bounds1.left)
          let bounds1y = Math.floor(bounds1.bottom - bounds1.top)
          let resizex = Math.floor(bounds1x / 2)
          let resizey = Math.floor(bounds1y / 2)
          await window1.resize(resizex, resizey, ResizeDirection.RIGHT_UP)
          await driver.delayMs(waitUiReadyMs)
          let window2 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
          console.log(`${TestTag}, testWindowResizeA_UP_float findWindow2 success, ${JSON.stringify(window2)}`);
          let bounds2 = await window2.getBounds()
          console.log(`${TestTag}, testWindowResizeA_UP_float getBounds2 success, ${JSON.stringify(bounds2)}`);
          expect(bounds2.top != bounds1.top).assertTrue()
          await window2.resize(bounds1x, bounds1y, ResizeDirection.RIGHT_UP)

          let window3 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
          let bounds3 = await window3.getBounds()
          await window3.resize(resizex, resizey, ResizeDirection.LEFT_UP)
          await driver.delayMs(waitUiReadyMs)
          let window4 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
          console.log(`${TestTag}, testWindowResizeA_UP_float findWindow4 success, ${JSON.stringify(window4)}`);
          let bounds4 = await window4.getBounds()
          console.log(`${TestTag}, testWindowResizeA_UP_float getBounds4 success, ${JSON.stringify(bounds4)}`);
          expect(bounds4.top != bounds3.top).assertTrue()
          await window4.resize(bounds1x, bounds1y, ResizeDirection.LEFT_UP)
        }
      } catch (error) {
        console.log('testWindowResizeA_UP_float error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
    })

    /**
     * @tc.name   testWindowResizeB_float
     * @tc.number uitestUiWindowTest_new010
     * @tc.desc   in a float state, Call the resize interface to adjust the window size from the down/right/left of the window.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowResizeB_float', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      try {
        await setFloat(driver)
        await driver.delayMs(waitUiReadyMs)
        let windowFloat = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        let bounds1 = await windowFloat.getBounds()
        let bounds1x = Math.floor(bounds1.right - bounds1.left)
        let bounds1y = Math.floor(bounds1.bottom - bounds1.top)
        let resizex = Math.floor(bounds1x / 2)
        let resizey = Math.floor(bounds1y / 2)
        await windowFloat.resize(bounds1x, resizey, ResizeDirection.DOWN)
        await driver.delayMs(waitUiReadyMs)
        let window2 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        console.log(`${TestTag}, testWindowResizeB_float findWindow2 success, ${JSON.stringify(window2)}`);
        let bounds2 = await window2.getBounds()
        console.log(`${TestTag}, testWindowResizeB_float getBounds2 success, ${JSON.stringify(bounds2)}`);
        expect(bounds2.bottom != bounds1.bottom).assertTrue()
        await window2.resize(bounds1x, bounds1y, ResizeDirection.DOWN)

        let window6 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        let bounds6 = await window6.getBounds()
        await window6.resize(resizex, bounds1y, ResizeDirection.RIGHT)
        await driver.delayMs(waitUiReadyMs)
        let window7 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        console.log(`${TestTag}, testWindowResizeB_float findWindow7 success, ${JSON.stringify(window7)}`);
        let bounds7 = await window7.getBounds()
        console.log(`${TestTag}, testWindowResizeB_float getBounds7 success, ${JSON.stringify(bounds7)}`);
        expect(bounds7.right != bounds6.right).assertTrue()
        await window7.resize(bounds1x, bounds1y, ResizeDirection.RIGHT)

        let window8 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        let bounds8 = await window8.getBounds()
        await window8.resize(resizex, bounds1y, ResizeDirection.LEFT)
        await driver.delayMs(waitUiReadyMs)
        let window9 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        console.log(`${TestTag}, testWindowResizeB_float findWindow9 success, ${JSON.stringify(window9)}`);
        let bounds9 = await window9.getBounds()
        console.log(`${TestTag}, testWindowResizeB_float getBounds9 success, ${JSON.stringify(bounds9)}`);
        expect(bounds8.left != bounds9.left).assertTrue()
        await window9.resize(bounds1x, bounds1y, ResizeDirection.LEFT)
      } catch (error) {
        console.log('testWindowResizeB_float error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
    })

    /**
     * @tc.name   testWindowResizeB_UP_float
     * @tc.number uitestUiWindowTest_new011
     * @tc.desc   in a float state, Call the resize interface to adjust the window size from the UP of the window.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowResizeB_UP_float', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      try {
        await setFloat(driver)
        await driver.delayMs(waitUiReadyMs)
        let floatbtn = await driver.findComponent(ON.id('floatingButtonMaximize'))
        if (floatbtn == null) {
          let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
          let bounds1 = await window1.getBounds()
          let bounds1x = Math.floor(bounds1.right - bounds1.left)
          let bounds1y = Math.floor(bounds1.bottom - bounds1.top)
          let resizey = Math.floor(bounds1y / 2)
          await window1.resize(bounds1x, resizey, ResizeDirection.UP)
          await driver.delayMs(waitUiReadyMs)
          let window6 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
          console.log(`${TestTag}, testWindowResizeB_UP_float findWindow6 success, ${JSON.stringify(window6)}`);
          let bounds6 = await window6.getBounds()
          console.log(`${TestTag}, testWindowResizeB_UP_float getBounds6 success, ${JSON.stringify(bounds6)}`);
          expect(bounds6.top != bounds1.top).assertTrue()
          await window6.resize(bounds1x, bounds1y, ResizeDirection.UP)
        }
      } catch (error) {
        console.log('testWindowResizeB_UP_float error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
    })

    /**
     * @tc.name   testWindowResizeB_split1
     * @tc.number uitestUiWindowTest_new012
     * @tc.desc   in a split state, Call the resize interface to adjust the window size from the right of the window.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowResizeB_split1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      try {
        await setSplit(driver)
        await driver.delayMs(waitUiReadyMs)
        let scbCom = await driver.findComponent(ON.id('SCBDividerFlex1'))
        await driver.delayMs(waitUiReadyMs)
        if (scbCom != null) {
          await driver.setDisplayRotationEnabled(true)
          await driver.delayMs(waitUiReadyMs)
          await driver.setDisplayRotation(DisplayRotation.ROTATION_0)
          await driver.delayMs(waitUiReadyMs)
          let direction0 = await driver.getDisplayRotation()
          console.log(`${TestTag}, testWindowResizeB_split1 setDisplayRotation_0 success ,${JSON.stringify(direction0)}`);
          // The device is displayed in horizontal on default
          if (direction0 == DisplayRotation.ROTATION_90) {
            console.log('The device is displayed in horizontal on default')
            let data: display.FoldStatus = display.getFoldStatus()
            console.log(`Succeeded in obtaining fold status. Data,${data}`);
            // Foldable device
            if (data != FoldStatus.FOLD_STATUS_UNKNOWN) {
              await driver.setDisplayRotation(DisplayRotation.ROTATION_90)
              await driver.delayMs(waitUiReadyMs)
              // The device is fully folded
              if (data == FoldStatus.FOLD_STATUS_FOLDED) {
                await driver.setDisplayRotation(DisplayRotation.ROTATION_0)
                await driver.delayMs(waitUiReadyMs)
              }
              let window2 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
              let bounds1 = await window2.getBounds()
              await window2.resize(0, bounds1.bottom - bounds1.top, ResizeDirection.RIGHT)
              await driver.delayMs(waitUiReadyMs * 5)
              let window3 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
              console.log(`${TestTag}, testWindowResizeB_split1 findWindow3 success ,${JSON.stringify(window3)}`);
              expect(window3 == null).assertTrue()
            }
            // Non-foldable device
            else {
              let window2 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
              let bounds1 = await window2.getBounds()
              await window2.resize(0, bounds1.bottom - bounds1.top, ResizeDirection.RIGHT)
              await driver.delayMs(waitUiReadyMs * 5)
              let window3 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
              console.log(`${TestTag}, testWindowResizeB_split1 findWindow3 success ,${JSON.stringify(window3)}`);
              expect(window3 == null).assertTrue()
            }
          }
          // The device is displayed in vertical on default
          else {
            console.log('The device is displayed in vertical on default')
            await driver.setDisplayRotation(DisplayRotation.ROTATION_90)
            await driver.delayMs(waitUiReadyMs)
            let direction = await driver.getDisplayRotation()
            console.log(`${TestTag}, testWindowResizeB_split1 setDisplayRotation success ,${JSON.stringify(direction)}`);
            expect(direction == 1).assertTrue()
            let window2 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
            let bounds1 = await window2.getBounds()
            await window2.resize(0, bounds1.bottom - bounds1.top, ResizeDirection.RIGHT)
            await driver.delayMs(waitUiReadyMs * 5)
            let window3 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
            console.log(`${TestTag}, testWindowResizeB_split1 findWindow3 success ,${JSON.stringify(window3)}`);
            expect(window3 == null).assertTrue()
          }
        } else {
          let window2 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
          let bounds1 = await window2.getBounds()
          await window2.resize(500, bounds1.bottom - bounds1.top, ResizeDirection.RIGHT)
          await driver.delayMs(waitUiReadyMs * 5)
          let window3 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
          console.log(`${TestTag}, testWindowResizeB_split1 findWindow3 success ,${JSON.stringify(window3)}`);
          let bounds2 = await window3.getBounds()
          console.log(`${TestTag}, testWindowResizeB_split1 getBounds2 success ,${JSON.stringify(bounds2)}`);
          expect(bounds2.right != bounds1.right).assertTrue()
        }
      } catch (error) {
        console.log('testWindowMinimize_split1 error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
      await envRecovery(driver)
    })

    /**
     * @tc.name   testWindowMinimize_full
     * @tc.number uitestUiWindowTest_new013
     * @tc.desc   Call the minimize interface in fullscreen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowMinimize_full', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      try {
        await setFull(driver)
        await driver.delayMs(waitUiReadyMs)
        let windowFull = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        await windowFull.minimize()
        await driver.delayMs(waitUiReadyMs)
        let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        console.log(`${TestTag}, testWindowMinimize_full findWindow1 success, ${JSON.stringify(window1)}`);
        expect(window1 == null).assertTrue()
      } catch (error) {
        console.log('testWindowMinimize_full error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
    })

    /**
     * @tc.name   testWindowMinimize_float
     * @tc.number uitestUiWindowTest_new014
     * @tc.desc   Call the minimize interface in fullscreen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowMinimize_float', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      try {
        await setFloat(driver)
        await driver.delayMs(waitUiReadyMs)
        let windowFloat = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        await windowFloat.minimize()
        await driver.delayMs(waitUiReadyMs)
        let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        console.log(`${TestTag}, testWindowMinimize_float findWindow1 success, ${JSON.stringify(window1)}`);
        expect(window1 == null).assertTrue()
      } catch (error) {
        console.log('testWindowMinimize_full error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
    })

    /**
     * @tc.name   testWindowMinimize_split
     * @tc.number uitestUiWindowTest_new015
     * @tc.desc   Call the minimize interface in split.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowMinimize_split', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      try {
        await setSplit(driver)
        await driver.delayMs(waitUiReadyMs)
        let windowSplit = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        await windowSplit.minimize()
        await driver.delayMs(waitUiReadyMs)
        let window2 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        console.log(`${TestTag}, testWindowMinimize_split findWindow2 success,${JSON.stringify(window2)}`);
        expect(window2 == null).assertTrue()
      } catch (error) {
        console.log('testWindowMinimize_split1 error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
      await envRecovery(driver)
    })

    /**
     * @tc.name   testWindowClose_full
     * @tc.number uitestUiWindowTest_new016
     * @tc.desc   Call the close interface in fullscreen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowClose_full', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      try {
        await setFull(driver)
        await driver.delayMs(waitUiReadyMs)
        let windowFull = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        await windowFull.close()
        await driver.delayMs(waitUiReadyMs)
        let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        console.log(`${TestTag}, testWindowClose_full findWindow1 success, ${JSON.stringify(window1)}`);
        expect(window1 == null).assertTrue()
      } catch (error) {
        console.log('testWindowClose_full error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
    })

    /**
     * @tc.name   testWindowClose_float
     * @tc.number uitestUiWindowTest_new017
     * @tc.desc   Call the close interface in fullscreen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowClose_float', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      try {
        await setFloat(driver)
        await driver.delayMs(waitUiReadyMs)
        let windowFloat = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        await windowFloat.close()
        await driver.delayMs(waitUiReadyMs)
        let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        console.log(`${TestTag}, testWindowClose_float findWindow1 success, ${JSON.stringify(window1)}`);
        expect(window1 == null).assertTrue()
      } catch (error) {
        console.log('testWindowClose_full error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
    })

    /**
     * @tc.name   testWindowClose_split
     * @tc.number uitestUiWindowTest_new018
     * @tc.desc   Call the close interface in split.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowClose_split', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      try {
        await setSplit(driver)
        await driver.delayMs(waitUiReadyMs)
        let windowSplit = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        await windowSplit.close()
        await driver.delayMs(waitUiReadyMs)
        let window2 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        console.log(`${TestTag}, testWindowClose_split findWindow2 success,${JSON.stringify(window2)}`);
        expect(window2 == null).assertTrue()
      } catch (error) {
        console.log('testWindowClose_split1 error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
      await stopApplication('com.uitestScene.acts')
      await envRecovery(driver)
    })

    /**
     * @tc.name   testWindowMaximize_full
     * @tc.number uitestUiWindowTest_new019
     * @tc.desc   Call the maximize interface in fullscreen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowMaximize_full', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      try {
        await setFull(driver)
        await driver.delayMs(waitUiReadyMs)
        let windowFull = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        await windowFull.maximize()
      } catch (error) {
        console.log('testWindowMaximize_full error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
    })

    /**
     * @tc.name   testWindowMaximize_float
     * @tc.number uitestUiWindowTest_new020
     * @tc.desc   Call the maximize interface in float.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowMaximize_float', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      try {
        await setFloat(driver)
        await driver.delayMs(waitUiReadyMs)
        let windowFloat = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        await windowFloat.maximize()
        await driver.delayMs(waitUiReadyMs)
        let window3 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        console.log(`${TestTag}, testWindowMaximize_float findWindow3 success, ${JSON.stringify(window3)}`);
        let mode = await window3.getWindowMode()
        console.log(`${TestTag}, testWindowMaximize_float getWindowMode success, ${JSON.stringify(mode)}`);
        expect(mode == WindowMode.FULLSCREEN).assertTrue()
      } catch (error) {
        console.log('testWindowMaximize_float error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
    })

    /**
     * @tc.name   testWindowMaximize_split
     * @tc.number uitestUiWindowTest_new021
     * @tc.desc   Call the maximize interface in float.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowMaximize_split', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      try {
        await setSplit(driver)
        await driver.delayMs(waitUiReadyMs)
        let window2 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        await window2.maximize()
        await driver.delayMs(waitUiReadyMs)
        let window3 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        console.log(`${TestTag}, testWindowMaximize_split findWindow3 success,${JSON.stringify(window3)}`);
        let mode = await window3.getWindowMode()
        console.log(`${TestTag}, testWindowMaximize_split getWindowMode success,${JSON.stringify(mode)}`);
        expect(mode == WindowMode.FULLSCREEN).assertTrue()
      } catch (error) {
        console.log('testWindowMaximize_float error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
      await stopApplication('com.uitestScene.acts');
      await envRecovery(driver)
    })

  })

}
