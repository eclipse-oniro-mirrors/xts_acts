/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import bluetooth from '@ohos.bluetooth.constant';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';

export default function btConstantTest() {
describe('btConstantTest', () =>  {

    beforeAll(() =>  {
        console.info('beforeAll called')
    })
    beforeEach(() =>  {
        console.info('beforeEach called')
    })
    afterEach(() =>  {
        console.info('afterEach called')
    })
    afterAll(() =>  {
        console.info('afterAll called')
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_CONSTANT_0100
     * @tc.name testProfileConnectionState
     * @tc.desc Test constant api10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_CONSTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        let STATE_DISCONNECTED = bluetooth.ProfileConnectionState.STATE_DISCONNECTED;
        console.info("[bluetooth_js]STATE_DISCONNECTED : " + JSON.stringify(STATE_DISCONNECTED));
        expect(true).assertEqual(STATE_DISCONNECTED == 0);
        let STATE_CONNECTING = bluetooth.ProfileConnectionState.STATE_CONNECTING;
        console.info("[bluetooth_js]STATE_CONNECTING : " + JSON.stringify(STATE_CONNECTING));
        expect(true).assertEqual(STATE_CONNECTING == 1);
        let STATE_CONNECTED = bluetooth.ProfileConnectionState.STATE_CONNECTED;
        console.info("[bluetooth_js]STATE_CONNECTED : " + JSON.stringify(STATE_CONNECTED));
        expect(true).assertEqual(STATE_CONNECTED == 2);
        let STATE_DISCONNECTING = bluetooth.ProfileConnectionState.STATE_DISCONNECTING;
        console.info("[bluetooth_js]STATE_DISCONNECTING : " + JSON.stringify(STATE_DISCONNECTING));
        expect(true).assertEqual(STATE_DISCONNECTING == 3);
        done();
    })


    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_CONSTANT_0200
     * @tc.name testProfileId
     * @tc.desc Test constant api10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_CONSTANT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        let PROFILE_A2DP_SOURCE = bluetooth.ProfileId.PROFILE_A2DP_SOURCE;
        console.info("[bluetooth_js]PROFILE_A2DP_SOURCE : " + JSON.stringify(PROFILE_A2DP_SOURCE));
        expect(true).assertEqual(PROFILE_A2DP_SOURCE == 1);
        let PROFILE_HANDSFREE_AUDIO_GATEWAY = bluetooth.ProfileId.PROFILE_HANDSFREE_AUDIO_GATEWAY;
        console.info("[bluetooth_js]PROFILE_HANDSFREE_AUDIO_GATEWAY : " +
        JSON.stringify(PROFILE_HANDSFREE_AUDIO_GATEWAY));
        expect(true).assertEqual(PROFILE_HANDSFREE_AUDIO_GATEWAY == 4);
        let PROFILE_HID_HOST = bluetooth.ProfileId.PROFILE_HID_HOST;
        console.info("[bluetooth_js]PROFILE_HID_HOST : " + JSON.stringify(PROFILE_HID_HOST));
        expect(true).assertEqual(PROFILE_HID_HOST == 6);
        let PROFILE_PAN_NETWORK = bluetooth.ProfileId.PROFILE_PAN_NETWORK;
        console.info("[bluetooth_js]PROFILE_PAN_NETWORK : " + JSON.stringify(PROFILE_PAN_NETWORK));
        expect(true).assertEqual(PROFILE_PAN_NETWORK == 7);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_CONSTANT_0300
     * @tc.name testMajorClass
     * @tc.desc Test constant api10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_CONSTANT_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        let MAJOR_MISC = bluetooth.MajorClass.MAJOR_MISC;
        console.info("[bluetooth_js]MAJOR_MISC : " + JSON.stringify(MAJOR_MISC));
        expect(true).assertEqual(MAJOR_MISC == 0x0000);
        let MAJOR_COMPUTER = bluetooth.MajorClass.MAJOR_COMPUTER;
        console.info("[bluetooth_js]MAJOR_COMPUTER : " + JSON.stringify(MAJOR_COMPUTER));
        expect(true).assertEqual(MAJOR_COMPUTER == 0x0100);
        let MAJOR_PHONE = bluetooth.MajorClass.MAJOR_PHONE;
        console.info("[bluetooth_js]MAJOR_PHONE : " + JSON.stringify(MAJOR_PHONE));
        expect(true).assertEqual(MAJOR_PHONE == 0x0200);
        let MAJOR_NETWORKING = bluetooth.MajorClass.MAJOR_NETWORKING;
        console.info("[bluetooth_js]MAJOR_NETWORKING : " + JSON.stringify(MAJOR_NETWORKING));
        expect(true).assertEqual(MAJOR_NETWORKING == 0x0300);
        let MAJOR_AUDIO_VIDEO = bluetooth.MajorClass.MAJOR_AUDIO_VIDEO;
        console.info("[bluetooth_js]MAJOR_AUDIO_VIDEO : " + JSON.stringify(MAJOR_AUDIO_VIDEO));
        expect(true).assertEqual(MAJOR_AUDIO_VIDEO == 0x0400);
        let MAJOR_PERIPHERAL = bluetooth.MajorClass.MAJOR_PERIPHERAL;
        console.info("[bluetooth_js]MAJOR_PERIPHERAL : " + JSON.stringify(MAJOR_PERIPHERAL));
        expect(true).assertEqual(MAJOR_PERIPHERAL == 0x0500);
        let MAJOR_IMAGING = bluetooth.MajorClass.MAJOR_IMAGING;
        console.info("[bluetooth_js]MAJOR_IMAGING : " + JSON.stringify(MAJOR_IMAGING));
        expect(true).assertEqual(MAJOR_IMAGING == 0x0600);
        let MAJOR_WEARABLE = bluetooth.MajorClass.MAJOR_WEARABLE;
        console.info("[bluetooth_js]MAJOR_WEARABLE : " + JSON.stringify(MAJOR_WEARABLE));
        expect(true).assertEqual(MAJOR_WEARABLE == 0x0700);
        let MAJOR_TOY = bluetooth.MajorClass.MAJOR_TOY;
        console.info("[bluetooth_js]MAJOR_TOY : " + JSON.stringify(MAJOR_TOY));
        expect(true).assertEqual(MAJOR_TOY == 0x0800);
        let MAJOR_HEALTH = bluetooth.MajorClass.MAJOR_HEALTH;
        console.info("[bluetooth_js]MAJOR_HEALTH : " + JSON.stringify(MAJOR_HEALTH));
        expect(true).assertEqual(MAJOR_HEALTH == 0x0900);
        let MAJOR_UNCATEGORIZED = bluetooth.MajorClass.MAJOR_UNCATEGORIZED;
        console.info("[bluetooth_js]MAJOR_UNCATEGORIZED : " + JSON.stringify(MAJOR_UNCATEGORIZED));
        expect(true).assertEqual(MAJOR_UNCATEGORIZED == 0x1F00);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_CONSTANT_0400
     * @tc.name testMajorMinorClass
     * @tc.desc Test constant api10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_CONSTANT_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        let COMPUTER_UNCATEGORIZED = bluetooth.MajorMinorClass.COMPUTER_UNCATEGORIZED;
        console.info("[bluetooth_js]COMPUTER_UNCATEGORIZED : " +
        JSON.stringify(COMPUTER_UNCATEGORIZED));
        expect(true).assertEqual(COMPUTER_UNCATEGORIZED == 0x0100);
        let COMPUTER_DESKTOP = bluetooth.MajorMinorClass.COMPUTER_DESKTOP;
        console.info("[bluetooth_js]COMPUTER_DESKTOP : " + JSON.stringify(COMPUTER_DESKTOP));
        expect(true).assertEqual(COMPUTER_DESKTOP == 0x0104);
        let COMPUTER_SERVER = bluetooth.MajorMinorClass.COMPUTER_SERVER;
        console.info("[bluetooth_js]COMPUTER_SERVER : " + JSON.stringify(COMPUTER_SERVER));
        expect(true).assertEqual(COMPUTER_SERVER == 0x0108);
        let COMPUTER_LAPTOP = bluetooth.MajorMinorClass.COMPUTER_LAPTOP;
        console.info("[bluetooth_js]COMPUTER_LAPTOP : " + JSON.stringify(COMPUTER_LAPTOP));
        expect(true).assertEqual(COMPUTER_LAPTOP == 0x010C);
        let COMPUTER_HANDHELD_PC_PDA = bluetooth.MajorMinorClass.COMPUTER_HANDHELD_PC_PDA;
        console.info("[bluetooth_js]COMPUTER_HANDHELD_PC_PDA : " +
        JSON.stringify(COMPUTER_HANDHELD_PC_PDA));
        expect(true).assertEqual(COMPUTER_HANDHELD_PC_PDA == 0x0110);
        let COMPUTER_PALM_SIZE_PC_PDA = bluetooth.MajorMinorClass.COMPUTER_PALM_SIZE_PC_PDA;
        console.info("[bluetooth_js]COMPUTER_PALM_SIZE_PC_PDA : " +
        JSON.stringify(COMPUTER_PALM_SIZE_PC_PDA));
        expect(true).assertEqual(COMPUTER_PALM_SIZE_PC_PDA == 0x0114);
        let COMPUTER_WEARABLE = bluetooth.MajorMinorClass.COMPUTER_WEARABLE;
        console.info("[bluetooth_js]COMPUTER_WEARABLE : " + JSON.stringify(COMPUTER_WEARABLE));
        expect(true).assertEqual(COMPUTER_WEARABLE == 0x0118);
        let COMPUTER_TABLET = bluetooth.MajorMinorClass.COMPUTER_TABLET;
        console.info("[bluetooth_js]COMPUTER_TABLET : " + JSON.stringify(COMPUTER_TABLET));
        expect(true).assertEqual(COMPUTER_TABLET == 0x011C);

        let PHONE_UNCATEGORIZED = bluetooth.MajorMinorClass.PHONE_UNCATEGORIZED;
        console.info("[bluetooth_js]PHONE_UNCATEGORIZED : " +
        JSON.stringify(PHONE_UNCATEGORIZED));
        expect(true).assertEqual(PHONE_UNCATEGORIZED == 0x0200);
        let PHONE_CELLULAR = bluetooth.MajorMinorClass.PHONE_CELLULAR;
        console.info("[bluetooth_js]PHONE_CELLULAR : " + JSON.stringify(PHONE_CELLULAR));
        expect(true).assertEqual(PHONE_CELLULAR == 0x0204);
        let PHONE_CORDLESS = bluetooth.MajorMinorClass.PHONE_CORDLESS;
        console.info("[bluetooth_js]PHONE_CORDLESS : " + JSON.stringify(PHONE_CORDLESS));
        expect(true).assertEqual(PHONE_CORDLESS == 0x0208);
        let PHONE_SMART = bluetooth.MajorMinorClass.PHONE_SMART;
        console.info("[bluetooth_js]PHONE_SMART : " + JSON.stringify(PHONE_SMART));
        expect(true).assertEqual(PHONE_SMART == 0x020C);
        let PHONE_MODEM_OR_GATEWAY = bluetooth.MajorMinorClass.PHONE_MODEM_OR_GATEWAY;
        console.info("[bluetooth_js]PHONE_MODEM_OR_GATEWAY : " +
        JSON.stringify(PHONE_MODEM_OR_GATEWAY));
        expect(true).assertEqual(PHONE_MODEM_OR_GATEWAY == 0x0210);
        let PHONE_ISDN = bluetooth.MajorMinorClass.PHONE_ISDN;
        console.info("[bluetooth_js]PHONE_ISDN : " + JSON.stringify(PHONE_ISDN));
        expect(true).assertEqual(PHONE_ISDN == 0x0214);

        let NETWORK_FULLY_AVAILABLE = bluetooth.MajorMinorClass.NETWORK_FULLY_AVAILABLE;
        console.info("[bluetooth_js]NETWORK_FULLY_AVAILABLE : " +
        JSON.stringify(NETWORK_FULLY_AVAILABLE));
        expect(true).assertEqual(NETWORK_FULLY_AVAILABLE == 0x0300);
        let NETWORK_1_TO_17_UTILIZED = bluetooth.MajorMinorClass.NETWORK_1_TO_17_UTILIZED;
        console.info("[bluetooth_js]NETWORK_1_TO_17_UTILIZED : " +
        JSON.stringify(NETWORK_1_TO_17_UTILIZED));
        expect(true).assertEqual(NETWORK_1_TO_17_UTILIZED == 0x0320);
        let NETWORK_17_TO_33_UTILIZED = bluetooth.MajorMinorClass.NETWORK_17_TO_33_UTILIZED;
        console.info("[bluetooth_js]NETWORK_17_TO_33_UTILIZED : " +
        JSON.stringify(NETWORK_17_TO_33_UTILIZED));
        expect(true).assertEqual(NETWORK_17_TO_33_UTILIZED == 0x0340);
        let NETWORK_33_TO_50_UTILIZED = bluetooth.MajorMinorClass.NETWORK_33_TO_50_UTILIZED;
        console.info("[bluetooth_js]NETWORK_33_TO_50_UTILIZED : " +
        JSON.stringify(NETWORK_33_TO_50_UTILIZED));
        expect(true).assertEqual(NETWORK_33_TO_50_UTILIZED == 0x0360);
        let NETWORK_60_TO_67_UTILIZED = bluetooth.MajorMinorClass.NETWORK_60_TO_67_UTILIZED;
        console.info("[bluetooth_js]NETWORK_60_TO_67_UTILIZED : " +
        JSON.stringify(NETWORK_60_TO_67_UTILIZED));
        expect(true).assertEqual(NETWORK_60_TO_67_UTILIZED == 0x0380);
        let NETWORK_67_TO_83_UTILIZED = bluetooth.MajorMinorClass.NETWORK_67_TO_83_UTILIZED;
        console.info("[bluetooth_js]NETWORK_67_TO_83_UTILIZED : " +
        JSON.stringify(NETWORK_67_TO_83_UTILIZED));
        expect(true).assertEqual(NETWORK_67_TO_83_UTILIZED == 0x03A0);
        let NETWORK_83_TO_99_UTILIZED = bluetooth.MajorMinorClass.NETWORK_83_TO_99_UTILIZED;
        console.info("[bluetooth_js]NETWORK_83_TO_99_UTILIZED : " +
        JSON.stringify(NETWORK_83_TO_99_UTILIZED));
        expect(true).assertEqual(NETWORK_83_TO_99_UTILIZED == 0x03C0);
        let NETWORK_NO_SERVICE = bluetooth.MajorMinorClass.NETWORK_NO_SERVICE;
        console.info("[bluetooth_js]NETWORK_NO_SERVICE : " + JSON.stringify(NETWORK_NO_SERVICE));
        expect(true).assertEqual(NETWORK_NO_SERVICE == 0x03E0);

        let AUDIO_VIDEO_UNCATEGORIZED = bluetooth.MajorMinorClass.AUDIO_VIDEO_UNCATEGORIZED;
        console.info("[bluetooth_js]AUDIO_VIDEO_UNCATEGORIZED : " +
        JSON.stringify(AUDIO_VIDEO_UNCATEGORIZED));
        expect(true).assertEqual(AUDIO_VIDEO_UNCATEGORIZED == 0x0400);
        let AUDIO_VIDEO_WEARABLE_HEADSET = bluetooth.MajorMinorClass.AUDIO_VIDEO_WEARABLE_HEADSET;
        console.info("[bluetooth_js]AUDIO_VIDEO_WEARABLE_HEADSET : " +
        JSON.stringify(AUDIO_VIDEO_WEARABLE_HEADSET));
        expect(true).assertEqual(AUDIO_VIDEO_WEARABLE_HEADSET == 0x0404);
        let AUDIO_VIDEO_HANDSFREE = bluetooth.MajorMinorClass.AUDIO_VIDEO_HANDSFREE;
        console.info("[bluetooth_js]AUDIO_VIDEO_HANDSFREE : " +
        JSON.stringify(AUDIO_VIDEO_HANDSFREE));
        expect(true).assertEqual(AUDIO_VIDEO_HANDSFREE == 0x0408);
        let AUDIO_VIDEO_MICROPHONE = bluetooth.MajorMinorClass.AUDIO_VIDEO_MICROPHONE;
        console.info("[bluetooth_js]AUDIO_VIDEO_MICROPHONE : " + JSON.stringify(AUDIO_VIDEO_MICROPHONE));
        expect(true).assertEqual(AUDIO_VIDEO_MICROPHONE == 0x0410);
        let AUDIO_VIDEO_LOUDSPEAKER = bluetooth.MajorMinorClass.AUDIO_VIDEO_LOUDSPEAKER;
        console.info("[bluetooth_js]AUDIO_VIDEO_LOUDSPEAKER : " + JSON.stringify(AUDIO_VIDEO_LOUDSPEAKER));
        expect(true).assertEqual(AUDIO_VIDEO_LOUDSPEAKER == 0x0414);
        let AUDIO_VIDEO_HEADPHONES = bluetooth.MajorMinorClass.AUDIO_VIDEO_HEADPHONES;
        console.info("[bluetooth_js]AUDIO_VIDEO_HEADPHONES : " + JSON.stringify(AUDIO_VIDEO_HEADPHONES));
        expect(true).assertEqual(AUDIO_VIDEO_HEADPHONES == 0x0418);
        let AUDIO_VIDEO_PORTABLE_AUDIO = bluetooth.MajorMinorClass.AUDIO_VIDEO_PORTABLE_AUDIO;
        console.info("[bluetooth_js]AUDIO_VIDEO_PORTABLE_AUDIO : " +
        JSON.stringify(AUDIO_VIDEO_PORTABLE_AUDIO));
        expect(true).assertEqual(AUDIO_VIDEO_PORTABLE_AUDIO == 0x041C);
        let AUDIO_VIDEO_CAR_AUDIO = bluetooth.MajorMinorClass.AUDIO_VIDEO_CAR_AUDIO;
        console.info("[bluetooth_js]AUDIO_VIDEO_CAR_AUDIO : " + JSON.stringify(AUDIO_VIDEO_CAR_AUDIO));
        expect(true).assertEqual(AUDIO_VIDEO_CAR_AUDIO == 0x0420);
        let AUDIO_VIDEO_SET_TOP_BOX = bluetooth.MajorMinorClass.AUDIO_VIDEO_SET_TOP_BOX;
        console.info("[bluetooth_js]AUDIO_VIDEO_SET_TOP_BOX : " + JSON.stringify(AUDIO_VIDEO_SET_TOP_BOX));
        expect(true).assertEqual(AUDIO_VIDEO_SET_TOP_BOX == 0x0424);
        let AUDIO_VIDEO_HIFI_AUDIO = bluetooth.MajorMinorClass.AUDIO_VIDEO_HIFI_AUDIO;
        console.info("[bluetooth_js]AUDIO_VIDEO_HIFI_AUDIO : " + JSON.stringify(AUDIO_VIDEO_HIFI_AUDIO));
        expect(true).assertEqual(AUDIO_VIDEO_HIFI_AUDIO == 0x0428);
        let AUDIO_VIDEO_VCR = bluetooth.MajorMinorClass.AUDIO_VIDEO_VCR;
        console.info("[bluetooth_js]AUDIO_VIDEO_VCR : " + JSON.stringify(AUDIO_VIDEO_VCR));
        expect(true).assertEqual(AUDIO_VIDEO_VCR == 0x042C);
        let AUDIO_VIDEO_VIDEO_CAMERA = bluetooth.MajorMinorClass.AUDIO_VIDEO_VIDEO_CAMERA;
        console.info("[bluetooth_js]AUDIO_VIDEO_VIDEO_CAMERA : " +
        JSON.stringify(AUDIO_VIDEO_VIDEO_CAMERA));
        expect(true).assertEqual(AUDIO_VIDEO_VIDEO_CAMERA == 0x0430);
        let AUDIO_VIDEO_CAMCORDER = bluetooth.MajorMinorClass.AUDIO_VIDEO_CAMCORDER;
        console.info("[bluetooth_js]AUDIO_VIDEO_CAMCORDER : " + JSON.stringify(AUDIO_VIDEO_CAMCORDER));
        expect(true).assertEqual(AUDIO_VIDEO_CAMCORDER == 0x0434);
        let AUDIO_VIDEO_VIDEO_MONITOR = bluetooth.MajorMinorClass.AUDIO_VIDEO_VIDEO_MONITOR;
        console.info("[bluetooth_js]AUDIO_VIDEO_VIDEO_MONITOR : " +
        JSON.stringify(AUDIO_VIDEO_VIDEO_MONITOR));
        expect(true).assertEqual(AUDIO_VIDEO_VIDEO_MONITOR == 0x0438);
        let AUDIO_VIDEO_VIDEO_DISPLAY_AND_LOUDSPEAKER =
            bluetooth.MajorMinorClass.AUDIO_VIDEO_VIDEO_DISPLAY_AND_LOUDSPEAKER;
        console.info("[bluetooth_js]AUDIO_VIDEO_VIDEO_DISPLAY_AND_LOUDSPEAKER : "
        + JSON.stringify(AUDIO_VIDEO_VIDEO_DISPLAY_AND_LOUDSPEAKER));
        expect(true).assertEqual(AUDIO_VIDEO_VIDEO_DISPLAY_AND_LOUDSPEAKER == 0x043C);
        let AUDIO_VIDEO_VIDEO_CONFERENCING = bluetooth.MajorMinorClass.AUDIO_VIDEO_VIDEO_CONFERENCING;
        console.info("[bluetooth_js]AUDIO_VIDEO_VIDEO_CONFERENCING : "
        + JSON.stringify(AUDIO_VIDEO_VIDEO_CONFERENCING));
        expect(true).assertEqual(AUDIO_VIDEO_VIDEO_CONFERENCING == 0x0440);
        let AUDIO_VIDEO_VIDEO_GAMING_TOY = bluetooth.MajorMinorClass.AUDIO_VIDEO_VIDEO_GAMING_TOY;
        console.info("[bluetooth_js]AUDIO_VIDEO_VIDEO_GAMING_TOY : "
        + JSON.stringify(AUDIO_VIDEO_VIDEO_GAMING_TOY));
        expect(true).assertEqual(AUDIO_VIDEO_VIDEO_GAMING_TOY == 0x0448);

        let PERIPHERAL_NON_KEYBOARD_NON_POINTING =
            bluetooth.MajorMinorClass.PERIPHERAL_NON_KEYBOARD_NON_POINTING;
        console.info("[bluetooth_js]PERIPHERAL_NON_KEYBOARD_NON_POINTING : "
        + JSON.stringify(PERIPHERAL_NON_KEYBOARD_NON_POINTING));
        expect(true).assertEqual(PERIPHERAL_NON_KEYBOARD_NON_POINTING == 0x0500);
        let PERIPHERAL_KEYBOARD = bluetooth.MajorMinorClass.PERIPHERAL_KEYBOARD;
        console.info("[bluetooth_js]PERIPHERAL_KEYBOARD : " + JSON.stringify(PERIPHERAL_KEYBOARD));
        expect(true).assertEqual(PERIPHERAL_KEYBOARD == 0x0540);
        let PERIPHERAL_POINTING_DEVICE = bluetooth.MajorMinorClass.PERIPHERAL_POINTING_DEVICE;
        console.info("[bluetooth_js]PERIPHERAL_POINTING_DEVICE : " +
        JSON.stringify(PERIPHERAL_POINTING_DEVICE));
        expect(true).assertEqual(PERIPHERAL_POINTING_DEVICE == 0x0580);
        let PERIPHERAL_KEYBOARD_POINTING = bluetooth.MajorMinorClass.PERIPHERAL_KEYBOARD_POINTING;
        console.info("[bluetooth_js]PERIPHERAL_KEYBOARD_POINTING : " +
        JSON.stringify(PERIPHERAL_KEYBOARD_POINTING));
        expect(true).assertEqual(PERIPHERAL_KEYBOARD_POINTING == 0x05C0);
        let PERIPHERAL_UNCATEGORIZED = bluetooth.MajorMinorClass.PERIPHERAL_UNCATEGORIZED;
        console.info("[bluetooth_js]PERIPHERAL_UNCATEGORIZED : " + JSON.stringify(PERIPHERAL_UNCATEGORIZED));
        expect(true).assertEqual(PERIPHERAL_UNCATEGORIZED == 0x0500);
        let PERIPHERAL_JOYSTICK = bluetooth.MajorMinorClass.PERIPHERAL_JOYSTICK;
        console.info("[bluetooth_js]PERIPHERAL_JOYSTICK : " + JSON.stringify(PERIPHERAL_JOYSTICK));
        expect(true).assertEqual(PERIPHERAL_JOYSTICK == 0x0504);
        let PERIPHERAL_GAMEPAD = bluetooth.MajorMinorClass.PERIPHERAL_GAMEPAD;
        console.info("[bluetooth_js]PERIPHERAL_GAMEPAD : " + JSON.stringify(PERIPHERAL_GAMEPAD));
        expect(true).assertEqual(PERIPHERAL_GAMEPAD == 0x0508);
        let PERIPHERAL_REMOTE_CONTROL = bluetooth.MajorMinorClass.PERIPHERAL_REMOTE_CONTROL;
        console.info("[bluetooth_js]PERIPHERAL_REMOTE_CONTROL : " + JSON.stringify(PERIPHERAL_REMOTE_CONTROL));
        expect(true).assertEqual(PERIPHERAL_REMOTE_CONTROL == 0x05C0);
        let PERIPHERAL_SENSING_DEVICE = bluetooth.MajorMinorClass.PERIPHERAL_SENSING_DEVICE;
        console.info("[bluetooth_js]PERIPHERAL_SENSING_DEVICE : " + JSON.stringify(PERIPHERAL_SENSING_DEVICE));
        expect(true).assertEqual(PERIPHERAL_SENSING_DEVICE == 0x0510);
        let PERIPHERAL_DIGITIZER_TABLET = bluetooth.MajorMinorClass.PERIPHERAL_DIGITIZER_TABLET;
        console.info("[bluetooth_js]PERIPHERAL_DIGITIZER_TABLET : " +
        JSON.stringify(PERIPHERAL_DIGITIZER_TABLET));
        expect(true).assertEqual(PERIPHERAL_DIGITIZER_TABLET == 0x0514);
        let PERIPHERAL_CARD_READER = bluetooth.MajorMinorClass.PERIPHERAL_CARD_READER;
        console.info("[bluetooth_js]PERIPHERAL_CARD_READER : " + JSON.stringify(PERIPHERAL_CARD_READER));
        expect(true).assertEqual(PERIPHERAL_CARD_READER == 0x0518);
        let PERIPHERAL_DIGITAL_PEN = bluetooth.MajorMinorClass.PERIPHERAL_DIGITAL_PEN;
        console.info("[bluetooth_js]PERIPHERAL_DIGITAL_PEN : " + JSON.stringify(PERIPHERAL_DIGITAL_PEN));
        expect(true).assertEqual(PERIPHERAL_DIGITAL_PEN == 0x051C);
        let PERIPHERAL_SCANNER_RFID = bluetooth.MajorMinorClass.PERIPHERAL_SCANNER_RFID;
        console.info("[bluetooth_js]PERIPHERAL_SCANNER_RFID : " + JSON.stringify(PERIPHERAL_SCANNER_RFID));
        expect(true).assertEqual(PERIPHERAL_SCANNER_RFID == 0x0520);
        let PERIPHERAL_GESTURAL_INPUT = bluetooth.MajorMinorClass.PERIPHERAL_GESTURAL_INPUT;
        console.info("[bluetooth_js]PERIPHERAL_GESTURAL_INPUT : " +
        JSON.stringify(PERIPHERAL_GESTURAL_INPUT));
        expect(true).assertEqual(PERIPHERAL_GESTURAL_INPUT == 0x0522);

        let IMAGING_UNCATEGORIZED = bluetooth.MajorMinorClass.IMAGING_UNCATEGORIZED;
        console.info("[bluetooth_js]IMAGING_UNCATEGORIZED : " + JSON.stringify(IMAGING_UNCATEGORIZED));
        expect(true).assertEqual(IMAGING_UNCATEGORIZED == 0x0600);
        let IMAGING_DISPLAY = bluetooth.MajorMinorClass.IMAGING_DISPLAY;
        console.info("[bluetooth_js]IMAGING_DISPLAY : " + JSON.stringify(IMAGING_DISPLAY));
        expect(true).assertEqual(IMAGING_DISPLAY == 0x0610);
        let IMAGING_CAMERA = bluetooth.MajorMinorClass.IMAGING_CAMERA;
        console.info("[bluetooth_js]IMAGING_CAMERA : " + JSON.stringify(IMAGING_CAMERA));
        expect(true).assertEqual(IMAGING_CAMERA == 0x0620);
        let IMAGING_SCANNER = bluetooth.MajorMinorClass.IMAGING_SCANNER;
        console.info("[bluetooth_js]IMAGING_SCANNER : " + JSON.stringify(IMAGING_SCANNER));
        expect(true).assertEqual(IMAGING_SCANNER == 0x0640);
        let IMAGING_PRINTER = bluetooth.MajorMinorClass.IMAGING_PRINTER;
        console.info("[bluetooth_js]IMAGING_PRINTER : " + JSON.stringify(IMAGING_PRINTER));
        expect(true).assertEqual(IMAGING_PRINTER == 0x0680);

        let WEARABLE_UNCATEGORIZED = bluetooth.MajorMinorClass.WEARABLE_UNCATEGORIZED;
        console.info("[bluetooth_js]WEARABLE_UNCATEGORIZED : " + JSON.stringify(WEARABLE_UNCATEGORIZED));
        expect(true).assertEqual(WEARABLE_UNCATEGORIZED == 0x0700);
        let WEARABLE_WRIST_WATCH = bluetooth.MajorMinorClass.WEARABLE_WRIST_WATCH;
        console.info("[bluetooth_js]WEARABLE_WRIST_WATCH : " + JSON.stringify(WEARABLE_WRIST_WATCH));
        expect(true).assertEqual(WEARABLE_WRIST_WATCH == 0x0704);
        let WEARABLE_PAGER = bluetooth.MajorMinorClass.WEARABLE_PAGER;
        console.info("[bluetooth_js]WEARABLE_PAGER : " + JSON.stringify(WEARABLE_PAGER));
        expect(true).assertEqual(WEARABLE_PAGER == 0x0708);
        let WEARABLE_JACKET = bluetooth.MajorMinorClass.WEARABLE_JACKET;
        console.info("[bluetooth_js]WEARABLE_JACKET : " + JSON.stringify(WEARABLE_JACKET));
        expect(true).assertEqual(WEARABLE_JACKET == 0x070C);
        let WEARABLE_HELMET = bluetooth.MajorMinorClass.WEARABLE_HELMET;
        console.info("[bluetooth_js]WEARABLE_HELMET : " + JSON.stringify(WEARABLE_HELMET));
        expect(true).assertEqual(WEARABLE_HELMET == 0x0710);
        let WEARABLE_GLASSES = bluetooth.MajorMinorClass.WEARABLE_GLASSES;
        console.info("[bluetooth_js]WEARABLE_GLASSES : " + JSON.stringify(WEARABLE_GLASSES));
        expect(true).assertEqual(WEARABLE_GLASSES == 0x0714);

        let TOY_UNCATEGORIZED = bluetooth.MajorMinorClass.TOY_UNCATEGORIZED;
        console.info("[bluetooth_js]TOY_UNCATEGORIZED : " + JSON.stringify(TOY_UNCATEGORIZED));
        expect(true).assertEqual(TOY_UNCATEGORIZED == 0x0800);
        let TOY_ROBOT = bluetooth.MajorMinorClass.TOY_ROBOT;
        console.info("[bluetooth_js]TOY_ROBOT : " + JSON.stringify(TOY_ROBOT));
        expect(true).assertEqual(TOY_ROBOT == 0x0804);
        let TOY_VEHICLE = bluetooth.MajorMinorClass.TOY_VEHICLE;
        console.info("[bluetooth_js]TOY_VEHICLE : " + JSON.stringify(TOY_VEHICLE));
        expect(true).assertEqual(TOY_VEHICLE == 0x0808);
        let TOY_DOLL_ACTION_FIGURE = bluetooth.MajorMinorClass.TOY_DOLL_ACTION_FIGURE;
        console.info("[bluetooth_js]TOY_DOLL_ACTION_FIGURE : " + JSON.stringify(TOY_DOLL_ACTION_FIGURE));
        expect(true).assertEqual(TOY_DOLL_ACTION_FIGURE == 0x080C);
        let TOY_CONTROLLER = bluetooth.MajorMinorClass.TOY_CONTROLLER;
        console.info("[bluetooth_js]TOY_CONTROLLER : " + JSON.stringify(TOY_CONTROLLER));
        expect(true).assertEqual(TOY_CONTROLLER == 0x0810);
        let TOY_GAME = bluetooth.MajorMinorClass.TOY_GAME;
        console.info("[bluetooth_js]TOY_GAME : " + JSON.stringify(TOY_GAME));
        expect(true).assertEqual(TOY_GAME == 0x0814);

        let HEALTH_UNCATEGORIZED = bluetooth.MajorMinorClass.HEALTH_UNCATEGORIZED;
        console.info("[bluetooth_js]HEALTH_UNCATEGORIZED : " + JSON.stringify(HEALTH_UNCATEGORIZED));
        expect(true).assertEqual(HEALTH_UNCATEGORIZED == 0x0900);
        let HEALTH_BLOOD_PRESSURE = bluetooth.MajorMinorClass.HEALTH_BLOOD_PRESSURE;
        console.info("[bluetooth_js]HEALTH_BLOOD_PRESSURE : " + JSON.stringify(HEALTH_BLOOD_PRESSURE));
        expect(true).assertEqual(HEALTH_BLOOD_PRESSURE == 0x0904);
        let HEALTH_THERMOMETER = bluetooth.MajorMinorClass.HEALTH_THERMOMETER;
        console.info("[bluetooth_js]HEALTH_THERMOMETER : " + JSON.stringify(HEALTH_THERMOMETER));
        expect(true).assertEqual(HEALTH_THERMOMETER == 0x0908);
        let HEALTH_WEIGHING = bluetooth.MajorMinorClass.HEALTH_WEIGHING;
        console.info("[bluetooth_js]HEALTH_WEIGHING : " + JSON.stringify(HEALTH_WEIGHING));
        expect(true).assertEqual(HEALTH_WEIGHING == 0x090C);
        let HEALTH_GLUCOSE = bluetooth.MajorMinorClass.HEALTH_GLUCOSE;
        console.info("[bluetooth_js]HEALTH_GLUCOSE : " + JSON.stringify(HEALTH_GLUCOSE));
        expect(true).assertEqual(HEALTH_GLUCOSE == 0x0910);
        let HEALTH_PULSE_OXIMETER = bluetooth.MajorMinorClass.HEALTH_PULSE_OXIMETER;
        console.info("[bluetooth_js]HEALTH_PULSE_OXIMETER : " + JSON.stringify(HEALTH_PULSE_OXIMETER));
        expect(true).assertEqual(HEALTH_PULSE_OXIMETER == 0x0914);
        let HEALTH_PULSE_RATE = bluetooth.MajorMinorClass.HEALTH_PULSE_RATE;
        console.info("[bluetooth_js]HEALTH_PULSE_RATE : " + JSON.stringify(HEALTH_PULSE_RATE));
        expect(true).assertEqual(HEALTH_PULSE_RATE == 0x0918);
        let HEALTH_DATA_DISPLAY = bluetooth.MajorMinorClass.HEALTH_DATA_DISPLAY;
        console.info("[bluetooth_js]HEALTH_DATA_DISPLAY : " + JSON.stringify(HEALTH_DATA_DISPLAY));
        expect(true).assertEqual(HEALTH_DATA_DISPLAY == 0x091C);
        let HEALTH_STEP_COUNTER = bluetooth.MajorMinorClass.HEALTH_STEP_COUNTER;
        console.info("[bluetooth_js]HEALTH_STEP_COUNTER : " + JSON.stringify(HEALTH_STEP_COUNTER));
        expect(true).assertEqual(HEALTH_STEP_COUNTER == 0x0920);
        let HEALTH_BODY_COMPOSITION_ANALYZER = bluetooth.MajorMinorClass.HEALTH_BODY_COMPOSITION_ANALYZER;
        console.info("[bluetooth_js]HEALTH_BODY_COMPOSITION_ANALYZER : " +
        JSON.stringify(HEALTH_BODY_COMPOSITION_ANALYZER));
        expect(true).assertEqual(HEALTH_BODY_COMPOSITION_ANALYZER == 0x0924);
        let HEALTH_PEAK_FLOW_MONITOR = bluetooth.MajorMinorClass.HEALTH_PEAK_FLOW_MONITOR;
        console.info("[bluetooth_js]HEALTH_PEAK_FLOW_MONITOR : " + JSON.stringify(HEALTH_PEAK_FLOW_MONITOR));
        expect(true).assertEqual(HEALTH_PEAK_FLOW_MONITOR == 0x0928);
        let HEALTH_MEDICATION_MONITOR = bluetooth.MajorMinorClass.HEALTH_MEDICATION_MONITOR;
        console.info("[bluetooth_js]HEALTH_MEDICATION_MONITOR : " +
        JSON.stringify(HEALTH_MEDICATION_MONITOR));
        expect(true).assertEqual(HEALTH_MEDICATION_MONITOR == 0x092C);
        let HEALTH_KNEE_PROSTHESIS = bluetooth.MajorMinorClass.HEALTH_KNEE_PROSTHESIS;
        console.info("[bluetooth_js]HEALTH_KNEE_PROSTHESIS : " + JSON.stringify(HEALTH_KNEE_PROSTHESIS));
        expect(true).assertEqual(HEALTH_KNEE_PROSTHESIS == 0x0930);
        let HEALTH_ANKLE_PROSTHESIS = bluetooth.MajorMinorClass.HEALTH_ANKLE_PROSTHESIS;
        console.info("[bluetooth_js]HEALTH_ANKLE_PROSTHESIS : " + JSON.stringify(HEALTH_ANKLE_PROSTHESIS));
        expect(true).assertEqual(HEALTH_ANKLE_PROSTHESIS == 0x0934);
        let HEALTH_GENERIC_HEALTH_MANAGER = bluetooth.MajorMinorClass.HEALTH_GENERIC_HEALTH_MANAGER;
        console.info("[bluetooth_js]HEALTH_GENERIC_HEALTH_MANAGER : " +
        JSON.stringify(HEALTH_GENERIC_HEALTH_MANAGER));
        expect(true).assertEqual(HEALTH_GENERIC_HEALTH_MANAGER == 0x0938);
        let HEALTH_PERSONAL_MOBILITY_DEVICE = bluetooth.MajorMinorClass.HEALTH_PERSONAL_MOBILITY_DEVICE;
        console.info("[bluetooth_js]HEALTH_PERSONAL_MOBILITY_DEVICE : " +
        JSON.stringify(HEALTH_PERSONAL_MOBILITY_DEVICE));
        expect(true).assertEqual(HEALTH_PERSONAL_MOBILITY_DEVICE == 0x093C);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_CONSTANT_0500
     * @tc.name testProfileUuids
     * @tc.desc Test constant api12
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_CONSTANT_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        let hfpAg = bluetooth.ProfileUuids.PROFILE_UUID_HFP_AG;
        console.info("[bluetooth_js]PROFILE_UUID_HFP_AG : " + JSON.stringify(hfpAg));
        expect('0000111F-0000-1000-8000-00805F9B34FB').assertEqual(hfpAg);

        let hfpHf = bluetooth.ProfileUuids.PROFILE_UUID_HFP_HF;
        console.info("[bluetooth_js]PROFILE_UUID_HFP_HF : " + JSON.stringify(hfpHf));
        expect('0000111E-0000-1000-8000-00805F9B34FB').assertEqual(hfpHf);

        let hspAg = bluetooth.ProfileUuids.PROFILE_UUID_HSP_AG;
        console.info("[bluetooth_js]PROFILE_UUID_HSP_AG : " + JSON.stringify(hspAg));
        expect('00001112-0000-1000-8000-00805F9B34FB').assertEqual(hspAg);

        let hspHs = bluetooth.ProfileUuids.PROFILE_UUID_HSP_HS;
        console.info("[bluetooth_js]PROFILE_UUID_HSP_HS : " + JSON.stringify(hspHs));
        expect('00001108-0000-1000-8000-00805F9B34FB').assertEqual(hspHs);

        let a2dpSrc = bluetooth.ProfileUuids.PROFILE_UUID_A2DP_SRC;
        console.info("[bluetooth_js]PROFILE_UUID_A2DP_SRC : " + JSON.stringify(a2dpSrc));
        expect('0000110A-0000-1000-8000-00805F9B34FB').assertEqual(a2dpSrc);

        let a2dpSink = bluetooth.ProfileUuids.PROFILE_UUID_A2DP_SINK;
        console.info("[bluetooth_js]PROFILE_UUID_A2DP_SINK : " + JSON.stringify(a2dpSink));
        expect('0000110B-0000-1000-8000-00805F9B34FB').assertEqual(a2dpSink);

        let avrcpCt = bluetooth.ProfileUuids.PROFILE_UUID_AVRCP_CT;
        console.info("[bluetooth_js]PROFILE_UUID_AVRCP_CT : " + JSON.stringify(avrcpCt));
        expect('0000110E-0000-1000-8000-00805F9B34FB').assertEqual(avrcpCt);

        let avrcpTg = bluetooth.ProfileUuids.PROFILE_UUID_AVRCP_TG;
        console.info("[bluetooth_js]PROFILE_UUID_AVRCP_TG : " + JSON.stringify(avrcpTg));
        expect('0000110C-0000-1000-8000-00805F9B34FB').assertEqual(avrcpTg);

        let hid = bluetooth.ProfileUuids.PROFILE_UUID_HID;
        console.info("[bluetooth_js]PROFILE_UUID_HID : " + JSON.stringify(hid));
        expect('00001124-0000-1000-8000-00805F9B34FB').assertEqual(hid);

        let hogp = bluetooth.ProfileUuids.PROFILE_UUID_HOGP;
        console.info("[bluetooth_js]PROFILE_UUID_HOGP : " + JSON.stringify(hogp));
        expect('00001812-0000-1000-8000-00805F9B34FB').assertEqual(hogp);
        done();
    })
})
}