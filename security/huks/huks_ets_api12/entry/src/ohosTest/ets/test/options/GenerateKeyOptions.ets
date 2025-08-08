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
import { SetParam } from '../utils/HuksOptionUtil';

export function GetAesGenerateOption(size: number): huks.HuksOptions {
  let huksOption: huks.HuksOptions = {
    properties: new Array()
  };
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES);
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, size);
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
  return huksOption;
}

export function GetRsaGenerateOption(size: number): huks.HuksOptions {
  let huksOption: huks.HuksOptions = {
    properties: new Array()
  };
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_RSA);
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, size);
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
  return huksOption;
}

export function GetHmacGenerateOption(size: number): huks.HuksOptions {
  let huksOption: huks.HuksOptions = {
    properties: new Array()
  };
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_HMAC);
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, size);
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_MAC);
  return huksOption;
}

export function GetEccGenerateOption(size: number): huks.HuksOptions {
  let huksOption: huks.HuksOptions = {
    properties: new Array()
  };
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ECC);
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, size);
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
  return huksOption;
}

export function GetEd25519GenerateOption(size: number): huks.HuksOptions {
  let huksOption: huks.HuksOptions = {
    properties: new Array()
  };
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ED25519);
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, size);
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
  return huksOption;
}

export function GetX25519GenerateOption(size: number): huks.HuksOptions {
  let huksOption: huks.HuksOptions = {
    properties: new Array()
  };
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_X25519);
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, size);
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
  return huksOption;
}

export function GetDsaGenerateOption(size: number): huks.HuksOptions {
  let huksOption: huks.HuksOptions = {
    properties: new Array()
  };
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_DSA);
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, size);
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
  return huksOption;
}

export function GetDhGenerateOption(size: number): huks.HuksOptions {
  let huksOption: huks.HuksOptions = {
    properties: new Array()
  };
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_DH);
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, size);
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
  return huksOption;
}

export function GetSm2GenerateOption(size: number): huks.HuksOptions {
  let huksOption: huks.HuksOptions = {
    properties: new Array()
  };
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_SM2);
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, size);
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
  return huksOption;
}

export function GetSm4GenerateOption(size: number): huks.HuksOptions {
  let huksOption: huks.HuksOptions = {
    properties: new Array()
  };
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_SM4);
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, size);
  SetParam(huksOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
  return huksOption;
}