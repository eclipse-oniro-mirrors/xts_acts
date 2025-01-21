/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

#include "napi/native_api.h"
#include <cerrno>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <ctime>
#include <js_native_api.h>
#include <malloc.h>
#include <node_api.h>
#include <search.h>
#include <string>
#include <unistd.h>
#include <vector>

#define PARAM_0 0
#define PARAM_5 5
#define PARAM_27 27
#define PARAM_1 1
#define PARAM_3 3
#define PARAM_123 123
#define PARAM_456 456
#define PARAM_2 2
#define PARAM_8 8
#define PARAM_UNNORMAL (-1)
#define ERRON_0 0
#define TWICE 12
#define ARRAY_SIZE (10)
#define FAIL (-1)
#define NOERR 0
#define VALUE_ONE 1
#define VALUE_TWO 1
#define BUFFERSIZE 128
#define LOOPNUM 12

static napi_value Hcreate(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret = FAIL;
    if (param == PARAM_0) {
        ret = hcreate(PARAM_8);
        hdestroy();
    }
    if (ret > PARAM_0) {
        ret = NOERR;
    } else {
        ret = FAIL;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value HcreateR(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret = FAIL;
    errno = PARAM_0;
    struct hsearch_data data;
    if (param == PARAM_0) {
        ret = hcreate_r(PARAM_8, &data);
        hdestroy_r(&data);
    }
    if (ret > PARAM_0) {
        ret = NOERR;
    } else {
        ret = FAIL;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Hdestroy(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret = FAIL;
    if (param == PARAM_0) {
        hcreate(PARAM_8);
        errno = ERRON_0;
        hdestroy();
    }
    if (errno == ERRON_0) {
        ret = NOERR;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value HdestroyR(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret = FAIL;
    struct hsearch_data data;
    if (param == PARAM_0) {
        hcreate_r(PARAM_8, &data);
        errno = ERRON_0;
        hdestroy_r(&data);
    }
    if (errno == ERRON_0) {
        ret = NOERR;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static char data[][30] = {"test_search_1", "test_search_2"};

static napi_value Hsearch(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    ENTRY e;
    ENTRY *ep;
    int i;
    hcreate(PARAM_2);
    for (i = PARAM_0; i < PARAM_2; i++) {
        e.key = data[i];
        e.data = (void *)i;
        ep = hsearch(e, ENTER);
        if (ep == nullptr) {
            ret = FAIL;
            goto exit;
        }
    }

    if (param == PARAM_0) {
        for (i = PARAM_0; i < PARAM_2; i++) {
            e.key = data[i];
            ep = hsearch(e, FIND);
            if (ep == nullptr) {
                ret = FAIL;
                goto exit;
            }
        }
        ret = NOERR;
    } else {
        char key[] = "test_search_null";
        e.key = key;
        ep = hsearch(e, FIND);
        if (ep == nullptr) {
            ret = FAIL;
        } else {
            ret = NOERR;
        }
    }

exit:
    hdestroy();
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value HsearchR(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    struct hsearch_data hdata = {};
    ENTRY e;
    ENTRY *ep;
    hcreate_r(PARAM_2, &hdata);
    for (int i = PARAM_0; i < PARAM_2; i++) {
        e.key = data[i];
        e.data = (void *)i;
        ret = hsearch_r(e, ENTER, &ep, &hdata);
        if (ret == PARAM_0) {
            ret = FAIL;
            goto exit;
        }
    }
    if (param == PARAM_0) {
        for (int i = PARAM_0; i < PARAM_2; i++) {
            e.key = data[i];
            ret = hsearch_r(e, FIND, &ep, &hdata);
            if (ret == PARAM_0) {
                ret = FAIL;
                goto exit;
            }
        }
        ret = NOERR;
    } else {
        char key[] = "test_search_null";
        e.key = key;
        ret = hsearch_r(e, FIND, &ep, &hdata);
        if (ret == PARAM_0) {
            ret = FAIL;
        } else {
            ret = NOERR;
        }
    }

exit:
    hdestroy_r(&hdata);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

struct element {
    struct element *prev;
    struct element *next;
    int i;
};

static struct element *new_element(int i)
{
    struct element *e = (struct element *)malloc(sizeof(struct element));
    e->i = i;
    return e;
}

static napi_value Insque(napi_env env, napi_callback_info info)
{
    int ret = NOERR;
    int i;
    struct element *elem = new_element(PARAM_0);
    insque(elem, PARAM_0);
    for (i = PARAM_1; i < PARAM_3; i++) {
        insque(new_element(i), elem);
        elem = elem->prev;
    }
    while (elem) {
        if (elem->i != --i) {
            ret = FAIL;
        }
        elem = elem->next;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static int compare(const void *pa, const void *pb)
{
    if (*static_cast<const int *>(pa)< *static_cast<const int *>(pb))
        return PARAM_UNNORMAL;
    if (*static_cast<const int *>(pa)> *static_cast<const int *>(pb))
        return PARAM_1;
    return PARAM_0;
}

static napi_value Lfind(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int *ret;
    int key;
    int array[5] = {1, 2, 3, 4, 5};
    size_t nlength = PARAM_5;
    if (param == PARAM_0) {
        key = PARAM_5;
    } else {
        key = PARAM_0;
    }
    ret = static_cast<int*>(lfind(&key, array, &nlength, sizeof(int), compare));

    napi_value result = nullptr;
    if (!ret) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, NOERR, &result);
    }
    return result;
}

static napi_value LSearch(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int *ret = nullptr;
    int key = PARAM_5;
    int array[5] = {1, 2, 3, 4, 5};
    size_t nlength = PARAM_5;
    if (param == PARAM_0) {
        ret = static_cast<int*>(lsearch(&key, array, &nlength, sizeof(int), compare));
    }

    napi_value result = nullptr;
    if (!ret) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, NOERR, &result);
    }
    return result;
}

static napi_value Remque(napi_env env, napi_callback_info info)
{
    int ret = NOERR;
    int i;
    struct element *elem = new_element(PARAM_0);
    insque(elem, PARAM_0);
    for (i = PARAM_1; i < PARAM_5; i++) {
        insque(new_element(i), elem);
        elem = elem->prev;
    }
    remque(elem->next);
    if (elem->next->i != elem->i - PARAM_2) {
        ret = FAIL;
    }
    if (elem->next->prev->i != elem->i) {
        ret = FAIL;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

struct PodNode {
    explicit PodNode(int i) : i(i) {}
    int i;
};
static int PodNode_cmp(const void *lhs, const void *rhs)
{
    return reinterpret_cast<const PodNode *>(rhs)->i - reinterpret_cast<const PodNode *>(lhs)->i;
}

static napi_value Tdelete(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret = NOERR;
    void *root = nullptr;
    PodNode n1(PARAM_123);
    tsearch(&n1, &root, PodNode_cmp);
    if (param == PARAM_0) {
        if (tdelete(&n1, &root, PodNode_cmp) == nullptr) {
            ret = FAIL;
        }
    } else {
        PodNode not_there(PARAM_456);
        if (tdelete(&not_there, &root, PodNode_cmp) == nullptr) {
            ret = FAIL;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

struct Node {
    explicit Node(const char *s) : s(strdup(s)) {}
    char *s;
};
static int NodeCmp(const void *lhs, const void *rhs)
{
    return strcmp(reinterpret_cast<const Node *>(lhs)->s, reinterpret_cast<const Node *>(rhs)->s);
}
static size_t g_freeCalls;
static void node_free(void *p)
{
    Node *n = reinterpret_cast<Node *>(p);
    free(n->s);
    ++g_freeCalls;
}
static napi_value Tdestroy(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    void *root = nullptr;
    Node n1("z");
    Node n2("a");
    Node n3("m");
    tsearch(&n1, &root, NodeCmp);
    tsearch(&n2, &root, NodeCmp);
    tsearch(&n3, &root, NodeCmp);
    g_freeCalls = PARAM_0;
    tdestroy(root, node_free);
    if (g_freeCalls == 3U) {
        ret = NOERR;
    }
    g_freeCalls = PARAM_0;

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Tfind(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret = NOERR;
    void *root = nullptr;
    Node n1("z");
    if (param == PARAM_0) {
        void *i1 = tsearch(&n1, &root, NodeCmp);
        if (tfind(&n1, &root, NodeCmp) != i1) {
            ret = FAIL;
        }
    } else {
        if (tfind(&n1, &root, NodeCmp) == nullptr) {
            ret = FAIL;
        }
    }
    tdestroy(root, node_free);
    g_freeCalls = PARAM_0;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Tsearch(napi_env env, napi_callback_info info)
{
    int ret = NOERR;
    void *root = nullptr;
    Node n1("z");
    void *i1 = tsearch(&n1, &root, NodeCmp);
    if (i1 == nullptr) {
        ret = FAIL;
    }
    tdestroy(root, node_free);
    g_freeCalls = PARAM_0;

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static std::vector<std::string> g_nodes;
static void NodeWalk(const void *p, VISIT order, int)
{
    const Node *n = *reinterpret_cast<const Node *const *>(p);
    if (order == postorder || order == leaf) {
        g_nodes.push_back(n->s);
    }
}
static napi_value Twalk(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    void *root = nullptr;

    Node n1("z");
    Node n2("a");
    Node n3("m");
    tsearch(&n1, &root, NodeCmp);
    tsearch(&n2, &root, NodeCmp);
    tsearch(&n3, &root, NodeCmp);

    g_nodes.clear();
    twalk(root, NodeWalk);
    if (g_nodes.size() == 3U) {
        ret = NOERR;
    }

    tdestroy(root, node_free);
    g_freeCalls = PARAM_0;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"hcreate", nullptr, Hcreate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hcreateR", nullptr, HcreateR, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hdestroy", nullptr, Hdestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hdestroyR", nullptr, HdestroyR, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hsearch", nullptr, Hsearch, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hsearchR", nullptr, HsearchR, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"insque", nullptr, Insque, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lfind", nullptr, Lfind, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lSearch", nullptr, LSearch, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"remque", nullptr, Remque, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tdelete", nullptr, Tdelete, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tdestroy", nullptr, Tdestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tfind", nullptr, Tfind, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tsearch", nullptr, Tsearch, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"twalk", nullptr, Twalk, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}

EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = "searchndk1",
    .nm_register_func = Init,
    .nm_modname = "libsearchndk1",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
