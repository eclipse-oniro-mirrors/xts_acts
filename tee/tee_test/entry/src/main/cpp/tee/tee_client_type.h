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

#ifndef TEE_CLIENT_TYPE_H
#define TEE_CLIENT_TYPE_H

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
 * @file tee_client_type.h
 *
 * @brief 定义基本数据类型和数据结构。
 *
 * @library libteec.so
 * @kit TEEKit
 * @syscap SystemCapability.Tee.TeeClient
 * @since 20
 * @version 1.0
 */

#include <semaphore.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include "tee_client_constants.h"

/**
 * @brief 定义链表节点类型。
 *
 * @since 20
 * @version 1.0
 */
struct ListNode {
    /** 指向链表中下一个节点的指针。 */
    struct ListNode *next;
    /** 指向链表中上一个节点的指针。 */
    struct ListNode *prev;
};

/**
 * @brief 定义返回值类型。
 *
 * @since 20
 * @version 1.0
 */
typedef enum TEEC_ReturnCode TEEC_Result;

/**
 * @brief 定义通用唯一标识符 (UUID)，符合 RFC4122 [2] 标准。UUID 用于标识可信应用 (TA)。
 *
 * @since 20
 * @version 1.0
 */
typedef struct {
    /** UUID 的低 32 位时间字段。 */
    uint32_t timeLow;
    /** UUID 的中 16 位时间字段。 */
    uint16_t timeMid;
    /** UUID 的高 16 位时间字段和版本号。 */
    uint16_t timeHiAndVersion;
    /** 时钟序列和节点值，长度为 8 字节。 */
    uint8_t clockSeqAndNode[8];
} TEEC_UUID;

/**
 * @brief 定义上下文 (Context)，表示 CA（客户端应用）与 TEE（可信执行环境）之间的逻辑连接。
 *
 * @since 20
 * @version 1.0
 */
typedef struct {
    /** 文件描述符。 */
    int32_t fd;
    /** 指向可信应用 (TA) 路径的指针。 */
    uint8_t *ta_path;
    /** 链接到当前上下文中的会话链表。 */
    struct ListNode session_list;
    /** 链接到当前上下文中的共享内存链表。 */
    struct ListNode shrd_mem_list;
    /** 共享缓冲区或实现特定数据的联合体。 */
    union {
        struct {
            /** 指向共享缓冲区的指针。 */
            void *buffer;
            /** 共享缓冲区的信号量，用于同步访问。 */
            sem_t buffer_barrier;
        } share_buffer;
        /** 实现特定的 64 位数据。 */
        uint64_t imp;
    };
} TEEC_Context;

/**
 * @brief 定义 CA（客户端应用）与 TA（可信应用）之间的会话。
 *
 * @since 20
 * @version 1.0
 */
typedef struct {
    /** 会话 ID，唯一标识 CA 和 TA 之间的会话。 */
    uint32_t session_id;
    /** 目标 TA 的 UUID（通用唯一标识符）。 */
    TEEC_UUID service_id;
    /** 操作计数器，跟踪该会话内的操作次数。 */
    uint32_t ops_cnt;
    /** 记录会话链表头节点或实现特定数据的联合体。 */
    union {
        /** 链表头节点，指向当前会话节点。 */
        struct ListNode head;
        /** 实现特定的 64 位数据。 */
        uint64_t imp;
    };
    /** 指向当前会话所属的上下文 (Context)。 */
    TEEC_Context *context;
} TEEC_Session;

/**
 * @brief 定义共享内存块，可通过注册或分配方式获取。
 *
 * @since 20
 * @version 1.0
 */
typedef struct {
    /** 指向共享内存缓冲区的指针。 */
    void *buffer;
    /** 共享内存的大小。 */
    uint32_t size;
    /** 共享内存的标志位，标识内存的使用方式。 */
    uint32_t flags;
    /** 操作计数器，跟踪在该共享内存上执行的操作次数。 */
    uint32_t ops_cnt;
    /** 指示共享内存是否通过 `TEEC_AllocateSharedMemory` 分配。 */
    bool is_allocated;
    /** 记录共享内存链表头节点或实现特定数据的联合体。 */
    union {
        /** 链表头节点，指向当前共享内存节点。 */
        struct ListNode head;
        /** 实现特定的指针数据。 */
        void* imp;
    };
    /** 指向当前共享内存所属的上下文 。 */
    TEEC_Context *context;
} TEEC_SharedMemory;

/**
 * @brief 定义指向临时缓冲区的指针。
 *
 * @since 20
 * @version 1.0
 */
typedef struct {
    /** 指向临时缓冲区的指针。 */
    void *buffer;
    /** 临时缓冲区的大小（以字节为单位）。 */
    uint32_t size;
} TEEC_TempMemoryReference;

/**
 * @brief 定义指向已注册或已分配共享内存的指针。
 *
 * @since 20
 * @version 1.0
 */
typedef struct {
    /** 指向已注册或已分配共享内存的指针。 */
    TEEC_SharedMemory *parent;
    /** 共享内存大小。 */
    uint32_t size;
    /** 共享内存偏移量。 */
    uint32_t offset;
} TEEC_RegisteredMemoryReference;

/**
 * @brief 描述一个以值传递的小型原始数据参数。
 *
 * @since 20
 * @version 1.0
 */
typedef struct {
    /** 参数值 a。 */
    uint32_t a;
    /** 参数值 b。 */
    uint32_t b;
} TEEC_Value;

/**
 * @brief 描述 ION 内存的大小和句柄。
 *
 * @since 20
 * @version 1.0
 */
typedef struct {
    /** ION 内存的共享文件描述符。 */
    int ionShareFd;
    /** ION 内存的大小。 */
    uint32_t ionSize;
} TEEC_IonReference;

/**
 * @brief 定义 {@code TEEC_Operation} 的参数。
 *
 * @since 20
 * @version 1.0
 */
typedef union {
    /** 临时内存引用。 */
    TEEC_TempMemoryReference tmpref;
    /** 已注册的内存引用。 */
    TEEC_RegisteredMemoryReference memref;
    /** 以值传递的小型原始数据。 */
    TEEC_Value value;
    /** ION 内存引用。 */
    TEEC_IonReference ionref;
} TEEC_Parameter;

/**
 * @brief 定义用于打开会话或发送命令的参数。
 *
 * @since 20
 * @version 1.0
 */
typedef struct {
    /** 值为 0 表示取消命令，其他值表示执行命令。 */
    uint32_t started;
    /** 使用 {@code TEEC_PARAM_TYPES} 创建的参数类型。 */
    uint32_t paramTypes;
    /** 参数数组，包含最多 `TEEC_PARAM_NUM` 个参数。 */
    TEEC_Parameter params[TEEC_PARAM_NUM];
    /** 指向当前操作所属的会话。 */
    TEEC_Session *session;
    /** 取消标志，指示是否取消该操作。 */
    bool cancel_flag;
} TEEC_Operation;

/** @} */
#endif
