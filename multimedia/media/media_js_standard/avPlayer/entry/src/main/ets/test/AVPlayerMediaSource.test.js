/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import media from '@ohos.multimedia.media';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'


export default function AVPlayerMediaSource() {
    let player ;
    let header;
  describe('AVPlayerMediaSource', function () {
    beforeAll(async function () {
        player = await media.createAVPlayer();
        header = {"User-Agent" : "User-Agent-Value"};
    })

    beforeEach(async function () {
      console.info('beforeEach case');
    })

    afterEach(async function () {
      console.info('afterEach case');
    })

    afterAll(async function () {
      console.info('afterAll case');
    })
    

    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0100
      * @tc.name      : 001.testMediaSource
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0100', 0, async function (done) {
        console.info('AVPlayerMediaSource success');
        let mediaSource = media.createMediaSourceWithUrl("http://xxx",  header);
        let playStrategy = {preferredWidth: 1, preferredHeight: 2, preferredBufferDuration: 3, preferredHdr: false};
        player.setMediaSource(mediaSource, playStrategy);
        done();
      })

    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0200
      * @tc.name      : 002.testMediaSource
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0200', 0, async function (done) {
      let header = {"User-Agent" : "User-Agent-Value"};
      let mediaSource = media.createMediaSourceWithUrl("http://xxx",  header);
      let mimeType = media.AVMimeTypes.APPLICATION_M3U8;
      mediaSource.setMimeType(mimeType);
      done();
    })

  })
}
