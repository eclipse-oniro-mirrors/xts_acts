/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "huks_three_stage_test_common.h"

static struct OH_Huks_Param g_genParamsTest001[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_DSA},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = 1024},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}};

OH_Huks_Result InitParamSet(struct OH_Huks_ParamSet **paramSet, const struct OH_Huks_Param *params, uint32_t paramcount)
{
    OH_Huks_Result ret = OH_Huks_InitParamSet(paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = OH_Huks_AddParams(*paramSet, params, paramcount);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(paramSet);
        return ret;
    }

    ret = OH_Huks_BuildParamSet(paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(paramSet);
        return ret;
    }

    return ret;
}

static OH_Huks_Result TestLessThanMaxSeg(const struct OH_Huks_Blob *handle, const struct OH_Huks_ParamSet *paramSet,
                                         uint32_t purpose, const struct OH_Huks_Blob *inData,
                                         struct OH_Huks_Blob *outData)
{
    struct OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;
    struct OH_Huks_Blob tmpOutData = {.size = MAX_OUTDATA_SIZE, .data = NULL};
    if (MallocAndCheckBlobData(&tmpOutData, tmpOutData.size).errorCode != (int32_t)OH_HUKS_SUCCESS) {
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }
    ret = OH_Huks_UpdateSession(handle, paramSet, inData, &tmpOutData);
    HksFree(tmpOutData.data);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }
    struct OH_Huks_Blob tmpInData = {.size = 0, .data = NULL};
    if (MallocAndCheckBlobData(&tmpInData, MAX_UPDATE_SIZE).errorCode != (int32_t)OH_HUKS_SUCCESS) {
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }

    if (purpose == OH_HUKS_KEY_PURPOSE_VERIFY) {
        ret = OH_Huks_FinishSession(handle, paramSet, outData, &tmpInData);
    } else {
        ret = OH_Huks_FinishSession(handle, paramSet, &tmpInData, outData);
    }
    HksFree(tmpInData.data);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }
    return ret;
}

OH_Huks_Result HksTestUpdate(const struct OH_Huks_Blob *handle, const struct OH_Huks_ParamSet *paramSet,
                             const struct OH_Huks_Blob *inData)
{
    struct OH_Huks_Blob inDataSeg = *inData;
    inDataSeg.size = MAX_UPDATE_SIZE;

    struct OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;

    uint8_t *lastPtr = inData->data + inData->size - 1;
    struct OH_Huks_Blob outDataSeg = {.size = MAX_OUTDATA_SIZE, .data = NULL};

    bool isFinished = false;

    while (inDataSeg.data <= lastPtr) {
        if (inDataSeg.data + MAX_UPDATE_SIZE <= lastPtr) {
            outDataSeg.size = MAX_OUTDATA_SIZE;
        } else {
            isFinished = true;
            inDataSeg.size = lastPtr - inDataSeg.data + 1;
            outDataSeg.size = inDataSeg.size + MAX_UPDATE_SIZE;
        }
        if (MallocAndCheckBlobData(&outDataSeg, outDataSeg.size).errorCode != (int32_t)OH_HUKS_SUCCESS) {
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }
        if (OH_Huks_UpdateSession(handle, paramSet, &inDataSeg, &outDataSeg).errorCode != (int32_t)OH_HUKS_SUCCESS) {
            HksFree(outDataSeg.data);
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }
        HksFree(outDataSeg.data);
        if ((isFinished == false) && (inDataSeg.data + MAX_UPDATE_SIZE > lastPtr)) {
            return ret;
        }
        inDataSeg.data += MAX_UPDATE_SIZE;
    }
    return ret;
}

