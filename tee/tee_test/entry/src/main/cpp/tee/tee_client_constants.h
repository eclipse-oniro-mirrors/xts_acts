/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#ifndef TEE_CLIENT_CONSTANTS_H
#define TEE_CLIENT_CONSTANTS_H

/**
 * @addtogroup TeeTrusted
 * @{
 *
 * @brief TEE(Trusted Excution Environment) 可信执行环境 API.
 *
 * 提供安全能力API，例如可信存储、加解密及可信时间等，用于可信应用程序开发。
 *
 * @since 20
 */

/**
 * @file tee_client_constants.h
 *
 * @brief 定义了公共数据和常量。
 *
 * @library libteec.so
 * @kit TEEKit
 * @syscap SystemCapability.Tee.TeeClient
 * @since 20
 * @version 1.0
 */

/**
 * @brief 定义 <b>TEEC_Operation</b> 中的 <b>TEEC_Parameter</b> 数量。
 *
 * @since 20
 * @version 1.0
 */
#define TEEC_PARAM_NUM 4

/**
 * @brief 定义返回错误码。
 *
 * @since 20
 * @version 1.0
 */
enum TEEC_ReturnCode {
    /** 操作成功。 */
    TEEC_SUCCESS = 0x0,
    /** 无效命令。该命令不受 TA 支持。 */
    TEEC_ERROR_INVALID_CMD,
    /** TA 不存在。 */
    TEEC_ERROR_SERVICE_NOT_EXIST,
    /** CA 与 TA 之间的会话不存在。 */
    TEEC_ERROR_SESSION_NOT_EXIST,
    /** 连接到 TA 的数量已达到上限。 */
    TEEC_ERROR_SESSION_MAXIMUM,
    /** 要注册的 TA 已存在。 */
    TEEC_ERROR_REGISTER_EXIST_SERVICE,
    /** 安全 OS 框架错误。 */
    TEEC_ERROR_TAGET_DEAD_FATAL,
    /** 读取文件失败。 */
    TEEC_ERROR_READ_DATA,
    /** 写入文件失败。 */
    TEEC_ERROR_WRITE_DATA,
    /** 截断文件失败。 */
    TEEC_ERROR_TRUNCATE_OBJECT,
    /** 数据查找失败。 */
    TEEC_ERROR_SEEK_DATA,
    /** 文件同步错误。 */
    TEEC_ERROR_FSYNC_DATA,
    /** 文件重命名失败。 */
    TEEC_ERROR_RENAME_OBJECT,
    /** 打开会话时加载 TA 失败。 */
    TEEC_ERROR_TRUSTED_APP_LOAD_ERROR,
    /** 初始化 TA 失败。 */
    TEEC_ERROR_GENERIC = 0xFFFF0000,
    /** 权限验证失败。此错误码在 TEE 或会话打开之前或在发送命令之前发生权限验证失败时返回。 */
    TEEC_ERROR_ACCESS_DENIED = 0xFFFF0001,
    /** 操作被取消。当使用带有取消标志的参数操作时返回此错误码。 */
    TEEC_ERROR_CANCEL = 0xFFFF0002,
    /** 并发访问引发权限冲突。可信存储服务中的文件的并发访问可能会导致此错误。 */
    TEEC_ERROR_ACCESS_CONFLICT = 0xFFFF0003,
    /** 在请求的操作中传入的数据过多，导致 TA 无法解析。 */
    TEEC_ERROR_EXCESS_DATA = 0xFFFF0004,
    /** 数据格式不正确。TA 无法解析 CA 发送的参数。 */
    TEEC_ERROR_BAD_FORMAT = 0xFFFF0005,
    /** 无效参数。输入参数为空或无效。 */
    TEEC_ERROR_BAD_PARAMETERS = 0xFFFF0006,
    /** 当前状态下的操作无效。如果请求了可信存储服务操作时，可信存储服务未初始化，则返回此错误码。 */
    TEEC_ERROR_BAD_STATE = 0xFFFF0007,
    /** 未找到请求的数据。 */
    TEEC_ERROR_ITEM_NOT_FOUND = 0xFFFF0008,
    /** 请求的操作尚未实现。当调用 <b>TEEC_RequestCancellation</b> 时返回此错误码。 */
    TEEC_ERROR_NOT_IMPLEMENTED = 0xFFFF0009,
    /** 请求的操作有效，但在此实现中不受支持。当请求安全加密和解密服务的某些算法（如 DSA）时返回此错误码。 */
    TEEC_ERROR_NOT_SUPPORTED = 0xFFFF000A,
    /** 请求的操作所需的数据未找到。 */
    TEEC_ERROR_NO_DATA = 0xFFFF000B,
    /** 系统资源不足。 */
    TEEC_ERROR_OUT_OF_MEMORY = 0xFFFF000C,
    /** 系统繁忙。某些资源已被系统独占使用。 */
    TEEC_ERROR_BUSY = 0xFFFF000D,
    /** REE 中的应用程序与 TA 之间的通信失败。 */
    TEEC_ERROR_COMMUNICATION = 0xFFFF000E,
    /** 在 TEE 中检测到安全故障。 */
    TEEC_ERROR_SECURITY = 0xFFFF000F,
    /** 提供的缓冲区对于生成的输出数据来说过短。
     此错误可能在使用 {@code TEEC_MEMREF_TEMP_OUTPUT} 时发生。 */
    TEEC_ERROR_SHORT_BUFFER = 0xFFFF0010,
    /** MAC 值校验错误。 */
    TEEC_ERROR_MAC_INVALID = 0xFFFF3071,
    /** TA 崩溃。 */
    TEEC_ERROR_TARGET_DEAD = 0xFFFF3024,
    /** 常见错误。 */
    TEEC_FAIL = 0xFFFF5002
};

