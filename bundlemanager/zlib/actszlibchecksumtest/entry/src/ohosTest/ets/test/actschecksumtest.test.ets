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
import zlib from '@ohos.zlib'
import { describe, it, expect } from '@ohos/hypium'
import base from '@ohos.base'

export default function ActsChecksumTest() { 
 describe('ActsChecksumTest',  () =>{
    /**
     * @tc.number     : ACTS_ChecksumTest_01
     * @tc.name       : actsChecksumTest01
     * @tc.desc       : test adler32
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsChecksumTest01', 0, async (done : Function) =>{
        console.info("==================ACTS_ChecksumTest_01 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(12);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i);
        }
        let checksum = zlib.createChecksumSync()
        zlib.createChecksum().then((data)=>{
        console.info('createChecksum success');
        checksum = data
        })
        await checksum.adler32(0, arrayBufferIn).then((data) => {
            console.info('adler32 success');
            expect(data).assertEqual(511509629);
            done();
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
            done();
        })
        console.info("==================ACTS_ChecksumTest_01 end==================");
    })

    /**
     * @tc.number     : ACTS_ChecksumTest_02
     * @tc.name       : actsChecksumTest02
     * @tc.desc       : test adler32Combine
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsChecksumTest02', 0, async (done : Function) =>{
        console.info("==================ACTS_ChecksumTest_02 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(12);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i);
        }
        let checksum = zlib.createChecksumSync()
        let adler1 = 0;
        let adler2 = 1;
        await checksum.adler32(0, arrayBufferIn).then(data => {
            console.info('adler32 success', data);
            expect(data).assertEqual(511509629);
            adler1 = data;
        })
        await checksum.adler32(1, arrayBufferIn).then(data => {
            console.info('adler32 success', data);
            expect(data).assertEqual(512296062);
            adler2 = data;
        })
        await checksum.adler32Combine(adler1, adler2, 12).then((data) => {
            console.info('adler32Combine success');
            expect(data).assertEqual(1926629626);
            done();
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
            done();
        })
        console.info("==================ACTS_ChecksumTest_02 end==================");
    })

    /**
     * @tc.number     : ACTS_ChecksumTest_03
     * @tc.name       : actsChecksumTest03
     * @tc.desc       : test crc32
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsChecksumTest03', 0, async (done : Function) =>{
        console.info("==================ACTS_ChecksumTest_03 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(12);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i);
        }
        let checksum = zlib.createChecksumSync()
        await checksum.crc32(0, arrayBufferIn
        ).then((data) => {
            console.info('crc32 success');
            expect(data).assertEqual(62177901);
            done();
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
            done();
        })
        console.info("==================ACTS_ChecksumTest_03 end==================");
    })

    /**
     * @tc.number     : ACTS_ChecksumTest_04
     * @tc.name       : actsChecksumTest04
     * @tc.desc       : test crc32Combine
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsChecksumTest04', 0, async (done : Function) =>{
        console.info("==================ACTS_ChecksumTest_04 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(12);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i);
        }
        let checksum = zlib.createChecksumSync()
        let crc1 = 0;
        let crc2 = 1;
        await checksum.crc32(0, arrayBufferIn).then(data => {
            console.info('crc32 success');
            expect(data).assertEqual(62177901);
            crc1 = data;
        })
        await checksum.crc32(1, arrayBufferIn).then(data => {
            console.info('crc32 success', data);
            expect(data).assertEqual(2551287298);
            crc2 = data;
        })
        await checksum.crc32Combine(crc1, crc2, 12).then((data) => {
            console.info('crc32Combine success');
            expect(data).assertEqual(1773756883);
            done();
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
            done();
        })
        console.info("==================ACTS_ChecksumTest_04 end==================");
    })

    /**
     * @tc.number     : ACTS_ChecksumTest_05
     * @tc.name       : actsChecksumTest05
     * @tc.desc       : test crc64
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsChecksumTest05', 0, async (done : Function) =>{
        console.info("==================ACTS_ChecksumTest_05 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(12);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i);
        }
        let checksum = zlib.createChecksumSync()
        let result = ""
        await checksum.crc64(0, arrayBufferIn).then((data) => {
            console.info('crc64 success');
            result = data.toString()
            expect(result).assertEqual("1194955322566906912");
            done();
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
            done();
        })
        console.info("==================ACTS_ChecksumTest_05 end==================");
    })

    /**
     * @tc.number     : ACTS_ChecksumTest_06
     * @tc.name       : actsChecksumTest06
     * @tc.desc       : test getCrcTable
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsChecksumTest06', 0, async (done : Function) =>{
        console.info("==================ACTS_ChecksumTest_06 start==================");
        let checksum = zlib.createChecksumSync()
        let result = ""
        await checksum.getCrcTable().then((data) => {
            console.info('getCrcTable success');
            result = data[1].toString()
            expect(result).assertEqual("1996959894");
            done();
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
            done();
        })
        console.info("==================ACTS_ChecksumTest_06 end==================");
    })

    /**
     * @tc.number     : ACTS_ChecksumTest_07
     * @tc.name       : actsChecksumTest07
     * @tc.desc       : test getCrc64Table
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsChecksumTest07', 0, async (done : Function) =>{
        console.info("==================ACTS_ChecksumTest_07 start==================");
        let checksum = zlib.createChecksumSync()
        let result = ""
        await checksum.getCrc64Table().then((data) => {
            console.info('getCrc64Table success');
            result = data[1].toString()
            expect(result).assertEqual("4340195606025211873");
            done();
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
            done();
        })
        console.info("==================ACTS_ChecksumTest_07 end==================");
    })

    /**
     * @tc.number     : ACTS_ChecksumTest_08
     * @tc.name       : actsChecksumTest08
     * @tc.desc       : test adler32
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsChecksumTest08', 0, async (done : Function) =>{
        console.info("==================actsChecksumTest08 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(12);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i);
        }
        let checksum = zlib.createChecksumSync()
        try {
        await checksum.adler32(null, arrayBufferIn).then((data) => {
            console.info('adler32 success');
            expect(data).assertFail();
        })
        } catch(errData) {
          console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(401);
        }
        done();
        console.info("==================actsChecksumTest08 end==================");
    })

    /**
     * @tc.number     : ACTS_ChecksumTest_09
     * @tc.name       : actsChecksumTest09
     * @tc.desc       : test crc32
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsChecksumTest09', 0, async (done : Function) =>{
        console.info("==================actsChecksumTest09 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(12);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i);
        }
        let checksum = zlib.createChecksumSync()
        try {
        await checksum.crc32(null, arrayBufferIn
        ).then((data) => {
            console.info('crc32 success');
            expect(data).assertFail();
        })
        } catch(errData) {
          console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(401);
        }
        done();
        console.info("==================actsChecksumTest09 end==================");
    })

    /**
     * @tc.number     : ACTS_ChecksumTest_10
     * @tc.name       : actsChecksumTest10
     * @tc.desc       : test crc64
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsChecksumTest10', 0, async (done : Function) =>{
        console.info("==================actsChecksumTest10 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(12);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i);
        }
        let checksum = zlib.createChecksumSync()
        let result = ""
        try {
        await checksum.crc64(null, arrayBufferIn).then((data) => {
            console.info('crc64 success');
            expect(data).assertFail();
        })
        } catch(errData) {
          console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(401);
        }
        done();
        console.info("==================actsChecksumTest10 end==================");
    })

    /**
     * @tc.number     : ACTS_ChecksumTest_11
     * @tc.name       : actsChecksumTest11
     * @tc.desc       : test adler32Combine
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsChecksumTest11', 0, async (done : Function) =>{
        console.info("==================actsChecksumTest11 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(12);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i);
        }
        let checksum = zlib.createChecksumSync()
        try {
        await checksum.adler32Combine(null, 1, 12).then((data) => {
            console.info('adler32Combine success');
            expect(data).assertFail();
        })
        } catch(errData) {
          console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(401);
        }
        done();
        console.info("==================actsChecksumTest11 end==================");
    })

    /**
     * @tc.number     : ACTS_ChecksumTest_12
     * @tc.name       : actsChecksumTest12
     * @tc.desc       : test crc32Combine
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsChecksumTest12', 0, async (done: Function) =>{
        console.info("==================actsChecksumTest12 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(12);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i);
        }
        let checksum = zlib.createChecksumSync()
        try {
        await checksum.crc32Combine(null, 2, 12).then((data) => {
            console.info('crc32Combine success');
            expect(data).assertFail();
        })
        } catch(errData) {
          console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(401);
        }
        done();
        console.info("==================actsChecksumTest12 end==================");
    })
 })
}