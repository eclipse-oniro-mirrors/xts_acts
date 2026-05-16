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

#include <cstdlib>
#include <search.h>
#include "libc_test_shim.h"

namespace {
constexpr int K_INSQUE_CHAIN_LENGTH = 10;
constexpr int K_REMQUE_INDEX_DELTA = 2;
} // namespace

struct Q {
    struct Q* n;
    struct Q* p;
    int i;
};

static struct Q* NewNode(int i)
{
    struct Q* node = (struct Q*)malloc(sizeof(struct Q));
    if (node == nullptr) {
        return nullptr;
    }
    node->i = i;
    return node;
}

int SearchInsqueTest()
{
    int status = SUCCESS_CODE;
    struct Q* nodes[K_INSQUE_CHAIN_LENGTH] = { nullptr };
    int nodeCount = 0;

    struct Q* cur = NewNode(0);
    if (cur == nullptr) {
        LibcTestError(&status, "%s malloc failed\n", __func__);
        return status;
    }
    nodes[nodeCount++] = cur;
    struct Q* p;
    int i;

    insque(cur, nullptr);
    for (i = 1; i < K_INSQUE_CHAIN_LENGTH; i++) {
        struct Q* next = NewNode(i);
        if (next == nullptr) {
            LibcTestError(&status, "%s malloc failed\n", __func__);
            for (int k = 0; k < nodeCount; ++k) {
                free(nodes[k]);
            }
            return status;
        }
        nodes[nodeCount++] = next;
        insque(next, cur);
        cur = cur->n;
    }
    p = cur;
    while (cur) {
        if (cur->i != --i) {
            LibcTestError(&status, "walking queue: got %d, wanted %d\n", cur->i, i);
        }
        cur = cur->p;
    }
    remque(p->p);
    if (p->p->i != p->i - K_REMQUE_INDEX_DELTA) {
        LibcTestError(&status, "remque: got %d, wanted %d\n", p->p->i, p->i - K_REMQUE_INDEX_DELTA);
    }
    if (p->p->n->i != p->i) {
        LibcTestError(&status, "remque: got %d, wanted %d\n", p->p->n->i, p->i);
    }
    for (int k = 0; k < nodeCount; ++k) {
        free(nodes[k]);
    }
    return status;
}
