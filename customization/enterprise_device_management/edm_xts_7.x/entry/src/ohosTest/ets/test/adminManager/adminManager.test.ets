/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, expect, it, Level } from '@ohos/hypium';
import Want from '@ohos.app.ability.Want'
import { ENTINFO1, SELFWANT, SELFHAPNAME, SUBSCRIBE_EVENTS, SUBSCRIBE_INVALID_EVENTS,
  BUNDLENAME1, INVALID_WANT, PARAMETERS_LOWER_BOUND, INVALID_PARAMETERS, INVALID_PARAMETERS_LOWER_THAN_UPPER_BOUND,
  OTHER_WANT, NOT_EXIST_WANT, DEFAULT_USER_ID, TEST_BUNDLENAME
} from '../commom.test.ets';

import adminManager from '@ohos.enterprise.adminManager';
import sysDeviceInfo from '@ohos.deviceInfo';

const DELEGATED_POLICIES: Array<string> = [ "set_browser_policies" ];

export default function adminManagerTest() {
  describe('adminManager_test', () => {
    

  })
}