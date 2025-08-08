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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

export default function AvPlayerEnumTest() {
  describe('AvPlayerEnumTest', () => {
    beforeAll(() => {
      console.info('beforeAll case');
    });
    beforeEach(() => {
      console.info('beforeEach case');
    });
    afterEach(() => {
      console.info('afterEach case');
    });
    afterAll(() => {
      console.info('afterAll case');
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_ENUM_AUDIO_OUTPUT_FORMAT_0100
        * @tc.name      : AVPlayer
        * @tc.desc      : AVPlayer Enumeration test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0100', 0, async (done: Function) => {
      expect(media.StateChangeReason.USER).assertEqual(1);
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0200
        * @tc.name      : AVPlayer
        * @tc.desc      : AVPlayer Enumeration test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0200', 0, async (done: Function) => {
      expect(media.AVErrorCode.AVERR_OK).assertEqual(0);
      expect(media.AVErrorCode.AVERR_NO_PERMISSION).assertEqual(201);
      expect(media.AVErrorCode.AVERR_INVALID_PARAMETER).assertEqual(401);
      expect(media.AVErrorCode.AVERR_UNSUPPORT_CAPABILITY).assertEqual(801);
      expect(media.AVErrorCode.AVERR_NO_MEMORY).assertEqual(5400101);
      expect(media.AVErrorCode.AVERR_OPERATE_NOT_PERMIT).assertEqual(5400102);
      expect(media.AVErrorCode.AVERR_IO).assertEqual(5400103);
      expect(media.AVErrorCode.AVERR_TIMEOUT).assertEqual(5400104);
      expect(media.AVErrorCode.AVERR_SERVICE_DIED).assertEqual(5400105);
      expect(media.AVErrorCode.AVERR_UNSUPPORT_FORMAT).assertEqual(5400106);
      done();
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0300
    * @tc.name      : AVPlayer
    * @tc.desc      : AVPlayer Enumeration test
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0300', 0, async (done: Function) => {
      expect(media.CodecMimeType.VIDEO_H263).assertEqual('video/h263');
      expect(media.CodecMimeType.VIDEO_AVC).assertEqual('video/avc');
      expect(media.CodecMimeType.VIDEO_MPEG2).assertEqual('video/mpeg2');
      expect(media.CodecMimeType.VIDEO_MPEG4).assertEqual('video/mp4v-es');
      expect(media.CodecMimeType.VIDEO_VP8).assertEqual('video/x-vnd.on2.vp8');
      expect(media.CodecMimeType.AUDIO_AAC).assertEqual('audio/mp4a-latm');
      expect(media.CodecMimeType.AUDIO_VORBIS).assertEqual('audio/vorbis');
      expect(media.CodecMimeType.AUDIO_FLAC).assertEqual('audio/flac');
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0400
        * @tc.name      : AVPlayer
        * @tc.desc      : AVPlayer Enumeration test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0400', 0, async (done: Function) => {
      expect(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT).assertEqual(0);
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0500
        * @tc.name      : AVPlayer
        * @tc.desc      : AVPlayer Enumeration test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0500', 0, async (done: Function) => {
      expect(media.MediaDescriptionKey.MD_KEY_LANGUAGE).assertEqual("language");
      done();
    });
    /* *
       * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0600
       * @tc.name      : AVPlayer
       * @tc.desc      : AVPlayer Enumeration test
       * @tc.size      : MediumTest
       * @tc.type      : Function test
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0600', 0, async (done: Function) => {
      expect(media.HdrType.AV_HDR_TYPE_NONE).assertEqual(0);
      expect(media.HdrType.AV_HDR_TYPE_VIVID).assertEqual(1);
      done();
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0700
     * @tc.name      : AVPlayer
     * @tc.desc      : AVPlayer Enumeration test
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0700', 0, async (done: Function) => {
      expect(media.PlaybackSpeed.SPEED_FORWARD_0_25_X).assertEqual(8);
      expect(media.PlaybackSpeed.SPEED_FORWARD_0_125_X).assertEqual(9);
      done();
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0800
     * @tc.name      : AVPlayer
     * @tc.desc      : AVPlayer Enumeration test
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0800', 0, async (done: Function) => {
      expect(media.PlaybackSpeed.SPEED_FORWARD_3_00_X).assertEqual(7);
      done();
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0900
     * @tc.name      : AVPlayer
     * @tc.desc      : AVPlayer Enumeration test
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0900', 0, async (done: Function) => {
      expect(media.PlaybackInfoKey.SERVER_IP_ADDRESS).assertEqual('server_ip_address');
      expect(media.PlaybackInfoKey.AVG_DOWNLOAD_RATE).assertEqual('average_download_rate');
      expect(media.PlaybackInfoKey.DOWNLOAD_RATE).assertEqual('download_rate');
      expect(media.PlaybackInfoKey.IS_DOWNLOADING).assertEqual('is_downloading');
      expect(media.PlaybackInfoKey.BUFFER_DURATION).assertEqual('buffer_duration');
      done();
    });

    
    /**
     * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0910
     * @tc.name      : AVPlayer
     * @tc.desc      : AVPlayer Enumeration test
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0910', 0, async (done: Function) => {
      expect(media.AVErrorCode.AVERR_IO_HOST_NOT_FOUND).assertEqual(5411001);
      expect(media.AVErrorCode.AVERR_IO_CONNECTION_TIMEOUT).assertEqual(5411002);
      expect(media.AVErrorCode.AVERR_IO_NETWORK_ABNORMAL).assertEqual(5411003);
      expect(media.AVErrorCode.AVERR_IO_NETWORK_UNAVAILABLE).assertEqual(5411004);
      expect(media.AVErrorCode.AVERR_IO_NO_PERMISSION).assertEqual(5411005);
      expect(media.AVErrorCode.AVERR_IO_REQUEST_DENIED).assertEqual(5411006);
      expect(media.AVErrorCode.AVERR_IO_RESOURCE_NOT_FOUND).assertEqual(5411007);
      expect(media.AVErrorCode.AVERR_IO_SSL_CLIENT_CERT_NEEDED).assertEqual(5411008);
      expect(media.AVErrorCode.AVERR_IO_SSL_CONNECTION_FAILED).assertEqual(5411009);
      expect(media.AVErrorCode.AVERR_IO_SSL_SERVER_CERT_UNTRUSTED).assertEqual(5411010);
      expect(media.AVErrorCode.AVERR_IO_UNSUPPORTED_REQUEST).assertEqual(5411011);
      expect(media.AVErrorCode.AVERR_SUPER_RESOLUTION_UNSUPPORTED).assertEqual(5410003);
      expect(media.AVErrorCode.AVERR_SUPER_RESOLUTION_NOT_ENABLED).assertEqual(5410004);
      done();
    });

  })
}

