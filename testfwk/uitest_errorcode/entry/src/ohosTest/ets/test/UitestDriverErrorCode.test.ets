import { describe, it, expect, TestType, Level, Size } from '@ohos/hypium'
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const delegator : AbilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

const waitUiReadyMs : number = 1000;
const TestTag = 'UitestDriverErrorTest';
const AsyncErrorCode = 17000002;

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
//
function sleep(nm: number) {
  return new Promise<void>((resolve: Function, reject: Function) => {
    setTimeout(resolve, nm);
  })
}

export default function uitestDriverErrorTest() {
  describe('UitestDriverErrorTest', () => {

    /*
   * @tc.number: uitestDriverErrorTest_001
   * @tc.name: test_delayMs_17000002
   * @tc.desc: delayMs 17000002 test.
   */
    it('test_delayMs_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_delayMs_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.delayMs(waitUiReadyMs);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_delayMs_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_delayMs_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_003
   * @tc.name: test_findComponent_17000002
   * @tc.desc: findComponent 17000002 test.
   */
    it('test_findComponent_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_findComponent_17000002 start`);
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        let driver: Driver = Driver.create();
        let on  = ON.enabled(true);
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.findComponent(on);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_findComponent_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await stopApplication('com.uitestScene.acts');
      await sleep(waitUiReadyMs * 8);
      console.log(`${TestTag}, test_findComponent_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_005
   * @tc.name: test_findComponent_17000002
   * @tc.desc: findComponents 17000002 test.
   */
    it('test_findComponents_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_findComponents_17000002 start`);
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        let driver: Driver = Driver.create();
        let on  = ON.enabled(true);
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.findComponents(on);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_findComponents_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 8);
      await stopApplication('com.uitestScene.acts');
      console.log(`${TestTag}, test_findComponents_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_007
   * @tc.name: test_findWindow_17000002
   * @tc.desc: findWindow 17000002 test.
   */
    it('test_findWindow_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_findWindow_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.findWindow({bundleName:'com.uitestScene.acts'});
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_findWindow_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 8);
      console.log(`${TestTag}, test_findWindow_17000002 end`);
    })


    /*
   * @tc.number: uitestDriverErrorTest_009
   * @tc.name: test_waitForComponent_17000002
   * @tc.desc: waitForComponent 17000002 test.
   */
    it('test_waitForComponent_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_waitForComponent_17000002 start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      try {
        let driver: Driver = Driver.create();
        let on  = ON.enabled(true);
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.waitForComponent(on, waitUiReadyMs);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_waitForComponent_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 8)
      await stopApplication('com.uitestScene.acts');
      console.log(`${TestTag}, test_waitForComponent_17000002 end`);
    })

    /*
       * @tc.number: uitestDriverErrorTest_011
       * @tc.name: test_assertComponentExist_17000002
       * @tc.desc: assertComponentExist 17000002 test.
       */
    it('test_assertComponentExist_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_assertComponentExist_17000002 start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await sleep(waitUiReadyMs);
      try {
        let driver: Driver = Driver.create();
        let on  = ON.enabled(true);
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.assertComponentExist(on);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_assertComponentExist_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await stopApplication('com.uitestScene.acts');
      await sleep(waitUiReadyMs * 8);
      console.log(`${TestTag}, test_assertComponentExist_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_013
   * @tc.name: test_assertComponentExist_17000003
   * @tc.desc: assertComponentExist 17000003 test.
   */
    it('test_assertComponentExist_17000003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_assertComponentExist_17000003 start`);
      try {
        let driver: Driver = Driver.create();
        await driver.delayMs(waitUiReadyMs);
        await driver.assertComponentExist(ON.text('NotTest'));
        await driver.delayMs(waitUiReadyMs);
      }catch (e) {
        console.log(`${TestTag}, test_assertComponentExist_17000003 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(17000003);
      }
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, test_assertComponentExist_17000003 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_014
   * @tc.name: test_pressBack_17000002
   * @tc.desc: delayMs 17000002 test.
   */
    it('test_pressBack_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_pressBack_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.pressBack();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_pressBack_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 8);
      console.log(`${TestTag}, test_pressBack_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_015
   * @tc.name: test_triggerKey_17000002
   * @tc.desc: triggerKey 17000002 test.
   */
    it('test_triggerKey_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_triggerKey_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.triggerKey(2);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_triggerKey_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 8);
      console.log(`${TestTag}, test_triggerKey_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_017
   * @tc.name: test_triggerCombineKeys_17000002
   * @tc.desc: triggerCombineKeys 17000002 test.
   */
    it('test_triggerCombineKeys_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_triggerCombineKeys_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.triggerCombineKeys(2072, 2017);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_triggerCombineKeys_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 8);
      console.log(`${TestTag}, test_triggerCombineKeys_17000002 end`);
    })


    /*
   * @tc.number: uitestDriverErrorTest_019
   * @tc.name: test_driver_click_17000002
   * @tc.desc: click 17000002 test.
   */
    it('test_driver_click_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_click_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.click(100, 100);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_click_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 8);
      console.log(`${TestTag}, test_driver_click_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_021
   * @tc.name: test_driver_click_17000002
   * @tc.desc: doubleClick 17000002 test.
   */
    it('test_driver_doubleClick_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_doubleClick_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.doubleClick(100, 100);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_doubleClick_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 8);
      console.log(`${TestTag}, test_driver_doubleClick_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_023
   * @tc.name: test_driver_longClick_17000002
   * @tc.desc: longClick 17000002 test.
   */
    it('test_driver_longClick_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_longClick_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.longClick(100, 100);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_longClick_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 8);
      console.log(`${TestTag}, test_driver_longClick_17000002 end`);
    })


    /*
   * @tc.number: uitestDriverErrorTest_025
   * @tc.name: test_driver_swipe_17000002
   * @tc.desc: swipe 17000002 test.
   */
    it('test_driver_swipe_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_swipe_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.swipe(300, 600, 300, 100)
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_swipe_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 8);
      console.log(`${TestTag}, test_driver_swipe_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_027
   * @tc.name: test_driver_drag_17000002
   * @tc.desc: drag 17000002 test.
   */
    it('test_driver_drag_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_drag_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.drag(100,100,200,200,600);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_drag_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 8);
      console.log(`${TestTag}, test_driver_drag_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_029
   * @tc.name: test_driver_screenCap_17000002
   * @tc.desc: screenCap 17000002 test.
   */
    it('test_driver_screenCap_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_drag_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.screenCap('/data/storage/el2/base/cache/1.png');
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_screenCap_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 8);
      console.log(`${TestTag}, test_driver_screenCap_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_031
   * @tc.name: test_driver_setDisplayRotation_17000002
   * @tc.desc: setDisplayRotation 17000002 test.
   */
    it('test_driver_setDisplayRotation_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_setDisplayRotation_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.setDisplayRotation(DisplayRotation.ROTATION_180);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_setDisplayRotation_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_setDisplayRotation_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_033
   * @tc.name: test_driver_getDisplayRotation_17000002
   * @tc.desc: setDisplayRotation 17000002 test.
   */
    it('test_driver_getDisplayRotation_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_getDisplayRotation_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.getDisplayRotation();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_getDisplayRotation_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_getDisplayRotation_17000002 end`);
    })


    /*
   * @tc.number: uitestDriverErrorTest_034
   * @tc.name: test_driver_setDisplayRotationEnabled_17000002
   * @tc.desc: setDisplayRotationEnabled 17000002 test.
   */
    it('test_driver_setDisplayRotationEnabled_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_setDisplayRotationEnabled_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 4);
        await sleep(100);
        await driver.setDisplayRotationEnabled(false);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_setDisplayRotationEnabled_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_setDisplayRotationEnabled_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_036
   * @tc.name: test_driver_getDisplaySize_17000002
   * @tc.desc: getDisplaySize 17000002 test.
   */
    it('test_driver_getDisplaySize_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_getDisplaySize_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.getDisplaySize();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_getDisplaySize_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_getDisplaySize_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_037
   * @tc.name: test_driver_getDisplayDensity_17000002
   * @tc.desc: getDisplaySize 17000002 test.
   */
    it('test_driver_getDisplayDensity_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_getDisplayDensity_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.getDisplayDensity();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_getDisplayDensity_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_getDisplayDensity_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_038
   * @tc.name: test_driver_wakeUpDisplay_17000002
   * @tc.desc: wakeUpDisplay 17000002 test.
   */
    it('test_driver_wakeUpDisplay_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_wakeUpDisplay_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.wakeUpDisplay();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_wakeUpDisplay_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_wakeUpDisplay_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_039
   * @tc.name: test_driver_pressHome_17000002
   * @tc.desc: pressHome 17000002 test.
   */
    it('test_driver_pressHome_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_pressHome_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.pressHome();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_pressHome_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_pressHome_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_040
   * @tc.name: test_driver_waitForIdle_17000002
   * @tc.desc: waitForIdle 17000002 test.
   */
    it('test_driver_waitForIdle_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_waitForIdle_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.waitForIdle(4000,5000)
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_waitForIdle_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_waitForIdle_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_042
   * @tc.name: test_driver_fling_17000002
   * @tc.desc: fling 17000002 test.
   */
    it('test_driver_fling_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_fling_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.fling({x: 500, y: 480},{x: 450, y: 480},5,600);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_fling_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_fling_17000002 end`);
    })


    /*
   * @tc.number: uitestDriverErrorTest_044
   * @tc.name: test_driver_injectMultiPointerAction_17000002
   * @tc.desc: injectMultiPointerAction 17000002 test.
   */
    it('test_driver_injectMultiPointerAction_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_injectMultiPointerAction_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        let pointers: PointerMatrix = PointerMatrix.create(2,5);
        pointers.setPoint(0,0,{x:250,y:480});
        pointers.setPoint(0,1,{x:250,y:440});
        pointers.setPoint(0,2,{x:250,y:400});
        pointers.setPoint(0,3,{x:250,y:360});
        pointers.setPoint(0,4,{x:250,y:320});
        pointers.setPoint(1,0,{x:250,y:480});
        pointers.setPoint(1,1,{x:250,y:440});
        pointers.setPoint(1,2,{x:250,y:400});
        pointers.setPoint(1,3,{x:250,y:360});
        pointers.setPoint(1,4,{x:250,y:320});
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.injectMultiPointerAction(pointers);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_injectMultiPointerAction_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_injectMultiPointerAction_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_046
   * @tc.name: test_driver_fling_U_17000002
   * @tc.desc: fling 17000002 test.
   */
    it('test_driver_fling_U_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_fling_U_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.fling(UiDirection.DOWN, 10000);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_fling_U_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_fling_U_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_048
   * @tc.name: test_driver_screenCapture_17000002
   * @tc.desc: screenCapture 17000002 test.
   */
    it('test_driver_screenCapture_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_screenCapture_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.screenCapture('/data/storage/el2/base/cache/1.png', {left: 0, top: 0, right: 100, bottom: 100});
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_screenCapture_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_screenCapture_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_050
   * @tc.name: test_driver_mouseClick_17000002
   * @tc.desc: mouseClick 17000002 test.
   */
    it('test_driver_mouseClick_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_mouseClick_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.mouseClick({x:248, y:194}, MouseButton.MOUSE_BUTTON_LEFT, 2072);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_mouseClick_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_mouseClick_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_052
   * @tc.name: test_driver_mouseScroll_17000002
   * @tc.desc: mouseScroll 17000002 test.
   */
    it('test_driver_mouseScroll_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_mouseScroll_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.mouseScroll({x:360, y:640}, true, 30, 2072);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_mouseScroll_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_mouseScroll_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_054
   * @tc.name: test_driver_mouseMoveTo_17000002
   * @tc.desc: mouseMoveTo 17000002 test.
   */
    it('test_driver_mouseMoveTo_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_mouseMoveTo_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.mouseMoveTo({x:100, y:100});
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_mouseMoveTo_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_mouseMoveTo_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_056
   * @tc.name: test_driver_createUIEventObserver_17000002
   * @tc.desc: createUIEventObserver 17000002 test.
   */
    it('test_driver_createUIEventObserver_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_createUIEventObserver_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.createUIEventObserver();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_createUIEventObserver_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_createUIEventObserver_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_057
   * @tc.name: test_driver_mouseScroll_11_17000002
   * @tc.desc: mouseScroll 17000002 test.
   */
    it('test_driver_mouseScroll_11_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_mouseScroll_11_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.mouseScroll({x:360, y:640}, true, 30, 2072,20);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_mouseScroll_11_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_mouseScroll_11_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_059
   * @tc.name: test_driver_mouseDoubleClick_11_17000002
   * @tc.desc: mouseDoubleClick 17000002 test.
    */
    it('test_driver_mouseDoubleClick_11_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_mouseDoubleClick_11_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.mouseDoubleClick({x:248, y:194}, MouseButton.MOUSE_BUTTON_LEFT, 2072);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_mouseDoubleClick_11_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_mouseDoubleClick_11_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_061
   * @tc.name: test_driver_mouseLongClick_11_17000002
   * @tc.desc: mouseLongClick 17000002 test.
   */
    it('test_driver_mouseLongClick_11_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_mouseLongClick_11_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.mouseLongClick({x:248, y:194}, MouseButton.MOUSE_BUTTON_LEFT, 2072);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_mouseLongClick_11_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_mouseLongClick_11_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_063
   * @tc.name: test_driver_mouseMoveWithTrack_11_17000002
   * @tc.desc: mouseMoveWithTrack 17000002 test.
   */
    it('test_driver_mouseMoveWithTrack_11_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_mouseMoveWithTrack_11_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.mouseMoveWithTrack({x:100, y:100},{x:200, y:200},600);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_mouseMoveWithTrack_11_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_mouseMoveWithTrack_11_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_065
   * @tc.name: test_driver_mouseDrag_11_17000002
   * @tc.desc: mouseDrag 17000002 test.
   */
    it('test_driver_mouseDrag_11_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_mouseDrag_11_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.mouseDrag({x:100, y:100}, {x:200, y:200}, 600);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_mouseDrag_11_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_mouseDrag_11_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_067
   * @tc.name: test_driver_inputText_11_17000002
   * @tc.desc: inputText 17000002 test.
   */
    it('test_driver_inputText_11_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_inputText_11_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.inputText({x: 100, y: 100}, '123');
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_inputText_11_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_inputText_11_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_069
   * @tc.name: test_driver_touchPadMultiFingerSwipe_17000002
   * @tc.desc: touchPadMultiFingerSwipe 17000002 test.
   */
    it('test_driver_touchPadMultiFingerSwipe_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_touchPadMultiFingerSwipe_17000002 start`);
      try {
        let driver:Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.touchPadMultiFingerSwipe(3, UiDirection.UP);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_touchPadMultiFingerSwipe_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_touchPadMultiFingerSwipe_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_071
   * @tc.name: test_driver_penClick_17000002
   * @tc.desc: penClick 17000002 test.
   */
    it('test_driver_penClick_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_penClick_17000002 start`);
      try {
        let driver:Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.penClick({x: 100, y: 100});
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_penClick_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_penClick_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_073
   * @tc.name: test_driver_penLongClick_17000002
   * @tc.desc: penLongClick 17000002 test.
   */
    it('test_driver_penLongClick_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_penLongClick_17000002 start`);
      try {
        let driver:Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.penLongClick({x: 100, y: 100}, 0.5);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_penLongClick_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_penLongClick_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_075
   * @tc.name: test_driver_penDoubleClick_401
   * @tc.desc: penDoubleClick 17000002 test.
   */
    it('test_driver_penDoubleClick_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_penDoubleClick_17000002 start`);
      try {
        let driver:Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.penDoubleClick({x: 100, y: 100});
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_penDoubleClick_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_penDoubleClick_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_077
   * @tc.name: test_driver_penSwipe_17000002
   * @tc.desc: penSwipe 17000002 test.
   */
    it('test_driver_penSwipe_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_penSwipe_17000002 start`);
      try {
        let driver:Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.penSwipe({x: 100, y: 100}, {x: 100, y: 500}, 600, 0.5);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_penSwipe_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_penSwipe_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_079
   * @tc.name: test_driver_injectPenPointerAction_17000002
   * @tc.desc: injectPenPointerAction 17000002 test.
   */
    it('test_driver_injectPenPointerAction_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_injectPenPointerAction_17000002 start`);
      try {
        let driver:Driver = Driver.create();
        let pointer = PointerMatrix.create(1,8);
        for (let step = 0; step < 8; step++) {
          pointer.setPoint(0, step, {x: 500, y: 1100 - 100 *step});
        }
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.injectPenPointerAction(pointer, 600, 0.5);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_injectPenPointerAction_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_injectPenPointerAction_17000002 end`);
    })

    /*
       * @tc.number: uitestDriverErrorTest_080
       * @tc.name: test_UiDriver_assertComponentExist_17000002
       * @tc.desc: assertComponentExist 17000002 test.
       */
    it('test_UiDriver_assertComponentExist_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiDriver_assertComponentExist_17000002 start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await sleep(waitUiReadyMs);
      try {
        let driver = UiDriver.create();
        let by = BY.enabled(true);
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.assertComponentExist(by);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_UiDriver_assertComponentExist_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await stopApplication('com.uitestScene.acts');
      await sleep(waitUiReadyMs * 8);
      console.log(`${TestTag}, test_UiDriver_assertComponentExist_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_081
   * @tc.name: test_UiDriver_assertComponentExist_17000003
   * @tc.desc: assertComponentExist 17000003 test.
   */
    it('test_UiDriver_assertComponentExist_17000003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiDriver_assertComponentExist_17000003 start`);
      try {
        let driver = UiDriver.create();
        await driver.delayMs(waitUiReadyMs);
        await driver.assertComponentExist(BY.text('NotTest'));
        await driver.delayMs(waitUiReadyMs);
      }catch (e) {
        console.log(`${TestTag}, test_UiDriver_assertComponentExist_17000003 error is: ${JSON.stringify(e)}`);
        expect(e.code == 17000003 || e.code == 4).assertTrue();
      }
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, test_UiDriver_assertComponentExist_17000003 end`);
    })
  })
}