import huks from '@ohos.security.huks';
import { StringToUint8Array } from '../CommonUtils';
import { GenParam } from './HuksOptionsUtils';

export function GetEcdhAgreeOptions(size: number): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ECDH),
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE),
      GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, size),
    )
  }
  return huksOptions;
}

export function GetPbkdf2DeriveOptions(size: number): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_PBKDF2),
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE),
      GenParam(huks.HuksTag.HUKS_TAG_ITERATION, 1000),
      GenParam(huks.HuksTag.HUKS_TAG_SALT, StringToUint8Array("1234567812345678")),
      GenParam(huks.HuksTag.HUKS_TAG_DERIVE_KEY_SIZE, size),
    )
  }
  return huksOptions;
}

export function GetHkdfDeriveOptions(size: number): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_HKDF),
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE),
      GenParam(huks.HuksTag.HUKS_TAG_DERIVE_KEY_SIZE, size),
    )
  }
  return huksOptions;
}

export function GetHmacDeriveOptions(size: number): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_HMAC),
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE),
      GenParam(huks.HuksTag.HUKS_TAG_DERIVE_KEY_SIZE, size),
    )
  }
  return huksOptions;
}

export function GetSha256Options(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256),
    )
  }
  return huksOptions;
}

export function GetSha384Options(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA384),
    )
  }
  return huksOptions;
}

export function GetSha512Options(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA512),
    )
  }
  return huksOptions;
}

export function GetDeriveAgreeFinishOptions(keyAlias: string): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG, huks.HuksKeyStorageType.HUKS_STORAGE_ONLY_USED_IN_HUKS),
      GenParam(huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(keyAlias))
    )
  }
  return huksOptions;
}

export async function Derive(keyAlias: string, initOption: huks.HuksOptions, finishOption: huks.HuksOptions): Promise<huks.HuksReturnResult> {
  let handle: number = (await huks.initSession(keyAlias, initOption)).handle;
  await huks.updateSession(handle, initOption);
  return await huks.finishSession(handle, finishOption);
}

export async function Agree(keyAlias: string, initOption: huks.HuksOptions, finishOption: huks.HuksOptions): Promise<huks.HuksReturnResult> {
  return await Derive(keyAlias, initOption, finishOption);
}

export async function Mac(keyAlias: string, macOption: huks.HuksOptions): Promise<huks.HuksReturnResult> {
  let handle: number = (await huks.initSession(keyAlias, macOption)).handle;
  return huks.finishSession(handle, macOption);
}