import { huks } from '@kit.UniversalKeystoreKit';
import { GetDataBySize, StringToUint8Array } from '../CommonUtils';
import { SignVerify, SignVerifyData } from './SignVerifyUtils';

export function GenParam(paramTag: huks.HuksTag, paramValue: boolean | number | bigint | Uint8Array): huks.HuksParam {
  return {
    tag: paramTag,
    value: paramValue
  } as huks.HuksParam;
}

export function SetInData(huksOptions: huks.HuksOptions, inData: Uint8Array): huks.HuksOptions {
  huksOptions.inData = inData;
  return huksOptions;
}

export function SetParam(huksOptions: huks.HuksOptions, paramTag: huks.HuksTag, paramValue: boolean | number | bigint | Uint8Array): huks.HuksOptions {
  let properties: Array<huks.HuksParam> = huksOptions.properties as Array<huks.HuksParam>;
  DeleteParam(huksOptions, paramTag);
  properties.push(GenParam(paramTag, paramValue));
  return huksOptions;
}

export function SetMultiParam(huksOptions: huks.HuksOptions, paramTag: huks.HuksTag, paramValue: boolean | number | bigint | Uint8Array): huks.HuksOptions {
  let properties: Array<huks.HuksParam> = huksOptions.properties as Array<huks.HuksParam>;
  DeleteParam(huksOptions, paramTag);
  properties.push(GenParam(paramTag, paramValue));
  properties.push(GenParam(paramTag, paramValue));
  return huksOptions;
}

export function GetParam(huksOptions: huks.HuksOptions, paramTag: huks.HuksTag): boolean | number | bigint | Uint8Array | null {
  let properties: Array<huks.HuksParam> = huksOptions.properties as Array<huks.HuksParam>;
  for (let i = 0; i < properties.length; i++) {
    if (properties[i].tag == paramTag) {
      return properties[i].tag;
    }
  }
  return null;
}

export function AddParam(huksOptions: huks.HuksOptions, paramTag: huks.HuksTag, paramValue: boolean | number | bigint | Uint8Array): huks.HuksOptions {
  let properties: Array<huks.HuksParam> = huksOptions.properties as Array<huks.HuksParam>;
  properties.push(GenParam(paramTag, paramValue));
  return huksOptions;
}

export function DeleteParam(huksOptions: huks.HuksOptions, paramTag: huks.HuksTag): huks.HuksOptions {
  let properties: Array<huks.HuksParam> = huksOptions.properties as Array<huks.HuksParam>;
  for (let i = properties.length - 1; i >= 0; i--) {
    if (properties[i].tag == paramTag) {
      properties.splice(i, 1);
    }
  }
  return huksOptions;
}

export function MergeOptions(huksOptions: huks.HuksOptions, ...huksOptionsAddArr: Array<huks.HuksOptions>): huks.HuksOptions {
  for (let i = 0; i < huksOptionsAddArr.length; i++) {
    let properties: Array<huks.HuksParam> = huksOptionsAddArr[i].properties as Array<huks.HuksParam>;
    for (let j = 0; j < properties.length; j++) {
      SetParam(huksOptions, properties[j].tag, properties[j].value);
    }
    if (huksOptionsAddArr[i].inData) {
      huksOptions.inData = huksOptionsAddArr[i].inData;
    }
  }
  return huksOptions;
}

export function PrintOptions(huksOptions: huks.HuksOptions) {
  let properties: Array<huks.HuksParam> = huksOptions.properties as Array<huks.HuksParam>;
  for (let i = 0; i < properties.length; i++) {
    console.info(`[${i}]tag: ${properties[i].tag}, value: ${properties[i].value}`);
  }
}

export function GetEmptyOptions() {
  let huksOptions: huks.HuksOptions = {
    properties: []
  }
  return huksOptions;
}

export function CopyHuksOptions(huksOptions: huks.HuksOptions): huks.HuksOptions {
  // 不能用json字符串转来转去，用字符串会丢失类型，Uint8Array会退化成普通数组，导致napi里解析不了
  let copyOne: huks.HuksOptions = {
    properties: [],
    inData: new Uint8Array
  }
  if (huksOptions?.properties) {
    for (let param of huksOptions?.properties) {
      if (param.value instanceof Uint8Array) {
        copyOne?.properties?.push({
          tag: param?.tag,
          value: new Uint8Array(param?.value)
        })
      } else {
        copyOne?.properties?.push({
          tag: param.tag,
          value: param.value
        })
      }
    }
  }
  if (huksOptions?.inData) {
    copyOne.inData = new Uint8Array(huksOptions?.inData)
  }
  return copyOne
}

export async function CheckSoftware() {
  let dsaAlias = "useDsaToCheckSoftware";
  let dsaOptions: huks.HuksOptions = {
    properties: [
      GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_DSA),
      GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_RSA_KEY_SIZE_1024),
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN)
    ]
  };
  try {
    await huks.generateKeyItem(dsaAlias, dsaOptions);
    await huks.deleteKeyItem(dsaAlias, dsaOptions);
    return true;
  } catch (err) {
    return false;
  }
}

export async function CheckWearable() {
  let rsaAlias = "useRsaToCheckWearable";
  let rsaOptions: huks.HuksOptions = {
    properties: [
      GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_RSA),
      GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_RSA_KEY_SIZE_1024),
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_ISO_IEC_9796_2),
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA1),
    ]
  };
  let signVerifyData: SignVerifyData = {
    updateDataArr: null,
    finishData: StringToUint8Array(GetDataBySize(128)),
    signatureData: null
  }
  try {
    await huks.generateKeyItem(rsaAlias, rsaOptions);
    await SignVerify(rsaAlias, rsaOptions, signVerifyData);
    await huks.deleteKeyItem(rsaAlias, rsaOptions);
    return true
  } catch (err) {
    return false;
  }
}