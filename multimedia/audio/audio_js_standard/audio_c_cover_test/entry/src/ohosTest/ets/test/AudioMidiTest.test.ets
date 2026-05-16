/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import AudioKitTest from 'libmidi.so'

export default function AudioMidiTest() {
  describe('AudioMidiTest', () => {
    /**
     * @tc.name   testOHMIDIClientCreateInvalidClient
     * @tc.number SUB_MULTIMEDIA_MIDI_FRAMEWORK_INTERFACE_TEST_0100
     * @tc.desc   test OHMIDIClientCreateInvalidClient
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHMIDIClientCreateInvalidClient', Level.LEVEL2, async (done: Function) => {
      expect(AudioKitTest.OHMIDIClientCreateInvalidClient()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHMIDIClientCreateTooManyClient
     * @tc.number SUB_MULTIMEDIA_MIDI_FRAMEWORK_INTERFACE_TEST_0200
     * @tc.desc   test OHMIDIClientCreateTooManyClient
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHMIDIClientCreateTooManyClient', Level.LEVEL2, async (done: Function) => {
      expect(AudioKitTest.OHMIDIClientCreateTooManyClient()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHMIDIClientDestroyInvalidClient
     * @tc.number SUB_MULTIMEDIA_MIDI_FRAMEWORK_INTERFACE_TEST_0300
     * @tc.desc   test OHMIDIClientDestroyInvalidClient
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHMIDIClientDestroyInvalidClient', Level.LEVEL2, async (done: Function) => {
      expect(AudioKitTest.OHMIDIClientDestroyInvalidClient()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHMIDIClientGetDeviceCountInvalidClient
     * @tc.number SUB_MULTIMEDIA_MIDI_FRAMEWORK_INTERFACE_TEST_0400
     * @tc.desc   test OHMIDIClientGetDeviceCountInvalidClient
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHMIDIClientGetDeviceCountInvalidClient', Level.LEVEL2, async (done: Function) => {
      expect(AudioKitTest.OHMIDIClientGetDeviceCountInvalidClient()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHMIDIClientGetDeviceCountInvalidCount
     * @tc.number SUB_MULTIMEDIA_MIDI_FRAMEWORK_INTERFACE_TEST_0500
     * @tc.desc   test OHMIDIClientGetDeviceCountInvalidCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHMIDIClientGetDeviceCountInvalidCount', Level.LEVEL2, async (done: Function) => {
      expect(AudioKitTest.OHMIDIClientGetDeviceCountInvalidCount()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHMIDIClientGetDeviceInfosInvalidClient
     * @tc.number SUB_MULTIMEDIA_MIDI_FRAMEWORK_INTERFACE_TEST_0600
     * @tc.desc   test OHMIDIClientGetDeviceInfosInvalidClient
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHMIDIClientGetDeviceInfosInvalidClient', Level.LEVEL2, async (done: Function) => {
      expect(AudioKitTest.OHMIDIClientGetDeviceInfosInvalidClient()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHMIDIClientGetDeviceInfosInvalidInfos
     * @tc.number SUB_MULTIMEDIA_MIDI_FRAMEWORK_INTERFACE_TEST_0700
     * @tc.desc   test OHMIDIClientGetDeviceInfosInvalidInfos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHMIDIClientGetDeviceInfosInvalidInfos', Level.LEVEL2, async (done: Function) => {
      expect(AudioKitTest.OHMIDIClientGetDeviceInfosInvalidInfos()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHMIDIClientGetDeviceInfosInvalidDeviceCount
     * @tc.number SUB_MULTIMEDIA_MIDI_FRAMEWORK_INTERFACE_TEST_0800
     * @tc.desc   test OHMIDIClientGetDeviceInfosInvalidDeviceCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHMIDIClientGetDeviceInfosInvalidDeviceCount', Level.LEVEL2, async (done: Function) => {
      expect(AudioKitTest.OHMIDIClientGetDeviceInfosInvalidDeviceCount()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHMIDIClientOpenDeviceInvalidClient
     * @tc.number SUB_MULTIMEDIA_MIDI_FRAMEWORK_INTERFACE_TEST_0900
     * @tc.desc   test OHMIDIClientOpenDeviceInvalidClient
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHMIDIClientOpenDeviceInvalidClient', Level.LEVEL2, async (done: Function) => {
      expect(AudioKitTest.OHMIDIClientOpenDeviceInvalidClient()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHMIDIClientOpenDeviceInvalidDevice
     * @tc.number SUB_MULTIMEDIA_MIDI_FRAMEWORK_INTERFACE_TEST_1000
     * @tc.desc   test OHMIDIClientOpenDeviceInvalidDevice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHMIDIClientOpenDeviceInvalidDevice', Level.LEVEL2, async (done: Function) => {
      expect(AudioKitTest.OHMIDIClientOpenDeviceInvalidDevice()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHMIDIClientOpenBLEDeviceInvalidClient
     * @tc.number SUB_MULTIMEDIA_MIDI_FRAMEWORK_INTERFACE_TEST_1100
     * @tc.desc   test OHMIDIClientOpenBLEDeviceInvalidClient
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHMIDIClientOpenBLEDeviceInvalidClient', Level.LEVEL2, async (done: Function) => {
      expect(AudioKitTest.OHMIDIClientOpenBLEDeviceInvalidClient()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHMIDIClientCloseDeviceInvalidClient
     * @tc.number SUB_MULTIMEDIA_MIDI_FRAMEWORK_INTERFACE_TEST_1200
     * @tc.desc   test OHMIDIClientCloseDeviceInvalidClient
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHMIDIClientCloseDeviceInvalidClient', Level.LEVEL2, async (done: Function) => {
      expect(AudioKitTest.OHMIDIClientCloseDeviceInvalidClient()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHMIDIClientCloseDeviceInvalidDevice
     * @tc.number SUB_MULTIMEDIA_MIDI_FRAMEWORK_INTERFACE_TEST_1300
     * @tc.desc   test OHMIDIClientCloseDeviceInvalidDevice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHMIDIClientCloseDeviceInvalidDevice', Level.LEVEL2, async (done: Function) => {
      expect(AudioKitTest.OHMIDIClientCloseDeviceInvalidDevice()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHMIDIClientGetPortCountInvalidClient
     * @tc.number SUB_MULTIMEDIA_MIDI_FRAMEWORK_INTERFACE_TEST_1400
     * @tc.desc   test OHMIDIClientGetPortCountInvalidClient
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHMIDIClientGetPortCountInvalidClient', Level.LEVEL2, async (done: Function) => {
      expect(AudioKitTest.OHMIDIClientGetPortCountInvalidClient()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHMIDIClientGetPortCountInvalidDeviceId
     * @tc.number SUB_MULTIMEDIA_MIDI_FRAMEWORK_INTERFACE_TEST_1500
     * @tc.desc   test OHMIDIClientGetPortCountInvalidDeviceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHMIDIClientGetPortCountInvalidDeviceId', Level.LEVEL2, async (done: Function) => {
      expect(AudioKitTest.OHMIDIClientGetPortCountInvalidDeviceId()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHMIDIClientGetPortCountInvalidCount
     * @tc.number SUB_MULTIMEDIA_MIDI_FRAMEWORK_INTERFACE_TEST_1600
     * @tc.desc   test OHMIDIClientGetPortCountInvalidCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHMIDIClientGetPortCountInvalidCount', Level.LEVEL2, async (done: Function) => {
      expect(AudioKitTest.OHMIDIClientGetPortCountInvalidCount()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHMIDIClientGetPortInfosInvalidClient
     * @tc.number SUB_MULTIMEDIA_MIDI_FRAMEWORK_INTERFACE_TEST_1700
     * @tc.desc   test OHMIDIClientGetPortInfosInvalidClient
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHMIDIClientGetPortInfosInvalidClient', Level.LEVEL2, async (done: Function) => {
      expect(AudioKitTest.OHMIDIClientGetPortInfosInvalidClient()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHMIDIClientGetPortInfosInvalidDeviceId
     * @tc.number SUB_MULTIMEDIA_MIDI_FRAMEWORK_INTERFACE_TEST_1800
     * @tc.desc   test OHMIDIClientGetPortInfosInvalidDeviceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHMIDIClientGetPortInfosInvalidDeviceId', Level.LEVEL2, async (done: Function) => {
      expect(AudioKitTest.OHMIDIClientGetPortInfosInvalidDeviceId()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHMIDIClientGetPortInfosInvalidInfos
     * @tc.number SUB_MULTIMEDIA_MIDI_FRAMEWORK_INTERFACE_TEST_1900
     * @tc.desc   test OHMIDIClientGetPortInfosInvalidInfos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHMIDIClientGetPortInfosInvalidInfos', Level.LEVEL2, async (done: Function) => {
      expect(AudioKitTest.OHMIDIClientGetPortInfosInvalidInfos()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHMIDIClientGetPortInfosInvalidPortCount
     * @tc.number SUB_MULTIMEDIA_MIDI_FRAMEWORK_INTERFACE_TEST_2000
     * @tc.desc   test OHMIDIClientGetPortInfosInvalidPortCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHMIDIClientGetPortInfosInvalidPortCount', Level.LEVEL2, async (done: Function) => {
      expect(AudioKitTest.OHMIDIClientGetPortInfosInvalidPortCount()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHMIDIDeviceOpenInputPortInvalidDevice
     * @tc.number SUB_MULTIMEDIA_MIDI_FRAMEWORK_INTERFACE_TEST_2100
     * @tc.desc   test OHMIDIDeviceOpenInputPortInvalidDevice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHMIDIDeviceOpenInputPortInvalidDevice', Level.LEVEL2, async (done: Function) => {
      expect(AudioKitTest.OHMIDIDeviceOpenInputPortInvalidDevice()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHMIDIDeviceOpenOutputPortInvalidDevice
     * @tc.number SUB_MULTIMEDIA_MIDI_FRAMEWORK_INTERFACE_TEST_2200
     * @tc.desc   test OHMIDIDeviceOpenOutputPortInvalidDevice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHMIDIDeviceOpenOutputPortInvalidDevice', Level.LEVEL2, async (done: Function) => {
      expect(AudioKitTest.OHMIDIDeviceOpenOutputPortInvalidDevice()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHMIDIDeviceCloseInputPortInvalidDevice
     * @tc.number SUB_MULTIMEDIA_MIDI_FRAMEWORK_INTERFACE_TEST_2300
     * @tc.desc   test OHMIDIDeviceCloseInputPortInvalidDevice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHMIDIDeviceCloseInputPortInvalidDevice', Level.LEVEL2, async (done: Function) => {
      expect(AudioKitTest.OHMIDIDeviceCloseInputPortInvalidDevice()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHMIDIDeviceCloseOutputPortInvalidDevice
     * @tc.number SUB_MULTIMEDIA_MIDI_FRAMEWORK_INTERFACE_TEST_2400
     * @tc.desc   test OHMIDIDeviceCloseOutputPortInvalidDevice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHMIDIDeviceCloseOutputPortInvalidDevice', Level.LEVEL2, async (done: Function) => {
      expect(AudioKitTest.OHMIDIDeviceCloseOutputPortInvalidDevice()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHMIDIDeviceSendInvalidDevice
     * @tc.number SUB_MULTIMEDIA_MIDI_FRAMEWORK_INTERFACE_TEST_2500
     * @tc.desc   test OHMIDIDeviceSendInvalidDevice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHMIDIDeviceSendInvalidDevice', Level.LEVEL2, async (done: Function) => {
      expect(AudioKitTest.OHMIDIDeviceSendInvalidDevice()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHMIDIDeviceSendSysExInvalidDevice
     * @tc.number SUB_MULTIMEDIA_MIDI_FRAMEWORK_INTERFACE_TEST_2600
     * @tc.desc   test OHMIDIDeviceSendSysExInvalidDevice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHMIDIDeviceSendSysExInvalidDevice', Level.LEVEL2, async (done: Function) => {
      expect(AudioKitTest.OHMIDIDeviceSendSysExInvalidDevice()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHMIDIDeviceFlushOutputPortInvalidDevice
     * @tc.number SUB_MULTIMEDIA_MIDI_FRAMEWORK_INTERFACE_TEST_2700
     * @tc.desc   test OHMIDIDeviceFlushOutputPortInvalidDevice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHMIDIDeviceFlushOutputPortInvalidDevice', Level.LEVEL2, async (done: Function) => {
      expect(AudioKitTest.OHMIDIDeviceFlushOutputPortInvalidDevice()).assertEqual(0);
      done();
    });

  })
}