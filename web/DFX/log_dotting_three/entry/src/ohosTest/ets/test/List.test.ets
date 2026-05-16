/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import webViewSdkSchemeHandlerDidFail from './webViewSdkSchemeHandlerDidFail.test'
import webViewSdkSchemeHandlerDidFailWan2 from './webViewSdkSchemeHandlerDidFailWan2.test'
import webViewSdkSchemeHandlerDidFail3 from './webViewSdkSchemeHandlerDidFail3.test'
import webViewSdkSchemeHandlerDidFail3_2 from './webViewSdkSchemeHandlerDidFail3_2.test'

export default function testsuite() {
  webViewSdkSchemeHandlerDidFail()
  webViewSdkSchemeHandlerDidFail3_2()
  webViewSdkSchemeHandlerDidFailWan2()
  webViewSdkSchemeHandlerDidFail3()
}
