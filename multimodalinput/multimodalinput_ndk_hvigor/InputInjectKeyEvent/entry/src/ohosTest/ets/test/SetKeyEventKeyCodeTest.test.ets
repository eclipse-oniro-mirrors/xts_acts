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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import inputinjectkeyeventndk from 'libinputinjectkeyeventtest.so'

export default function SetKeyEventKeyCodeTest() {
  describe('SetKeyEventKeyCodeTest', () => {
    /**
     * @tc.number  : SUB_Input_Inject_key_event_9500
     * @tc.name    : SUB_Input_Inject_key_event_9500
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_9500 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeNumpad1();
        console.info("====>SUB_Input_Inject_key_event_9500 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_9500 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_9600
     * @tc.name    : SUB_Input_Inject_key_event_9600
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_9600 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeNumpad2();
        console.info("====>SUB_Input_Inject_key_event_9600 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_9600 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_9700
     * @tc.name    : SUB_Input_Inject_key_event_9700
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_9700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_9700 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeNumpad3();
        console.info("====>SUB_Input_Inject_key_event_9700 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_9700 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_9800
     * @tc.name    : SUB_Input_Inject_key_event_9800
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_9800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_9800 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeNumpad4();
        console.info("====>SUB_Input_Inject_key_event_9800 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_9800 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_9900
     * @tc.name    : SUB_Input_Inject_key_event_9900
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_9900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_9900 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeNumpad5();
        console.info("====>SUB_Input_Inject_key_event_9900 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_9900 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_10000
     * @tc.name    : SUB_Input_Inject_key_event_10000
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_10000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_10000 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeNumpad6();
        console.info("====>SUB_Input_Inject_key_event_10000 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_10000 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_10100
     * @tc.name    : SUB_Input_Inject_key_event_10100
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_10100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_10100 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeNumpad7();
        console.info("====>SUB_Input_Inject_key_event_10100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_10100 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_10200
     * @tc.name    : SUB_Input_Inject_key_event_10200
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_10200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_10200 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeNumpad8();
        console.info("====>SUB_Input_Inject_key_event_10200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_10200 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_10300
     * @tc.name    : SUB_Input_Inject_key_event_10300
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_10300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_10300 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeNumpadDivide();
        console.info("====>SUB_Input_Inject_key_event_10300 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_10300 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_10400
     * @tc.name    : SUB_Input_Inject_key_event_10400
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_10400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_10400 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeNumpadMultiply();
        console.info("====>SUB_Input_Inject_key_event_10400 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_10400 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_10500
     * @tc.name    : SUB_Input_Inject_key_event_10500
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_10500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_10500 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeNumpadSubtract();
        console.info("====>SUB_Input_Inject_key_event_10500 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_10500 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_10600
     * @tc.name    : SUB_Input_Inject_key_event_10600
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_10600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_10600 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeNumpadAdd();
        console.info("====>SUB_Input_Inject_key_event_10600 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_10600 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_10700
     * @tc.name    : SUB_Input_Inject_key_event_10700
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_10700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_10700 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeNumpadDot();
        console.info("====>SUB_Input_Inject_key_event_10700 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_10700 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_10800
     * @tc.name    : SUB_Input_Inject_key_event_10800
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_10800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_10800 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeNumpadComma();
        console.info("====>SUB_Input_Inject_key_event_10800 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_10800 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_10900
     * @tc.name    : SUB_Input_Inject_key_event_10900
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_10900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_10900 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeNumpadEnter();
        console.info("====>SUB_Input_Inject_key_event_10900 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_10900 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_11000
     * @tc.name    : SUB_Input_Inject_key_event_11000
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_11000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_11000 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeNumpadEquals();
        console.info("====>SUB_Input_Inject_key_event_11000 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_11000 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_11100
     * @tc.name    : SUB_Input_Inject_key_event_11100
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_11100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_11100 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeNumpadLeftParen();
        console.info("====>SUB_Input_Inject_key_event_11100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_11100 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_11200
     * @tc.name    : SUB_Input_Inject_key_event_11200
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_11200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_11200 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeNumpadRightParen();
        console.info("====>SUB_Input_Inject_key_event_11200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_11200 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_11300
     * @tc.name    : SUB_Input_Inject_key_event_11300
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_11300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_11300 start====");
        let result = inputinjectkeyeventndk.OHInputInjectMouseEventGlobalGetSetXEvent();
        console.info("====>SUB_Input_Inject_key_event_11300 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_11300 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_11400
     * @tc.name    : SUB_Input_Inject_key_event_11400
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_11400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_11400 start====");
        let result = inputinjectkeyeventndk.OHInputInjectMouseEventGlobalGetSetYEvent();
        console.info("====>SUB_Input_Inject_key_event_11400 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_11400 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_11500
     * @tc.name    : SUB_Input_Inject_key_event_11500
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_11500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_11500 start====");
        let result = inputinjectkeyeventndk.OHInputInjectionStatusError();
        console.info("====>SUB_Input_Inject_key_event_11500 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_11500 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_11700
     * @tc.name    : SUB_Input_Inject_key_event_11700
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_11700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_11700 start====");
        let result = inputinjectkeyeventndk.OHInputInjectTouchEventGlobal();
        console.info("====>SUB_Input_Inject_key_event_11700 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_11700 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_11800
     * @tc.name    : SUB_Input_Inject_key_event_11800
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_11800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_11800 start====");
        let result = inputinjectkeyeventndk.OHInputInjectTouchEventGlobal();
        console.info("====>SUB_Input_Inject_key_event_11800 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_11800 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_11900
     * @tc.name    : SUB_Input_Inject_key_event_11900
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_11900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_11900 start====");
        let result = inputinjectkeyeventndk.OHInputGetTouchEventGlobalX();
        console.info("====>SUB_Input_Inject_key_event_11900 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_11900 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_12000
     * @tc.name    : SUB_Input_Inject_key_event_12000
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_12000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_12000 start====");
        let result = inputinjectkeyeventndk.OHInputGetTouchEventGlobalY();
        console.info("====>SUB_Input_Inject_key_event_12000 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_12000 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_12100
     * @tc.name    : SUB_Input_Inject_key_event_12100
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_12100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_12100 start====");
        let result = inputinjectkeyeventndk.OHInputSetAxisEventGlobalXSuccess();
        console.info("====>SUB_Input_Inject_key_event_12100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_12100 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_12200
     * @tc.name    : SUB_Input_Inject_key_event_12200
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_12200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_12200 start====");
        let result = inputinjectkeyeventndk.OHInputSetAxisEventGlobalYSuccess();
        console.info("====>SUB_Input_Inject_key_event_12200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_12200 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_12300
     * @tc.name    : SUB_Input_Inject_key_event_12300
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_12300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_12300 start====");
        let result = inputinjectkeyeventndk.OHInputGetAxisEventGlobalXSuccess();
        console.info("====>SUB_Input_Inject_key_event_12300 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_12300 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_12400
     * @tc.name    : SUB_Input_Inject_key_event_12400
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_12400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_12400 start====");
        let result = inputinjectkeyeventndk.OHInputGetAxisEventGlobalYSuccess();
        console.info("====>SUB_Input_Inject_key_event_12400 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_12400 catch err: " + err);
        done()
      }
    })





    /**
     * @tc.number  : SUB_Input_Inject_key_event_12500
     * @tc.name    : SUB_Input_Inject_key_event_12500
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_12500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_12500 start====");
        let result = inputinjectkeyeventndk.OHInputSetAxisEventGlobalXError();
        console.info("====>SUB_Input_Inject_key_event_12500 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_12500 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_12600
     * @tc.name    : SUB_Input_Inject_key_event_12600
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_12600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_12600 start====");
        let result = inputinjectkeyeventndk.OHInputSetAxisEventGlobalYError();
        console.info("====>SUB_Input_Inject_key_event_12600 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_12600 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_12700
     * @tc.name    : SUB_Input_Inject_key_event_12700
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_12700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_12700 start====");
        let result = inputinjectkeyeventndk.OHInputGetAxisEventGlobalXError();
        console.info("====>SUB_Input_Inject_key_event_12700 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_12700 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_12800
     * @tc.name    : SUB_Input_Inject_key_event_12800
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_12800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_12800 start====");
        let result = inputinjectkeyeventndk.OHInputGetAxisEventGlobalYError();
        console.info("====>SUB_Input_Inject_key_event_12800 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_12800 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_12900
     * @tc.name    : SUB_Input_Inject_key_event_12900
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_12900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_12900 start====");
        let result = inputinjectkeyeventndk.OHInputInjectionStatusUnauthorized();
        console.info("====>SUB_Input_Inject_key_event_12900 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_12900 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_13000
     * @tc.name    : SUB_Input_Inject_key_event_13000
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_13000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_13000 start====");
        let result = inputinjectkeyeventndk.OHInputInjectionStatusAuthorizing();
        console.info("====>SUB_Input_Inject_key_event_13000 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_13000 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_13100
     * @tc.name    : SUB_Input_Inject_key_event_13100
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_13100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_13100 start====");
        let result = inputinjectkeyeventndk.OHInputInjectionStatusAuthorized();
        console.info("====>SUB_Input_Inject_key_event_13100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_13100 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_13200
     * @tc.name    : SUB_Input_Inject_key_event_13200
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_13200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_13200 start====");
        let result = inputinjectkeyeventndk.OHInputKeyboardTypeNone();
        console.info("====>SUB_Input_Inject_key_event_13200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_13200 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_13300
     * @tc.name    : SUB_Input_Inject_key_event_13300
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_13300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_13300 start====");
        let result = inputinjectkeyeventndk.OHInputKeyboardTypeUNKNOWN();
        console.info("====>SUB_Input_Inject_key_event_13300 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_13300 catch err: " + err);
        done()
      }
    })


    /**
     * @tc.number  : SUB_Input_Inject_key_event_13400
     * @tc.name    : SUB_Input_Inject_key_event_13400
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_13400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_13400 start====");
        let result = inputinjectkeyeventndk.OHInputAddKeyEventMonitorPermissionDenied();
        console.info("====>SUB_Input_Inject_key_event_13400 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_13400 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_13500
     * @tc.name    : SUB_Input_Inject_key_event_13500
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_13500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_13500 start====");
        let result = inputinjectkeyeventndk.OHInputGetPreKeysError();
        console.info("====>SUB_Input_Inject_key_event_13500 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_13500 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_13600
     * @tc.name    : SUB_Input_Inject_key_event_13600
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_13600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_13600 start====");
        let result = inputinjectkeyeventndk.OHInputGetFinalKeyError();
        console.info("====>SUB_Input_Inject_key_event_13600 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_13600 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_13700
     * @tc.name    : SUB_Input_Inject_key_event_13700
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_13700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_13700 start====");
        let result = inputinjectkeyeventndk.OHInputGetRepeatError();
        console.info("====>SUB_Input_Inject_key_event_13700 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_13700 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_13800
     * @tc.name    : SUB_Input_Inject_key_event_13800
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_13800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_13800 start====");
        let result = inputinjectkeyeventndk.OHInputKeyboardTypeAlphabetic();
        console.info("====>SUB_Input_Inject_key_event_13800 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_13800 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_13900
     * @tc.name    : SUB_Input_Inject_key_event_13900
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_13900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_13900 start====");
        let result = inputinjectkeyeventndk.OHInputKeyboardTypeDigital();
        console.info("====>SUB_Input_Inject_key_event_13900 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_13900 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_14000
     * @tc.name    : SUB_Input_Inject_key_event_14000
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_14000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_14000 start====");
        let result = inputinjectkeyeventndk.OHInputKeyboardTypeStylus();
        console.info("====>SUB_Input_Inject_key_event_14000 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_14000 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_14100
     * @tc.name    : SUB_Input_Inject_key_event_14100
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_14100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_14100 start====");
        let result = inputinjectkeyeventndk.OHInputKeyboardTypeControl();
        console.info("====>SUB_Input_Inject_key_event_14100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_14100 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_14200
     * @tc.name    : SUB_Input_Inject_key_event_14200
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_14200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_14200 start====");
        let result = inputinjectkeyeventndk.OHInputAddMouseEventMonitorPermissionDenied();
        console.info("====>SUB_Input_Inject_key_event_14200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_14200 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_14300
     * @tc.name    : SUB_Account_OsAccount_GetName_14300
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_14300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_14300 start====");
        let result = inputinjectkeyeventndk.OHInputAddTouchEventMonitorPermissionDenied();
        console.info("====>SUB_Account_OsAccount_GetName_14300 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_14300 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_14400
     * @tc.name    : SUB_Account_OsAccount_GetName_14400
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_14400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_14400 start====");
        let result = inputinjectkeyeventndk.OHInputAddAxisEventMonitorForAllPermissionDenied();
        console.info("====>SUB_Account_OsAccount_GetName_14400 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_14400 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_14500
     * @tc.name    : SUB_Account_OsAccount_GetName_14500
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_14500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_14500 start====");
        let result = inputinjectkeyeventndk.OHInputAddAxisEventMonitorPermissionDenied();
        console.info("====>SUB_Account_OsAccount_GetName_14500 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_14500 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_14600
     * @tc.name    : SUB_Account_OsAccount_GetName_14600
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_14600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_14600 start====");
        let result = inputinjectkeyeventndk.OHInputAddAxisEventMonitorForAllDenied();
        console.info("====>SUB_Account_OsAccount_GetName_14600 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_14600 catch err: " + err);
        done()
      }
    })



    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_14700
     * @tc.name    : SUB_Account_OsAccount_GetName_14700
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_14700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_14700 start====");
        let result = inputinjectkeyeventndk.OHInputInjectMouseEventGlobalDenied();
        console.info("====>SUB_Account_OsAccount_GetName_14700 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_14700 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_14800
     * @tc.name    : SUB_Account_OsAccount_GetName_14800
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_14800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_14800 start====");
        let result = inputinjectkeyeventndk.OHInputInjectMouseEventGlobalEventError();
        console.info("====>SUB_Account_OsAccount_GetName_14800 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_14800 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_14900
     * @tc.name    : SUB_Account_OsAccount_GetName_14900
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_14900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_14900 start====");
        let result = inputinjectkeyeventndk.GetMouseEventAxisTypeHorizontal();
        console.info("====>SUB_Account_OsAccount_GetName_14900 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_14900 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_15000
     * @tc.name    : SUB_Account_OsAccount_GetName_15000
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_15000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_15000 start====");
        let result = inputinjectkeyeventndk.SetMouseEventButtonBack();
        console.info("====>SUB_Account_OsAccount_GetName_15000 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_15000 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_15100
     * @tc.name    : SUB_Account_OsAccount_GetName_15100
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_15100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_15100 start====");
        let result = inputinjectkeyeventndk.touchEventActionUp();
        console.info("====>SUB_Account_OsAccount_GetName_15100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_15100 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_15200
     * @tc.name    : SUB_Account_OsAccount_GetName_15200
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_15200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_15200 start====");
        let result = inputinjectkeyeventndk.touchEventActionCancel();
        console.info("====>SUB_Account_OsAccount_GetName_15200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_15200 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_15300
     * @tc.name    : SUB_Account_OsAccount_GetName_15300
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_15300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_15300 start====");
        let result = inputinjectkeyeventndk.SetAxisEventSourceType();
        console.info("====>SUB_Account_OsAccount_GetName_15300 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_15300 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_15400
     * @tc.name    : SUB_Account_OsAccount_GetName_15400
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_15400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_15400 start====");
        let result = inputinjectkeyeventndk.AxisEventActionCancel();
        console.info("====>SUB_Account_OsAccount_GetName_15400 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_15400 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_15500
     * @tc.name    : SUB_Account_OsAccount_GetName_15500
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_15500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_15500 start====");
        let result = inputinjectkeyeventndk.GetKeyEventActionCancel();
        console.info("====>SUB_Account_OsAccount_GetName_15500 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_15500 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_15600
     * @tc.name    : SUB_Account_OsAccount_GetName_15600
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_15600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_15600 start====");
        let result = inputinjectkeyeventndk.SetMouseEventActionAxisEnd();
        console.info("====>SUB_Account_OsAccount_GetName_15600 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_15600 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_15700
     * @tc.name    : SUB_Account_OsAccount_GetName_15700
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_15700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_15700 start====");
        let result = inputinjectkeyeventndk.OHInputGetPointerLocationSuccess();
        console.info("====>SUB_Account_OsAccount_GetName_15700 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_15700 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_15900
     * @tc.name    : SUB_Account_OsAccount_GetName_15900
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_15900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_15900 start====");
        let result = inputinjectkeyeventndk.OHInputGetPointerLocationError();
        console.info("====>SUB_Account_OsAccount_GetName_15900 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_15900 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_16000
     * @tc.name    : SUB_Account_OsAccount_GetName_16000
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_16000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_16000 start====");
        let result = inputinjectkeyeventndk.OHInputGetPointerLocationNoPointer();
        console.info("====>SUB_Account_OsAccount_GetName_16000 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_16000 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_16100
     * @tc.name    : SUB_Account_OsAccount_GetName_16100
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_16100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_16100 start====");
        let result = inputinjectkeyeventndk.OHInputGetPointerLocationNoFocused();
        console.info("====>SUB_Account_OsAccount_GetName_16100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_16100 catch err: " + err);
        done()
      }
    })


    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_16200
     * @tc.name    : SUB_Account_OsAccount_GetName_16200
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_16200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_16200 start====");
        let result = inputinjectkeyeventndk.OHInputQueryMaxTouchPointsSuccess();
        console.info("====>SUB_Account_OsAccount_GetName_16200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_16200 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_16300
     * @tc.name    : SUB_Account_OsAccount_GetName_16300
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_16300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_16300 start====");
        let result = inputinjectkeyeventndk.OHInputQueryMaxTouchPointsError();
        console.info("====>SUB_Account_OsAccount_GetName_16300 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_16300 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_16400
     * @tc.name    : SUB_Account_OsAccount_GetName_16400
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_16400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_16400 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventFn();
        console.info("====>SUB_Account_OsAccount_GetName_16400 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_16400 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_16500
     * @tc.name    : SUB_Account_OsAccount_GetName_16500
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_16500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_16500 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventVolumeUp();
        console.info("====>SUB_Account_OsAccount_GetName_16500 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_16500 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_16600
     * @tc.name    : SUB_Account_OsAccount_GetName_16600
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_16600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_16600 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventVolumeDown();
        console.info("====>SUB_Account_OsAccount_GetName_16600 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_16600 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_16700
     * @tc.name    : SUB_Account_OsAccount_GetName_16700
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_16700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_16700 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventPower();
        console.info("====>SUB_Account_OsAccount_GetName_16700 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_16600 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_16800
     * @tc.name    : SUB_Account_OsAccount_GetName_16800
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_16800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_16800 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventCamera();
        console.info("====>SUB_Account_OsAccount_GetName_16800 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_16800 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_16900
     * @tc.name    : SUB_Account_OsAccount_GetName_16900
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_16900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_16900 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventCamera();
        console.info("====>SUB_Account_OsAccount_GetName_16800 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_16800 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_17000
     * @tc.name    : SUB_Account_OsAccount_GetName_17000
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_17000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_17000 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventVolumeMute();
        console.info("====>SUB_Account_OsAccount_GetName_17000 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_17000 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_17100
     * @tc.name    : SUB_Account_OsAccount_GetName_17100
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_17100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_17100 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventMute();
        console.info("====>SUB_Account_OsAccount_GetName_17100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_17100 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_17200
     * @tc.name    : SUB_Account_OsAccount_GetName_17200
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_17200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_17200 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventBrightnessUp();
        console.info("====>SUB_Account_OsAccount_GetName_17200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_17200 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_17300
     * @tc.name    : SUB_Account_OsAccount_GetName_17300
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_17300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_17300 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventBrightnessDown();
        console.info("====>SUB_Account_OsAccount_GetName_17300 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_17300 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_17400
     * @tc.name    : SUB_Account_OsAccount_GetName_17400
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_17400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_17400 start====");
        let result = inputinjectkeyeventndk.SetAxisEventAxisValueUnkown();
        console.info("====>SUB_Account_OsAccount_GetName_17400 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_17400 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_17500
     * @tc.name    : SUB_Account_OsAccount_GetName_17500
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_17500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_17500 start====");
        let result = inputinjectkeyeventndk.SetAxisEventAxisValueVertical();
        console.info("====>SUB_Account_OsAccount_GetName_17500 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_17500 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_17600
     * @tc.name    : SUB_Account_OsAccount_GetName_17600
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_17600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_17600 start====");
        let result = inputinjectkeyeventndk.SetAxisEventAxisValueHorizontal();
        console.info("====>SUB_Account_OsAccount_GetName_17600 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_17600 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_17700
     * @tc.name    : SUB_Account_OsAccount_GetName_17700
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_17700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_17700 start====");
        let result = inputinjectkeyeventndk.SetAxisEventAxisValuePinch();
        console.info("====>SUB_Account_OsAccount_GetName_17700 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_17700 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_17800
     * @tc.name    : SUB_Account_OsAccount_GetName_17800
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_17800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_17800 start====");
        let result = inputinjectkeyeventndk.SetAxisEventAxisValueRotate();
        console.info("====>SUB_Account_OsAccount_GetName_17800 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_17800 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_17900
     * @tc.name    : SUB_Account_OsAccount_GetName_17900
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_17900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_17900 start====");
        let result = inputinjectkeyeventndk.SetKeyCodePressed();
        console.info("====>SUB_Account_OsAccount_GetName_17900 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_17900 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_18000
     * @tc.name    : SUB_Account_OsAccount_GetName_18000
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_18000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_18000 start====");
        let result = inputinjectkeyeventndk.SetKeyCodeSwitchOn();
        console.info("====>SUB_Account_OsAccount_GetName_18000 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_18000 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_18100
     * @tc.name    : SUB_Account_OsAccount_GetName_18100
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_18100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_18100 start====");
        let result = inputinjectkeyeventndk.SetKeyCodeSwitchOff();
        console.info("====>SUB_Account_OsAccount_GetName_18100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_18100 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Account_OsAccount_GetName_18200
     * @tc.name    : SUB_Account_OsAccount_GetName_18200
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_OsAccount_GetName_18200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Account_OsAccount_GetName_18200 start====");
        let result = inputinjectkeyeventndk.OHInputInjectMouseEventError();
        console.info("====>SUB_Account_OsAccount_GetName_18200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Account_OsAccount_GetName_18200 catch err: " + err);
        done()
      }
    })


  })
}
function done() {
  throw new Error('Function not implemented.');
}
