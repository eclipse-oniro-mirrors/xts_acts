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

export default function ActsInputInjectKeyEventTest() {
  describe('ActsInputInjectKeyEventTest', () => {

    /**
     * @tc.number  : SUB_Input_Inject_key_event_0100
     * @tc.name    : SUB_Input_Inject_key_event_0100
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_0100 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventPount();
        console.info("====>SUB_Input_Inject_key_event_0100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_0100 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_0200
     * @tc.name    : SUB_Input_Inject_key_event_0200
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_0200 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEvent0();
        console.info("====>SUB_Input_Inject_key_event_0200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_0200 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_0300
     * @tc.name    : SUB_Input_Inject_key_event_0300
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_0300 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEvent1();
        console.info("====>SUB_Input_Inject_key_event_0300 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_0300 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_0400
     * @tc.name    : SUB_Input_Inject_key_event_0400
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_0400 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEvent2();
        console.info("====>SUB_Input_Inject_key_event_0400 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_0400 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_0500
     * @tc.name    : SUB_Input_Inject_key_event_0500
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_0500 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEvent3();
        console.info("====>SUB_Input_Inject_key_event_0500 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_0500 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_0600
     * @tc.name    : SUB_Input_Inject_key_event_0600
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_0600 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEvent4();
        console.info("====>SUB_Input_Inject_key_event_0600 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_0600 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_0700
     * @tc.name    : SUB_Input_Inject_key_event_0700
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_0700 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEvent5();
        console.info("====>SUB_Input_Inject_key_event_0700 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_0700 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_0800
     * @tc.name    : SUB_Input_Inject_key_event_0800
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_0800 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEvent6();
        console.info("====>SUB_Input_Inject_key_event_0800 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_0800 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_0900
     * @tc.name    : SUB_Input_Inject_key_event_0900
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_0900 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEvent7();
        console.info("====>SUB_Input_Inject_key_event_0900 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_0900 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_1000
     * @tc.name    : SUB_Input_Inject_key_event_1000
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_1000 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEvent8();
        console.info("====>SUB_Input_Inject_key_event_1000 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_1000 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_1100
     * @tc.name    : SUB_Input_Inject_key_event_1100
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_1100 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventStart();
        console.info("====>SUB_Input_Inject_key_event_1100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_1100 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_1200
     * @tc.name    : SUB_Input_Inject_key_event_1200
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_1200 start====");
        let result = inputinjectkeyeventndk.OHInputRemoveMouseEventMonitorDenied();
        console.info("====>SUB_Input_Inject_key_event_1200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_1200 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_1300
     * @tc.name    : SUB_Input_Inject_key_event_1300
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_1300 start====");
        let result = inputinjectkeyeventndk.OHInputAddKeyEventInterceptorDenied();
        console.info("====>SUB_Input_Inject_key_event_1300 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_1300 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_1400
     * @tc.name    : SUB_Input_Inject_key_event_1400
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_1400 start====");
        let result = inputinjectkeyeventndk.OHInputInjectMouseEventGlobalGetSetXEvent();
        console.info("====>SUB_Input_Inject_key_event_1400 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_1400 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_1500
     * @tc.name    : SUB_Input_Inject_key_event_1500
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_1500 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventDpadDown();
        console.info("====>SUB_Input_Inject_key_event_1500 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_1500 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_1600
     * @tc.name    : SUB_Input_Inject_key_event_1600
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_1600 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventDpadRight();
        console.info("====>SUB_Input_Inject_key_event_1600 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_1600 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_1800
     * @tc.name    : SUB_Input_Inject_key_event_1800
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_1800 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventB();
        console.info("====>SUB_Input_Inject_key_event_1800 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_1800 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_1900
     * @tc.name    : SUB_Input_Inject_key_event_1900
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_1900 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventE();
        console.info("====>SUB_Input_Inject_key_event_1900 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_1900 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_2000
     * @tc.name    : SUB_Input_Inject_key_event_2000
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_2000 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventG();
        console.info("====>SUB_Input_Inject_key_event_2000 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_2000 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_2100
     * @tc.name    : SUB_Input_Inject_key_event_2100
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_2100 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventH();
        console.info("====>SUB_Input_Inject_key_event_2100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_2100 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_2200
     * @tc.name    : SUB_Input_Inject_key_event_2200
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_2200 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventI();
        console.info("====>SUB_Input_Inject_key_event_2200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_2200 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_2300
     * @tc.name    : SUB_Input_Inject_key_event_2300
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_2300 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventJ();
        console.info("====>SUB_Input_Inject_key_event_2300 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_2300 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_2400
     * @tc.name    : SUB_Input_Inject_key_event_2400
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_2400 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventK();
        console.info("====>SUB_Input_Inject_key_event_2400 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_2400 catch err: " + err);
        done()
      }
    })


    /**
     * @tc.number  : SUB_Input_Inject_key_event_2500
     * @tc.name    : SUB_Input_Inject_key_event_2500
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_2500 start====");
        let result = inputinjectkeyeventndk.OHInputInjectMouseEventGlobalGetSetYEvent();
        console.info("====>SUB_Input_Inject_key_event_2500 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_2500 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_2600
     * @tc.name    : SUB_Input_Inject_key_event_2600
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_2600 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventL();
        console.info("====>SUB_Input_Inject_key_event_2600 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_2600 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_2700
     * @tc.name    : SUB_Input_Inject_key_event_2700
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_2600 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventM();
        console.info("====>SUB_Input_Inject_key_event_2600 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_2600 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_2800
     * @tc.name    : SUB_Input_Inject_key_event_2800
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_2800 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventN();
        console.info("====>SUB_Input_Inject_key_event_2800 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_2800 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_2900
     * @tc.name    : SUB_Input_Inject_key_event_2900
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_2900 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventO();
        console.info("====>SUB_Input_Inject_key_event_2900 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_2900 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_3000
     * @tc.name    : SUB_Input_Inject_key_event_3000
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_3000 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventP();
        console.info("====>SUB_Input_Inject_key_event_3000 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_3000 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_3100
     * @tc.name    : SUB_Input_Inject_key_event_3100
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_3100 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventQ();
        console.info("====>SUB_Input_Inject_key_event_3100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_3100 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_3200
     * @tc.name    : SUB_Input_Inject_key_event_3200
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_3200 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventR();
        console.info("====>SUB_Input_Inject_key_event_3200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_3200 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_3300
     * @tc.name    : SUB_Input_Inject_key_event_3300
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_3300 start====");
        let result = inputinjectkeyeventndk.OHInputInjectTouchEventGlobal();
        console.info("====>SUB_Input_Inject_key_event_3300 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_3300 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_3400
     * @tc.name    : SUB_Input_Inject_key_event_3400
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_3400 start====");
        let result = inputinjectkeyeventndk.OHInputInjectTouchEventGlobalError();
        console.info("====>SUB_Input_Inject_key_event_3400 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_3400 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_3500
     * @tc.name    : SUB_Input_Inject_key_event_3500
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_3500 start====");
        let result = inputinjectkeyeventndk.OHInputInjectTouchEventSuccess();
        console.info("====>SUB_Input_Inject_key_event_3500 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_3500 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_3600
     * @tc.name    : SUB_Input_Inject_key_event_3600
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_3600 start====");
        let result = inputinjectkeyeventndk.OHInputInjectTouchEventError();
        console.info("====>SUB_Input_Inject_key_event_3600 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_3600 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_3700
     * @tc.name    : SUB_Input_Inject_key_event_3700
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_3700 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventS();
        console.info("====>SUB_Input_Inject_key_event_3700 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_3700 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_3800
     * @tc.name    : SUB_Input_Inject_key_event_3800
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_3800 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventT();
        console.info("====>SUB_Input_Inject_key_event_3800 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_3800 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_3900
     * @tc.name    : SUB_Input_Inject_key_event_3900
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_3900 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventU();
        console.info("====>SUB_Input_Inject_key_event_3900 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_3900 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_4000
     * @tc.name    : SUB_Input_Inject_key_event_4000
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_4000 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventV();
        console.info("====>SUB_Input_Inject_key_event_4000 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_4000 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_4100
     * @tc.name    : SUB_Input_Inject_key_event_4100
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_4100 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventW();
        console.info("====>SUB_Input_Inject_key_event_4100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_4100 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_4200
     * @tc.name    : SUB_Input_Inject_key_event_4200
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_4200 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventX();
        console.info("====>SUB_Input_Inject_key_event_4200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_4200 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_4300
     * @tc.name    : SUB_Input_Inject_key_event_4300
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_4300 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventY();
        console.info("====>SUB_Input_Inject_key_event_4300 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_4300 catch err: " + err);
        done()
      }
    })


    /**
     * @tc.number  : SUB_Input_Inject_key_event_4400
     * @tc.name    : SUB_Input_Inject_key_event_4400
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_4400 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventComma();
        console.info("====>SUB_Input_Inject_key_event_4400 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_4400 catch err: " + err);
        done()
      }
    })


    /**
     * @tc.number  : SUB_Input_Inject_key_event_4500
     * @tc.name    : SUB_Input_Inject_key_event_4500
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_4500 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventPeriod();
        console.info("====>SUB_Input_Inject_key_event_4500 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_4500 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_4600
     * @tc.name    : SUB_Input_Inject_key_event_4600
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_4600 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventActionRight();
        console.info("====>SUB_Input_Inject_key_event_4600 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_4600 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_4700
     * @tc.name    : SUB_Input_Inject_key_event_4700
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_4700 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeSpace();
        console.info("====>SUB_Input_Inject_key_event_4700 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_4700 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_4800
     * @tc.name    : SUB_Input_Inject_key_event_4800
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_4800 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeSYM();
        console.info("====>SUB_Input_Inject_key_event_4800 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_4800 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_4900
     * @tc.name    : SUB_Input_Inject_key_event_4900
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_4900 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeExplorer();
        console.info("====>SUB_Input_Inject_key_event_4900 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_4900 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_5000
     * @tc.name    : SUB_Input_Inject_key_event_5000
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_5000 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeEnvelope();
        console.info("====>SUB_Input_Inject_key_event_5000 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_5000 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_5100
     * @tc.name    : SUB_Input_Inject_key_event_5100
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_5100 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeDel();
        console.info("====>SUB_Input_Inject_key_event_5100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_5100 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_5200
     * @tc.name    : SUB_Input_Inject_key_event_5200
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_5200 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeMinus();
        console.info("====>SUB_Input_Inject_key_event_5200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_5200 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_5300
     * @tc.name    : SUB_Input_Inject_key_event_5300
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_5300 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeEquals();
        console.info("====>SUB_Input_Inject_key_event_5300 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_5300 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_5400
     * @tc.name    : SUB_Input_Inject_key_event_5400
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_5400 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeLeftBracket();
        console.info("====>SUB_Input_Inject_key_event_5400 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_5400 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_5500
     * @tc.name    : SUB_Input_Inject_key_event_5500
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_5500 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeRightBracket();
        console.info("====>SUB_Input_Inject_key_event_5500 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_5500 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_5600
     * @tc.name    : SUB_Input_Inject_key_event_5600
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_5600 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeBackSlash();
        console.info("====>SUB_Input_Inject_key_event_5600 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_5600 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_5700
     * @tc.name    : SUB_Input_Inject_key_event_5700
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_5700 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeSemicolon();
        console.info("====>SUB_Input_Inject_key_event_5700 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_5700 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_5800
     * @tc.name    : SUB_Input_Inject_key_event_5800
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_5800 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeApostrophe();
        console.info("====>SUB_Input_Inject_key_event_5800 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_5800 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_5900
     * @tc.name    : SUB_Input_Inject_key_event_5900
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_5900 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeSlash();
        console.info("====>SUB_Input_Inject_key_event_5900 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_5900 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_6000
     * @tc.name    : SUB_Input_Inject_key_event_6000
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_6000 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeGrave();
        console.info("====>SUB_Input_Inject_key_event_6000 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_6000 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_6100
     * @tc.name    : SUB_Input_Inject_key_event_6100
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_6100 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeAT();
        console.info("====>SUB_Input_Inject_key_event_6100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_6100 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_6200
     * @tc.name    : SUB_Input_Inject_key_event_6200
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_6200 start====");
        let result = inputinjectkeyeventndk.OHInputInjectionStatusSuccess();
        console.info("====>SUB_Input_Inject_key_event_6200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_6200 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_6300
     * @tc.name    : SUB_Input_Inject_key_event_6300
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_6300 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodePlus();
        console.info("====>SUB_Input_Inject_key_event_6300 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_6300 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_6400
     * @tc.name    : SUB_Input_Inject_key_event_6400
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_6400 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeMenu();
        console.info("====>SUB_Input_Inject_key_event_6400 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_6400 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_6500
     * @tc.name    : SUB_Input_Inject_key_event_6500
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_6500 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodePageUp();
        console.info("====>SUB_Input_Inject_key_event_6500 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_6500 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_6600
     * @tc.name    : SUB_Input_Inject_key_event_6600
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_6600 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodePageDown();
        console.info("====>SUB_Input_Inject_key_event_6600 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_6600 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_6700
     * @tc.name    : SUB_Input_Inject_key_event_6700
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_6700 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeEscape();
        console.info("====>SUB_Input_Inject_key_event_6700 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_6600 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_6800
     * @tc.name    : SUB_Input_Inject_key_event_6800
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_6800 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeForwardDel();
        console.info("====>SUB_Input_Inject_key_event_6800 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_6800 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_6900
     * @tc.name    : SUB_Input_Inject_key_event_6900
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_6900 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeMetaRight();
        console.info("====>SUB_Input_Inject_key_event_6900 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_6900 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_7000
     * @tc.name    : SUB_Input_Inject_key_event_7000
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_7000 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeFunction();
        console.info("====>SUB_Input_Inject_key_event_7000 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_7000 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_7100
     * @tc.name    : SUB_Input_Inject_key_event_7100
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_7100 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeSysrq();
        console.info("====>SUB_Input_Inject_key_event_7100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_7100 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_7200
     * @tc.name    : SUB_Input_Inject_key_event_7200
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_7200 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeBreak();
        console.info("====>SUB_Input_Inject_key_event_7200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_7200 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_7300
     * @tc.name    : SUB_Input_Inject_key_event_7300
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_7300 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeMoveEnd();
        console.info("====>SUB_Input_Inject_key_event_7300 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_7300 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_7400
     * @tc.name    : SUB_Input_Inject_key_event_7400
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_7400 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeInsert();
        console.info("====>SUB_Input_Inject_key_event_7400 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_7400 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_7500
     * @tc.name    : SUB_Input_Inject_key_event_7500
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_7500 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeForward();
        console.info("====>SUB_Input_Inject_key_event_7500 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_7500 catch err: " + err);
        done()
      }
    })


    /**
     * @tc.number  : SUB_Input_Inject_key_event_7600
     * @tc.name    : SUB_Input_Inject_key_event_7600
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_7600 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeMediaPause();
        console.info("====>SUB_Input_Inject_key_event_7600 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_7600 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_7700
     * @tc.name    : SUB_Input_Inject_key_event_7700
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_7700 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeMediaClose();
        console.info("====>SUB_Input_Inject_key_event_7700 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_7700 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_7800
     * @tc.name    : SUB_Input_Inject_key_event_7800
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_7800 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeMediaEject();
        console.info("====>SUB_Input_Inject_key_event_7800 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_7800 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_7900
     * @tc.name    : SUB_Input_Inject_key_event_7900
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_7900 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeMediaRecord();
        console.info("====>SUB_Input_Inject_key_event_7900 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_7900 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_8000
     * @tc.name    : SUB_Input_Inject_key_event_8000
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_8000 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeMediaPlay();
        console.info("====>SUB_Input_Inject_key_event_8000 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_8000 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_8100
     * @tc.name    : SUB_Input_Inject_key_event_8100
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_8100 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeF2();
        console.info("====>SUB_Input_Inject_key_event_8100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_8100 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_8200
     * @tc.name    : SUB_Input_Inject_key_event_8200
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_8200 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeF3();
        console.info("====>SUB_Input_Inject_key_event_8200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_8200 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_8300
     * @tc.name    : SUB_Input_Inject_key_event_8300
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_8300 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeF4();
        console.info("====>SUB_Input_Inject_key_event_8300 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_8300 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_8400
     * @tc.name    : SUB_Input_Inject_key_event_8400
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_8400 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeF5();
        console.info("====>SUB_Input_Inject_key_event_8400 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_8400 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_8500
     * @tc.name    : SUB_Input_Inject_key_event_8500
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_8500 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeF5();
        console.info("====>SUB_Input_Inject_key_event_8500 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_8500 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_8600
     * @tc.name    : SUB_Input_Inject_key_event_8600
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_8600 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeF6();
        console.info("====>SUB_Input_Inject_key_event_8600 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_8600 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_8700
     * @tc.name    : SUB_Input_Inject_key_event_8700
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_8700 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeF7();
        console.info("====>SUB_Input_Inject_key_event_8700 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_8700 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_8800
     * @tc.name    : SUB_Input_Inject_key_event_8800
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_8800 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeF8();
        console.info("====>SUB_Input_Inject_key_event_8800 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_8800 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_8900
     * @tc.name    : SUB_Input_Inject_key_event_8900
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_8900 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeF9();
        console.info("====>SUB_Input_Inject_key_event_8900 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_8900 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_9000
     * @tc.name    : SUB_Input_Inject_key_event_9000
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_9000 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeF10();
        console.info("====>SUB_Input_Inject_key_event_9000 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_9000 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_9100
     * @tc.name    : SUB_Input_Inject_key_event_9100
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_9100 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeF11();
        console.info("====>SUB_Input_Inject_key_event_9100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_9100 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_9200
     * @tc.name    : SUB_Input_Inject_key_event_9200
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_9200 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeF12();
        console.info("====>SUB_Input_Inject_key_event_9200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_9200 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Input_Inject_key_event_9300
     * @tc.name    : SUB_Input_Inject_key_event_9300
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_9300 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeNumLock();
        console.info("====>SUB_Input_Inject_key_event_9300 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_9300 catch err: " + err);
        done()
      }
    })


    /**
     * @tc.number  : SUB_Input_Inject_key_event_9400
     * @tc.name    : SUB_Input_Inject_key_event_9400
     * @tc.desc    : Covering the enumeration value.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Input_Inject_key_event_9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Input_Inject_key_event_9400 start====");
        let result = inputinjectkeyeventndk.OHInputInjectKeyEventKeycodeNumpad0();
        console.info("====>SUB_Input_Inject_key_event_9400 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>SUB_Input_Inject_key_event_9400 catch err: " + err);
        done()
      }
    })
  })
}

function done() {
  throw new Error('Function not implemented.');
}
