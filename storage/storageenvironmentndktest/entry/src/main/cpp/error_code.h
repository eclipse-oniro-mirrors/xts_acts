/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

#ifndef FILE_MANAGEMENT_FILEIO_ERROR_CODE_H
#define FILE_MANAGEMENT_FILEIO_ERROR_CODE_H

/**
 * @addtogroup FileIO
 * @{
 *
 * @brief 提供文件基础操作的能力。
 * @since 12
 */

/**
 * @file error_code.h
 *
 * @brief 提供文件管理模块的错误码定义。
 * @syscap SystemCapability.FileManagement.File.FileIO
 * @since 12
 */

#ifdef __cplusplus
extern "C" {
#endif

/**
 * @brief 文件管理模块错误码。
 * @since 12
 */
typedef enum FileManagement_ErrCode {
    /**
     * 接口调用成功。
     */
    ERR_OK = 0,
    /**
     * 接口权限校验失败。
     */
    ERR_PERMISSION_ERROR = 201,
    /**
     * 无效入参。
     */
    ERR_INVALID_PARAMETER = 401,
    /**
     * 当前设备不支持此接口。
     */
    ERR_DEVICE_NOT_SUPPORTED = 801,
    /**
     * 操作不被允许。
     */
    ERR_EPERM = 13900001,
    /**
     * 不存在此文件或文件夹。
     */
    ERR_ENOENT = 13900002,
    /**
     * 内存溢出。
     */
    ERR_ENOMEM = 13900011,
    /**
     * 内部未知错误。
     */
    ERR_UNKNOWN = 13900042
} FileManagement_ErrCode;

#ifdef __cplusplus
}
#endif

#endif // FILE_MANAGEMENT_FILEIO_ERROR_CODE_H