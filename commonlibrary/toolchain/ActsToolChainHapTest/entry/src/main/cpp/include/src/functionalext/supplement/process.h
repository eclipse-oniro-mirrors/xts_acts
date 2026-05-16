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

#ifndef SRC_FUNCTIONALEXT_SUPPLEMENT_PROCESS_H_H
#define SRC_FUNCTIONALEXT_SUPPLEMENT_PROCESS_H_H

int ExeclTest();
int ExeclpTest();
int ExecvTest();
int ExecveTest();
int ExecvpTest();
int ExecvpeTest();

int FexecveTest();
int FexecverelyTest();
int PosixSpawnTest();
int PosixSpawnattrGetflagsTest();
int PosixSpawnattrGetpgroupTest();
int PosixSpawnattrGetsigdefaultTest();
int PosixSpawnattrGetsigmaskTest();
int PosixSpawnattrSetflagsTest();
int PosixSpawnattrSetpgroupTest();
int PosixSpawnattrSetsigdefaultTest();
int PosixSpawnattrSetsigmaskTest();
int PosixSpawnpTest();
int PosixSpawnFileActionsAddopenTest();
int WaitidTest();
#endif // SRC_FUNCTIONALEXT_SUPPLEMENT_PROCESS_H_H
