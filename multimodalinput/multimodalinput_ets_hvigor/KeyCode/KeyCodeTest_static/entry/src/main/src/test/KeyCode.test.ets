/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { KeyCode } from '@ohos.multimodalInput.keyCode';
import { IntentionCode } from '@ohos.multimodalInput.intentionCode';
import hilog from '@ohos.hilog';
import { BusinessError } from "@ohos.base";
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function MultimodalKeyCodeTest() {
  describe("MultimodalKeyCodeTest", (): void => {
    const ExpectTrue = (n: boolean) => {
      try {
        expect(n).assertTrue();
      } catch (err) {
        console.info("expectInfo", `test failed`);
      }
    }
    const ExpectFalse = (n: boolean) => {
      try {
        expect(n).assertFail();
      } catch (err) {
        console.info("expectInfo", `test failed`);
      }
    }

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCode_0100
     * @tc.number SUB_MMI_Input_Api_KeyCode_0100
     * @tc.desc   Test keycode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_KeyCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "SUB_MMI_Input_Api_KeyCode_0100";
      hilog.info(domain, tag, `${caseName} enter`);
      try {
        ExpectTrue(KeyCode.KEYCODE_FN == 0);
        ExpectTrue(KeyCode.KEYCODE_UNKNOWN == -1);
        ExpectTrue(KeyCode.KEYCODE_HOME == 1);
        ExpectTrue(KeyCode.KEYCODE_BACK == 2);
        ExpectTrue(KeyCode.KEYCODE_SEARCH == 9);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
      hilog.info(domain, tag, `${caseName} leave`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCode_0200
     * @tc.number SUB_MMI_Input_Api_KeyCode_0200
     * @tc.desc   Test MEDIA keycode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_KeyCode_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "SUB_MMI_Input_Api_KeyCode_0200";
      hilog.info(domain, tag, `${caseName} enter`);
      try {
        ExpectTrue(KeyCode.KEYCODE_MEDIA_PLAY_PAUSE == 10);
        ExpectTrue(KeyCode.KEYCODE_MEDIA_STOP == 11);
        ExpectTrue(KeyCode.KEYCODE_MEDIA_NEXT == 12);
        ExpectTrue(KeyCode.KEYCODE_MEDIA_PREVIOUS == 13);
        ExpectTrue(KeyCode.KEYCODE_MEDIA_REWIND == 14);
        ExpectTrue(KeyCode.KEYCODE_MEDIA_FAST_FORWARD == 15);
        ExpectTrue(KeyCode.KEYCODE_VOLUME_UP == 16);
        ExpectTrue(KeyCode.KEYCODE_VOLUME_DOWN == 17);
        ExpectTrue(KeyCode.KEYCODE_POWER == 18);
        ExpectTrue(KeyCode.KEYCODE_CAMERA == 19);
        ExpectTrue(KeyCode.KEYCODE_VOLUME_MUTE == 22);
        ExpectTrue(KeyCode.KEYCODE_MUTE == 23);
        ExpectTrue(KeyCode.KEYCODE_BRIGHTNESS_UP == 40);
        ExpectTrue(KeyCode.KEYCODE_BRIGHTNESS_DOWN == 41);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
      hilog.info(domain, tag, `${caseName} leave`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCode_0300
     * @tc.number SUB_MMI_Input_Api_KeyCode_0300
     * @tc.desc   Test number keycode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_KeyCode_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "SUB_MMI_Input_Api_KeyCode_0300";
      hilog.info(domain, tag, `${caseName} enter`);
      try {
        ExpectTrue(KeyCode.KEYCODE_0 == 2000);
        ExpectTrue(KeyCode.KEYCODE_1 == 2001);
        ExpectTrue(KeyCode.KEYCODE_2 == 2002);
        ExpectTrue(KeyCode.KEYCODE_3 == 2003);
        ExpectTrue(KeyCode.KEYCODE_4 == 2004);
        ExpectTrue(KeyCode.KEYCODE_5 == 2005);
        ExpectTrue(KeyCode.KEYCODE_6 == 2006);
        ExpectTrue(KeyCode.KEYCODE_7 == 2007);
        ExpectTrue(KeyCode.KEYCODE_8 == 2008);
        ExpectTrue(KeyCode.KEYCODE_9 == 2009);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
      hilog.info(domain, tag, `${caseName} leave`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCode_0400
     * @tc.number SUB_MMI_Input_Api_KeyCode_0400
     * @tc.desc   Test DPAD keycode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_KeyCode_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "SUB_MMI_Input_Api_KeyCode_0400";
      hilog.info(domain, tag, `${caseName} enter`);
      try {
        ExpectTrue(KeyCode.KEYCODE_STAR == 2010);
        ExpectTrue(KeyCode.KEYCODE_POUND == 2011);
        ExpectTrue(KeyCode.KEYCODE_DPAD_UP == 2012);
        ExpectTrue(KeyCode.KEYCODE_DPAD_DOWN == 2013);
        ExpectTrue(KeyCode.KEYCODE_DPAD_LEFT == 2014);
        ExpectTrue(KeyCode.KEYCODE_DPAD_RIGHT == 2015);
        ExpectTrue(KeyCode.KEYCODE_DPAD_CENTER == 2016);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
      hilog.info(domain, tag, `${caseName} leave`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCode_0500
     * @tc.number SUB_MMI_Input_Api_KeyCode_0500
     * @tc.desc   Test A-Z keycode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_KeyCode_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "SUB_MMI_Input_Api_KeyCode_0500";
      hilog.info(domain, tag, `${caseName} enter`);
      try {
        ExpectTrue(KeyCode.KEYCODE_A == 2017);
        ExpectTrue(KeyCode.KEYCODE_B == 2018);
        ExpectTrue(KeyCode.KEYCODE_C == 2019);
        ExpectTrue(KeyCode.KEYCODE_D == 2020);
        ExpectTrue(KeyCode.KEYCODE_E == 2021);
        ExpectTrue(KeyCode.KEYCODE_F == 2022);
        ExpectTrue(KeyCode.KEYCODE_G == 2023);
        ExpectTrue(KeyCode.KEYCODE_H == 2024);
        ExpectTrue(KeyCode.KEYCODE_I == 2025);
        ExpectTrue(KeyCode.KEYCODE_J == 2026);
        ExpectTrue(KeyCode.KEYCODE_K == 2027);
        ExpectTrue(KeyCode.KEYCODE_L == 2028);
        ExpectTrue(KeyCode.KEYCODE_M == 2029);
        ExpectTrue(KeyCode.KEYCODE_N == 2030);
        ExpectTrue(KeyCode.KEYCODE_O == 2031);
        ExpectTrue(KeyCode.KEYCODE_P == 2032);
        ExpectTrue(KeyCode.KEYCODE_Q == 2033);
        ExpectTrue(KeyCode.KEYCODE_R == 2034);
        ExpectTrue(KeyCode.KEYCODE_S == 2035);
        ExpectTrue(KeyCode.KEYCODE_T == 2036);
        ExpectTrue(KeyCode.KEYCODE_U == 2037);
        ExpectTrue(KeyCode.KEYCODE_V == 2038);
        ExpectTrue(KeyCode.KEYCODE_W == 2039);
        ExpectTrue(KeyCode.KEYCODE_X == 2040);
        ExpectTrue(KeyCode.KEYCODE_Y == 2041);
        ExpectTrue(KeyCode.KEYCODE_Z == 2042);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
      hilog.info(domain, tag, `${caseName} leave`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCode_0600
     * @tc.number SUB_MMI_Input_Api_KeyCode_0600
     * @tc.desc   Test keyboard keycode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_KeyCode_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "SUB_MMI_Input_Api_KeyCode_0600";
      hilog.info(domain, tag, `${caseName} enter`);
      try {
        ExpectTrue(KeyCode.KEYCODE_COMMA == 2043);
        ExpectTrue(KeyCode.KEYCODE_PERIOD == 2044);
        ExpectTrue(KeyCode.KEYCODE_ALT_LEFT == 2045);
        ExpectTrue(KeyCode.KEYCODE_ALT_RIGHT == 2046);
        ExpectTrue(KeyCode.KEYCODE_SHIFT_LEFT == 2047);
        ExpectTrue(KeyCode.KEYCODE_SHIFT_RIGHT == 2048);
        ExpectTrue(KeyCode.KEYCODE_TAB == 2049);
        ExpectTrue(KeyCode.KEYCODE_SPACE == 2050);
        ExpectTrue(KeyCode.KEYCODE_SYM == 2051);
        ExpectTrue(KeyCode.KEYCODE_EXPLORER == 2052);
        ExpectTrue(KeyCode.KEYCODE_ENVELOPE == 2053);
        ExpectTrue(KeyCode.KEYCODE_ENTER == 2054);
        ExpectTrue(KeyCode.KEYCODE_DEL == 2055);
        ExpectTrue(KeyCode.KEYCODE_GRAVE == 2056);
        ExpectTrue(KeyCode.KEYCODE_MINUS == 2057);
        ExpectTrue(KeyCode.KEYCODE_EQUALS == 2058);
        ExpectTrue(KeyCode.KEYCODE_LEFT_BRACKET == 2059);
        ExpectTrue(KeyCode.KEYCODE_RIGHT_BRACKET == 2060);
        ExpectTrue(KeyCode.KEYCODE_BACKSLASH == 2061);
        ExpectTrue(KeyCode.KEYCODE_SEMICOLON == 2062);
        ExpectTrue(KeyCode.KEYCODE_APOSTROPHE == 2063);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
      hilog.info(domain, tag, `${caseName} leave`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCode_0700
     * @tc.number SUB_MMI_Input_Api_KeyCode_0700
     * @tc.desc   Test keyboard keycode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_KeyCode_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "SUB_MMI_Input_Api_KeyCode_0700";
      hilog.info(domain, tag, `${caseName} enter`);
      try {
        ExpectTrue(KeyCode.KEYCODE_SLASH == 2064);
        ExpectTrue(KeyCode.KEYCODE_AT == 2065);
        ExpectTrue(KeyCode.KEYCODE_PLUS == 2066);
        ExpectTrue(KeyCode.KEYCODE_MENU == 2067);
        ExpectTrue(KeyCode.KEYCODE_PAGE_UP == 2068);
        ExpectTrue(KeyCode.KEYCODE_PAGE_DOWN == 2069);
        ExpectTrue(KeyCode.KEYCODE_ESCAPE == 2070);
        ExpectTrue(KeyCode.KEYCODE_FORWARD_DEL == 2071);
        ExpectTrue(KeyCode.KEYCODE_CTRL_LEFT == 2072);
        ExpectTrue(KeyCode.KEYCODE_CTRL_RIGHT == 2073);
        ExpectTrue(KeyCode.KEYCODE_CAPS_LOCK == 2074);
        ExpectTrue(KeyCode.KEYCODE_SCROLL_LOCK == 2075);
        ExpectTrue(KeyCode.KEYCODE_META_LEFT == 2076);
        ExpectTrue(KeyCode.KEYCODE_META_RIGHT == 2077);
        ExpectTrue(KeyCode.KEYCODE_FUNCTION == 2078);
        ExpectTrue(KeyCode.KEYCODE_SYSRQ == 2079);
        ExpectTrue(KeyCode.KEYCODE_BREAK == 2080);
        ExpectTrue(KeyCode.KEYCODE_MOVE_HOME == 2081);
        ExpectTrue(KeyCode.KEYCODE_MOVE_END == 2082);
        ExpectTrue(KeyCode.KEYCODE_INSERT == 2083);
        ExpectTrue(KeyCode.KEYCODE_FORWARD == 2084);
        ExpectTrue(KeyCode.KEYCODE_NUM_LOCK == 2102);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
      hilog.info(domain, tag, `${caseName} leave`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCode_0800
     * @tc.number SUB_MMI_Input_Api_KeyCode_0800
     * @tc.desc   Test MEDIA keycode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_KeyCode_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "SUB_MMI_Input_Api_KeyCode_0800";
      hilog.info(domain, tag, `${caseName} enter`);
      try {
        ExpectTrue(KeyCode.KEYCODE_MEDIA_PLAY == 2085);
        ExpectTrue(KeyCode.KEYCODE_MEDIA_PAUSE == 2086);
        ExpectTrue(KeyCode.KEYCODE_MEDIA_CLOSE == 2087);
        ExpectTrue(KeyCode.KEYCODE_MEDIA_EJECT == 2088);
        ExpectTrue(KeyCode.KEYCODE_MEDIA_RECORD == 2089);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
      hilog.info(domain, tag, `${caseName} leave`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCode_0900
     * @tc.number SUB_MMI_Input_Api_KeyCode_0900
     * @tc.desc   Test F1-F24 keycode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_KeyCode_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "SUB_MMI_Input_Api_KeyCode_0900";
      hilog.info(domain, tag, `${caseName} enter`);
      try {
        ExpectTrue(KeyCode.KEYCODE_F1 == 2090);
        ExpectTrue(KeyCode.KEYCODE_F2 == 2091);
        ExpectTrue(KeyCode.KEYCODE_F3 == 2092);
        ExpectTrue(KeyCode.KEYCODE_F4 == 2093);
        ExpectTrue(KeyCode.KEYCODE_F5 == 2094);
        ExpectTrue(KeyCode.KEYCODE_F6 == 2095);
        ExpectTrue(KeyCode.KEYCODE_F7 == 2096);
        ExpectTrue(KeyCode.KEYCODE_F8 == 2097);
        ExpectTrue(KeyCode.KEYCODE_F9 == 2098);
        ExpectTrue(KeyCode.KEYCODE_F10 == 2099);
        ExpectTrue(KeyCode.KEYCODE_F11 == 2100);
        ExpectTrue(KeyCode.KEYCODE_F12 == 2101);
        ExpectTrue(KeyCode.KEYCODE_F13 == 2816);
        ExpectTrue(KeyCode.KEYCODE_F14 == 2817);
        ExpectTrue(KeyCode.KEYCODE_F15 == 2818);
        ExpectTrue(KeyCode.KEYCODE_F16 == 2819);
        ExpectTrue(KeyCode.KEYCODE_F17 == 2820);
        ExpectTrue(KeyCode.KEYCODE_F18 == 2821);
        ExpectTrue(KeyCode.KEYCODE_F19 == 2822);
        ExpectTrue(KeyCode.KEYCODE_F20 == 2823);
        ExpectTrue(KeyCode.KEYCODE_F21 == 2824);
        ExpectTrue(KeyCode.KEYCODE_F22 == 2825);
        ExpectTrue(KeyCode.KEYCODE_F23 == 2826);
        ExpectTrue(KeyCode.KEYCODE_F24 == 2827);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
      hilog.info(domain, tag, `${caseName} leave`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCode_1000
     * @tc.number SUB_MMI_Input_Api_KeyCode_1000
     * @tc.desc   Test NUMPAD keycode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_KeyCode_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "SUB_MMI_Input_Api_KeyCode_1000";
      hilog.info(domain, tag, `${caseName} enter`);
      try {
        ExpectTrue(KeyCode.KEYCODE_NUMPAD_0 == 2103);
        ExpectTrue(KeyCode.KEYCODE_NUMPAD_1 == 2104);
        ExpectTrue(KeyCode.KEYCODE_NUMPAD_2 == 2105);
        ExpectTrue(KeyCode.KEYCODE_NUMPAD_3 == 2106);
        ExpectTrue(KeyCode.KEYCODE_NUMPAD_4 == 2107);
        ExpectTrue(KeyCode.KEYCODE_NUMPAD_5 == 2108);
        ExpectTrue(KeyCode.KEYCODE_NUMPAD_6 == 2109);
        ExpectTrue(KeyCode.KEYCODE_NUMPAD_7 == 2110);
        ExpectTrue(KeyCode.KEYCODE_NUMPAD_8 == 2111);
        ExpectTrue(KeyCode.KEYCODE_NUMPAD_9 == 2112);
        ExpectTrue(KeyCode.KEYCODE_NUMPAD_DIVIDE == 2113);
        ExpectTrue(KeyCode.KEYCODE_NUMPAD_MULTIPLY == 2114);
        ExpectTrue(KeyCode.KEYCODE_NUMPAD_SUBTRACT == 2115);
        ExpectTrue(KeyCode.KEYCODE_NUMPAD_ADD == 2116);
        ExpectTrue(KeyCode.KEYCODE_NUMPAD_DOT == 2117);
        ExpectTrue(KeyCode.KEYCODE_NUMPAD_COMMA == 2118);
        ExpectTrue(KeyCode.KEYCODE_NUMPAD_ENTER == 2119);
        ExpectTrue(KeyCode.KEYCODE_NUMPAD_EQUALS == 2120);
        ExpectTrue(KeyCode.KEYCODE_NUMPAD_LEFT_PAREN == 2121);
        ExpectTrue(KeyCode.KEYCODE_NUMPAD_RIGHT_PAREN == 2122);
        ExpectTrue(KeyCode.KEYCODE_VIRTUAL_MULTITASK == 2210);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
      hilog.info(domain, tag, `${caseName} leave`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCode_1100
     * @tc.number SUB_MMI_Input_Api_KeyCode_1100
     * @tc.desc   Test BUTTON keycode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_KeyCode_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "SUB_MMI_Input_Api_KeyCode_1100";
      hilog.info(domain, tag, `${caseName} enter`);
      try {
        ExpectTrue(KeyCode.KEYCODE_BUTTON_A == 2301);
        ExpectTrue(KeyCode.KEYCODE_BUTTON_B == 2302);
        ExpectTrue(KeyCode.KEYCODE_BUTTON_X == 2304);
        ExpectTrue(KeyCode.KEYCODE_BUTTON_Y == 2305);
        ExpectTrue(KeyCode.KEYCODE_BUTTON_L1 == 2307);
        ExpectTrue(KeyCode.KEYCODE_BUTTON_R1 == 2308);
        ExpectTrue(KeyCode.KEYCODE_BUTTON_L2 == 2309);
        ExpectTrue(KeyCode.KEYCODE_BUTTON_R2 == 2310);
        ExpectTrue(KeyCode.KEYCODE_BUTTON_SELECT == 2311);
        ExpectTrue(KeyCode.KEYCODE_BUTTON_START == 2312);
        ExpectTrue(KeyCode.KEYCODE_BUTTON_MODE == 2313);
        ExpectTrue(KeyCode.KEYCODE_BUTTON_THUMBL == 2314);
        ExpectTrue(KeyCode.KEYCODE_BUTTON_THUMBR == 2315);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
      hilog.info(domain, tag, `${caseName} leave`);
    });
    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCode_1200
     * @tc.number SUB_MMI_Input_Api_KeyCode_1200
     * @tc.desc   Test keycode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_KeyCode_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "SUB_MMI_Input_Api_KeyCode_1200";
      hilog.info(domain, tag, `${caseName} enter`);
      try {
        ExpectTrue(KeyCode.KEYCODE_SLEEP == 2600);
        ExpectTrue(KeyCode.KEYCODE_ZENKAKU_HANKAKU == 2601);
        ExpectTrue(KeyCode.KEYCODE_102ND == 2602);
        ExpectTrue(KeyCode.KEYCODE_RO == 2603);
        ExpectTrue(KeyCode.KEYCODE_KATAKANA == 2604);
        ExpectTrue(KeyCode.KEYCODE_HIRAGANA == 2605);
        ExpectTrue(KeyCode.KEYCODE_HENKAN == 2606);
        ExpectTrue(KeyCode.KEYCODE_KATAKANA_HIRAGANA == 2607);
        ExpectTrue(KeyCode.KEYCODE_MUHENKAN == 2608);
        ExpectTrue(KeyCode.KEYCODE_LINEFEED == 2609);
        ExpectTrue(KeyCode.KEYCODE_MACRO == 2610);
        ExpectTrue(KeyCode.KEYCODE_NUMPAD_PLUSMINUS == 2611);
        ExpectTrue(KeyCode.KEYCODE_SCALE == 2612);
        ExpectTrue(KeyCode.KEYCODE_HANGUEL == 2613);
        ExpectTrue(KeyCode.KEYCODE_HANJA == 2614);
        ExpectTrue(KeyCode.KEYCODE_YEN == 2615);
        ExpectTrue(KeyCode.KEYCODE_STOP == 2616);
        ExpectTrue(KeyCode.KEYCODE_AGAIN == 2617);
        ExpectTrue(KeyCode.KEYCODE_PROPS == 2618);
        ExpectTrue(KeyCode.KEYCODE_UNDO == 2619);
        ExpectTrue(KeyCode.KEYCODE_COPY == 2620);
        ExpectTrue(KeyCode.KEYCODE_OPEN == 2621);
        ExpectTrue(KeyCode.KEYCODE_PASTE == 2622);
        ExpectTrue(KeyCode.KEYCODE_FIND == 2623);
        ExpectTrue(KeyCode.KEYCODE_CUT == 2624);
        ExpectTrue(KeyCode.KEYCODE_HELP == 2625);
        ExpectTrue(KeyCode.KEYCODE_CALC == 2626);
        ExpectTrue(KeyCode.KEYCODE_FILE == 2627);
        ExpectTrue(KeyCode.KEYCODE_BOOKMARKS == 2628);
        ExpectTrue(KeyCode.KEYCODE_NEXT == 2629);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
      hilog.info(domain, tag, `${caseName} leave`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCode_1300
     * @tc.number SUB_MMI_Input_Api_KeyCode_1300
     * @tc.desc   Test keycode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_KeyCode_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "SUB_MMI_Input_Api_KeyCode_1300";
      hilog.info(domain, tag, `${caseName} enter`);
      try {
        ExpectTrue(KeyCode.KEYCODE_PLAYPAUSE == 2630);
        ExpectTrue(KeyCode.KEYCODE_PREVIOUS == 2631);
        ExpectTrue(KeyCode.KEYCODE_STOPCD == 2632);
        ExpectTrue(KeyCode.KEYCODE_CONFIG == 2634);
        ExpectTrue(KeyCode.KEYCODE_REFRESH == 2635);
        ExpectTrue(KeyCode.KEYCODE_EXIT == 2636);
        ExpectTrue(KeyCode.KEYCODE_EDIT == 2637);
        ExpectTrue(KeyCode.KEYCODE_SCROLLUP == 2638);
        ExpectTrue(KeyCode.KEYCODE_SCROLLDOWN == 2639);
        ExpectTrue(KeyCode.KEYCODE_NEW == 2640);
        ExpectTrue(KeyCode.KEYCODE_REDO == 2641);
        ExpectTrue(KeyCode.KEYCODE_CLOSE == 2642);
        ExpectTrue(KeyCode.KEYCODE_PLAY == 2643);
        ExpectTrue(KeyCode.KEYCODE_BASSBOOST == 2644);
        ExpectTrue(KeyCode.KEYCODE_PRINT == 2645);
        ExpectTrue(KeyCode.KEYCODE_CHAT == 2646);
        ExpectTrue(KeyCode.KEYCODE_FINANCE == 2647);
        ExpectTrue(KeyCode.KEYCODE_CANCEL == 2648);
        ExpectTrue(KeyCode.KEYCODE_KBDILLUM_TOGGLE == 2649);
        ExpectTrue(KeyCode.KEYCODE_KBDILLUM_DOWN == 2650);
        ExpectTrue(KeyCode.KEYCODE_KBDILLUM_UP == 2651);
        ExpectTrue(KeyCode.KEYCODE_SEND == 2652);
        ExpectTrue(KeyCode.KEYCODE_REPLY == 2653);
        ExpectTrue(KeyCode.KEYCODE_FORWARDMAIL == 2654);
        ExpectTrue(KeyCode.KEYCODE_SAVE == 2655);
        ExpectTrue(KeyCode.KEYCODE_DOCUMENTS == 2656);
        ExpectTrue(KeyCode.KEYCODE_VIDEO_NEXT == 2657);
        ExpectTrue(KeyCode.KEYCODE_VIDEO_PREV == 2658);
        ExpectTrue(KeyCode.KEYCODE_BRIGHTNESS_CYCLE == 2659);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
      hilog.info(domain, tag, `${caseName} leave`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCode_1400
     * @tc.number SUB_MMI_Input_Api_KeyCode_1400
     * @tc.desc   Test keycode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_KeyCode_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "SUB_MMI_Input_Api_KeyCode_1400";
      hilog.info(domain, tag, `${caseName} enter`);
      try {
        ExpectTrue(KeyCode.KEYCODE_BRIGHTNESS_ZERO == 2660);
        ExpectTrue(KeyCode.KEYCODE_DISPLAY_OFF == 2661);
        ExpectTrue(KeyCode.KEYCODE_BTN_MISC == 2662);
        ExpectTrue(KeyCode.KEYCODE_GOTO == 2663);
        ExpectTrue(KeyCode.KEYCODE_INFO == 2664);
        ExpectTrue(KeyCode.KEYCODE_PROGRAM == 2665);
        ExpectTrue(KeyCode.KEYCODE_PVR == 2666);
        ExpectTrue(KeyCode.KEYCODE_SUBTITLE == 2667);
        ExpectTrue(KeyCode.KEYCODE_FULL_SCREEN == 2668);
        ExpectTrue(KeyCode.KEYCODE_KEYBOARD == 2669);
        ExpectTrue(KeyCode.KEYCODE_ASPECT_RATIO == 2670);
        ExpectTrue(KeyCode.KEYCODE_PC == 2671);
        ExpectTrue(KeyCode.KEYCODE_TV == 2672);
        ExpectTrue(KeyCode.KEYCODE_TV2 == 2673);
        ExpectTrue(KeyCode.KEYCODE_VCR == 2674);
        ExpectTrue(KeyCode.KEYCODE_VCR2 == 2675);
        ExpectTrue(KeyCode.KEYCODE_SAT == 2676);
        ExpectTrue(KeyCode.KEYCODE_CD == 2677);
        ExpectTrue(KeyCode.KEYCODE_TAPE == 2678);
        ExpectTrue(KeyCode.KEYCODE_TUNER == 2679);
        ExpectTrue(KeyCode.KEYCODE_PLAYER == 2680);
        ExpectTrue(KeyCode.KEYCODE_DVD == 2681);
        ExpectTrue(KeyCode.KEYCODE_AUDIO == 2682);
        ExpectTrue(KeyCode.KEYCODE_VIDEO == 2683);
        ExpectTrue(KeyCode.KEYCODE_MEMO == 2684);
        ExpectTrue(KeyCode.KEYCODE_CALENDAR == 2685);
        ExpectTrue(KeyCode.KEYCODE_RED == 2686);
        ExpectTrue(KeyCode.KEYCODE_GREEN == 2687);
        ExpectTrue(KeyCode.KEYCODE_YELLOW == 2688);
        ExpectTrue(KeyCode.KEYCODE_BLUE == 2689);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
      hilog.info(domain, tag, `${caseName} leave`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCode_1500
     * @tc.number SUB_MMI_Input_Api_KeyCode_1500
     * @tc.desc   Test keycode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_KeyCode_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "SUB_MMI_Input_Api_KeyCode_1500";
      hilog.info(domain, tag, `${caseName} enter`);
      try {
        ExpectTrue(KeyCode.KEYCODE_CHANNELUP == 2690);
        ExpectTrue(KeyCode.KEYCODE_CHANNELDOWN == 2691);
        ExpectTrue(KeyCode.KEYCODE_LAST == 2692);
        ExpectTrue(KeyCode.KEYCODE_RESTART == 2693);
        ExpectTrue(KeyCode.KEYCODE_SLOW == 2694);
        ExpectTrue(KeyCode.KEYCODE_SHUFFLE == 2695);
        ExpectTrue(KeyCode.KEYCODE_VIDEOPHONE == 2696);
        ExpectTrue(KeyCode.KEYCODE_GAMES == 2697);
        ExpectTrue(KeyCode.KEYCODE_ZOOMIN == 2698);
        ExpectTrue(KeyCode.KEYCODE_ZOOMOUT == 2699);
        ExpectTrue(KeyCode.KEYCODE_ZOOMRESET == 2700);
        ExpectTrue(KeyCode.KEYCODE_WORDPROCESSOR == 2701);
        ExpectTrue(KeyCode.KEYCODE_EDITOR == 2702);
        ExpectTrue(KeyCode.KEYCODE_SPREADSHEET == 2703);
        ExpectTrue(KeyCode.KEYCODE_GRAPHICSEDITOR == 2704);
        ExpectTrue(KeyCode.KEYCODE_PRESENTATION == 2705);
        ExpectTrue(KeyCode.KEYCODE_DATABASE == 2706);
        ExpectTrue(KeyCode.KEYCODE_NEWS == 2707);
        ExpectTrue(KeyCode.KEYCODE_VOICEMAIL == 2708);
        ExpectTrue(KeyCode.KEYCODE_ADDRESSBOOK == 2709);
        ExpectTrue(KeyCode.KEYCODE_MESSENGER == 2710);
        ExpectTrue(KeyCode.KEYCODE_BRIGHTNESS_TOGGLE == 2711);
        ExpectTrue(KeyCode.KEYCODE_SPELLCHECK == 2712);
        ExpectTrue(KeyCode.KEYCODE_COFFEE == 2713);
        ExpectTrue(KeyCode.KEYCODE_MEDIA_REPEAT == 2714);
        ExpectTrue(KeyCode.KEYCODE_IMAGES == 2715);
        ExpectTrue(KeyCode.KEYCODE_BUTTONCONFIG == 2716);
        ExpectTrue(KeyCode.KEYCODE_TASKMANAGER == 2717);
        ExpectTrue(KeyCode.KEYCODE_JOURNAL == 2718);
        ExpectTrue(KeyCode.KEYCODE_CONTROLPANEL == 2719);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
      hilog.info(domain, tag, `${caseName} leave`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCode_1600
     * @tc.number SUB_MMI_Input_Api_KeyCode_1600
     * @tc.desc   Test keycode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_KeyCode_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "SUB_MMI_Input_Api_KeyCode_1600";
      hilog.info(domain, tag, `${caseName} enter`);
      try {
        ExpectTrue(KeyCode.KEYCODE_APPSELECT == 2720);
        ExpectTrue(KeyCode.KEYCODE_SCREENSAVER == 2721);
        ExpectTrue(KeyCode.KEYCODE_ASSISTANT == 2722);
        ExpectTrue(KeyCode.KEYCODE_KBD_LAYOUT_NEXT == 2723);
        ExpectTrue(KeyCode.KEYCODE_BRIGHTNESS_MIN == 2724);
        ExpectTrue(KeyCode.KEYCODE_BRIGHTNESS_MAX == 2725);
        ExpectTrue(KeyCode.KEYCODE_KBDINPUTASSIST_PREV == 2726);
        ExpectTrue(KeyCode.KEYCODE_KBDINPUTASSIST_NEXT == 2727);
        ExpectTrue(KeyCode.KEYCODE_KBDINPUTASSIST_PREVGROUP == 2728);
        ExpectTrue(KeyCode.KEYCODE_KBDINPUTASSIST_NEXTGROUP == 2729);
        ExpectTrue(KeyCode.KEYCODE_KBDINPUTASSIST_ACCEPT == 2730);
        ExpectTrue(KeyCode.KEYCODE_KBDINPUTASSIST_CANCEL == 2731);
        ExpectTrue(KeyCode.KEYCODE_FRONT == 2800);
        ExpectTrue(KeyCode.KEYCODE_SETUP == 2801);
        ExpectTrue(KeyCode.KEYCODE_WAKEUP == 2802);
        ExpectTrue(KeyCode.KEYCODE_SENDFILE == 2803);
        ExpectTrue(KeyCode.KEYCODE_DELETEFILE == 2804);
        ExpectTrue(KeyCode.KEYCODE_XFER == 2805);
        ExpectTrue(KeyCode.KEYCODE_PROG1 == 2806);
        ExpectTrue(KeyCode.KEYCODE_PROG2 == 2807);
        ExpectTrue(KeyCode.KEYCODE_MSDOS == 2808);
        ExpectTrue(KeyCode.KEYCODE_SCREENLOCK == 2809);
        ExpectTrue(KeyCode.KEYCODE_DIRECTION_ROTATE_DISPLAY == 2810);
        ExpectTrue(KeyCode.KEYCODE_CYCLEWINDOWS == 2811);
        ExpectTrue(KeyCode.KEYCODE_COMPUTER == 2812);
        ExpectTrue(KeyCode.KEYCODE_EJECTCLOSECD == 2813);
        ExpectTrue(KeyCode.KEYCODE_ISO == 2814);
        ExpectTrue(KeyCode.KEYCODE_MOVE == 2815);
        ExpectTrue(KeyCode.KEYCODE_PROG3 == 2828);
        ExpectTrue(KeyCode.KEYCODE_PROG4 == 2829);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
      hilog.info(domain, tag, `${caseName} leave`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCode_1700
     * @tc.number SUB_MMI_Input_Api_KeyCode_1700
     * @tc.desc   Test keycode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_KeyCode_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "SUB_MMI_Input_Api_KeyCode_1700";
      hilog.info(domain, tag, `${caseName} enter`);
      try {
        ExpectTrue(KeyCode.KEYCODE_DASHBOARD == 2830);
        ExpectTrue(KeyCode.KEYCODE_SUSPEND == 2831);
        ExpectTrue(KeyCode.KEYCODE_HP == 2832);
        ExpectTrue(KeyCode.KEYCODE_SOUND == 2833);
        ExpectTrue(KeyCode.KEYCODE_QUESTION == 2834);
        ExpectTrue(KeyCode.KEYCODE_CONNECT == 2836);
        ExpectTrue(KeyCode.KEYCODE_SPORT == 2837);
        ExpectTrue(KeyCode.KEYCODE_SHOP == 2838);
        ExpectTrue(KeyCode.KEYCODE_ALTERASE == 2839);
        ExpectTrue(KeyCode.KEYCODE_SWITCHVIDEOMODE == 2841);
        ExpectTrue(KeyCode.KEYCODE_BATTERY == 2842);
        ExpectTrue(KeyCode.KEYCODE_BLUETOOTH == 2843);
        ExpectTrue(KeyCode.KEYCODE_WLAN == 2844);
        ExpectTrue(KeyCode.KEYCODE_UWB == 2845);
        ExpectTrue(KeyCode.KEYCODE_WWAN_WIMAX == 2846);
        ExpectTrue(KeyCode.KEYCODE_RFKILL == 2847);
        ExpectTrue(KeyCode.KEYCODE_CHANNEL == 3001);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
      hilog.info(domain, tag, `${caseName} leave`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCode_1800
     * @tc.number SUB_MMI_Input_Api_KeyCode_1800
     * @tc.desc   Test BTN keycode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_KeyCode_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "SUB_MMI_Input_Api_KeyCode_1800";
      hilog.info(domain, tag, `${caseName} enter`);
      try {
        ExpectTrue(KeyCode.KEYCODE_BTN_0 == 3100);
        ExpectTrue(KeyCode.KEYCODE_BTN_1 == 3101);
        ExpectTrue(KeyCode.KEYCODE_BTN_2 == 3102);
        ExpectTrue(KeyCode.KEYCODE_BTN_3 == 3103);
        ExpectTrue(KeyCode.KEYCODE_BTN_4 == 3104);
        ExpectTrue(KeyCode.KEYCODE_BTN_5 == 3105);
        ExpectTrue(KeyCode.KEYCODE_BTN_6 == 3106);
        ExpectTrue(KeyCode.KEYCODE_BTN_7 == 3107);
        ExpectTrue(KeyCode.KEYCODE_BTN_8 == 3108);
        ExpectTrue(KeyCode.KEYCODE_BTN_9 == 3109);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
      hilog.info(domain, tag, `${caseName} leave`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCode_1900
     * @tc.number SUB_MMI_Input_Api_KeyCode_1900
     * @tc.desc   Test DAGGER keycode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_KeyCode_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "SUB_MMI_Input_Api_KeyCode_1900";
      hilog.info(domain, tag, `${caseName} enter`);
      try {
        ExpectTrue(KeyCode.KEYCODE_DAGGER_CLICK == 3211);
        ExpectTrue(KeyCode.KEYCODE_DAGGER_DOUBLE_CLICK == 3212);
        ExpectTrue(KeyCode.KEYCODE_DAGGER_LONG_PRESS == 3213);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
      hilog.info(domain, tag, `${caseName} leave`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_IntentionCode_0100
     * @tc.number SUB_MMI_Input_Api_IntentionCode_0100
     * @tc.desc   Test IntentionCode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IntentionCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "SUB_MMI_Input_Api_IntentionCode_0100";
      hilog.info(domain, tag, `${caseName} enter`);
      try {
        ExpectTrue(IntentionCode.INTENTION_UNKNOWN == -1);
        ExpectTrue(IntentionCode.INTENTION_UP == 1);
        ExpectTrue(IntentionCode.INTENTION_DOWN == 2);
        ExpectTrue(IntentionCode.INTENTION_LEFT == 3);
        ExpectTrue(IntentionCode.INTENTION_RIGHT == 4);
        ExpectTrue(IntentionCode.INTENTION_SELECT == 5);
        ExpectTrue(IntentionCode.INTENTION_ESCAPE == 6);
        ExpectTrue(IntentionCode.INTENTION_BACK == 7);
        ExpectTrue(IntentionCode.INTENTION_FORWARD == 8);
        ExpectTrue(IntentionCode.INTENTION_MENU == 9);
        ExpectTrue(IntentionCode.INTENTION_PAGE_UP == 11);
        ExpectTrue(IntentionCode.INTENTION_PAGE_DOWN == 12);
        ExpectTrue(IntentionCode.INTENTION_ZOOM_OUT == 13);
        ExpectTrue(IntentionCode.INTENTION_ZOOM_IN == 14);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
      hilog.info(domain, tag, `${caseName} leave`);
    });
  })
}