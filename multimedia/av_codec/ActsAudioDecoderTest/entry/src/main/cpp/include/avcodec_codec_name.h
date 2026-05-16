/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
#include <string_view>
#include <unordered_set>

namespace OHOS {
namespace MediaAVCodec {
namespace AVCodecCodecName {
inline constexpr const char* AUDIO_DECODER_MP3_NAME = "OH.Media.Codec.Decoder.Audio.Mpeg";
inline constexpr const char* AUDIO_DECODER_AAC_NAME = "OH.Media.Codec.Decoder.Audio.AAC";
inline constexpr const char* AUDIO_DECODER_OPUS_NAME = "OH.Media.Codec.Decoder.Audio.Opus";
inline constexpr const char* AUDIO_DECODER_API9_AAC_NAME = "avdec_aac";
inline constexpr const char* AUDIO_DECODER_VORBIS_NAME = "OH.Media.Codec.Decoder.Audio.Vorbis";
inline constexpr const char* AUDIO_DECODER_FLAC_NAME = "OH.Media.Codec.Decoder.Audio.Flac";
inline constexpr const char* AUDIO_DECODER_AMRNB_NAME = "OH.Media.Codec.Decoder.Audio.Amrnb";
inline constexpr const char* AUDIO_DECODER_AMRWB_NAME = "OH.Media.Codec.Decoder.Audio.Amrwb";
inline constexpr const char* AUDIO_DECODER_VIVID_NAME = "OH.Media.Codec.Decoder.Audio.Vivid";
inline constexpr const char* AUDIO_DECODER_G711MU_NAME = "OH.Media.Codec.Decoder.Audio.G711mu";
inline constexpr const char* AUDIO_DECODER_G711A_NAME = "OH.Media.Codec.Decoder.Audio.G711a";
inline constexpr const char* AUDIO_DECODER_GSM_MS_NAME = "OH.Media.Codec.Decoder.Audio.GSM_MS";
inline constexpr const char* AUDIO_DECODER_GSM_NAME = "OH.Media.Codec.Decoder.Audio.GSM";
inline constexpr const char* AUDIO_DECODER_APE_NAME = "OH.Media.Codec.Decoder.Audio.Ape";
inline constexpr const char* AUDIO_DECODER_L2HC_NAME = "OH.Media.Codec.Decoder.Audio.L2HC";
inline constexpr const char* AUDIO_DECODER_LBVC_NAME = "OH.Media.Codec.Decoder.Audio.LBVC";
inline constexpr const char* AUDIO_DECODER_COOK_NAME = "OH.Media.Codec.Decoder.Audio.COOK";
inline constexpr const char* AUDIO_DECODER_AC3_NAME = "OH.Media.Codec.Decoder.Audio.AC3";
inline constexpr const char* AUDIO_DECODER_EAC3_NAME = "OH.Media.Codec.Decoder.Audio.EAC3";
inline constexpr const char* AUDIO_DECODER_ALAC_NAME = "OH.Media.Codec.Decoder.Audio.ALAC";
inline constexpr const char* AUDIO_DECODER_RAW_NAME = "OH.Media.Codec.Decoder.Audio.Raw";
inline constexpr const char* AUDIO_DECODER_WMAV1_NAME = "OH.Media.Codec.Decoder.Audio.WMAv1";
inline constexpr const char* AUDIO_DECODER_WMAV2_NAME = "OH.Media.Codec.Decoder.Audio.WMAv2";
inline constexpr const char* AUDIO_DECODER_WMAPRO_NAME = "OH.Media.Codec.Decoder.Audio.WMAPro";
inline constexpr const char* AUDIO_DECODER_ADPCM_MS_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.MS";
inline constexpr const char* AUDIO_DECODER_ADPCM_IMA_QT_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.IMA.QT";
inline constexpr const char* AUDIO_DECODER_ADPCM_IMA_WAV_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.IMA.WAV";
inline constexpr const char* AUDIO_DECODER_ADPCM_IMA_DK3_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.IMA.DK3";
inline constexpr const char* AUDIO_DECODER_ADPCM_IMA_DK4_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.IMA.DK4";
inline constexpr const char* AUDIO_DECODER_ADPCM_IMA_WS_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.IMA.WS";
inline constexpr const char* AUDIO_DECODER_ADPCM_IMA_SMJPEG_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.IMA.SMJPEG";
inline constexpr const char* AUDIO_DECODER_ADPCM_IMA_DAT4_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.IMA.DAT4";
inline constexpr const char* AUDIO_DECODER_ADPCM_MTAF_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.MTAF";
inline constexpr const char* AUDIO_DECODER_ADPCM_ADX_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.ADX";
inline constexpr const char* AUDIO_DECODER_ADPCM_AFC_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.AFC";
inline constexpr const char* AUDIO_DECODER_ADPCM_AICA_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.AICA";
inline constexpr const char* AUDIO_DECODER_ADPCM_CT_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.CT";
inline constexpr const char* AUDIO_DECODER_ADPCM_DTK_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.DTK";
inline constexpr const char* AUDIO_DECODER_ADPCM_G722_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.G722";
inline constexpr const char* AUDIO_DECODER_ADPCM_G726_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.G726";
inline constexpr const char* AUDIO_DECODER_ADPCM_G726LE_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.G726LE";
inline constexpr const char* AUDIO_DECODER_ADPCM_IMA_AMV_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.IMA.AMV";
inline constexpr const char* AUDIO_DECODER_ADPCM_IMA_APC_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.IMA.APC";
inline constexpr const char* AUDIO_DECODER_ADPCM_IMA_ISS_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.IMA.ISS";
inline constexpr const char* AUDIO_DECODER_ADPCM_IMA_OKI_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.IMA.OKI";
inline constexpr const char* AUDIO_DECODER_ADPCM_IMA_RAD_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.IMA.RAD";
inline constexpr const char* AUDIO_DECODER_ADPCM_PSX_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.PSX";
inline constexpr const char* AUDIO_DECODER_ADPCM_SBPRO_2_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.SBPRO2";
inline constexpr const char* AUDIO_DECODER_ADPCM_SBPRO_3_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.SBPRO3";
inline constexpr const char* AUDIO_DECODER_ADPCM_SBPRO_4_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.SBPRO4";
inline constexpr const char* AUDIO_DECODER_ADPCM_THP_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.THP";
inline constexpr const char* AUDIO_DECODER_ADPCM_THP_LE_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.THP.LE";
inline constexpr const char* AUDIO_DECODER_ADPCM_XA_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.XA";
inline constexpr const char* AUDIO_DECODER_ADPCM_YAMAHA_NAME = "OH.Media.Codec.Decoder.Audio.ADPCM.YAMAHA";
inline constexpr const char* AUDIO_DECODER_ILBC_NAME = "OH.Media.Codec.Decoder.Audio.ILBC";
inline constexpr const char* AUDIO_DECODER_TRUEHD_NAME = "OH.Media.Codec.Decoder.Audio.TrueHD";
inline constexpr const char* AUDIO_DECODER_TWINVQ_NAME = "OH.Media.Codec.Decoder.Audio.TwinVQ";
inline constexpr const char* AUDIO_ENCODER_FLAC_NAME = "OH.Media.Codec.Encoder.Audio.Flac";
inline constexpr const char* AUDIO_ENCODER_OPUS_NAME = "OH.Media.Codec.Encoder.Audio.Opus";
inline constexpr const char* AUDIO_ENCODER_G711MU_NAME = "OH.Media.Codec.Encoder.Audio.G711mu";
inline constexpr const char* AUDIO_ENCODER_AAC_NAME = "OH.Media.Codec.Encoder.Audio.AAC";
inline constexpr const char* AUDIO_ENCODER_VENDOR_AAC_NAME = "OH.Media.Codec.Encoder.Audio.Vendor.AAC";
inline constexpr const char* AUDIO_ENCODER_L2HC_NAME = "OH.Media.Codec.Encoder.Audio.L2HC";
inline constexpr const char* AUDIO_ENCODER_LBVC_NAME = "OH.Media.Codec.Encoder.Audio.LBVC";
inline constexpr const char* AUDIO_ENCODER_AMRNB_NAME = "OH.Media.Codec.Encoder.Audio.Amrnb";
inline constexpr const char* AUDIO_ENCODER_AMRWB_NAME = "OH.Media.Codec.Encoder.Audio.Amrwb";
inline constexpr const char* AUDIO_ENCODER_API9_AAC_NAME = "avenc_aac";
inline constexpr const char* AUDIO_ENCODER_MP3_NAME = "OH.Media.Codec.Encoder.Audio.Mp3";

inline constexpr const char* VIDEO_DECODER_AVS_NAME = "OH.Media.Codec.Decoder.Video.AVS";
inline constexpr const char* VIDEO_DECODER_MSVIDEO1_NAME = "OH.Media.Codec.Decoder.Video.MSVIDEO1";
inline constexpr const char* VIDEO_DECODER_VC1_NAME = "OH.Media.Codec.Decoder.Video.VC1";
inline constexpr const char* VIDEO_DECODER_WVC1_NAME = "OH.Media.Codec.Decoder.Video.WVC1";
inline constexpr const char* VIDEO_ENCODER_AVC_NAME = "OH.Media.Codec.Encoder.Video.AVC";
inline constexpr const char* VIDEO_DECODER_AVC_NAME = "OH.Media.Codec.Decoder.Video.AVC";
inline constexpr const char* VIDEO_DECODER_HEVC_NAME = "OH.Media.Codec.Decoder.Video.HEVC";
inline constexpr const char* VIDEO_DECODER_VP8_NAME = "OH.Media.Codec.Decoder.Video.VP8";
inline constexpr const char* VIDEO_DECODER_VP9_NAME = "OH.Media.Codec.Decoder.Video.VP9";
inline constexpr const char* VIDEO_DECODER_AV1_NAME = "OH.Media.Codec.Decoder.Video.AV1";
inline constexpr const char* VIDEO_DECODER_MPEG2_NAME = "OH.Media.Codec.Decoder.Video.MPEG2";
inline constexpr const char* VIDEO_DECODER_MPEG4_NAME = "OH.Media.Codec.Decoder.Video.MPEG4";
inline constexpr const char* VIDEO_DECODER_H263_NAME = "OH.Media.Codec.Decoder.Video.H263";
inline constexpr const char* VIDEO_DECODER_VVC_NAME = "OH.Media.Codec.Decoder.Video.VVC";
inline constexpr const char* VIDEO_DECODER_RV30_NAME = "OH.Media.Codec.Decoder.Video.Rv30";
inline constexpr const char* VIDEO_DECODER_RV40_NAME = "OH.Media.Codec.Decoder.Video.Rv40";
inline constexpr const char* VIDEO_DECODER_MJPEG_NAME = "OH.Media.Codec.Decoder.Video.MJPEG";
inline constexpr const char* VIDEO_DECODER_WMV3_NAME = "OH.Media.Codec.Decoder.Video.WMV3";
}; // namespace AVCodecCodecName
} // namespace MediaAVCodec
} // namespace OHOS
#endif // MEDIA_AVCODEC_CODEC_KEY_H
