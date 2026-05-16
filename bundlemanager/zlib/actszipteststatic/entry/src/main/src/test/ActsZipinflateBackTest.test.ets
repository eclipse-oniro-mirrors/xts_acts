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

import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import { BusinessError, RecordData } from '@ohos.base';
import hilog from '@ohos.hilog';
import zlib from '@ohos.zlib';

let domain: Int = 0x0000;
let tag: string = 'testTag';

export default function ActsZipInflateBackTest() {
  hilog.info(domain, tag, '%{public}s', 'describe start');

  describe('ActsZipInflateBackTest ', (): void => {

    /**
     * @tc.number     ACTS_ZipTest_static_100
     * @tc.name       actsZipTest_static_100
     * @tc.desc       test inflateGetHeader
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'actsZipTest_static_100 inflateBackTest called');
        let readIn: (inDesc: RecordData) => ArrayBuffer = (inDesc: RecordData): ArrayBuffer => {
          console.info("inDesc = ", JSON.stringify(inDesc));
          let buffer = new ArrayBuffer(26)
          let array = new Uint8Array(buffer);
          array.set([31, 139, 8, 0, 0, 0, 0, 0, 0, 10, 243, 72, 205, 201, 201, 231, 2, 0, 22, 53, 150, 49, 6, 0, 0, 0]);
          return buffer;
        }
        let writeOut: (outDesc: RecordData, buffer: ArrayBuffer, length: int) => int =
          (outDesc: RecordData, buffer: ArrayBuffer, length: int): int => {
            let array = new Uint8Array(buffer);
            let dataString = "";
            for (let i = 0; i < length; i++) {
              dataString += String.fromCharCode(array[i]);
            }
            return 0;
          }
        let have = 0;
        let first = 1;
        let arrayBuffer = new ArrayBuffer(26);
        let next = new Uint8Array(arrayBuffer);
        let last = 0;
        let index = 0;
        let flags = 0;
        let NEXT2: () => int = (): int => {
          let o6: object = new Object()
          if (!have) {
            arrayBuffer = readIn(o6)
            next = new Uint8Array(arrayBuffer);
            have = next.length;
          }
          if (have) {
            have--;
            last = Double.toInt(next[index]);
            index++;
          } else {
            last = -1;
          }
          return last;
        }
        let inflateBackTestHelper: () => Promise<void> = (async () => {
          try {
            have = 0;
            first = 1;
            arrayBuffer = new ArrayBuffer(26);
            next = new Uint8Array(arrayBuffer);
            last = 0;
            index = 0;
            flags = 0;
            let zip: zlib.Zip = zlib.createZipSync();
            let buffer = new ArrayBuffer(1024)
            await zip.inflateBackInit({}, 15, buffer).then((data: zlib.ReturnStatus) => {
              hilog.info(domain, tag, 'actsZipTest_static_100 inflateBackInit success. data: ' + JSON.stringify(data));
              expect(data).assertEqual(zlib.ReturnStatus.OK);
            }).catch((errData: Error): void => {
              hilog.error(domain, tag,
                `actsZipTest_static_100 inflateBackInit errData is errCode:${errData.code}  message:${errData.message}`);
              expect(errData).assertFail();
            });
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
              byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let arrayBuffer1 = new ArrayBuffer(0);
            try {
              await zip.inflateBackInit({
                nextIn: arrayBufferIn,
                availableIn: 1,
                totalIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1,
                totalOut: 2,
                dataType: 1,
                adler: 2
              }, 10, arrayBuffer1).then((data: zlib.ReturnStatus) => {
                hilog.info(domain, tag,
                  'actsZipTest_static_100 inflateBackInit success. data: ' + JSON.stringify(data));
                expect(data).assertEqual(zlib.ReturnStatus.OK);
              })
            } catch (e) {
              const errData = e as BusinessError;
              hilog.error(domain, tag,
                `actsZipTest_static_100 inflateBackInit errData is errCode:${errData.code}  message:${errData.message}`);
              expect(errData).assertFail();
            }
            let ret = 0;
            for (;; ) {
              if (NEXT2() == -1) {
                ret = 0;
                break;
              }
              if (last != 31 || (NEXT2() != 139 && last >= 157 && last <= 157)) {
                ret = first ? -3 : -1;
                break;
              }
              first = 0;
              ret = -5;
              if (NEXT2() != 8) {
                if (last < 0) {
                  break;
                }
              }
              flags = NEXT2();
              NEXT2();
              NEXT2();
              NEXT2();
              NEXT2();
              NEXT2();
              NEXT2();
              if (last < 0) {
                break;
              }
              let newArrayBuffer = new ArrayBuffer(have);
              let newNext = new Uint8Array(newArrayBuffer);
              for (let i = 0; i < have; i++) {
                newNext[i] = next[26 - have + i];
              }
              let zStream: zlib.ZStream = {
                nextIn: newArrayBuffer,
                availableIn: have,
              };
              await zip.inflateBack(
                zStream,
                readIn,
                {},
                writeOut,
                {}).then((data: zlib.ReturnStatus) => {
                hilog.info(domain, tag,
                  'actsZipTest_static_100 inflateBack success. data: ' + JSON.stringify(data));
                expect(data).assertEqual(zlib.ReturnStatus.OK);
              }).catch((errData: Error): void => {
                hilog.error(domain, tag,
                  `actsZipTest_static_100 inflateBack errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
              });
              let str = 'hello world!';
              let arrayBufferIn = new ArrayBuffer(str.length);
              let byteArray = new Uint8Array(arrayBufferIn);
              for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
              }
              let arrayBufferOut = new ArrayBuffer(0);
              try {
                await zip.inflateBack({
                  nextIn: arrayBufferIn,
                  availableIn: 1,
                  totalIn: 1,
                  nextOut: arrayBufferOut,
                  availableOut: 1,
                  totalOut: 2,
                  dataType: 1,
                }, readIn, {}, writeOut, {}).then((data: zlib.ReturnStatus) => {
                  hilog.info(domain, tag,
                    'actsZipTest_static_100 inflateBack success.');
                  expect(data).assertFail();
                })
              } catch (e) {
                const errData = e as BusinessError;
                hilog.error(domain, tag,
                  `actsZipTest_static_100 inflateBack errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800004);
              }
              if (ret == 1) {
                hilog.info(domain, tag, 'actsZipTest_static_100 inflateBackTestHelper Call data success');
                break;
              }
            }
            await zip.inflateBackEnd({}).then((data: zlib.ReturnStatus) => {
              hilog.info(domain, tag, 'actsZipTest_static_100 inflateBackEnd success. data: ' + JSON.stringify(data));
              expect(data).assertEqual(zlib.ReturnStatus.OK);
            }).catch((errData: Error): void => {
              hilog.error(domain, tag,
                `actsZipTest_static_100 inflateBackEnd errData is errCode:${errData.code}  message:${errData.message}`);
              expect(errData).assertFail();
            });
          } catch (e) {
            const errData = e as BusinessError;
            hilog.error(domain, tag,
              `actsZipTest_static_100 inflateBackEnd errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
          }
        })
        inflateBackTestHelper();
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_100 end==================");
      })

  })
}