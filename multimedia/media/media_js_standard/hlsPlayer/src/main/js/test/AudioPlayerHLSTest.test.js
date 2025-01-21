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

import media from '@ohos.multimedia.media'
import {playAudioSource} from '../../../../../AudioPlayerTestBase.js';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('AudioPlayerHLSTest', function () {
    const HTTP_PATH = 'http://123.57.24.33:8000/';
    const PLAY_TIME = 3000;

    beforeAll(function() {
        console.info('beforeAll case');
    })

    beforeEach(function() {
        console.info('beforeEach case');
    })

    afterEach(function() {
        console.info('afterEach case');
    })

    afterAll(function() {
        console.info('afterAll case');
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_HLS_0100
        * @tc.name      : 001.test hls audio only
        * @tc.desc      : HLS Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_HLS_0100', 0, async function (done) {
        playAudioSource(HTTP_PATH + '05.hls/audio_only/index.m3u8', 219600, PLAY_TIME, false, done);
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_HLS_VARIANT_0100
        * @tc.name      : 001.test hls audio variant
        * @tc.desc      : HLS Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_HLS_VARIANT_0100', 0, async function (done) {
        playAudioSource(HTTP_PATH + '05.hls/hls_variant_audio/index.m3u8', 219600, PLAY_TIME, false, done);
    })
})
