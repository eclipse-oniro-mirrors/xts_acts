/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import media from '@ohos.multimedia.media'
import * as mediaTestBase from './MediaTestBase.js';
import * as AVRecorderTestBase from './AVRecorderTestBase.js';
import camera from '@ohos.multimedia.camera'

export const AV_RECORDER_STATE = {
    IDLE : 'idle',
    PREPARED : 'prepared',
    STARTED : 'started',
    PAUSED : 'paused',
    STOPPED : 'stopped',
    RELEASED : 'released',
    ERROR : 'error',
}

export const AV_RECORDER_AUDIO_STATE = {
    PREPARED: 1,
    STARTED: 2,
    PAUSED: 3,
}

export function resourceName(){
    let timestamp = Date.now();
    let filename = `avRecorder_${timestamp}.mp4`;
    return filename;
}




