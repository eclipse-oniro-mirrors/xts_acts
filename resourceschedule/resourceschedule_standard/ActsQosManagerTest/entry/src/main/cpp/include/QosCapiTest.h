/*
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

#ifndef ACTSQOSMANAGERTEST_QOS_CAPI_TEST_H
#define ACTSQOSMANAGERTEST_QOS_CAPI_TEST_H

namespace Acts {
namespace QosManager {

// Thread QoS Tests
int SetThreadQoSNdkTest();
int ResetThreadQoSNdkTest();
int GetThreadQoSNdkTest();
int ThreadQoSNdkTest();

// Gewu API Tests
int GewuCreateSessionTest();
int GewuSubmitRequestTest();
int GewuAbortRequestTest();
int GewuDestroySessionTest();
int GewuErrorCodeTest();

} // namespace QosManager
} // namespace Acts

#endif // ACTSQOSMANAGERTEST_QOS_CAPI_TEST_H
