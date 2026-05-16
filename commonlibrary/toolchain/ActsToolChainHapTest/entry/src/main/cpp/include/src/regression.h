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

#ifndef SRC_REGRESSION_H_H
#define SRC_REGRESSION_H_H

int DaemonFailureTest();
int DnExpandEmptyTest();
int DnExpandPtr0Test();
int ExecleEnvTest();
int SetenvOomTestCompat();
int PthreadCreateOomTest();
int FtelloUnflushedAppendTestCompat();
int TlsGetNewDtvTest();
int MallocOomTest();

int ExecleEnvTestCompat();
int IconvRoundtripsTest();
int MallocDoubleFreeCheckTest();
int MallocEncodePointerTest();
int MallocFreePerformanceTest();
int MallocModifyPointerTest();
int MallocMultiThreadPerformanceTest();
int MallocSafeUnlinkTest();
int PthreadRobustDetachTest();
int PthreadCondSmasherTest();
int PthreadCondattrSetclockTest();
int PthreadOnceDeadlockTest();
int PthreadRwlockEbusyTest();
int RaiseRaceTest();
int SigaltstackTest();
int SscanfEofTest();
#endif // SRC_REGRESSION_H_H
