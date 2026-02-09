/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

#ifndef CONFIGURE_TEST_H
#define CONFIGURE_TEST_H

extern int VideoEncodeHevcCapability1800Test();
extern int VideoEncodeCapability4000Test();
extern int VideoEncodeCapability4400Test();
extern int VideoEncodeCapability4410Test();
extern int VideoEncodeCapability4700Test();
extern int VideoEncodeCapability4710Test();
extern int VideoEncodeCapability5000Test();
extern int VideoEncodeCapability5010Test();

extern void InitConfigureTest();
extern void TestTearDownConfigure();

#endif // CONFIGURE_TEST_H
