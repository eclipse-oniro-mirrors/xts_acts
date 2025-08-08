import { describe, it, expect, TestType, Level, Size } from '@ohos/hypium'
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const delegator : AbilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

const TestTag = 'UitestUiWindowErrorTest';
const DeviceErrorCode = 17000005;
const AsyncErrorCode = 17000002;
const InvisibleErrorCode = 17000004;
const waitUiReadyMs : number = 1000;


async function startAbility(bundleName: string, abilityName: string) {
  await delegator.executeShellCommand(`aa start -b ${bundleName} -a ${abilityName}`).then(result => {
    console.info(`UiTestCase, start abilityFinished: ${result}`)
  }).catch((err : BusinessError) => {
    console.error(`UiTestCase, start abilityFailed: ${err}`)
  })
}

async function stopApplication(bundleName: string) {
  await delegator.executeShellCommand(`aa force-stop ${bundleName} `).then(result => {
    console.info(`UiTestCase, stop application finished: ${result}`)
  }).catch((err : BusinessError) => {
    console.error(`UiTestCase,stop application failed: ${err}`)
  })
}

function sleep(nm: number) {
  return new Promise<void>((resolve: Function, reject: Function) => {
    setTimeout(resolve, nm);
  })
}

export default function uitestUiWindowErrorTest() {
  describe('UitestUiWindowErrorTest', () => {

    /*
   * @tc.number: uitestUiWindowErrorTest_001
   * @tc.name: test_UiWindow_getBundleName_17000002
   * @tc.desc: setPoint 17000002 test.
   */
    it('test_UiWindow_getBundleName_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_getBundleName_17000002 start`);
      try {
        let driver:Driver = Driver.create();
        let window = await driver.findWindow({actived: true});
        if (window == null) {
          window = await driver.findWindow({actived: false});
        }
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await window.getBundleName();
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_getBundleName_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_UiWindow_getBundleName_17000002 end`);
    })

    /*
   * @tc.number: uitestUiWindowErrorTest_002
   * @tc.name: test_UiWindow_getBundleName_17000004
   * @tc.desc: setPoint 17000004 test.
   */
    it('test_UiWindow_getBundleName_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_getBundleName_17000004 start`);
      try {
        let driver: Driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
        await driver.delayMs(waitUiReadyMs);
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs);
        await window.getBundleName();
        await driver.delayMs(waitUiReadyMs);
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_getBundleName_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, test_UiWindow_getBundleName_17000004 end`);
    })


    /*
    * @tc.number: uitestUiWindowErrorTest_003
    * @tc.name: test_UiWindow_getBundleName_17000002
    * @tc.desc: getBounds 17000002 test.
    */
    it('test_UiWindow_getBounds_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_getBounds_17000002 start`);
      try {
        let driver:Driver = Driver.create();
        let window = await driver.findWindow({actived: true});
        if (window == null) {
          window = await driver.findWindow({actived: false});
        }
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await window.getBounds();
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_getBounds_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_UiWindow_getBounds_17000002 end`);
    })

    /*
   * @tc.number: uitestUiWindowErrorTest_004
   * @tc.name: test_UiWindow_getBundleName_17000004
   * @tc.desc: getBounds 17000004 test.
   */
    it('test_UiWindow_getBounds_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_getBounds_17000004 start`);
      try {
        let driver: Driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
        await driver.delayMs(waitUiReadyMs);
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs);
        await window.getBounds();
        await driver.delayMs(waitUiReadyMs);
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_getBounds_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, test_UiWindow_getBounds_17000004 end`);
    })

    /*
    * @tc.number: uitestUiWindowErrorTest_005
    * @tc.name: test_UiWindow_getTitle_17000002
    * @tc.desc: getTitle 17000002 test.
    */
    it('test_UiWindow_getTitle_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_getTitle_17000002 start`);
      try {
        let driver:Driver = Driver.create();
        let window = await driver.findWindow({actived: true});
        if (window == null) {
          window = await driver.findWindow({actived: false});
        }
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await window.getTitle();
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_getTitle_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_UiWindow_getTitle_17000002 end`);
    })

    /*
   * @tc.number: uitestUiWindowErrorTest_006
   * @tc.name: test_UiWindow_getBundleName_17000004
   * @tc.desc: getTitle 17000004 test.
   */
    it('test_UiWindow_getTitle_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_getBundleName_17000004 start`);
      try {
        let driver: Driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
        await driver.delayMs(waitUiReadyMs);
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs);
        await window.getTitle();
        await driver.delayMs(waitUiReadyMs);
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_getBundleName_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, test_UiWindow_getBundleName_17000004 end`);
    })

    /*
    * @tc.number: uitestUiWindowErrorTest_007
    * @tc.name: test_UiWindow_getWindowMode_17000002
    * @tc.desc: getWindowMode 17000002 test.
    */
    it('test_UiWindow_getWindowMode_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_getWindowMode_17000002 start`);
      try {
        let driver:Driver = Driver.create();
        let window = await driver.findWindow({actived: true});
        if (window == null) {
          window = await driver.findWindow({actived: false});
        }
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await window.getWindowMode();
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_getWindowMode_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_UiWindow_getWindowMode_17000002 end`);
    })

    /*
   * @tc.number: uitestUiWindowErrorTest_008
   * @tc.name: test_UiWindow_getBundleName_17000004
   * @tc.desc: getWindowMode 17000004 test.
   */
    it('test_UiWindow_getWindowMode_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_getWindowMode_17000004 start`);
      try {
        let driver: Driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
        await driver.delayMs(waitUiReadyMs);
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs);
        await window.getWindowMode();
        await driver.delayMs(waitUiReadyMs);
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_getWindowMode_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, test_UiWindow_getWindowMode_17000004 end`);
    })

    /*
    * @tc.number: uitestUiWindowErrorTest_009
    * @tc.name: test_UiWindow_isFocused_17000002
    * @tc.desc: isFocused 17000002 test.
    */
    it('test_UiWindow_isFocused_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_isFocused_17000002 start`);
      try {
        let driver:Driver = Driver.create();
        let window = await driver.findWindow({actived: true});
        if (window == null) {
          window = await driver.findWindow({actived: false});
        }
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await window.isFocused();
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_isFocused_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_UiWindow_isFocused_17000002 end`);
    })

    /*
   * @tc.number: uitestUiWindowErrorTest_010
   * @tc.name: test_UiWindow_isFocused_17000004
   * @tc.desc: isFocused 17000004 test.
   */
    it('test_UiWindow_isFocused_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_isFocused_17000004 start`);
      try {
        let driver: Driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
        await driver.delayMs(waitUiReadyMs);
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs);
        await window.isFocused();
        await driver.delayMs(waitUiReadyMs);
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_isFocused_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, test_UiWindow_isFocused_17000004 end`);
    })

    /*
    * @tc.number: uitestUiWindowErrorTest_011
    * @tc.name: test_UiWindow_isActive_17000002
    * @tc.desc: isActive 17000002 test.
    */
    it('test_UiWindow_isActive_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_isActive_17000002 start`);
      try {
        let driver:Driver = Driver.create();
        let window = await driver.findWindow({actived: true});
        if (window == null) {
          window = await driver.findWindow({actived: false});
        }
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await window.isActive();
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_isActive_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_UiWindow_isActive_17000002 end`);
    })

    /*
   * @tc.number: uitestUiWindowErrorTest_012
   * @tc.name: test_UiWindow_isActive_17000004
   * @tc.desc: isActive 17000004 test.
   */
    it('test_UiWindow_isActive_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_isActive_17000004 start`);
      try {
        let driver: Driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
        await driver.delayMs(waitUiReadyMs);
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs);
        await window.isActive();
        await driver.delayMs(waitUiReadyMs);
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_isActive_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, test_UiWindow_isActive_17000004 end`);
    })


    /*
    * @tc.number: uitestUiWindowErrorTest_011
    * @tc.name: test_UiWindow_isActived_17000002
    * @tc.desc: isActived 17000002 test.
    */
    it('test_UiWindow_isActived_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_isActive_17000002 start`);
      try {
        let driver:Driver = Driver.create();
        let window = await driver.findWindow({actived: true});
        if (window == null) {
          window = await driver.findWindow({actived: false});
        }
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await window.isActived();
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_isActive_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_UiWindow_isActive_17000002 end`);
    })

    /*
   * @tc.number: uitestUiWindowErrorTest_012
   * @tc.name: test_UiWindow_isActived_17000004
   * @tc.desc: isActived 17000004 test.
   */
    it('test_UiWindow_isActived_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_isActive_17000004 start`);
      try {
        let driver: Driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
        await driver.delayMs(waitUiReadyMs);
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs);
        await window.isActived();
        await driver.delayMs(waitUiReadyMs);
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_isActive_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, test_UiWindow_isActive_17000004 end`);
    })

    /*
    * @tc.number: uitestUiWindowErrorTest_013
    * @tc.name: test_UiWindow_isActive_17000002
    * @tc.desc: focus 17000002 test.
    */
    it('test_UiWindow_focus_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_focus_17000002 start`);
      try {
        let driver:Driver = Driver.create();
        let window = await driver.findWindow({actived: true});
        if (window == null) {
          window = await driver.findWindow({actived: false});
        }
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await window.focus();
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_focus_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_UiWindow_focus_17000002 end`);
    })

    /*
   * @tc.number: uitestUiWindowErrorTest_014
   * @tc.name: test_UiWindow_isActive_17000004
   * @tc.desc: focus 17000004 test.
   */
    it('test_UiWindow_focus_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_focus_17000004 start`);
      try {
        let driver: Driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
        await driver.delayMs(waitUiReadyMs);
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs);
        await window.focus();
        await driver.delayMs(waitUiReadyMs);
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_focus_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, test_UiWindow_focus_17000004 end`);
    })

    /*
    * @tc.number: uitestUiWindowErrorTest_015
    * @tc.name: test_UiWindow_isActive_17000002
    * @tc.desc: moveTo 17000002 test.
    */
    it('test_UiWindow_moveTo_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_moveTo_17000002 start`);
      try {
        let driver:Driver = Driver.create();
        let window = await driver.findWindow({actived: true});
        if (window == null) {
          window = await driver.findWindow({actived: false});
        }
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await window.moveTo(100, 100)
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_moveTo_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_UiWindow_moveTo_17000002 end`);
    })

    /*
   * @tc.number: uitestUiWindowErrorTest_016
   * @tc.name: test_UiWindow_moveTo_17000004
   * @tc.desc: moveTo 17000004 test.
   */
    it('test_UiWindow_moveTo_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_moveTo_17000004 start`);
      let isSupport = false;
      try {
        let driver = Driver.create();
        let window = await driver.findWindow({actived: true});
        if (window == null) {
          window = await driver.findWindow({actived: false});
        }
        await window.moveTo(100, 100);
        isSupport = true;
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_moveTo_17000004 isSupport error is: ${JSON.stringify(e)}`);
        isSupport = false;
      }
      console.log(`${TestTag}, test_UiWindow_moveTo_17000004 isSupport is: ${ isSupport }`);
      if (isSupport) {
        try {
          let driver: Driver = Driver.create();
          await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
          await driver.delayMs(waitUiReadyMs);
          let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
          await driver.delayMs(waitUiReadyMs);
          await stopApplication('com.uitestScene.acts');
          await driver.delayMs(waitUiReadyMs);
          await window.moveTo(100, 100);
          await driver.delayMs(waitUiReadyMs);
        }catch (e) {
          console.log(`${TestTag}, test_UiWindow_moveTo_17000004 error is: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(InvisibleErrorCode);
        }
      }
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, test_UiWindow_moveTo_17000004 end`);
    })

    /*
  * @tc.number: uitestUiWindowErrorTest_018
  * @tc.name: test_UiWindow_moveTo_17000005
  * @tc.desc: moveTo 17000005 test.
  */
    it('test_UiWindow_moveTo_17000005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_moveTo_17000005 start`);
      try {
        let driver = Driver.create();
        let window = await driver.findWindow({actived: true});
        if (window == null) {
          window = await driver.findWindow({actived: false});
        }
        await window.moveTo(100, 100);
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_moveTo_17000005 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(DeviceErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, test_UiWindow_moveTo_17000005 end`);
    })

    /*
    * @tc.number: uitestUiWindowErrorTest_019
    * @tc.name: test_UiWindow_resize_17000002
    * @tc.desc: resize 17000002 test.
    */
    it('test_UiWindow_resize_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_resize_17000002 start`);
      try {
        let driver:Driver = Driver.create();
        let window = await driver.findWindow({actived: true});
        if (window == null) {
          window = await driver.findWindow({actived: false});
        }
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await window.resize(100, 100, ResizeDirection.LEFT);
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_resize_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_UiWindow_resize_17000002 end`);
    })

    /*
   * @tc.number: uitestUiWindowErrorTest_020
   * @tc.name: test_UiWindow_resize_17000004
   * @tc.desc: resize 17000004 test.
   */
    it('test_UiWindow_resize_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_resize_17000004 start`);
      let isSupportResize = true;
      try {
        let driver: Driver = Driver.create();
        let window: UiWindow = await driver.findWindow({actived: true});
        if (window == null) {
          window = await driver.findWindow({actived: false});
        }
        await window.resize(100, 100, ResizeDirection.LEFT);
        isSupportResize = true;
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_resize_17000004 isSupportResize error is: ${JSON.stringify(e)}`);
        if (e.code == DeviceErrorCode) {
          isSupportResize = false;
        }
      }
      console.log(`${TestTag}, test_UiWindow_resize_17000004 isSupportResize is: ${isSupportResize}`);
      if (isSupportResize) {
        try {
          let driver: Driver = Driver.create();
          await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
          await driver.delayMs(waitUiReadyMs);
          let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
          await driver.delayMs(waitUiReadyMs);
          await stopApplication('com.uitestScene.acts');
          await driver.delayMs(waitUiReadyMs);
          await window.resize(100, 100, ResizeDirection.LEFT);
          await driver.delayMs(waitUiReadyMs);
        }catch (e) {
          console.log(`${TestTag}, test_UiWindow_resize_17000004 error is: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(InvisibleErrorCode);
        }
      }
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, test_UiWindow_resize_17000004 end`);
    })

    /*
  * @tc.number: uitestUiWindowErrorTest_022
  * @tc.name: test_UiWindow_resize_17000005
  * @tc.desc: resize 17000005 test.
  */
    it('test_UiWindow_resize_17000005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_resize_17000005 start`);
      try {
        let driver = Driver.create();
        let window = await driver.findWindow({actived: true});
        if (window == null) {
          window = await driver.findWindow({actived: false});
        }
        await window.resize(100, 100, ResizeDirection.LEFT);
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_resize_17000005 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(DeviceErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, test_UiWindow_resize_17000005 end`);
    })

    /*
    * @tc.number: uitestUiWindowErrorTest_023
    * @tc.name: test_UiWindow_resize_17000002
    * @tc.desc: split 17000002 test.
    */
    it('test_UiWindow_split_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_split_17000002 start`);
      try {
        let driver:Driver = Driver.create();
        let window = await driver.findWindow({actived: true});
        if (window == null) {
          window = await driver.findWindow({actived: false});
        }
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await window.split();
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_split_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_UiWindow_split_17000002 end`);
    })

    /*
   * @tc.number: uitestUiWindowErrorTest_024
   * @tc.name: test_UiWindow_resize_17000004
   * @tc.desc: split 17000004 test.
   */
    it('test_UiWindow_split_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_split_17000004 start`);
      let isSupportSpilt = true;
      try {
        let driver: Driver = Driver.create();
        let window: UiWindow = await driver.findWindow({actived: true});
        if (window == null) {
          window = await driver.findWindow({actived: false});
        }
        await window.split();
        isSupportSpilt = true;
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_split_17000004 isSupportSpilt error is: ${JSON.stringify(e)}`);
        if (e.code == DeviceErrorCode) {
          isSupportSpilt = false;
        }
      }
      console.log(`${TestTag}, test_UiWindow_split_17000004 isSupportSpilt is: ${isSupportSpilt}`);
      if (isSupportSpilt) {
        try {
          let driver: Driver = Driver.create();
          await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
          await driver.delayMs(waitUiReadyMs);
          let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
          await driver.delayMs(waitUiReadyMs);
          await stopApplication('com.uitestScene.acts');
          await driver.delayMs(waitUiReadyMs);
          await window.split();
          await driver.delayMs(waitUiReadyMs);
        }catch (e) {
          console.log(`${TestTag}, test_UiWindow_split_17000004 error is: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(InvisibleErrorCode);
        }
      }
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, test_UiWindow_split_17000004 end`);
    })

    /*
  * @tc.number: uitestUiWindowErrorTest_025
  * @tc.name: test_UiWindow_split_17000005
  * @tc.desc: split 17000005 test.
  */
    it('test_UiWindow_split_17000005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_split_17000005 start`);
      try {
        let driver = Driver.create();
        let window = await driver.findWindow({actived: true});
        if (window == null) {
          window = await driver.findWindow({actived: false});
        }
        await window.split();
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_split_17000005 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(DeviceErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, test_UiWindow_split_17000005 end`);
    })


    /*
    * @tc.number: uitestUiWindowErrorTest_026
    * @tc.name: test_UiWindow_resize_17000002
    * @tc.desc: maximize 17000002 test.
    */
    it('test_UiWindow_maximize_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_maximize_17000002 start`);
      try {
        let driver:Driver = Driver.create();
        let window = await driver.findWindow({actived: true});
        if (window == null) {
          window = await driver.findWindow({actived: false});
        }
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await window.maximize();
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_maximize_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_UiWindow_maximize_17000002 end`);
    })

    /*
   * @tc.number: uitestUiWindowErrorTest_027
   * @tc.name: test_UiWindow_maximize_17000004
   * @tc.desc: maximize 17000004 test.
   */
    it('test_UiWindow_maximize_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_maximize_17000004 start`);
      let isSupportMaximize = true;
      try {
        let driver: Driver = Driver.create();
        let window: UiWindow = await driver.findWindow({actived: true});
        if (window == null) {
          window = await driver.findWindow({actived: false});
        }
        await window.maximize();
        isSupportMaximize = true;
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_maximize_17000004 isSupportMaximize error is: ${JSON.stringify(e)}`);
        if (e.code == DeviceErrorCode) {
          isSupportMaximize = false;
        }
      }
      if (isSupportMaximize) {
        try {
          let driver: Driver = Driver.create();
          await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
          await driver.delayMs(waitUiReadyMs);
          let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
          await driver.delayMs(waitUiReadyMs);
          await stopApplication('com.uitestScene.acts');
          await driver.delayMs(waitUiReadyMs);
          await window.maximize();
          await driver.delayMs(waitUiReadyMs);
        }catch (e) {
          console.log(`${TestTag}, test_UiWindow_maximize_17000004 error is: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(InvisibleErrorCode);
        }
      }
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, test_UiWindow_maximize_17000004 end`);
    })

    /*
  * @tc.number: uitestUiWindowErrorTest_028
  * @tc.name: test_UiWindow_maximize_17000005
  * @tc.desc: maximize 17000005 test.
  */
    it('test_UiWindow_maximize_17000005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_maximize_17000005 start`);
      try {
        let driver = Driver.create();
        let window = await driver.findWindow({actived: true});
        if (window == null) {
          window = await driver.findWindow({actived: false});
        }
        await window.maximize();
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_maximize_17000005 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(DeviceErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, test_UiWindow_maximize_17000005 end`);
    })

    /*
    * @tc.number: uitestUiWindowErrorTest_029
    * @tc.name: test_UiWindow_minimize_17000002
    * @tc.desc: minimize 17000002 test.
    */
    it('test_UiWindow_minimize_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_minimize_17000002 start`);
      try {
        let driver:Driver = Driver.create();
        let window = await driver.findWindow({actived: true});
        if (window == null) {
          window = await driver.findWindow({actived: false});
        }
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await window.minimize();
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_minimize_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_UiWindow_minimize_17000002 end`);
    })

    /*
   * @tc.number: uitestUiWindowErrorTest_030
   * @tc.name: test_UiWindow_minimize_17000004
   * @tc.desc: minimize 17000004 test.
   */
    it('test_UiWindow_minimize_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_minimize_17000004 start`);
      let isSupportMinimize = false;
      try {
        let driver: Driver = Driver.create();
        let window: UiWindow = await driver.findWindow({actived: true});
        if (window == null) {
          window = await driver.findWindow({actived: false});
        }
        await window.minimize();
        isSupportMinimize = true;
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_minimize_17000004 isSupportMinimize error is: ${JSON.stringify(e)}`);
        isSupportMinimize = false;
      }
      console.log(`${TestTag}, test_UiWindow_minimize_17000004 isSupportMinimize is: ${ isSupportMinimize }`);
      if (isSupportMinimize) {
        try {
          let driver: Driver = Driver.create();
          await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
          await driver.delayMs(waitUiReadyMs);
          let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
          await driver.delayMs(waitUiReadyMs);
          await stopApplication('com.uitestScene.acts');
          await driver.delayMs(waitUiReadyMs);
          await window.minimize();
          await driver.delayMs(waitUiReadyMs);
        }catch (e) {
          console.log(`${TestTag}, test_UiWindow_minimize_17000004 error is: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(InvisibleErrorCode);
        }
      }
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, test_UiWindow_minimize_17000004 end`);
    })

    /*
  * @tc.number: uitestUiWindowErrorTest_031
  * @tc.name: test_UiWindow_minimize_17000005
  * @tc.desc: minimize 17000005 test.
  */
    it('test_UiWindow_minimize_17000005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_minimize_17000005 start`);
      try {
        let driver = Driver.create();
        let window = await driver.findWindow({actived: true});
        if (window == null) {
          window = await driver.findWindow({actived: false});
        }
        await window.minimize();
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_minimize_17000005 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(DeviceErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, test_UiWindow_minimize_17000005 end`);
    })

    /*
    * @tc.number: uitestUiWindowErrorTest_032
    * @tc.name: test_UiWindow_minimize_17000002
    * @tc.desc: resume 17000002 test.
    */
    it('test_UiWindow_resume_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_resume_17000002 start`);
      try {
        let driver:Driver = Driver.create();
        let window = await driver.findWindow({actived: true});
        if (window == null) {
          window = await driver.findWindow({actived: false});
        }
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await window.resume();
        await driver.delayMs(waitUiReadyMs);
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_resume_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_UiWindow_resume_17000002 end`);
    })

    /*
   * @tc.number: uitestUiWindowErrorTest_033
   * @tc.name: test_UiWindow_resume_17000004
   * @tc.desc: resume 17000004 test.
   */
    it('test_UiWindow_resume_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_resume_17000004 start`);
      let isSupportResume = true;
      try {
        let driver: Driver = Driver.create();
        let window: UiWindow = await driver.findWindow({actived: true});
        if (window == null) {
          window = await driver.findWindow({actived: false});
        }
        await window.resume();
        isSupportResume = true;
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_resume_17000004 isSupportResume error is: ${JSON.stringify(e)}`);
        if (e.code == DeviceErrorCode) {
          isSupportResume = false;
        }
      }
      if (isSupportResume) {
        try {
          let driver: Driver = Driver.create();
          await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
          await driver.delayMs(waitUiReadyMs);
          let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
          await driver.delayMs(waitUiReadyMs);
          await stopApplication('com.uitestScene.acts');
          await driver.delayMs(waitUiReadyMs);
          await window.resume();
          await driver.delayMs(waitUiReadyMs);
        }catch (e) {
          console.log(`${TestTag}, test_UiWindow_resume_17000004 error is: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(InvisibleErrorCode);
        }
      }
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, test_UiWindow_resume_17000004 end`);
    })

    /*
  * @tc.number: uitestUiWindowErrorTest_034
  * @tc.name: test_UiWindow_resume_17000005
  * @tc.desc: resume 17000005 test.
  */
    it('test_UiWindow_resume_17000005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_resume_17000005 start`);
      try {
        let driver = Driver.create();
        let window = await driver.findWindow({actived: true});
        if (window == null) {
          window = await driver.findWindow({actived: false});
        }
        await window.resume();
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_resume_17000005 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(DeviceErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, test_UiWindow_resume_17000005 end`);
    })

    /*
    * @tc.number: uitestUiWindowErrorTest_035
    * @tc.name: test_UiWindow_close_17000002
    * @tc.desc: close 17000002 test.
    */
    it('test_UiWindow_close_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_close_17000002 start`);
      try {
        let driver:Driver = Driver.create();
        let window = await driver.findWindow({actived: true});
        if (window == null) {
          window = await driver.findWindow({actived: false});
        }
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await window.close();
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_close_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_UiWindow_close_17000002 end`);
    })

    /*
   * @tc.number: uitestUiWindowErrorTest_036
   * @tc.name: test_UiWindow_resume_17000004
   * @tc.desc: close 17000004 test.
   */
    it('test_UiWindow_close_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_close_17000004 start`);
      let driver:Driver = Driver.create();
      let isSupportClose = true;
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
        await window.close();
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_close_17000004 isSupportClose error is: ${JSON.stringify(e)}`);
        if (e.code == DeviceErrorCode) {
          isSupportClose = false;
        }
      }
      await stopApplication('com.uitestScene.acts');
      await driver.delayMs(waitUiReadyMs);
      console.log(`${TestTag}, test_UiWindow_close_17000004 isSupportClose is: ${ isSupportClose }`);
      if (isSupportClose) {
        try {
          let driver: Driver = Driver.create();
          await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
          await driver.delayMs(waitUiReadyMs);
          let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
          await driver.delayMs(waitUiReadyMs);
          await stopApplication('com.uitestScene.acts');
          await driver.delayMs(waitUiReadyMs);
          await window.close();
          await driver.delayMs(waitUiReadyMs);
        }catch (e) {
          console.log(`${TestTag}, test_UiWindow_close_17000004 error is: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(InvisibleErrorCode);
        }
      }
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, test_UiWindow_close_17000004 end`);
    })

    /*
  * @tc.number: uitestUiWindowErrorTest_037
  * @tc.name: test_UiWindow_close_17000005
  * @tc.desc: close 17000005 test.
  */
    it('test_UiWindow_close_17000005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_close_17000005 start`);
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
        await driver.delayMs(waitUiReadyMs);
        await window.close();
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_close_17000005 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(DeviceErrorCode);
      }
      await stopApplication('com.uitestScene.acts');
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, test_UiWindow_close_17000005 end`);
    })

    /*
    * @tc.number: uitestUiWindowErrorTest_038
    * @tc.name: test_UiWindow_getDisplayId_17000002
    * @tc.desc: getDisplayId 17000002 test.
    */
    it('test_UiWindow_getDisplayId_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_getDisplayId_17000002 start`);
      try {
        let driver:Driver = Driver.create();
        let window = await driver.findWindow({actived: true});
        if (window == null) {
          window = await driver.findWindow({actived: false});
        }
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await window.getDisplayId();
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_getDisplayId_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_UiWindow_getDisplayId_17000002 end`);
    })

    /*
   * @tc.number: uitestUiWindowErrorTest_039
   * @tc.name: test_UiWindow_getDisplayId_17000004
   * @tc.desc: getDisplayId 17000004 test.
   */
    it('test_UiWindow_getDisplayId_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiWindow_getDisplayId_17000004 start`);
      try {
        let driver: Driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
        await driver.delayMs(waitUiReadyMs);
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs);
        await window.getDisplayId();
        await driver.delayMs(waitUiReadyMs);
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_getDisplayId_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, test_UiWindow_getDisplayId_17000004 end`);
    })
  })
}