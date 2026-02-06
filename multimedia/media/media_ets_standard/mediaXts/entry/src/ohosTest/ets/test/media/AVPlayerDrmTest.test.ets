/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from "@ohos/hypium";
import { media } from "@kit.MediaKit";
import MediaTestBase from "./MediaTestBase";
import { HashMap } from "@kit.ArkTS";
import { LOG_TAG, MAX_COUNT, SLEEP_TIME_200 } from "../Constants";
import { fileIo as fs } from '@kit.CoreFileKit';
import { sleep } from "../common";
import { drm } from "@kit.DrmKit";

const TAG = LOG_TAG + 'AVPlayerDrmTest';

let systemName: string = '';
let isClearPlay = drm.isMediaKeySystemSupported("com.clearplay.drm");
if (isClearPlay) {
  systemName = "com.clearplay.drm";
} else {
  systemName = "com.wiseplay.drm";
}

export default function AVPlayerDrmTest() {
  describe('AVPlayerDrmTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
    });

    beforeEach(async () => {
      console.info(TAG, 'beforeEach case');
    });

    afterEach(async () => {
      console.info(TAG, 'afterEach case');
    });

    afterAll(async () => {
      console.info(TAG, 'afterAll case');
    });

    /**
     * @tc.number    : AVPLAYER_DRM_TEST_001
     * @tc.name      : setDecryptionConfig_001
     * @tc.desc      : create AVPlayer to set DecryptionConfig
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('setDecryptionConfig_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setDecryptionConfig_001';
      console.info(TAG, testName + ' begin.');
      let drmMediaKeySystem: drm.MediaKeySystem;
      let session: drm.MediaKeySession;
      try {
        drmMediaKeySystem = drm.createMediaKeySystem(systemName);
      } catch (err) {
        console.error(TAG, testName + ' drm createMediaKeySystem failed.');
        done();
      }
      try {
        session = drmMediaKeySystem!.createMediaKeySession();
      } catch (err) {
        console.error(TAG, testName + ' drm createMediaKeySession failed.');
        drmMediaKeySystem!.destroy();
        done();
      }
      let avPlayer: media.AVPlayer = await media.createAVPlayer();
      avPlayer.setDecryptionConfig(session!, false);
      expect(true).assertTrue();
      session!.destroy();
      drmMediaKeySystem!.destroy();
      done();
    })

    /**
     * @tc.number    : AVPLAYER_DRM_TEST_002
     * @tc.name      : getMediaKeySystemInfos_001
     * @tc.desc      : create AVPlayer to get MediaKeySystemInfos
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('getMediaKeySystemInfos_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getMediaKeySystemInfos_001';
      console.info(TAG, testName + ' begin.');
      let drmMediaKeySystem: drm.MediaKeySystem;
      try {
        drmMediaKeySystem = drm.createMediaKeySystem(systemName);
      } catch (err) {
        console.error(TAG, testName + ' drm createMediaKeySystem failed.');
        done();
      }
      let avPlayer: media.AVPlayer = await media.createAVPlayer();
      avPlayer.on('mediaKeySystemInfoUpdate', (mediaKeySystemInfo: Array<drm.MediaKeySystemInfo>) => {
        for (let i = 0; i < mediaKeySystemInfo.length; i++) {
          console.info(TAG,
            testName + ' getMediaKeySystemInfos item: ' + i + ', uuid: ' + mediaKeySystemInfo[i].uuid + ', pssh: ' +
            mediaKeySystemInfo[i].pssh);
        }
      });
      let infos: drm.MediaKeySystemInfo[] = avPlayer.getMediaKeySystemInfos();
      if (infos && infos.length > 0) {
        for (let i = 0; i < infos.length; i++) {
          console.info(TAG,
            testName + ' getMediaKeySystemInfos item: ' + i + ', uuid: ' + infos[i].uuid + ', pssh: ' + infos[i].pssh);
        }
      } else {
        console.error(TAG, testName + ' avPlayer getMediaKeySystemInfos failed.');
        expect(infos).assertUndefined();
      }
      avPlayer.off('mediaKeySystemInfoUpdate');
      drmMediaKeySystem!.destroy();
      done();
    })
  })
}