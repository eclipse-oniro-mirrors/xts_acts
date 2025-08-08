/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { huks } from '@kit.UniversalKeystoreKit';
import { SetParam } from '../utils/HuksOptionUtil';

export function GetAccessControlOptions(): huks.HuksOptions {
  let huksOption: huks.HuksOptions = {
    properties: new Array()
  };
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE, huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_PIN);
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE, huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_NORMAL);
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE, huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD);
  return huksOption;
}
