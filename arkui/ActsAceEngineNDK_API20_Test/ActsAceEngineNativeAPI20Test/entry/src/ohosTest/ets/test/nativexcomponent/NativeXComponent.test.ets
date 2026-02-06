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

import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import nativexcomponent from 'libnativexcomponent.so';
import { Driver } from '@kit.TestKit';
import Utils from '../common/Utils';

const ARKUI_ERROR_CODE_NO_ERROR = 0;
const ARKUI_ERROR_CODE_PARAM_INVALID = 401;
const ARKUI_ERROR_CODE_XCOMPONENT_STATE_INVALID = 103501;

export default function NativeXComponent() {
  describe('NativeXComponent', () => {
    beforeAll(async (done: Function) => {
      Utils.pushPageNoClear('NativeXComponent/NativeXComponent',done);
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTACTION_0100
     * @tc.name    : testGetKeyEventAction001
     * @tc.desc    : Test get native xcomopnent key event action works.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyEventAction001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(0);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTACTION_0100 start<====`);
        await Utils.driver.triggerKey(40);
        let Result: number = nativexcomponent.GetKeyEventAction();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTACTION_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTACTION_0200
     * @tc.name    : testGetKeyEventAction002
     * @tc.desc    : Test get native xcomopnent key event action invalid.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyEventAction002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(1);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTACTION_0200 start<====`);
        await Utils.driver.triggerKey(40);
        let Result: number = nativexcomponent.GetKeyEventAction();
        expect(-1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTACTION_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTSOURCETYPE_0100
     * @tc.name    : testGetKeyEventSourceType001
     * @tc.desc    : Test get native xcomopnent key event sourcetype works.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyEventSourceType001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(2);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTSOURCETYPE_0100 start<====`);
        await Utils.driver.triggerKey(40);
        let Result: number = nativexcomponent.GetKeyEventSourceType();
        expect(true).assertEqual(Result <= 5);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTSOURCETYPE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTSOURCETYPE_0200
     * @tc.name    : testGetKeyEventSourceType002
     * @tc.desc    : Test get native xcomopnent key event sourcetype invalid.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyEventSourceType002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(3);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTSOURCETYPE_0200 start<====`);
        await Utils.driver.triggerKey(40);
        let Result: number = nativexcomponent.GetKeyEventSourceType();
        expect(0).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTSOURCETYPE_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTDEVICEID_0100
     * @tc.name    : testGetKeyEventDeviceId001
     * @tc.desc    : Test get native xcomopnent key event device id works.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyEventDeviceId001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(4);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTDEVICEID_0100 start<====`);
        await Utils.driver.triggerKey(40);
        let Result: number = nativexcomponent.GetKeyEventDeviceId();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTDEVICEID_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTDEVICEID_0200
     * @tc.name    : testGetKeyEventDeviceId002
     * @tc.desc    : Test get native xcomopnent key event device id invalid.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyEventDeviceId002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(5);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTDEVICEID_0200 start<====`);
        await Utils.driver.triggerKey(40);
        let Result: number = nativexcomponent.GetKeyEventDeviceId();
        expect(0).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTDEVICEID_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTTIMESTAMP_0100
     * @tc.name    : testGetKeyEventTimestamp001
     * @tc.desc    : Test get native xcomopnent key event timestamp works.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyEventTimestamp001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(6);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTTIMESTAMP_0100 start<====`);
        await Utils.driver.triggerKey(40);
        let Result: number = nativexcomponent.GetKeyEventTimestamp();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTTIMESTAMP_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTTIMESTAMP_0200
     * @tc.name    : testGetKeyEventTimestamp002
     * @tc.desc    : Test get native xcomopnent key event timestamp invalid.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyEventTimestamp002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(7);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTTIMESTAMP_0200 start<====`);
        await Utils.driver.triggerKey(40);
        let Result: number = nativexcomponent.GetKeyEventTimestamp();
        expect(0).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTTIMESTAMP_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTMODIFIERKEYSTATES_0100
     * @tc.name    : testGetKeyEventModifierKeyStates001
     * @tc.desc    : Test get native xcomopnent key event modifier key states works.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyEventModifierKeyStates001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(8);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTMODIFIERKEYSTATES_0100 start<====`);
        await Utils.driver.triggerKey(40);
        let Result: number = nativexcomponent.GetKeyEventModifierKeyStates();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTMODIFIERKEYSTATES_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTMODIFIERKEYSTATES_0200
     * @tc.name    : testGetKeyEventModifierKeyStates002
     * @tc.desc    : Test get native xcomopnent key event modifier key states invalid.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyEventModifierKeyStates002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(9);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTMODIFIERKEYSTATES_0200 start<====`);
        await Utils.driver.triggerKey(40);
        let Result: number = nativexcomponent.GetKeyEventModifierKeyStates();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTTIMESTAMP_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTNUMLOCKSTATE_0100
     * @tc.name    : testGetKeyEventNumLockState001
     * @tc.desc    : Test get native xcomopnent key event num lock states works.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyEventNumLockState001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(10);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTNUMLOCKSTATE_0100 start<====`);
        await Utils.driver.triggerKey(40);
        let Result: number = nativexcomponent.GetKeyEventNumLockState();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTNUMLOCKSTATE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTNUMLOCKSTATE_0200
     * @tc.name    : testGetKeyEventNumLockState002
     * @tc.desc    : Test get native xcomopnent key event num lock states invalid.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyEventNumLockState002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(11);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTNUMLOCKSTATE_0200 start<====`);
        await Utils.driver.triggerKey(40);
        let Result: number = nativexcomponent.GetKeyEventNumLockState();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTNUMLOCKSTATE_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTCAPSLOCKSTATE_0100
     * @tc.name    : testGetKeyEventCapsLockState001
     * @tc.desc    : Test get native xcomopnent key event caps lock states works.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyEventCapsLockState001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(12);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTCAPSLOCKSTATE_0100 start<====`);
        await Utils.driver.triggerKey(40);
        let Result: number = nativexcomponent.GetKeyEventCapsLockState();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTCAPSLOCKSTATE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTCAPSLOCKSTATE_0200
     * @tc.name    : testGetKeyEventCapsLockState002
     * @tc.desc    : Test get native xcomopnent key event caps lock states invalid.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyEventCapsLockState002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(13);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTCAPSLOCKSTATE_0200 start<====`);
        await Utils.driver.triggerKey(40);
        let Result: number = nativexcomponent.GetKeyEventCapsLockState();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTCAPSLOCKSTATE_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTSCROLLLOCKSTATE_0100
     * @tc.name    : testGetKeyEventScrollLockState001
     * @tc.desc    : Test get native xcomopnent key event scroll lock states works.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyEventScrollLockState001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(14);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTSCROLLLOCKSTATE_0100 start<====`);
        await Utils.driver.triggerKey(40);
        let Result: number = nativexcomponent.GetKeyEventScrollLockState();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTSCROLLLOCKSTATE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTSCROLLLOCKSTATE_0200
     * @tc.name    : testGetKeyEventScrollLockState002
     * @tc.desc    : Test get native xcomopnent key event scroll lock states invalid.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyEventScrollLockState002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(15);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTSCROLLLOCKSTATE_0200 start<====`);
        await Utils.driver.triggerKey(40);
        let Result: number = nativexcomponent.GetKeyEventScrollLockState();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTSCROLLLOCKSTATE_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTACTIONENUM_0100
     * @tc.name    : testGetKeyEventActionEnum001
     * @tc.desc    : Test get native xcomopnent key event action works.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyEventActionEnum001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(16);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTACTIONENUM_0100 start<====`);
        await Utils.simulateByShell('uinput -K -d 2000 -i 1000 -u 2000 -D');
        let Result: number = nativexcomponent.GetKeyEventActionEnum();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTACTIONENUM_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTACTIONENUM_0200
     * @tc.name    : testGetKeyEventActionEnum002
     * @tc.desc    : Test get native xcomopnent key event action works.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyEventActionEnum002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(17);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTACTIONENUM_0200 start<====`);
        await Utils.simulateByShell('uinput -K -d 2000 -i 1000 -u 2000 -D');
        let Result: number = nativexcomponent.GetKeyEventActionEnum();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTACTIONENUM_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_SETEXPECTEDFRAMERATERANGE_0100
     * @tc.name    : testSetExpectedFrameRateRange001
     * @tc.desc    : Test native xcomopnent set expected frame rate range works.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testSetExpectedFrameRateRange001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_SETEXPECTEDFRAMERATERANGE_0100 start<====`);
        let Result: number = nativexcomponent.SetExpectedFrameRateRange001();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_SETEXPECTEDFRAMERATERANGE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_SETEXPECTEDFRAMERATERANGE_0200
     * @tc.name    : testSetExpectedFrameRateRange002
     * @tc.desc    : Test native xcomopnent set expected frame rate range invalid.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testSetExpectedFrameRateRange002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_SETEXPECTEDFRAMERATERANGE_0200 start<====`);
        let Result: number = nativexcomponent.SetExpectedFrameRateRange002();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_SETEXPECTEDFRAMERATERANGE_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_XCOMPONENT_SETEXPECTEDFRAMERATERANGE_0200
     * @tc.name    : testSetArkUIExpectedFrameRateRange002
     * @tc.desc    : Test native xcomopnent set expected frame rate range invalid.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testSetArkUIExpectedFrameRateRange002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_XCOMPONENT_SETEXPECTEDFRAMERATERANGE_0200 start<====`);
        let Result: number = nativexcomponent.SetArkUIExpectedFrameRateRange002();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_XCOMPONENT_SETEXPECTEDFRAMERATERANGE_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERONFRAMECALLBACK_0100
     * @tc.name    : testRegisterOnFrameCallback001
     * @tc.desc    : Test native xcomopnent register on frame callback works.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testRegisterOnFrameCallback001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERONFRAMECALLBACK_0100 start<====`);
        let Result: number = nativexcomponent.RegisterOnFrameCallback001();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERONFRAMECALLBACK_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERONFRAMECALLBACK_0200
     * @tc.name    : testRegisterOnFrameCallback002
     * @tc.desc    : Test native xcomopnent register on frame callback invalid.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testRegisterOnFrameCallback002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERONFRAMECALLBACK_0200 start<====`);
        let Result: number = nativexcomponent.RegisterOnFrameCallback002();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERONFRAMECALLBACK_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_XCOMPONENT_REGISTERONFRAMECALLBACK_0200
     * @tc.name    : testArkUIRegisterOnFrameCallback002
     * @tc.desc    : Test native xcomopnent register on frame callback invalid.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIRegisterOnFrameCallback002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_XCOMPONENT_REGISTERONFRAMECALLBACK_0200 start<====`);
        let Result: number = nativexcomponent.ArkUIRegisterOnFrameCallback002();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_XCOMPONENT_REGISTERONFRAMECALLBACK_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_UNREGISTERONFRAMECALLBACK_0100
     * @tc.name    : testUnregisterOnFrameCallback001
     * @tc.desc    : Test native xcomopnent unregister on frame callback works.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testUnregisterOnFrameCallback001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_UNREGISTERONFRAMECALLBACK_0100 start<====`);
        let Result: number = nativexcomponent.UnregisterOnFrameCallback001();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_UNREGISTERONFRAMECALLBACK_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_UNREGISTERONFRAMECALLBACK_0200
     * @tc.name    : testUnregisterOnFrameCallback002
     * @tc.desc    : Test native xcomopnent unregister on frame callback invalid.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testUnregisterOnFrameCallback002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_UNREGISTERONFRAMECALLBACK_0200 start<====`);
        let Result: number = nativexcomponent.UnregisterOnFrameCallback002();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_UNREGISTERONFRAMECALLBACK_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_XCOMPONENT_UNREGISTERONFRAMECALLBACK_0200
     * @tc.name    : testArkUIUnregisterOnFrameCallback002
     * @tc.desc    : Test native xcomopnent unregister on frame callback invalid.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIUnregisterOnFrameCallback002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_XCOMPONENT_UNREGISTERONFRAMECALLBACK_0200 start<====`);
        let Result: number = nativexcomponent.ArkUIUnregisterOnFrameCallback002();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_XCOMPONENT_UNREGISTERONFRAMECALLBACK_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERUIINPUTEVENTCALLBACK_0100
     * @tc.name    : testRegisterUIInputEventCallback001
     * @tc.desc    : Test native xcomopnent register ui input event callback works.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testRegisterUIInputEventCallback001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERUIINPUTEVENTCALLBACK_0100 start<====`);
        let Result: number = nativexcomponent.RegisterUIInputEventCallback001();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERUIINPUTEVENTCALLBACK_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERUIINPUTEVENTCALLBACK_0200
     * @tc.name    : testRegisterUIInputEventCallback002
     * @tc.desc    : Test native xcomopnent register ui input event callback invalid.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testRegisterUIInputEventCallback002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERUIINPUTEVENTCALLBACK_0200 start<====`);
        let Result: number = nativexcomponent.RegisterUIInputEventCallback002();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERUIINPUTEVENTCALLBACK_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERONTOUCHINTERCEPTCALLBACK_0100
     * @tc.name    : testRegisterOnTouchInterceptCallback001
     * @tc.desc    : Test native xcomopnent register ui input event callback works.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testRegisterOnTouchInterceptCallback001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERONTOUCHINTERCEPTCALLBACK_0100 start<====`);
        let Result: number = nativexcomponent.RegisterOnTouchInterceptCallback001();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERONTOUCHINTERCEPTCALLBACK_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERONTOUCHINTERCEPTCALLBACK_0200
     * @tc.name    : testRegisterOnTouchInterceptCallback002
     * @tc.desc    : Test native xcomopnent register ui input event callback invalid.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testRegisterOnTouchInterceptCallback002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERONTOUCHINTERCEPTCALLBACK_0200 start<====`);
        let Result: number = nativexcomponent.RegisterOnTouchInterceptCallback002();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERONTOUCHINTERCEPTCALLBACK_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETNATIVEACCESSIBILITYPROVIDER_0100
     * @tc.name    : testGetNativeAccessibilityProvider001
     * @tc.desc    : Test native xcomopnent get native accessibilityprovider works.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetNativeAccessibilityProvider001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETNATIVEACCESSIBILITYPROVIDER_0100 start<====`);
        let Result: number = nativexcomponent.GetNativeAccessibilityProvider001();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETNATIVEACCESSIBILITYPROVIDER_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETNATIVEACCESSIBILITYPROVIDER_0200
     * @tc.name    : testGetNativeAccessibilityProvider002
     * @tc.desc    : Test native xcomopnent get native accessibilityprovider invalid.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetNativeAccessibilityProvider002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETNATIVEACCESSIBILITYPROVIDER_0200 start<====`);
        let Result: number = nativexcomponent.GetNativeAccessibilityProvider002();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETNATIVEACCESSIBILITYPROVIDER_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERKEYEVENTCALLBACKWITHRESULT_0100
     * @tc.name    : testRegisterKeyEventCallbackWithResult001
     * @tc.desc    : Test native xcomopnent register key event callback with result invalid.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testRegisterKeyEventCallbackWithResult001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERKEYEVENTCALLBACKWITHRESULT_0100 start<====`);
        let Result: number = nativexcomponent.RegisterKeyEventCallbackWithResult001();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERKEYEVENTCALLBACKWITHRESULT_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERKEYEVENTCALLBACKWITHRESULT_0200
     * @tc.name    : testRegisterKeyEventCallbackWithResult002
     * @tc.desc    : Test native xcomopnent register key event callback with result invalid.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testRegisterKeyEventCallbackWithResult002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERKEYEVENTCALLBACKWITHRESULT_0200 start<====`);
        let Result: number = nativexcomponent.RegisterKeyEventCallbackWithResult002();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERKEYEVENTCALLBACKWITHRESULT_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_XCOMPONENTINITIALIZE_0100
     * @tc.name    : testXComponentInitialize001
     * @tc.desc    : Test native xcomopnent register key event callback with result invalid.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testXComponentInitialize001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_XCOMPONENTINITIALIZE_0100 start<====`);
        let Result: number = nativexcomponent.XComponentInitialize001();
        expect(ARKUI_ERROR_CODE_XCOMPONENT_STATE_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_XCOMPONENTINITIALIZE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_XCOMPONENTFINALIZE_0200
     * @tc.name    : testXComponentFinalize002
     * @tc.desc    : Test native xcomopnent register key event callback with result invalid.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testXComponentFinalize002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_XCOMPONENTFINALIZE_0100 start<====`);
        let Result: number = nativexcomponent.XComponentFinalize001();
        expect(ARKUI_ERROR_CODE_XCOMPONENT_STATE_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_XCOMPONENTFINALIZE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_XCOMPONENTSETNEEDSOFTKEYBOARD_0200
     * @tc.name    : testXComponentSetNeedSoftKeyboard002
     * @tc.desc    : Test native xcomopnent register key event callback with result invalid.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testXComponentSetNeedSoftKeyboard002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_XCOMPONENTSETNEEDSOFTKEYBOARD_0200 start<====`);
        let Result: number = nativexcomponent.XComponentSetNeedSoftKeyboard002();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_XCOMPONENTSETNEEDSOFTKEYBOARD_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETEXTRAMOUSEEVENTINFO_0100
     * @tc.name    : testGetExtraMouseEventInfo001
     * @tc.desc    : Test get native xcomopnent key event action works.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetExtraMouseEventInfo001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(0);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETEXTRAMOUSEEVENTINFO_0100 start<====`);
        await Utils.driver.mouseMoveTo({ x: globalThis.winLeft + globalThis.winWidth / 2, y: globalThis.winTop +
                                                                                       globalThis.winHeight / 2 });
        await Utils.driver.mouseMoveTo({ x: globalThis.winLeft, y: globalThis.winTop });
        let Result: number = nativexcomponent.GetExtraMouseEventInfo001();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETEXTRAMOUSEEVENTINFO_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETEXTRAMOUSEEVENTINFO_0200
     * @tc.name    : testGetExtraMouseEventInfo002
     * @tc.desc    : Test get native xcomopnent key event action invalid.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetExtraMouseEventInfo002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(1);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETEXTRAMOUSEEVENTINFO_0200 start<====`);
        await Utils.driver.mouseMoveTo({ x: globalThis.winLeft + globalThis.winWidth / 2, y: globalThis.winTop +
                                                                                       globalThis.winHeight / 2 });
        await Utils.driver.mouseMoveTo({ x: globalThis.winLeft, y: globalThis.winTop });
        let Result: number = nativexcomponent.GetExtraMouseEventInfo002();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETEXTRAMOUSEEVENTINFO_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETMOUSEEVENTMODIFIERKEYSTATES_0200
     * @tc.name    : testGetMouseEventModifierKeyStates002
     * @tc.desc    : Test get native xcomopnent key event action invalid.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetMouseEventModifierKeyStates002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(1);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETMOUSEEVENTMODIFIERKEYSTATES_0200 start<====`);
        await Utils.driver.mouseMoveTo({ x: globalThis.winLeft + globalThis.winWidth / 2, y: globalThis.winTop +
                                                                                       globalThis.winHeight / 2 });
        await Utils.driver.mouseMoveTo({ x: globalThis.winLeft, y: globalThis.winTop });
        let Result: number = nativexcomponent.GetMouseEventModifierKeyStates002();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETMOUSEEVENTMODIFIERKEYSTATES_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERFOCUSEVENTCALLBACK_0100
     * @tc.name    : testRegisterFocusEventCallback001
     * @tc.desc    : Test get native xcomopnent key event action works.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testRegisterFocusEventCallback001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(0);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERFOCUSEVENTCALLBACK_0100 start<====`);
        let Result: number = nativexcomponent.RegisterFocusEventCallback001();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERFOCUSEVENTCALLBACK_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERFOCUSEVENTCALLBACK_0200
     * @tc.name    : testRegisterFocusEventCallback002
     * @tc.desc    : Test get native xcomopnent key event action invalid.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testRegisterFocusEventCallback002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(1);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERFOCUSEVENTCALLBACK_0200 start<====`);
        let Result: number = nativexcomponent.RegisterFocusEventCallback002();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERFOCUSEVENTCALLBACK_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERBLUREVENTCALLBACK_0100
     * @tc.name    : testRegisterBlurEventCallback001
     * @tc.desc    : Test get native xcomopnent key event action works.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testRegisterBlurEventCallback001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(0);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERBLUREVENTCALLBACK_0100 start<====`);
        let Result: number = nativexcomponent.RegisterBlurEventCallback001();
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERBLUREVENTCALLBACK_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERBLUREVENTCALLBACK_0200
     * @tc.name    : testRegisterBlurEventCallback002
     * @tc.desc    : Test get native xcomopnent key event action invalid.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testRegisterBlurEventCallback002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(1);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERBLUREVENTCALLBACK_0200 start<====`);
        let Result: number = nativexcomponent.RegisterBlurEventCallback002();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERBLUREVENTCALLBACK_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
  })
}
