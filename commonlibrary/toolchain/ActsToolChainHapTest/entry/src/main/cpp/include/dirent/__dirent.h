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

#ifndef DIRENT___DIRENT_H_H
#define DIRENT___DIRENT_H_H

struct __dirstream {
    off_t tell;
    int fd;
    int bufPos;
    int bufEnd;
    volatile int lock[1];
    void* dirk;
    void* resv;
    /* Any changes to this struct must preserve the property:
     * offsetof(struct __dirent, buf) % sizeof(off_t) == 0 */
    char buf[2048];
};

#endif // DIRENT___DIRENT_H_H
