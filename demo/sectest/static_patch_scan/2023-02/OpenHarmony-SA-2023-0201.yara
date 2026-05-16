/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import "console"
import "elf"
rule OpenHarmony_SA_2023_0201
{
meta:

date = "2023-02"
openharmony_sa = "OpenHarmony-SA-2023-0201"
cve = "CVE-2023-0083"
severity = "low"
affected_files = "libace_engine_declarative_ark.z.so" //受影响于OpenHarmony-v3.1-Release到OpenHarmony-v3.1.5-Release


strings:

$fix = "The number of argument is less than 1, or the argument is not array."  //更新后字符串


condition:
 (elf.machine == elf.EM_ARM) and $fix and console.log("OpenHarmony-SA-2023-0201 testcase pass")
}