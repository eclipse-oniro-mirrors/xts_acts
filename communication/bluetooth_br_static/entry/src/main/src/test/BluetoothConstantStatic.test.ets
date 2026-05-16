/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, Hypium, beforeEach } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import constant from '@ohos.bluetooth.constant';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import { Permissions } from 'permissions';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testBtConstantTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let g_context: common.UIAbilityContext;

export default function bluetoothConstantTest() {

    describe("bluetoothConstantTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        beforeAll(async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'beforeAll start');
            try {
                await Utils.msSleep(2000);
                hilog.info(domain, tag, " uitestOnTest load up over!!!!!")
                g_context = Hypium.get('Context') as common.UIAbilityContext;
                let atManager = abilityAccessCtrl.createAtManager();
                let arr: Array<Permissions> = new Array<Permissions>();
                arr.push('ohos.permission.ACCESS_BLUETOOTH')
                atManager.requestPermissionsFromUser(g_context, arr,
                  (err: BusinessError<void> | null, data: PermissionRequestResult | undefined) => {
                    hilog.info(0x0000, 'testTag', ' requestPermissionsFromUser end');
                    hilog.info(domain, tag, "request success permissions" + JSON.stringify(data));
                    hilog.info(domain, tag, "getPermissionRequestResult err" + JSON.stringify(err));
                  });
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag, '%{public}s', 'get failed, err: ' + err);
            }
            await Utils.msSleep(2000);
            await Utils.clickRequestPermission('允许');
            hilog.info(domain, tag, '%{public}s', 'beforeAll end');
        })

        beforeEach(async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'beforeEach start');
            try {
                await Utils.openBluetooth();
                hilog.info(domain, tag, '%{public}s', 'beforeEach end');
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag, '%{public}s', 'beforeEach get failed, err: ' + err);
            }
        })

        /**
         * @tc.number  testProfileId
         * @tc.name    testProfileId
         * @tc.desc    Test testProfileId API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("testProfileId", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let PROFILE_A2DP_SOURCE = constant.ProfileId.PROFILE_A2DP_SOURCE;
                hilog.info(domain, tag, "PROFILE_A2DP_SOURCE : " + JSON.stringify(PROFILE_A2DP_SOURCE));
                expect(true).assertEqual(PROFILE_A2DP_SOURCE === 1);
                let PROFILE_HANDSFREE_AUDIO_GATEWAY = constant.ProfileId.PROFILE_HANDSFREE_AUDIO_GATEWAY;
                hilog.info(domain, tag, "PROFILE_HANDSFREE_AUDIO_GATEWAY : " + JSON.stringify(PROFILE_HANDSFREE_AUDIO_GATEWAY));
                expect(true).assertEqual(PROFILE_HANDSFREE_AUDIO_GATEWAY === 4);
                let PROFILE_HID_HOST = constant.ProfileId.PROFILE_HID_HOST;
                hilog.info(domain, tag, "PROFILE_HID_HOST : " + JSON.stringify(PROFILE_HID_HOST));
                expect(true).assertEqual(PROFILE_HID_HOST === 6);
                let PROFILE_PAN_NETWORK = constant.ProfileId.PROFILE_PAN_NETWORK;
                hilog.info(domain, tag, "PROFILE_PAN_NETWORK : " + JSON.stringify(PROFILE_PAN_NETWORK));
                expect(true).assertEqual(PROFILE_PAN_NETWORK === 7);
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "testProfileId get errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number  testProfileUuids
         * @tc.name    testProfileUuids
         * @tc.desc    Test testProfileUuids API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("testProfileUuids", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let hfpAg = constant.ProfileUuids.PROFILE_UUID_HFP_AG;
                hilog.info(domain, tag, "PROFILE_UUID_HFP_AG : " + JSON.stringify(hfpAg));
                expect('0000111F-0000-1000-8000-00805F9B34FB').assertEqual(hfpAg);

                let hfpHf = constant.ProfileUuids.PROFILE_UUID_HFP_HF;
                hilog.info(domain, tag, "PROFILE_UUID_HFP_HF : " + JSON.stringify(hfpHf));
                expect('0000111E-0000-1000-8000-00805F9B34FB').assertEqual(hfpHf);

                let hspAg = constant.ProfileUuids.PROFILE_UUID_HSP_AG;
                hilog.info(domain, tag, "PROFILE_UUID_HSP_AG : " + JSON.stringify(hspAg));
                expect('00001112-0000-1000-8000-00805F9B34FB').assertEqual(hspAg);

                let hspHs = constant.ProfileUuids.PROFILE_UUID_HSP_HS;
                hilog.info(domain, tag, "PROFILE_UUID_HSP_HS : " + JSON.stringify(hspHs));
                expect('00001108-0000-1000-8000-00805F9B34FB').assertEqual(hspHs);

                let a2dpSrc = constant.ProfileUuids.PROFILE_UUID_A2DP_SRC;
                hilog.info(domain, tag, "PROFILE_UUID_A2DP_SRC : " + JSON.stringify(a2dpSrc));
                expect('0000110A-0000-1000-8000-00805F9B34FB').assertEqual(a2dpSrc);

                let a2dpSink = constant.ProfileUuids.PROFILE_UUID_A2DP_SINK;
                hilog.info(domain, tag, "PROFILE_UUID_A2DP_SINK : " + JSON.stringify(a2dpSink));
                expect('0000110B-0000-1000-8000-00805F9B34FB').assertEqual(a2dpSink);

                let avrcpCt = constant.ProfileUuids.PROFILE_UUID_AVRCP_CT;
                hilog.info(domain, tag, "PROFILE_UUID_AVRCP_CT : " + JSON.stringify(avrcpCt));
                expect('0000110E-0000-1000-8000-00805F9B34FB').assertEqual(avrcpCt);

                let avrcpTg = constant.ProfileUuids.PROFILE_UUID_AVRCP_TG;
                hilog.info(domain, tag, "PROFILE_UUID_AVRCP_TG : " + JSON.stringify(avrcpTg));
                expect('0000110C-0000-1000-8000-00805F9B34FB').assertEqual(avrcpTg);

                let hid = constant.ProfileUuids.PROFILE_UUID_HID;
                hilog.info(domain, tag, "PROFILE_UUID_HID : " + JSON.stringify(hid));
                expect('00001124-0000-1000-8000-00805F9B34FB').assertEqual(hid);

                let hogp = constant.ProfileUuids.PROFILE_UUID_HOGP;
                hilog.info(domain, tag, "PROFILE_UUID_HOGP : " + JSON.stringify(hogp));
                expect('00001812-0000-1000-8000-00805F9B34FB').assertEqual(hogp);
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "testProfileUuids get errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number  testProfileConnectionState
         * @tc.name    testProfileConnectionState
         * @tc.desc    Test testProfileConnectionState API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("testProfileConnectionState", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let STATE_DISCONNECTED = constant.ProfileConnectionState.STATE_DISCONNECTED;
                hilog.info(domain, tag, "STATE_DISCONNECTED : " + JSON.stringify(STATE_DISCONNECTED));
                expect(true).assertEqual(STATE_DISCONNECTED === 0);
                let STATE_CONNECTING = constant.ProfileConnectionState.STATE_CONNECTING;
                hilog.info(domain, tag, "STATE_CONNECTING : " + JSON.stringify(STATE_CONNECTING));
                expect(true).assertEqual(STATE_CONNECTING === 1);
                let STATE_CONNECTED = constant.ProfileConnectionState.STATE_CONNECTED;
                hilog.info(domain, tag, "STATE_CONNECTED : " + JSON.stringify(STATE_CONNECTED));
                expect(true).assertEqual(STATE_CONNECTED === 2);
                let STATE_DISCONNECTING = constant.ProfileConnectionState.STATE_DISCONNECTING;
                hilog.info(domain, tag, "STATE_DISCONNECTING : " + JSON.stringify(STATE_DISCONNECTING));
                expect(true).assertEqual(STATE_DISCONNECTING === 3);
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "testProfileConnectionState get errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number  testMajorClass
         * @tc.name    testMajorClass
         * @tc.desc    Test testMajorClass API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("testMajorClass", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let MAJOR_MISC = constant.MajorClass.MAJOR_MISC;
                hilog.info(domain, tag, "MAJOR_MISC : " + JSON.stringify(MAJOR_MISC));
                expect(true).assertEqual(MAJOR_MISC === 0x0000);
                let MAJOR_COMPUTER = constant.MajorClass.MAJOR_COMPUTER;
                hilog.info(domain, tag, "MAJOR_COMPUTER : " + JSON.stringify(MAJOR_COMPUTER));
                expect(true).assertEqual(MAJOR_COMPUTER === 0x0100);
                let MAJOR_PHONE = constant.MajorClass.MAJOR_PHONE;
                hilog.info(domain, tag, "MAJOR_PHONE : " + JSON.stringify(MAJOR_PHONE));
                expect(true).assertEqual(MAJOR_PHONE === 0x0200);
                let MAJOR_NETWORKING = constant.MajorClass.MAJOR_NETWORKING;
                hilog.info(domain, tag, "MAJOR_NETWORKING : " + JSON.stringify(MAJOR_NETWORKING));
                expect(true).assertEqual(MAJOR_NETWORKING === 0x0300);
                let MAJOR_AUDIO_VIDEO = constant.MajorClass.MAJOR_AUDIO_VIDEO;
                hilog.info(domain, tag, "MAJOR_AUDIO_VIDEO : " + JSON.stringify(MAJOR_AUDIO_VIDEO));
                expect(true).assertEqual(MAJOR_AUDIO_VIDEO === 0x0400);
                let MAJOR_PERIPHERAL = constant.MajorClass.MAJOR_PERIPHERAL;
                hilog.info(domain, tag, "MAJOR_PERIPHERAL : " + JSON.stringify(MAJOR_PERIPHERAL));
                expect(true).assertEqual(MAJOR_PERIPHERAL === 0x0500);
                let MAJOR_IMAGING = constant.MajorClass.MAJOR_IMAGING;
                hilog.info(domain, tag, "MAJOR_IMAGING : " + JSON.stringify(MAJOR_IMAGING));
                expect(true).assertEqual(MAJOR_IMAGING === 0x0600);
                let MAJOR_WEARABLE = constant.MajorClass.MAJOR_WEARABLE;
                hilog.info(domain, tag, "MAJOR_WEARABLE : " + JSON.stringify(MAJOR_WEARABLE));
                expect(true).assertEqual(MAJOR_WEARABLE === 0x0700);
                let MAJOR_TOY = constant.MajorClass.MAJOR_TOY;
                hilog.info(domain, tag, "MAJOR_TOY : " + JSON.stringify(MAJOR_TOY));
                expect(true).assertEqual(MAJOR_TOY === 0x0800);
                let MAJOR_HEALTH = constant.MajorClass.MAJOR_HEALTH;
                hilog.info(domain, tag, "MAJOR_HEALTH : " + JSON.stringify(MAJOR_HEALTH));
                expect(true).assertEqual(MAJOR_HEALTH === 0x0900);
                let MAJOR_UNCATEGORIZED = constant.MajorClass.MAJOR_UNCATEGORIZED;
                hilog.info(domain, tag, "MAJOR_UNCATEGORIZED : " + JSON.stringify(MAJOR_UNCATEGORIZED));
                expect(true).assertEqual(MAJOR_UNCATEGORIZED === 0x1F00);
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "testMajorClass get errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number  testMajorMinorClass
         * @tc.name    testMajorMinorClass
         * @tc.desc    Test testMajorMinorClass API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("testMajorMinorClass", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let COMPUTER_UNCATEGORIZED = constant.MajorMinorClass.COMPUTER_UNCATEGORIZED;
                hilog.info(domain, tag, "COMPUTER_UNCATEGORIZED : " +
                JSON.stringify(COMPUTER_UNCATEGORIZED));
                expect(true).assertEqual(COMPUTER_UNCATEGORIZED === 0x0100);
                let COMPUTER_DESKTOP = constant.MajorMinorClass.COMPUTER_DESKTOP;
                hilog.info(domain, tag, "COMPUTER_DESKTOP : " + JSON.stringify(COMPUTER_DESKTOP));
                expect(true).assertEqual(COMPUTER_DESKTOP === 0x0104);
                let COMPUTER_SERVER = constant.MajorMinorClass.COMPUTER_SERVER;
                hilog.info(domain, tag, "COMPUTER_SERVER : " + JSON.stringify(COMPUTER_SERVER));
                expect(true).assertEqual(COMPUTER_SERVER === 0x0108);
                let COMPUTER_LAPTOP = constant.MajorMinorClass.COMPUTER_LAPTOP;
                hilog.info(domain, tag, "COMPUTER_LAPTOP : " + JSON.stringify(COMPUTER_LAPTOP));
                expect(true).assertEqual(COMPUTER_LAPTOP === 0x010C);
                let COMPUTER_HANDHELD_PC_PDA = constant.MajorMinorClass.COMPUTER_HANDHELD_PC_PDA;
                hilog.info(domain, tag, "COMPUTER_HANDHELD_PC_PDA : " +
                JSON.stringify(COMPUTER_HANDHELD_PC_PDA));
                expect(true).assertEqual(COMPUTER_HANDHELD_PC_PDA === 0x0110);
                let COMPUTER_PALM_SIZE_PC_PDA = constant.MajorMinorClass.COMPUTER_PALM_SIZE_PC_PDA;
                hilog.info(domain, tag, "COMPUTER_PALM_SIZE_PC_PDA : " +
                JSON.stringify(COMPUTER_PALM_SIZE_PC_PDA));
                expect(true).assertEqual(COMPUTER_PALM_SIZE_PC_PDA === 0x0114);
                let COMPUTER_WEARABLE = constant.MajorMinorClass.COMPUTER_WEARABLE;
                hilog.info(domain, tag, "COMPUTER_WEARABLE : " + JSON.stringify(COMPUTER_WEARABLE));
                expect(true).assertEqual(COMPUTER_WEARABLE === 0x0118);
                let COMPUTER_TABLET = constant.MajorMinorClass.COMPUTER_TABLET;
                hilog.info(domain, tag, "COMPUTER_TABLET : " + JSON.stringify(COMPUTER_TABLET));
                expect(true).assertEqual(COMPUTER_TABLET === 0x011C);

                let PHONE_UNCATEGORIZED = constant.MajorMinorClass.PHONE_UNCATEGORIZED;
                hilog.info(domain, tag, "PHONE_UNCATEGORIZED : " +
                JSON.stringify(PHONE_UNCATEGORIZED));
                expect(true).assertEqual(PHONE_UNCATEGORIZED === 0x0200);
                let PHONE_CELLULAR = constant.MajorMinorClass.PHONE_CELLULAR;
                hilog.info(domain, tag, "PHONE_CELLULAR : " + JSON.stringify(PHONE_CELLULAR));
                expect(true).assertEqual(PHONE_CELLULAR === 0x0204);
                let PHONE_CORDLESS = constant.MajorMinorClass.PHONE_CORDLESS;
                hilog.info(domain, tag, "PHONE_CORDLESS : " + JSON.stringify(PHONE_CORDLESS));
                expect(true).assertEqual(PHONE_CORDLESS === 0x0208);
                let PHONE_SMART = constant.MajorMinorClass.PHONE_SMART;
                hilog.info(domain, tag, "PHONE_SMART : " + JSON.stringify(PHONE_SMART));
                expect(true).assertEqual(PHONE_SMART === 0x020C);
                let PHONE_MODEM_OR_GATEWAY = constant.MajorMinorClass.PHONE_MODEM_OR_GATEWAY;
                hilog.info(domain, tag, "PHONE_MODEM_OR_GATEWAY : " +
                JSON.stringify(PHONE_MODEM_OR_GATEWAY));
                expect(true).assertEqual(PHONE_MODEM_OR_GATEWAY === 0x0210);
                let PHONE_ISDN = constant.MajorMinorClass.PHONE_ISDN;
                hilog.info(domain, tag, "PHONE_ISDN : " + JSON.stringify(PHONE_ISDN));
                expect(true).assertEqual(PHONE_ISDN === 0x0214);

                let NETWORK_FULLY_AVAILABLE = constant.MajorMinorClass.NETWORK_FULLY_AVAILABLE;
                hilog.info(domain, tag, "NETWORK_FULLY_AVAILABLE : " +
                JSON.stringify(NETWORK_FULLY_AVAILABLE));
                expect(true).assertEqual(NETWORK_FULLY_AVAILABLE === 0x0300);
                let NETWORK_1_TO_17_UTILIZED = constant.MajorMinorClass.NETWORK_1_TO_17_UTILIZED;
                hilog.info(domain, tag, "NETWORK_1_TO_17_UTILIZED : " +
                JSON.stringify(NETWORK_1_TO_17_UTILIZED));
                expect(true).assertEqual(NETWORK_1_TO_17_UTILIZED === 0x0320);
                let NETWORK_17_TO_33_UTILIZED = constant.MajorMinorClass.NETWORK_17_TO_33_UTILIZED;
                hilog.info(domain, tag, "NETWORK_17_TO_33_UTILIZED : " +
                JSON.stringify(NETWORK_17_TO_33_UTILIZED));
                expect(true).assertEqual(NETWORK_17_TO_33_UTILIZED === 0x0340);
                let NETWORK_33_TO_50_UTILIZED = constant.MajorMinorClass.NETWORK_33_TO_50_UTILIZED;
                hilog.info(domain, tag, "NETWORK_33_TO_50_UTILIZED : " +
                JSON.stringify(NETWORK_33_TO_50_UTILIZED));
                expect(true).assertEqual(NETWORK_33_TO_50_UTILIZED === 0x0360);
                let NETWORK_60_TO_67_UTILIZED = constant.MajorMinorClass.NETWORK_60_TO_67_UTILIZED;
                hilog.info(domain, tag, "NETWORK_60_TO_67_UTILIZED : " +
                JSON.stringify(NETWORK_60_TO_67_UTILIZED));
                expect(true).assertEqual(NETWORK_60_TO_67_UTILIZED === 0x0380);
                let NETWORK_67_TO_83_UTILIZED = constant.MajorMinorClass.NETWORK_67_TO_83_UTILIZED;
                hilog.info(domain, tag, "NETWORK_67_TO_83_UTILIZED : " +
                JSON.stringify(NETWORK_67_TO_83_UTILIZED));
                expect(true).assertEqual(NETWORK_67_TO_83_UTILIZED === 0x03A0);
                let NETWORK_83_TO_99_UTILIZED = constant.MajorMinorClass.NETWORK_83_TO_99_UTILIZED;
                hilog.info(domain, tag, "NETWORK_83_TO_99_UTILIZED : " +
                JSON.stringify(NETWORK_83_TO_99_UTILIZED));
                expect(true).assertEqual(NETWORK_83_TO_99_UTILIZED === 0x03C0);
                let NETWORK_NO_SERVICE = constant.MajorMinorClass.NETWORK_NO_SERVICE;
                hilog.info(domain, tag, "NETWORK_NO_SERVICE : " + JSON.stringify(NETWORK_NO_SERVICE));
                expect(true).assertEqual(NETWORK_NO_SERVICE === 0x03E0);

                let AUDIO_VIDEO_UNCATEGORIZED = constant.MajorMinorClass.AUDIO_VIDEO_UNCATEGORIZED;
                hilog.info(domain, tag, "AUDIO_VIDEO_UNCATEGORIZED : " +
                JSON.stringify(AUDIO_VIDEO_UNCATEGORIZED));
                expect(true).assertEqual(AUDIO_VIDEO_UNCATEGORIZED === 0x0400);
                let AUDIO_VIDEO_WEARABLE_HEADSET = constant.MajorMinorClass.AUDIO_VIDEO_WEARABLE_HEADSET;
                hilog.info(domain, tag, "AUDIO_VIDEO_WEARABLE_HEADSET : " +
                JSON.stringify(AUDIO_VIDEO_WEARABLE_HEADSET));
                expect(true).assertEqual(AUDIO_VIDEO_WEARABLE_HEADSET === 0x0404);
                let AUDIO_VIDEO_HANDSFREE = constant.MajorMinorClass.AUDIO_VIDEO_HANDSFREE;
                hilog.info(domain, tag, "AUDIO_VIDEO_HANDSFREE : " +
                JSON.stringify(AUDIO_VIDEO_HANDSFREE));
                expect(true).assertEqual(AUDIO_VIDEO_HANDSFREE === 0x0408);
                let AUDIO_VIDEO_MICROPHONE = constant.MajorMinorClass.AUDIO_VIDEO_MICROPHONE;
                hilog.info(domain, tag, "AUDIO_VIDEO_MICROPHONE : " + JSON.stringify(AUDIO_VIDEO_MICROPHONE));
                expect(true).assertEqual(AUDIO_VIDEO_MICROPHONE === 0x0410);
                let AUDIO_VIDEO_LOUDSPEAKER = constant.MajorMinorClass.AUDIO_VIDEO_LOUDSPEAKER;
                hilog.info(domain, tag, "AUDIO_VIDEO_LOUDSPEAKER : " + JSON.stringify(AUDIO_VIDEO_LOUDSPEAKER));
                expect(true).assertEqual(AUDIO_VIDEO_LOUDSPEAKER === 0x0414);
                let AUDIO_VIDEO_HEADPHONES = constant.MajorMinorClass.AUDIO_VIDEO_HEADPHONES;
                hilog.info(domain, tag, "AUDIO_VIDEO_HEADPHONES : " + JSON.stringify(AUDIO_VIDEO_HEADPHONES));
                expect(true).assertEqual(AUDIO_VIDEO_HEADPHONES === 0x0418);
                let AUDIO_VIDEO_PORTABLE_AUDIO = constant.MajorMinorClass.AUDIO_VIDEO_PORTABLE_AUDIO;
                hilog.info(domain, tag, "AUDIO_VIDEO_PORTABLE_AUDIO : " +
                JSON.stringify(AUDIO_VIDEO_PORTABLE_AUDIO));
                expect(true).assertEqual(AUDIO_VIDEO_PORTABLE_AUDIO === 0x041C);
                let AUDIO_VIDEO_CAR_AUDIO = constant.MajorMinorClass.AUDIO_VIDEO_CAR_AUDIO;
                hilog.info(domain, tag, "AUDIO_VIDEO_CAR_AUDIO : " + JSON.stringify(AUDIO_VIDEO_CAR_AUDIO));
                expect(true).assertEqual(AUDIO_VIDEO_CAR_AUDIO === 0x0420);
                let AUDIO_VIDEO_SET_TOP_BOX = constant.MajorMinorClass.AUDIO_VIDEO_SET_TOP_BOX;
                hilog.info(domain, tag, "AUDIO_VIDEO_SET_TOP_BOX : " + JSON.stringify(AUDIO_VIDEO_SET_TOP_BOX));
                expect(true).assertEqual(AUDIO_VIDEO_SET_TOP_BOX === 0x0424);
                let AUDIO_VIDEO_HIFI_AUDIO = constant.MajorMinorClass.AUDIO_VIDEO_HIFI_AUDIO;
                hilog.info(domain, tag, "AUDIO_VIDEO_HIFI_AUDIO : " + JSON.stringify(AUDIO_VIDEO_HIFI_AUDIO));
                expect(true).assertEqual(AUDIO_VIDEO_HIFI_AUDIO === 0x0428);
                let AUDIO_VIDEO_VCR = constant.MajorMinorClass.AUDIO_VIDEO_VCR;
                hilog.info(domain, tag, "AUDIO_VIDEO_VCR : " + JSON.stringify(AUDIO_VIDEO_VCR));
                expect(true).assertEqual(AUDIO_VIDEO_VCR === 0x042C);
                let AUDIO_VIDEO_VIDEO_CAMERA = constant.MajorMinorClass.AUDIO_VIDEO_VIDEO_CAMERA;
                hilog.info(domain, tag, "AUDIO_VIDEO_VIDEO_CAMERA : " +
                JSON.stringify(AUDIO_VIDEO_VIDEO_CAMERA));
                expect(true).assertEqual(AUDIO_VIDEO_VIDEO_CAMERA === 0x0430);
                let AUDIO_VIDEO_CAMCORDER = constant.MajorMinorClass.AUDIO_VIDEO_CAMCORDER;
                hilog.info(domain, tag, "AUDIO_VIDEO_CAMCORDER : " + JSON.stringify(AUDIO_VIDEO_CAMCORDER));
                expect(true).assertEqual(AUDIO_VIDEO_CAMCORDER === 0x0434);
                let AUDIO_VIDEO_VIDEO_MONITOR = constant.MajorMinorClass.AUDIO_VIDEO_VIDEO_MONITOR;
                hilog.info(domain, tag, "AUDIO_VIDEO_VIDEO_MONITOR : " +
                JSON.stringify(AUDIO_VIDEO_VIDEO_MONITOR));
                expect(true).assertEqual(AUDIO_VIDEO_VIDEO_MONITOR === 0x0438);
                let AUDIO_VIDEO_VIDEO_DISPLAY_AND_LOUDSPEAKER =
                    constant.MajorMinorClass.AUDIO_VIDEO_VIDEO_DISPLAY_AND_LOUDSPEAKER;
                hilog.info(domain, tag, "AUDIO_VIDEO_VIDEO_DISPLAY_AND_LOUDSPEAKER : "
                    + JSON.stringify(AUDIO_VIDEO_VIDEO_DISPLAY_AND_LOUDSPEAKER));
                expect(true).assertEqual(AUDIO_VIDEO_VIDEO_DISPLAY_AND_LOUDSPEAKER === 0x043C);
                let AUDIO_VIDEO_VIDEO_CONFERENCING = constant.MajorMinorClass.AUDIO_VIDEO_VIDEO_CONFERENCING;
                hilog.info(domain, tag, "AUDIO_VIDEO_VIDEO_CONFERENCING : "
                    + JSON.stringify(AUDIO_VIDEO_VIDEO_CONFERENCING));
                expect(true).assertEqual(AUDIO_VIDEO_VIDEO_CONFERENCING === 0x0440);
                let AUDIO_VIDEO_VIDEO_GAMING_TOY = constant.MajorMinorClass.AUDIO_VIDEO_VIDEO_GAMING_TOY;
                hilog.info(domain, tag, "AUDIO_VIDEO_VIDEO_GAMING_TOY : "
                    + JSON.stringify(AUDIO_VIDEO_VIDEO_GAMING_TOY));
                expect(true).assertEqual(AUDIO_VIDEO_VIDEO_GAMING_TOY === 0x0448);

                let PERIPHERAL_NON_KEYBOARD_NON_POINTING =
                    constant.MajorMinorClass.PERIPHERAL_NON_KEYBOARD_NON_POINTING;
                hilog.info(domain, tag, "PERIPHERAL_NON_KEYBOARD_NON_POINTING : "
                    + JSON.stringify(PERIPHERAL_NON_KEYBOARD_NON_POINTING));
                expect(true).assertEqual(PERIPHERAL_NON_KEYBOARD_NON_POINTING === 0x0500);
                let PERIPHERAL_KEYBOARD = constant.MajorMinorClass.PERIPHERAL_KEYBOARD;
                hilog.info(domain, tag, "PERIPHERAL_KEYBOARD : " + JSON.stringify(PERIPHERAL_KEYBOARD));
                expect(true).assertEqual(PERIPHERAL_KEYBOARD === 0x0540);
                let PERIPHERAL_POINTING_DEVICE = constant.MajorMinorClass.PERIPHERAL_POINTING_DEVICE;
                hilog.info(domain, tag, "PERIPHERAL_POINTING_DEVICE : " +
                JSON.stringify(PERIPHERAL_POINTING_DEVICE));
                expect(true).assertEqual(PERIPHERAL_POINTING_DEVICE === 0x0580);
                let PERIPHERAL_KEYBOARD_POINTING = constant.MajorMinorClass.PERIPHERAL_KEYBOARD_POINTING;
                hilog.info(domain, tag, "PERIPHERAL_KEYBOARD_POINTING : " +
                JSON.stringify(PERIPHERAL_KEYBOARD_POINTING));
                expect(true).assertEqual(PERIPHERAL_KEYBOARD_POINTING === 0x05C0);
                let PERIPHERAL_UNCATEGORIZED = constant.MajorMinorClass.PERIPHERAL_UNCATEGORIZED;
                hilog.info(domain, tag, "PERIPHERAL_UNCATEGORIZED : " + JSON.stringify(PERIPHERAL_UNCATEGORIZED));
                expect(true).assertEqual(PERIPHERAL_UNCATEGORIZED === 0x0500);
                let PERIPHERAL_JOYSTICK = constant.MajorMinorClass.PERIPHERAL_JOYSTICK;
                hilog.info(domain, tag, "PERIPHERAL_JOYSTICK : " + JSON.stringify(PERIPHERAL_JOYSTICK));
                expect(true).assertEqual(PERIPHERAL_JOYSTICK === 0x0504);
                let PERIPHERAL_GAMEPAD = constant.MajorMinorClass.PERIPHERAL_GAMEPAD;
                hilog.info(domain, tag, "PERIPHERAL_GAMEPAD : " + JSON.stringify(PERIPHERAL_GAMEPAD));
                expect(true).assertEqual(PERIPHERAL_GAMEPAD === 0x0508);
                let PERIPHERAL_REMOTE_CONTROL = constant.MajorMinorClass.PERIPHERAL_REMOTE_CONTROL;
                hilog.info(domain, tag, "PERIPHERAL_REMOTE_CONTROL : " + JSON.stringify(PERIPHERAL_REMOTE_CONTROL));
                expect(true).assertEqual(PERIPHERAL_REMOTE_CONTROL === 0x05C0);
                let PERIPHERAL_SENSING_DEVICE = constant.MajorMinorClass.PERIPHERAL_SENSING_DEVICE;
                hilog.info(domain, tag, "PERIPHERAL_SENSING_DEVICE : " + JSON.stringify(PERIPHERAL_SENSING_DEVICE));
                expect(true).assertEqual(PERIPHERAL_SENSING_DEVICE === 0x0510);
                let PERIPHERAL_DIGITIZER_TABLET = constant.MajorMinorClass.PERIPHERAL_DIGITIZER_TABLET;
                hilog.info(domain, tag, "PERIPHERAL_DIGITIZER_TABLET : " +
                JSON.stringify(PERIPHERAL_DIGITIZER_TABLET));
                expect(true).assertEqual(PERIPHERAL_DIGITIZER_TABLET === 0x0514);
                let PERIPHERAL_CARD_READER = constant.MajorMinorClass.PERIPHERAL_CARD_READER;
                hilog.info(domain, tag, "PERIPHERAL_CARD_READER : " + JSON.stringify(PERIPHERAL_CARD_READER));
                expect(true).assertEqual(PERIPHERAL_CARD_READER === 0x0518);
                let PERIPHERAL_DIGITAL_PEN = constant.MajorMinorClass.PERIPHERAL_DIGITAL_PEN;
                hilog.info(domain, tag, "PERIPHERAL_DIGITAL_PEN : " + JSON.stringify(PERIPHERAL_DIGITAL_PEN));
                expect(true).assertEqual(PERIPHERAL_DIGITAL_PEN === 0x051C);
                let PERIPHERAL_SCANNER_RFID = constant.MajorMinorClass.PERIPHERAL_SCANNER_RFID;
                hilog.info(domain, tag, "PERIPHERAL_SCANNER_RFID : " + JSON.stringify(PERIPHERAL_SCANNER_RFID));
                expect(true).assertEqual(PERIPHERAL_SCANNER_RFID === 0x0520);
                let PERIPHERAL_GESTURAL_INPUT = constant.MajorMinorClass.PERIPHERAL_GESTURAL_INPUT;
                hilog.info(domain, tag, "PERIPHERAL_GESTURAL_INPUT : " +
                JSON.stringify(PERIPHERAL_GESTURAL_INPUT));
                expect(true).assertEqual(PERIPHERAL_GESTURAL_INPUT === 0x0522);

                let IMAGING_UNCATEGORIZED = constant.MajorMinorClass.IMAGING_UNCATEGORIZED;
                hilog.info(domain, tag, "IMAGING_UNCATEGORIZED : " + JSON.stringify(IMAGING_UNCATEGORIZED));
                expect(true).assertEqual(IMAGING_UNCATEGORIZED === 0x0600);
                let IMAGING_DISPLAY = constant.MajorMinorClass.IMAGING_DISPLAY;
                hilog.info(domain, tag, "IMAGING_DISPLAY : " + JSON.stringify(IMAGING_DISPLAY));
                expect(true).assertEqual(IMAGING_DISPLAY === 0x0610);
                let IMAGING_CAMERA = constant.MajorMinorClass.IMAGING_CAMERA;
                hilog.info(domain, tag, "IMAGING_CAMERA : " + JSON.stringify(IMAGING_CAMERA));
                expect(true).assertEqual(IMAGING_CAMERA === 0x0620);
                let IMAGING_SCANNER = constant.MajorMinorClass.IMAGING_SCANNER;
                hilog.info(domain, tag, "IMAGING_SCANNER : " + JSON.stringify(IMAGING_SCANNER));
                expect(true).assertEqual(IMAGING_SCANNER === 0x0640);
                let IMAGING_PRINTER = constant.MajorMinorClass.IMAGING_PRINTER;
                hilog.info(domain, tag, "IMAGING_PRINTER : " + JSON.stringify(IMAGING_PRINTER));
                expect(true).assertEqual(IMAGING_PRINTER === 0x0680);

                let WEARABLE_UNCATEGORIZED = constant.MajorMinorClass.WEARABLE_UNCATEGORIZED;
                hilog.info(domain, tag, "WEARABLE_UNCATEGORIZED : " + JSON.stringify(WEARABLE_UNCATEGORIZED));
                expect(true).assertEqual(WEARABLE_UNCATEGORIZED === 0x0700);
                let WEARABLE_WRIST_WATCH = constant.MajorMinorClass.WEARABLE_WRIST_WATCH;
                hilog.info(domain, tag, "WEARABLE_WRIST_WATCH : " + JSON.stringify(WEARABLE_WRIST_WATCH));
                expect(true).assertEqual(WEARABLE_WRIST_WATCH === 0x0704);
                let WEARABLE_PAGER = constant.MajorMinorClass.WEARABLE_PAGER;
                hilog.info(domain, tag, "WEARABLE_PAGER : " + JSON.stringify(WEARABLE_PAGER));
                expect(true).assertEqual(WEARABLE_PAGER === 0x0708);
                let WEARABLE_JACKET = constant.MajorMinorClass.WEARABLE_JACKET;
                hilog.info(domain, tag, "WEARABLE_JACKET : " + JSON.stringify(WEARABLE_JACKET));
                expect(true).assertEqual(WEARABLE_JACKET === 0x070C);
                let WEARABLE_HELMET = constant.MajorMinorClass.WEARABLE_HELMET;
                hilog.info(domain, tag, "WEARABLE_HELMET : " + JSON.stringify(WEARABLE_HELMET));
                expect(true).assertEqual(WEARABLE_HELMET === 0x0710);
                let WEARABLE_GLASSES = constant.MajorMinorClass.WEARABLE_GLASSES;
                hilog.info(domain, tag, "WEARABLE_GLASSES : " + JSON.stringify(WEARABLE_GLASSES));
                expect(true).assertEqual(WEARABLE_GLASSES === 0x0714);

                let TOY_UNCATEGORIZED = constant.MajorMinorClass.TOY_UNCATEGORIZED;
                hilog.info(domain, tag, "TOY_UNCATEGORIZED : " + JSON.stringify(TOY_UNCATEGORIZED));
                expect(true).assertEqual(TOY_UNCATEGORIZED === 0x0800);
                let TOY_ROBOT = constant.MajorMinorClass.TOY_ROBOT;
                hilog.info(domain, tag, "TOY_ROBOT : " + JSON.stringify(TOY_ROBOT));
                expect(true).assertEqual(TOY_ROBOT === 0x0804);
                let TOY_VEHICLE = constant.MajorMinorClass.TOY_VEHICLE;
                hilog.info(domain, tag, "TOY_VEHICLE : " + JSON.stringify(TOY_VEHICLE));
                expect(true).assertEqual(TOY_VEHICLE === 0x0808);
                let TOY_DOLL_ACTION_FIGURE = constant.MajorMinorClass.TOY_DOLL_ACTION_FIGURE;
                hilog.info(domain, tag, "TOY_DOLL_ACTION_FIGURE : " + JSON.stringify(TOY_DOLL_ACTION_FIGURE));
                expect(true).assertEqual(TOY_DOLL_ACTION_FIGURE === 0x080C);
                let TOY_CONTROLLER = constant.MajorMinorClass.TOY_CONTROLLER;
                hilog.info(domain, tag, "TOY_CONTROLLER : " + JSON.stringify(TOY_CONTROLLER));
                expect(true).assertEqual(TOY_CONTROLLER === 0x0810);
                let TOY_GAME = constant.MajorMinorClass.TOY_GAME;
                hilog.info(domain, tag, "TOY_GAME : " + JSON.stringify(TOY_GAME));
                expect(true).assertEqual(TOY_GAME === 0x0814);

                let HEALTH_UNCATEGORIZED = constant.MajorMinorClass.HEALTH_UNCATEGORIZED;
                hilog.info(domain, tag, "HEALTH_UNCATEGORIZED : " + JSON.stringify(HEALTH_UNCATEGORIZED));
                expect(true).assertEqual(HEALTH_UNCATEGORIZED === 0x0900);
                let HEALTH_BLOOD_PRESSURE = constant.MajorMinorClass.HEALTH_BLOOD_PRESSURE;
                hilog.info(domain, tag, "HEALTH_BLOOD_PRESSURE : " + JSON.stringify(HEALTH_BLOOD_PRESSURE));
                expect(true).assertEqual(HEALTH_BLOOD_PRESSURE === 0x0904);
                let HEALTH_THERMOMETER = constant.MajorMinorClass.HEALTH_THERMOMETER;
                hilog.info(domain, tag, "HEALTH_THERMOMETER : " + JSON.stringify(HEALTH_THERMOMETER));
                expect(true).assertEqual(HEALTH_THERMOMETER === 0x0908);
                let HEALTH_WEIGHING = constant.MajorMinorClass.HEALTH_WEIGHING;
                hilog.info(domain, tag, "HEALTH_WEIGHING : " + JSON.stringify(HEALTH_WEIGHING));
                expect(true).assertEqual(HEALTH_WEIGHING === 0x090C);
                let HEALTH_GLUCOSE = constant.MajorMinorClass.HEALTH_GLUCOSE;
                hilog.info(domain, tag, "HEALTH_GLUCOSE : " + JSON.stringify(HEALTH_GLUCOSE));
                expect(true).assertEqual(HEALTH_GLUCOSE === 0x0910);
                let HEALTH_PULSE_OXIMETER = constant.MajorMinorClass.HEALTH_PULSE_OXIMETER;
                hilog.info(domain, tag, "HEALTH_PULSE_OXIMETER : " + JSON.stringify(HEALTH_PULSE_OXIMETER));
                expect(true).assertEqual(HEALTH_PULSE_OXIMETER === 0x0914);
                let HEALTH_PULSE_RATE = constant.MajorMinorClass.HEALTH_PULSE_RATE;
                hilog.info(domain, tag, "HEALTH_PULSE_RATE : " + JSON.stringify(HEALTH_PULSE_RATE));
                expect(true).assertEqual(HEALTH_PULSE_RATE === 0x0918);
                let HEALTH_DATA_DISPLAY = constant.MajorMinorClass.HEALTH_DATA_DISPLAY;
                hilog.info(domain, tag, "HEALTH_DATA_DISPLAY : " + JSON.stringify(HEALTH_DATA_DISPLAY));
                expect(true).assertEqual(HEALTH_DATA_DISPLAY === 0x091C);
                let HEALTH_STEP_COUNTER = constant.MajorMinorClass.HEALTH_STEP_COUNTER;
                hilog.info(domain, tag, "HEALTH_STEP_COUNTER : " + JSON.stringify(HEALTH_STEP_COUNTER));
                expect(true).assertEqual(HEALTH_STEP_COUNTER === 0x0920);
                let HEALTH_BODY_COMPOSITION_ANALYZER = constant.MajorMinorClass.HEALTH_BODY_COMPOSITION_ANALYZER;
                hilog.info(domain, tag, "HEALTH_BODY_COMPOSITION_ANALYZER : " +
                JSON.stringify(HEALTH_BODY_COMPOSITION_ANALYZER));
                expect(true).assertEqual(HEALTH_BODY_COMPOSITION_ANALYZER === 0x0924);
                let HEALTH_PEAK_FLOW_MONITOR = constant.MajorMinorClass.HEALTH_PEAK_FLOW_MONITOR;
                hilog.info(domain, tag, "HEALTH_PEAK_FLOW_MONITOR : " + JSON.stringify(HEALTH_PEAK_FLOW_MONITOR));
                expect(true).assertEqual(HEALTH_PEAK_FLOW_MONITOR === 0x0928);
                let HEALTH_MEDICATION_MONITOR = constant.MajorMinorClass.HEALTH_MEDICATION_MONITOR;
                hilog.info(domain, tag, "HEALTH_MEDICATION_MONITOR : " +
                JSON.stringify(HEALTH_MEDICATION_MONITOR));
                expect(true).assertEqual(HEALTH_MEDICATION_MONITOR === 0x092C);
                let HEALTH_KNEE_PROSTHESIS = constant.MajorMinorClass.HEALTH_KNEE_PROSTHESIS;
                hilog.info(domain, tag, "HEALTH_KNEE_PROSTHESIS : " + JSON.stringify(HEALTH_KNEE_PROSTHESIS));
                expect(true).assertEqual(HEALTH_KNEE_PROSTHESIS === 0x0930);
                let HEALTH_ANKLE_PROSTHESIS = constant.MajorMinorClass.HEALTH_ANKLE_PROSTHESIS;
                hilog.info(domain, tag, "HEALTH_ANKLE_PROSTHESIS : " + JSON.stringify(HEALTH_ANKLE_PROSTHESIS));
                expect(true).assertEqual(HEALTH_ANKLE_PROSTHESIS === 0x0934);
                let HEALTH_GENERIC_HEALTH_MANAGER = constant.MajorMinorClass.HEALTH_GENERIC_HEALTH_MANAGER;
                hilog.info(domain, tag, "HEALTH_GENERIC_HEALTH_MANAGER : " +
                JSON.stringify(HEALTH_GENERIC_HEALTH_MANAGER));
                expect(true).assertEqual(HEALTH_GENERIC_HEALTH_MANAGER === 0x0938);
                let HEALTH_PERSONAL_MOBILITY_DEVICE = constant.MajorMinorClass.HEALTH_PERSONAL_MOBILITY_DEVICE;
                hilog.info(domain, tag, "HEALTH_PERSONAL_MOBILITY_DEVICE : " +
                JSON.stringify(HEALTH_PERSONAL_MOBILITY_DEVICE));
                expect(true).assertEqual(HEALTH_PERSONAL_MOBILITY_DEVICE === 0x093C);
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "testMajorMinorClass get errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })
    })
}