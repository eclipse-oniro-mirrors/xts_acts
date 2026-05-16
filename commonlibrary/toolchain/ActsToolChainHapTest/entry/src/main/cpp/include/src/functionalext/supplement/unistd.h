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

#ifndef SRC_FUNCTIONALEXT_SUPPLEMENT_UNISTD_H_H
#define SRC_FUNCTIONALEXT_SUPPLEMENT_UNISTD_H_H

int AccessTest();
int AlarmTest();
int ChdirTest();
int CtermidTest();
int FchdirTest();
int GetcwdTest();
int GetgroupsTest();
int GetloginTest();
int GetloginRTest();
int GetpgrpTest();
int GetpgidTest();
int GetppidTest();
int GetsidTest();
int GethostnameTest();
int LinkTest();
int NiceTest();
int PauseTest();
int Pipe2Test();
int SetpgrpTest();
int SetsidTest();
int SetuidTest();
int SleepTest();
int UsleepTest();
int WriteTest();
int WritevTest();

int Dup3TestCompat();
int FaccessatTest();
int FchownTest();
int FchownatTest();
int FdatasyncTest();
int FsyncTest();
int FtruncateTest();
int GetcwdTest();
int GetgroupsTest();
int GetloginTest();
int GetloginRTest();
int GetpgidTest();
int GetpgrpTest();
int GetppidTest();
int GetsidTest();
int LinkTest();
int PauseTest();
int Pipe2Test();
int ReadTest();
int ReadvTest();
int RenameatTest();
int SetsidTest();
int SleepTest();
int SymlinkatTest();
int TtynameRTest();
int UnlinkTest();
int UnlinkatTest();
int UsleepTest();
int WritevTest();
#endif // SRC_FUNCTIONALEXT_SUPPLEMENT_UNISTD_H_H
