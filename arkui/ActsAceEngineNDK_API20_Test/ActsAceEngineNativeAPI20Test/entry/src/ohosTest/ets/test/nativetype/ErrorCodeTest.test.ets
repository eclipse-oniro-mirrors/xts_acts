import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import libnativetype from 'libnativetype.so'
import Utils from '../common/Utils';
import nativexcomponent from 'libnativexcomponent.so';
import { ON } from '@kit.TestKit';

const OS_ACCOUNT_ERR_INVALID_PARAMETER = 12300002;
const ARKUI_ERROR_CODE_INTERNAL_ERROR = 100001;
const ARKUI_ERROR_CODE_XCOMPONENT_STATE_INVALID = 103501;
const ARKUI_ERROR_CODE_ATTRIBUTE_OR_EVENT_NOT_SUPPORTED = 106102;
const ARKUI_ERROR_CODE_NODE_EVENT_PARAM_INVALID = 106108;
const ARKUI_ERROR_CODE_FOCUS_NON_FOCUSABLE = 150001;
const ARKUI_ERROR_CODE_FOCUS_NON_FOCUSABLE_ANCESTOR = 150002;
const ARKUI_ERROR_CODE_FOCUS_NON_EXISTENT = 150003;
const ARKUI_ERROR_CODE_NON_SCROLLABLE_CONTAINER = 180001;
const ARKUI_ERROR_CODE_RECOGNIZER_TYPE_NOT_SUPPORTED = 180102;
const ARKUI_ERROR_CODE_POST_CLONED_COMPONENT_STATUS_ABNORMAL = 180004;

