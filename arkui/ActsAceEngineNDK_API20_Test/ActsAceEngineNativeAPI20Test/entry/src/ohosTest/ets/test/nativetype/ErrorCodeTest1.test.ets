import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import libnativetype from 'libnativetype.so'
import Utils from '../common/Utils';
import { Driver } from '@kit.TestKit';
import { MouseButton as UiTestMouseButton } from '@ohos.UiTest'

const OS_ACCOUNT_ERR_INVALID_PARAMETER = 12300002;
const ARKUI_ERROR_CODE_POST_CLONED_NO_COMPONENT_HIT_TO_RESPOND_TO_THE_EVENT = 180005


export default function ErrorCodeTest1() {
  describe('ErrorCodeTest1', () => {
    /**
     * @tc.name   testArkUIACEErrorCode1900
     * @tc.number SUB_ArkUI_ACE_ErrorCode_1900
     * @tc.desc   testing ARKUI_ERROR_CODE_NOT_CLONED_POINTER_EVENT ErrorCode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACEErrorCode1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ArkUI_ACE_ErrorCode_1900 start<====`);
        await Utils.pushPageNoClear('NativeType/UIInputEvent');
        await Driver.create().mouseClick({ x: 248, y: 194 }, UiTestMouseButton.MOUSE_BUTTON_LEFT, 2072);
        let Result: number = libnativetype.ErrorCodePostCloned();
        expect(ARKUI_ERROR_CODE_POST_CLONED_NO_COMPONENT_HIT_TO_RESPOND_TO_THE_EVENT).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ArkUI_ACE_ErrorCode_1900 catch err: ` + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
        done()
      }
    })
  })
}