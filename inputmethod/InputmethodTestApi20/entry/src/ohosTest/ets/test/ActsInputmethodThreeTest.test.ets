/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import testNapi from 'libentry.so'
import { Driver, ON } from '@kit.TestKit';
import { router } from '@kit.ArkUI';

function sleep1(ms: number) {
  return new Promise<number>(resolve => setTimeout(resolve, ms));
}

export default function ActsInputmethodThreeTest() {
  describe('ActsInputmethodThreeTest', () => {
    beforeAll(async () => {
      let options: router.RouterOptions = {
        url: `testability/pages/Index1`,
      }
      await router.pushUrl(options);
      await sleep1(1000);
    })
    /**
     * @tc.number SUB_InputMethod_Imf_SDK_Ime_KeyBoard_Status_None_14700
     * @tc.name SUB_InputMethod_Imf_SDK_Ime_KeyBoard_Status_None_14700
     * @tc.desc test IME_KEYBOARD_STATUS_NONE
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_Ime_KeyBoard_Status_None_14700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_KeyBoard_Status_None_14700 start====");
          let result: number = testNapi.testImeKeyBoardStatusNone();
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_KeyBoard_Status_None_14700 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_Ime_KeyBoard_Status_None_14700 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_Ime_KeyBoard_Status_Hide_14800
     * @tc.name SUB_InputMethod_Imf_SDK_Ime_KeyBoard_Status_Hide_14800
     * @tc.desc test IME_KEYBOARD_STATUS_HIDE
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_Ime_KeyBoard_Status_Hide_14800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_KeyBoard_Status_Hide_14800 start====");
          let result: number = testNapi.testImeKeyBoardStatusHide();
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_KeyBoard_Status_Hide_14800 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_Ime_KeyBoard_Status_Hide_14800 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_Ime_KeyBoard_Status_Show_14900
     * @tc.name SUB_InputMethod_Imf_SDK_Ime_KeyBoard_Status_Show_14900
     * @tc.desc test IME_KEYBOARD_STATUS_SHOW
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_Ime_KeyBoard_Status_Show_14900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_KeyBoard_Status_Show_14900 start====");
          let result: number = testNapi.testImeKeyBoardStatusShow();
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_KeyBoard_Status_Show_14900 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_Ime_KeyBoard_Status_Show_14900 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Go_15000
     * @tc.name SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Go_15000
     * @tc.desc test IME_ENTER_KEY_GO
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Go_15000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Go_15000 start====");
          let result: number = testNapi.testImeEnterKeyGo();
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Go_15000 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Go_15000 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Search_15100
     * @tc.name SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Search_15100
     * @tc.desc test IME_ENTER_KEY_SEARCH
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Search_15100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Search_15100 start====");
          let result: number = testNapi.testImeEnterKeySearch();
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Search_15100 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Search_15100 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Next_15200
     * @tc.name SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Next_15200
     * @tc.desc test IME_ENTER_KEY_NEXT
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Next_15200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Next_15200 start====");
          let result: number = testNapi.testImeEnterKeyNext();
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Next_15200 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Next_15200 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Done_15300
     * @tc.name SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Done_15300
     * @tc.desc test IME_ENTER_KEY_DONE
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Done_15300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Done_15300 start====");
          let result: number = testNapi.testImeEnterKeyDone();
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Done_15300 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Done_15300 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Previous_15400
     * @tc.name SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Previous_15400
     * @tc.desc test IME_ENTER_KEY_PREVIOUS
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Previous_15400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Previous_15400 start====");
          let result: number = testNapi.testImeEnterKeyPrevious();
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Previous_15400 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Previous_15400 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Newline_15500
     * @tc.name SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Newline_15500
     * @tc.desc test IME_ENTER_KEY_NEWLINE
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Newline_15500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Newline_15500 start====");
          let result: number = testNapi.testImeEnterKeyNewline();
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Newline_15500 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_Ime_Enter_Key_Newline_15500 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_Ime_Err_Detached_15600
     * @tc.name SUB_InputMethod_Imf_SDK_Ime_Err_Detached_15600
     * @tc.desc test IME_ERR_DETACHED
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_Ime_Err_Detached_15600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Err_Detached_15600 start====");
          let result: number = testNapi.testImeErrDetached();
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Err_Detached_15600 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_Ime_Err_Detached_15600 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_Ime_Err_Null_Pointer_15700
     * @tc.name SUB_InputMethod_Imf_SDK_Ime_Err_Null_Pointer_15700
     * @tc.desc test IME_ERR_NULL_POINTER
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_Ime_Err_Null_Pointer_15700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Err_Null_Pointer_15700 start====");
          let result: number = testNapi.testImeErrNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Err_Null_Pointer_15700 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_Ime_Err_Null_Pointer_15700 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_Ime_Err_Query_Failed_15800
     * @tc.name SUB_InputMethod_Imf_SDK_Ime_Err_Query_Failed_15800
     * @tc.desc test IME_ERR_QUERY_FAILED
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_Ime_Err_Query_Failed_15800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Err_Query_Failed_15800 start====");
          let result: number = testNapi.testImeErrQueryFailed();
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Err_Query_Failed_15800 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_Ime_Err_Query_Failed_15800 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_Ime_Err_Paramcheck_15900
     * @tc.name SUB_InputMethod_Imf_SDK_Ime_Err_Paramcheck_15900
     * @tc.desc test IME_ERR_PARAMCHECK
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_Ime_Err_Paramcheck_15900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Err_Paramcheck_15900 start====");
          let result: number = testNapi.testImeErrParamcheck();
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Err_Paramcheck_15900 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_Ime_Err_Paramcheck_15900 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Multiline_16000
     * @tc.name SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Multiline_16000
     * @tc.desc test IME_TEXT_INPUT_TYPE_MULTILINE
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Multiline_16000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Multiline_16000 start====");
          let result: number = testNapi.testImeTextInputTypeMultiline();
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Multiline_16000 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Multiline_16000 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Number_16100
     * @tc.name SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Number_16100
     * @tc.desc test IME_TEXT_INPUT_TYPE_NUMBER
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Number_16100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Number_16100 start====");
          let result: number = testNapi.testImeTextInputTypeNumber();
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Number_16100 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Number_16100 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Phone_16200
     * @tc.name SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Phone_16200
     * @tc.desc test IME_TEXT_INPUT_TYPE_PHONE
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Phone_16200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Phone_16200 start====");
          let result: number = testNapi.testImeTextInputTypePhone();
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Phone_16200 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Phone_16200 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Datetime_16300
     * @tc.name SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Datetime_16300
     * @tc.desc test IME_TEXT_INPUT_TYPE_DATETIME
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Datetime_16300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Datetime_16300 start====");
          let result: number = testNapi.testImeTextInputTypeDatetime();
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Datetime_16300 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Datetime_16300 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Address_16400
     * @tc.name SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Address_16400
     * @tc.desc test IME_TEXT_INPUT_TYPE_EMAIL_ADDRESS
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Address_16400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Address_16400 start====");
          let result: number = testNapi.testImeTextInputTypeAddress();
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Address_16400 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Address_16400 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Url_16500
     * @tc.name SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Url_16500
     * @tc.desc test IME_TEXT_INPUT_TYPE_URL
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Url_16500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Url_16500 start====");
          let result: number = testNapi.testImeTextInputTypeUrl();
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Url_16500 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Url_16500 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Visible_Password_16600
     * @tc.name SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Visible_Password_16600
     * @tc.desc test IME_TEXT_INPUT_TYPE_VISIBLE_PASSWORD
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Visible_Password_16600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Visible_Password_16600 start====");
          let result: number = testNapi.testImeTextInputTypeVisiblePassword();
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Visible_Password_16600 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Visible_Password_16600 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Number_Password_16700
     * @tc.name SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Number_Password_16700
     * @tc.desc test IME_TEXT_INPUT_TYPE_NUMBER_PASSWORD
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Number_Password_16700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Number_Password_16700 start====");
          let result: number = testNapi.testImeTextInputTypeNumberPassword();
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Number_Password_16700 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Number_Password_16700 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Screen_Lock_Password_16800
     * @tc.name SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Screen_Lock_Password_16800
     * @tc.desc test IME_TEXT_INPUT_TYPE_SCREEN_LOCK_PASSWORD
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Screen_Lock_Password_16800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Screen_Lock_Password_16800 start====");
          let result: number = testNapi.testImeTextInputTypeScreenLockPassword();
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Screen_Lock_Password_16800 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_Screen_Lock_Password_16800 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_User_Name_16900
     * @tc.name SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_User_Name_16900
     * @tc.desc test IME_TEXT_INPUT_TYPE_USER_NAME
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_User_Name_16900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_User_Name_16900 start====");
          let result: number = testNapi.testImeTextInputTypeUserName();
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_User_Name_16900 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_User_Name_16900 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_New_Password_17000
     * @tc.name SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_New_Password_17000
     * @tc.desc test IME_TEXT_INPUT_TYPE_NEW_PASSWORD
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_New_Password_17000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_New_Password_17000 start====");
          let result: number = testNapi.testImeTextInputTypeNewPassword();
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_New_Password_17000 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_New_Password_17000 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_One_Time_Code_17100
     * @tc.name SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_One_Time_Code_17100
     * @tc.desc test IME_TEXT_INPUT_TYPE_ONE_TIME_CODE
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_One_Time_Code_17100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_One_Time_Code_17100 start====");
          let result: number = testNapi.testImeTextInputTypeOneTimeCode();
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_One_Time_Code_17100 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_Ime_Text_Input_Type_One_Time_Code_17100 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_Ime_Command_Value_Type_None_17200
     * @tc.name SUB_InputMethod_Imf_SDK_Ime_Command_Value_Type_None_17200
     * @tc.desc test IME_COMMAND_VALUE_TYPE_NONE
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_Ime_Command_Value_Type_None_17200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Command_Value_Type_None_17200 start====");
          let result: number = testNapi.testImeCommandValueTypeNone();
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Command_Value_Type_None_17200 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_Ime_Command_Value_Type_None_17200 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_Ime_Command_Value_Type_Bool_17300
     * @tc.name SUB_InputMethod_Imf_SDK_Ime_Command_Value_Type_Bool_17300
     * @tc.desc test IME_COMMAND_VALUE_TYPE_BOOL
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_Ime_Command_Value_Type_Bool_17300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Command_Value_Type_Bool_17300 start====");
          let result: number = testNapi.testImeCommandValueTypeBool();
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Command_Value_Type_Bool_17300 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_Ime_Command_Value_Type_Bool_17300 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_Ime_Direction_Up_17400
     * @tc.name SUB_InputMethod_Imf_SDK_Ime_Direction_Up_17400
     * @tc.desc test IME_DIRECTION_UP
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_Ime_Direction_Up_17400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Direction_Up_17400 start====");
          let result: number = testNapi.testImeDirectionUp();
          let driver: Driver = Driver.create();
          await driver.triggerKey(2012);
          console.info("====>SUB_InputMethod_Imf_SDK_Ime_Direction_Up_17400 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_Ime_Direction_Up_17400 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_IME_DIRECTION_DOWN_17500
     * @tc.name SUB_InputMethod_Imf_SDK_IME_DIRECTION_DOWN_17500
     * @tc.desc test IME_DIRECTION_DOWN
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_IME_DIRECTION_DOWN_17500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_IME_DIRECTION_DOWN_17500 start====");
          let result: number = testNapi.testImeDirectionDown();
          let driver: Driver = Driver.create();
          await driver.triggerKey(2013);
          console.info("====>SUB_InputMethod_Imf_SDK_IME_DIRECTION_DOWN_17500 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_IME_DIRECTION_DOWN_17500 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_IME_DIRECTION_LEFT_17600
     * @tc.name SUB_InputMethod_Imf_SDK_IME_DIRECTION_LEFT_17600
     * @tc.desc test IME_DIRECTION_LEFT
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_IME_DIRECTION_LEFT_17600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_IME_DIRECTION_LEFT_17600 start====");
          let result: number = testNapi.testImeDirectionLeft();
          let driver: Driver = Driver.create();
          await driver.triggerKey(2014);
          console.info("====>SUB_InputMethod_Imf_SDK_IME_DIRECTION_LEFT_17600 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_IME_DIRECTION_LEFT_17600 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_IME_DIRECTION_RIGHT_17700
     * @tc.name SUB_InputMethod_Imf_SDK_IME_DIRECTION_RIGHT_17700
     * @tc.desc test IME_DIRECTION_RIGHT
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_IME_DIRECTION_RIGHT_17700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_IME_DIRECTION_RIGHT_17700 start====");
          let result: number = testNapi.testImeDirectionRight();
          let driver: Driver = Driver.create();
          await driver.triggerKey(2015);
          console.info("====>SUB_InputMethod_Imf_SDK_IME_DIRECTION_RIGHT_17700 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_IME_DIRECTION_RIGHT_17700 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })
  })
}