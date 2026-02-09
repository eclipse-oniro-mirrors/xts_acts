/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 #ifndef ARKUI_CAPI_XTS_SNAP_TEST_H
 #define ARKUI_CAPI_XTS_SNAP_TEST_H
 
 #include <ace/xcomponent/native_interface_xcomponent.h>
 #include "container.h"
 #include "../common/common.h"
 
 namespace ArkUICapiTest {
 
      class Manager {
      public:
          ~Manager();
  
          static Manager *GetInstance() { return &Manager::manager_; }
  
          static napi_value GetContext(napi_env env, napi_callback_info info);
          static napi_value CreatePixelMapTest(napi_env env, napi_callback_info info);
          static napi_value CreateNativeNode(napi_env env, napi_callback_info info);
          static napi_value UpdateNativeNode(napi_env env, napi_callback_info info);
  
          void SetNativeXComponent(std::string &id, OH_NativeXComponent *nativeXComponent);
          OH_NativeXComponent *GetNativeXComponent(const std::string &id);
  
          NativeXComponentSample::Container *GetContainer(std::string &id);
          void Export(napi_env env, napi_value exports);
  
          static ArkUI_NodeHandle dragEventTest(ArkUI_NativeNodeAPI_1 *nodeAPI);
         static napi_value GetResult(napi_env env, napi_callback_info info);
         static std::vector<int32_t> result;
  
      private:
          static Manager manager_;
  
          std::unordered_map<std::string, OH_NativeXComponent *> nativeXComponentMap_;
          std::unordered_map<std::string, NativeXComponentSample::Container *> containerMap_;
      };
 } // namespace ArkUICapiTest
 #endif // ARKUI_CAPI_XTS_DRAG_TEST_H