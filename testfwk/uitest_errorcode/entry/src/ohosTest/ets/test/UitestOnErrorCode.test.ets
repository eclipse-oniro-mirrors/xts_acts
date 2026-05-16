import { describe, it, expect, TestType, Level, Size } from '@ohos/hypium'
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver,
  InputTextMode } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base';

const waitUiReadyMs : number = 1000;
const TestTag = 'uitestOnErrorTest';
const ParameterErrorCode = 17000007;


function sleep(nm: number) {
  return new Promise<void>((resolve: Function, reject: Function) => {
    setTimeout(resolve, nm);
  })
}

export default function uitestOnErrorTest() {
  describe('uitestOnErrorTest', () => {

    /**
     * @tc.name   test_belongingDisplay_17000007
     * @tc.number uitestOnErrorTest_001
     * @tc.desc   belongingDisplay 17000007 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_belongingDisplay_17000007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`test_belongingDisplay_17000007, start`);
      try {
        ON.belongingDisplay(null);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_belongingDisplay_17000007 id= null error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        ON.belongingDisplay(undefined);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_belongingDisplay_17000007 id= undefined error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        ON.belongingDisplay(-1);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_belongingDisplay_17000007 id=-1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, test_belongingDisplay_17000007 end`);
    })

    /**
     * @tc.name   test_originalText_17000007
     * @tc.number uitestOnErrorTest_002
     * @tc.desc   originalText 17000007 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_originalText_17000007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`test_originalText_17000007, start`);
      try {
        ON.originalText(null);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_originalText_17000007 id= null error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        ON.originalText(undefined);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_originalText_17000007 id= undefined error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, test_originalText_17000007 end`);
    })
  })
}