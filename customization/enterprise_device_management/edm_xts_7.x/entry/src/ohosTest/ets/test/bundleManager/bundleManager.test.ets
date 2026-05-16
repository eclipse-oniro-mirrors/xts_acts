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
import { describe, beforeAll, expect, it, Level } from '@ohos/hypium';
import {
  BUNDLENAME1,
  ENTINFO1,
  SELFWANT,
  SELFHAPNAME,
  SUBSCRIBE_EVENTS,
  APP_IDS_1,
  APP_IDS_200,
  APP_IDS_201,
  APP_IDS_AND_IDENTIFIER_1,
  DEFAULT_USER_ID,
  INVALID_USER_ID,
  HAP_FILE_PATH,
  EDM_INSTALL_PARAM,
  EDM_INSTALL_PARAM_FOR_ALL_USER,
  HAP_FILE_PATH_ERROR,
  MARKET_APPS,
  ERROR_MARKET_APPS,
  bundleNamesInit,
  bundleNamesOneRealInit,
  BUNDLE_NAME_ONE_REAL_200,
  BUNDLE_NAME_201
} from '../commom.test.ets';

import adminManager from '@ohos.enterprise.adminManager';
import bundleManager from '@ohos.enterprise.bundleManager';
import systemparameter from '@ohos.systemparameter';
import { BusinessError } from '@kit.BasicServicesKit';

export default function bundleManagerTest() {
  describe('bundleManager_test', () => {
    
  })
}
