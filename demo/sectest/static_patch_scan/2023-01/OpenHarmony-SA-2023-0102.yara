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
import "console"
import "elf"

rule OpenHarmony_SA_2023_0102
{
 meta:
   date="2023-02-17"
   openharmony_sa="OpenHarmony-SA-2023-0102"
   cve="CVE-2023-0036"
   affected_files="libinputmethod_service.z.so"
  
 strings:
   /*
		.text:00045E0E                 LDRB.W          R3, [SP,#0x68+var_34]
		.text:00045E12                 ADD             R0, PC  ; 
		.text:00045E14                 LDR             R2, [SP,#0x68+var_30]

   */

        $fix={9D F8 34 30 78 44 0E 9A}
  
 condition: 
   $fix and console.log("OpenHarmony-SA-2023-0102 testcase pass") 
 }
 