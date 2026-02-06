import { huks } from '@kit.UniversalKeystoreKit';
import { GenParam } from './HuksOptionsUtils';

export function GetAccessControlOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE, huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_PIN),
      GenParam(huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE, huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_NORMAL),
      GenParam(huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE, huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD)
    )
  };
  return huksOptions;
}

export function GetPinOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE, huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_PIN),
    )
  };
  return huksOptions;
}

export function GetTuiPinOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE, huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_TUI_PIN),
    )
  };
  return huksOptions;
}

export function GetFingerOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE, huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_FINGERPRINT),
    )
  };
  return huksOptions;
}

export function GetFaceOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE, huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_FACE),
    )
  };
  return huksOptions;
}

export function GetAlwaysValidOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE, huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_ALWAYS_VALID),
    )
  };
  return huksOptions;
}

export function GetClearPasswordOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE, huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD),
    )
  };
  return huksOptions;
}

export function GetNewBioEnrollOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE, huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL),
    )
  };
  return huksOptions;
}

export function GetChallengeNormalOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE, huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_NORMAL),
    )
  };
  return huksOptions;
}

export function GetChallengeNoneOptions(time: number): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE, huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_NONE),
      GenParam(huks.HuksTag.HUKS_TAG_AUTH_TIMEOUT, time),
    )
  };
  return huksOptions;
}

export function GetChallengeCustomOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE, huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_CUSTOM),
      GenParam(huks.HuksTag.HUKS_TAG_CHALLENGE_POS, huks.HuksChallengePosition.HUKS_CHALLENGE_POS_0),
    )
  };
  return huksOptions;
}