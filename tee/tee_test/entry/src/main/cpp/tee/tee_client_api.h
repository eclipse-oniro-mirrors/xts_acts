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

#ifndef TEE_CLIENT_API_H
#define TEE_CLIENT_API_H

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
 * @file tee_client_api.h
 *
 * @brief 定义了供可信应用（TA）访问的客户端应用（CA）API。
 *
 * <p> 示例：
 * <p>1. 初始化 TEE：调用 <b>TEEC_InitializeContext</b> 来初始化 TEE。
 * <p>2. 打开会话：调用 <b>TEEC_OpenSession</b> 并传入可信应用 (TA) 的通用唯一标识符 (UUID)。
 * <p>3. 发送命令：调用 <b>TEEC_InvokeCommand</b> 向 TA 发送命令。
 * <p>4. 关闭会话：调用 <b>TEEC_CloseSession</b> 关闭会话。
 * <p>5. 关闭 TEE：调用 <b>TEEC_FinalizeContext</b> 关闭 TEE。
 *
 * @library libteec.so
 * @kit TEEKit
 * @syscap SystemCapability.Tee.TeeClient
 * @since 20
 * @version 1.0
 */

#include <string.h>
#include "tee_client_type.h"

#ifdef __cplusplus
extern "C" {
#endif

/**
 * @brief 定义了在 REE（普通执行环境）与 TEE（可信执行环境）之间传输的参数值。
 *
 * @since 20
 * @version 1.0
 */
#define TEEC_PARAM_TYPES(param0Type, param1Type, param2Type, param3Type) \
    ((param3Type) << 12 | (param2Type) << 8 | (param1Type) << 4 | (param0Type))

/**
 * @brief 定义由 <b>paramTypes</b> 和 <b>index</b> 指定的参数值。
 *
 * @since 20
 * @version 1.0
 */
#define TEEC_PARAM_TYPE_GET(paramTypes, index) \
    (((paramTypes) >> (4*(index))) & 0x0F)

/**
 * @brief 初始化 TEE（可信执行环境）。
 *
 * 必须在打开会话或发送命令之前初始化 TEE。
 * 初始化完成后，客户端应用（CA）与 TEE 之间将建立连接。
 *
 * @param name [IN] 指向 TEE 路径的指针。
 * @param context [IN/OUT] 指向上下文的指针，该指针是 TEE 的句柄。
 *
 * @return 返回 {@code TEEC_SUCCESS} 表示 TEE 成功初始化。\n
 *         返回 {@code TEEC_ERROR_BAD_PARAMETERS} 表示 <b>name</b> 不正确或 <b>context</b> 为 null。\n
 *         返回 {@code TEEC_ERROR_GENERIC} 表示系统资源不足。
 *
 * @since 20
 * @version 1.0
 */
TEEC_Result TEEC_InitializeContext(const char *name, TEEC_Context *context);

/**
 * @brief 关闭 TEE。
 *
 * TEE 关闭后，客户端应用（CA）将与 TEE 断开连接。
 *
 * @param context [IN/OUT] 指向已成功初始化的 TEE 的指针。
 *
 * @since 20
 * @version 1.0
 */
void TEEC_FinalizeContext(TEEC_Context *context);

/**
 * @brief 打开一个会话。
 *
 * 此函数用于在指定 TEE 上下文中，为客户端应用（CA）与指定 UUID 的可信应用（TA）建立连接。
 * 传输的数据包含在 <b>operation</b> 中。
 * 如果会话成功打开，则返回的 <b>session</b> 提供连接的描述。
 * 如果会话打开失败，则返回 <b>returnOrigin</b> 表示失败的原因。
 *
 * @param context [IN/OUT] 指向已成功初始化的 TEE 的指针。
 * @param session [OUT] 指向会话的指针。该值不能为空。
 * @param destination [IN] 指向目标 TA 的 UUID 的指针。每个 TA 都有唯一的 UUID。
 * @param connectionMethod [IN] 指示连接方法。详情请参见 {@link TEEC_LoginMethod}。
 * @param connectionData [IN] 指向连接数据的指针，该值根据连接模式而变化。
 * 如果连接模式为 {@code TEEC_LOGIN_PUBLIC}、{@code TEEC_LOGIN_USER}、
 * {@code TEEC_LOGIN_USER_APPLICATION} 或 {@code TEEC_LOGIN_GROUP_APPLICATION}，则连接数据必须为 null。
 * 如果连接模式为 {@code TEEC_LOGIN_GROUP} 或 {@code TEEC_LOGIN_GROUP_APPLICATION}，
 * 则连接数据必须指向一个 uint32_t 类型的数据，表示 CA 需连接的目标用户组。
 * @param operation [IN/OUT] 指向 CA 与 TA 之间传输数据的指针。
 * @param returnOrigin [IN/OUT] 指向错误来源的指针。
 * 详情请参见 {@code TEEC_ReturnCodeOrigin}。
 *
 * @return 返回 {@code TEEC_SUCCESS} 表示会话成功打开。\n
 *         返回 {@code TEEC_ERROR_BAD_PARAMETERS} 表示 <b>context</b>、<b>session</b> 或 <b>destination</b> 为空。\n
 *         返回 {@code TEEC_ERROR_ACCESS_DENIED} 表示访问请求被拒绝。\n
 *         返回 {@code TEEC_ERROR_OUT_OF_MEMORY} 表示系统资源不足。\n
 *         返回 {@code TEEC_ERROR_TRUSTED_APP_LOAD_ERROR} 表示 TA 加载失败。\n
 *         有关其他返回值的详细信息，请参见 {@code TEEC_ReturnCode}。
 *
 * @since 20
 * @version 1.0
 */
TEEC_Result TEEC_OpenSession(TEEC_Context *context, TEEC_Session *session, const TEEC_UUID *destination,
    uint32_t connectionMethod, const void *connectionData, TEEC_Operation *operation, uint32_t *returnOrigin);

/**
 * @brief 关闭会话。
 *
 * 会话关闭后，客户端应用（CA）将与可信应用（TA）断开连接。
 *
 * @param session [IN/OUT] 指向要关闭的会话的指针。
 *
 * @since 20
 * @version 1.0
 */
void TEEC_CloseSession(TEEC_Session *session);

/**
 * @brief 向 TA 发送命令。
 *
 * 客户端应用（CA）通过指定的会话向 TA 发送命令 ID。
 *
 * @param session [IN/OUT] 指向已打开的会话的指针。
 * @param commandID [IN] 指定 TA 支持的命令 ID，由 TA 定义。
 * @param operation [IN/OUT] 指向从 CA 向 TA 发送的数据的指针。
 * @param returnOrigin [IN/OUT] 指向错误来源的指针。
 * 详情请参见 {@code TEEC_ReturnCodeOrigin}。
 *
 * @return 返回 {@code TEEC_SUCCESS} 表示命令发送成功。\n
 *         返回 {@code TEEC_ERROR_BAD_PARAMETERS} 表示 <b>session</b> 为空或 <b>operation</b> 格式错误。\n
 *         返回 {@code TEEC_ERROR_ACCESS_DENIED} 表示访问请求被拒绝。\n
 *         返回 {@code TEEC_ERROR_OUT_OF_MEMORY} 表示系统资源不足。\n
 *         有关其他返回值的详细信息，请参见 {@code TEEC_ReturnCode}。
 *
 * @since 20
 * @version 1.0
 */
TEEC_Result TEEC_InvokeCommand(TEEC_Session *session, uint32_t commandID,
    TEEC_Operation *operation, uint32_t *returnOrigin);

/**
 * @brief 在指定 TEE 上下文中注册共享内存。
 *
 * 注册的共享内存可以实现零拷贝。
 * 然而，零拷贝功能还需要操作系统的支持。
 * 目前，无法以此方式实现零拷贝。
 *
 * @param context [IN/OUT] 指向已成功初始化的 TEE 的指针。
 * @param sharedMem [IN/OUT] 指向共享内存的指针。
 * 该指针指向的共享内存不能为空，且其大小不能为 0。
 *
 * @return 返回 {@code TEEC_SUCCESS} 表示操作成功。\n
 *         返回 {@code TEEC_ERROR_BAD_PARAMETERS} 表示 <b>context</b>、<b>sharedMem</b> 为空或指向的内存为空。
 *
 * @since 20
 * @version 1.0
 */
TEEC_Result TEEC_RegisterSharedMemory(TEEC_Context *context, TEEC_SharedMemory *sharedMem);

/**
 * @brief 在指定的 TEE 上下文中请求共享内存。
 *
 * 共享内存可用于在普通执行环境（REE）与可信执行环境（TEE）之间的数据传输中实现零拷贝。
 * 然而，零拷贝功能还需要操作系统的支持。
 * 目前，无法以此方式实现零拷贝。
 *
 * @attention 如果输入参数 <b>sharedMem</b> 的 <b>size</b> 字段设置为 <b>0</b>，虽然函数会返回 <b>TEEC_SUCCESS</b>，
 * 但该共享内存将无法使用，因为该内存既没有地址也没有大小。
 *
 * @param context [IN/OUT] 指向已成功初始化的 TEE 的指针。
 * @param sharedMem [IN/OUT] 指向共享内存的指针。共享内存的大小不能为 0。
 *
 * @return 返回 {@code TEEC_SUCCESS} 表示操作成功。\n
 *         返回 {@code TEEC_ERROR_BAD_PARAMETERS} 表示 <b>context</b> 或 <b>sharedMem</b> 为空。\n
 *         返回 {@code TEEC_ERROR_OUT_OF_MEMORY} 表示系统资源不足。
 *
 * @since 20
 * @version 1.0
 */
TEEC_Result TEEC_AllocateSharedMemory(TEEC_Context *context, TEEC_SharedMemory *sharedMem);

/**
 * @brief 释放已注册或已获取的共享内存。
 *
 * @attention 如果共享内存是通过 {@code TEEC_AllocateSharedMemory} 获取的，
 * 则释放后该内存会被系统回收；如果共享内存是通过 {@code TEEC_RegisterSharedMemory} 获取的，
 * 则释放后本地内存不会被回收。
 *
 * @param sharedMem [IN/OUT] 指向要释放的共享内存的指针。
 *
 * @since 20
 * @version 1.0
 */
void TEEC_ReleaseSharedMemory(TEEC_SharedMemory *sharedMem);

/**
 * @brief 取消一个操作。
 *
 * @attention 此操作仅用于发送取消消息。是否执行取消操作由 TEE 或 TA 决定。
 * 当前，取消操作不生效。
 *
 * @param operation [IN/OUT] 指向从 CA 到 TA 发送数据的指针。
 *
 * @since 20
 * @version 1.0
 */
void TEEC_RequestCancellation(TEEC_Operation *operation);

#ifdef __cplusplus
}
#endif
/** @} */
#endif