OH_Huks_Result TestUpdateLoopFinish(const struct OH_Huks_Blob *handle, const struct OH_Huks_ParamSet *paramSet,
                                    const struct OH_Huks_Blob *inData, struct OH_Huks_Blob *outData)
{
    struct OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;

    struct OH_Huks_Blob inDataSeg = *inData;
    uint8_t *lastPtr = inData->data + inData->size - 1;
    struct OH_Huks_Blob outDataSeg = {MAX_OUTDATA_SIZE, NULL};
    uint8_t *cur = outData->data;
    outData->size = 0;

    inDataSeg.size = MAX_UPDATE_SIZE;

    bool isFinished = false;

    while (inDataSeg.data <= lastPtr) {
        if (inDataSeg.data + MAX_UPDATE_SIZE <= lastPtr) {
            outDataSeg.size = MAX_OUTDATA_SIZE;
        } else {
            isFinished = true;
            inDataSeg.size = lastPtr - inDataSeg.data + 1;
            break;
        }
        if (MallocAndCheckBlobData(&outDataSeg, outDataSeg.size).errorCode != (int32_t)OH_HUKS_SUCCESS) {
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }
        if (OH_Huks_UpdateSession(handle, paramSet, &inDataSeg, &outDataSeg).errorCode != (int32_t)OH_HUKS_SUCCESS) {
            HksFree(outDataSeg.data);
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }
        (void)memcpy_s(cur, outDataSeg.size, outDataSeg.data, outDataSeg.size);
        cur += outDataSeg.size;
        outData->size += outDataSeg.size;
        HksFree(outDataSeg.data);
        if ((isFinished == false) && (inDataSeg.data + MAX_UPDATE_SIZE > lastPtr)) {
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }
        inDataSeg.data += MAX_UPDATE_SIZE;
    }

    struct OH_Huks_Blob outDataFinish = {inDataSeg.size * TIMES, NULL};
    if (MallocAndCheckBlobData(&outDataFinish, outDataFinish.size).errorCode != (int32_t)OH_HUKS_SUCCESS) {
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }
    if (OH_Huks_FinishSession(handle, paramSet, &inDataSeg, &outDataFinish).errorCode != (int32_t)OH_HUKS_SUCCESS) {
        HksFree(outDataFinish.data);
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }
    (void)memcpy_s(cur, outDataFinish.size, outDataFinish.data, outDataFinish.size);
    outData->size += outDataFinish.size;
    HksFree(outDataFinish.data);

    return ret;
}

OH_Huks_Result TestUpdateFinish(const struct OH_Huks_Blob *handle, const struct OH_Huks_ParamSet *paramSet,
                                uint32_t purpose, const struct OH_Huks_Blob *inData, struct OH_Huks_Blob *outData)
{
    struct OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;

    struct OH_Huks_Blob inDataSeg = *inData;
    inDataSeg.size = MAX_UPDATE_SIZE;

    uint8_t *lastPtr = inData->data + inData->size - 1;
    struct OH_Huks_Blob outDataSeg = {MAX_OUTDATA_SIZE, NULL};

    bool isFinished = false;

    if (inData->size <= MAX_UPDATE_SIZE) {
        return TestLessThanMaxSeg(handle, paramSet, purpose, inData, outData);
    }
    while (inDataSeg.data <= lastPtr) {
        if (inDataSeg.data + MAX_UPDATE_SIZE <= lastPtr) {
            outDataSeg.size = MAX_OUTDATA_SIZE;
            if (MallocAndCheckBlobData(&outDataSeg, outDataSeg.size).errorCode != (int32_t)OH_HUKS_SUCCESS) {
                ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
                return ret;
            }
        } else {
            isFinished = true;
            inDataSeg.size = lastPtr - inDataSeg.data + 1;
            break;
        }
        if (OH_Huks_UpdateSession(handle, paramSet, &inDataSeg, &outDataSeg).errorCode != (int32_t)OH_HUKS_SUCCESS) {
            HksFree(outDataSeg.data);
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }
        HksFree(outDataSeg.data);
        if ((isFinished == false) && (inDataSeg.data + MAX_UPDATE_SIZE > lastPtr)) {
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }
        inDataSeg.data += MAX_UPDATE_SIZE;
    }

    if (purpose != OH_HUKS_KEY_PURPOSE_VERIFY) {
        if (OH_Huks_FinishSession(handle, paramSet, &inDataSeg, outData).errorCode != (int32_t)OH_HUKS_SUCCESS) {
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }
    } else {
        uint8_t tmp[] = "temp";
        struct OH_Huks_Blob tempBlob = {sizeof(tmp), tmp};
        if (OH_Huks_UpdateSession(handle, paramSet, &inDataSeg, &tempBlob).errorCode != (int32_t)OH_HUKS_SUCCESS) {
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }
        if (OH_Huks_FinishSession(handle, paramSet, outData, &tempBlob).errorCode != (int32_t)OH_HUKS_SUCCESS) {
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }
    }
    return ret;
}

