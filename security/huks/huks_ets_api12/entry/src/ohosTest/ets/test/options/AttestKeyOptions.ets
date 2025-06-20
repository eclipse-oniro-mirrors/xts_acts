/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { StringToUint8Array } from '../utils/CommonUtil';
import { SetParam } from '../utils/HuksOptionUtil';

const securityLevel = StringToUint8Array("sec_level");
const challenge = StringToUint8Array("challenge_data");
const versionInfo = StringToUint8Array("version_info");
const keyAlias = StringToUint8Array("keyAlias");

export function GetAttestKeyOption(): huks.HuksOptions {
  let huksOption: huks.HuksOptions = {
    properties: new Array()
  };
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO, securityLevel)
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_ATTESTATION_CHALLENGE, challenge)
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_ATTESTATION_ID_VERSION_INFO, versionInfo)
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_ATTESTATION_ID_ALIAS, keyAlias)
  return huksOption;
}