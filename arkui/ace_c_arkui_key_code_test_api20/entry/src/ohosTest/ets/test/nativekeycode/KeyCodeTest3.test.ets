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

import { describe, beforeAll, TestType, Size, Level, afterAll } from '@ohos/hypium'
import keyCodeNdk from 'libkeycodendk.so'
import Utils from '../common/Utils';

export default function KeyCodeNdkTest3() {
  describe('KeyCodeNdkTest3', () => {
    beforeAll(async (done: Function) => {
      await Utils.pushPageNoClear(`KeyCodeTest/KeyCodeTest3`, done);
    });
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BOOKMARKS_0100
     * @tc.name    : getKeyCodeEventBookmarks0100
     * @tc.desc    : Test whether the key KEY_BOOKMARKS are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_BOOKMARKS_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2628, keyCodeNdk.GetKeyCodeEventBookmarks)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_NEXT_0100
     * @tc.name    : getKeyCodeEventNext0100
     * @tc.desc    : Test whether the key KEY_NEXT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_NEXT_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2629, keyCodeNdk.GetKeyCodeEventNext)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_PLAYPAUSE_0100
     * @tc.name    : getKeyCodeEventPlaypause0100
     * @tc.desc    : Test whether the key KEY_PLAYPAUSE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_PLAYPAUSE_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2630, keyCodeNdk.GetKeyCodeEventPlaypause)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_PREVIOUS_0100
     * @tc.name    : getKeyCodeEventPrevious0100
     * @tc.desc    : Test whether the key KEY_PREVIOUS are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_PREVIOUS_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2631, keyCodeNdk.GetKeyCodeEventPrevious)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_STOPCD_0100
     * @tc.name    : getKeyCodeEventStopcd0100
     * @tc.desc    : Test whether the key KEY_STOPCD are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_STOPCD_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2632, keyCodeNdk.GetKeyCodeEventStopcd)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_CONFIG_0100
     * @tc.name    : getKeyCodeEventConfig0100
     * @tc.desc    : Test whether the key KEY_CONFIG are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_CONFIG_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2634, keyCodeNdk.GetKeyCodeEventConfig)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_REFRESH_0100
     * @tc.name    : getKeyCodeEventRefresh0100
     * @tc.desc    : Test whether the key KEY_REFRESH are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_REFRESH_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2635, keyCodeNdk.GetKeyCodeEventRefresh)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_EXIT_0100
     * @tc.name    : getKeyCodeEventExit0100
     * @tc.desc    : Test whether the key KEY_EXIT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_EXIT_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2636, keyCodeNdk.GetKeyCodeEventExit)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_EDIT_0100
     * @tc.name    : getKeyCodeEventEdit0100
     * @tc.desc    : Test whether the key KEY_EDIT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_EDIT_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2637, keyCodeNdk.GetKeyCodeEventEdit)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SCROLLUP_0100
     * @tc.name    : getKeyCodeEventScrollup0100
     * @tc.desc    : Test whether the key KEY_SCROLLUP are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_SCROLLUP_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2638, keyCodeNdk.GetKeyCodeEventScrollup)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SCROLLDOWN_0100
     * @tc.name    : getKeyCodeEventScrolldown0100
     * @tc.desc    : Test whether the key KEY_SCROLLDOWN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_SCROLLDOWN_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2639, keyCodeNdk.GetKeyCodeEventScrolldown)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_NEW_0100
     * @tc.name    : getKeyCodeEventNew0100
     * @tc.desc    : Test whether the key KEY_NEW are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_NEW_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2640, keyCodeNdk.GetKeyCodeEventNew)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_REDO_0100
     * @tc.name    : getKeyCodeEventRedo0100
     * @tc.desc    : Test whether the key KEY_REDO are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_REDO_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2641, keyCodeNdk.GetKeyCodeEventRedo)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_CLOSE_0100
     * @tc.name    : getKeyCodeEventClose0100
     * @tc.desc    : Test whether the key KEY_CLOSE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_CLOSE_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2642, keyCodeNdk.GetKeyCodeEventClose)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_PLAY_0100
     * @tc.name    : getKeyCodeEventPlay0100
     * @tc.desc    : Test whether the key KEY_PLAY are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_PLAY_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2643, keyCodeNdk.GetKeyCodeEventPlay)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BASSBOOST_0100
     * @tc.name    : getKeyCodeEventBassboost0100
     * @tc.desc    : Test whether the key KEY_BASSBOOST are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_BASSBOOST_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2644, keyCodeNdk.GetKeyCodeEventBassboost)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_PRINT_0100
     * @tc.name    : getKeyCodeEventPrint0100
     * @tc.desc    : Test whether the key KEY_PRINT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_PRINT_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2645, keyCodeNdk.GetKeyCodeEventPrint)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_CHAT_0100
     * @tc.name    : getKeyCodeEventChat0100
     * @tc.desc    : Test whether the key KEY_CHAT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_CHAT_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2646, keyCodeNdk.GetKeyCodeEventChat)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_FINANCE_0100
     * @tc.name    : getKeyCodeEventFinance0100
     * @tc.desc    : Test whether the key KEY_FINANCE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_FINANCE_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2647, keyCodeNdk.GetKeyCodeEventFinance)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_CANCEL_0100
     * @tc.name    : getKeyCodeEventCancel0100
     * @tc.desc    : Test whether the key KEY_CANCEL are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_CANCEL_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2648, keyCodeNdk.GetKeyCodeEventCancel)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_KBDILLUM_TOGGLE_0100
     * @tc.name    : getKeyCodeEventKbdillumToggle0100
     * @tc.desc    : Test whether the key KEY_KBDILLUM_TOGGLE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_KBDILLUM_TOGGLE_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2649, keyCodeNdk.GetKeyCodeEventKbdillumToggle)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_KBDILLUM_DOWN_0100
     * @tc.name    : getKeyCodeEventKbdillumDown0100
     * @tc.desc    : Test whether the key KEY_KBDILLUM_DOWN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_KBDILLUM_DOWN_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2650, keyCodeNdk.GetKeyCodeEventKbdillumDown)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_KBDILLUM_UP_0100
     * @tc.name    : getKeyCodeEventKbdillumUp0100
     * @tc.desc    : Test whether the key KEY_KBDILLUM_UP are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_KBDILLUM_UP_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2651, keyCodeNdk.GetKeyCodeEventKbdillumUp)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SEND_0100
     * @tc.name    : getKeyCodeEventSend0100
     * @tc.desc    : Test whether the key KEY_SEND are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_SEND_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2652, keyCodeNdk.GetKeyCodeEventSend)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_REPLY_0100
     * @tc.name    : getKeyCodeEventReply0100
     * @tc.desc    : Test whether the key KEY_REPLY are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_REPLY_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2653, keyCodeNdk.GetKeyCodeEventReply)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_FORWARDMAIL_0100
     * @tc.name    : getKeyCodeEventForwardmail0100
     * @tc.desc    : Test whether the key KEY_FORWARDMAIL are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_FORWARDMAIL_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2654, keyCodeNdk.GetKeyCodeEventForwardmail)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SAVE_0100
     * @tc.name    : getKeyCodeEventSave0100
     * @tc.desc    : Test whether the key KEY_SAVE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_SAVE_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2655, keyCodeNdk.GetKeyCodeEventSave)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_DOCUMENTS_0100
     * @tc.name    : getKeyCodeEventDocuments0100
     * @tc.desc    : Test whether the key KEY_DOCUMENTS are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_DOCUMENTS_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2656, keyCodeNdk.GetKeyCodeEventDocuments)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_VIDEO_NEXT_0100
     * @tc.name    : getKeyCodeEventVideoNext0100
     * @tc.desc    : Test whether the key KEY_VIDEO_NEXT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_VIDEO_NEXT_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2657, keyCodeNdk.GetKeyCodeEventVideoNext)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_VIDEO_PREV_0100
     * @tc.name    : getKeyCodeEventVideoPrev0100
     * @tc.desc    : Test whether the key KEY_VIDEO_PREV are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_VIDEO_PREV_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2658, keyCodeNdk.GetKeyCodeEventVideoPrev)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BRIGHTNESS_CYCLE_0100
     * @tc.name    : getKeyCodeEventBrightnessCycle0100
     * @tc.desc    : Test whether the key KEY_BRIGHTNESS_CYCLE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_BRIGHTNESS_CYCLE_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2659, keyCodeNdk.GetKeyCodeEventBrightnessCycle)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BRIGHTNESS_ZERO_0100
     * @tc.name    : getKeyCodeEventBrightnessZero0100
     * @tc.desc    : Test whether the key KEY_BRIGHTNESS_ZERO are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_BRIGHTNESS_ZERO_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2660, keyCodeNdk.GetKeyCodeEventBrightnessZero)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_DISPLAY_OFF_0100
     * @tc.name    : getKeyCodeEventDisplayOff0100
     * @tc.desc    : Test whether the key KEY_DISPLAY_OFF are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_DISPLAY_OFF_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2661, keyCodeNdk.GetKeyCodeEventDisplayOff)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BTN_MISC_0100
     * @tc.name    : getKeyCodeEventBtnMisc0100
     * @tc.desc    : Test whether the key KEY_BTN_MISC are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_BTN_MISC_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2662, keyCodeNdk.GetKeyCodeEventBtnMisc)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_GOTO_0100
     * @tc.name    : getKeyCodeEventGoto0100
     * @tc.desc    : Test whether the key KEY_GOTO are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_GOTO_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2663, keyCodeNdk.GetKeyCodeEventGoto)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_INFO_0100
     * @tc.name    : getKeyCodeEventInfo0100
     * @tc.desc    : Test whether the key KEY_INFO are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_INFO_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2664, keyCodeNdk.GetKeyCodeEventInfo)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_PROGRAM_0100
     * @tc.name    : getKeyCodeEventProgram0100
     * @tc.desc    : Test whether the key KEY_PROGRAM are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_PROGRAM_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2665, keyCodeNdk.GetKeyCodeEventProgram)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_PVR_0100
     * @tc.name    : getKeyCodeEventPvr0100
     * @tc.desc    : Test whether the key KEY_PVR are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_PVR_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2666, keyCodeNdk.GetKeyCodeEventPvr)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SUBTITLE_0100
     * @tc.name    : getKeyCodeEventSubtitle0100
     * @tc.desc    : Test whether the key KEY_SUBTITLE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_SUBTITLE_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2667, keyCodeNdk.GetKeyCodeEventSubtitle)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_FULL_SCREEN_0100
     * @tc.name    : getKeyCodeEventFullScreen0100
     * @tc.desc    : Test whether the key KEY_FULL_SCREEN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_FULL_SCREEN_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2668, keyCodeNdk.GetKeyCodeEventFullScreen)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_KEYBOARD_0100
     * @tc.name    : getKeyCodeEventKeyboard0100
     * @tc.desc    : Test whether the key KEY_KEYBOARD are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_KEYBOARD_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2669, keyCodeNdk.GetKeyCodeEventKeyboard)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_ASPECT_RATIO_0100
     * @tc.name    : getKeyCodeEventAspectRatio0100
     * @tc.desc    : Test whether the key KEY_ASPECT_RATIO are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_ASPECT_RATIO_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2670, keyCodeNdk.GetKeyCodeEventAspectRatio)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_PC_0100
     * @tc.name    : getKeyCodeEventPc0100
     * @tc.desc    : Test whether the key KEY_PC are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_PC_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2671, keyCodeNdk.GetKeyCodeEventPc)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_TV_0100
     * @tc.name    : getKeyCodeEventTv0100
     * @tc.desc    : Test whether the key KEY_TV are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_TV_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2672, keyCodeNdk.GetKeyCodeEventTv)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_TV2_0100
     * @tc.name    : getKeyCodeEventTv01002
     * @tc.desc    : Test whether the key KEY_TV2 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_TV2_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2673, keyCodeNdk.GetKeyCodeEventTv2)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_VCR_0100
     * @tc.name    : getKeyCodeEventVcr0100
     * @tc.desc    : Test whether the key KEY_VCR are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_VCR_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2674, keyCodeNdk.GetKeyCodeEventVcr)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_VCR2_0100
     * @tc.name    : getKeyCodeEventVcr01002
     * @tc.desc    : Test whether the key KEY_VCR2 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_VCR2_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2675, keyCodeNdk.GetKeyCodeEventVcr2)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SAT_0100
     * @tc.name    : getKeyCodeEventSat0100
     * @tc.desc    : Test whether the key KEY_SAT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_SAT_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2676, keyCodeNdk.GetKeyCodeEventSat)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_CD_0100
     * @tc.name    : getKeyCodeEventCd0100
     * @tc.desc    : Test whether the key KEY_CD are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_CD_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2677, keyCodeNdk.GetKeyCodeEventCd)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_TAPE_0100
     * @tc.name    : getKeyCodeEventTape0100
     * @tc.desc    : Test whether the key KEY_TAPE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_TAPE_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2678, keyCodeNdk.GetKeyCodeEventTape)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_TUNER_0100
     * @tc.name    : getKeyCodeEventTuner0100
     * @tc.desc    : Test whether the key KEY_TUNER are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_TUNER_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2679, keyCodeNdk.GetKeyCodeEventTuner)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_PLAYER_0100
     * @tc.name    : getKeyCodeEventPlayer0100
     * @tc.desc    : Test whether the key KEY_PLAYER are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_PLAYER_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2680, keyCodeNdk.GetKeyCodeEventPlayer)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_DVD_0100
     * @tc.name    : getKeyCodeEventDvd0100
     * @tc.desc    : Test whether the key KEY_DVD are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_DVD_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2681, keyCodeNdk.GetKeyCodeEventDvd)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_AUDIO_0100
     * @tc.name    : getKeyCodeEventAudio0100
     * @tc.desc    : Test whether the key KEY_AUDIO are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_AUDIO_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2682, keyCodeNdk.GetKeyCodeEventAudio)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_VIDEO_0100
     * @tc.name    : getKeyCodeEventVideo0100
     * @tc.desc    : Test whether the key KEY_VIDEO are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_VIDEO_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2683, keyCodeNdk.GetKeyCodeEventVideo)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_MEMO_0100
     * @tc.name    : getKeyCodeEventMemo0100
     * @tc.desc    : Test whether the key KEY_MEMO are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_MEMO_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2684, keyCodeNdk.GetKeyCodeEventMemo)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_CALENDAR_0100
     * @tc.name    : getKeyCodeEventCalendar0100
     * @tc.desc    : Test whether the key KEY_CALENDAR are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_CALENDAR_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2685, keyCodeNdk.GetKeyCodeEventCalendar)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_RED_0100
     * @tc.name    : getKeyCodeEventRed0100
     * @tc.desc    : Test whether the key KEY_RED are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_RED_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2686, keyCodeNdk.GetKeyCodeEventRed)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_GREEN_0100
     * @tc.name    : getKeyCodeEventGreen0100
     * @tc.desc    : Test whether the key KEY_GREEN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_GREEN_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2687, keyCodeNdk.GetKeyCodeEventGreen)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_YELLOW_0100
     * @tc.name    : getKeyCodeEventYellow0100
     * @tc.desc    : Test whether the key KEY_YELLOW are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_YELLOW_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2688, keyCodeNdk.GetKeyCodeEventYellow)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BLUE_0100
     * @tc.name    : getKeyCodeEventBlue0100
     * @tc.desc    : Test whether the key KEY_BLUE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_BLUE_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2689, keyCodeNdk.GetKeyCodeEventBlue)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_CHANNELUP_0100
     * @tc.name    : getKeyCodeEventChannelup0100
     * @tc.desc    : Test whether the key KEY_CHANNELUP are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_CHANNELUP_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2690, keyCodeNdk.GetKeyCodeEventChannelup)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_CHANNELDOWN_0100
     * @tc.name    : getKeyCodeEventChanneldown0100
     * @tc.desc    : Test whether the key KEY_CHANNELDOWN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_CHANNELDOWN_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2691, keyCodeNdk.GetKeyCodeEventChanneldown)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_LAST_0100
     * @tc.name    : getKeyCodeEventLast0100
     * @tc.desc    : Test whether the key KEY_LAST are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_LAST_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2692, keyCodeNdk.GetKeyCodeEventLast)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_RESTART_0100
     * @tc.name    : getKeyCodeEventRestart0100
     * @tc.desc    : Test whether the key KEY_RESTART are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_RESTART_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2693, keyCodeNdk.GetKeyCodeEventRestart)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SLOW_0100
     * @tc.name    : getKeyCodeEventSlow0100
     * @tc.desc    : Test whether the key KEY_SLOW are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_SLOW_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2694, keyCodeNdk.GetKeyCodeEventSlow)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SHUFFLE_0100
     * @tc.name    : getKeyCodeEventShuffle0100
     * @tc.desc    : Test whether the key KEY_SHUFFLE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_SHUFFLE_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2695, keyCodeNdk.GetKeyCodeEventShuffle)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_VIDEOPHONE_0100
     * @tc.name    : getKeyCodeEventVideophone0100
     * @tc.desc    : Test whether the key KEY_VIDEOPHONE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_VIDEOPHONE_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2696, keyCodeNdk.GetKeyCodeEventVideophone)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_GAMES_0100
     * @tc.name    : getKeyCodeEventGames0100
     * @tc.desc    : Test whether the key KEY_GAMES are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_GAMES_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2697, keyCodeNdk.GetKeyCodeEventGames)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_ZOOMIN_0100
     * @tc.name    : getKeyCodeEventZoomin0100
     * @tc.desc    : Test whether the key KEY_ZOOMIN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_ZOOMIN_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2698, keyCodeNdk.GetKeyCodeEventZoomin)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_ZOOMOUT_0100
     * @tc.name    : getKeyCodeEventZoomout0100
     * @tc.desc    : Test whether the key KEY_ZOOMOUT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_ZOOMOUT_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2699, keyCodeNdk.GetKeyCodeEventZoomout)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_ZOOMRESET_0100
     * @tc.name    : getKeyCodeEventZoomreset0100
     * @tc.desc    : Test whether the key KEY_ZOOMRESET are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_ZOOMRESET_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2700, keyCodeNdk.GetKeyCodeEventZoomreset)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_WORDPROCESSOR_0100
     * @tc.name    : getKeyCodeEventWordprocessor0100
     * @tc.desc    : Test whether the key KEY_WORDPROCESSOR are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_WORDPROCESSOR_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2701, keyCodeNdk.GetKeyCodeEventWordprocessor)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_EDITOR_0100
     * @tc.name    : getKeyCodeEventEditor0100
     * @tc.desc    : Test whether the key KEY_EDITOR are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_EDITOR_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2702, keyCodeNdk.GetKeyCodeEventEditor)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SPREADSHEET_0100
     * @tc.name    : getKeyCodeEventSpreadsheet0100
     * @tc.desc    : Test whether the key KEY_SPREADSHEET are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_SPREADSHEET_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2703, keyCodeNdk.GetKeyCodeEventSpreadsheet)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_GRAPHICSEDITOR_0100
     * @tc.name    : getKeyCodeEventGraphicseditor0100
     * @tc.desc    : Test whether the key KEY_GRAPHICSEDITOR are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_GRAPHICSEDITOR_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2704, keyCodeNdk.GetKeyCodeEventGraphicseditor)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_PRESENTATION_0100
     * @tc.name    : getKeyCodeEventPresentation0100
     * @tc.desc    : Test whether the key KEY_PRESENTATION are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_PRESENTATION_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2705, keyCodeNdk.GetKeyCodeEventPresentation)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_DATABASE_0100
     * @tc.name    : getKeyCodeEventDatabase0100
     * @tc.desc    : Test whether the key KEY_DATABASE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_DATABASE_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2706, keyCodeNdk.GetKeyCodeEventDatabase)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_NEWS_0100
     * @tc.name    : getKeyCodeEventNews0100
     * @tc.desc    : Test whether the key KEY_NEWS are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_NEWS_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2707, keyCodeNdk.GetKeyCodeEventNews)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_VOICEMAIL_0100
     * @tc.name    : getKeyCodeEventVoicemail0100
     * @tc.desc    : Test whether the key KEY_VOICEMAIL are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_VOICEMAIL_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2708, keyCodeNdk.GetKeyCodeEventVoicemail)
  })
}