OH_Huks_Result MallocAndCheckBlobData(struct OH_Huks_Blob *blob, const uint32_t blobSize)
{
    struct OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;

    blob->data = (uint8_t *)HksMalloc(blobSize);
    if (blob->data == NULL) {
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
    }

    return ret;
}

OH_Huks_Result TestCmpKeyAliasHash(const struct OH_Huks_Blob *srcData1, const struct OH_Huks_Blob *srcData2)
{
    struct OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;

    struct OH_Huks_Param hashParam = {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256};
    struct OH_Huks_ParamSet *hashParamSet = NULL;
    ret = InitParamSet(&hashParamSet, &hashParam, sizeof(hashParam) / sizeof(struct OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }

    struct OH_Huks_Blob hash1 = {MAX_OUTDATA_SIZE, NULL};
    if (MallocAndCheckBlobData(&hash1, hash1.size).errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&hashParamSet);
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }
    ret = HuksHash(hashParamSet, srcData1, &hash1);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&hashParamSet);
        HksFree(hash1.data);
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }

    struct OH_Huks_Blob hash2 = {MAX_OUTDATA_SIZE, NULL};
    if (MallocAndCheckBlobData(&hash2, hash2.size).errorCode != (int32_t)OH_HUKS_SUCCESS) {
        HksFree(hash1.data);
        OH_Huks_FreeParamSet(&hashParamSet);
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }
    ret = HuksHash(hashParamSet, srcData2, &hash2);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&hashParamSet);
        HksFree(hash1.data);
        HksFree(hash2.data);
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }

    int32_t ret1 = HksMemCmp(hash1.data, hash2.data, hash2.size);
    ret.errorCode = ret1;
    OH_Huks_FreeParamSet(&hashParamSet);
    HksFree(hash1.data);
    HksFree(hash2.data);

    return ret;
}

static OH_Huks_Result HksEncryptLoopUpdate(const struct OH_Huks_Blob *handle, const struct OH_Huks_ParamSet *paramSet,
                                           const struct OH_Huks_Blob *inData, struct OH_Huks_Blob *outData)
{
    struct OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;

    struct OH_Huks_Blob inDataSeg = *inData;
    uint8_t *lastPtr = inData->data + inData->size - 1;
    struct OH_Huks_Blob outDataSeg = {MAX_OUTDATA_SIZE, NULL};
    uint8_t *cur = outData->data;
    outData->size = 0;

    inDataSeg.size = MAX_UPDATE_SIZE;
    bool isFinished = false;

    while (inDataSeg.data <= lastPtr) {
        if (inDataSeg.data + MAX_UPDATE_SIZE <= lastPtr) {
            outDataSeg.size = MAX_OUTDATA_SIZE;
        } else {
            isFinished = true;
            inDataSeg.size = lastPtr - inDataSeg.data + 1;
            break;
        }
        if (MallocAndCheckBlobData(&outDataSeg, outDataSeg.size).errorCode != (int32_t)OH_HUKS_SUCCESS) {
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }
        ret = OH_Huks_UpdateSession(handle, paramSet, &inDataSeg, &outDataSeg);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            free(outDataSeg.data);
            return ret;
        }
        (void)memcpy_s(cur, outDataSeg.size, outDataSeg.data, outDataSeg.size);
        cur += outDataSeg.size;
        outData->size += outDataSeg.size;
        free(outDataSeg.data);
        if ((isFinished == false) && (inDataSeg.data + MAX_UPDATE_SIZE > lastPtr)) {
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }
        inDataSeg.data += MAX_UPDATE_SIZE;
    }

    struct OH_Huks_Blob outDataFinish = {inDataSeg.size * TIMES, NULL};
    if (MallocAndCheckBlobData(&outDataFinish, outDataFinish.size).errorCode != (int32_t)OH_HUKS_SUCCESS) {
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }

    ret = OH_Huks_FinishSession(handle, paramSet, &inDataSeg, &outDataFinish);
    if (ret.errorCode != OH_HUKS_SUCCESS) {
        free(outDataFinish.data);
        return ret;
    }
    (void)memcpy_s(cur, outDataFinish.size, outDataFinish.data, outDataFinish.size);
    outData->size += outDataFinish.size;
    free(outDataFinish.data);

    return ret;
}