/**
 * @brief 定义返回错误码来源。
 *
 * @since 20
 * @version 1.0
 */
enum TEEC_ReturnCodeOrigin {
    /** 错误码表示来自客户端 API 的错误。 */
    TEEC_ORIGIN_API = 0x1,
    /** 错误码表示来自 REE（普通执行环境）与 TEE（可信执行环境）之间通信的错误。 */
    TEEC_ORIGIN_COMMS = 0x2,
    /** 错误码表示来自 TEE 代码内部的错误。 */
    TEEC_ORIGIN_TEE = 0x3,
    /** 错误码表示来自 TA（可信应用）代码内部的错误。 */
    TEEC_ORIGIN_TRUSTED_APP = 0x4,
};

/**
 * @brief 定义共享内存标识符。
 *
 * @since 20
 * @version 1.0
 */
enum TEEC_SharedMemCtl {
    /** 共享内存可用于从 CA（客户端应用）向 TA（可信应用）传输数据。 */
    TEEC_MEM_INPUT = 0x1,
    /** 共享内存可用于从 TA（可信应用）向 CA（客户端应用）传输数据。 */
    TEEC_MEM_OUTPUT = 0x2,
    /** 共享内存可用于在 CA（客户端应用）与 TA（可信应用）之间的双向数据传输。 */
    TEEC_MEM_INOUT = 0x3,
};

/**
 * @brief 定义参数类型。
 *
 * @since 20
 * @version 1.0
 */
enum TEEC_ParamType {
    /** 该参数未使用。 */
    TEEC_NONE = 0x0,
    /** 该参数为标记为输入的 {@code TEEC_Value}。数据从 CA（客户端应用）流向 TA（可信应用）。 */
    TEEC_VALUE_INPUT = 0x01,
    /** 该参数为标记为输出的 {@code TEEC_Value}。数据从 TA（可信应用）流向 CA（客户端应用）。 */
    TEEC_VALUE_OUTPUT = 0x02,
    /** 该参数为标记为输入和输出的 {@code TEEC_Value}。 */
    TEEC_VALUE_INOUT = 0x03,
    /** 该参数为标记为输入的 {@code TEEC_TempMemoryReference}。数据从 CA（客户端应用）流向 TA（可信应用）。 */
    TEEC_MEMREF_TEMP_INPUT = 0x05,
    /** 该参数为标记为输出的 {@code TEEC_TempMemoryReference}。数据从 TA（可信应用）流向 CA（客户端应用）。 */
    TEEC_MEMREF_TEMP_OUTPUT = 0x06,
    /** 该参数为标记为输入和输出的 {@code TEEC_TempMemoryReference}。
     数据在 TA（可信应用）和 CA（客户端应用）之间传输。 */
    TEEC_MEMREF_TEMP_INOUT = 0x07,
    /** 该参数为标记为输入的 {@code TEEC_IonReference}。数据从 CA（客户端应用）流向 TA（可信应用）。 */
    TEEC_ION_INPUT = 0x08,
    /** 该参数为标记为输入的 {@code TEEC_IonSglistReference}。数据从 CA（客户端应用）流向 TA（可信应用）。 */
    TEEC_ION_SGLIST_INPUT = 0x09,
    /** 该参数为 {@code TEEC_RegisteredMemoryReference}，用于指向完整的内存块。
     数据流向与 {@code TEEC_SharedMemCtl} 相同。 */
    TEEC_MEMREF_WHOLE = 0xc,
    /** 该参数为标记为输入的 {@code TEEC_RegisteredMemoryReference}。数据从 CA（客户端应用）流向 TA（可信应用）。 */
    TEEC_MEMREF_PARTIAL_INPUT = 0xd,
    /** 该参数为标记为输出的 {@code TEEC_RegisteredMemoryReference}。数据从 TA（可信应用）流向 CA（客户端应用）。 */
    TEEC_MEMREF_PARTIAL_OUTPUT = 0xe,
    /** 该参数为标记为输入和输出的 {@code TEEC_RegisteredMemoryReference}。
     数据在 TA（可信应用）和 CA（客户端应用）之间传输。 */
    TEEC_MEMREF_PARTIAL_INOUT = 0xf
};

/**
 * @brief 定义了登录方法。
 *
 * @since 20
 * @version 1.0
 */
enum TEEC_LoginMethod {
    /** 未提供任何登录数据。 */
    TEEC_LOGIN_PUBLIC = 0x0,
    /** 提供了关于运行 CA（客户端应用）进程的用户的登录数据。 */
    TEEC_LOGIN_USER,
    /** 提供了关于运行 CA（客户端应用）进程的用户组的登录数据。 */
    TEEC_LOGIN_GROUP,
    /** 提供了关于正在运行的 CA（客户端应用）的登录数据。 */
    TEEC_LOGIN_APPLICATION = 0x4,
    /** 提供了关于运行 CA（客户端应用）进程的用户及 CA 的登录数据。 */
    TEEC_LOGIN_USER_APPLICATION = 0x5,
    /** 提供了关于运行 CA（客户端应用）进程的用户组及 CA 的登录数据。 */
    TEEC_LOGIN_GROUP_APPLICATION = 0x6,
    /** TEEOS 预留的登录方法。 */
    TEEC_LOGIN_IDENTIFY = 0x7,
};

/** @} */
#endif
