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
import { GetDataBySize, StringToUint8Array } from '../common/CommonUtils';
import { GenParam } from './HuksOptionsUtils';

export function GetGcmNoPaddingOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
      GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_GCM),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE),
      GenParam(huks.HuksTag.HUKS_TAG_NONCE, StringToUint8Array("120123456789")),
      GenParam(huks.HuksTag.HUKS_TAG_ASSOCIATED_DATA, StringToUint8Array("1601234567890123"))
    )
  };
  return huksOptions;
}

export function GetCcmNoPaddingOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
      GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CCM),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE),
      GenParam(huks.HuksTag.HUKS_TAG_NONCE, StringToUint8Array("7012345")),
      GenParam(huks.HuksTag.HUKS_TAG_ASSOCIATED_DATA, StringToUint8Array("1601234567890123"))
    )
  };
  return huksOptions;
}

export function GetCbcNoPaddingOptions(size: number): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
      GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE),
      GenParam(huks.HuksTag.HUKS_TAG_IV, StringToUint8Array(GetDataBySize(size)))
    )
  };
  return huksOptions;
}

export function GetCbcPkcs7Options(ivSize: number): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
      GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7),
      GenParam(huks.HuksTag.HUKS_TAG_IV, StringToUint8Array(GetDataBySize(ivSize)))
    )
  };
  return huksOptions;
}

export function GetCtrNoPaddingOptions(size: number): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
      GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CTR),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE),
      GenParam(huks.HuksTag.HUKS_TAG_IV, StringToUint8Array(GetDataBySize(size)))
    )
  };
  return huksOptions;
}

export function GetCfbNoPaddingOptions(ivSize: number): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
      GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CFB),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE),
      GenParam(huks.HuksTag.HUKS_TAG_IV, StringToUint8Array(GetDataBySize(ivSize)))
    )
  };
  return huksOptions;
}

export function GetOfbNoPaddingOptions(size: number): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
      GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_OFB),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE),
      GenParam(huks.HuksTag.HUKS_TAG_IV, StringToUint8Array(GetDataBySize(size)))
    )
  };
  return huksOptions;
}

export function GetSm3NoPaddingOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SM3),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE),
    )
  };
  return huksOptions;
}

export function GetEcbNoPaddingOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
      GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE),
    )
  };
  return huksOptions;
}

export function GetEcbPkcs1Options(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
      GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS1_V1_5),
    )
  };
  return huksOptions;
}

export function GetEcbPkcs7Options(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
      GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7),
    )
  };
  return huksOptions;
}

export function GetEcbOaepSha256Options(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
      GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_OAEP),
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256),
    )
  };
  return huksOptions;
}

export function GetEcbOaepSha384Options(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
      GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_OAEP),
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA384),
    )
  };
  return huksOptions;
}

export function GetEcbOaepSha512Options(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
      GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_OAEP),
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA512),
    )
  };
  return huksOptions;
}