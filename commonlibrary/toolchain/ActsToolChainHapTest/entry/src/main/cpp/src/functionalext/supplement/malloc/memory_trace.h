/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

#ifndef MEMORY_TRACE_H
#define MEMORY_TRACE_H

#include <unistd.h>

#ifdef __cplusplus
extern "C" {
#endif

#define TAG_RES_FD_OPEN "RES_FD_OPEN"
#define TAG_RES_FD_EPOLL "RES_FD_EPOLL"
#define TAG_RES_FD_EVENTFD "RES_FD_EVENTFD"
#define TAG_RES_FD_SOCKET "RES_FD_SOCKET"
#define TAG_RES_FD_PIPE "RES_FD_PIPE"
#define TAG_RES_FD_DUP "RES_FD_DUP"
#define TAG_RES_FD_ALL "RES_FD_ALL"
#define TAG_RES_THREAD_PTHREAD "RES_THREAD_PTHREAD"
#define TAG_RES_THREAD_ALL "RES_THREAD_ALL"
#define TAG_RES_GPU_VK "RES_GPU_VK"
#define TAG_RES_GPU_GLES_IMAGE "RES_GPU_GLES_IMAGE"
#define TAG_RES_GPU_GLES_BUFFER "RES_GPU_GLES_BUFFER"
#define TAG_RES_GPU_CL_IMAGE "RES_GPU_CL_IMAGE"
#define TAG_RES_GPU_CL_BUFFER "RES_GPU_CL_BUFFER"
#define TAG_RES_GPU_ALL "RES_GPU_ALL"
#define TAG_RES_DMABUF "RES_DMABUF"

#define TAG_RES_ARKTS_HEAP_MASK "RES_ARKTS_HEAP_MASK"
#define TAG_RES_JS_HEAP_MASK "RES_JS_HEAP_MASK"
#define TAG_RES_KMP_HEAP_MASK "RES_KMP_HEAP_MASK"
#define TAG_RES_ASHMEM "RES_ASHMEM"
#define TAG_RES_RN_HEAP_MASK "RES_RN_HEAP_MASK"
#define TAG_RES_DMABUF_MASK "RES_DMABUF_MASK"
#define TAG_RES_ARK_GLOBAL_HANDLE "RES_ARK_GLOBAL_HANDLE"

/* each bit represents resource hook point.
 * |63 ... 32|31 ... 22|21 ... 12|11 - 10|9 ... 0|
 * |RESERVED |  DMABUF |   GPU   |THREAD |   FD  |
 */

// FD
#define RES_FD_OPEN (1 << 0)
#define RES_FD_EPOLL (1 << 1)
#define RES_FD_EVENTFD (1 << 2)
#define RES_FD_SOCKET (1 << 3)
#define RES_FD_PIPE (1 << 4)
#define RES_FD_DUP (1 << 5)
#define RES_FD_MASK (0x3F)
// Thread
#define RES_THREAD_PTHREAD (1 << 10)
#define RES_THREAD_MASK (0x3 << 10)
// GPU Memory
#define RES_GPU_VK (1 << 12)
#define RES_GPU_GLES_IMAGE (1 << 13)
#define RES_GPU_GLES_BUFFER (1 << 14)
#define RES_GPU_CL_IMAGE (1 << 15)
#define RES_GPU_CL_BUFFER (1 << 16)
#define RES_GPU_MASK (0x1F << 12)
// ION Memory
#define RES_ION_MASK (0x1F << 22)
// RESERVED
#define RES_RESERVED_MASK (0xFFFFFF << 32)
#define RES_ARKTS_HEAP_MASK (1 << 17)
#define RES_JS_HEAP_MASK (1 << 18)
#define RES_KMP_HEAP_MASK (1 << 19)
#define RES_SO_MASK (1 << 20)
#define RES_RN_HEAP_MASK (1 << 21)
#define RES_DMABUF_MASK (1 << 22)
#define RES_ARK_GLOBAL_HANDLE (1 << 23)

#define FD_SIZE 1
#define THREAD_SIZE 1

inline void Memtrace(void* addr, size_t size, const char* tag, bool isUsing){};
inline void Restrace(unsigned long long mask, void* addr, size_t size, const char* tag, bool isUsing){};
inline void RestraceFd(unsigned long long mask, int fd, const char* tag, bool isUsing){};
inline void
    RestraceExt(unsigned long long mask, void* addr, size_t size, const char* tag, bool isUsing, bool isWeakRef){};
inline void ResTraceMove(unsigned long long mask, void* oldAddr, void* newAddr, size_t newSize){};
inline void ResTraceFreeRegion(unsigned long long mask, void* addr, size_t size){};

#define memtrace Memtrace
#define restrace Restrace
#define restraceFd RestraceFd
#define restraceExt RestraceExt
#define resTraceMove ResTraceMove
#define resTraceFreeRegion ResTraceFreeRegion
#ifdef __cplusplus
}
#endif
#endif
