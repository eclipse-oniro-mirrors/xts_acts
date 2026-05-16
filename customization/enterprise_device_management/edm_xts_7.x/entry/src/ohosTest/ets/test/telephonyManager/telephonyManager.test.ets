/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { ENTINFO1, SELFWANT, SELFHAPNAME, TEST_APP_ID_1, TEST_POLICY_NAME, TEST_POLICY_VALUE, INVALID_WANT } from '../commom.test.ets';

import adminManager from '@ohos.enterprise.adminManager';
import telephonyManager from '@ohos.enterprise.telephonyManager';
import restrictions from '@ohos.enterprise.restrictions';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import call from '@ohos.telephony.call';

const PARAM_DISABLE_SLOT0: string = "persist.edm.disable_slot_0";
const PARAM_DISABLE_SLOT1: string = "persist.edm.disable_slot_1";
const LABEL_TELEPHONY_CALL: string = "telephoneCall";

export default function telephonyManagerTest() {
  describe('telephonyManager_test', () => {

  })
}