/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:// www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import avSession from '@ohos.multimedia.avsession';
import { AVCastPickerState, AVCastPickerStyle, AVCastPickerColorMode} from '@ohos.multimedia.avCastPickerParam';
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll } from "../../../hypium/index";

export default function abilityTest() {
    describe('AVSessionEnum', ()=> {

        beforeAll(()=> {
            console.info('TestLog: Start Testing avSession Interfaces');
        })

        beforeEach(async ()=> {
            console.info('TestLog: Init Session And Controller');
        })

        afterEach(async (): Promise<void> => {
        })

        afterAll(()=> {
            console.info('TestLog: End Testing avSession Interfaces');
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_CONNECTION_STATE_ENUM_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_CONNECTION_STATE_ENUM_STATIC_0100
         * @tc.desc   compare all value in ConnectionState to number value
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_CONNECTION_STATE_ENUM_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            console.info(`TestLog: ConnectionState STATE_CONNECTING is ${avSession.ConnectionState.STATE_CONNECTING}`);
            expect(avSession.ConnectionState.STATE_CONNECTING).assertEqual(avSession.ConnectionState.fromValue(0));
            console.info(`TestLog: ConnectionState STATE_CONNECTED is ${avSession.ConnectionState.STATE_CONNECTED}`);
            expect(avSession.ConnectionState.STATE_CONNECTED).assertEqual(avSession.ConnectionState.fromValue(1));
            console.info(`TestLog: ConnectionState STATE_DISCONNECTED is ${avSession.ConnectionState.STATE_DISCONNECTED}`);
            expect(avSession.ConnectionState.STATE_DISCONNECTED).assertEqual(avSession.ConnectionState.fromValue(6));
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_AVCAST_CATEGORY_ENUM_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_AVCAST_CATEGORY_ENUM_STATIC_0100
         * @tc.desc   compare all value in AVCastCategory to number value
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_AVCAST_CATEGORY_ENUM_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            console.info(`TestLog: AVCastCategory CATEGORY_LOCAL is ${avSession.AVCastCategory.CATEGORY_LOCAL}`);
            expect(avSession.AVCastCategory.CATEGORY_LOCAL).assertEqual(avSession.AVCastCategory.fromValue(0));
            console.info(`TestLog: AVCastCategory CATEGORY_REMOTE is ${avSession.AVCastCategory.CATEGORY_REMOTE}`);
            expect(avSession.AVCastCategory.CATEGORY_REMOTE).assertEqual(avSession.AVCastCategory.fromValue(1));
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_DEVICE_TYPE_ENUM_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_DEVICE_TYPE_ENUM_STATIC_0100
         * @tc.desc   compare all value in DeviceType to number value
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_DEVICE_TYPE_ENUM_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            console.info(`TestLog: DeviceType DEVICE_TYPE_LOCAL is ${avSession.DeviceType.DEVICE_TYPE_LOCAL}`);
            expect(avSession.DeviceType.DEVICE_TYPE_LOCAL).assertEqual(avSession.DeviceType.fromValue(0));
            console.info(`TestLog: DeviceType DEVICE_TYPE_TV is ${avSession.DeviceType.DEVICE_TYPE_TV}`);
            expect(avSession.DeviceType.DEVICE_TYPE_TV).assertEqual(avSession.DeviceType.fromValue(2));
            console.info(`TestLog: DeviceType DEVICE_TYPE_SPEAKER is ${avSession.DeviceType.DEVICE_TYPE_SMART_SPEAKER}`);
            expect(avSession.DeviceType.DEVICE_TYPE_SMART_SPEAKER).assertEqual(avSession.DeviceType.fromValue(3));
            console.info(`TestLog: DeviceType DEVICE_TYPE_BLUETOOTH is ${avSession.DeviceType.DEVICE_TYPE_BLUETOOTH}`);
            expect(avSession.DeviceType.DEVICE_TYPE_BLUETOOTH).assertEqual(avSession.DeviceType.fromValue(10));
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_PLAYBACKSTATE_ENUM_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_PLAYBACKSTATE_ENUM_STATIC_0100
         * @tc.desc   compare all value in PlaybackState to number value
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_PLAYBACKSTATE_ENUM_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            console.info(`TestLog: PlaybackState PLAYBACK_STATE_COMPLETED is ${avSession.PlaybackState.PLAYBACK_STATE_COMPLETED}`);
            expect(avSession.PlaybackState.PLAYBACK_STATE_COMPLETED).assertEqual(avSession.PlaybackState.fromValue(7));
            console.info(`TestLog: PlaybackState PLAYBACK_STATE_RELEASED is ${avSession.PlaybackState.PLAYBACK_STATE_RELEASED}`);
            expect(avSession.PlaybackState.PLAYBACK_STATE_RELEASED).assertEqual(avSession.PlaybackState.fromValue(8));
            console.info(`TestLog: PlaybackState PLAYBACK_STATE_ERROR is ${avSession.PlaybackState.PLAYBACK_STATE_ERROR}`);
            expect(avSession.PlaybackState.PLAYBACK_STATE_ERROR).assertEqual(avSession.PlaybackState.fromValue(9));
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ERROR_CODE_ENUM_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ERROR_CODE_ENUM_STATIC_0100
         * @tc.desc   compare all value in AVSessionErrorCode to number value
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ERROR_CODE_ENUM_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            console.info(`TestLog: AVSessionErrorCode ERR_CODE_SERVICE_EXCEPTION is ${avSession.AVSessionErrorCode.ERR_CODE_SERVICE_EXCEPTION}`);
            expect(avSession.AVSessionErrorCode.ERR_CODE_SERVICE_EXCEPTION).assertEqual(avSession.AVSessionErrorCode.fromValue(6600101));

            console.info(`TestLog: AVSessionErrorCode ERR_CODE_SESSION_NOT_EXIST is ${avSession.AVSessionErrorCode.ERR_CODE_SESSION_NOT_EXIST}`);
            expect(avSession.AVSessionErrorCode.ERR_CODE_SESSION_NOT_EXIST).assertEqual(avSession.AVSessionErrorCode.fromValue(6600102));

            console.info(`TestLog: AVSessionErrorCode ERR_CODE_CONTROLLER_NOT_EXIST is ${avSession.AVSessionErrorCode.ERR_CODE_CONTROLLER_NOT_EXIST}`);
            expect(avSession.AVSessionErrorCode.ERR_CODE_CONTROLLER_NOT_EXIST).assertEqual(avSession.AVSessionErrorCode.fromValue(6600103));

            console.info(`TestLog: AVSessionErrorCode ERR_CODE_REMOTE_CONNECTION_ERR is ${avSession.AVSessionErrorCode.ERR_CODE_REMOTE_CONNECTION_ERR}`);
            expect(avSession.AVSessionErrorCode.ERR_CODE_REMOTE_CONNECTION_ERR).assertEqual(avSession.AVSessionErrorCode.fromValue(6600104));

            console.info(`TestLog: AVSessionErrorCode ERR_CODE_COMMAND_INVALID is ${avSession.AVSessionErrorCode.ERR_CODE_COMMAND_INVALID}`);
            expect(avSession.AVSessionErrorCode.ERR_CODE_COMMAND_INVALID).assertEqual(avSession.AVSessionErrorCode.fromValue(6600105));

            console.info(`TestLog: AVSessionErrorCode ERR_CODE_SESSION_INACTIVE is ${avSession.AVSessionErrorCode.ERR_CODE_SESSION_INACTIVE}`);
            expect(avSession.AVSessionErrorCode.ERR_CODE_SESSION_INACTIVE).assertEqual(avSession.AVSessionErrorCode.fromValue(6600106));

            console.info(`TestLog: AVSessionErrorCode ERR_CODE_MESSAGE_OVERLOAD is ${avSession.AVSessionErrorCode.ERR_CODE_MESSAGE_OVERLOAD}`);
            expect(avSession.AVSessionErrorCode.ERR_CODE_MESSAGE_OVERLOAD).assertEqual(avSession.AVSessionErrorCode.fromValue(6600107));

            console.info(`TestLog: AVSessionErrorCode ERR_CODE_DEVICE_CONNECTION_FAILED is ${avSession.AVSessionErrorCode.ERR_CODE_DEVICE_CONNECTION_FAILED}`);
            expect(avSession.AVSessionErrorCode.ERR_CODE_DEVICE_CONNECTION_FAILED).assertEqual(avSession.AVSessionErrorCode.fromValue(6600108));

            console.info(`TestLog: AVSessionErrorCode ERR_CODE_REMOTE_CONNECTION_NOT_EXIST is ${avSession.AVSessionErrorCode.ERR_CODE_REMOTE_CONNECTION_NOT_EXIST}`);
            expect(avSession.AVSessionErrorCode.ERR_CODE_REMOTE_CONNECTION_NOT_EXIST).assertEqual(avSession.AVSessionErrorCode.fromValue(6600109));
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERSTATE_ENUM_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERSTATE_ENUM_STATIC_0100
         * @tc.desc   compare all value in AVCastPickerState to number value
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERSTATE_ENUM_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            console.info(`TestLog: AVCastPickerState STATE_APPEARING is ${AVCastPickerState.STATE_APPEARING}`);
            expect(AVCastPickerState.STATE_APPEARING).assertEqual(AVCastPickerState.fromValue(0));

            console.info(`TestLog: AVCastPickerState STATE_DISAPPEARING is ${AVCastPickerState.STATE_DISAPPEARING}`);
            expect(AVCastPickerState.STATE_DISAPPEARING).assertEqual(AVCastPickerState.fromValue(1));
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERSTYLE_ENUM_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERSTYLE_ENUM_STATIC_0100
         * @tc.desc   compare all value in AVCastPickerStyle to number value
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERSTYLE_ENUM_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            console.info(`TestLog: AVCastPickerStyle STYLE_PANEL is ${AVCastPickerStyle.STYLE_PANEL}`);
            expect(AVCastPickerStyle.STYLE_PANEL).assertEqual(AVCastPickerStyle.fromValue(0));

            console.info(`TestLog: AVCastPickerStyle STYLE_MENU is ${AVCastPickerStyle.STYLE_MENU}`);
            expect(AVCastPickerStyle.STYLE_MENU).assertEqual(AVCastPickerStyle.fromValue(1));
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERCOLORMODE_ENUM_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERCOLORMODE_ENUM_STATIC_0100
         * @tc.desc   compare all value in AVCastPickerColorMode to number value
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERCOLORMODE_ENUM_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            console.info(`TestLog: AVCastPickerColorMode AUTO is ${AVCastPickerColorMode.AUTO}`);
            expect(AVCastPickerColorMode.AUTO).assertEqual(AVCastPickerColorMode.fromValue(0));

            console.info(`TestLog: AVCastPickerColorMode DARK is ${AVCastPickerColorMode.DARK}`);
            expect(AVCastPickerColorMode.DARK).assertEqual(AVCastPickerColorMode.fromValue(1));
            done();

            console.info(`TestLog: AVCastPickerColorMode LIGHT is ${AVCastPickerColorMode.LIGHT}`);
            expect(AVCastPickerColorMode.LIGHT).assertEqual(AVCastPickerColorMode.fromValue(2));
            done();
        })

    })
}