OH_Huks_Result HuksEncrypt(const struct OH_Huks_Blob *key, const struct OH_Huks_ParamSet *paramSet,
                           const struct OH_Huks_Blob *plainText, struct OH_Huks_Blob *cipherText)
{
    uint8_t handle[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handleBlob = {sizeof(uint64_t), handle};
    OH_Huks_Result ret = OH_Huks_InitSession(key, paramSet, &handleBlob, nullptr);
    if (ret.errorCode != OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = HksEncryptLoopUpdate(&handleBlob, paramSet, plainText, cipherText);
    return ret;
}

static OH_Huks_Result HksDecryptLoopUpdate(const struct OH_Huks_Blob *handle, const struct OH_Huks_ParamSet *paramSet,
                                           const struct OH_Huks_Blob *inData, struct OH_Huks_Blob *outData)
{
    struct OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;

    struct OH_Huks_Blob inDataSeg = *inData;
    uint8_t *lastPtr = inData->data + inData->size - 1;
    struct OH_Huks_Blob outDataSeg = {MAX_OUTDATA_SIZE, NULL};
    uint8_t *cur = outData->data;
    outData->size = 0;

    inDataSeg.size = MAX_UPDATE_SIZE;

    bool isFinished = false;

    while (inDataSeg.data <= lastPtr) {
        if (inDataSeg.data + MAX_UPDATE_SIZE <= lastPtr) {
            outDataSeg.size = MAX_OUTDATA_SIZE;
        } else {
            isFinished = true;
            inDataSeg.size = lastPtr - inDataSeg.data + 1;
            break;
        }
        if (MallocAndCheckBlobData(&outDataSeg, outDataSeg.size).errorCode != (int32_t)OH_HUKS_SUCCESS) {
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }
        struct OH_Huks_Result result = OH_Huks_UpdateSession(handle, paramSet, &inDataSeg, &outDataSeg);
        if (result.errorCode != OH_HUKS_SUCCESS) {
            free(outDataSeg.data);
            return result;
        }
        (void)memcpy_s(cur, outDataSeg.size, outDataSeg.data, outDataSeg.size);
        cur += outDataSeg.size;
        outData->size += outDataSeg.size;
        free(outDataSeg.data);
        if ((isFinished == false) && (inDataSeg.data + MAX_UPDATE_SIZE > lastPtr)) {
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }
        inDataSeg.data += MAX_UPDATE_SIZE;
    }

    struct OH_Huks_Blob outDataFinish = {inDataSeg.size * TIMES, NULL};
    if (MallocAndCheckBlobData(&outDataFinish, outDataFinish.size).errorCode != (int32_t)OH_HUKS_SUCCESS) {
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }

    struct OH_Huks_Result result2 = OH_Huks_FinishSession(handle, paramSet, &inDataSeg, &outDataFinish);
    if (result2.errorCode != OH_HUKS_SUCCESS) {
        free(outDataFinish.data);
        return result2;
    }
    (void)memcpy_s(cur, outDataFinish.size, outDataFinish.data, outDataFinish.size);
    outData->size += outDataFinish.size;
    free(outDataFinish.data);

    return ret;
}

OH_Huks_Result HuksDecrypt(const struct OH_Huks_Blob *key, const struct OH_Huks_ParamSet *paramSet,
                           const struct OH_Huks_Blob *cipherText, struct OH_Huks_Blob *plainText)
{
    uint8_t handle[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handleBlob = {sizeof(uint64_t), handle};
    struct OH_Huks_Result result = OH_Huks_InitSession(key, paramSet, &handleBlob, nullptr);
    if (result.errorCode != OH_HUKS_SUCCESS) {
        return result;
    }

    OH_Huks_Result ret = HksDecryptLoopUpdate(&handleBlob, paramSet, cipherText, plainText);
    return ret;
}

static int32_t HksGetDigestLen(uint32_t digest, uint32_t *digestLen)
{
    switch (digest) {
        case OH_HUKS_DIGEST_MD5:
            *digestLen = HKS_DIGEST_MD5_LEN;
            break;
        case OH_HUKS_DIGEST_SHA1:
            *digestLen = HKS_DIGEST_SHA1_LEN;
            break;
        case OH_HUKS_DIGEST_SHA224:
            *digestLen = HKS_DIGEST_SHA224_LEN;
            break;
        case OH_HUKS_DIGEST_SHA256:
            *digestLen = HKS_DIGEST_SHA256_LEN;
            break;
        case OH_HUKS_DIGEST_SHA384:
            *digestLen = HKS_DIGEST_SHA384_LEN;
            break;
        case OH_HUKS_DIGEST_SHA512:
            *digestLen = HKS_DIGEST_SHA512_LEN;
            break;
        case OH_HUKS_DIGEST_SM3:
            *digestLen = HKS_DIGEST_SM3_LEN;
            break;
        default:
            return OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
    }
    return OH_HUKS_SUCCESS;
}

static const EVP_MD *GetOpensslAlg(uint32_t alg)
{
    switch (alg) {
        case OH_HUKS_DIGEST_MD5:
            return EVP_md5();
        case OH_HUKS_DIGEST_SHA1:
            return EVP_sha1();
        case OH_HUKS_DIGEST_SHA224:
            return EVP_sha224();
        case OH_HUKS_DIGEST_SHA256:
            return EVP_sha256();
        case OH_HUKS_DIGEST_SHA384:
            return EVP_sha384();
        case OH_HUKS_DIGEST_SHA512:
            return EVP_sha512();
        default:
            return NULL;
    }
}

static int32_t HksOpensslHash(uint32_t alg, const struct OH_Huks_Blob *msg, struct OH_Huks_Blob *hash)
{
    const EVP_MD *opensslAlg = GetOpensslAlg(alg);
    if (opensslAlg == NULL) {
        return OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
    }

    int32_t ret = EVP_Digest(msg->data, msg->size, hash->data, &hash->size, opensslAlg, NULL);
    if (ret != 1) {
        return OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
    }
    return (int32_t)OH_HUKS_SUCCESS;
}

OH_Huks_Result HuksHash(const struct OH_Huks_ParamSet *paramSet, const struct OH_Huks_Blob *srcData,
                        struct OH_Huks_Blob *hash)
{
    OH_Huks_Result ret;

    if ((paramSet == NULL) || (srcData == NULL) || (hash == NULL)) {
        ret.errorCode = OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
        return ret;
    }

    struct OH_Huks_Param *digestAlg = NULL;
    ret = OH_Huks_GetParam(paramSet, OH_HUKS_TAG_DIGEST, &digestAlg);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    uint32_t digestLen;
    int32_t ret1 = HksGetDigestLen(digestAlg->uint32Param, &digestLen);
    ret.errorCode = ret1;
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    if (hash->size < digestLen) {
        ret.errorCode = OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
        return ret;
    }
    ret1 = HksOpensslHash(digestAlg->uint32Param, srcData, hash);
    ret.errorCode = ret1;
    return ret;
}

OH_Huks_Result HuksAgreeKey(const struct OH_Huks_ParamSet *paramSet, const struct OH_Huks_Blob *keyAlias,
                            const struct OH_Huks_Blob *peerPublicKey, struct OH_Huks_Blob *agreedKey)
{
    uint8_t temp[10] = {0};
    struct OH_Huks_Blob inData = {sizeof(temp), temp};

    uint8_t handleU[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handle = {sizeof(uint64_t), handleU};
    OH_Huks_Result ret = OH_Huks_InitSession(keyAlias, paramSet, &handle, nullptr);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    uint8_t outDataU[1024] = {0};
    struct OH_Huks_Blob outDataUpdate = {1024, outDataU};
    ret = OH_Huks_UpdateSession(&handle, paramSet, peerPublicKey, &outDataUpdate);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = OH_Huks_FinishSession(&handle, paramSet, &inData, agreedKey);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }
    return ret;
}

bool checkUseSoftware()
{
    const char *keyAliasString = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
    struct OH_Huks_ParamSet *genParamSet = nullptr;
    struct OH_Huks_Blob keyAlias = {strlen(keyAliasString), (uint8_t *)keyAliasString};
    InitParamSet(&genParamSet, g_genParamsTest001, sizeof(g_genParamsTest001) / sizeof(OH_Huks_Param));
    OH_Huks_Result ret = OH_Huks_GenerateKeyItem(&keyAlias, genParamSet, nullptr);
    if (ret.errorCode == 0) {
        OH_Huks_DeleteKeyItem(&keyAlias, genParamSet);
        OH_Huks_FreeParamSet(&genParamSet);
        return true;
    }
    return false;
}