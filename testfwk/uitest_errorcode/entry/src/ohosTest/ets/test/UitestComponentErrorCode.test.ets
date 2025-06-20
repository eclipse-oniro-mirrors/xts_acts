import { describe, it, expect, TestType, Level, Size } from '@ohos/hypium'
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const delegator : AbilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

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

const waitUiReadyMs : number = 1000;
const TestTag = 'UitestComponentErrorTest';
const AsyncErrorCode = 17000002;
const InvisibleErrorCode = 17000004;
const ErrorCode = 401;

function sleep(nm: number) {
  return new Promise<void>((resolve: Function, reject: Function) => {
    setTimeout(resolve, nm);
  })
}

export default function uitestComponentErrorTest() {
  describe('UitestComponentErrorTest', () => {

    /*
     * @tc.number: UitestComponentErrorTest_041
     * @tc.name: test_scrollToTop_17000002
     * @tc.desc: scrollToTop 17000002 test.
    */
    it('test_scrollToTop_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_scrollToTop_17000002 start`);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        let button = await driver.findComponent(ON.type('Scroll'));
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await button.scrollToTop();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_scrollToTop_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_scrollToTop_17000002 end`);
    })

    /*
    * @tc.number: UitestComponentErrorTest_042
    * @tc.name: test_scrollToTop_17000004
    * @tc.desc: scrollToTop 17000004 test.
    */
    it('test_scrollToTop_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TestTag, 'test_scrollToTop_17000004 start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let scrollBar = await driver.findComponent(ON.type('Scroll'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        await scrollBar.scrollToTop();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_scrollToTop_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(TestTag, 'test_scrollToTop_17000004 end');
    })


    /*
        * @tc.number: UitestComponentErrorTest_038
        * @tc.name: test_scrollSearch_17000002
        * @tc.desc: scrollSearch 17000002 test.
        */
    it('test_scrollSearch_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_scrollSearch_17000002 start`);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        let on = ON.text('next page');
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await button.scrollSearch(on);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_scrollSearch_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_scrollSearch_17000002 end`);
    })

    /*
    * @tc.number: UitestComponentErrorTest_039
    * @tc.name: test_scrollSearch_17000004
    * @tc.desc: scrollSearch 17000004 test.
    */
    it('test_scrollSearch_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TestTag, 'test_scrollSearch_17000004 start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.type('Scroll'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        await button.scrollSearch(ON.text('next page'));
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_scrollSearch_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(TestTag, 'test_scrollSearch_17000004 end');
    })

    /*
    * @tc.number: UitestComponentErrorTest_043
    * @tc.name: test_scrollToBottom_17000002
    * @tc.desc: scrollToBottom 17000002 test.
    */
    it('test_scrollToBottom_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_scrollToBottom_17000002 start`);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.type('Scroll'));
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await button.scrollToBottom();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_scrollToBottom_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      await sleep(waitUiReadyMs * 6);
      console.log(`${TestTag}, test_scrollToBottom_17000002 end`);
    })

    /*
    * @tc.number: UitestComponentErrorTest_044
    * @tc.name: test_scrollSearch_17000004
    * @tc.desc: scrollToBottom 17000004 test.
    */
    it('test_scrollToBottom_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TestTag, 'test_scrollToBottom_17000004 start');
      const driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.type('Scroll'));
      await driver.delayMs(waitUiReadyMs);
      await stopApplication('com.uitestScene.acts');
      await driver.delayMs(waitUiReadyMs * 2);
      try {
        await button.scrollToBottom();
        console.log(`${TestTag}, test_scrollToBottom_17000004 scrollToBottom success.`);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_scrollToBottom_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(TestTag, 'test_scrollToBottom_17000004 end');
    })

    /*
    * @tc.number: UitestComponentErrorTest_001
    * @tc.name: test_click_17000002
    * @tc.desc: click 17000002 test.
    */
    it('test_click_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_click_17000002 start`);
      const driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.text('MainPage'));
      try {
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await button.click();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_click_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(17000002);
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_click_17000002 end`);
    })

    /*
    * @tc.number: UitestComponentErrorTest_002
    * @tc.name: test_click_17000004
    * @tc.desc: click 17000004 test.
    */
    it('test_click_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TestTag, 'test_click_17000004 start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs);
        await button.click();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_click_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(TestTag, 'test_click_17000004 end');
    })


    /*
    * @tc.number: UitestComponentErrorTest_003
    * @tc.name: test_doubleClick_17000002
    * @tc.desc: doubleClick 17000002 test.
    */
    it('test_doubleClick_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_click_17000002 start`);
      const driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.text('MainPage'));
      try {
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await button.doubleClick();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_click_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_click_17000002 end`);
    })

    /*
    * @tc.number: UitestComponentErrorTest_004
    * @tc.name: test_doubleClick_17000004
    * @tc.desc: doubleClick 17000004 test.
    */
    it('test_doubleClick_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TestTag, 'test_click_17000004 start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        await button.doubleClick();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_click_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(TestTag, 'test_click_17000004 end');
    })


    /*
    * @tc.number: UitestComponentErrorTest_005
    * @tc.name: test_longClick_17000002
    * @tc.desc: doubleClick 17000002 test.
    */
    it('test_longClick_17000002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_longClick_17000002 start`);
      const driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.text('MainPage'));
      try {
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await button.longClick();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_longClick_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      await sleep(waitUiReadyMs * 3);
      console.log(`${TestTag}, test_longClick_17000002 end`);
    })

    /*
    * @tc.number: UitestComponentErrorTest_006
    * @tc.name: test_doubleClick_17000004
    * @tc.desc: doubleClick 17000004 test.
    */
    it('test_longClick_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TestTag, 'test_longClick_17000004 start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        await button.longClick();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_longClick_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(TestTag, 'test_longClick_17000004 end');
    })

    /*
    * @tc.number: UitestComponentErrorTest_007
    * @tc.name: test_getId_17000002
    * @tc.desc: getId 17000002 test.
    */
    it('test_getId_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_getId_17000002 start`);
      const driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.text('MainPage'));
      try {
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await button.getId();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_getId_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      await sleep(waitUiReadyMs * 4);
      console.log(`${TestTag}, test_getId_17000002 end`);
    })

    /*
    * @tc.number: UitestComponentErrorTest_008
    * @tc.name: test_getId_17000004
    * @tc.desc: getId 17000004 test.
    */
    it('test_getId_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TestTag, 'test_getId_17000004 start');
      const driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.text('MainPage'));
      await stopApplication('com.uitestScene.acts');
      try {
        await driver.delayMs(waitUiReadyMs * 2);
        await button.getId();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_getId_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(TestTag, 'test_getId_17000004 end');
    })

    /*
    * @tc.number: UitestComponentErrorTest_009
    * @tc.name: test_getText_17000002
    * @tc.desc: getText 17000002 test.
    */
    it('test_getText_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_getText_17000002 start`);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await button.getText();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_getText_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_getText_17000002 end`);
    })

    /*
    * @tc.number: UitestComponentErrorTest_010
    * @tc.name: test_getId_17000004
    * @tc.desc: getText 17000004 test.
    */
    it('test_getText_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TestTag, 'test_getText_17000004 start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        await button.getText();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_getText_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(TestTag, 'test_getText_17000004 end');
    })

    /*
    * @tc.number: UitestComponentErrorTest_011
    * @tc.name: test_getText_17000002
    * @tc.desc: getText 17000002 test.
    */
    it('test_getType_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_getType_17000002 start`);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await button.getType();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_getType_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_getType_17000002 end`);
    })

    /*
    * @tc.number: UitestComponentErrorTest_012
    * @tc.name: test_getType_17000004
    * @tc.desc: getText 17000004 test.
    */
    it('test_getType_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TestTag, 'test_getType_17000004 start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        await button.getType();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_getType_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(TestTag, 'test_getType_17000004 end');
    })

    /*
    * @tc.number: UitestComponentErrorTest_013
    * @tc.name: test_getBounds_17000002
    * @tc.desc: getBounds 17000002 test.
    */
    it('test_getBounds_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_getBounds_17000002 start`);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await button.getBounds();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_getBounds_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_getBounds_17000002 end`);
    })

    /*
    * @tc.number: UitestComponentErrorTest_014
    * @tc.name: test_getBounds_17000004
    * @tc.desc: getBounds 17000004 test.
    */
    it('test_getBounds_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TestTag, 'test_getBounds_17000004 start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        await button.getBounds();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_getBounds_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(TestTag, 'test_getBounds_17000004 end');
    })

    /*
    * @tc.number: UitestComponentErrorTest_015
    * @tc.name: test_getBoundsCenter_17000002
    * @tc.desc: getBoundsCenter 17000002 test.
    */
    it('test_getBoundsCenter_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_getBoundsCenter_17000002 start`);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await button.getBoundsCenter();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_getBoundsCenter_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_getBoundsCenter_17000002 end`);
    })

    /*
    * @tc.number: UitestComponentErrorTest_016
    * @tc.name: test_getBounds_17000004
    * @tc.desc: getBoundsCenter 17000004 test.
    */
    it('test_getBoundsCenter_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TestTag, 'test_getBoundsCenter_17000004 start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        await button.getBoundsCenter();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_getBoundsCenter_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await sleep(waitUiReadyMs * 2);
      console.log(TestTag, 'test_getBoundsCenter_17000004 end');
    })

    /*
    * @tc.number: UitestComponentErrorTest_017
    * @tc.name: test_isClickable_17000002
    * @tc.desc: isClickable 17000002 test.
    */
    it('test_isClickable_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_isClickable_17000002 start`);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await button.isClickable();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_isClickable_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_isClickable_17000002 end`);
    })

    /*
    * @tc.number: UitestComponentErrorTest_018
    * @tc.name: test_isClickable_17000004
    * @tc.desc: isClickable 17000004 test.
    */
    it('test_isClickable_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TestTag, 'test_isClickable_17000004 start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        await button.isClickable();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_isClickable_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(TestTag, 'test_isClickable_17000004 end');
    })

    /*
    * @tc.number: UitestComponentErrorTest_019
    * @tc.name: test_isClickable_17000002
    * @tc.desc: isLongClickable 17000002 test.
    */
    it('test_isLongClickable_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_isLongClickable_17000002 start`);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await button.isLongClickable();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_isLongClickable_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_isLongClickable_17000002 end`);
    })

    /*
    * @tc.number: UitestComponentErrorTest_020
    * @tc.name: test_isClickable_17000004
    * @tc.desc: isLongClickable 17000004 test.
    */
    it('test_isLongClickable_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TestTag, 'test_isLongClickable_17000004 start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        await button.isLongClickable();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_isLongClickable_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(TestTag, 'test_isLongClickable_17000004 end');
    })

    /*
    * @tc.number: UitestComponentErrorTest_021
    * @tc.name: test_isChecked_17000002
    * @tc.desc: isChecked 17000002 test.
    */
    it('test_isChecked_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_isChecked_17000002 start`);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await sleep(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await button.isChecked();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_isChecked_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_isChecked_17000002 end`);
    })

    /*
    * @tc.number: UitestComponentErrorTest_022
    * @tc.name: test_isChecked_17000004
    * @tc.desc: isChecked 17000004 test.
    */
    it('test_isChecked_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TestTag, 'test_isChecked_17000004 start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        await button.isChecked();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_isChecked_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(TestTag, 'test_isChecked_17000004 end');
    })

    /*
    * @tc.number: UitestComponentErrorTest_023
    * @tc.name: test_isCheckable_17000002
    * @tc.desc: isCheckable 17000002 test.
    */
    it('test_isCheckable_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_isCheckable_17000002 start`);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await button.isCheckable();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_isCheckable_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_isCheckable_17000002 end`);
    })

    /*
    * @tc.number: UitestComponentErrorTest_024
    * @tc.name: test_isCheckable_17000004
    * @tc.desc: isCheckable 17000004 test.
    */
    it('test_isCheckable_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TestTag, 'test_isCheckable_17000004 start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        await button.isCheckable();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_isCheckable_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(TestTag, 'test_isCheckable_17000004 end');
    })

    /*
    * @tc.number: UitestComponentErrorTest_025
    * @tc.name: test_isScrollable_17000002
    * @tc.desc: isScrollable 17000002 test.
    */
    it('test_isScrollable_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_isScrollable_17000002 start`);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await button.isScrollable();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_isScrollable_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_isScrollable_17000002 end`);
    })

    /*
    * @tc.number: UitestComponentErrorTest_026
    * @tc.name: test_isScrollable_17000004
    * @tc.desc: isScrollable 17000004 test.
    */
    it('test_isScrollable_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TestTag, 'test_isScrollable_17000004 start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        await button.isScrollable();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_isScrollable_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      console.log(TestTag, 'test_isScrollable_17000004 end');
    })

    /*
    * @tc.number: UitestComponentErrorTest_027
    * @tc.name: test_isEnabled_17000002
    * @tc.desc: isEnabled 17000002 test.
    */
    it('test_isEnabled_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_isEnabled_17000002 start`);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await button.isEnabled();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_isEnabled_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_isEnabled_17000002 end`);
    })

    /*
    * @tc.number: UitestComponentErrorTest_028
    * @tc.name: test_isEnabled_17000004
    * @tc.desc: isEnabled 17000004 test.
    */
    it('test_isEnabled_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TestTag, 'test_isEnabled_17000004 start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        await button.isEnabled();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_isEnabled_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      console.log(TestTag, 'test_isEnabled_17000004 end');
    })

    /*
    * @tc.number: UitestComponentErrorTest_029
    * @tc.name: test_isEnabled_17000002
    * @tc.desc: isFocused 17000002 test.
    */
    it('test_isFocused_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_isFocused_17000002 start`);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await button.isFocused();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_isFocused_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_isFocused_17000002 end`);
    })

    /*
    * @tc.number: UitestComponentErrorTest_030
    * @tc.name: test_isFocused_17000004
    * @tc.desc: isFocused 17000004 test.
    */
    it('test_isFocused_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TestTag, 'test_isFocused_17000004 start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        await button.isFocused();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_isFocused_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      console.log(TestTag, 'test_isFocused_17000004 end');
    })


    /*
    * @tc.number: UitestComponentErrorTest_031
    * @tc.name: test_isSelected_17000002
    * @tc.desc: isSelected 17000002 test.
    */
    it('test_isSelected_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_isSelected_17000002 start`);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await button.isSelected();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_isSelected_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_isSelected_17000002 end`);
    })

    /*
    * @tc.number: UitestComponentErrorTest_032
    * @tc.name: test_isSelected_17000004
    * @tc.desc: isSelected 17000004 test.
    */
    it('test_isSelected_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TestTag, 'test_isSelected_17000004 start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        await button.isSelected();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_isSelected_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      console.log(TestTag, 'test_isSelected_17000004 end');
    })


    /*
    * @tc.number: UitestComponentErrorTest_033
    * @tc.name: test_inputText_17000002
    * @tc.desc: inputText 17000002 test.
    */
    it('test_inputText_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_isSelected_17000002 start`);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await button.inputText('hello');
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_isSelected_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_isSelected_17000002 end`);
    })

    /*
    * @tc.number: UitestComponentErrorTest_034
    * @tc.name: test_inputText_17000004
    * @tc.desc: inputText 17000004 test.
    */
    it('test_inputText_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log(TestTag, 'test_isSelected_17000004 start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        await button.inputText('hello');
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_isSelected_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      console.log(TestTag, 'test_isSelected_17000004 end');
      done()
    })

    /*
    * @tc.number: UitestComponentErrorTest_036
    * @tc.name: test_clearText_17000002
    * @tc.desc: clearText 17000002 test.
    */
    it('test_clearText_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log(`${TestTag}, test_clearText_17000002 start`);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await button.clearText();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_clearText_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_clearText_17000002 end`);
      done()
    })

    /*
    * @tc.number: UitestComponentErrorTest_037
    * @tc.name: test_clearText_17000004
    * @tc.desc: clearText 17000004 test.
    */
    it('test_clearText_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log(TestTag, 'test_clearText_17000004 start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        await button.clearText();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_clearText_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      console.log(TestTag, 'test_clearText_17000004 end');
      done()
    })

    /*
    * @tc.number: UitestComponentErrorTest_045
    * @tc.name: test_dragTo_17000002
    * @tc.desc: dragTo 17000002 test.
    */
    it('test_dragTo_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_dragTo_17000002 start`);
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        let driver = Driver.create()
        await driver.delayMs(waitUiReadyMs)
        let button = await driver.findComponent(ON.id('jump'))
        if (button == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'))
          button = await scorll.scrollSearch(ON.text('jump'))
        }
        await button.longClick()
        await driver.delayMs(waitUiReadyMs)
        let text1 = await driver.findComponent(ON.text('one'));
        if (text1 == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'))
          text1 = await scorll.scrollSearch(ON.text('one'))
        }
        let text2 = await driver.findComponent(ON.text('two'))
        if (text2 == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'))
          text2 = await scorll.scrollSearch(ON.text('two'))
        }
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await text1.dragTo(text2)
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_dragTo_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_dragTo_17000002 end`);
    })

    /*
    * @tc.number: UitestComponentErrorTest_046
    * @tc.name: test_dragTo_17000004
    * @tc.desc: dragTo 17000004 test.
    */
    it('test_dragTo_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TestTag, 'test_dragTo_17000004 start');
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        let driver = Driver.create();
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.id('jump'));
        if (button == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'))
          button = await scorll.scrollSearch(ON.text('jump'))
        }
        await button.longClick();
        await driver.delayMs(waitUiReadyMs);
        let text1 = await driver.findComponent(ON.text('one'));
        if (text1 == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'));
          text1 = await scorll.scrollSearch(ON.text('one'));
        }
        let text2 = await driver.findComponent(ON.text('two'));
        if (text2 == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'));
          text2 = await scorll.scrollSearch(ON.text('two'));
        }
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        await text1.dragTo(text2)
        await driver.delayMs(waitUiReadyMs);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_dragTo_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      console.log(TestTag, 'test_dragTo_17000004 end');
    })

    /*
   * @tc.number: UitestComponentErrorTest_048
   * @tc.name: test_pinchOut_17000002
   * @tc.desc: pinchOut 17000002 test.
   */
    it('test_pinchOut_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_pinchOut_17000002 start`);
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        let driver = Driver.create();
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.id('jump'));
        if (button == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'));
          button = await scorll.scrollSearch(ON.id('jump'));
        }
        await button.click();
        await driver.delayMs(waitUiReadyMs);
        let image1 = await driver.findComponent(ON.id('test_pict'));
        if (image1 == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'));
          image1 = await scorll.scrollSearch(ON.id('test_pict'));
        }
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await image1.pinchOut(1.2);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_pinchOut_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_pinchOut_17000002 end`);
    })

    /*
   * @tc.number: UitestComponentErrorTest_049
   * @tc.name: test_pinchOut_17000004
   * @tc.desc: pinchOut 17000004 test.
   */
    it('test_pinchOut_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_pinchOut_17000004 start`);
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        let driver = Driver.create();
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.id('jump'));
        if (button == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'));
          button = await scorll.scrollSearch(ON.id('jump'));
        }
        await button.click();
        await driver.delayMs(waitUiReadyMs);
        let image1 = await driver.findComponent(ON.id('test_pict'));
        if (image1 == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'));
          image1 = await scorll.scrollSearch(ON.id('test_pict'));
        }
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        await image1.pinchOut(1.2);
        await driver.delayMs(waitUiReadyMs)
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_pinchOut_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      } finally {

      }
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, test_pinchOut_17000004 end`);
    })

    /*
   * @tc.number: UitestComponentErrorTest_051
   * @tc.name: test_pinchIn_17000002
   * @tc.desc: pinchIn 17000002 test.
   */
    it('test_pinchIn_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_pinchIn_17000002 start`);
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        let driver = Driver.create();
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.id('jump'));
        if (button == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'));
          button = await scorll.scrollSearch(ON.id('jump'));
        }
        await button.click();
        await driver.delayMs(waitUiReadyMs);
        let image1 = await driver.findComponent(ON.id('test_pict'));
        if (image1 == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'));
          image1 = await scorll.scrollSearch(ON.id('test_pict'));
        }
        driver.delayMs(waitUiReadyMs * 3)
        await sleep(100);
        await image1.pinchIn(0.5);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_pinchIn_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_pinchIn_17000002 end`);
    })

    /*
   * @tc.number: UitestComponentErrorTest_052
   * @tc.name: test_pinchOut_17000004
   * @tc.desc: pinchIn 17000004 test.
   */
    it('test_pinchIn_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_pinchIn_17000004 start`);
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        let driver = Driver.create();
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.id('jump'));
        if (button == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'));
          button = await scorll.scrollSearch(ON.id('jump'));
        }
        await button.click();
        await driver.delayMs(waitUiReadyMs);
        let image1 = await driver.findComponent(ON.id('test_pict'));
        if (image1 == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'));
          image1 = await scorll.scrollSearch(ON.id('test_pict'));
        }
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        await image1.pinchIn(0.5);
        await driver.delayMs(waitUiReadyMs)
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_pinchIn_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      } finally {

      }
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, test_pinchIn_17000004 end`);
    })

    /*
   * @tc.number: UitestComponentErrorTest_054
   * @tc.name: test_getDescription_17000002
   * @tc.desc: getDescription 17000002 test.
   */
    it('test_getDescription_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_getDescription_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.type('Button'));
        if (button == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'));
          button = await scorll.scrollSearch(ON.type('Button'));
        }
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await button.getDescription();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_getDescription_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_getDescription_17000002 end`);
    })

    /*
   * @tc.number: UitestComponentErrorTest_055
   * @tc.name: test_getDescription_17000004
   * @tc.desc: getDescription 17000004 test.
   */
    it('test_getDescription_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_getDescription_17000004 start`);
      try {
        let driver: Driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.type('Button'));
        if (button == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'));
          button = await scorll.scrollSearch(ON.type('Button'));
        }
        await driver.delayMs(waitUiReadyMs);
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        await button.getDescription();
        await driver.delayMs(waitUiReadyMs);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_getDescription_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      } finally {

      }
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, test_getDescription_17000004 end`);
    })

    /*
   * @tc.number: UitestComponentErrorTest_056
   * @tc.name: test_getHint_17000002
   * @tc.desc: getHint 17000002 test.
   */
    it('test_getHint_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_getHint_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.hint('welcome'));
        if (button == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'))
          button = await scorll.scrollSearch(ON.hint('welcome'))
        }
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await button.getHint();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_getHint_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_getHint_17000002 end`);
    })

    /*
   * @tc.number: UitestComponentErrorTest_057
   * @tc.name: test_getHint_17000004
   * @tc.desc: getHint 17000004 test.
   */
    it('test_getHint_17000004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_getHint_17000004 start`);
      try {
        let driver: Driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.hint('welcome'));
        if (button == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'))
          button = await scorll.scrollSearch(ON.hint('welcome'))
        }
        await driver.delayMs(waitUiReadyMs);
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        await button.getHint();
        await driver.delayMs(waitUiReadyMs);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_getHint_17000004 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, test_getHint_17000004 end`);
    })

  })
}