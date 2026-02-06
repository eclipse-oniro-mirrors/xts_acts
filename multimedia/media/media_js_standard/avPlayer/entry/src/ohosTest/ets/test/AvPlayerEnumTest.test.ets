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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'

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
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0100
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0100
        * @tc.desc      : AVPlayer Enumeration test - StateChangeReason
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0100', Level.LEVEL0, async (done: Function) => {
      expect(media.StateChangeReason.USER).assertEqual(1);
      expect(media.StateChangeReason.BACKGROUND).assertEqual(2);
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0200
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0200
        * @tc.desc      : AVPlayer Enumeration test - AVErrorCode
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0200', Level.LEVEL0, async (done: Function) => {
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
      expect(media.AVErrorCode.AVERR_AUDIO_INTERRUPTED).assertEqual(5400107);
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
      expect(media.AVErrorCode.AVERR_SEEK_CONTINUOUS_UNSUPPORTED).assertEqual(5410002);
      expect(media.AVErrorCode.AVERR_SUPER_RESOLUTION_UNSUPPORTED).assertEqual(5410003);
      expect(media.AVErrorCode.AVERR_SUPER_RESOLUTION_NOT_ENABLED).assertEqual(5410004);
      done();
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0300
    * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0300
    * @tc.desc      : AVPlayer Enumeration test - CodecMimeType
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0300', Level.LEVEL0, async (done: Function) => {
      expect(media.CodecMimeType.VIDEO_H263).assertEqual('video/h263');
      expect(media.CodecMimeType.VIDEO_AVC).assertEqual('video/avc');
      expect(media.CodecMimeType.VIDEO_MPEG2).assertEqual('video/mpeg2');
      expect(media.CodecMimeType.VIDEO_MPEG4).assertEqual('video/mp4v-es');
      expect(media.CodecMimeType.VIDEO_VP8).assertEqual('video/x-vnd.on2.vp8');
      expect(media.CodecMimeType.VIDEO_HEVC).assertEqual('video/hevc');
      expect(media.CodecMimeType.AUDIO_AAC).assertEqual('audio/mp4a-latm');
      expect(media.CodecMimeType.AUDIO_VORBIS).assertEqual('audio/vorbis');
      expect(media.CodecMimeType.AUDIO_FLAC).assertEqual('audio/flac');
      expect(media.CodecMimeType.AUDIO_MP3).assertEqual('audio/mpeg');
      expect(media.CodecMimeType.AUDIO_G711MU).assertEqual('audio/g711mu');
      expect(media.CodecMimeType.AUDIO_AMR_NB).assertEqual('audio/3gpp');
      expect(media.CodecMimeType.AUDIO_AMR_WB).assertEqual('audio/amr-wb');
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0400
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0400
        * @tc.desc      : AVPlayer Enumeration test - AudioSourceType
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0400', Level.LEVEL0, async (done: Function) => {
      expect(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT).assertEqual(0);
      expect(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC).assertEqual(1);
      expect(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION).assertEqual(2);
      expect(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION).assertEqual(7);
      expect(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE).assertEqual(10);
      expect(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER).assertEqual(13);
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0500
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0500
        * @tc.desc      : AVPlayer Enumeration test - MediaDescriptionKey
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0500', Level.LEVEL0, async (done: Function) => {
      expect(media.MediaDescriptionKey.MD_KEY_TRACK_INDEX).assertEqual("track_index");
      expect(media.MediaDescriptionKey.MD_KEY_TRACK_TYPE).assertEqual("track_type");
      expect(media.MediaDescriptionKey.MD_KEY_CODEC_MIME).assertEqual("codec_mime");
      expect(media.MediaDescriptionKey.MD_KEY_DURATION).assertEqual("duration");
      expect(media.MediaDescriptionKey.MD_KEY_BITRATE).assertEqual("bitrate");
      expect(media.MediaDescriptionKey.MD_KEY_WIDTH).assertEqual("width");
      expect(media.MediaDescriptionKey.MD_KEY_HEIGHT).assertEqual("height");
      expect(media.MediaDescriptionKey.MD_KEY_FRAME_RATE).assertEqual("frame_rate");
      expect(media.MediaDescriptionKey.MD_KEY_AUD_CHANNEL_COUNT).assertEqual("channel_count");
      expect(media.MediaDescriptionKey.MD_KEY_AUD_SAMPLE_RATE).assertEqual("sample_rate");
      expect(media.MediaDescriptionKey.MD_KEY_AUD_SAMPLE_DEPTH).assertEqual("sample_depth");
      expect(media.MediaDescriptionKey.MD_KEY_LANGUAGE).assertEqual("language");
      expect(media.MediaDescriptionKey.MD_KEY_TRACK_NAME).assertEqual("track_name");
      expect(media.MediaDescriptionKey.MD_KEY_HDR_TYPE).assertEqual("hdr_type");
      done();
    });
    /* *
       * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0600
       * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0600
       * @tc.desc      : AVPlayer Enumeration test - HdrType
       * @tc.size      : MediumTest
       * @tc.type      : Function test
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0600', Level.LEVEL0, async (done: Function) => {
      expect(media.HdrType.AV_HDR_TYPE_NONE).assertEqual(0);
      expect(media.HdrType.AV_HDR_TYPE_VIVID).assertEqual(1);
      done();
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0700
     * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0700
     * @tc.desc      : AVPlayer Enumeration test - PlaybackSpeed
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0700', Level.LEVEL0, async (done: Function) => {
      expect(media.PlaybackSpeed.SPEED_FORWARD_0_75_X).assertEqual(0);
      expect(media.PlaybackSpeed.SPEED_FORWARD_1_00_X).assertEqual(1);
      expect(media.PlaybackSpeed.SPEED_FORWARD_1_25_X).assertEqual(2);
      expect(media.PlaybackSpeed.SPEED_FORWARD_1_75_X).assertEqual(3);
      expect(media.PlaybackSpeed.SPEED_FORWARD_2_00_X).assertEqual(4);
      expect(media.PlaybackSpeed.SPEED_FORWARD_0_50_X).assertEqual(5);
      expect(media.PlaybackSpeed.SPEED_FORWARD_1_50_X).assertEqual(6);
      expect(media.PlaybackSpeed.SPEED_FORWARD_3_00_X).assertEqual(7);
      expect(media.PlaybackSpeed.SPEED_FORWARD_0_25_X).assertEqual(8);
      expect(media.PlaybackSpeed.SPEED_FORWARD_0_125_X).assertEqual(9);
      done();
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0800
     * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0800
     * @tc.desc      : AVPlayer Enumeration test - PlaybackInfoKey
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0800', Level.LEVEL0, async (done: Function) => {
      expect(media.PlaybackInfoKey.SERVER_IP_ADDRESS).assertEqual('server_ip_address');
      expect(media.PlaybackInfoKey.AVG_DOWNLOAD_RATE).assertEqual('average_download_rate');
      expect(media.PlaybackInfoKey.DOWNLOAD_RATE).assertEqual('download_rate');
      expect(media.PlaybackInfoKey.IS_DOWNLOADING).assertEqual('is_downloading');
      expect(media.PlaybackInfoKey.BUFFER_DURATION).assertEqual('buffer_duration');
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0900
     * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0900
     * @tc.desc      : AVPlayer Enumeration test - SeekMode
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_0900', Level.LEVEL0, async (done: Function) => {
      expect(media.SeekMode.SEEK_NEXT_SYNC).assertEqual(0);
      expect(media.SeekMode.SEEK_PREV_SYNC).assertEqual(1);
      expect(media.SeekMode.SEEK_CLOSEST).assertEqual(2);
      expect(media.SeekMode.SEEK_CONTINUOUS).assertEqual(3);
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_1000
     * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_1000
     * @tc.desc      : AVPlayer Enumeration test - MediaType
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_1000', Level.LEVEL0, async (done: Function) => {
      expect(media.MediaType.MEDIA_TYPE_UNSUPPORTED).assertEqual(-1);
      expect(media.MediaType.MEDIA_TYPE_AUD).assertEqual(0);
      expect(media.MediaType.MEDIA_TYPE_VID).assertEqual(1);
      expect(media.MediaType.MEDIA_TYPE_SUBTITLE).assertEqual(2);
      expect(media.MediaType.MEDIA_TYPE_ATTACHMENT).assertEqual(3);
      expect(media.MediaType.MEDIA_TYPE_DATA).assertEqual(4);
      expect(media.MediaType.MEDIA_TYPE_TIMED_METADATA).assertEqual(5);
      expect(media.MediaType.MEDIA_TYPE_AUXILIARY).assertEqual(6);
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_1100
     * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_1100
     * @tc.desc      : AVPlayer Enumeration test - BufferingInfoType
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_1100', Level.LEVEL0, async (done: Function) => {
      expect(media.BufferingInfoType.BUFFERING_START).assertEqual(1);
      expect(media.BufferingInfoType.BUFFERING_END).assertEqual(2);
      expect(media.BufferingInfoType.BUFFERING_PERCENT).assertEqual(3);
      expect(media.BufferingInfoType.CACHED_DURATION).assertEqual(4);
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_1200
     * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_1200
     * @tc.desc      : AVPlayer Enumeration test - SwitchMode
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_1200', Level.LEVEL0, async (done: Function) => {
      expect(media.SwitchMode.SMOOTH).assertEqual(0);
      expect(media.SwitchMode.SEGMENT).assertEqual(1);
      expect(media.SwitchMode.CLOSEST).assertEqual(2);
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_1300
     * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_1300
     * @tc.desc      : AVPlayer Enumeration test - VideoScaleType
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_1300', Level.LEVEL0, async (done: Function) => {
      expect(media.VideoScaleType.VIDEO_SCALE_TYPE_FIT).assertEqual(0);
      expect(media.VideoScaleType.VIDEO_SCALE_TYPE_FIT_CROP).assertEqual(1);
      expect(media.VideoScaleType.VIDEO_SCALE_TYPE_SCALED_ASPECT).assertEqual(2);
      done();
    });

  })
}

