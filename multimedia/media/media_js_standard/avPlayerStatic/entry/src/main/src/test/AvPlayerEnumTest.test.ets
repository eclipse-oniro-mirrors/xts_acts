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

import media from '@ohos.multimedia.media'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "../../../hypium/index";
import audio from '@ohos.multimedia.audio';

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
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0100
     * @tc.desc   AVPlayer Enumeration test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      expect(Number(media.StateChangeReason.USER)).assertEqual(1);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0200
     * @tc.desc   AVPlayer Enumeration test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      expect(Number(media.AVErrorCode.AVERR_OK)).assertEqual(0);
      expect(Number(media.AVErrorCode.AVERR_NO_PERMISSION)).assertEqual(201);
      expect(Number(media.AVErrorCode.AVERR_INVALID_PARAMETER)).assertEqual(401);
      expect(Number(media.AVErrorCode.AVERR_UNSUPPORT_CAPABILITY)).assertEqual(801);
      expect(Number(media.AVErrorCode.AVERR_NO_MEMORY)).assertEqual(5400101);
      expect(Number(media.AVErrorCode.AVERR_OPERATE_NOT_PERMIT)).assertEqual(5400102);
      expect(Number(media.AVErrorCode.AVERR_IO)).assertEqual(5400103);
      expect(Number(media.AVErrorCode.AVERR_TIMEOUT)).assertEqual(5400104);
      expect(Number(media.AVErrorCode.AVERR_SERVICE_DIED)).assertEqual(5400105);
      expect(Number(media.AVErrorCode.AVERR_UNSUPPORT_FORMAT)).assertEqual(5400106);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0300
     * @tc.desc   AVPlayer Enumeration test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      expect(string(media.CodecMimeType.VIDEO_H263)).assertEqual('video/h263');
      expect(string(media.CodecMimeType.VIDEO_AVC)).assertEqual('video/avc');
      expect(string(media.CodecMimeType.VIDEO_MPEG2)).assertEqual('video/mpeg2');
      expect(string(media.CodecMimeType.VIDEO_MPEG4)).assertEqual('video/mp4v-es');
      expect(string(media.CodecMimeType.VIDEO_VP8)).assertEqual('video/x-vnd.on2.vp8');
      expect(string(media.CodecMimeType.AUDIO_AAC)).assertEqual('audio/mp4a-latm');
      expect(string(media.CodecMimeType.AUDIO_VORBIS)).assertEqual('audio/vorbis');
      expect(string(media.CodecMimeType.AUDIO_FLAC)).assertEqual('audio/flac');
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0400
     * @tc.desc   AVPlayer Enumeration test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      expect(Number(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT)).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0500
     * @tc.desc   AVPlayer Enumeration test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      expect(string(media.MediaDescriptionKey.MD_KEY_LANGUAGE)).assertEqual("language");
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0600
     * @tc.desc   AVPlayer Enumeration test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      expect(Number(media.HdrType.AV_HDR_TYPE_NONE)).assertEqual(0);
      expect(Number(media.HdrType.AV_HDR_TYPE_VIVID)).assertEqual(1);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0700
     * @tc.desc   AVPlayer Enumeration test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      expect(media.PlaybackSpeed.SPEED_FORWARD_0_25_X as number).assertEqual(8);
      expect(Number(media.PlaybackSpeed.SPEED_FORWARD_0_125_X)).assertEqual(9);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0800
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0800
     * @tc.desc   AVPlayer Enumeration test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      expect(Number(media.PlaybackSpeed.SPEED_FORWARD_3_00_X)).assertEqual(7);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0900
     * @tc.desc   AVPlayer Enumeration test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      expect(string(media.PlaybackInfoKey.SERVER_IP_ADDRESS)).assertEqual('server_ip_address');
      expect(string(media.PlaybackInfoKey.AVG_DOWNLOAD_RATE)).assertEqual('average_download_rate');
      expect(string(media.PlaybackInfoKey.DOWNLOAD_RATE)).assertEqual('download_rate');
      expect(string(media.PlaybackInfoKey.IS_DOWNLOADING)).assertEqual('is_downloading');
      expect(string(media.PlaybackInfoKey.BUFFER_DURATION)).assertEqual('buffer_duration');
      done();
    });


    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0910
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0910
     * @tc.desc   AVPlayer Enumeration test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      expect(Number(media.AVErrorCode.AVERR_IO_HOST_NOT_FOUND)).assertEqual(5411001);
      expect(Number(media.AVErrorCode.AVERR_IO_CONNECTION_TIMEOUT)).assertEqual(5411002);
      expect(Number(media.AVErrorCode.AVERR_IO_NETWORK_ABNORMAL)).assertEqual(5411003);
      expect(Number(media.AVErrorCode.AVERR_IO_NETWORK_UNAVAILABLE)).assertEqual(5411004);
      expect(Number(media.AVErrorCode.AVERR_IO_NO_PERMISSION)).assertEqual(5411005);
      expect(Number(media.AVErrorCode.AVERR_IO_REQUEST_DENIED)).assertEqual(5411006);
      expect(Number(media.AVErrorCode.AVERR_IO_RESOURCE_NOT_FOUND)).assertEqual(5411007);
      expect(Number(media.AVErrorCode.AVERR_IO_SSL_CLIENT_CERT_NEEDED)).assertEqual(5411008);
      expect(Number(media.AVErrorCode.AVERR_IO_SSL_CONNECTION_FAILED)).assertEqual(5411009);
      expect(Number(media.AVErrorCode.AVERR_IO_SSL_SERVER_CERT_UNTRUSTED)).assertEqual(5411010);
      expect(Number(media.AVErrorCode.AVERR_IO_UNSUPPORTED_REQUEST)).assertEqual(5411011);
      expect(Number(media.AVErrorCode.AVERR_SUPER_RESOLUTION_UNSUPPORTED)).assertEqual(5410003);
      expect(Number(media.AVErrorCode.AVERR_SUPER_RESOLUTION_NOT_ENABLED)).assertEqual(5410004);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0911
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0911
     * @tc.desc   AVPlayer Enumeration test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_ENUM_static_0911', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      expect(Number(media.SeekMode.SEEK_CONTINUOUS)).assertEqual(3);
      expect(Number(media.AVErrorCode.AVERR_SEEK_CONTINUOUS_UNSUPPORTED)).assertEqual(5410002);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIO_ENUM_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIO_ENUM_static_0100
     * @tc.desc   AVPlayer Enumeration test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIO_ENUM_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      expect(Number(audio.AudioEffectMode.EFFECT_NONE)).assertEqual(0);
      expect(Number(audio.AudioEffectMode.EFFECT_DEFAULT)).assertEqual(1);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIO_ENUM_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIO_ENUM_static_0200
     * @tc.desc   AVPlayer Enumeration test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIO_ENUM_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      expect(Number(audio.InterruptMode.SHARE_MODE)).assertEqual(0);
      expect(Number(audio.InterruptMode.INDEPENDENT_MODE)).assertEqual(1);
      expect(Number(audio.StreamUsage.STREAM_USAGE_UNKNOWN)).assertEqual(0);
      done();
    });

  })
}

