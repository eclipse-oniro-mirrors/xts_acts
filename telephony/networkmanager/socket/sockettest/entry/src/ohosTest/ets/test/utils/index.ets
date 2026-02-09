/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { expect } from '@ohos/hypium';
import socket from '@ohos.net.socket';
import util from '@ohos.util';

export function expectFail(info: string = ''): void {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`${info} test failed`);
  }
}

export function expectEqual(exp: string | number | boolean, assert: string | number | boolean, info: string = ''): void {
  try {
    expect(exp).assertEqual(assert);
  } catch (err) {
    console.info(`${info} test failed`);
  }
}

export function expectTrue(exp: boolean, info: string = ''): void {
  try {
    expect(exp).assertTrue();
  } catch (err) {
    console.info(`${info} test failed`);
  }
}

export function expectFalse(exp: boolean, info: string = ''): void {
  try {
    expect(exp).assertFalse();
  } catch (err) {
    console.info(`${info} test failed`);
  }
}

export function ArrayBufferToString(ab: ArrayBuffer): string {
  let textDecoder: util.TextDecoder = util.TextDecoder.create('utf-8');
  let dataView: Uint8Array = new Uint8Array(ab);
  return textDecoder.decodeWithStream(dataView);
}

export function stringToArrayBuffer(str: string): ArrayBuffer {
  let buf: ArrayBuffer = new ArrayBuffer(str.length * 2);
  let bufView: Uint8Array = new Uint8Array(buf);
  for (let i: number = 0; i < str.length; i++) {
    bufView[i] = str.charCodeAt(i);
  }
  return buf;
}

export class SocketInfo {
  message: ArrayBuffer = new ArrayBuffer(1);
  remoteInfo: socket.SocketRemoteInfo = {} as socket.SocketRemoteInfo;
}