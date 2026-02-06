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

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0010
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0010
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_FN == 0).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0020
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0020
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0020 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_UNKNOWN == -1).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0020 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0030
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0030
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0030
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0030 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_HOME == 1).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0030 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0040
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0040
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0040
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0040 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BACK == 2).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0040 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0050
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0050
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0050 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MEDIA_PLAY_PAUSE == 10).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0050 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0060
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0060
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0060
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0060 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MEDIA_STOP == 11).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0060 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0070
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0070
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0070
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0070 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MEDIA_NEXT == 12).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0070 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0080
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0080
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0080
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0080 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MEDIA_PREVIOUS == 13).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0080 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0090
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0090
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0090
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0090 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MEDIA_REWIND == 14).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0090 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0100
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0100
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0100 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MEDIA_FAST_FORWARD == 15).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0100 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0110
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0110
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0110
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0110 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_VOLUME_UP == 16).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0110 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0120
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0120
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0120 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_VOLUME_DOWN == 17).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0120 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0130
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0130
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0130
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0130 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_POWER == 18).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0130 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0140
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0140
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0140
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0140 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CAMERA == 19).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0140 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0150
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0150
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0150
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0150 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_VOLUME_MUTE == 22).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0150 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0160
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0160
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0160 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MUTE == 23).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0160 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0170
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0170
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0170
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0170 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BRIGHTNESS_UP == 40).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0170 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0180
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0180
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0180
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0180 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BRIGHTNESS_DOWN == 41).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0180 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0190
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0190
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0190
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0190 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_0 == 2000).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0190 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0200
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0200
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0200 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_1 == 2001).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0200 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0210
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0210
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0210
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0210 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_2 == 2002).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0210 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0220
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0220
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0220
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0220 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_3 == 2003).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0220 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0230
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0230
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0230
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0230 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_4 == 2004).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0230 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0240
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0240
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0240 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_5 == 2005).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0240 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0250
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0250
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0250
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_6 == 2006).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })


    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0260
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0260
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0260
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_7 == 2007).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0270
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0270
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0270
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_8 == 2008).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0280
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0280
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0280
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_9 == 2009).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0290
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0290
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0290
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_STAR == 2010).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0300
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0300
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_POUND == 2011).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0310
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0310
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0310
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_DPAD_UP == 2012).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0320
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0320
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_DPAD_DOWN == 2013).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0330
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0330
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0330
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_DPAD_LEFT == 2014).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0340
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0340
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0340
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_DPAD_RIGHT == 2015).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0350
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0350
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0350
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_DPAD_CENTER == 2016).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0360
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0360
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0360
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_A == 2017).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0370
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0370
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0370
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_B == 2018).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0380
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0380
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0380
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_C == 2019).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0390
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0390
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0390
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_D == 2020).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0400
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0400
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_E == 2021).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0410
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0410
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0410
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F == 2022).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0420
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0420
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0420
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_G == 2023).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0430
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0430
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0430
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_H == 2024).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0440
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0440
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0440
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_I == 2025).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0450
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0450
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0450
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_J == 2026).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0460
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0460
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0460
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_K == 2027).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0470
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0470
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0470
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_L == 2028).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0480
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0480
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0480
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_M == 2029).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0490
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0490
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0490
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_N == 2030).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0500
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0500
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_O == 2031).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0510
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0510
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0510
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_P == 2032).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0520
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0520
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0520
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_Q == 2033).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0530
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0530
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0530
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_R == 2034).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0540
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0540
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0540
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_S == 2035).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0550
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0550
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0550
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_T == 2036).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0560
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0560
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0560
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_U == 2037).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0570
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0570
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0570
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_V == 2038).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0580
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0580
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0580
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_W == 2039).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0590
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0590
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0590
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_X == 2040).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0600
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0600
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_Y == 2041).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0610
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0610
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0610
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_Z == 2042).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0620
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0620
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0620
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_COMMA == 2043).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0630
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0630
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0630
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PERIOD == 2044).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0640
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0640
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_ALT_LEFT == 2045).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0650
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0650
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0650
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_ALT_RIGHT == 2046).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0660
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0660
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0660
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SHIFT_LEFT == 2047).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0670
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0670
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0670
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SHIFT_RIGHT == 2048).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0680
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0680
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0680
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_TAB == 2049).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0690
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0690
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0690
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SPACE == 2050).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0700
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0700
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SYM == 2051).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0710
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0710
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0710
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_EXPLORER == 2052).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0720
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0720
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0720
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_ENVELOPE == 2053).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0730
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0730
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0730
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_ENTER == 2054).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0740
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0740
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0740
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_DEL == 2055).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0750
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0750
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0750
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_GRAVE == 2056).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0760
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0760
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0760
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MINUS == 2057).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0770
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0770
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0770
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_EQUALS == 2058).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0780
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0780
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0780
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_LEFT_BRACKET == 2059).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0790
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0790
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0790
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_RIGHT_BRACKET == 2060).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0800
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0800
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BACKSLASH == 2061).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0810
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0810
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0810
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SEMICOLON == 2062).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0820
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0820
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0820
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_APOSTROPHE == 2063).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0830
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0830
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0830
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SLASH == 2064).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0840
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0840
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0840
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_AT == 2065).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0850
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0850
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0850
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PLUS == 2066).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0860
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0860
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0860
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MENU == 2067).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0870
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0870
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0870
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PAGE_UP == 2068).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0880
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0880
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0880
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PAGE_DOWN == 2069).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0890
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0890
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0890
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_ESCAPE == 2070).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0900
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0900
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_FORWARD_DEL == 2071).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0910
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0910
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0910
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CTRL_LEFT == 2072).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0920
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0920
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0920
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CTRL_RIGHT == 2073).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0930
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0930
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0930
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CAPS_LOCK == 2074).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0940
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0940
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0940
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SCROLL_LOCK == 2075).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0950
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0950
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0950
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_META_LEFT == 2076).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0960
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0960
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0960
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_META_RIGHT == 2077).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0970
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0970
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0970
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_FUNCTION == 2078).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0980
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0980
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0980
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SYSRQ == 2079).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0990
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0990
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0990
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_0990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BREAK == 2080).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_0010 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_1000
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_1000
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_1000 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MOVE_HOME == 2081).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_1000 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_101
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_101
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_101 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MOVE_END == 2082).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_101 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_102
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_102
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_102 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_INSERT == 2083).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_102 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_103
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_103
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_103 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_FORWARD == 2084).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_103 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_104
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_104
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_104 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MEDIA_PLAY == 2085).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_104 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_105
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_105
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_105
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_105 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MEDIA_PAUSE == 2086).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_105 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_106
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_106
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_106
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_106 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MEDIA_CLOSE == 2087).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_106 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_107
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_107
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_107
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_107 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MEDIA_EJECT == 2088).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_107 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_108
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_108
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_108
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_108 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MEDIA_RECORD == 2089).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_108 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_109
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_109
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_109
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_109 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F1 == 2090).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_109 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_110
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_110
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_110
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_110 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F2 == 2091).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_110 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_111
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_111
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_111
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_111 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F3 == 2092).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_111 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_112
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_112
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_112
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_112 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F4 == 2093).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_112 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_113
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_113
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_113
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_113 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F5 == 2094).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_113 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_114
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_114
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_114
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_114 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F6 == 2095).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_114 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_115
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_115
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_115
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_115 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F7 == 2096).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_115 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_116
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_116
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_116
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_116 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F8 == 2097).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_116 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_117
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_117
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_117
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_117 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F9 == 2098).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_117 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_118
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_118
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_118
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_118 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F10 == 2099).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_118 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_119
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_119
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_119
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_119 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F11 == 2100).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_119 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_120
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_120
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_120 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F12 == 2101).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_120 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_121
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_121
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_121
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_121 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUM_LOCK == 2102).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_121 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_122
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_122
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_122
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_122 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_0 == 2103).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_122 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_123
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_123
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_123
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_123 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_1 == 2104).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_123 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_124
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_124
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_124
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_124 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_2 == 2105).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_124 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_125
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_125
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_125
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_125 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_3 == 2106).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_125 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_126
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_126
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_126
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_126 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_4 == 2107).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_126 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_127
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_127
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_127
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_127 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_5 == 2108).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_127 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_128
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_128
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_128 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_6 == 2109).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_128 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_129
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_129
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_129
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_129 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_7 == 2110).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_129 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_130
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_130
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_130
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_130 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_8 == 2111).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_130 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_131
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_131
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_131
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_131 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_9 == 2112).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_131 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_132
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_132
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_132
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_132 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_DIVIDE == 2113).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_132 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_133
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_133
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_133
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_133 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_MULTIPLY == 2114).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_133 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_134
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_134
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_134
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_134 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_SUBTRACT == 2115).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_134 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_135
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_135
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_135
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_135 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_ADD == 2116).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_135 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_136
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_136
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_136
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_136 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_DOT == 2117).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_136 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_137
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_137
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_137
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_137 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_COMMA == 2118).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_137 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_138
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_138
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_138
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_138 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_ENTER == 2119).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_138 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_139
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_139
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_139
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_139 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_EQUALS == 2120).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_139 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_140
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_140
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_140
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_140 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_LEFT_PAREN == 2121).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_140 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_141
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_141
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_141
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_141 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_RIGHT_PAREN == 2122).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_141 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_142
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_142
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_142
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_142 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_VIRTUAL_MULTITASK == 2210).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_142 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_143
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_143
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_143
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_143 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SLEEP == 2600).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_143 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_144
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_144
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_144
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_144 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_ZENKAKU_HANKAKU == 2601).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_144 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_145
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_145
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_145
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_145 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_102ND == 2602).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_145 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_146
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_146
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_146
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_146 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_RO == 2603).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_146 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_147
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_147
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_147
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_147 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_KATAKANA == 2604).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_147 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_148
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_148
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_148
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_148 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_HIRAGANA == 2605).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_148 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_149
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_149
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_149
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_149 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_HENKAN == 2606).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_149 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_150
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_150
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_150
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_150 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_KATAKANA_HIRAGANA == 2607).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_150 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_151
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_151
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_151
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_151 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MUHENKAN == 2608).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_151 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_152
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_152
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_152
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_152 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_LINEFEED == 2609).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_152 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_153
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_153
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_153
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_153 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MACRO == 2610).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_153 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_154
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_154
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_154
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_154 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NUMPAD_PLUSMINUS == 2611).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_154 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_155
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_155
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_155
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_155 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SCALE == 2612).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_155 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_156
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_156
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_156
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_156 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_HANGUEL == 2613).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_156 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_157
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_157
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_157
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_157 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_HANJA == 2614).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_157 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_158
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_158
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_158
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_158 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_YEN == 2615).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_158 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_159
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_159
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_159
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_159 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_STOP == 2616).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_159 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_160
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_160
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_160 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_AGAIN == 2617).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_160 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_161
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_161
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_161
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_161 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PROPS == 2618).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_161 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_162
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_162
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_162
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_162 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_UNDO == 2619).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_162 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_163
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_163
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_163
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_163 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_COPY == 2620).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_163 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_164
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_164
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_164
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_164 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_OPEN == 2621).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_164 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_165
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_165
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_165
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_165 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PASTE == 2622).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_165 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_166
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_166
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_166
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_166 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_FIND == 2623).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_166 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_167
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_167
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_167
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_167 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CUT == 2624).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_167 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_168
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_168
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_168
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_168 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_HELP == 2625).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_168 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_169
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_169
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_169
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_169 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CALC == 2626).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_169 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_170
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_170
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_170
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_170 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_FILE == 2627).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_170 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_171
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_171
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_171
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_171 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BOOKMARKS == 2628).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_171 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_172
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_172
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_172
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_172 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NEXT == 2629).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_172 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_173
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_173
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_173
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_173 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PLAYPAUSE == 2630).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_173 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_174
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_174
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_174
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_174 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PREVIOUS == 2631).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_174 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_175
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_175
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_175
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_175 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_STOPCD == 2632).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_175 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_178
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_178
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_178
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_178 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CONFIG == 2634).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_178 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_179
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_179
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_179
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_179 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_REFRESH == 2635).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_179 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_180
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_180
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_180
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_180 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_EXIT == 2636).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_180 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_181
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_181
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_181
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_181 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_EDIT == 2637).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_181 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_182
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_182
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_182
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_182 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SCROLLUP == 2638).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_182 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_183
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_183
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_183
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_183 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SCROLLDOWN == 2639).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_183 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_184
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_184
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_184
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_184 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NEW == 2640).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_184 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_186
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_186
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_186
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_186 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_REDO == 2641).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_186 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_188
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_188
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_188
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_188 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CLOSE == 2642).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_188 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_189
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_189
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_189
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_189 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PLAY == 2643).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_189 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_190
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_190
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_190
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_190 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BASSBOOST == 2644).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_190 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_192
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_192
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_192
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_192 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PRINT == 2645).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_192 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_193
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_193
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_193
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_193 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CHAT == 2646).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_193 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_194
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_194
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_194
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_194 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_FINANCE == 2647).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_194 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_195
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_195
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_195
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_195 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CANCEL == 2648).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_195 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_197
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_197
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_197
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_197 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_KBDILLUM_TOGGLE == 2649).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_197 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_198
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_198
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_198
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_198 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_KBDILLUM_DOWN == 2650).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_198 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_199
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_199
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_199
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_199 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_KBDILLUM_UP == 2651).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_199 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_200
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_200
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_200 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SEND == 2652).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_200 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_201
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_201
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_201 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_REPLY == 2653).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_201 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_203
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_203
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_203
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_203 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_FORWARDMAIL == 2654).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_203 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_205
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_205
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_205
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_205 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SAVE == 2655).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_205 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_206
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_206
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_206
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_206 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_DOCUMENTS == 2656).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_206 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_207
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_207
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_207
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_207 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_VIDEO_NEXT == 2657).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_207 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_208
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_208
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_208
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_208 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_VIDEO_PREV == 2658).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_208 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_209
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_209
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_209
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_209 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BRIGHTNESS_CYCLE == 2659).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_209 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_210
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_210
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_210
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_210 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BRIGHTNESS_ZERO == 2660).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_210 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_211
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_211
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_211
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_211 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_DISPLAY_OFF == 2661).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_211 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_212
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_212
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_212
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_212 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BTN_MISC == 2662).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_212 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_213
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_213
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_213
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_213 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_GOTO == 2663).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_213 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_214
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_214
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_214
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_214 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_INFO == 2664).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_214 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_215
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_215
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_215
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_215 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PROGRAM == 2665).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_215 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_216
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_216
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_216
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_216 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PVR == 2666).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_216 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_217
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_217
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_217
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_217 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SUBTITLE == 2667).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_217 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_218
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_218
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_218
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_218 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_FULL_SCREEN == 2668).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_218 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_219
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_219
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_219
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_219 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_KEYBOARD == 2669).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_219 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_221
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_221
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_221
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_221 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_ASPECT_RATIO == 2670).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_221 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_222
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_222
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_222
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_222 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PC == 2671).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_222 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_223
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_223
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_223
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_223 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_TV == 2672).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_223 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_224
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_224
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_224
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_224 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_TV2 == 2673).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_224 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_226
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_226
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_226
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_226 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_VCR == 2674).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_226 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_227
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_227
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_227
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_227 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_VCR2 == 2675).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_227 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_228
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_228
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_228
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_228 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SAT == 2676).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_228 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_230
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_230
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_230
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_230 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CD == 2677).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_230 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_231
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_231
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_231
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_231 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_TAPE == 2678).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_231 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_232
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_232
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_232
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_232 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_TUNER == 2679).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_232 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_233
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_233
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_233
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_233 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PLAYER == 2680).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_233 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_234
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_234
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_234
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_234 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_DVD == 2681).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_234 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_235
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_235
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_235
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_235 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_AUDIO == 2682).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_235 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_236
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_236
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_236
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_236 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_VIDEO == 2683).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_236 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_237
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_237
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_237
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_237 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MEMO == 2684).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_237 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_238
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_238
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_238
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_238 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CALENDAR == 2685).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_238 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_239
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_239
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_239
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_239 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_RED == 2686).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_239 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_240
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_240
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_240 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_GREEN == 2687).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_240 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_241
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_241
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_241
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_241 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_YELLOW == 2688).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_241 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_242
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_242
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_242
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_242 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BLUE == 2689).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_242 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_243
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_243
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_243
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_243 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CHANNELUP == 2690).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_243 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_245
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_245
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_245
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_245 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CHANNELDOWN == 2691).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_245 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_246
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_246
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_246
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_246 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_LAST == 2692).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_246 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_247
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_247
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_247
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_247 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_RESTART == 2693).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_247 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_248
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_248
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_248
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_248 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SLOW == 2694).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_248 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_249
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_249
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_249
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_249 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SHUFFLE == 2695).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_249 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_250
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_250
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_250
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_250 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_VIDEOPHONE == 2696).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_250 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_251
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_251
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_251
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_251 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_GAMES == 2697).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_251 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_252
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_252
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_252
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_252 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_ZOOMIN == 2698).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_252 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_253
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_253
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_253
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_253 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_ZOOMOUT == 2699).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_253 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_255
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_255
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_255
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_255 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_ZOOMRESET == 2700).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_255 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_256
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_256
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_256
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_256 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_WORDPROCESSOR == 2701).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_256 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_257
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_257
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_257
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_257 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_EDITOR == 2702).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_257 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_258
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_258
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_258
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_258 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SPREADSHEET == 2703).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_258 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_259
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_259
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_259
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_259 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_GRAPHICSEDITOR == 2704).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_259 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_260
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_260
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_260
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_260 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PRESENTATION == 2705).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_260 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_261
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_261
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_261
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_261 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_DATABASE == 2706).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_261 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_262
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_262
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_262
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_262 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_NEWS == 2707).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_262 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_263
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_263
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_263
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_263 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_VOICEMAIL == 2708).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_263 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_264
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_264
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_264
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_264 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_ADDRESSBOOK == 2709).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_264 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_265
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_265
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_265
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_265 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MESSENGER == 2710).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_265 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_266
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_266
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_266
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_266 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BRIGHTNESS_TOGGLE == 2711).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_266 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_267
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_267
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_267
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_267 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SPELLCHECK == 2712).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_267 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_268
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_268
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_268
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_268 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_COFFEE == 2713).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_268 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_269
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_269
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_269
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_269 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MEDIA_REPEAT == 2714).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_269 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_270
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_270
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_270
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_270 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_IMAGES == 2715).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_270 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_271
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_271
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_271
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_271 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BUTTONCONFIG == 2716).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_271 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_272
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_272
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_272
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_272 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_TASKMANAGER == 2717).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_272 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_273
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_273
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_273
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_273 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_JOURNAL == 2718).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_273 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_274
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_274
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_274
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_274 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CONTROLPANEL == 2719).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_274 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_275
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_275
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_275
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_275 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_APPSELECT == 2720).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_275 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_276
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_276
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_276
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_276 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SCREENSAVER == 2721).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_276 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_277
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_277
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_277
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_277 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_ASSISTANT == 2722).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_277 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_278
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_278
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_278
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_278 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_KBD_LAYOUT_NEXT == 2723).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_278 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_279
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_279
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_279
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_279 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BRIGHTNESS_MIN == 2724).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_279 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_280
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_280
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_280
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_280 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BRIGHTNESS_MAX == 2725).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_280 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_282
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_282
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_282
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_282 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_KBDINPUTASSIST_PREV == 2726).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_282 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_283
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_283
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_283
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_283 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_KBDINPUTASSIST_NEXT == 2727).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_283 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_284
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_284
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_284
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_284 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_KBDINPUTASSIST_PREVGROUP == 2728).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_284 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_285
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_285
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_285
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_285 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_KBDINPUTASSIST_NEXTGROUP == 2729).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_285 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_286
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_286
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_286
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_286 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_KBDINPUTASSIST_ACCEPT == 2730).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_286 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_287
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_287
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_287
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_287 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_KBDINPUTASSIST_CANCEL == 2731).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_287 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_288
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_288
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_288
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_288 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_FRONT == 2800).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_288 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_289
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_289
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_289
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_289 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SETUP == 2801).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_289 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_290
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_290
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_290
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_290 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_WAKEUP == 2802).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_290 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_293
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_293
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_293
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_293 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SENDFILE == 2803).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_293 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_294
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_294
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_294
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_294 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_DELETEFILE == 2804).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_294 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_295
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_295
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_295
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_295 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_XFER == 2805).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_295 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_296
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_296
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_296
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_296 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PROG1 == 2806).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_296 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_298
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_298
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_298
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_298 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PROG2 == 2807).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_298 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_299
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_299
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_299
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_299 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MSDOS == 2808).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_299 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_300
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_300
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_300 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SCREENLOCK == 2809).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_300 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_301
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_301
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_301
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_301 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_DIRECTION_ROTATE_DISPLAY == 2810).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_301 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_302
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_302
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_302
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_302 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CYCLEWINDOWS == 2811).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_302 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_303
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_303
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_303
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_303 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_COMPUTER == 2812).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_303 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_304
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_304
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_304
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_304 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_EJECTCLOSECD == 2813).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_304 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_305
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_305
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_305
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_305 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_ISO == 2814).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_305 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_306
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_306
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_306
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_306 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_MOVE == 2815).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_306 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_307
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_307
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_307
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_307 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F13 == 2816).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_307 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_308
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_308
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_308
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_308 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F14 == 2817).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_308 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_309
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_309
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_309
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_309 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F15 == 2818).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_309 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_310
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_310
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_310
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_310 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F16 == 2819).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_310 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_311
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_311
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_311
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_311 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F17 == 2820).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_311 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_312
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_312
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_312
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_312 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F18 == 2821).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_312 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_313
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_313
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_313
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_313 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F19 == 2822).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_313 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_315
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_315
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_315
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_315 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F20 == 2823).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_315 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_316
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_316
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_316
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_316', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_316 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F21 == 2824).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_316 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_317
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_317
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_317
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_317', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_317 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F22 == 2825).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_317 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_318
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_318
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_318
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_318', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_318 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F23 == 2826).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_318 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_319
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_319
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_319
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_319', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_319 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_F24 == 2827).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_319 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_320
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_320
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_320 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PROG3 == 2828).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_320 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_321
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_321
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_321
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_321', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_321 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_PROG4 == 2829).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_321 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_322
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_322
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_322
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_322', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_322 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_DASHBOARD == 2830).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_322 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_323
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_323
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_323
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_323', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_323 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SUSPEND == 2831).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_323 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_324
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_324
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_324
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_324', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_324 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_HP == 2832).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_324 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_325
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_325
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_325
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_325', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_325 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SOUND == 2833).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_325 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_326
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_326
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_326
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_326', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_326 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_QUESTION == 2834).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_326 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_327
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_327
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_327
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_327', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_327 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CONNECT == 2836).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_327 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_328
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_328
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_328
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_328', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_328 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SPORT == 2837).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_328 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_329
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_329
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_329
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_329', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_329 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SHOP == 2838).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_329 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_330
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_330
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_330
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_330 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_ALTERASE == 2839).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_330 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_331
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_331
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_331
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_331', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_331 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_SWITCHVIDEOMODE == 2841).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_331 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_332
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_332
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_332
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_332', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_332 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BATTERY == 2842).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_332 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_333
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_333
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_333
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_333', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_333 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BLUETOOTH == 2843).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_333 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_334
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_334
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_334
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_334', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_334 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_WLAN == 2844).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_334 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_335
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_335
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_335
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_335', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_335 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_UWB == 2845).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_335 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_336
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_336
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_336
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_336', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_336 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_WWAN_WIMAX == 2846).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_336 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_337
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_337
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_337
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_337', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_337 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_RFKILL == 2847).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_337 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_338
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_338
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_338
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_338', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_338 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_CHANNEL == 3001).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_338 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_339
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_339
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_339
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_339', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_339 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BTN_0 == 3100).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_339 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_340
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_340
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_340
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_340 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BTN_1 == 3101).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_340 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_341
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_341
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_341
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_341', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_341 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BTN_2 == 3102).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_341 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_342
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_342
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_342
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_342', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_342 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BTN_3 == 3103).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_342 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_343
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_343
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_343
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_343', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_343 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BTN_4 == 3104).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_343 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_344
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_344
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_344
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_344', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_344 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BTN_5 == 3105).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_344 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_345
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_345
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_345
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_345', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_345 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BTN_6 == 3106).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_345 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_346
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_346
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_346
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_346', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_346 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BTN_7 == 3107).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_346 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_347
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_347
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_347
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_347', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_347 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BTN_8 == 3108).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_347 exit`);
    })

    /**
     * @tc.name   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_348
     * @tc.number Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_348
     * @tc.desc   Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_348
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_KeyCode_SUB_MMI_KeyCodeTest_348', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_348 enter`);

      expect(inputkeyCode.KeyCode.KEYCODE_BTN_9 == 3109).assertTrue();

      console.info(`Multimodalinput_KeyCode_test_SUB_MMI_KeyCodeTest_348 exit`);
    })
  })
}
