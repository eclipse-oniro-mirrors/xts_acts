/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

#ifndef MEDIA_AVCODEC_CODEC_KEY_H
#define MEDIA_AVCODEC_CODEC_KEY_H
#include <string>
#include <unordered_set>

namespace OHOS {
namespace MediaAVCodec {
class AVCodecCodecName {
public:
    static constexpr const char* AUDIO_DECODER_MP3_NAME = "OH.Media.Codec.Decoder.Audio.Mpeg";
    static constexpr const char* AUDIO_DECODER_AAC_NAME = "OH.Media.Codec.Decoder.Audio.AAC";
    static constexpr const char* AUDIO_DECODER_OPUS_NAME = "OH.Media.Codec.Decoder.Audio.Opus";
    static constexpr const char* AUDIO_DECODER_API9_AAC_NAME = "avdec_aac";
    static constexpr const char* AUDIO_DECODER_VORBIS_NAME = "OH.Media.Codec.Decoder.Audio.Vorbis";
    static constexpr const char* AUDIO_DECODER_FLAC_NAME = "OH.Media.Codec.Decoder.Audio.Flac";
    static constexpr const char* AUDIO_DECODER_AMRNB_NAME = "OH.Media.Codec.Decoder.Audio.Amrnb";
    static constexpr const char* AUDIO_DECODER_AMRWB_NAME = "OH.Media.Codec.Decoder.Audio.Amrwb";
    static constexpr const char* AUDIO_DECODER_VIVID_NAME = "OH.Media.Codec.Decoder.Audio.Vivid";
    static constexpr const char* AUDIO_DECODER_G711MU_NAME = "OH.Media.Codec.Decoder.Audio.G711mu";
    static constexpr const char* AUDIO_DECODER_G711A_NAME = "OH.Media.Codec.Decoder.Audio.G711a";
    static constexpr const char* AUDIO_DECODER_GSM_MS_NAME = "OH.Media.Codec.Decoder.Audio.GSM_MS";
    static constexpr const char* AUDIO_DECODER_GSM_NAME = "OH.Media.Codec.Decoder.Audio.GSM";
    static constexpr const char* AUDIO_DECODER_APE_NAME = "OH.Media.Codec.Decoder.Audio.Ape";
    static constexpr const char* AUDIO_DECODER_L2HC_NAME = "OH.Media.Codec.Decoder.Audio.L2HC";
    static constexpr const char* AUDIO_DECODER_LBVC_NAME = "OH.Media.Codec.Decoder.Audio.LBVC";
    static constexpr const char* AUDIO_DECODER_DVAUDIO_NAME = "OH.Media.Codec.Decoder.Audio.DVAUDIO";
    static constexpr const char* AUDIO_DECODER_DTS_NAME = "OH.Media.Codec.Decoder.Audio.DTS";
    static constexpr const char* AUDIO_DECODER_COOK_NAME = "OH.Media.Codec.Decoder.Audio.COOK";
    static constexpr const char* AUDIO_DECODER_AC3_NAME = "OH.Media.Codec.Decoder.Audio.AC3";
    static constexpr const char* AUDIO_DECODER_EAC3_NAME = "OH.Media.Codec.Decoder.Audio.EAC3";
    static constexpr const char* AUDIO_DECODER_ALAC_NAME = "OH.Media.Codec.Decoder.Audio.ALAC";
    static constexpr const char* AUDIO_DECODER_RAW_NAME = "OH.Media.Codec.Decoder.Audio.Raw";
    static constexpr const char* AUDIO_DECODER_WMAV1_NAME = "OH.Media.Codec.Decoder.Audio.WMAv1";
    static constexpr const char* AUDIO_DECODER_WMAV2_NAME = "OH.Media.Codec.Decoder.Audio.WMAv2";
    static constexpr const char* AUDIO_DECODER_WMAPRO_NAME = "OH.Media.Codec.Decoder.Audio.WMAPro";
    static constexpr const char* AUDIO_DECODER_ADPCM_MS_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.MS";
    static constexpr const char* AUDIO_DECODER_ADPCM_IMA_QT_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.IMA.QT";
    static constexpr const char* AUDIO_DECODER_ADPCM_IMA_WAV_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.IMA.WAV";
    static constexpr const char* AUDIO_DECODER_ADPCM_IMA_DK3_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.IMA.DK3";
    static constexpr const char* AUDIO_DECODER_ADPCM_IMA_DK4_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.IMA.DK4";
    static constexpr const char* AUDIO_DECODER_ADPCM_IMA_WS_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.IMA.WS";
    static constexpr const char* AUDIO_DECODER_ADPCM_IMA_SMJPEG_NAME =
                                      "OH.Media.Codec.Decoder.Audio.ADPCM.IMA.SMJPEG";
    static constexpr const char* AUDIO_DECODER_ADPCM_IMA_DAT4_NAME =
                                      "OH.Media.Codec.Decoder.Audio.ADPCM.IMA.DAT4";
    static constexpr const char* AUDIO_DECODER_ADPCM_MTAF_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.MTAF";
    static constexpr const char* AUDIO_DECODER_ADPCM_ADX_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.ADX";
    static constexpr const char* AUDIO_DECODER_ADPCM_AFC_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.AFC";
    static constexpr const char* AUDIO_DECODER_ADPCM_AICA_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.AICA";
    static constexpr const char* AUDIO_DECODER_ADPCM_CT_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.CT";
    static constexpr const char* AUDIO_DECODER_ADPCM_DTK_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.DTK";
    static constexpr const char* AUDIO_DECODER_ADPCM_G722_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.G722";
    static constexpr const char* AUDIO_DECODER_ADPCM_G726_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.G726";
    static constexpr const char* AUDIO_DECODER_ADPCM_G726LE_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.G726LE";
    static constexpr const char* AUDIO_DECODER_ADPCM_IMA_AMV_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.IMA.AMV";
    static constexpr const char* AUDIO_DECODER_ADPCM_IMA_APC_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.IMA.APC";
    static constexpr const char* AUDIO_DECODER_ADPCM_IMA_ISS_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.IMA.ISS";
    static constexpr const char* AUDIO_DECODER_ADPCM_IMA_OKI_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.IMA.OKI";
    static constexpr const char* AUDIO_DECODER_ADPCM_IMA_RAD_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.IMA.RAD";
    static constexpr const char* AUDIO_DECODER_ADPCM_PSX_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.PSX";
    static constexpr const char* AUDIO_DECODER_ADPCM_SBPRO_2_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.SBPRO2";
    static constexpr const char* AUDIO_DECODER_ADPCM_SBPRO_3_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.SBPRO3";
    static constexpr const char* AUDIO_DECODER_ADPCM_SBPRO_4_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.SBPRO4";
    static constexpr const char* AUDIO_DECODER_ADPCM_THP_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.THP";
    static constexpr const char* AUDIO_DECODER_ADPCM_THP_LE_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.THP.LE";
    static constexpr const char* AUDIO_DECODER_ADPCM_XA_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.XA";
    static constexpr const char* AUDIO_DECODER_ADPCM_YAMAHA_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.YAMAHA";
    static constexpr const char* AUDIO_DECODER_ILBC_NAME = "OH.Media.Codec.Decoder.Audio.ILBC";
    static constexpr const char* AUDIO_DECODER_TRUEHD_NAME = "OH.Media.Codec.Decoder.Audio.TrueHD";
    static constexpr const char* AUDIO_DECODER_TWINVQ_NAME = "OH.Media.Codec.Decoder.Audio.TwinVQ";
    static constexpr const char* AUDIO_ENCODER_FLAC_NAME = "OH.Media.Codec.Encoder.Audio.Flac";
    static constexpr const char* AUDIO_ENCODER_OPUS_NAME = "OH.Media.Codec.Encoder.Audio.Opus";
    static constexpr const char* AUDIO_ENCODER_G711MU_NAME = "OH.Media.Codec.Encoder.Audio.G711mu";
    static constexpr const char* AUDIO_ENCODER_AAC_NAME = "OH.Media.Codec.Encoder.Audio.AAC";
    static constexpr const char* AUDIO_ENCODER_VENDOR_AAC_NAME = "OH.Media.Codec.Encoder.Audio.Vendor.AAC";
    static constexpr const char* AUDIO_ENCODER_L2HC_NAME = "OH.Media.Codec.Encoder.Audio.L2HC";
    static constexpr const char* AUDIO_ENCODER_LBVC_NAME = "OH.Media.Codec.Encoder.Audio.LBVC";
    static constexpr const char* AUDIO_ENCODER_AMRNB_NAME = "OH.Media.Codec.Encoder.Audio.Amrnb";
    static constexpr const char* AUDIO_ENCODER_AMRWB_NAME = "OH.Media.Codec.Encoder.Audio.Amrwb";
    static constexpr const char* AUDIO_ENCODER_API9_AAC_NAME = "avenc_aac";
    static constexpr const char* AUDIO_ENCODER_MP3_NAME = "OH.Media.Codec.Encoder.Audio.Mp3";

