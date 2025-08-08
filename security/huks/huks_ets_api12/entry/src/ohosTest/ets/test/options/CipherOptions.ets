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
import { huks } from "@kit.UniversalKeystoreKit";
import { StringToUint8Array } from "../utils/CommonUtil";
import { SetParam } from "../utils/HuksOptionUtil";
import { GetAesGenerateOption } from "./GenerateKeyOptions";


export function GetAesGcmOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = GetAesGenerateOption(256);
  SetParam(huksOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
  SetParam(huksOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
  SetParam(huksOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_GCM);
  SetParam(huksOptions, huks.HuksTag.HUKS_TAG_NONCE, StringToUint8Array("120123456789"));
  SetParam(huksOptions, huks.HuksTag.HUKS_TAG_ASSOCIATED_DATA, StringToUint8Array("1601234567890123"));
  return huksOptions;
}

export function GetAesCbcOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = GetAesGenerateOption(256);
  SetParam(huksOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
  SetParam(huksOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7);
  SetParam(huksOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
  SetParam(huksOptions, huks.HuksTag.HUKS_TAG_IV, StringToUint8Array("120123456789"));
  return huksOptions;
}