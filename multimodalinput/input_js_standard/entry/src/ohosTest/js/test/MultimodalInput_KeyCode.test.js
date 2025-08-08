/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import inputkeyCode from '@ohos.multimodalInput.keyCode';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
export default function MultimodalInput_KeyCode_test() {
  describe('MultimodalInput_KeyCode_test', function () {

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0010', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_FN == 0).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0020', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0020 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_UNKNOWN == -1).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0020 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0030', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0030 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_HOME == 1).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0030 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0040', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0040 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BACK == 2).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0040 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0050', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0050 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MEDIA_PLAY_PAUSE == 10).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0050 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0060', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0060 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MEDIA_STOP == 11).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0060 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0070', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0070 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MEDIA_NEXT == 12).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0070 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0080', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0080 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MEDIA_PREVIOUS == 13).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0080 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0090', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0090 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MEDIA_REWIND == 14).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0090 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0100', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0100 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MEDIA_FAST_FORWARD == 15).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0100 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0110', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0110 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_VOLUME_UP == 16).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0110 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0120', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0120 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_VOLUME_DOWN == 17).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0120 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0130', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0130 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_POWER == 18).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0130 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0140', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0140 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CAMERA == 19).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0140 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0150', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0150 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_VOLUME_MUTE == 22).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0150 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0160', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0160 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MUTE == 23).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0160 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0170', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0170 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BRIGHTNESS_UP == 40).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0170 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0180', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0180 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BRIGHTNESS_DOWN == 41).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0180 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0190', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0190 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_0 == 2000).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0190 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0200', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0200 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_1 == 2001).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0200 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0210', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0210 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_2 == 2002).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0210 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0220', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0220 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_3 == 2003).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0220 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0230', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0230 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_4 == 2004).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0230 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0240', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0240 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_5 == 2005).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0240 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0250', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_6 == 2006).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })


    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0260', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_7 == 2007).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0270', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_8 == 2008).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0280', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_9 == 2009).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0290', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_STAR == 2010).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0300', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_POUND == 2011).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0310', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_DPAD_UP == 2012).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0320', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_DPAD_DOWN == 2013).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0330', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_DPAD_LEFT == 2014).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0340', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_DPAD_RIGHT == 2015).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0350', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_DPAD_CENTER == 2016).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0360', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_A == 2017).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0370', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_B == 2018).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0380', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_C == 2019).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0390', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_D == 2020).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0400', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_E == 2021).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0410', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F == 2022).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0420', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_G == 2023).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0430', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_H == 2024).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0440', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_I == 2025).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0450', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_J == 2026).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0460', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_K == 2027).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0470', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_L == 2028).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0480', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_M == 2029).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0490', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_N == 2030).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0500', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_O == 2031).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0510', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_P == 2032).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0520', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_Q == 2033).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0530', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_R == 2034).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0540', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_S == 2035).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0550', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_T == 2036).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0560', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_U == 2037).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0570', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_V == 2038).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0580', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_W == 2039).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0590', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_X == 2040).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0600', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_Y == 2041).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0610', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_Z == 2042).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0620', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_COMMA == 2043).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0630', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PERIOD == 2044).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0640', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_ALT_LEFT == 2045).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0650', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_ALT_RIGHT == 2046).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0660', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SHIFT_LEFT == 2047).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0670', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SHIFT_RIGHT == 2048).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0680', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_TAB == 2049).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0690', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SPACE == 2050).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0700', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SYM == 2051).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0710', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_EXPLORER == 2052).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0720', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_ENVELOPE == 2053).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0730', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_ENTER == 2054).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0740', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_DEL == 2055).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0750', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_GRAVE == 2056).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0760', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MINUS == 2057).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0770', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_EQUALS == 2058).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0780', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_LEFT_BRACKET == 2059).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0790', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_RIGHT_BRACKET == 2060).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0800', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BACKSLASH == 2061).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0810', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SEMICOLON == 2062).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0820', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_APOSTROPHE == 2063).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0830', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SLASH == 2064).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0840', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_AT == 2065).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0850', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PLUS == 2066).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0860', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MENU == 2067).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0870', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PAGE_UP == 2068).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0880', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PAGE_DOWN == 2069).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0890', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_ESCAPE == 2070).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0900', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_FORWARD_DEL == 2071).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0910', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CTRL_LEFT == 2072).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0920', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CTRL_RIGHT == 2073).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0930', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CAPS_LOCK == 2074).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0940', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SCROLL_LOCK == 2075).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0950', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_META_LEFT == 2076).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0960', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_META_RIGHT == 2077).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0970', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_FUNCTION == 2078).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0980', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SYSRQ == 2079).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0990', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BREAK == 2080).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_1000', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_1000 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MOVE_HOME == 2081).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_1000 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_101', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_101 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MOVE_END == 2082).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_101 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_102', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_102 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_INSERT == 2083).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_102 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_103', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_103 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_FORWARD == 2084).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_103 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_104', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_104 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MEDIA_PLAY == 2085).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_104 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_105', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_105 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MEDIA_PAUSE == 2086).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_105 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_106', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_106 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MEDIA_CLOSE == 2087).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_106 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_107', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_107 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MEDIA_EJECT == 2088).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_107 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_108', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_108 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MEDIA_RECORD == 2089).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_108 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_109', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_109 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F1 == 2090).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_109 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_110', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_110 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F2 == 2091).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_110 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_111', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_111 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F3 == 2092).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_111 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_112', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_112 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F4 == 2093).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_112 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_113', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_113 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F5 == 2094).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_113 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_114', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_114 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F6 == 2095).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_114 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_115', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_115 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F7 == 2096).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_115 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_116', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_116 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F8 == 2097).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_116 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_117', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_117 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F9 == 2098).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_117 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_118', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_118 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F10 == 2099).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_118 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_119', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_119 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F11 == 2100).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_119 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_120', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_120 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F12 == 2101).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_120 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_121', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_121 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUM_LOCK == 2102).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_121 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_122', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_122 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_0 == 2103).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_122 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_123', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_123 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_1 == 2104).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_123 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_124', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_124 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_2 == 2105).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_124 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_125', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_125 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_3 == 2106).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_125 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_126', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_126 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_4 == 2107).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_126 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_127', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_127 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_5 == 2108).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_127 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_128', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_128 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_6 == 2109).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_128 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_129', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_129 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_7 == 2110).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_129 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_130', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_130 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_8 == 2111).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_130 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_131', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_131 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_9 == 2112).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_131 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_132', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_132 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_DIVIDE == 2113).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_132 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_133', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_133 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_MULTIPLY == 2114).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_133 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_134', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_134 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_SUBTRACT == 2115).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_134 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_135', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_135 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_ADD == 2116).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_135 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_136', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_136 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_DOT == 2117).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_136 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_137', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_137 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_COMMA == 2118).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_137 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_138', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_138 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_ENTER == 2119).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_138 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_139', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_139 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_EQUALS == 2120).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_139 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_140', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_140 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_LEFT_PAREN == 2121).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_140 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_141', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_141 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_RIGHT_PAREN == 2122).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_141 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_142', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_142 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_VIRTUAL_MULTITASK == 2210).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_142 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_143', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_143 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SLEEP == 2600).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_143 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_144', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_144 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_ZENKAKU_HANKAKU == 2601).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_144 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_145', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_145 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_102ND == 2602).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_145 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_146', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_146 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_RO == 2603).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_146 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_147', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_147 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_KATAKANA == 2604).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_147 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_148', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_148 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_HIRAGANA == 2605).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_148 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_149', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_149 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_HENKAN == 2606).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_149 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_150', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_150 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_KATAKANA_HIRAGANA == 2607).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_150 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_151', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_151 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MUHENKAN == 2608).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_151 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_152', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_152 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_LINEFEED == 2609).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_152 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_153', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_153 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MACRO == 2610).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_153 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_154', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_154 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_PLUSMINUS == 2611).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_154 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_155', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_155 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SCALE == 2612).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_155 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_156', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_156 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_HANGUEL == 2613).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_156 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_157', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_157 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_HANJA == 2614).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_157 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_158', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_158 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_YEN == 2615).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_158 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_159', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_159 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_STOP == 2616).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_159 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_160', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_160 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_AGAIN == 2617).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_160 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_161', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_161 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PROPS == 2618).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_161 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_162', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_162 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_UNDO == 2619).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_162 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_163', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_163 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_COPY == 2620).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_163 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_164', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_164 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_OPEN == 2621).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_164 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_165', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_165 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PASTE == 2622).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_165 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_166', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_166 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_FIND == 2623).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_166 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_167', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_167 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CUT == 2624).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_167 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_168', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_168 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_HELP == 2625).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_168 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_169', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_169 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CALC == 2626).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_169 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_170', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_170 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_FILE == 2627).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_170 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_171', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_171 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BOOKMARKS == 2628).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_171 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_172', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_172 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NEXT == 2629).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_172 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_173', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_173 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PLAYPAUSE == 2630).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_173 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_174', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_174 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PREVIOUS == 2631).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_174 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_175', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_175 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_STOPCD == 2632).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_175 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_178', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_178 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CONFIG == 2634).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_178 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_179', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_179 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_REFRESH == 2635).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_179 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_180', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_180 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_EXIT == 2636).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_180 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_181', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_181 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_EDIT == 2637).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_181 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_182', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_182 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SCROLLUP == 2638).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_182 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_183', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_183 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SCROLLDOWN == 2639).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_183 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_184', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_184 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NEW == 2640).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_184 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_186', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_186 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_REDO == 2641).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_186 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_188', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_188 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CLOSE == 2642).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_188 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_189', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_189 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PLAY == 2643).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_189 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_190', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_190 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BASSBOOST == 2644).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_190 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_192', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_192 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PRINT == 2645).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_192 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_193', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_193 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CHAT == 2646).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_193 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_194', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_194 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_FINANCE == 2647).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_194 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_195', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_195 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CANCEL == 2648).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_195 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_197', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_197 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_KBDILLUM_TOGGLE == 2649).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_197 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_198', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_198 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_KBDILLUM_DOWN == 2650).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_198 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_199', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_199 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_KBDILLUM_UP == 2651).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_199 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_200', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_200 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SEND == 2652).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_200 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_201', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_201 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_REPLY == 2653).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_201 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_203', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_203 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_FORWARDMAIL == 2654).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_203 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_205', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_205 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SAVE == 2655).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_205 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_206', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_206 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_DOCUMENTS == 2656).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_206 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_207', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_207 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_VIDEO_NEXT == 2657).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_207 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_208', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_208 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_VIDEO_PREV == 2658).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_208 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_209', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_209 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BRIGHTNESS_CYCLE == 2659).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_209 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_210', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_210 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BRIGHTNESS_ZERO == 2660).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_210 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_211', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_211 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_DISPLAY_OFF == 2661).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_211 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_212', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_212 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BTN_MISC == 2662).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_212 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_213', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_213 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_GOTO == 2663).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_213 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_214', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_214 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_INFO == 2664).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_214 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_215', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_215 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PROGRAM == 2665).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_215 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_216', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_216 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PVR == 2666).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_216 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_217', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_217 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SUBTITLE == 2667).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_217 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_218', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_218 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_FULL_SCREEN == 2668).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_218 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_219', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_219 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_KEYBOARD == 2669).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_219 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_221', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_221 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_ASPECT_RATIO == 2670).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_221 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_222', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_222 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PC == 2671).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_222 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_223', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_223 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_TV == 2672).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_223 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_224', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_224 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_TV2 == 2673).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_224 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_226', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_226 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_VCR == 2674).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_226 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_227', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_227 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_VCR2 == 2675).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_227 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_228', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_228 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SAT == 2676).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_228 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_230', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_230 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CD == 2677).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_230 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_231', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_231 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_TAPE == 2678).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_231 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_232', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_232 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_TUNER == 2679).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_232 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_233', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_233 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PLAYER == 2680).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_233 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_234', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_234 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_DVD == 2681).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_234 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_235', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_235 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_AUDIO == 2682).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_235 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_236', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_236 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_VIDEO == 2683).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_236 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_237', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_237 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MEMO == 2684).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_237 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_238', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_238 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CALENDAR == 2685).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_238 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_239', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_239 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_RED == 2686).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_239 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_240', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_240 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_GREEN == 2687).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_240 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_241', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_241 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_YELLOW == 2688).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_241 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_242', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_242 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BLUE == 2689).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_242 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_243', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_243 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CHANNELUP == 2690).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_243 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_245', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_245 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CHANNELDOWN == 2691).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_245 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_246', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_246 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_LAST == 2692).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_246 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_247', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_247 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_RESTART == 2693).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_247 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_248', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_248 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SLOW == 2694).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_248 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_249', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_249 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SHUFFLE == 2695).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_249 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_250', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_250 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_VIDEOPHONE == 2696).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_250 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_251', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_251 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_GAMES == 2697).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_251 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_252', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_252 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_ZOOMIN == 2698).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_252 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_253', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_253 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_ZOOMOUT == 2699).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_253 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_255', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_255 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_ZOOMRESET == 2700).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_255 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_256', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_256 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_WORDPROCESSOR == 2701).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_256 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_257', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_257 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_EDITOR == 2702).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_257 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_258', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_258 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SPREADSHEET == 2703).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_258 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_259', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_259 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_GRAPHICSEDITOR == 2704).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_259 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_260', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_260 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PRESENTATION == 2705).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_260 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_261', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_261 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_DATABASE == 2706).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_261 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_262', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_262 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NEWS == 2707).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_262 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_263', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_263 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_VOICEMAIL == 2708).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_263 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_264', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_264 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_ADDRESSBOOK == 2709).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_264 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_265', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_265 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MESSENGER == 2710).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_265 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_266', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_266 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BRIGHTNESS_TOGGLE == 2711).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_266 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_267', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_267 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SPELLCHECK == 2712).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_267 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_268', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_268 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_COFFEE == 2713).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_268 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_269', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_269 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MEDIA_REPEAT == 2714).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_269 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_270', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_270 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_IMAGES == 2715).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_270 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_271', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_271 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BUTTONCONFIG == 2716).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_271 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_272', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_272 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_TASKMANAGER == 2717).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_272 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_273', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_273 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_JOURNAL == 2718).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_273 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_274', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_274 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CONTROLPANEL == 2719).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_274 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_275', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_275 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_APPSELECT == 2720).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_275 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_276', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_276 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SCREENSAVER == 2721).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_276 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_277', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_277 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_ASSISTANT == 2722).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_277 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_278', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_278 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_KBD_LAYOUT_NEXT == 2723).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_278 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_279', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_279 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BRIGHTNESS_MIN == 2724).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_279 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_280', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_280 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BRIGHTNESS_MAX == 2725).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_280 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_282', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_282 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_KBDINPUTASSIST_PREV == 2726).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_282 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_283', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_283 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_KBDINPUTASSIST_NEXT == 2727).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_283 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_284', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_284 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_KBDINPUTASSIST_PREVGROUP == 2728).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_284 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_285', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_285 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_KBDINPUTASSIST_NEXTGROUP == 2729).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_285 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_286', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_286 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_KBDINPUTASSIST_ACCEPT == 2730).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_286 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_287', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_287 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_KBDINPUTASSIST_CANCEL == 2731).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_287 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_288', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_288 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_FRONT == 2800).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_288 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_289', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_289 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SETUP == 2801).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_289 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_290', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_290 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_WAKEUP == 2802).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_290 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_293', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_293 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SENDFILE == 2803).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_293 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_294', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_294 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_DELETEFILE == 2804).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_294 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_295', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_295 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_XFER == 2805).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_295 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_296', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_296 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PROG1 == 2806).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_296 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_298', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_298 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PROG2 == 2807).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_298 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_299', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_299 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MSDOS == 2808).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_299 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_300', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_300 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SCREENLOCK == 2809).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_300 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_301', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_301 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_DIRECTION_ROTATE_DISPLAY == 2810).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_301 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_302', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_302 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CYCLEWINDOWS == 2811).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_302 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_303', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_303 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_COMPUTER == 2812).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_303 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_304', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_304 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_EJECTCLOSECD == 2813).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_304 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_305', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_305 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_ISO == 2814).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_305 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_306', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_306 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MOVE == 2815).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_306 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_307', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_307 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F13 == 2816).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_307 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_308', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_308 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F14 == 2817).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_308 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_309', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_309 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F15 == 2818).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_309 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_310', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_310 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F16 == 2819).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_310 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_311', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_311 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F17 == 2820).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_311 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_312', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_312 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F18 == 2821).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_312 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_313', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_313 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F19 == 2822).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_313 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_315', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_315 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F20 == 2823).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_315 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_316', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_316 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F21 == 2824).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_316 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_317', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_317 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F22 == 2825).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_317 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_318', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_318 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F23 == 2826).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_318 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_319', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_319 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F24 == 2827).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_319 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_320', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_320 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PROG3 == 2828).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_320 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_321', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_321 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PROG4 == 2829).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_321 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_322', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_322 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_DASHBOARD == 2830).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_322 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_323', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_323 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SUSPEND == 2831).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_323 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_324', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_324 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_HP == 2832).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_324 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_325', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_325 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SOUND == 2833).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_325 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_326', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_326 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_QUESTION == 2834).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_326 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_327', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_327 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CONNECT == 2836).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_327 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_328', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_328 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SPORT == 2837).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_328 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_329', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_329 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SHOP == 2838).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_329 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_330', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_330 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_ALTERASE == 2839).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_330 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_331', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_331 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SWITCHVIDEOMODE == 2841).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_331 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_332', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_332 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BATTERY == 2842).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_332 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_333', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_333 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BLUETOOTH == 2843).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_333 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_334', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_334 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_WLAN == 2844).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_334 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_335', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_335 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_UWB == 2845).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_335 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_336', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_336 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_WWAN_WIMAX == 2846).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_336 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_337', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_337 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_RFKILL == 2847).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_337 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_338', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_338 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CHANNEL == 3001).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_338 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_339', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_339 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BTN_0 == 3100).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_339 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_340', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_340 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BTN_1 == 3101).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_340 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_341', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_341 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BTN_2 == 3102).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_341 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_342', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_342 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BTN_3 == 3103).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_342 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_343', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_343 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BTN_4 == 3104).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_343 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_344', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_344 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BTN_5 == 3105).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_344 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_345', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_345 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BTN_6 == 3106).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_345 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_346', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_346 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BTN_7 == 3107).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_346 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_347', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_347 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BTN_8 == 3108).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_347 exit`);
    })

    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_348', 0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_348 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BTN_9 == 3109).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_348 exit`);
    })
  })
}
