import { describe, it, expect, TestType, Level, Size } from '@ohos/hypium'
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver, InputTextMode } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const delegator : AbilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

const waitUiReadyMs : number = 1000;
const TestTag = 'UitestDriverErrorTest';
const AsyncErrorCode = 17000002;
const ParameterErrorCode = 17000007;
const CapabilityCode = 801;
const ErrorCode = 401;

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
   * @tc.number: uitestDriverErrorTest_002
   * @tc.name: test_findComponent_17000002
   * @tc.desc: findComponent 17000002 test.
   */
    it('test_findComponent_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_findComponent_17000002 start`);
      try {
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
      await sleep(waitUiReadyMs * 8);
      console.log(`${TestTag}, test_findComponent_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_003
   * @tc.name: test_findComponent_17000002
   * @tc.desc: findComponents 17000002 test.
   */
    it('test_findComponents_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_findComponents_17000002 start`);
      try {
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
      console.log(`${TestTag}, test_findComponents_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_004
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
   * @tc.number: uitestDriverErrorTest_005
   * @tc.name: test_waitForComponent_17000002
   * @tc.desc: waitForComponent 17000002 test.
   */
    it('test_waitForComponent_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_waitForComponent_17000002 start`);
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
      console.log(`${TestTag}, test_waitForComponent_17000002 end`);
    })

    /*
       * @tc.number: uitestDriverErrorTest_006
       * @tc.name: test_assertComponentExist_17000002
       * @tc.desc: assertComponentExist 17000002 test.
       */
    it('test_assertComponentExist_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_assertComponentExist_17000002 start`);
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
      await sleep(waitUiReadyMs * 8);
      console.log(`${TestTag}, test_assertComponentExist_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_007
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
   * @tc.number: uitestDriverErrorTest_008
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
   * @tc.number: uitestDriverErrorTest_009
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
   * @tc.number: uitestDriverErrorTest_010
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
   * @tc.number: uitestDriverErrorTest_011
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
   * @tc.number: uitestDriverErrorTest_012
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
   * @tc.number: uitestDriverErrorTest_013
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
   * @tc.number: uitestDriverErrorTest_014
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
   * @tc.number: uitestDriverErrorTest_015
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
   * @tc.number: uitestDriverErrorTest_016
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
   * @tc.number: uitestDriverErrorTest_017
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
   * @tc.number: uitestDriverErrorTest_018
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
   * @tc.number: uitestDriverErrorTest_019
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
   * @tc.number: uitestDriverErrorTest_020
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
   * @tc.number: uitestDriverErrorTest_021
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
   * @tc.number: uitestDriverErrorTest_022
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
   * @tc.number: uitestDriverErrorTest_023
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
   * @tc.number: uitestDriverErrorTest_024
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
   * @tc.number: uitestDriverErrorTest_025
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
   * @tc.number: uitestDriverErrorTest_026
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
   * @tc.number: uitestDriverErrorTest_027
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
   * @tc.number: uitestDriverErrorTest_028
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
   * @tc.number: uitestDriverErrorTest_029
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
   * @tc.number: uitestDriverErrorTest_030
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
   * @tc.number: uitestDriverErrorTest_031
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
   * @tc.number: uitestDriverErrorTest_032
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
   * @tc.number: uitestDriverErrorTest_033
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
   * @tc.number: uitestDriverErrorTest_034
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
   * @tc.number: uitestDriverErrorTest_035
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
   * @tc.number: uitestDriverErrorTest_036
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
   * @tc.number: uitestDriverErrorTest_037
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
   * @tc.number: uitestDriverErrorTest_038
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
   * @tc.number: uitestDriverErrorTest_039
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
   * @tc.number: uitestDriverErrorTest_040
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
   * @tc.number: uitestDriverErrorTest_041
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
   * @tc.number: uitestDriverErrorTest_042
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
   * @tc.number: uitestDriverErrorTest_043
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
   * @tc.number: uitestDriverErrorTest_044
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
       * @tc.number: uitestDriverErrorTest_045
       * @tc.name: test_UiDriver_assertComponentExist_17000002
       * @tc.desc: assertComponentExist 17000002 test.
       */
    it('test_UiDriver_assertComponentExist_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiDriver_assertComponentExist_17000002 start`);
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
      await sleep(waitUiReadyMs * 8);
      console.log(`${TestTag}, test_UiDriver_assertComponentExist_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_046
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

    /*
     * @tc.number: uitestDriverErrorTest_047
     * @tc.name: test_driver_dragBetween_17000002
     * @tc.desc: dragBetween 17000002 test.
     */
    it('test_driver_dragBetween_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_dragBetween_17000002 start`);
      try {
        let driver:Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.dragBetween({x: 100, y: 200}, {x:200, y: 200}, 1500);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_dragBetween_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_dragBetween_17000002 end`);
    })

    /*
    * @tc.number: uitestDriverErrorTest_048
    * @tc.name: test_driver_dragBetween_17000007
    * @tc.desc: dragBetween 17000007 test.
    */
    it('test_driver_dragBetween_17000007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_dragBetween_17000007 start`);
      let driver:Driver = Driver.create();
      try {
        await driver.dragBetween(null, {x:200, y: 200}, 1500);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag} test_driver_dragBetween_17000007, from=null error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.dragBetween(undefined, {x:200, y: 200});
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag} test_driver_dragBetween_17000007, from=undefined error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.dragBetween({x: 100, y: 100}, null);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag} test_driver_dragBetween_17000007, to to=null error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.dragBetween({x: 100, y: 100}, undefined);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag} test_driver_dragBetween_17000007, to=undefined error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.dragBetween({x: -1, y: 100}, {x: 200, y: 200});
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag} test_driver_dragBetween_17000007, from.x = -1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.dragBetween({x: 100, y: -1}, {x: 200, y: 200});
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag} test_driver_dragBetween_17000007, from.y = -1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.dragBetween({x: 100, y: 100}, {x: -1, y: 200});
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag} test_driver_dragBetween_17000007, to.x = -1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.dragBetween({x: 100, y: 100}, {x: 100, y: -1});
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag} test_driver_dragBetween_17000007, to.y = -1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.dragBetween({x: 100, y: 100}, {x: 100, y: 100}, 600, 1499);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag} test_driver_dragBetween_17000007, duration = 1499 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, test_driver_dragBetween_17000007 end`);
    })

    /*
     * @tc.number: uitestDriverErrorTest_049
     * @tc.name: test_driver_mouseLongClick_duration_17000002
     * @tc.desc: mouseLongClick 17000002 test.
     */
    it('test_driver_mouseLongClick_duration_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_mouseLongClick_duration_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.mouseLongClick({x:248, y:194}, MouseButton.MOUSE_BUTTON_LEFT, 2072, 2073, 600);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_mouseLongClick_duration_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_mouseLongClick_duration_17000002 end`);
    })

    /*
     * @tc.number: uitestDriverErrorTest_050
     * @tc.name: test_driver_mouseLongClick_duration_401
     * @tc.desc: mouseLongClick 401 test.
     */
    it('test_driver_mouseLongClick_duration_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_mouseLongClick_duration_401 start`);
      let driver: Driver = Driver.create();
      try {
        await driver.mouseLongClick({x: -1, y: 100}, MouseButton.MOUSE_BUTTON_LEFT, 2072, 2073, 1800);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_mouseLongClick_duration_401 p.x=-1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseLongClick({x: 100, y: -1}, MouseButton.MOUSE_BUTTON_LEFT, 2072, 2073, 1800);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_mouseLongClick_duration_401 p.y=-1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseLongClick({x: 100, y: 100}, MouseButton.MOUSE_BUTTON_LEFT, 2072, 2073, 1499);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_mouseLongClick_duration_401 duration=1499 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, test_driver_mouseLongClick_duration_401 end`);
    })

    /*
     * @tc.number: uitestDriverErrorTest_051
     * @tc.name: test_driver_inputTextMode_17000002
     * @tc.desc: mouseLongClick 17000002 test.
     */
    it('test_driver_inputTextMode_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_inputTextMode_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.inputText({x:248, y:194}, '123456', {
          paste:false
        });
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_inputTextMode_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_inputTextMode_17000002 end`);
    })

    /*
     * @tc.number: uitestDriverErrorTest_052
     * @tc.name: test_driver_inputTextMode_401
     * @tc.desc: mouseLongClick inputText test.
     */
    it('test_driver_inputTextMode_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_inputTextMode_401 start`);
      let driver: Driver = Driver.create();
      try {
        await driver.inputText({x:-1, y:100}, '123456', {
          paste: false
        });
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_inputTextMode_401 p.x=-1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ErrorCode);
      }
      try {
        await driver.inputText({x:100, y:-1}, '123456', {
          paste: false
        });
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_inputTextMode_401 p.y=-1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_inputTextMode_401 end`);
    })

    /*
     * @tc.number: uitestDriverErrorTest_053
     * @tc.name: test_driver_inputTextMode_801
     * @tc.desc: mouseLongClick inputText test.
     */
    it('test_driver_inputTextMode_801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_inputTextMode_801 start`);
      let driver: Driver = Driver.create();
      try {
        await driver.inputText({x:100, y:100}, '123456', {
          paste: false
        });
      }catch (e) {
        console.log(`${TestTag}, test_driver_inputTextMode_801 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(CapabilityCode);
      }
      console.log(`${TestTag}, test_driver_inputTextMode_801 end`);
    })

    /*
     * @tc.number: uitestDriverErrorTest_054
     * @tc.name: test_driver_crownRotate_17000002
     * @tc.desc: crownRotate 17000002 test.
     */
    it('test_driver_crownRotate_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_crownRotate_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.crownRotate(100, 100);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_crownRotate_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_crownRotate_17000002 end`);
    })

    /*
     * @tc.number: uitestDriverErrorTest_055
     * @tc.name: test_driver_crownRotate_17000007
     * @tc.desc: crownRotate 17000007 test.
     */
    it('test_driver_crownRotate_17000007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_crownRotate_17000007 start`);
      try {
        let driver: Driver = Driver.create();
        await driver.crownRotate(null, 100);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_crownRotate_17000007 d=null error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        let driver: Driver = Driver.create();
        await driver.crownRotate(undefined, 100);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_crownRotate_17000007 d=undefined error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, test_driver_crownRotate_17000007 end`);
    })


    /*
     * @tc.number: uitestDriverErrorTest_056
     * @tc.name: test_driver_crownRotate_801
     * @tc.desc: crownRotate 801 test.
     */
    it('test_driver_crownRotate_801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_crownRotate_801 start`);
      try {
        let driver: Driver = Driver.create();
        await driver.crownRotate(10, 100);
      }catch (e) {
        console.log(`${TestTag}, test_driver_crownRotate_801 d=null error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(CapabilityCode);
      }
      console.log(`${TestTag}, test_driver_crownRotate_801 end`);
    })
    /*
     * @tc.number: uitestDriverErrorTest_057
     * @tc.name: test_driver_longClickAt_17000002
     * @tc.desc: longClickAt 17000002 test.
     */
    it('test_driver_longClickAt_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_longClickAt_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.longClickAt({x: 100, y: 100}, 1500);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_longClickAt_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_longClickAt_17000002 end`);
    })

    /*
     * @tc.number: uitestDriverErrorTest_058
     * @tc.name: test_driver_longClickAt_17000007
     * @tc.desc: longClickAt 17000002 test.
     */
    it('test_driver_longClickAt_17000007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_longClickAt_17000007 start`);
      let driver: Driver = Driver.create();
      try {
        await driver.longClickAt(null);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_longClickAt_17000007 null error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.longClickAt(undefined);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_longClickAt_17000007 undefined error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.longClickAt(null, 1500);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_longClickAt_17000007 point = null error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.longClickAt(undefined, 1500);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_longClickAt_17000007 point = undefined error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.longClickAt({x: -1, y: 100}, 1500);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_longClickAt_17000007 point.x = -1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.longClickAt({x: 100, y: -1}, 1500);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_longClickAt_17000007 point.y = -1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.longClickAt({x: 10000, y: 100}, 1500);
      }catch (e) {
        console.log(`${TestTag}, test_driver_longClickAt_17000007 point.X = 10000 error is: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      try {
        await driver.longClickAt({x: 100, y: 10000}, 1500);
      }catch (e) {
        console.log(`${TestTag}, test_driver_longClickAt_17000007 point.y = 10000 error is: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      try {
        await driver.longClickAt({x: 100, y: 100}, 1499);
      }catch (e) {
        console.log(`${TestTag}, test_driver_longClickAt_17000007 duration = 1499 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, test_driver_longClickAt_17000007 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_059
   * @tc.name: test_driver_mouseDrag_22_17000002
   * @tc.desc: mouseDrag 17000002 test.
   */
    it('test_driver_mouseDrag_22_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_mouseDrag_22_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.mouseDrag({x:100, y:100}, {x:200, y:200}, 600, 1500);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_mouseDrag_22_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_mouseDrag_22_17000002 end`);
    })

    /*
   * @tc.number: uitestDriverErrorTest_060
   * @tc.name: test_driver_mouseDrag_22_401
   * @tc.desc: mouseDrag 401 test.
   */
    it('test_driver_mouseDrag_22_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_mouseDrag_22_401 start`);
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      try {
        await driver.mouseDrag({x:-1, y:100}, {x:200, y:200}, 600, 1800);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_mouseDrag_22_401 from.x=-1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseDrag({x:100, y:-1}, {x:200, y:200}, 600, 1800);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_mouseDrag_22_401 from.y=-1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseDrag({x:100, y:100}, {x:-1, y:200}, 600, 1800);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_mouseDrag_22_401 to.x=-1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseDrag({x:100, y:100}, {x:100, y:-1}, 600, 1800);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_mouseDrag_22_401 to.y=-1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseDrag({x:100, y:100}, {x:200, y:200}, 600, 1400);
        console.log(`${TestTag}, test_driver_mouseDrag_22_401 duration=1400 successful`);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_mouseDrag_22_401 duration=1400 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, test_driver_mouseDrag_22_401 end`);
    })

    /*
     * @tc.number: uitestDriverErrorTest_061
     * @tc.name: test_driver_pressBackWithId_17000002
     * @tc.desc: mouseDrag 17000002 test.
     */
    it("test_driver_pressBackWithId_17000002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_pressBackWithId_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.pressBack(0);
        expect().assertFail();
      } catch (e) {
        console.log(`${TestTag}, test_driver_pressBackWithId_17000002 error is, ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_pressBackWithId_17000002 end`);
    })

    /*
     * @tc.number: uitestDriverErrorTest_062
     * @tc.name: test_driver_pressBackWithId_17000007
     * @tc.desc: mouseDrag 17000007 test.
     */
    it("test_driver_pressBackWithId_17000007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_pressBackWithId_17000007 start`);
      try {
        let driver: Driver = Driver.create();
        await driver.pressBack(-1);
        expect().assertFail();
      } catch (e) {
        console.log(`${TestTag}, test_driver_pressBackWithId_17000007 error is, ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, test_driver_pressBackWithId_17000007 end`);
    })

    /*
     * @tc.number: uitestDriverErrorTest_063
     * @tc.name: test_driver_triggerKeyWithId_17000002
     * @tc.desc: mouseDrag 17000002 test.
     */
    it("test_driver_triggerKeyWithId_17000002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_triggerKeyWithId_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.triggerKey(2, 0);
        expect().assertFail();
      } catch (e) {
        console.log(`${TestTag}, test_driver_triggerKeyWithId_17000002 error is, ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_triggerKeyWithId_17000002 end`);
    })

    /*
     * @tc.number: uitestDriverErrorTest_064
     * @tc.name: test_driver_triggerCombineKeysWithId_17000002
     * @tc.desc: triggerCombineKeys 17000002 test.
     */
    it("test_driver_triggerCombineKeysWithId_17000002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_triggerCombineKeysWithId_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.triggerCombineKeys(2, 2072, 2017, 0);
        expect().assertFail();
      } catch (e) {
        console.log(`${TestTag}, test_driver_triggerCombineKeysWithId_17000002 error is, ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_triggerCombineKeysWithId_17000002 end`);
    })

    /*
     * @tc.number: uitestDriverErrorTest_065
     * @tc.name: test_driver_screenCapWithId_17000002
     * @tc.desc: screenCap 17000002 test.
     */
    it("test_driver_screenCapWithId_17000002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_screenCapWithId_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.screenCap('/data/storage/el2/base/cache/1.png', 0);
        expect().assertFail();
      } catch (e) {
        console.log(`${TestTag}, test_driver_screenCapWithId_17000002 error is, ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_screenCapWithId_17000002 end`);
    })

    /*
     * @tc.number: uitestDriverErrorTest_066
     * @tc.name: test_driver_getDisplayRotationWithId_17000002
     * @tc.desc: getDisplayRotation 17000002 test.
     */
    it("test_driver_getDisplayRotationWithId_17000002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_getDisplayRotationWithId_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.getDisplayRotation(0);
        expect().assertFail();
      } catch (e) {
        console.log(`${TestTag}, test_driver_getDisplayRotationWithId_17000002 error is, ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_getDisplayRotationWithId_17000002 end`);
    })

    /*
     * @tc.number: uitestDriverErrorTest_067
     * @tc.name: test_driver_getDisplayRotationWithId_17000007
     * @tc.desc: getDisplayRotation 17000007 test.
     */
    it("test_driver_getDisplayRotationWithId_17000007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_getDisplayRotationWithId_17000007 start`);
      try {
        let driver: Driver = Driver.create();
        await driver.getDisplayRotation(-1);
        expect().assertFail();
      } catch (e) {
        console.log(`${TestTag}, test_driver_getDisplayRotationWithId_17000007 error is, ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, test_driver_getDisplayRotationWithId_17000007 end`);
    })

    /*
     * @tc.number: uitestDriverErrorTest_068
     * @tc.name: test_driver_getDisplaySizeWithId_17000002
     * @tc.desc: getDisplaySize 17000002 test.
     */
    it("test_driver_getDisplaySizeWithId_17000002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_getDisplaySizeWithId_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.getDisplaySize(0);
        expect().assertFail();
      } catch (e) {
        console.log(`${TestTag}, test_driver_getDisplaySizeWithId_17000002 error is, ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_getDisplaySizeWithId_17000002 end`);
    })

    /*
     * @tc.number: uitestDriverErrorTest_069
     * @tc.name: test_driver_getDisplaySizeWithId_17000007
     * @tc.desc: getDisplayRotation 17000007 test.
     */
    it("test_driver_getDisplaySizeWithId_17000007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_getDisplaySizeWithId_17000007 start`);
      try {
        let driver: Driver = Driver.create();
        await driver.getDisplaySize(-1);
        expect().assertFail();
      } catch (e) {
        console.log(`${TestTag}, test_driver_getDisplaySizeWithId_17000007 error is, ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, test_driver_getDisplaySizeWithId_17000007 end`);
    })

    /*
     * @tc.number: uitestDriverErrorTest_070
     * @tc.name: test_driver_getDisplayDensityWithId_17000002
     * @tc.desc: getDisplayDensity 17000002 test.
     */
    it("test_driver_getDisplayDensityWithId_17000002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_getDisplayDensityWithId_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.getDisplayDensity(0);
        expect().assertFail();
      } catch (e) {
        console.log(`${TestTag}, test_driver_getDisplayDensityWithId_17000002 error is, ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_getDisplayDensityWithId_17000002 end`);
    })

    /*
     * @tc.number: uitestDriverErrorTest_071
     * @tc.name: test_driver_getDisplayDensityWithId_17000007
     * @tc.desc: getDisplayDensity 17000007 test.
     */
    it("test_driver_getDisplayDensityWithId_17000007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_getDisplayDensityWithId_17000007 start`);
      try {
        let driver: Driver = Driver.create();
        await driver.getDisplayDensity(-1);
        expect().assertFail();
      } catch (e) {
        console.log(`${TestTag}, test_driver_getDisplayDensityWithId_17000007 error is, ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, test_driver_getDisplayDensityWithId_17000007 end`);
    })

    /*
     * @tc.number: uitestDriverErrorTest_072
     * @tc.name: test_driver_pressHomeWithId_17000002
     * @tc.desc: pressHome 17000002 test.
     */
    it("test_driver_pressHomeWithId_17000002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_pressHomeWithId_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.pressHome(0);
        expect().assertFail();
      } catch (e) {
        console.log(`${TestTag}, test_driver_pressHomeWithId_17000002 error is, ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_pressHomeWithId_17000002 end`);
    })

    /*
     * @tc.number: uitestDriverErrorTest_073
     * @tc.name: test_driver_pressHomeWithId_17000007
     * @tc.desc: pressHome 17000007 test.
     */
    it("test_driver_pressHomeWithId_17000007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_pressHomeWithId_17000007 start`);
      try {
        let driver: Driver = Driver.create();
        await driver.pressHome(-1);
        expect().assertFail();
      } catch (e) {
        console.log(`${TestTag}, test_driver_pressHomeWithId_17000007 error is, ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, test_driver_pressHomeWithId_17000007 end`);
    })

    /*
     * @tc.number: uitestDriverErrorTest_074
     * @tc.name: test_driver_ClickAt_17000002
     * @tc.desc: ClickAt 17000002 test.
     */
    it('test_driver_ClickAt_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_ClickAt_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.clickAt({x: 100, y: 100});
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_ClickAt_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_ClickAt_17000002 end`);
    })

    /*
     * @tc.number: uitestDriverErrorTest_075
     * @tc.name: test_driver_ClickAt_17000007
     * @tc.desc: ClickAt 17000007 test.
     */
    it('test_driver_ClickAt_17000007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_ClickAt_17000007 start`);
      let driver: Driver = Driver.create();
      try {
        await driver.clickAt(null);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_ClickAt_17000007 null error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.clickAt(undefined);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_ClickAt_17000007 undefined error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.clickAt({x: -1, y:100});
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_ClickAt_17000007 point.x=-1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.clickAt({x: 100, y:-1});
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_ClickAt_17000007 point.y = -1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.clickAt({x: 100, y: 100, displayId: -1});
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_longClickAt_17000007 point.displayId = -1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, test_driver_longClickAt_17000007 end`);
    })

    /*
     * @tc.number: uitestDriverErrorTest_076
     * @tc.name: test_driver_flingWithId_17000002
     * @tc.desc: fling 17000002 test.
     */
    it("test_driver_flingWithId_17000002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_flingWithId_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.fling(UiDirection.DOWN, 10000, 0);
        expect().assertFail();
      } catch (e) {
        console.log(`${TestTag}, test_driver_flingWithId_17000002 error is, ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_flingWithId_17000002 end`);
    })

    /*
     * @tc.number: uitestDriverErrorTest_079
     * @tc.name: test_driver_DoubleClickAt_17000002
     * @tc.desc: doubleClickAt 17000002 test.
     */
    it('test_driver_DoubleClickAt_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_DoubleClickAt_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.doubleClickAt({x: 100, y: 100});
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_DoubleClickAt_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_DoubleClickAt_17000002 end`);
    })

    /*
     * @tc.number: uitestDriverErrorTest_080
     * @tc.name: test_driver_DoubleClickAt_17000007
     * @tc.desc: doubleClickAt 17000007 test.
     */
    it('test_driver_DoubleClickAt_17000007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_DoubleClickAt_17000007 start`);
      let driver: Driver = Driver.create();
      try {
        await driver.doubleClickAt(null);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_DoubleClickAt_17000007 null error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.doubleClickAt(undefined);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_DoubleClickAt_17000007 undefined error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.doubleClickAt({x: -1, y:100});
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_DoubleClickAt_17000007 point.x=-1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.doubleClickAt({x: 100, y:-1});
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_DoubleClickAt_17000007 point.y = -1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.doubleClickAt({x: 100, y: 100, displayId: -1});
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_DoubleClickAt_17000007 point.displayId = -1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, test_driver_DoubleClickAt_17000007 end`);
    })


    /*
     * @tc.number: uitestDriverErrorTest_081
     * @tc.name: test_driver_swipeBetween_17000002
     * @tc.desc: swipeBetween 17000002 test.
     */
    it('test_driver_swipeBetween_17000002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_swipeBetween_17000002 start`);
      try {
        let driver: Driver = Driver.create();
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.swipeBetween({x: 100, y: 100}, {x: 100, y: 100});
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_swipeBetween_17000002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 5);
      console.log(`${TestTag}, test_driver_swipeBetween_17000002 end`);
    })

    /*
     * @tc.number: uitestDriverErrorTest_082
     * @tc.name: test_driver_swipeBetween_17000007
     * @tc.desc: swipeBetween 17000007 test.
     */
    it('test_driver_swipeBetween_17000007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_swipeBetween_17000007 start`);
      let driver: Driver = Driver.create();
      try {
        await driver.swipeBetween(null,{x: 100, y: 100});
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_swipeBetween_17000007 from = null error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.swipeBetween(undefined, {x: 100, y: 100});
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_swipeBetween_17000007 from = undefined error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.swipeBetween({x: -1, y:100}, {x: 100, y: 100});
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_swipeBetween_17000007 from.x=-1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.swipeBetween({x: 100, y:-1}, {x: 100, y: 100});
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_swipeBetween_17000007 from.y=-1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.swipeBetween({x: 100, y:100, displayId: -1}, {x: 100, y: 100});
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_swipeBetween_17000007 from.displayId=-1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.swipeBetween({x: 100, y:100}, null);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_swipeBetween_17000007 to=null error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.swipeBetween({x: 100, y:100}, undefined);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_swipeBetween_17000007 to=undefined error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.swipeBetween({x: 100, y:100}, {x:-1, y: 100});
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_swipeBetween_17000007 to.x=-1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.swipeBetween({x: 100, y:100}, {x:100, y: -1});
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_swipeBetween_17000007 to.y=-1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.swipeBetween({x: 100, y:100}, {x:100, y: 100, displayId: -1});
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_swipeBetween_17000007 to.displayId=-1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.swipeBetween({x: 100, y:100}, {x:100, y: 100}, -1);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_swipeBetween_17000007 speed=-1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.swipeBetween({x: 100, y:100, displayId: 0}, {x:100, y: 100, displayId: 1});
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_driver_swipeBetween_17000007 diff error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, test_driver_swipeBetween_17000007 end`);
    })

    /*
     * @tc.number: uitestDriverErrorTest_083
     * @tc.name: test_driver_screenCapWithId_401
     * @tc.desc: screenCap 401 test.
     */
    it("test_driver_screenCapWithId_401", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_driver_screenCapWithId_401 start`);
      let driver: Driver = Driver.create();
      try {
        await driver.screenCap(null, 0);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_driver_screenCapWithId_401 savePath = null error, ${JSON.stringify(error)} `);
        expect(error.code).assertEqual(ErrorCode)
      }
      try {
        await driver.screenCap(undefined, 0);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_driver_screenCapWithId_401 savePath = undefined error, ${JSON.stringify(error)} `);
        expect(error.code).assertEqual(ErrorCode)
      }
      try {
        let savePath = '/data/storage/el2/base/cache/1.png'
        await driver.screenCap(savePath, -1);
        console.log(`${TestTag}, test_driver_screenCapWithId_401 displayId = -1 SUCCESS `)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_driver_screenCapWithId_401 displayId = -1 error, ${JSON.stringify(error)} `);
        expect(error.code).assertEqual(ErrorCode)
      }
    })
  })
}