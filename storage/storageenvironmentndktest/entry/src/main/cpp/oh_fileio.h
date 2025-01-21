/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#ifndef FILE_MANAGEMENT_FILEIO_OH_FILEIO_H
#define FILE_MANAGEMENT_FILEIO_OH_FILEIO_H

/**
 * @addtogroup FileIO
 *
 * @brief 提供文件基础操作的能力。
 * @since 12
 */

/**
 * @file oh_fileio.h
 *
 * @brief fileio模块接口定义，使用fileio提供的native接口，进行文件基础操作。
 * @library libohfileio.so
 * @syscap SystemCapability.FileManagement.File.FileIO
 * @since 12
 */

#include "error_code.h"

#ifdef __cplusplus
extern "C" {
#endif

/**
 * @brief 文件存储位置枚举值。
 * @since 12
 */
typedef enum FileIO_FileLocation {
    /**
     * @brief 文件存储于本地。
     */
    LOCAL = 1,
    /**
     * @brief 文件存储于云侧。
     */
    CLOUD = 2,
    /**
     * @brief 文件存储于本地及云侧。
     */
    LOCAL_AND_CLOUD = 3
} FileIO_FileLocation;

/**
 * @brief 获取文件存储位置。
 *
 * @param uri 指向入参uri的指针。
 * @param uriLength 入参uri字符串的长度。
 * @param location 输出文件存储位置的指针。
 * @return 返回FileManageMent模块错误码{@link FileManagement_ErrCode}。
 * @since 12
 */
FileManagement_ErrCode OH_FileIO_GetFileLocation(char *uri, int uriLength,
    FileIO_FileLocation *location);

#ifdef __cplusplus
};
#endif

#endif // FILE_MANAGEMENT_FILEIO_OH_FILEIO_H