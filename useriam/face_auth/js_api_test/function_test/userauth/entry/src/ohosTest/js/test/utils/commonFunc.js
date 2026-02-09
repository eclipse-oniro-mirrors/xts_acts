/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import userAuth from '@ohos.userIAM.userAuth'

async function checkSupportOrNot(authTypeJudge) {
    try {
        userAuth.getAvailableStatus(authTypeJudge, 10000);
        console.log("checkSupportOrNot : This device supports " + 'authType:' + authTypeJudge);
        return 0;
    } catch (e) {
        if (e.code == 12500005 || e.code == 5) {
            console.log("checkSupportOrNot :This device not supports " + 'authType: ' + authTypeJudge);
            return -1;
        } else {
            console.log("checkSupportOrNot : Get other error : " + e + ' authType: ' + authTypeJudge + ' e.code: ' + e.code);
            return 0;
        }
    }
}

export { checkSupportOrNot };