/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
            expect(avSession.ConnectionState.STATE_CONNECTING).assertEqual(0 as avSession.ConnectionState);
            console.info(`TestLog: ConnectionState STATE_CONNECTED is ${avSession.ConnectionState.STATE_CONNECTED}`);
            expect(avSession.ConnectionState.STATE_CONNECTED).assertEqual(1 as avSession.ConnectionState);
            console.info(`TestLog: ConnectionState STATE_DISCONNECTED is ${avSession.ConnectionState.STATE_DISCONNECTED}`);
            expect(avSession.ConnectionState.STATE_DISCONNECTED).assertEqual(6 as avSession.ConnectionState);
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
            expect(avSession.AVCastCategory.CATEGORY_LOCAL).assertEqual(0 as avSession.AVCastCategory);
            console.info(`TestLog: AVCastCategory CATEGORY_REMOTE is ${avSession.AVCastCategory.CATEGORY_REMOTE}`);
            expect(avSession.AVCastCategory.CATEGORY_REMOTE).assertEqual(1 as avSession.AVCastCategory);
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
            expect(avSession.DeviceType.DEVICE_TYPE_LOCAL).assertEqual(0 as avSession.DeviceType);
            console.info(`TestLog: DeviceType DEVICE_TYPE_TV is ${avSession.DeviceType.DEVICE_TYPE_TV}`);
            expect(avSession.DeviceType.DEVICE_TYPE_TV).assertEqual(2 as avSession.DeviceType);
            console.info(`TestLog: DeviceType DEVICE_TYPE_SPEAKER is ${avSession.DeviceType.DEVICE_TYPE_SMART_SPEAKER}`);
            expect(avSession.DeviceType.DEVICE_TYPE_SMART_SPEAKER).assertEqual(3 as avSession.DeviceType);
            console.info(`TestLog: DeviceType DEVICE_TYPE_BLUETOOTH is ${avSession.DeviceType.DEVICE_TYPE_BLUETOOTH}`);
            expect(avSession.DeviceType.DEVICE_TYPE_BLUETOOTH).assertEqual(10 as avSession.DeviceType);
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
            expect(avSession.PlaybackState.PLAYBACK_STATE_COMPLETED).assertEqual(7 as avSession.PlaybackState);
            console.info(`TestLog: PlaybackState PLAYBACK_STATE_RELEASED is ${avSession.PlaybackState.PLAYBACK_STATE_RELEASED}`);
            expect(avSession.PlaybackState.PLAYBACK_STATE_RELEASED).assertEqual(8 as avSession.PlaybackState);
            console.info(`TestLog: PlaybackState PLAYBACK_STATE_ERROR is ${avSession.PlaybackState.PLAYBACK_STATE_ERROR}`);
            expect(avSession.PlaybackState.PLAYBACK_STATE_ERROR).assertEqual(9 as avSession.PlaybackState);
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
            expect(avSession.AVSessionErrorCode.ERR_CODE_SERVICE_EXCEPTION).assertEqual(6600101 as avSession.AVSessionErrorCode);

            console.info(`TestLog: AVSessionErrorCode ERR_CODE_SESSION_NOT_EXIST is ${avSession.AVSessionErrorCode.ERR_CODE_SESSION_NOT_EXIST}`);
            expect(avSession.AVSessionErrorCode.ERR_CODE_SESSION_NOT_EXIST).assertEqual(6600102 as avSession.AVSessionErrorCode);

            console.info(`TestLog: AVSessionErrorCode ERR_CODE_CONTROLLER_NOT_EXIST is ${avSession.AVSessionErrorCode.ERR_CODE_CONTROLLER_NOT_EXIST}`);
            expect(avSession.AVSessionErrorCode.ERR_CODE_CONTROLLER_NOT_EXIST).assertEqual(6600103 as avSession.AVSessionErrorCode);

            console.info(`TestLog: AVSessionErrorCode ERR_CODE_REMOTE_CONNECTION_ERR is ${avSession.AVSessionErrorCode.ERR_CODE_REMOTE_CONNECTION_ERR}`);
            expect(avSession.AVSessionErrorCode.ERR_CODE_REMOTE_CONNECTION_ERR).assertEqual(6600104 as avSession.AVSessionErrorCode);

            console.info(`TestLog: AVSessionErrorCode ERR_CODE_COMMAND_INVALID is ${avSession.AVSessionErrorCode.ERR_CODE_COMMAND_INVALID}`);
            expect(avSession.AVSessionErrorCode.ERR_CODE_COMMAND_INVALID).assertEqual(6600105 as avSession.AVSessionErrorCode);

            console.info(`TestLog: AVSessionErrorCode ERR_CODE_SESSION_INACTIVE is ${avSession.AVSessionErrorCode.ERR_CODE_SESSION_INACTIVE}`);
            expect(avSession.AVSessionErrorCode.ERR_CODE_SESSION_INACTIVE).assertEqual(6600106 as avSession.AVSessionErrorCode);

            console.info(`TestLog: AVSessionErrorCode ERR_CODE_MESSAGE_OVERLOAD is ${avSession.AVSessionErrorCode.ERR_CODE_MESSAGE_OVERLOAD}`);
            expect(avSession.AVSessionErrorCode.ERR_CODE_MESSAGE_OVERLOAD).assertEqual(6600107 as avSession.AVSessionErrorCode);

            console.info(`TestLog: AVSessionErrorCode ERR_CODE_DEVICE_CONNECTION_FAILED is ${avSession.AVSessionErrorCode.ERR_CODE_DEVICE_CONNECTION_FAILED}`);
            expect(avSession.AVSessionErrorCode.ERR_CODE_DEVICE_CONNECTION_FAILED).assertEqual(6600108 as avSession.AVSessionErrorCode);

            console.info(`TestLog: AVSessionErrorCode ERR_CODE_REMOTE_CONNECTION_NOT_EXIST is ${avSession.AVSessionErrorCode.ERR_CODE_REMOTE_CONNECTION_NOT_EXIST}`);
            expect(avSession.AVSessionErrorCode.ERR_CODE_REMOTE_CONNECTION_NOT_EXIST).assertEqual(6600109 as avSession.AVSessionErrorCode);
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
            expect(AVCastPickerState.STATE_APPEARING).assertEqual(0 as AVCastPickerState);

            console.info(`TestLog: AVCastPickerState STATE_DISAPPEARING is ${AVCastPickerState.STATE_DISAPPEARING}`);
            expect(AVCastPickerState.STATE_DISAPPEARING).assertEqual(1 as AVCastPickerState);
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
            expect(AVCastPickerStyle.STYLE_PANEL).assertEqual(0 as AVCastPickerStyle);

            console.info(`TestLog: AVCastPickerStyle STYLE_MENU is ${AVCastPickerStyle.STYLE_MENU}`);
            expect(AVCastPickerStyle.STYLE_MENU).assertEqual(1 as AVCastPickerStyle);
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
            expect(AVCastPickerColorMode.AUTO).assertEqual(0 as AVCastPickerColorMode);

            console.info(`TestLog: AVCastPickerColorMode DARK is ${AVCastPickerColorMode.DARK}`);
            expect(AVCastPickerColorMode.DARK).assertEqual(1 as AVCastPickerColorMode);
            done();

            console.info(`TestLog: AVCastPickerColorMode LIGHT is ${AVCastPickerColorMode.LIGHT}`);
            expect(AVCastPickerColorMode.LIGHT).assertEqual(2 as AVCastPickerColorMode);
            done();
        })

    })
}