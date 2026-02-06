import { buffer } from '@kit.ArkTS';

export function StringToUint8Array(str: string) {
  let arr: number[] = [];
  for (let i = 0, j = str.length; i < j; ++i) {
    arr.push(str.charCodeAt(i));
  }
  return new Uint8Array(arr);
}

export function Uint8ArrayToString(fileData: Uint8Array) {
  let dataString = '';
  for (let i = 0; i < fileData.length; i++) {
    dataString += String.fromCharCode(fileData[i]);
  }
  return dataString;
}

export function HexToUint8Array(hexString: string) {
  const length: number = hexString.length;
  if (length % 2 !== 0) {
    throw new Error('Invalid input');
  }
  let a = '[';
  const uint8Array = new Uint8Array(length / 2);
  for (let i = 0; i < length; i += 2) {
    const byteValue = parseInt(hexString[i] + hexString[i+1], 16);
    uint8Array[i/2] = byteValue;
    a = a + byteValue + ','
  }
  return uint8Array;
}

export function Uint8ArrayToHexString(data: Uint8Array) {
  return buffer.from(data).toString('hex');
}


export function GetDataBySize(size: number): string {
  if (size <= 0) {
    return "";
  }
  let strArr: Array<string> = new Array(size);
  strArr.fill("A");
  return strArr.join("");
}