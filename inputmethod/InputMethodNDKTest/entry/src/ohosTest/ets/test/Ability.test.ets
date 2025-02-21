import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import testNapi from 'libentry.so';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
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

    let expResult = "OK"
    it('SUB_IMF_NDK_AttachOptions_Create_0100', 0, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_AttachOptions_Create_0100();
      console.info(`====>SUB_IMF_NDK_AttachOptions_Create_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    it('SUB_IMF_NDK_InputMethodController_Attach_0100', 0, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_InputMethodController_Attach_0100();
      console.info(`====>SUB_IMF_NDK_InputMethodController_Attach_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    it('SUB_IMF_NDK_InputMethodController_Detach_0100', 0, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_InputMethodController_Detach_0100();
      console.info(`====>SUB_IMF_NDK_InputMethodController_Detach_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    it('SUB_IMF_NDK_InputMethodProxy_ShowKeyboard_0100', 0, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_InputMethodProxy_ShowKeyboard_0100();
      console.info(`====>SUB_IMF_NDK_InputMethodProxy_ShowKeyboard_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    it('SUB_IMF_NDK_InputMethodProxy_HideKeyboard_0100', 0, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_InputMethodProxy_HideKeyboard_0100();
      console.info(`====>SUB_IMF_NDK_InputMethodProxy_HideKeyboard_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    it('SUB_IMF_NDK_InputMethodProxy_NotifySelectionChange_0100', 0, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_InputMethodProxy_NotifySelectionChange_0100();
      console.info(`====>SUB_IMF_NDK_InputMethodProxy_NotifySelectionChange_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    it('SUB_IMF_NDK_InputMethodProxy_NotifyConfigurationChange_0100', 0, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_InputMethodProxy_NotifyConfigurationChange_0100();
      console.info(`====>SUB_IMF_NDK_InputMethodProxy_NotifyConfigurationChange_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    it('SUB_IMF_NDK_InputMethodProxy_NotifyCursorUpdate_0100', 0, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_InputMethodProxy_NotifyCursorUpdate_0100();
      console.info(`====>SUB_IMF_NDK_InputMethodProxy_NotifyCursorUpdate_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    it('SUB_IMF_NDK_InputMethodProxy_SendPrivateCommand_0100', 0, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_InputMethodProxy_SendPrivateCommand_0100();
      console.info(`====>SUB_IMF_NDK_InputMethodProxy_SendPrivateCommand_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    it('SUB_IMF_NDK_PrivateCommand_SetKey_0100', 0, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_PrivateCommand_SetKey_0100();
      console.info(`====>SUB_IMF_NDK_PrivateCommand_SetKey_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    it('SUB_IMF_NDK_TextAvoidInfo_Create_0100', 0, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_TextAvoidInfo_Create_0100();
      console.info(`====>SUB_IMF_NDK_TextAvoidInfo_Create_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    it('SUB_IMF_NDK_TextConfig_Create_0100', 0, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_TextConfig_Create_0100();
      console.info(`====>SUB_IMF_NDK_TextConfig_Create_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    it('SUB_IMF_NDK_TextEditorProxy_Get_0100', 0, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_TextEditorProxy_Get_0100();
      console.info(`====>SUB_IMF_NDK_TextEditorProxy_Get_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    it('SUB_IMF_NDK_CursorInfo_Create_0100', 0, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_CursorInfo_Create_0100();
      console.info(`====>SUB_IMF_NDK_CursorInfo_Create_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

  })
}