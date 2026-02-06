import huks from '@ohos.security.huks';
import { GetEmptyOptions, SetParam } from './HuksOptionsUtils';

export function GetWrapKeyOptions() {
  let huksOptions: huks.HuksOptions = GetEmptyOptions();
  SetParam(huksOptions, huks.HuksTag.HUKS_TAG_KEY_WRAP_TYPE, huks.HuksKeyWrapType.HUKS_KEY_WRAP_TYPE_HUK_BASED);
  return huksOptions;
}

export function GetGenWrapKeyOptions() {
  let huksOptions: huks.HuksOptions = GetEmptyOptions();
  SetParam(huksOptions, huks.HuksTag.HUKS_TAG_IS_ALLOWED_WRAP, true);
  return huksOptions;
}
