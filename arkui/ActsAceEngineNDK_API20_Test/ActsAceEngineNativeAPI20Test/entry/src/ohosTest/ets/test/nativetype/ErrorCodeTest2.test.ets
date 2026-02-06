import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import libnativetype from 'libnativetype.so'
import Utils from '../common/Utils';
import { Driver } from '@kit.TestKit';
import { MouseButton as UiTestMouseButton } from '@ohos.UiTest'

const OS_ACCOUNT_ERR_INVALID_PARAMETER = 12300002;
const ARKUI_ERROR_CODE_NODE_EVENT_PARAM_INDEX_OUT_OF_RANGE = 106107;
const ARKUI_ERROR_CODE_NOT_CLONED_POINTER_EVENT = 180003;


export default function ErrorCodeTest2() {
  describe('ErrorCodeTest2', () => {
    /**
     * @tc.name   testArkUIACEErrorCode0400
     * @tc.number SUB_ArkUI_ACE_ErrorCode_0400
     * @tc.desc   testing ARKUI_ERROR_CODE_NODE_EVENT_PARAM_INVALID ErrorCode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACEErrorCode0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await Utils.pushPage(`NativeType/NodeEventTest`);
        console.info(`====>SUB_ArkUI_ACE_ErrorCode_0400 start<====`);
        await Utils.sleep(500);
        let Result: number = libnativetype.ErrorCodeNodeOutOfRange();
        expect(ARKUI_ERROR_CODE_NODE_EVENT_PARAM_INDEX_OUT_OF_RANGE).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ArkUI_ACE_ErrorCode_0400 catch err: ` + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
        done()
      }
    })
    /**
     * @tc.name   testArkUIACEErrorCode1300
     * @tc.number SUB_ArkUI_ACE_ErrorCode_1300
     * @tc.desc   testing ARKUI_ERROR_CODE_NOT_CLONED_POINTER_EVENT ErrorCode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACEErrorCode1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ArkUI_ACE_ErrorCode_1300 start<====`);
        await Utils.pushPageNoClear('NativeType/UIInputEvent');
        await Driver.create().mouseClick({ x: 248, y: 194 }, UiTestMouseButton.MOUSE_BUTTON_LEFT, 2072);
        let Result: number = libnativetype.ErrorCodeNotClonedPointerEvent();
        expect(ARKUI_ERROR_CODE_NOT_CLONED_POINTER_EVENT).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ArkUI_ACE_ErrorCode_1300 catch err: ` + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
        done()
      }
    })

  })
}