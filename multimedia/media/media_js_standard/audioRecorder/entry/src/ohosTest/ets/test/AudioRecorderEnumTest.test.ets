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

export default function AudioRecorderEnumTest() {
  describe('AudioRecorderEnumTest', () => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_ENUM_AUDIO_OUTPUT_FORMAT_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_ENUM_AUDIO_OUTPUT_FORMAT_0100
     * @tc.desc   AudioOutputFormat Enumeration test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_ENUM_AUDIO_OUTPUT_FORMAT_0100', Level.LEVEL0, async (done: Function) => {
      expect(media.AudioOutputFormat.DEFAULT).assertEqual(0);
      expect(media.AudioOutputFormat.MPEG_4).assertEqual(2);
      expect(media.AudioOutputFormat.AMR_NB).assertEqual(3);
      expect(media.AudioOutputFormat.AMR_WB).assertEqual(4);
      expect(media.AudioOutputFormat.AAC_ADTS).assertEqual(6);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_ENUM_AUDIO_ENCODER_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_ENUM_AUDIO_ENCODER_0100
     * @tc.desc   AudioOutputFormat Enumeration test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_ENUM_AUDIO_ENCODER_0100', Level.LEVEL0, async (done: Function) => {
      expect(media.AudioEncoder.DEFAULT).assertEqual(0);
      expect(media.AudioEncoder.AMR_NB).assertEqual(1);
      expect(media.AudioEncoder.AMR_WB).assertEqual(2);
      expect(media.AudioEncoder.AAC_LC).assertEqual(3);
      expect(media.AudioEncoder.HE_AAC).assertEqual(4);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_DECODER_ENUM_CODECMIMETYPE_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_DECODER_ENUM_CODECMIMETYPE_0100
     * @tc.desc   Test Enumerate CodecMimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_DECODER_ENUM_CODECMIMETYPE_0100', Level.LEVEL0, async (done: Function) => {
      expect(media.CodecMimeType.AUDIO_AAC).assertEqual('audio/mp4a-latm');
      expect(media.CodecMimeType.AUDIO_VORBIS).assertEqual('audio/vorbis');
      expect(media.CodecMimeType.AUDIO_FLAC).assertEqual('audio/flac');
      expect(media.CodecMimeType.AUDIO_AMR_NB).assertEqual('audio/3gpp');
      expect(media.CodecMimeType.AUDIO_AMR_WB).assertEqual('audio/amr-wb');
      done();
    });
  })
}

