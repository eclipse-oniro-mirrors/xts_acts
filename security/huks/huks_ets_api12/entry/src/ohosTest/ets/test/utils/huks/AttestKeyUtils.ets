import { huks } from '@kit.UniversalKeystoreKit';
import { StringToUint8Array } from '../CommonUtils';
import { GenParam } from './HuksOptionsUtils';

export function GetAttestKeyOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO, StringToUint8Array("sec_level")),
      GenParam(huks.HuksTag.HUKS_TAG_ATTESTATION_CHALLENGE, StringToUint8Array("challenge_data")),
      GenParam(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_VERSION_INFO, StringToUint8Array("version_info")),
      GenParam(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_ALIAS, StringToUint8Array("keyAlias"))
    )
  };
  return huksOptions;
}