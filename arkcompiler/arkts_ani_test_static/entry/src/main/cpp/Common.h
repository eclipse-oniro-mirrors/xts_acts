/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef ARKTS_ANI_TEST_COMMON_H
#define ARKTS_ANI_TEST_COMMON_H
#include <cstdio>
#include <array>
#include <iostream>
#include <string>
#include "ani/ani.h"
#include "hilog/log.h"

const uint32_t ANI_RES_INVALID_ARGS = 2;
const uint32_t ANI_RES_INVALID_TYPE = 3;
const uint32_t ANI_RES_OUT_OF_REF = 9;
const ani_size SPECIFIED_CAPACITY = 60;
const ani_size LENGTH_5 = 5;
const ani_int TEST_INT_VAL1 = 5;
const ani_int TEST_INT_VAL2 = 6;


#define ASSERT_EQ(a, b) \
    do { \
        if ((a) != (b)) { \
            return ANI_FALSE; \
        } \
    } while (0)

#define ASSERT_NE(a, b) \
    do { \
        if ((a) == (b)) { \
            return ANI_FALSE; \
        } \
    } while (0)

ani_boolean GetClsData(ani_env *env, ani_object *objectResult, ani_class *outCls)
{
    ani_class cls {};
    if (env->FindClass("Lentry/src/main/src/ets/Index/Foo;", &cls) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, " FindClass Failed");
        return ANI_FALSE;
    }
    if (cls == nullptr) {
        OH_LOG_INFO(LOG_APP, " FindClass cls is nullptr");
        return ANI_FALSE;
    }

    ani_static_method newMethod;
    if (env->Class_FindStaticMethod(cls, "new_Foo", ":Lentry/src/main/src/ets/Index/Foo;", &newMethod) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, " Class_FindStaticMethod Failed");
        return ANI_FALSE;
    }

    ani_ref ref;
    if (env->Class_CallStaticMethod_Ref(cls, newMethod, &ref) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, " Class_CallStaticMethod_Ref Failed");
        return ANI_FALSE;
    }

    *objectResult = static_cast<ani_object>(ref);
    *outCls = cls;
    return ANI_TRUE;
}

ani_boolean GetClsByClassCallingName(ani_env *env, const char *class_descriptor, ani_class *cls)
{
    std::string classDescriptor = "Lentry/src/main/src/ets/ClassCallingStaticMethods/";
    std::string classDesc = classDescriptor.append(class_descriptor);
    OH_LOG_INFO(LOG_APP, "GetClsByClassCallingName classDesc %{public}s", classDesc.c_str());
    auto status = env->FindClass(classDesc.c_str(), cls);
    if (status != ANI_OK || cls == nullptr) {
        OH_LOG_INFO(LOG_APP, "GetClsByClassCallingName status is %{public}d", status);
        return ANI_FALSE;
    }
    return ANI_TRUE;
}

#endif //ARKTS_ANI_TEST_COMMON_H
