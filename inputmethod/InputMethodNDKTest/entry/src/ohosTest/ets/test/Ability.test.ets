import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import testNapi from 'libentry.so';
import { BusinessError } from '@ohos.base';
import inputMethod from '@ohos.inputMethod';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async(done: Function) => {
      let inputMethodSetting = inputMethod.getSetting();
      console.info('====> getSetting success!')
      inputMethodSetting.listInputMethod((err: BusinessError, data: Array<inputMethod.InputMethodProperty>) => {
        let t = setTimeout(async ()=>{
          console.info('====>Succeeded in listing inputMethod: ' + JSON.stringify(data));
          const ATTRIBUTE: inputMethod.TextConfig = {
            inputAttribute: {
              textInputType: 0, enterKeyType: 0
            }
          }
          try {
            let data = await inputMethod.getController().attach(false, ATTRIBUTE);
            console.info(`====> execution success, data: ${JSON.stringify(data)}`);
          } catch (error) {
            console.info(`====> catch error, error: [${error.code}, ${error.message}]`);
          }
          clearTimeout(t);
          done();
        }, 3000)
      });
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
    /**
     * @tc.name   SUB_IMF_NDK_AttachOptions_Create_0100
     * @tc.number SUB_IMF_NDK_AttachOptions_Create_0100
     * @tc.desc   SUB_IMF_NDK_AttachOptions_Create_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMF_NDK_AttachOptions_Create_0100', Level.LEVEL0, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_AttachOptions_Create_0100();
      console.info(`====>SUB_IMF_NDK_AttachOptions_Create_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    /**
     * @tc.name   SUB_IMF_NDK_InputMethodController_Attach_0100
     * @tc.number SUB_IMF_NDK_InputMethodController_Attach_0100
     * @tc.desc   SUB_IMF_NDK_InputMethodController_Attach_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_IMF_NDK_InputMethodController_Attach_0100', Level.LEVEL2, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_InputMethodController_Attach_0100();
      console.info(`====>SUB_IMF_NDK_InputMethodController_Attach_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    /**
     * @tc.name   SUB_IMF_NDK_InputMethodController_AttachWithUIContext_0100
     * @tc.number SUB_IMF_NDK_InputMethodController_AttachWithUIContext_0100
     * @tc.desc   SUB_IMF_NDK_InputMethodController_AttachWithUIContext_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_IMF_NDK_InputMethodController_AttachWithUIContext_0100', Level.LEVEL2, (done: Function) => {
      let uiContext = AppStorage.get<UIContext>("uiContext") as UIContext;
      console.info(`====>SUB_IMF_NDK_InputMethodController_AttachWithUIContext_0100 uiContext: ${uiContext}`)
      let result = testNapi.SUB_IMF_NDK_InputMethodController_AttachWithUIContext_0100(uiContext);
      console.info(`====>SUB_IMF_NDK_InputMethodController_AttachWithUIContext_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    /**
     * @tc.name   SUB_IMF_NDK_InputMethodController_AttachWithUIContext_0200
     * @tc.number SUB_IMF_NDK_InputMethodController_AttachWithUIContext_0200
     * @tc.desc   SUB_IMF_NDK_InputMethodController_AttachWithUIContext_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_IMF_NDK_InputMethodController_AttachWithUIContext_0200', Level.LEVEL3, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_InputMethodController_AttachWithUIContext_0200();
      console.info(`====>SUB_IMF_NDK_InputMethodController_AttachWithUIContext_0200 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    /**
     * @tc.name   SUB_IMF_NDK_InputMethodController_Detach_0100
     * @tc.number SUB_IMF_NDK_InputMethodController_Detach_0100
     * @tc.desc   SUB_IMF_NDK_InputMethodController_Detach_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_IMF_NDK_InputMethodController_Detach_0100', Level.LEVEL2, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_InputMethodController_Detach_0100();
      console.info(`====>SUB_IMF_NDK_InputMethodController_Detach_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    /**
     * @tc.name   SUB_IMF_NDK_InputMethodProxy_ShowKeyboard_0100
     * @tc.number SUB_IMF_NDK_InputMethodProxy_ShowKeyboard_0100
     * @tc.desc   SUB_IMF_NDK_InputMethodProxy_ShowKeyboard_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_IMF_NDK_InputMethodProxy_ShowKeyboard_0100', Level.LEVEL2, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_InputMethodProxy_ShowKeyboard_0100();
      console.info(`====>SUB_IMF_NDK_InputMethodProxy_ShowKeyboard_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    /**
     * @tc.name   SUB_IMF_NDK_InputMethodProxy_HideKeyboard_0100
     * @tc.number SUB_IMF_NDK_InputMethodProxy_HideKeyboard_0100
     * @tc.desc   SUB_IMF_NDK_InputMethodProxy_HideKeyboard_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_IMF_NDK_InputMethodProxy_HideKeyboard_0100', Level.LEVEL2, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_InputMethodProxy_HideKeyboard_0100();
      console.info(`====>SUB_IMF_NDK_InputMethodProxy_HideKeyboard_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    /**
     * @tc.name   SUB_IMF_NDK_InputMethodProxy_NotifySelectionChange_0100
     * @tc.number SUB_IMF_NDK_InputMethodProxy_NotifySelectionChange_0100
     * @tc.desc   SUB_IMF_NDK_InputMethodProxy_NotifySelectionChange_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_IMF_NDK_InputMethodProxy_NotifySelectionChange_0100', Level.LEVEL2, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_InputMethodProxy_NotifySelectionChange_0100();
      console.info(`====>SUB_IMF_NDK_InputMethodProxy_NotifySelectionChange_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    /**
     * @tc.name   SUB_IMF_NDK_InputMethodProxy_NotifyConfigurationChange_0100
     * @tc.number SUB_IMF_NDK_InputMethodProxy_NotifyConfigurationChange_0100
     * @tc.desc   SUB_IMF_NDK_InputMethodProxy_NotifyConfigurationChange_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_IMF_NDK_InputMethodProxy_NotifyConfigurationChange_0100', Level.LEVEL2, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_InputMethodProxy_NotifyConfigurationChange_0100();
      console.info(`====>SUB_IMF_NDK_InputMethodProxy_NotifyConfigurationChange_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    /**
     * @tc.name   SUB_IMF_NDK_InputMethodProxy_NotifyCursorUpdate_0100
     * @tc.number SUB_IMF_NDK_InputMethodProxy_NotifyCursorUpdate_0100
     * @tc.desc   SUB_IMF_NDK_InputMethodProxy_NotifyCursorUpdate_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_IMF_NDK_InputMethodProxy_NotifyCursorUpdate_0100', Level.LEVEL2, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_InputMethodProxy_NotifyCursorUpdate_0100();
      console.info(`====>SUB_IMF_NDK_InputMethodProxy_NotifyCursorUpdate_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    /**
     * @tc.name   SUB_IMF_NDK_InputMethodProxy_SendPrivateCommand_0100
     * @tc.number SUB_IMF_NDK_InputMethodProxy_SendPrivateCommand_0100
     * @tc.desc   SUB_IMF_NDK_InputMethodProxy_SendPrivateCommand_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_IMF_NDK_InputMethodProxy_SendPrivateCommand_0100', Level.LEVEL2, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_InputMethodProxy_SendPrivateCommand_0100();
      console.info(`====>SUB_IMF_NDK_InputMethodProxy_SendPrivateCommand_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    /**
     * @tc.name   SUB_IMF_NDK_PrivateCommand_SetKey_0100
     * @tc.number SUB_IMF_NDK_PrivateCommand_SetKey_0100
     * @tc.desc   SUB_IMF_NDK_PrivateCommand_SetKey_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_IMF_NDK_PrivateCommand_SetKey_0100', Level.LEVEL2, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_PrivateCommand_SetKey_0100();
      console.info(`====>SUB_IMF_NDK_PrivateCommand_SetKey_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    /**
     * @tc.name   SUB_IMF_NDK_TextAvoidInfo_Create_0100
     * @tc.number SUB_IMF_NDK_TextAvoidInfo_Create_0100
     * @tc.desc   SUB_IMF_NDK_TextAvoidInfo_Create_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMF_NDK_TextAvoidInfo_Create_0100', Level.LEVEL0, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_TextAvoidInfo_Create_0100();
      console.info(`====>SUB_IMF_NDK_TextAvoidInfo_Create_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    /**
     * @tc.name   SUB_IMF_NDK_TextConfig_Create_0100
     * @tc.number SUB_IMF_NDK_TextConfig_Create_0100
     * @tc.desc   SUB_IMF_NDK_TextConfig_Create_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_IMF_NDK_TextConfig_Create_0100', Level.LEVEL2, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_TextConfig_Create_0100();
      console.info(`====>SUB_IMF_NDK_TextConfig_Create_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    /**
     * @tc.name   SUB_IMF_NDK_TextEditorProxy_Get_0100
     * @tc.number SUB_IMF_NDK_TextEditorProxy_Get_0100
     * @tc.desc   SUB_IMF_NDK_TextEditorProxy_Get_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_IMF_NDK_TextEditorProxy_Get_0100', Level.LEVEL2, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_TextEditorProxy_Get_0100();
      console.info(`====>SUB_IMF_NDK_TextEditorProxy_Get_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    /**
     * @tc.name   SUB_IMF_NDK_CursorInfo_Create_0100
     * @tc.number SUB_IMF_NDK_CursorInfo_Create_0100
     * @tc.desc   SUB_IMF_NDK_CursorInfo_Create_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_IMF_NDK_CursorInfo_Create_0100', Level.LEVEL2, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_CursorInfo_Create_0100();
      console.info(`====>SUB_IMF_NDK_CursorInfo_Create_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    /**
     * @tc.name   SUB_IMF_NDK_InputMethodController_Attach_MOUSE
     * @tc.number SUB_IMF_NDK_InputMethodController_Attach_MOUSE
     * @tc.desc   SUB_IMF_NDK_InputMethodController_Attach_MOUSE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_IMF_NDK_InputMethodController_Attach_MOUSE', Level.LEVEL2, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_InputMethodController_Attach_MOUSE();
      console.info(`====>SUB_IMF_NDK_InputMethodController_Attach_MOUSE result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    /**
     * @tc.name   SUB_IMF_NDK_InputMethodController_Attach_TOUCH
     * @tc.number SUB_IMF_NDK_InputMethodController_Attach_TOUCH
     * @tc.desc   SUB_IMF_NDK_InputMethodController_Attach_TOUCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_IMF_NDK_InputMethodController_Attach_TOUCH', Level.LEVEL2, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_InputMethodController_Attach_TOUCH();
      console.info(`====>SUB_IMF_NDK_InputMethodController_Attach_TOUCH result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    /**
     * @tc.name   SUB_IMF_NDK_InputMethodController_Attach_NONE
     * @tc.number SUB_IMF_NDK_InputMethodController_Attach_NONE
     * @tc.desc   SUB_IMF_NDK_InputMethodController_Attach_NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_IMF_NDK_InputMethodController_Attach_NONE', Level.LEVEL2, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_InputMethodController_Attach_NONE();
      console.info(`====>SUB_IMF_NDK_InputMethodController_Attach_NONE result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    /**
     * @tc.name   SUB_IMF_NDK_InputMethodProxy_ShowTextInput_NONE
     * @tc.number SUB_IMF_NDK_InputMethodProxy_ShowTextInput_NONE
     * @tc.desc   SUB_IMF_NDK_InputMethodProxy_ShowTextInput_NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_IMF_NDK_InputMethodProxy_ShowTextInput_NONE', Level.LEVEL2, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_InputMethodProxy_ShowTextInput_NONE();
      console.info(`====>SUB_IMF_NDK_InputMethodProxy_ShowTextInput_NONE result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    /**
     * @tc.name   SUB_IMF_NDK_InputMethodProxy_ShowTextInput_MOUSE
     * @tc.number SUB_IMF_NDK_InputMethodProxy_ShowTextInput_MOUSE
     * @tc.desc   SUB_IMF_NDK_InputMethodProxy_ShowTextInput_MOUSE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_IMF_NDK_InputMethodProxy_ShowTextInput_MOUSE', Level.LEVEL2, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_InputMethodProxy_ShowTextInput_MOUSE();
      console.info(`====>SUB_IMF_NDK_InputMethodProxy_ShowTextInput_MOUSE result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    /**
     * @tc.name   SUB_IMF_NDK_InputMethodProxy_ShowTextInput_TOUCH
     * @tc.number SUB_IMF_NDK_InputMethodProxy_ShowTextInput_TOUCH
     * @tc.desc   SUB_IMF_NDK_InputMethodProxy_ShowTextInput_TOUCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_IMF_NDK_InputMethodProxy_ShowTextInput_TOUCH', Level.LEVEL2, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_InputMethodProxy_ShowTextInput_TOUCH();
      console.info(`====>SUB_IMF_NDK_InputMethodProxy_ShowTextInput_TOUCH result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    /**
     * @tc.name   SUB_IMF_NDK_InputMethodProxy_ShowTextInput_OTHER
     * @tc.number SUB_IMF_NDK_InputMethodProxy_ShowTextInput_OTHER
     * @tc.desc   SUB_IMF_NDK_InputMethodProxy_ShowTextInput_OTHER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_IMF_NDK_InputMethodProxy_ShowTextInput_OTHER', Level.LEVEL2, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_InputMethodProxy_ShowTextInput_OTHER();
      console.info(`====>SUB_IMF_NDK_InputMethodProxy_ShowTextInput_OTHER result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    /**
     * @tc.name   SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_NONE
     * @tc.number SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_NONE
     * @tc.desc   SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_NONE', Level.LEVEL2, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_NONE();
      console.info(`====>SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_NONE result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    /**
     * @tc.name   SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_MOUSE
     * @tc.number SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_MOUSE
     * @tc.desc   SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_MOUSE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_MOUSE', Level.LEVEL2, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_MOUSE();
      console.info(`====>SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_MOUSE result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    /**
     * @tc.name   SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_TOUCH
     * @tc.number SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_TOUCH
     * @tc.desc   SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_TOUCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_TOUCH', Level.LEVEL2, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_TOUCH();
      console.info(`====>SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_TOUCH result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    /**
     * @tc.name   SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_OTHER
     * @tc.number SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_OTHER
     * @tc.desc   SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_OTHER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_OTHER', Level.LEVEL2, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_OTHER();
      console.info(`====>SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_OTHER result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    /**
     * @tc.name   SUB_IMF_NDK_TextEditorProxy_SetCallbackInMainThread_0100
     * @tc.number SUB_IMF_NDK_TextEditorProxy_SetCallbackInMainThread_0100
     * @tc.desc   SUB_IMF_NDK_TextEditorProxy_SetCallbackInMainThread_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_IMF_NDK_TextEditorProxy_SetCallbackInMainThread_0100', Level.LEVEL2, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_TextEditorProxy_SetCallbackInMainThread_0100();
      console.info(`====>SUB_IMF_NDK_TextEditorProxy_SetCallbackInMainThread_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    /**
     * @tc.name   SUB_IMF_NDK_TextEditorProxy_SetCallbackInMainThread_0200
     * @tc.number SUB_IMF_NDK_TextEditorProxy_SetCallbackInMainThread_0200
     * @tc.desc   SUB_IMF_NDK_TextEditorProxy_SetCallbackInMainThread_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_IMF_NDK_TextEditorProxy_SetCallbackInMainThread_0200', Level.LEVEL2, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_TextEditorProxy_SetCallbackInMainThread_0200();
      console.info(`====>SUB_IMF_NDK_TextEditorProxy_SetCallbackInMainThread_0200 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    /**
     * @tc.name   SUB_IMF_NDK_TextConfig_SetPlaceholder_0100
     * @tc.number SUB_IMF_NDK_TextConfig_SetPlaceholder_0100
     * @tc.desc   SUB_IMF_NDK_TextConfig_SetPlaceholder_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_IMF_NDK_TextConfig_SetPlaceholder_0100', Level.LEVEL3, (done: Function) => {
      try {
        let result = testNapi.SUB_IMF_NDK_TextConfig_SetPlaceholder_0100();
        console.info(`====>SUB_IMF_NDK_TextConfig_SetPlaceholder_0100 result: ${result}`)
        expect(expResult).assertEqual(result)
        done();
      } catch (err) {
        console.info(`====>SUB_IMF_NDK_TextConfig_SetPlaceholder_0100 fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
    })

    /**
     * @tc.name   SUB_IMF_NDK_TextConfig_SetPlaceholder_0200
     * @tc.number SUB_IMF_NDK_TextConfig_SetPlaceholder_0200
     * @tc.desc   SUB_IMF_NDK_TextConfig_SetPlaceholder_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_IMF_NDK_TextConfig_SetPlaceholder_0200', Level.LEVEL3, (done: Function) => {
      try {
        let result = testNapi.SUB_IMF_NDK_TextConfig_SetPlaceholder_0200();
        console.info(`====>SUB_IMF_NDK_TextConfig_SetPlaceholder_0200 result: ${result}`)
        expect(expResult).assertEqual(result)
        done();
      } catch (err) {
        console.info(`====>SUB_IMF_NDK_TextConfig_SetPlaceholder_0200 fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
    })

    /**
     * @tc.name   SUB_IMF_NDK_TextConfig_SetPlaceholder_0300
     * @tc.number SUB_IMF_NDK_TextConfig_SetPlaceholder_0300
     * @tc.desc   SUB_IMF_NDK_TextConfig_SetPlaceholder_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_IMF_NDK_TextConfig_SetPlaceholder_0300', Level.LEVEL3, (done: Function) => {
      try {
        let result = testNapi.SUB_IMF_NDK_TextConfig_SetPlaceholder_0300();
        console.info(`====>SUB_IMF_NDK_TextConfig_SetPlaceholder_0300 result: ${result}`)
        expect(expResult).assertEqual(result)
        done();
      } catch (err) {
        console.info(`====>SUB_IMF_NDK_TextConfig_SetPlaceholder_0300 fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
    })

    /**
     * @tc.name   SUB_IMF_NDK_TextConfig_SetPlaceholder_0400
     * @tc.number SUB_IMF_NDK_TextConfig_SetPlaceholder_0400
     * @tc.desc   SUB_IMF_NDK_TextConfig_SetPlaceholder_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_IMF_NDK_TextConfig_SetPlaceholder_0400', Level.LEVEL3, (done: Function) => {
      try {
        let result = testNapi.SUB_IMF_NDK_TextConfig_SetPlaceholder_0400();
        console.info(`====>SUB_IMF_NDK_TextConfig_SetPlaceholder_0400 result: ${result}`)
        expect(expResult).assertEqual(result)
        done();
      } catch (err) {
        console.info(`====>SUB_IMF_NDK_TextConfig_SetPlaceholder_0400 fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
    })

    /**
     * @tc.name   SUB_IMF_NDK_InputMethod_ErrorCode_0100
     * @tc.number SUB_IMF_NDK_InputMethod_ErrorCode_0100
     * @tc.desc   SUB_IMF_NDK_InputMethod_ErrorCode_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_IMF_NDK_InputMethod_ErrorCode_0100', Level.LEVEL3, (done: Function) => {
      try {
        let result = testNapi.SUB_IMF_NDK_InputMethod_ErrorCode_0100();
        console.info(`====>SUB_IMF_NDK_InputMethod_ErrorCode_0100 result: ${result}`);
        expect(result == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`====>SUB_IMF_NDK_InputMethod_ErrorCode_0100 fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
    })

  })
}