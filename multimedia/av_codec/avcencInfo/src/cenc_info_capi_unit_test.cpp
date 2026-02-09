/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include "cenc_info_capi_unit_test.h"
#include "avcodec_errors.h"
#include "avcodec_log.h"
#include "meta/meta.h"
#include "common/native_mfmagic.h"
#include "native_cencinfo.h"

using namespace testing::ext;
using namespace std;
using namespace OHOS::MediaAVCodec;
using namespace OHOS::Media;

namespace OHOS {
namespace CencInfoUT {

void CencInfoCapiUnitTest::SetUpTestCase(void) {}

void CencInfoCapiUnitTest::TearDownTestCase(void) {}

void CencInfoCapiUnitTest::SetUp() {}

void CencInfoCapiUnitTest::TearDown() {}

/**
 * @tc.name   CencInfo_Create_001
 * @tc.number CencInfo_Create_001
 * @tc.desc   Create a cencInfo object
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(CencInfoCapiUnitTest, CencInfo_Create_001, TestSize.Level0)
{
    OH_AVCencInfo *cencInfo = OH_AVCencInfo_Create();
    EXPECT_NE(cencInfo, nullptr);
}

/**
 * @tc.name   CencInfo_Destroy_001
 * @tc.number CencInfo_Destroy_001
 * @tc.desc   Destroy a cencInfo object
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(CencInfoCapiUnitTest, CencInfo_Destroy_001, TestSize.Level0)
{
    OH_AVErrCode errNo = AV_ERR_OK;
    OH_AVCencInfo *cencInfo = OH_AVCencInfo_Create();
    EXPECT_NE(cencInfo, nullptr);
    errNo = OH_AVCencInfo_Destroy(cencInfo);
    EXPECT_EQ(errNo, AV_ERR_OK);
}

/**
 * @tc.name   CencInfo_Destroy_002
 * @tc.number CencInfo_Destroy_002
 * @tc.desc   Destroy a cencInfo null object
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(CencInfoCapiUnitTest, CencInfo_Destroy_002, TestSize.Level0)
{
    OH_AVErrCode errNo = AV_ERR_OK;
    errNo = OH_AVCencInfo_Destroy(nullptr);
    EXPECT_NE(errNo, AV_ERR_OK);
}

/**
 * @tc.name   CencInfo_SetAlgorithm_001
 * @tc.number CencInfo_SetAlgorithm_001
 * @tc.desc   Set Algorithm
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(CencInfoCapiUnitTest, CencInfo_SetAlgorithm_001, TestSize.Level0)
{
    OH_AVErrCode errNo = AV_ERR_OK;
    OH_AVCencInfo *cencInfo = OH_AVCencInfo_Create();
    EXPECT_NE(cencInfo, nullptr);

    errNo = OH_AVCencInfo_SetAlgorithm(cencInfo, DRM_ALG_CENC_UNENCRYPTED);
    EXPECT_EQ(errNo, AV_ERR_OK);

    errNo = OH_AVCencInfo_SetAlgorithm(cencInfo, DRM_ALG_CENC_AES_CTR);
    EXPECT_EQ(errNo, AV_ERR_OK);

    errNo = OH_AVCencInfo_SetAlgorithm(cencInfo, DRM_ALG_CENC_AES_WV);
    EXPECT_EQ(errNo, AV_ERR_OK);

    errNo = OH_AVCencInfo_SetAlgorithm(cencInfo, DRM_ALG_CENC_AES_CBC);
    EXPECT_EQ(errNo, AV_ERR_OK);

    errNo = OH_AVCencInfo_SetAlgorithm(cencInfo, DRM_ALG_CENC_SM4_CBC);
    EXPECT_EQ(errNo, AV_ERR_OK);

    errNo = OH_AVCencInfo_SetAlgorithm(cencInfo, DRM_ALG_CENC_SM4_CTR);
    EXPECT_EQ(errNo, AV_ERR_OK);

    errNo = OH_AVCencInfo_SetAlgorithm(cencInfo, static_cast<enum DrmCencAlgorithm>(DRM_ALG_CENC_SM4_CTR + 1));
    EXPECT_EQ(errNo, AV_ERR_OK);

    errNo = OH_AVCencInfo_Destroy(cencInfo);
    EXPECT_EQ(errNo, AV_ERR_OK);
}

/**
 * @tc.name   CencInfo_SetAlgorithm_002
 * @tc.number CencInfo_SetAlgorithm_002
 * @tc.desc   Set cencInfo null object
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(CencInfoCapiUnitTest, CencInfo_SetAlgorithm_002, TestSize.Level0)
{
    OH_AVErrCode errNo = AV_ERR_OK;
    errNo = OH_AVCencInfo_SetAlgorithm(nullptr, DRM_ALG_CENC_SM4_CTR);
    EXPECT_NE(errNo, AV_ERR_OK);
}

/**
 * @tc.name   CencInfo_SetKeyIdAndIv_001
 * @tc.number CencInfo_SetKeyIdAndIv_001
 * @tc.desc   Set keyId and iv
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(CencInfoCapiUnitTest, CencInfo_SetKeyIdAndIv_001, TestSize.Level0)
{
    OH_AVErrCode errNo = AV_ERR_OK;
    uint32_t keyIdLen = DRM_KEY_ID_SIZE;
    uint8_t keyId[] = {
        0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
        0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01};
    uint32_t ivLen = DRM_KEY_IV_SIZE;
    uint8_t iv[] = {
        0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
        0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01};

    OH_AVCencInfo *cencInfo = OH_AVCencInfo_Create();
    EXPECT_NE(cencInfo, nullptr);
    errNo = OH_AVCencInfo_SetKeyIdAndIv(cencInfo, keyId, keyIdLen, iv, ivLen);
    EXPECT_EQ(errNo, AV_ERR_OK);
    errNo = OH_AVCencInfo_Destroy(cencInfo);
    EXPECT_EQ(errNo, AV_ERR_OK);
}

/**
 * @tc.name   CencInfo_SetKeyIdAndIv_002
 * @tc.number CencInfo_SetKeyIdAndIv_002
 * @tc.desc   Set cencInfo null object
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(CencInfoCapiUnitTest, CencInfo_SetKeyIdAndIv_002, TestSize.Level0)
{
    OH_AVErrCode errNo = AV_ERR_OK;
    uint32_t keyIdLen = DRM_KEY_ID_SIZE;
    uint8_t keyId[] = {
        0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
        0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01};
    uint32_t ivLen = DRM_KEY_IV_SIZE;
    uint8_t iv[] = {
        0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
        0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01};
    errNo = OH_AVCencInfo_SetKeyIdAndIv(nullptr, keyId, keyIdLen, iv, ivLen);
    EXPECT_NE(errNo, AV_ERR_OK);
}

/**
 * @tc.name   CencInfo_SetKeyIdAndIv_003
 * @tc.number CencInfo_SetKeyIdAndIv_003
 * @tc.desc   Set the null keyId
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(CencInfoCapiUnitTest, CencInfo_SetKeyIdAndIv_003, TestSize.Level0)
{
    OH_AVErrCode errNo = AV_ERR_OK;
    uint32_t keyIdLen = DRM_KEY_ID_SIZE;
    uint32_t ivLen = DRM_KEY_IV_SIZE;
    uint8_t iv[] = {
        0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
        0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01};

    OH_AVCencInfo *cencInfo = OH_AVCencInfo_Create();
    EXPECT_NE(cencInfo, nullptr);
    errNo = OH_AVCencInfo_SetKeyIdAndIv(cencInfo, nullptr, keyIdLen, iv, ivLen);
    EXPECT_NE(errNo, AV_ERR_OK);
    errNo = OH_AVCencInfo_Destroy(cencInfo);
    EXPECT_EQ(errNo, AV_ERR_OK);
}

/**
 * @tc.name   CencInfo_SetKeyIdAndIv_004
 * @tc.number CencInfo_SetKeyIdAndIv_004
 * @tc.desc   Set an invalid keyIdLen
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(CencInfoCapiUnitTest, CencInfo_SetKeyIdAndIv_004, TestSize.Level0)
{
    OH_AVErrCode errNo = AV_ERR_OK;
    uint32_t keyIdLen = DRM_KEY_ID_SIZE;
    uint8_t keyId[] = {
        0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
        0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01};
    uint32_t ivLen = DRM_KEY_IV_SIZE;
    uint8_t iv[] = {
        0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
        0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01};

    OH_AVCencInfo *cencInfo = OH_AVCencInfo_Create();
    EXPECT_NE(cencInfo, nullptr);
    errNo = OH_AVCencInfo_SetKeyIdAndIv(cencInfo, keyId, keyIdLen + 1, iv, ivLen);
    EXPECT_NE(errNo, AV_ERR_OK);
    errNo = OH_AVCencInfo_Destroy(cencInfo);
    EXPECT_EQ(errNo, AV_ERR_OK);
}

/**
 * @tc.name   CencInfo_SetKeyIdAndIv_005
 * @tc.number CencInfo_SetKeyIdAndIv_005
 * @tc.desc   Set the null iv
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(CencInfoCapiUnitTest, CencInfo_SetKeyIdAndIv_005, TestSize.Level0)
{
    OH_AVErrCode errNo = AV_ERR_OK;
    uint32_t keyIdLen = DRM_KEY_ID_SIZE;
    uint8_t keyId[] = {
        0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
        0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01};
    uint32_t ivLen = DRM_KEY_IV_SIZE;

    OH_AVCencInfo *cencInfo = OH_AVCencInfo_Create();
    EXPECT_NE(cencInfo, nullptr);
    errNo = OH_AVCencInfo_SetKeyIdAndIv(cencInfo, keyId, keyIdLen, nullptr, ivLen);
    EXPECT_NE(errNo, AV_ERR_OK);
    errNo = OH_AVCencInfo_Destroy(cencInfo);
    EXPECT_EQ(errNo, AV_ERR_OK);
}

/**
 * @tc.name   CencInfo_SetKeyIdAndIv_006
 * @tc.number CencInfo_SetKeyIdAndIv_006
 * @tc.desc   Set an invalid ivLen
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(CencInfoCapiUnitTest, CencInfo_SetKeyIdAndIv_006, TestSize.Level0)
{
    OH_AVErrCode errNo = AV_ERR_OK;
    uint32_t keyIdLen = DRM_KEY_ID_SIZE;
    uint8_t keyId[] = {
        0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
        0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01};
    uint32_t ivLen = DRM_KEY_IV_SIZE;
    uint8_t iv[] = {
        0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
        0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01};

    OH_AVCencInfo *cencInfo = OH_AVCencInfo_Create();
    EXPECT_NE(cencInfo, nullptr);
    errNo = OH_AVCencInfo_SetKeyIdAndIv(cencInfo, keyId, keyIdLen, iv, ivLen + 1);
    EXPECT_NE(errNo, AV_ERR_OK);
    errNo = OH_AVCencInfo_Destroy(cencInfo);
    EXPECT_EQ(errNo, AV_ERR_OK);
}

/**
 * @tc.name   CencInfo_SetSubsampleInfo_001
 * @tc.number CencInfo_SetSubsampleInfo_001
 * @tc.desc   Set subsample info
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(CencInfoCapiUnitTest, CencInfo_SetSubsampleInfo_001, TestSize.Level0)
{
    OH_AVErrCode errNo = AV_ERR_OK;
    uint32_t encryptedBlockCount = 0;
    uint32_t skippedBlockCount = 0;
    uint32_t firstEncryptedOffset = 0;
    uint32_t subsampleCount = 1;
    DrmSubsample subsamples[1] = { {0x10, 0x16} };

    OH_AVCencInfo *cencInfo = OH_AVCencInfo_Create();
    EXPECT_NE(cencInfo, nullptr);
    errNo = OH_AVCencInfo_SetSubsampleInfo(cencInfo, encryptedBlockCount, skippedBlockCount, firstEncryptedOffset,
        subsampleCount, subsamples);
    EXPECT_EQ(errNo, AV_ERR_OK);
    errNo = OH_AVCencInfo_Destroy(cencInfo);
    EXPECT_EQ(errNo, AV_ERR_OK);
}

/**
 * @tc.name   CencInfo_SetSubsampleInfo_002
 * @tc.number CencInfo_SetSubsampleInfo_002
 * @tc.desc   Set cencInfo null object
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(CencInfoCapiUnitTest, CencInfo_SetSubsampleInfo_002, TestSize.Level0)
{
    OH_AVErrCode errNo = AV_ERR_OK;
    uint32_t encryptedBlockCount = 0;
    uint32_t skippedBlockCount = 0;
    uint32_t firstEncryptedOffset = 0;
    uint32_t subsampleCount = 1;
    DrmSubsample subsamples[1] = { {0x10, 0x16} };

    errNo = OH_AVCencInfo_SetSubsampleInfo(nullptr, encryptedBlockCount, skippedBlockCount, firstEncryptedOffset,
        subsampleCount, subsamples);
    EXPECT_NE(errNo, AV_ERR_OK);
}

/**
 * @tc.name   CencInfo_SetSubsampleInfo_003
 * @tc.number CencInfo_SetSubsampleInfo_003
 * @tc.desc   Set an invalid subsampleCount
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(CencInfoCapiUnitTest, CencInfo_SetSubsampleInfo_003, TestSize.Level0)
{
    OH_AVErrCode errNo = AV_ERR_OK;
    uint32_t encryptedBlockCount = 0;
    uint32_t skippedBlockCount = 0;
    uint32_t firstEncryptedOffset = 0;
    uint32_t subsampleCount = DRM_KEY_MAX_SUB_SAMPLE_NUM;
    DrmSubsample subsamples[1] = { {0x10, 0x16} };

    OH_AVCencInfo *cencInfo = OH_AVCencInfo_Create();
    EXPECT_NE(cencInfo, nullptr);
    errNo = OH_AVCencInfo_SetSubsampleInfo(cencInfo, encryptedBlockCount, skippedBlockCount, firstEncryptedOffset,
        subsampleCount + 1, subsamples);
    EXPECT_NE(errNo, AV_ERR_OK);
    errNo = OH_AVCencInfo_Destroy(cencInfo);
    EXPECT_EQ(errNo, AV_ERR_OK);
}

/**
 * @tc.name   CencInfo_SetSubsampleInfo_004
 * @tc.number CencInfo_SetSubsampleInfo_004
 * @tc.desc   Set the null subsamples
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(CencInfoCapiUnitTest, CencInfo_SetSubsampleInfo_004, TestSize.Level0)
{
    OH_AVErrCode errNo = AV_ERR_OK;
    uint32_t encryptedBlockCount = 0;
    uint32_t skippedBlockCount = 0;
    uint32_t firstEncryptedOffset = 0;
    uint32_t subsampleCount = 1;

    OH_AVCencInfo *cencInfo = OH_AVCencInfo_Create();
    EXPECT_NE(cencInfo, nullptr);
    errNo = OH_AVCencInfo_SetSubsampleInfo(cencInfo, encryptedBlockCount, skippedBlockCount, firstEncryptedOffset,
        subsampleCount, nullptr);
    EXPECT_NE(errNo, AV_ERR_OK);
    errNo = OH_AVCencInfo_Destroy(cencInfo);
    EXPECT_EQ(errNo, AV_ERR_OK);
}

/**
 * @tc.name   CencInfo_SetMode_001
 * @tc.number CencInfo_SetMode_001
 * @tc.desc   Set mode
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(CencInfoCapiUnitTest, CencInfo_SetMode_001, TestSize.Level0)
{
    OH_AVErrCode errNo = AV_ERR_OK;

    OH_AVCencInfo *cencInfo = OH_AVCencInfo_Create();
    EXPECT_NE(cencInfo, nullptr);

    errNo = OH_AVCencInfo_SetMode(cencInfo, DRM_CENC_INFO_KEY_IV_SUBSAMPLES_SET);
    EXPECT_EQ(errNo, AV_ERR_OK);

    errNo = OH_AVCencInfo_SetMode(cencInfo, DRM_CENC_INFO_KEY_IV_SUBSAMPLES_NOT_SET);
    EXPECT_EQ(errNo, AV_ERR_OK);

    errNo = OH_AVCencInfo_SetMode(cencInfo,
        static_cast<enum DrmCencInfoMode>(DRM_CENC_INFO_KEY_IV_SUBSAMPLES_NOT_SET + 1));
    EXPECT_EQ(errNo, AV_ERR_OK);

    errNo = OH_AVCencInfo_Destroy(cencInfo);
    EXPECT_EQ(errNo, AV_ERR_OK);
}

/**
 * @tc.name   CencInfo_SetMode_002
 * @tc.number CencInfo_SetMode_002
 * @tc.desc   Set cencInfo null object
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(CencInfoCapiUnitTest, CencInfo_SetMode_002, TestSize.Level0)
{
    OH_AVErrCode errNo = AV_ERR_OK;

    errNo = OH_AVCencInfo_SetMode(nullptr, DRM_CENC_INFO_KEY_IV_SUBSAMPLES_SET);
    EXPECT_NE(errNo, AV_ERR_OK);
}

/**
 * @tc.name   CencInfo_SetAVBuffer_001
 * @tc.number CencInfo_SetAVBuffer_001
 * @tc.desc   Set avBuffer
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(CencInfoCapiUnitTest, CencInfo_SetAVBuffer_001, TestSize.Level0)
{
    uint32_t keyIdLen = DRM_KEY_ID_SIZE;
    uint8_t keyId[] = {
        0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
        0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01};
    uint32_t ivLen = DRM_KEY_IV_SIZE;
    uint8_t iv[] = {
        0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
        0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01};
    uint32_t encryptedBlockCount = 0;
    uint32_t skippedBlockCount = 0;
    uint32_t firstEncryptedOffset = 0;
    uint32_t subsampleCount = 1;
    DrmSubsample subsamples[1] = { {0x10, 0x16} };
    OH_AVErrCode errNo = AV_ERR_OK;
    MemoryFlag memFlag = MEMORY_READ_WRITE;

    std::shared_ptr<AVAllocator> avAllocator = AVAllocatorFactory::CreateSharedAllocator(memFlag);
    EXPECT_NE(avAllocator, nullptr);

    std::shared_ptr<AVBuffer> inBuf = AVBuffer::CreateAVBuffer(avAllocator, static_cast<int32_t>(DRM_KEY_ID_SIZE));
    EXPECT_NE(inBuf, nullptr);
    EXPECT_NE(inBuf->memory_, nullptr);
    EXPECT_EQ(inBuf->memory_->GetCapacity(), DRM_KEY_ID_SIZE);

    struct OH_AVBuffer *buffer = new (std::nothrow) OH_AVBuffer(inBuf);
    EXPECT_NE(buffer, nullptr);

    OH_AVCencInfo *cencInfo = OH_AVCencInfo_Create();
    EXPECT_NE(cencInfo, nullptr);

    errNo = OH_AVCencInfo_SetAlgorithm(cencInfo, DRM_ALG_CENC_AES_CTR);
    EXPECT_EQ(errNo, AV_ERR_OK);

    errNo = OH_AVCencInfo_SetKeyIdAndIv(cencInfo, keyId, keyIdLen, iv, ivLen);
    EXPECT_EQ(errNo, AV_ERR_OK);

    errNo = OH_AVCencInfo_SetSubsampleInfo(cencInfo, encryptedBlockCount, skippedBlockCount, firstEncryptedOffset,
        subsampleCount, subsamples);
    EXPECT_EQ(errNo, AV_ERR_OK);

    errNo = OH_AVCencInfo_SetMode(cencInfo, DRM_CENC_INFO_KEY_IV_SUBSAMPLES_SET);
    EXPECT_EQ(errNo, AV_ERR_OK);

    errNo = OH_AVCencInfo_SetAVBuffer(cencInfo, buffer);
    EXPECT_EQ(errNo, AV_ERR_OK);

    errNo = OH_AVCencInfo_Destroy(cencInfo);
    EXPECT_EQ(errNo, AV_ERR_OK);
    delete buffer;
}

/**
 * @tc.name   CencInfo_SetAVBuffer_002
 * @tc.number CencInfo_SetAVBuffer_002
 * @tc.desc   Set cencInfo null object
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(CencInfoCapiUnitTest, CencInfo_SetAVBuffer_002, TestSize.Level0)
{
    OH_AVErrCode errNo = AV_ERR_OK;
    MemoryFlag memFlag = MEMORY_READ_WRITE;

    std::shared_ptr<AVAllocator> avAllocator = AVAllocatorFactory::CreateSharedAllocator(memFlag);
    EXPECT_NE(avAllocator, nullptr);

    std::shared_ptr<AVBuffer> inBuf = AVBuffer::CreateAVBuffer(avAllocator, static_cast<int32_t>(DRM_KEY_ID_SIZE));
    EXPECT_NE(inBuf, nullptr);
    EXPECT_NE(inBuf->memory_, nullptr);
    EXPECT_EQ(inBuf->memory_->GetCapacity(), DRM_KEY_ID_SIZE);

    struct OH_AVBuffer *buffer = new (std::nothrow) OH_AVBuffer(inBuf);
    EXPECT_NE(buffer, nullptr);

    errNo = OH_AVCencInfo_SetAVBuffer(nullptr, buffer);
    EXPECT_NE(errNo, AV_ERR_OK);

    delete buffer;
}

/**
 * @tc.name   CencInfo_SetAVBuffer_003
 * @tc.number CencInfo_SetAVBuffer_003
 * @tc.desc   Set buffer null
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(CencInfoCapiUnitTest, CencInfo_SetAVBuffer_003, TestSize.Level0)
{
    OH_AVErrCode errNo = AV_ERR_OK;
    OH_AVCencInfo *cencInfo = OH_AVCencInfo_Create();
    EXPECT_NE(cencInfo, nullptr);

    errNo = OH_AVCencInfo_SetAVBuffer(cencInfo, nullptr);
    EXPECT_NE(errNo, AV_ERR_OK);

    errNo = OH_AVCencInfo_Destroy(cencInfo);
    EXPECT_EQ(errNo, AV_ERR_OK);
}

} // CencInfoUT
} // OHOS