    static constexpr const char* VIDEO_DECODER_MSVIDEO1_NAME = "OH.Media.Codec.Decoder.Video.MSVIDEO1";
    static constexpr const char* VIDEO_DECODER_VC1_NAME = "OH.Media.Codec.Decoder.Video.VC1";
    static constexpr const char* VIDEO_DECODER_WVC1_NAME = "OH.Media.Codec.Decoder.Video.WVC1";
    static constexpr const char* VIDEO_ENCODER_AVC_NAME = "OH.Media.Codec.Encoder.Video.AVC";
    static constexpr const char* VIDEO_DECODER_AVC_NAME = "OH.Media.Codec.Decoder.Video.AVC";
    static constexpr const char* VIDEO_DECODER_HEVC_NAME = "OH.Media.Codec.Decoder.Video.HEVC";
    static constexpr const char* VIDEO_DECODER_VP8_NAME = "OH.Media.Codec.Decoder.Video.VP8";
    static constexpr const char* VIDEO_DECODER_VP9_NAME = "OH.Media.Codec.Decoder.Video.VP9";
    static constexpr const char* VIDEO_DECODER_AV1_NAME = "OH.Media.Codec.Decoder.Video.AV1";
    static constexpr const char* VIDEO_DECODER_MPEG2_NAME = "OH.Media.Codec.Decoder.Video.MPEG2";
    static constexpr const char* VIDEO_DECODER_MPEG4_NAME = "OH.Media.Codec.Decoder.Video.MPEG4";
    static constexpr const char* VIDEO_DECODER_MPEG1_NAME = "OH.Media.Codec.Decoder.Video.MPEG";
    static constexpr const char* VIDEO_DECODER_H263_NAME = "OH.Media.Codec.Decoder.Video.H263";
    static constexpr const char* VIDEO_DECODER_VVC_NAME = "OH.Media.Codec.Decoder.Video.VVC";
    static constexpr const char* VIDEO_DECODER_RV30_NAME = "OH.Media.Codec.Decoder.Video.Rv30";
    static constexpr const char* VIDEO_DECODER_RV40_NAME = "OH.Media.Codec.Decoder.Video.Rv40";
    static constexpr const char* VIDEO_DECODER_MJPEG_NAME = "OH.Media.Codec.Decoder.Video.MJPEG";
    static constexpr const char* VIDEO_DECODER_WMV3_NAME = "OH.Media.Codec.Decoder.Video.WMV3";
    static constexpr const char* VIDEO_DECODER_DVVIDEO_NAME = "OH.Media.Codec.Decoder.Video.DVVIDEO";
    static constexpr const char* VIDEO_DECODER_RAWVIDEO_NAME = "OH.Media.Codec.Decoder.Video.RAWVIDEO";

