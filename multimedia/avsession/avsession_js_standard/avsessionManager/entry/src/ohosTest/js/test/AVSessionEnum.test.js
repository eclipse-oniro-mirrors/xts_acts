/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium';

export default function AVSessionEnum() {
    describe('AVSessionEnum', function () {

        beforeAll(function () {
            console.info('TestLog: Start Testing avSession Interfaces');
        })

        beforeEach(async function () {
            console.info('TestLog: Init Session And Controller');
        })

        afterEach(async function (done) {
            done();
        })

        afterAll(function () {
            console.info('TestLog: End Testing avSession Interfaces');
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_CONNECTION_STATE_ENUM_0100
         * @tc.name      : compare all value in ConnectionState to number value
         * @tc.desc      : Testing enum of CONNECTION_STATE
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_CONNECTION_STATE_ENUM_0100', 0, async function (done) {
            console.info(`ConnectionState STATE_CONNECTING is ${avSession.ConnectionState.STATE_CONNECTING}`);
            expect(avSession.ConnectionState.STATE_CONNECTING).assertEqual(0);
            console.info(`ConnectionState STATE_CONNECTED is ${avSession.ConnectionState.STATE_CONNECTED}`);
            expect(avSession.ConnectionState.STATE_CONNECTED).assertEqual(1);
            console.info(`ConnectionState STATE_DISCONNECTED is ${avSession.ConnectionState.STATE_DISCONNECTED}`);
            expect(avSession.ConnectionState.STATE_DISCONNECTED).assertEqual(6);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_AVCAST_CATEGORY_ENUM_0100
         * @tc.name      : compare all value in AVCastCategory to number value
         * @tc.desc      : Testing enum of AVCastCategory
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_AVCAST_CATEGORY_ENUM_0100', 0, async function (done) {
            console.info(`AVCastCategory CATEGORY_LOCAL is ${avSession.AVCastCategory.CATEGORY_LOCAL}`);
            expect(avSession.AVCastCategory.CATEGORY_LOCAL).assertEqual(0);
            console.info(`AVCastCategory CATEGORY_REMOTE is ${avSession.AVCastCategory.CATEGORY_REMOTE}`);
            expect(avSession.AVCastCategory.CATEGORY_REMOTE).assertEqual(1);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_DEVICE_TYPE_ENUM_0100
         * @tc.name      : compare all value in DeviceType to number value
         * @tc.desc      : Testing enum of DeviceType
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_DEVICE_TYPE_ENUM_0100', 0, async function (done) {
            console.info(`DeviceType DEVICE_TYPE_LOCAL is ${avSession.DeviceType.DEVICE_TYPE_LOCAL}`);
            expect(avSession.DeviceType.DEVICE_TYPE_LOCAL).assertEqual(0);
            console.info(`DeviceType DEVICE_TYPE_TV is ${avSession.DeviceType.DEVICE_TYPE_TV}`);
            expect(avSession.DeviceType.DEVICE_TYPE_TV).assertEqual(2);
            console.info(`DeviceType DEVICE_TYPE_SPEAKER is ${avSession.DeviceType.DEVICE_TYPE_SMART_SPEAKER}`);
            expect(avSession.DeviceType.DEVICE_TYPE_SMART_SPEAKER).assertEqual(3);
            console.info(`DeviceType DEVICE_TYPE_BLUETOOTH is ${avSession.DeviceType.DEVICE_TYPE_BLUETOOTH}`);
            expect(avSession.DeviceType.DEVICE_TYPE_BLUETOOTH).assertEqual(10);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_PLAYBACKSTATE_ENUM_0100
         * @tc.name      : compare all value in PlaybackState to number value
         * @tc.desc      : Testing enum of PlaybackState
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_PLAYBACKSTATE_ENUM_0100', 0, async function (done) {
            console.info(`PlaybackState PLAYBACK_STATE_COMPLETED is ${avSession.PlaybackState.PLAYBACK_STATE_COMPLETED}`);
            expect(avSession.PlaybackState.PLAYBACK_STATE_COMPLETED).assertEqual(7);
            console.info(`PlaybackState PLAYBACK_STATE_RELEASED is ${avSession.PlaybackState.PLAYBACK_STATE_RELEASED}`);
            expect(avSession.PlaybackState.PLAYBACK_STATE_RELEASED).assertEqual(8);
            console.info(`PlaybackState PLAYBACK_STATE_ERROR is ${avSession.PlaybackState.PLAYBACK_STATE_ERROR}`);
            expect(avSession.PlaybackState.PLAYBACK_STATE_ERROR).assertEqual(9);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERROR_CODE_ENUM_0100
         * @tc.name      : compare all value in AVSessionErrorCode to number value
         * @tc.desc      : Testing enum of AVSessionErrorCode
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ERROR_CODE_ENUM_0100', 0, async function (done) {
            console.info(`AVSessionErrorCode ERR_CODE_SERVICE_EXCEPTION is ${avSession.AVSessionErrorCode.ERR_CODE_SERVICE_EXCEPTION}`);
            expect(avSession.AVSessionErrorCode.ERR_CODE_SERVICE_EXCEPTION).assertEqual(6600101);

            console.info(`AVSessionErrorCode ERR_CODE_SESSION_NOT_EXIST is ${avSession.AVSessionErrorCode.ERR_CODE_SESSION_NOT_EXIST}`);
            expect(avSession.AVSessionErrorCode.ERR_CODE_SESSION_NOT_EXIST).assertEqual(6600102);
            
            console.info(`AVSessionErrorCode ERR_CODE_CONTROLLER_NOT_EXIST is ${avSession.AVSessionErrorCode.ERR_CODE_CONTROLLER_NOT_EXIST}`);
            expect(avSession.AVSessionErrorCode.ERR_CODE_CONTROLLER_NOT_EXIST).assertEqual(6600103);

            console.info(`AVSessionErrorCode ERR_CODE_REMOTE_CONNECTION_ERR is ${avSession.AVSessionErrorCode.ERR_CODE_REMOTE_CONNECTION_ERR}`);
            expect(avSession.AVSessionErrorCode.ERR_CODE_REMOTE_CONNECTION_ERR).assertEqual(6600104);

            console.info(`AVSessionErrorCode ERR_CODE_COMMAND_INVALID is ${avSession.AVSessionErrorCode.ERR_CODE_COMMAND_INVALID}`);
            expect(avSession.AVSessionErrorCode.ERR_CODE_COMMAND_INVALID).assertEqual(6600105);

            console.info(`AVSessionErrorCode ERR_CODE_SESSION_INACTIVE is ${avSession.AVSessionErrorCode.ERR_CODE_SESSION_INACTIVE}`);
            expect(avSession.AVSessionErrorCode.ERR_CODE_SESSION_INACTIVE).assertEqual(6600106);

            console.info(`AVSessionErrorCode ERR_CODE_MESSAGE_OVERLOAD is ${avSession.AVSessionErrorCode.ERR_CODE_MESSAGE_OVERLOAD}`);
            expect(avSession.AVSessionErrorCode.ERR_CODE_MESSAGE_OVERLOAD).assertEqual(6600107);

            console.info(`AVSessionErrorCode ERR_CODE_DEVICE_CONNECTION_FAILED is ${avSession.AVSessionErrorCode.ERR_CODE_DEVICE_CONNECTION_FAILED}`);
            expect(avSession.AVSessionErrorCode.ERR_CODE_DEVICE_CONNECTION_FAILED).assertEqual(6600108);

            console.info(`AVSessionErrorCode ERR_CODE_REMOTE_CONNECTION_NOT_EXIST is ${avSession.AVSessionErrorCode.ERR_CODE_REMOTE_CONNECTION_NOT_EXIST}`);
            expect(avSession.AVSessionErrorCode.ERR_CODE_REMOTE_CONNECTION_NOT_EXIST).assertEqual(6600109);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERSTATE_ENUM_0100
         * @tc.name      : compare all value in AVCastPickerState to number value
         * @tc.desc      : Testing enum of AVCastPickerState
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERSTATE_ENUM_0100', 0, async function (done) {
            console.info(`AVCastPickerState STATE_APPEARING is ${AVCastPickerState.STATE_APPEARING}`);
            expect(AVCastPickerState.STATE_APPEARING).assertEqual(0);

            console.info(`AVCastPickerState STATE_DISAPPEARING is ${AVCastPickerState.STATE_DISAPPEARING}`);
            expect(AVCastPickerState.STATE_DISAPPEARING).assertEqual(1);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERSTYLE_ENUM_0100
         * @tc.name      : compare all value in AVCastPickerStyle to number value
         * @tc.desc      : Testing enum of AVCastPickerStyle
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERSTYLE_ENUM_0100', 2, async function (done) {
            console.info(`AVCastPickerStyle STYLE_PANEL is ${AVCastPickerStyle.STYLE_PANEL}`);
            expect(AVCastPickerStyle.STYLE_PANEL).assertEqual(0);

            console.info(`AVCastPickerStyle STYLE_MENU is ${AVCastPickerStyle.STYLE_MENU}`);
            expect(AVCastPickerStyle.STYLE_MENU).assertEqual(1);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERCOLORMODE_ENUM_0100
         * @tc.name      : compare all value in AVCastPickerColorMode to number value
         * @tc.desc      : Testing enum of AVCastPickerColorMode
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERCOLORMODE_ENUM_0100', 2, async function (done) {
            console.info(`AVCastPickerColorMode AUTO is ${AVCastPickerColorMode.AUTO}`);
            expect(AVCastPickerColorMode.AUTO).assertEqual(0);

            console.info(`AVCastPickerColorMode DARK is ${AVCastPickerColorMode.DARK}`);
            expect(AVCastPickerColorMode.DARK).assertEqual(1);
            done();
        })

    })
}