export default function ErrorCodeTest() {
  describe('ErrorCodeTest', () => {
    /**
     * @tc.name   testArkUIACEErrorCode0100
     * @tc.number SUB_ArkUI_ACE_ErrorCode_0100
     * @tc.desc   testing ARKUI_ERROR_CODE_INTERNAL_ERROR ErrorCode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACEErrorCode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ArkUI_ACE_ErrorCode_0100 start<====`);
        let Result: number = libnativetype.ErrorCodeInternalError();
        expect(ARKUI_ERROR_CODE_INTERNAL_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ArkUI_ACE_ErrorCode_0100 catch err: ` + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
        done()
      }
    })
    /**
     * @tc.name   testArkUIACEErrorCode0200
     * @tc.number SUB_ArkUI_ACE_ErrorCode_0200
     * @tc.desc   testing ARKUI_ERROR_CODE_XCOMPONENT_STATE_INVALID ErrorCode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACEErrorCode0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ArkUI_ACE_ErrorCode_0200 start<====`);
        let Result: number = nativexcomponent.XComponentInitialize001();
        expect(ARKUI_ERROR_CODE_XCOMPONENT_STATE_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ArkUI_ACE_ErrorCode_0200 catch err: ` + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
        done()
      }
    })
    /**
     * @tc.name   testArkUIACEErrorCode0300
     * @tc.number SUB_ArkUI_ACE_ErrorCode_0300
     * @tc.desc   testing ARKUI_ERROR_CODE_ATTRIBUTE_OR_EVENT_NOT_SUPPORTED ErrorCode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACEErrorCode0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ArkUI_ACE_ErrorCode_0300 start<====`);
        let Result: number = libnativetype.ErrorCodeEventNotSupported();
        expect(ARKUI_ERROR_CODE_ATTRIBUTE_OR_EVENT_NOT_SUPPORTED).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ArkUI_ACE_ErrorCode_0300 catch err: ` + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
        done()
      }
    })
    /**
     * @tc.name   testArkUIACEErrorCode0600
     * @tc.number SUB_ArkUI_ACE_ErrorCode_0600
     * @tc.desc   testing ARKUI_ERROR_CODE_FOCUS_NON_FOCUSABLE ErrorCode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACEErrorCode0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ArkUI_ACE_ErrorCode_0600 start<====`);
        let Result: number = libnativetype.ErrorCodeFocusNonFocusable();
        expect(ARKUI_ERROR_CODE_FOCUS_NON_FOCUSABLE).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ArkUI_ACE_ErrorCode_0600 catch err: ` + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
        done()
      }
    })
    /**
     * @tc.name   testArkUIACEErrorCode0500
     * @tc.number SUB_ArkUI_ACE_ErrorCode_0500
     * @tc.desc   testing ARKUI_ERROR_CODE_NODE_EVENT_PARAM_INVALID ErrorCode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACEErrorCode0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ArkUI_ACE_ErrorCode_0500 start<====`);
        let Result: number = libnativetype.ErrorCodeNodeEventParamInvalid();
        expect(ARKUI_ERROR_CODE_NODE_EVENT_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ArkUI_ACE_ErrorCode_0500 catch err: ` + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
        done()
      }
    })

    /**
     * @tc.name   testArkUIACEErrorCode0700
     * @tc.number SUB_ArkUI_ACE_ErrorCode_0700
     * @tc.desc   testing ARKUI_ERROR_CODE_FOCUS_NON_FOCUSABLE_ANCESTOR ErrorCode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACEErrorCode0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ArkUI_ACE_ErrorCode_0700 start<====`);
        let Result: number = libnativetype.ErrorCodeFocusNonAncestor();
        expect(ARKUI_ERROR_CODE_FOCUS_NON_FOCUSABLE_ANCESTOR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ArkUI_ACE_ErrorCode_0700 catch err: ` + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
        done()
      }
    })
    /**
     * @tc.name   testArkUIACEErrorCode0800
     * @tc.number SUB_ArkUI_ACE_ErrorCode_0800
     * @tc.desc   testing ARKUI_ERROR_CODE_FOCUS_NON_EXISTENT ErrorCode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACEErrorCode0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ArkUI_ACE_ErrorCode_0800 start<====`);
        let Result: number = libnativetype.ErrorCodeFocusNonExistent();
        expect(ARKUI_ERROR_CODE_FOCUS_NON_EXISTENT).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ArkUI_ACE_ErrorCode_0800 catch err: ` + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
        done()
      }
    })
    /**
     * @tc.name   testArkUIACEErrorCode1200
     * @tc.number SUB_ArkUI_ACE_ErrorCode_1200
     * @tc.desc   testing ARKUI_ERROR_CODE_RECOGNIZER_TYPE_NOT_SUPPORTED ErrorCode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACEErrorCode1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ArkUI_ACE_ErrorCode_1200 start<====`);
        await Utils.pushPageNoClear("NativeType/NativeGestureTest2");
        let Component = await Utils.driver.findComponent(ON.id('Column1'));
        let ComponentPoint = await Component.getBoundsCenter();
        console.info(`====>ComponentPoint x====${ComponentPoint.x} y====${ComponentPoint.y}`);
        await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
        let Result: number = libnativetype.ErrorCodeRecognizerTypeNotSupported();
        expect(ARKUI_ERROR_CODE_RECOGNIZER_TYPE_NOT_SUPPORTED).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ArkUI_ACE_ErrorCode_1200 catch err: ` + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
        done()
      }
    })
    /**
     * @tc.name   testArkUIACEErrorCode1500
     * @tc.number SUB_ArkUI_ACE_ErrorCode_1500
     * @tc.desc   testing ARKUI_ERROR_CODE_POST_CLONED_COMPONENT_STATUS_ABNORMAL ErrorCode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACEErrorCode1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ArkUI_ACE_ErrorCode_1500 start<====`);
        let Result: number = libnativetype.ErrorCodePostClonedComponentStatusAbnormal();
        expect(ARKUI_ERROR_CODE_POST_CLONED_COMPONENT_STATUS_ABNORMAL).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ArkUI_ACE_ErrorCode_1500 catch err: ` + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
        done()
      }
    })

  })
}
