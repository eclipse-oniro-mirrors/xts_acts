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
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';


let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let format:string = '%{public}s'

function checkSupportOrNot(authTypeJudge:userAuth.UserAuthType) {
  try {
    userAuth.getAvailableStatus(authTypeJudge, userAuth.AuthTrustLevel.ATL1);
    hilog.info(domain, tag, format, "checkSupportOrNot : This device supports " + 'authType:' + authTypeJudge);
    return 0;
  } catch (e:BusinessError) {
    if (e.code == 12500005 || e.code == 5) {
      hilog.info(domain, tag, format, "checkSupportOrNot :This device not supports " + 'authType: ' + authTypeJudge);
      return -1;
    } else {
      hilog.info(domain, tag, format, "checkSupportOrNot : Get other error : " + e + ' authType: ' + authTypeJudge + ' e.code: ' + e.code);
      return 0;
    }
  }
}

export { checkSupportOrNot };