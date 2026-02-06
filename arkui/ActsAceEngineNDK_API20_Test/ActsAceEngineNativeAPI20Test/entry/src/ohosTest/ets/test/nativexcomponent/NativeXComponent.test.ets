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
      console.info(`====>pushPageNoClear: NativeXComponent/NativeXComponent<====`);
      Utils.pushPageNoClear('NativeXComponent/NativeXComponent',done);
      await Utils.sleep(1000);
    })
    /**
     * @tc.name   testGetKeyEventAction001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTACTION_0100
     * @tc.desc   Test get native xcomopnent key event action works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetKeyEventAction001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(0);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTACTION_0100 start<====`);
        await Utils.driver.triggerKey(2017);
        await Utils.sleep(1000);
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
     * @tc.name   testGetKeyEventAction002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTACTION_0200
     * @tc.desc   Test get native xcomopnent key event action invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetKeyEventAction002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(1);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTACTION_0200 start<====`);
        await Utils.driver.triggerKey(2017);
        await Utils.sleep(1000);
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
     * @tc.name   testGetKeyEventSourceType001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTSOURCETYPE_0100
     * @tc.desc   Test get native xcomopnent key event sourcetype works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetKeyEventSourceType001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(2);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTSOURCETYPE_0100 start<====`);
        await Utils.driver.triggerKey(2017);
        await Utils.sleep(1000);
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
     * @tc.name   testGetKeyEventSourceType002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTSOURCETYPE_0200
     * @tc.desc   Test get native xcomopnent key event sourcetype invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetKeyEventSourceType002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(3);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTSOURCETYPE_0200 start<====`);
        await Utils.driver.triggerKey(2017);
        await Utils.sleep(1000);
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
     * @tc.name   testGetKeyEventDeviceId001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTDEVICEID_0100
     * @tc.desc   Test get native xcomopnent key event device id works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetKeyEventDeviceId001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(4);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTDEVICEID_0100 start<====`);
        await Utils.driver.triggerKey(2017);
        await Utils.sleep(1000);
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
     * @tc.name   testGetKeyEventDeviceId002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTDEVICEID_0200
     * @tc.desc   Test get native xcomopnent key event device id invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetKeyEventDeviceId002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(5);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTDEVICEID_0200 start<====`);
        await Utils.driver.triggerKey(2017);
        await Utils.sleep(1000);
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
     * @tc.name   testGetKeyEventTimestamp001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTTIMESTAMP_0100
     * @tc.desc   Test get native xcomopnent key event timestamp works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetKeyEventTimestamp001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(6);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTTIMESTAMP_0100 start<====`);
        await Utils.driver.triggerKey(2017);
        await Utils.sleep(1000);
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
     * @tc.name   testGetKeyEventTimestamp002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTTIMESTAMP_0200
     * @tc.desc   Test get native xcomopnent key event timestamp invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetKeyEventTimestamp002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(7);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTTIMESTAMP_0200 start<====`);
        await Utils.driver.triggerKey(2017);
        await Utils.sleep(1000);
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
     * @tc.name   testGetKeyEventModifierKeyStates001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTMODIFIERKEYSTATES_0100
     * @tc.desc   Test get native xcomopnent key event modifier key states works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetKeyEventModifierKeyStates001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(8);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTMODIFIERKEYSTATES_0100 start<====`);
        await Utils.driver.triggerKey(2017);
        await Utils.sleep(1000);
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
     * @tc.name   testGetKeyEventModifierKeyStates002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTMODIFIERKEYSTATES_0200
     * @tc.desc   Test get native xcomopnent key event modifier key states invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetKeyEventModifierKeyStates002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(9);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTMODIFIERKEYSTATES_0200 start<====`);
        await Utils.driver.triggerKey(2017);
        await Utils.sleep(1000);
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
     * @tc.name   testGetKeyEventNumLockState001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTNUMLOCKSTATE_0100
     * @tc.desc   Test get native xcomopnent key event num lock states works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetKeyEventNumLockState001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(10);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTNUMLOCKSTATE_0100 start<====`);
        await Utils.driver.triggerKey(2017);
        await Utils.sleep(1000);
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
     * @tc.name   testGetKeyEventNumLockState002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTNUMLOCKSTATE_0200
     * @tc.desc   Test get native xcomopnent key event num lock states invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetKeyEventNumLockState002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(11);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTNUMLOCKSTATE_0200 start<====`);
        await Utils.driver.triggerKey(2017);
        await Utils.sleep(1000);
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
     * @tc.name   testGetKeyEventCapsLockState001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTCAPSLOCKSTATE_0100
     * @tc.desc   Test get native xcomopnent key event caps lock states works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetKeyEventCapsLockState001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(12);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTCAPSLOCKSTATE_0100 start<====`);
        await Utils.driver.triggerKey(2017);
        await Utils.sleep(1000);
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
     * @tc.name   testGetKeyEventCapsLockState002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTCAPSLOCKSTATE_0200
     * @tc.desc   Test get native xcomopnent key event caps lock states invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetKeyEventCapsLockState002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(13);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTCAPSLOCKSTATE_0200 start<====`);
        await Utils.driver.triggerKey(2017);
        await Utils.sleep(1000);
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
     * @tc.name   testGetKeyEventScrollLockState001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTSCROLLLOCKSTATE_0100
     * @tc.desc   Test get native xcomopnent key event scroll lock states works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetKeyEventScrollLockState001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(14);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTSCROLLLOCKSTATE_0100 start<====`);
        await Utils.driver.triggerKey(2017);
        await Utils.sleep(1000);
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
     * @tc.name   testGetKeyEventScrollLockState002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTSCROLLLOCKSTATE_0200
     * @tc.desc   Test get native xcomopnent key event scroll lock states invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetKeyEventScrollLockState002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(15);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTSCROLLLOCKSTATE_0200 start<====`);
        await Utils.driver.triggerKey(2017);
        await Utils.sleep(1000);
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
     * @tc.name   testGetKeyEventActionEnum001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTACTIONENUM_0100
     * @tc.desc   Test get native xcomopnent key event action works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testGetKeyEventActionEnum002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETKEYEVENTACTIONENUM_0200
     * @tc.desc   Test get native xcomopnent key event action works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testSetExpectedFrameRateRange001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_SETEXPECTEDFRAMERATERANGE_0100
     * @tc.desc   Test native xcomopnent set expected frame rate range works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testSetExpectedFrameRateRange002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_SETEXPECTEDFRAMERATERANGE_0200
     * @tc.desc   Test native xcomopnent set expected frame rate range invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testSetArkUIExpectedFrameRateRange002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_XCOMPONENT_SETEXPECTEDFRAMERATERANGE_0200
     * @tc.desc   Test native xcomopnent set expected frame rate range invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testRegisterOnFrameCallback001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERONFRAMECALLBACK_0100
     * @tc.desc   Test native xcomopnent register on frame callback works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testRegisterOnFrameCallback002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERONFRAMECALLBACK_0200
     * @tc.desc   Test native xcomopnent register on frame callback invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testArkUIRegisterOnFrameCallback002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_XCOMPONENT_REGISTERONFRAMECALLBACK_0200
     * @tc.desc   Test native xcomopnent register on frame callback invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testUnregisterOnFrameCallback001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_UNREGISTERONFRAMECALLBACK_0100
     * @tc.desc   Test native xcomopnent unregister on frame callback works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testUnregisterOnFrameCallback002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_UNREGISTERONFRAMECALLBACK_0200
     * @tc.desc   Test native xcomopnent unregister on frame callback invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testArkUIUnregisterOnFrameCallback002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_XCOMPONENT_UNREGISTERONFRAMECALLBACK_0200
     * @tc.desc   Test native xcomopnent unregister on frame callback invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testRegisterUIInputEventCallback001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERUIINPUTEVENTCALLBACK_0100
     * @tc.desc   Test native xcomopnent register ui input event callback works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testRegisterUIInputEventCallback002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERUIINPUTEVENTCALLBACK_0200
     * @tc.desc   Test native xcomopnent register ui input event callback invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testRegisterOnTouchInterceptCallback001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERONTOUCHINTERCEPTCALLBACK_0100
     * @tc.desc   Test native xcomopnent register ui input event callback works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testRegisterOnTouchInterceptCallback002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERONTOUCHINTERCEPTCALLBACK_0200
     * @tc.desc   Test native xcomopnent register ui input event callback invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testGetNativeAccessibilityProvider001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETNATIVEACCESSIBILITYPROVIDER_0100
     * @tc.desc   Test native xcomopnent get native accessibilityprovider works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testGetNativeAccessibilityProvider002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETNATIVEACCESSIBILITYPROVIDER_0200
     * @tc.desc   Test native xcomopnent get native accessibilityprovider invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testRegisterKeyEventCallbackWithResult001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERKEYEVENTCALLBACKWITHRESULT_0100
     * @tc.desc   Test native xcomopnent register key event callback with result invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testRegisterKeyEventCallbackWithResult002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERKEYEVENTCALLBACKWITHRESULT_0200
     * @tc.desc   Test native xcomopnent register key event callback with result invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testXComponentInitialize001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_XCOMPONENTINITIALIZE_0100
     * @tc.desc   Test native xcomopnent register key event callback with result invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testXComponentFinalize002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_XCOMPONENTFINALIZE_0200
     * @tc.desc   Test native xcomopnent register key event callback with result invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testXComponentSetNeedSoftKeyboard002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_XCOMPONENTSETNEEDSOFTKEYBOARD_0200
     * @tc.desc   Test native xcomopnent register key event callback with result invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testGetExtraMouseEventInfo001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETEXTRAMOUSEEVENTINFO_0100
     * @tc.desc   Test get native xcomopnent key event action works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetExtraMouseEventInfo001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(0);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETEXTRAMOUSEEVENTINFO_0100 start<====`);
        await Utils.driver.mouseMoveTo({ x: Math.round(globalThis.winLeft + globalThis.winWidth / 2), y: Math.round(globalThis.winTop +
          globalThis.winHeight / 2) });
        await Utils.driver.mouseMoveTo({ x: Math.round(globalThis.winLeft), y: Math.round(globalThis.winTop) });
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
     * @tc.name   testGetExtraMouseEventInfo002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETEXTRAMOUSEEVENTINFO_0200
     * @tc.desc   Test get native xcomopnent key event action invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetExtraMouseEventInfo002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(1);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETEXTRAMOUSEEVENTINFO_0200 start<====`);
        await Utils.driver.mouseMoveTo({ x: Math.round(globalThis.winLeft + globalThis.winWidth / 2), y: Math.round(globalThis.winTop +
          globalThis.winHeight / 2) });
        await Utils.driver.mouseMoveTo({ x: Math.round(globalThis.winLeft), y: Math.round(globalThis.winTop) });
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
     * @tc.name   testGetMouseEventModifierKeyStates002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETMOUSEEVENTMODIFIERKEYSTATES_0200
     * @tc.desc   Test get native xcomopnent key event action invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMouseEventModifierKeyStates002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ChooseTestFunction(1);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETMOUSEEVENTMODIFIERKEYSTATES_0200 start<====`);
        await Utils.driver.mouseMoveTo({ x: Math.round(globalThis.winLeft + globalThis.winWidth / 2), y: Math.round(globalThis.winTop +
          globalThis.winHeight / 2 )});
        await Utils.driver.mouseMoveTo({ x: Math.round(globalThis.winLeft), y: Math.round(globalThis.winTop) });
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
     * @tc.name   testRegisterFocusEventCallback001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERFOCUSEVENTCALLBACK_0100
     * @tc.desc   Test get native xcomopnent key event action works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testRegisterFocusEventCallback002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERFOCUSEVENTCALLBACK_0200
     * @tc.desc   Test get native xcomopnent key event action invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testRegisterBlurEventCallback001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERBLUREVENTCALLBACK_0100
     * @tc.desc   Test get native xcomopnent key event action works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testRegisterBlurEventCallback002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_REGISTERBLUREVENTCALLBACK_0200
     * @tc.desc   Test get native xcomopnent key event action invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
