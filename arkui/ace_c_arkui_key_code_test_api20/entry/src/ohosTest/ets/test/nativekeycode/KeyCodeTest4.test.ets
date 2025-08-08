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

export default function KeyCodeNdkTest4() {
  describe('KeyCodeNdkTest4', () => {
    beforeAll(async (done: Function) => {
      await Utils.pushPageNoClear(`KeyCodeTest/KeyCodeTest4`, done);
    });
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_ADDRESSBOOK_0100
     * @tc.name    : getKeyCodeEventAddressbook0100
     * @tc.desc    : Test whether the key KEY_ADDRESSBOOK are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_ADDRESSBOOK_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2709, keyCodeNdk.GetKeyCodeEventAddressbook)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_MESSENGER_0100
     * @tc.name    : getKeyCodeEventMessenger0100
     * @tc.desc    : Test whether the key KEY_MESSENGER are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_MESSENGER_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2710, keyCodeNdk.GetKeyCodeEventMessenger)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BRIGHTNESS_TOGGLE_0100
     * @tc.name    : getKeyCodeEventBrightnessToggle0100
     * @tc.desc    : Test whether the key KEY_BRIGHTNESS_TOGGLE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_BRIGHTNESS_TOGGLE_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2711, keyCodeNdk.GetKeyCodeEventBrightnessToggle)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SPELLCHECK_0100
     * @tc.name    : getKeyCodeEventSpellcheck0100
     * @tc.desc    : Test whether the key KEY_SPELLCHECK are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_SPELLCHECK_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2712, keyCodeNdk.GetKeyCodeEventSpellcheck)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_COFFEE_0100
     * @tc.name    : getKeyCodeEventCoffee0100
     * @tc.desc    : Test whether the key KEY_COFFEE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_COFFEE_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2713, keyCodeNdk.GetKeyCodeEventCoffee)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_REPEAT_0100
     * @tc.name    : getKeyCodeEventMediaRepeat0100
     * @tc.desc    : Test whether the key KEY_MEDIA_REPEAT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_REPEAT_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2714, keyCodeNdk.GetKeyCodeEventMediaRepeat)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_IMAGES_0100
     * @tc.name    : getKeyCodeEventImages0100
     * @tc.desc    : Test whether the key KEY_IMAGES are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_IMAGES_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2715, keyCodeNdk.GetKeyCodeEventImages)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BUTTONCONFIG_0100
     * @tc.name    : getKeyCodeEventButtonconfig0100
     * @tc.desc    : Test whether the key KEY_BUTTONCONFIG are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_BUTTONCONFIG_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2716, keyCodeNdk.GetKeyCodeEventButtonconfig)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_TASKMANAGER_0100
     * @tc.name    : getKeyCodeEventTaskmanager0100
     * @tc.desc    : Test whether the key KEY_TASKMANAGER are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_TASKMANAGER_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2717, keyCodeNdk.GetKeyCodeEventTaskmanager)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_JOURNAL_0100
     * @tc.name    : getKeyCodeEventJournal0100
     * @tc.desc    : Test whether the key KEY_JOURNAL are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_JOURNAL_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2718, keyCodeNdk.GetKeyCodeEventJournal)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_CONTROLPANEL_0100
     * @tc.name    : getKeyCodeEventControlpanel0100
     * @tc.desc    : Test whether the key KEY_CONTROLPANEL are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_CONTROLPANEL_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2719, keyCodeNdk.GetKeyCodeEventControlpanel)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_APPSELECT_0100
     * @tc.name    : getKeyCodeEventAppselect0100
     * @tc.desc    : Test whether the key KEY_APPSELECT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_APPSELECT_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2720, keyCodeNdk.GetKeyCodeEventAppselect)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SCREENSAVER_0100
     * @tc.name    : getKeyCodeEventScreensaver0100
     * @tc.desc    : Test whether the key KEY_SCREENSAVER are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_SCREENSAVER_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2721, keyCodeNdk.GetKeyCodeEventScreensaver)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_ASSISTANT_0100
     * @tc.name    : getKeyCodeEventAssistant0100
     * @tc.desc    : Test whether the key KEY_ASSISTANT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_ASSISTANT_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2722, keyCodeNdk.GetKeyCodeEventAssistant)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_KBD_LAYOUT_NEXT_0100
     * @tc.name    : getKeyCodeEventKbdLayoutNext0100
     * @tc.desc    : Test whether the key KEY_KBD_LAYOUT_NEXT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_KBD_LAYOUT_NEXT_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2723, keyCodeNdk.GetKeyCodeEventKbdLayoutNext)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BRIGHTNESS_MIN_0100
     * @tc.name    : getKeyCodeEventBrightnessMin0100
     * @tc.desc    : Test whether the key KEY_BRIGHTNESS_MIN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_BRIGHTNESS_MIN_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2724, keyCodeNdk.GetKeyCodeEventBrightnessMin)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BRIGHTNESS_MAX_0100
     * @tc.name    : getKeyCodeEventBrightnessMax0100
     * @tc.desc    : Test whether the key KEY_BRIGHTNESS_MAX are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_BRIGHTNESS_MAX_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2725, keyCodeNdk.GetKeyCodeEventBrightnessMax)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_KBDINPUTASSIST_PREV_0100
     * @tc.name    : getKeyCodeEventKbdinputassistPrev0100
     * @tc.desc    : Test whether the key KEY_KBDINPUTASSIST_PREV are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_KBDINPUTASSIST_PREV_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2726, keyCodeNdk.GetKeyCodeEventKbdinputassistPrev)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_KBDINPUTASSIST_NEXT_0100
     * @tc.name    : getKeyCodeEventKbdinputassistNext0100
     * @tc.desc    : Test whether the key KEY_KBDINPUTASSIST_NEXT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_KBDINPUTASSIST_NEXT_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2727, keyCodeNdk.GetKeyCodeEventKbdinputassistNext)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_KBDINPUTASSIST_PREVGROUP_0100
     * @tc.name    : getKeyCodeEventKbdinputassistPrevgroup0100
     * @tc.desc    : Test whether the key KEY_KBDINPUTASSIST_PREVGROUP are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_KBDINPUTASSIST_PREVGROUP_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2728, keyCodeNdk.GetKeyCodeEventKbdinputassistPrevgroup)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_KBDINPUTASSIST_NEXTGROUP_0100
     * @tc.name    : getKeyCodeEventKbdinputassistNextgroup0100
     * @tc.desc    : Test whether the key KEY_KBDINPUTASSIST_NEXTGROUP are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_KBDINPUTASSIST_NEXTGROUP_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2729, keyCodeNdk.GetKeyCodeEventKbdinputassistNextgroup)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_KBDINPUTASSIST_ACCEPT_0100
     * @tc.name    : getKeyCodeEventKbdinputassistAccept0100
     * @tc.desc    : Test whether the key KEY_KBDINPUTASSIST_ACCEPT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_KBDINPUTASSIST_ACCEPT_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2730, keyCodeNdk.GetKeyCodeEventKbdinputassistAccept)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_KBDINPUTASSIST_CANCEL_0100
     * @tc.name    : getKeyCodeEventKbdinputassistCancel0100
     * @tc.desc    : Test whether the key KEY_KBDINPUTASSIST_CANCEL are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_KBDINPUTASSIST_CANCEL_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2731, keyCodeNdk.GetKeyCodeEventKbdinputassistCancel)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_FRONT_0100
     * @tc.name    : getKeyCodeEventFront0100
     * @tc.desc    : Test whether the key KEY_FRONT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_FRONT_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2800, keyCodeNdk.GetKeyCodeEventFront)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SETUP_0100
     * @tc.name    : getKeyCodeEventSetup0100
     * @tc.desc    : Test whether the key KEY_SETUP are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_SETUP_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2801, keyCodeNdk.GetKeyCodeEventSetup)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_WAKEUP_0100
     * @tc.name    : getKeyCodeEventWakeup0100
     * @tc.desc    : Test whether the key KEY_WAKEUP are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_WAKEUP_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2802, keyCodeNdk.GetKeyCodeEventWakeup)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SENDFILE_0100
     * @tc.name    : getKeyCodeEventSendfile0100
     * @tc.desc    : Test whether the key KEY_SENDFILE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_SENDFILE_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2803, keyCodeNdk.GetKeyCodeEventSendfile)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_DELETEFILE_0100
     * @tc.name    : getKeyCodeEventDeletefile0100
     * @tc.desc    : Test whether the key KEY_DELETEFILE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_DELETEFILE_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2804, keyCodeNdk.GetKeyCodeEventDeletefile)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_XFER_0100
     * @tc.name    : getKeyCodeEventXfer0100
     * @tc.desc    : Test whether the key KEY_XFER are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_XFER_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2805, keyCodeNdk.GetKeyCodeEventXfer)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_PROG1_0100
     * @tc.name    : getKeyCodeEventProg01001
     * @tc.desc    : Test whether the key KEY_PROG1 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_PROG1_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2806, keyCodeNdk.GetKeyCodeEventProg1)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_PROG2_0100
     * @tc.name    : getKeyCodeEventProg01002
     * @tc.desc    : Test whether the key KEY_PROG2 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_PROG2_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2807, keyCodeNdk.GetKeyCodeEventProg2)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_MSDOS_0100
     * @tc.name    : getKeyCodeEventMsdos0100
     * @tc.desc    : Test whether the key KEY_MSDOS are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_MSDOS_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2808, keyCodeNdk.GetKeyCodeEventMsdos)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SCREENLOCK_0100
     * @tc.name    : getKeyCodeEventScreenlock0100
     * @tc.desc    : Test whether the key KEY_SCREENLOCK are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_SCREENLOCK_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2809, keyCodeNdk.GetKeyCodeEventScreenlock)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_DIRECTION_ROTATE_DISPLAY_0100
     * @tc.name    : getKeyCodeEventDirectionRotateDisplay0100
     * @tc.desc    : Test whether the key KEY_DIRECTION_ROTATE_DISPLAY are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_DIRECTION_ROTATE_DISPLAY_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2810, keyCodeNdk.GetKeyCodeEventDirectionRotateDisplay)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_CYCLEWINDOWS_0100
     * @tc.name    : getKeyCodeEventCyclewindows0100
     * @tc.desc    : Test whether the key KEY_CYCLEWINDOWS are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_CYCLEWINDOWS_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2811, keyCodeNdk.GetKeyCodeEventCyclewindows)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_COMPUTER_0100
     * @tc.name    : getKeyCodeEventComputer0100
     * @tc.desc    : Test whether the key KEY_COMPUTER are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_COMPUTER_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2812, keyCodeNdk.GetKeyCodeEventComputer)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_EJECTCLOSECD_0100
     * @tc.name    : getKeyCodeEventEjectclosecd0100
     * @tc.desc    : Test whether the key KEY_EJECTCLOSECD are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_EJECTCLOSECD_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2813, keyCodeNdk.GetKeyCodeEventEjectclosecd)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_ISO_0100
     * @tc.name    : getKeyCodeEventIso0100
     * @tc.desc    : Test whether the key KEY_ISO are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_ISO_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2814, keyCodeNdk.GetKeyCodeEventIso)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_MOVE_0100
     * @tc.name    : getKeyCodeEventMove0100
     * @tc.desc    : Test whether the key KEY_MOVE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_MOVE_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2815, keyCodeNdk.GetKeyCodeEventMove)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F13_0100
     * @tc.name    : getKeyCodeEventF010013
     * @tc.desc    : Test whether the key KEY_F13 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_F13_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2816, keyCodeNdk.GetKeyCodeEventF13)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F14_0100
     * @tc.name    : getKeyCodeEventF010014
     * @tc.desc    : Test whether the key KEY_F14 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_F14_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2817, keyCodeNdk.GetKeyCodeEventF14)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F15_0100
     * @tc.name    : getKeyCodeEventF010015
     * @tc.desc    : Test whether the key KEY_F15 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_F15_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2818, keyCodeNdk.GetKeyCodeEventF15)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F16_0100
     * @tc.name    : getKeyCodeEventF010016
     * @tc.desc    : Test whether the key KEY_F16 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_F16_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2819, keyCodeNdk.GetKeyCodeEventF16)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F17_0100
     * @tc.name    : getKeyCodeEventF010017
     * @tc.desc    : Test whether the key KEY_F17 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_F17_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2820, keyCodeNdk.GetKeyCodeEventF17)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F18_0100
     * @tc.name    : getKeyCodeEventF010018
     * @tc.desc    : Test whether the key KEY_F18 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_F18_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2821, keyCodeNdk.GetKeyCodeEventF18)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F19_0100
     * @tc.name    : getKeyCodeEventF010019
     * @tc.desc    : Test whether the key KEY_F19 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_F19_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2822, keyCodeNdk.GetKeyCodeEventF19)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F20_0100
     * @tc.name    : getKeyCodeEventF010020
     * @tc.desc    : Test whether the key KEY_F20 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_F20_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2823, keyCodeNdk.GetKeyCodeEventF20)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F21_0100
     * @tc.name    : getKeyCodeEventF010021
     * @tc.desc    : Test whether the key KEY_F21 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_F21_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2824, keyCodeNdk.GetKeyCodeEventF21)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F22_0100
     * @tc.name    : getKeyCodeEventF010022
     * @tc.desc    : Test whether the key KEY_F22 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_F22_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2825, keyCodeNdk.GetKeyCodeEventF22)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F23_0100
     * @tc.name    : getKeyCodeEventF010023
     * @tc.desc    : Test whether the key KEY_F23 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_F23_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2826, keyCodeNdk.GetKeyCodeEventF23)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F24_0100
     * @tc.name    : getKeyCodeEventF010024
     * @tc.desc    : Test whether the key KEY_F24 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_F24_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2827, keyCodeNdk.GetKeyCodeEventF24)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_PROG3_0100
     * @tc.name    : getKeyCodeEventProg01003
     * @tc.desc    : Test whether the key KEY_PROG3 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_PROG3_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2828, keyCodeNdk.GetKeyCodeEventProg3)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_PROG4_0100
     * @tc.name    : getKeyCodeEventProg01004
     * @tc.desc    : Test whether the key KEY_PROG4 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_PROG4_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2829, keyCodeNdk.GetKeyCodeEventProg4)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_DASHBOARD_0100
     * @tc.name    : getKeyCodeEventDashboard0100
     * @tc.desc    : Test whether the key KEY_DASHBOARD are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_DASHBOARD_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2830, keyCodeNdk.GetKeyCodeEventDashboard)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SUSPEND_0100
     * @tc.name    : getKeyCodeEventSuspend0100
     * @tc.desc    : Test whether the key KEY_SUSPEND are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_SUSPEND_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2831, keyCodeNdk.GetKeyCodeEventSuspend)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_HP_0100
     * @tc.name    : getKeyCodeEventHp0100
     * @tc.desc    : Test whether the key KEY_HP are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_HP_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2832, keyCodeNdk.GetKeyCodeEventHp)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SOUND_0100
     * @tc.name    : getKeyCodeEventSound0100
     * @tc.desc    : Test whether the key KEY_SOUND are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_SOUND_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2833, keyCodeNdk.GetKeyCodeEventSound)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_QUESTION_0100
     * @tc.name    : getKeyCodeEventQuestion0100
     * @tc.desc    : Test whether the key KEY_QUESTION are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_QUESTION_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2834, keyCodeNdk.GetKeyCodeEventQuestion)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_CONNECT_0100
     * @tc.name    : getKeyCodeEventConnect0100
     * @tc.desc    : Test whether the key KEY_CONNECT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_CONNECT_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2836, keyCodeNdk.GetKeyCodeEventConnect)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SPORT_0100
     * @tc.name    : getKeyCodeEventSport0100
     * @tc.desc    : Test whether the key KEY_SPORT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_SPORT_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2837, keyCodeNdk.GetKeyCodeEventSport)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SHOP_0100
     * @tc.name    : getKeyCodeEventShop0100
     * @tc.desc    : Test whether the key KEY_SHOP are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_SHOP_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2838, keyCodeNdk.GetKeyCodeEventShop)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_ALTERASE_0100
     * @tc.name    : getKeyCodeEventAlterase0100
     * @tc.desc    : Test whether the key KEY_ALTERASE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_ALTERASE_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2839, keyCodeNdk.GetKeyCodeEventAlterase)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SWITCHVIDEOMODE_0100
     * @tc.name    : getKeyCodeEventSwitchvideomode0100
     * @tc.desc    : Test whether the key KEY_SWITCHVIDEOMODE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_SWITCHVIDEOMODE_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2841, keyCodeNdk.GetKeyCodeEventSwitchvideomode)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BATTERY_0100
     * @tc.name    : getKeyCodeEventBattery0100
     * @tc.desc    : Test whether the key KEY_BATTERY are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_BATTERY_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2842, keyCodeNdk.GetKeyCodeEventBattery)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BLUETOOTH_0100
     * @tc.name    : getKeyCodeEventBluetooth0100
     * @tc.desc    : Test whether the key KEY_BLUETOOTH are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_BLUETOOTH_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2843, keyCodeNdk.GetKeyCodeEventBluetooth)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_WLAN_0100
     * @tc.name    : getKeyCodeEventWlan0100
     * @tc.desc    : Test whether the key KEY_WLAN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_WLAN_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2844, keyCodeNdk.GetKeyCodeEventWlan)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_UWB_0100
     * @tc.name    : getKeyCodeEventUwb0100
     * @tc.desc    : Test whether the key KEY_UWB are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_UWB_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2845, keyCodeNdk.GetKeyCodeEventUwb)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_WWAN_WIMAX_0100
     * @tc.name    : getKeyCodeEventWwanWimax0100
     * @tc.desc    : Test whether the key KEY_WWAN_WIMAX are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_WWAN_WIMAX_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2846, keyCodeNdk.GetKeyCodeEventWwanWimax)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_RFKILL_0100
     * @tc.name    : getKeyCodeEventRfkill0100
     * @tc.desc    : Test whether the key KEY_RFKILL are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_RFKILL_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 2847, keyCodeNdk.GetKeyCodeEventRfkill)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_CHANNEL_0100
     * @tc.name    : getKeyCodeEventChannel0100
     * @tc.desc    : Test whether the key KEY_CHANNEL are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_CHANNEL_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 3001, keyCodeNdk.GetKeyCodeEventChannel)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BTN_0_0100
     * @tc.name    : getKeyCodeEventBtn01000
     * @tc.desc    : Test whether the key KEY_BTN_0 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_BTN_0_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 3100, keyCodeNdk.GetKeyCodeEventBtn0)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BTN_1_0100
     * @tc.name    : getKeyCodeEventBtn01001
     * @tc.desc    : Test whether the key KEY_BTN_1 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_BTN_1_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 3101, keyCodeNdk.GetKeyCodeEventBtn1)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BTN_2_0100
     * @tc.name    : getKeyCodeEventBtn01002
     * @tc.desc    : Test whether the key KEY_BTN_2 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_BTN_2_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 3102, keyCodeNdk.GetKeyCodeEventBtn2)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BTN_3_0100
     * @tc.name    : getKeyCodeEventBtn01003
     * @tc.desc    : Test whether the key KEY_BTN_3 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_BTN_3_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 3103, keyCodeNdk.GetKeyCodeEventBtn3)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BTN_4_0100
     * @tc.name    : getKeyCodeEventBtn01004
     * @tc.desc    : Test whether the key KEY_BTN_4 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_BTN_4_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 3104, keyCodeNdk.GetKeyCodeEventBtn4)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BTN_5_0100
     * @tc.name    : getKeyCodeEventBtn01005
     * @tc.desc    : Test whether the key KEY_BTN_5 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_BTN_5_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 3105, keyCodeNdk.GetKeyCodeEventBtn5)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BTN_6_0100
     * @tc.name    : getKeyCodeEventBtn01006
     * @tc.desc    : Test whether the key KEY_BTN_6 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_BTN_6_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 3106, keyCodeNdk.GetKeyCodeEventBtn6)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BTN_7_0100
     * @tc.name    : getKeyCodeEventBtn01007
     * @tc.desc    : Test whether the key KEY_BTN_7 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_BTN_7_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 3107, keyCodeNdk.GetKeyCodeEventBtn7)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BTN_8_0100
     * @tc.name    : getKeyCodeEventBtn01008
     * @tc.desc    : Test whether the key KEY_BTN_8 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_BTN_8_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 3108, keyCodeNdk.GetKeyCodeEventBtn8)
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BTN_9_0100
     * @tc.name    : getKeyCodeEventBtn01009
     * @tc.desc    : Test whether the key KEY_BTN_9 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    Utils.keydo('SUB_ARKUI_ACE_ENGINE_KEY_BTN_9_0100', TestType.FUNCTION |
        Size.MEDIUMTEST | Level.LEVEL1, 3109, keyCodeNdk.GetKeyCodeEventBtn9)
  })
}