    static const std::unordered_set<const char*> &GetAudioCodecOuterSupportTable()
    {
        static const std::unordered_set<const char*> OUTER_SUPPORT_TABLE = {
            AUDIO_DECODER_AAC_NAME,
            AUDIO_ENCODER_AAC_NAME,
            AUDIO_DECODER_FLAC_NAME,
            AUDIO_ENCODER_FLAC_NAME,
            AUDIO_DECODER_VORBIS_NAME,
            AUDIO_DECODER_AMRNB_NAME,
            AUDIO_DECODER_MP3_NAME,
            AUDIO_ENCODER_MP3_NAME,
            AUDIO_DECODER_AMRWB_NAME,
            AUDIO_DECODER_G711MU_NAME,
            AUDIO_ENCODER_G711MU_NAME,
            AUDIO_DECODER_G711A_NAME,
            AUDIO_DECODER_APE_NAME,
            AUDIO_DECODER_RAW_NAME,
            AUDIO_DECODER_AC3_NAME,
            AUDIO_DECODER_GSM_MS_NAME,
            AUDIO_DECODER_GSM_NAME,
            AUDIO_DECODER_ALAC_NAME,
            AUDIO_DECODER_WMAV1_NAME,
            AUDIO_DECODER_WMAV2_NAME,
            AUDIO_DECODER_WMAPRO_NAME,
            AUDIO_DECODER_ILBC_NAME,
            AUDIO_DECODER_TRUEHD_NAME,
            AUDIO_DECODER_TWINVQ_NAME,
            AUDIO_DECODER_DVAUDIO_NAME,
            AUDIO_DECODER_DTS_NAME,
            AUDIO_DECODER_COOK_NAME,
            
#ifdef SUPPORT_CODEC_EAC3
            AUDIO_DECODER_EAC3_NAME,
#endif
#ifdef SUPPORT_CODEC_OPUS
            AUDIO_DECODER_OPUS_NAME,
            AUDIO_ENCODER_OPUS_NAME,
#endif
#ifdef AV_CODEC_AUDIO_SPECIAL_CAPACITY
            AUDIO_ENCODER_VENDOR_AAC_NAME,
            AUDIO_DECODER_VIVID_NAME,
            AUDIO_ENCODER_AMRNB_NAME,
            AUDIO_ENCODER_AMRWB_NAME,
#endif
        };
        return OUTER_SUPPORT_TABLE;
    }

private:
    AVCodecCodecName() = delete;
    ~AVCodecCodecName() = delete;
};
} // namespace MediaAVCodec
} // namespace OHOS
#endif // MEDIA_AVCODEC_CODEC_KEY_H
