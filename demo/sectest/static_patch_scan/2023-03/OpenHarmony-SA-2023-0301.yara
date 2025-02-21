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


rule OpenHarmony_SA_2023_0301
{
    meta:
    	date = "2023-03-08"
    	openharmony_sa = "OpenHarmony-SA-2023-0301"
    	cve = "CVE-2023-24465"
    	severity = "medium"
    	affacted_files = "libwifi_scan_ability.z.so"
    	affected_func = "WifiScanStub::OnScanByParams"
    	
    strings:
        $features = "run OnScanByParams code %{public}u, datasize %{public}zu" nocase wide ascii
	
	/* 3.1.4 vul code
		.text:0000B0D0 01 46                                           MOV             R1, R0
		.text:0000B0D2 20 46                                           MOV             R0, R4
	*/
		$vul = {01 46 ?? 46}

	/* 3.1.4 with patch
		.text:0000B0DA 7D 44                                           ADD             R5, PC  ; ""
		.text:0000B0DC 08 BF                                           IT EQ
		.text:0000B0DE 29 46                                           MOVEQ           R1, R5
	*/
		$fix = {7? 44 08 BF ?? 46}


    condition:
        (elf.machine == elf.EM_ARM) and $features and ((not $vul) or $fix) and console.log("OpenHarmony-SA-2023-0301 testcase pass")
        
}