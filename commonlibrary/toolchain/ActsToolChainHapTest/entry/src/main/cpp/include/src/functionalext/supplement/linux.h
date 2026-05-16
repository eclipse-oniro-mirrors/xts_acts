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

#ifndef SRC_FUNCTIONALEXT_SUPPLEMENT_LINUX_H_H
#define SRC_FUNCTIONALEXT_SUPPLEMENT_LINUX_H_H

int PpollTime64Test();
int AdjtimexTest();
int BrkTest();
int CapgetTest();
int CapsetTest();
int ChrootTest();
int ClockAdjtimeTest();
int CloneTest();
int CopyFileRangeTest();
int EpollCreate1Test();
int EpollCreateTest();
int EpollCtlTest();
int EpollPwaitTest();
int EpollWaitTest();
int EventfdTest();
int EventfdReadTest();
int EventfdWriteTest();
int FlistxattrTest();
int FremovexattrTest();
int FsetxattrTest();
int GetdentsTest();
int NameToHandleAtTest();
int ProcessVmTest();
int RemapFilePagesTest();
int RemovexattrTest();
int SbrkTest();
int SelectTest();
int SendfileTest();
int SetdomainnameTest();
int SetxattrTest();
int SwapoffTest();
int SwaponTest();
int TeeTest();
int TimerfdGettimeTest();
int TimerfdSettimeTest();

int ClockAdjtimeTest();
int FallocateTest();
int FanotifyInitTest();
int FgetxattrTest();
int FlockTest();
int GetrandomTest();
int InotifyTest();
int InotifyInit1Test();
int MembarrierTest();
int MemfdCreateTest();
int Mlock2Test();
int PersonalityTest();
int PpollTest();
int PrctlTest();
int PrlimitTest();
int QuotactlTest();
int SetfsgidTest();
int SetfsuidTest();
int SignalfdTest();
int SysinfoTest();
int TimerfdCreateTest();
int UtimesTest();
int VmspliceTest();
int PpollTime64CompatTest();
#endif // SRC_FUNCTIONALEXT_SUPPLEMENT_LINUX_H_H
