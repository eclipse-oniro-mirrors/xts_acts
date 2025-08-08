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
import { describe, it, expect, beforeAll } from '@ohos/hypium'
import base from '@ohos.base'

let ZStreamComplete: zlib.ZStream = {};
let ZStreamNextInNull: zlib.ZStream = {};
let ZStreamNextInUndefined: zlib.ZStream = {};
let ZStreamNextInZero: zlib.ZStream = {};
let ZStreamNextInUnset: zlib.ZStream = {};
let ZStreamAvailableInNull: zlib.ZStream = {};
let ZStreamAvailableInUndefined: zlib.ZStream = {};
let ZStreamAvailableInNegative: zlib.ZStream = {};
let ZStreamAvailableInUnset: zlib.ZStream = {};
let ZStreamTotalInNull: zlib.ZStream = {};
let ZStreamTotalInUndefined: zlib.ZStream = {};
let ZStreamTotalInNegative: zlib.ZStream = {};
let ZStreamTotalInUnset: zlib.ZStream = {};
let ZStreamNextOutNull: zlib.ZStream = {};
let ZStreamNextOutUndefined: zlib.ZStream = {};
let ZStreamNextOutZero: zlib.ZStream = {};
let ZStreamNextOutUnset: zlib.ZStream = {};
let ZStreamAvailableOutNull: zlib.ZStream = {};
let ZStreamAvailableOutUndefined: zlib.ZStream = {};
let ZStreamAvailableOutNegative: zlib.ZStream = {};
let ZStreamAvailableOutUnset: zlib.ZStream = {};
let ZStreamTotalOutNull: zlib.ZStream = {};
let ZStreamTotalOutUndefined: zlib.ZStream = {};
let ZStreamTotalOutNegative: zlib.ZStream = {};
let ZStreamTotalOutUnset: zlib.ZStream = {};
let ZStreamDataTypeNull: zlib.ZStream = {};
let ZStreamDataTypeUndefined: zlib.ZStream = {};
let ZStreamDataTypeNegative: zlib.ZStream = {};
let ZStreamDataTypeUnset: zlib.ZStream = {};
let ZStreamAdlerNull: zlib.ZStream = {};
let ZStreamAdlerUndefined: zlib.ZStream = {};
let ZStreamAdlerNegative: zlib.ZStream = {};
let ZStreamAdlerUnset: zlib.ZStream = {};

let gzHeader_complete: zlib.GzHeader = {};
let gzHeader_isText_empty: zlib.GzHeader = {};
let gzHeader_isText_null: zlib.GzHeader = {};
let gzHeader_isText_undefined: zlib.GzHeader = {};
let gzHeader_os_empty: zlib.GzHeader = {};
let gzHeader_os_null: zlib.GzHeader = {};
let gzHeader_os_undefined: zlib.GzHeader = {};
let gzHeader_os_negative: zlib.GzHeader = {};
let gzHeader_time_empty: zlib.GzHeader = {};
let gzHeader_time_null: zlib.GzHeader = {};
let gzHeader_time_undefined: zlib.GzHeader = {};
let gzHeader_time_negative: zlib.GzHeader = {};
let gzHeader_xflags_empty: zlib.GzHeader = {};
let gzHeader_xflags_null: zlib.GzHeader = {};
let gzHeader_xflags_undefined: zlib.GzHeader = {};
let gzHeader_xflags_negative: zlib.GzHeader = {};
let gzHeader_extra_empty: zlib.GzHeader = {};
let gzHeader_extra_null: zlib.GzHeader = {};
let gzHeader_extra_undefined: zlib.GzHeader = {};
let gzHeader_extra_zero: zlib.GzHeader = {};
let gzHeader_extraLen_empty: zlib.GzHeader = {};
let gzHeader_extraLen_null: zlib.GzHeader = {};
let gzHeader_extraLen_undefined: zlib.GzHeader = {};
let gzHeader_extraLen_negative: zlib.GzHeader = {};
let gzHeader_name_empty: zlib.GzHeader = {};
let gzHeader_name_null: zlib.GzHeader = {};
let gzHeader_name_undefined: zlib.GzHeader = {};
let gzHeader_name_zero: zlib.GzHeader = {};
let gzHeader_comment_empty: zlib.GzHeader = {};
let gzHeader_comment_null: zlib.GzHeader = {};
let gzHeader_comment_undefined: zlib.GzHeader = {};
let gzHeader_comment_zero: zlib.GzHeader = {};
let gzHeader_hcrc_empty: zlib.GzHeader = {};
let gzHeader_hcrc_null: zlib.GzHeader = {};
let gzHeader_hcrc_undefined: zlib.GzHeader = {};
let gzHeader_done_empty: zlib.GzHeader = {};
let gzHeader_done_null: zlib.GzHeader = {};
let gzHeader_done_undefined: zlib.GzHeader = {};

async function DoDeflateInit(zip: zlib.Zip) {
    await zip.deflateInit(ZStreamComplete, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED);
}

export default function ActsZipTest() {
    describe('ActsZipTest', () => {

        beforeAll(async (done: Function) => {
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            ZStreamComplete = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                totalIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1,
                totalOut: 2,
                dataType: 1,
                adler: 2
            };
            ZStreamNextInNull = {
                nextIn: undefined,
                availableIn: 1,
                totalIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1,
                totalOut: 2,
                dataType: 1,
                adler: 2
            };
            ZStreamNextInUndefined = {
                nextIn: undefined,
                availableIn: 1,
                totalIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1,
                totalOut: 2,
                dataType: 1,
                adler: 2
            };
            ZStreamNextInZero = {
                nextIn: new ArrayBuffer(0),
                availableIn: 1,
                totalIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1,
                totalOut: 2,
                dataType: 1,
                adler: 2
            };
            ZStreamNextInUnset = {
                availableIn: 1,
                totalIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1,
                totalOut: 2,
                dataType: 1,
                adler: 2
            };

            ZStreamAvailableInNull = {
                nextIn: arrayBufferIn,
                availableIn: undefined,
                totalIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1,
                totalOut: 2,
                dataType: 1,
                adler: 2
            };
            ZStreamAvailableInUndefined = {
                nextIn: arrayBufferIn,
                availableIn: undefined,
                totalIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1,
                totalOut: 2,
                dataType: 1,
                adler: 2
            };
            ZStreamAvailableInNegative = {
                nextIn: arrayBufferIn,
                availableIn: -1,
                totalIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1,
                totalOut: 2,
                dataType: 1,
                adler: 2
            };
            ZStreamAvailableInUnset = {
                nextIn: arrayBufferIn,
                totalIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1,
                totalOut: 2,
                dataType: 1,
                adler: 2
            };

            ZStreamTotalInNull = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                totalIn: undefined,
                nextOut: arrayBufferOut,
                availableOut: 1,
                totalOut: 2,
                dataType: 1,
                adler: 2
            };
            ZStreamTotalInUndefined = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                totalIn: undefined,
                nextOut: arrayBufferOut,
                availableOut: 1,
                totalOut: 2,
                dataType: 1,
                adler: 2
            };
            ZStreamTotalInNegative = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                totalIn: -1,
                nextOut: arrayBufferOut,
                availableOut: 1,
                totalOut: 2,
                dataType: 1,
                adler: 2
            };
            ZStreamTotalInUnset = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1,
                totalOut: 2,
                dataType: 1,
                adler: 2
            };

            ZStreamNextOutNull = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                totalIn: 1,
                nextOut: undefined,
                availableOut: 1,
                totalOut: 2,
                dataType: 1,
                adler: 2
            };
            ZStreamNextOutUndefined = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                totalIn: 1,
                nextOut: undefined,
                availableOut: 1,
                totalOut: 2,
                dataType: 1,
                adler: 2
            };
            ZStreamNextOutZero = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                totalIn: 1,
                nextOut: new ArrayBuffer(0),
                availableOut: 1,
                totalOut: 2,
                dataType: 1,
                adler: 2
            };
            ZStreamNextOutUnset = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                totalIn: 1,
                availableOut: 1,
                totalOut: 2,
                dataType: 1,
                adler: 2
            };

            ZStreamAvailableOutNull = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                totalIn: 1,
                nextOut: arrayBufferOut,
                availableOut: undefined,
                totalOut: 2,
                dataType: 1,
                adler: 2
            };
            ZStreamAvailableOutUndefined = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                totalIn: 1,
                nextOut: arrayBufferOut,
                availableOut: undefined,
                totalOut: 2,
                dataType: 1,
                adler: 2
            };
            ZStreamAvailableOutNegative = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                totalIn: 1,
                nextOut: arrayBufferOut,
                availableOut: -1,
                totalOut: 2,
                dataType: 1,
                adler: 2
            };
            ZStreamAvailableOutUnset = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                totalIn: 1,
                nextOut: arrayBufferOut,
                totalOut: 2,
                dataType: 1,
                adler: 2
            };

            ZStreamTotalOutNull = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                totalIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1,
                totalOut: undefined,
                dataType: 1,
                adler: 2
            };
            ZStreamTotalOutUndefined = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                totalIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1,
                totalOut: undefined,
                dataType: 1,
                adler: 2
            };
            ZStreamTotalOutNegative = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                totalIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1,
                totalOut: -1,
                dataType: 1,
                adler: 2
            };
            ZStreamTotalOutUnset = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                totalIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1,
                dataType: 1,
                adler: 2
            };

            ZStreamDataTypeNull = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                totalIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1,
                totalOut: 2,
                dataType: undefined,
                adler: 2
            };
            ZStreamDataTypeUndefined = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                totalIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1,
                totalOut: 2,
                dataType: undefined,
                adler: 2
            };
            ZStreamDataTypeNegative = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                totalIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1,
                totalOut: 2,
                dataType: -1,
                adler: 2
            };
            ZStreamDataTypeUnset = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                totalIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1,
                totalOut: 2,
                adler: 2
            };

            ZStreamAdlerNull = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                totalIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1,
                totalOut: 2,
                dataType: 1,
                adler: undefined
            };
            ZStreamAdlerUndefined = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                totalIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1,
                totalOut: 2,
                dataType: 1,
                adler: undefined
            };
            ZStreamAdlerNegative = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                totalIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1,
                totalOut: 2,
                dataType: 1,
                adler: -1
            };
            ZStreamAdlerUnset = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                totalIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1,
                totalOut: 2,
                dataType: 1
            };

            const convert = (str: string, nullTerminated: boolean): ArrayBuffer => {
                let arrayBuffer = new ArrayBuffer(str.length + (nullTerminated ? 1 : 0));
                let byteArray = new Uint8Array(arrayBuffer);
                for (let i = 0, j = str.length; i < j; i++) {
                    byteArray[i] = str.charCodeAt(i);
                }
                if (nullTerminated) {
                    byteArray[str.length] = 0;
                }
                return arrayBuffer;
            }
            let arrayBufferExtra = convert('Extra field', false);
            let arrayBufferFileName = convert('Name field', true);
            let arrayBufferComment = convert('Comment field', true);
            let arrayBufferZero = new ArrayBuffer(0);

            gzHeader_complete = {
                isText: true,
                os: 1,
                time: 1,
                xflags: 1,
                extra: arrayBufferExtra,
                extraLen: arrayBufferExtra.byteLength,
                name: arrayBufferFileName,
                comment: arrayBufferComment,
                hcrc: false,
                done: true,
            };

            gzHeader_isText_empty = {
                os: 1,
                time: 1,
                xflags: 1,
                extra: arrayBufferExtra,
                extraLen: arrayBufferExtra.byteLength,
                name: arrayBufferFileName,
                comment: arrayBufferComment,
                hcrc: false,
                done: true,
            };
            gzHeader_isText_null = {
                isText: undefined,
                os: 1,
                time: 1,
                xflags: 1,
                extra: arrayBufferExtra,
                extraLen: arrayBufferExtra.byteLength,
                name: arrayBufferFileName,
                comment: arrayBufferComment,
                hcrc: false,
                done: true,
            };
            gzHeader_isText_undefined = {
                isText: undefined,
                os: 1,
                time: 1,
                xflags: 1,
                extra: arrayBufferExtra,
                extraLen: arrayBufferExtra.byteLength,
                name: arrayBufferFileName,
                comment: arrayBufferComment,
                hcrc: false,
                done: true,
            };

            gzHeader_os_empty = {
                isText: true,
                time: 1,
                xflags: 1,
                extra: arrayBufferExtra,
                extraLen: arrayBufferExtra.byteLength,
                name: arrayBufferFileName,
                comment: arrayBufferComment,
                hcrc: false,
                done: true,
            };
            gzHeader_os_null = {
                isText: true,
                os: undefined,
                time: 1,
                xflags: 1,
                extra: arrayBufferExtra,
                extraLen: arrayBufferExtra.byteLength,
                name: arrayBufferFileName,
                comment: arrayBufferComment,
                hcrc: false,
                done: true,
            };
            gzHeader_os_undefined = {
                isText: true,
                os: undefined,
                time: 1,
                xflags: 1,
                extra: arrayBufferExtra,
                extraLen: arrayBufferExtra.byteLength,
                name: arrayBufferFileName,
                comment: arrayBufferComment,
                hcrc: false,
                done: true,
            };
            gzHeader_os_negative = {
                isText: true,
                os: -1,
                time: 1,
                xflags: 1,
                extra: arrayBufferExtra,
                extraLen: arrayBufferExtra.byteLength,
                name: arrayBufferFileName,
                comment: arrayBufferComment,
                hcrc: false,
                done: true,
            };

            gzHeader_time_empty = {
                isText: true,
                os: 1,
                xflags: 1,
                extra: arrayBufferExtra,
                extraLen: arrayBufferExtra.byteLength,
                name: arrayBufferFileName,
                comment: arrayBufferComment,
                hcrc: false,
                done: true,
            };
            gzHeader_time_null = {
                isText: true,
                os: 1,
                time: undefined,
                xflags: 1,
                extra: arrayBufferExtra,
                extraLen: arrayBufferExtra.byteLength,
                name: arrayBufferFileName,
                comment: arrayBufferComment,
                hcrc: false,
                done: true,
            };
            gzHeader_time_undefined = {
                isText: true,
                os: 1,
                time: undefined,
                xflags: 1,
                extra: arrayBufferExtra,
                extraLen: arrayBufferExtra.byteLength,
                name: arrayBufferFileName,
                comment: arrayBufferComment,
                hcrc: false,
                done: true,
            };
            gzHeader_time_negative = {
                isText: true,
                os: 1,
                time: -1,
                xflags: 1,
                extra: arrayBufferExtra,
                extraLen: arrayBufferExtra.byteLength,
                name: arrayBufferFileName,
                comment: arrayBufferComment,
                hcrc: false,
                done: true,
            };

            gzHeader_xflags_empty = {
                isText: true,
                os: 1,
                time: 1,
                extra: arrayBufferExtra,
                extraLen: arrayBufferExtra.byteLength,
                name: arrayBufferFileName,
                comment: arrayBufferComment,
                hcrc: false,
                done: true,
            };
            gzHeader_xflags_null = {
                isText: true,
                os: 1,
                time: 1,
                xflags: undefined,
                extra: arrayBufferExtra,
                extraLen: arrayBufferExtra.byteLength,
                name: arrayBufferFileName,
                comment: arrayBufferComment,
                hcrc: false,
                done: true,
            };
            gzHeader_xflags_undefined = {
                isText: true,
                os: 1,
                time: 1,
                xflags: undefined,
                extra: arrayBufferExtra,
                extraLen: arrayBufferExtra.byteLength,
                name: arrayBufferFileName,
                comment: arrayBufferComment,
                hcrc: false,
                done: true,
            };
            gzHeader_xflags_negative = {
                isText: true,
                os: 1,
                time: 1,
                xflags: -1,
                extra: arrayBufferExtra,
                extraLen: arrayBufferExtra.byteLength,
                name: arrayBufferFileName,
                comment: arrayBufferComment,
                hcrc: false,
                done: true,
            };

            gzHeader_extra_empty = {
                isText: true,
                os: 1,
                time: 1,
                xflags: 1,
                extraLen: arrayBufferExtra.byteLength,
                name: arrayBufferFileName,
                comment: arrayBufferComment,
                hcrc: false,
                done: true,
            };
            gzHeader_extra_null = {
                isText: true,
                os: 1,
                time: 1,
                xflags: 1,
                extra: undefined,
                extraLen: arrayBufferExtra.byteLength,
                name: arrayBufferFileName,
                comment: arrayBufferComment,
                hcrc: false,
                done: true,
            };
            gzHeader_extra_undefined = {
                isText: true,
                os: 1,
                time: 1,
                xflags: 1,
                extra: undefined,
                extraLen: arrayBufferExtra.byteLength,
                name: arrayBufferFileName,
                comment: arrayBufferComment,
                hcrc: false,
                done: true,
            };
            gzHeader_extra_zero = {
                isText: true,
                os: 1,
                time: 1,
                xflags: 1,
                extra: arrayBufferZero,
                extraLen: arrayBufferExtra.byteLength,
                name: arrayBufferFileName,
                comment: arrayBufferComment,
                hcrc: false,
                done: true,
            };

            gzHeader_extraLen_empty = {
                isText: true,
                os: 1,
                time: 1,
                xflags: 1,
                extra: arrayBufferExtra,
                name: arrayBufferFileName,
                comment: arrayBufferComment,
                hcrc: false,
                done: true,
            };
            gzHeader_extraLen_null = {
                isText: true,
                os: 1,
                time: 1,
                xflags: 1,
                extra: arrayBufferExtra,
                extraLen: undefined,
                name: arrayBufferFileName,
                comment: arrayBufferComment,
                hcrc: false,
                done: true,
            };
            gzHeader_extraLen_undefined = {
                isText: true,
                os: 1,
                time: 1,
                xflags: 1,
                extra: arrayBufferExtra,
                extraLen: undefined,
                name: arrayBufferFileName,
                comment: arrayBufferComment,
                hcrc: false,
                done: true,
            };
            gzHeader_extraLen_negative = {
                isText: true,
                os: 1,
                time: 1,
                xflags: 1,
                extra: arrayBufferExtra,
                extraLen: -1,
                name: arrayBufferFileName,
                comment: arrayBufferComment,
                hcrc: false,
                done: true,
            };

            gzHeader_name_empty = {
                isText: true,
                os: 1,
                time: 1,
                xflags: 1,
                extra: arrayBufferExtra,
                extraLen: arrayBufferExtra.byteLength,
                comment: arrayBufferComment,
                hcrc: false,
                done: true,
            };
            gzHeader_name_null = {
                isText: true,
                os: 1,
                time: 1,
                xflags: 1,
                extra: arrayBufferExtra,
                extraLen: arrayBufferExtra.byteLength,
                name: undefined,
                comment: arrayBufferComment,
                hcrc: false,
                done: true,
            };
            gzHeader_name_undefined = {
                isText: true,
                os: 1,
                time: 1,
                xflags: 1,
                extra: arrayBufferExtra,
                extraLen: arrayBufferExtra.byteLength,
                name: undefined,
                comment: arrayBufferComment,
                hcrc: false,
                done: true,
            };
            gzHeader_name_zero = {
                isText: true,
                os: 1,
                time: 1,
                xflags: 1,
                extra: arrayBufferExtra,
                extraLen: arrayBufferExtra.byteLength,
                name: arrayBufferZero,
                comment: arrayBufferComment,
                hcrc: false,
                done: true,
            };

            gzHeader_comment_empty = {
                isText: true,
                os: 1,
                time: 1,
                xflags: 1,
                extra: arrayBufferExtra,
                extraLen: arrayBufferExtra.byteLength,
                name: arrayBufferFileName,
                hcrc: false,
                done: true,
            };
            gzHeader_comment_null = {
                isText: true,
                os: 1,
                time: 1,
                xflags: 1,
                extra: arrayBufferExtra,
                extraLen: arrayBufferExtra.byteLength,
                name: arrayBufferFileName,
                comment: undefined,
                hcrc: false,
                done: true,
            };
            gzHeader_comment_undefined = {
                isText: true,
                os: 1,
                time: 1,
                xflags: 1,
                extra: arrayBufferExtra,
                extraLen: arrayBufferExtra.byteLength,
                name: arrayBufferFileName,
                comment: undefined,
                hcrc: false,
                done: true,
            };
            gzHeader_comment_zero = {
                isText: true,
                os: 1,
                time: 1,
                xflags: 1,
                extra: arrayBufferExtra,
                extraLen: arrayBufferExtra.byteLength,
                name: arrayBufferFileName,
                comment: arrayBufferZero,
                hcrc: false,
                done: true,
            };

            gzHeader_hcrc_empty = {
                isText: true,
                os: 1,
                time: 1,
                xflags: 1,
                extra: arrayBufferExtra,
                extraLen: arrayBufferExtra.byteLength,
                name: arrayBufferFileName,
                comment: arrayBufferComment,
                done: true,
            };
            gzHeader_hcrc_null = {
                isText: true,
                os: 1,
                time: 1,
                xflags: 1,
                extra: arrayBufferExtra,
                extraLen: arrayBufferExtra.byteLength,
                name: arrayBufferFileName,
                comment: arrayBufferComment,
                hcrc: undefined,
                done: true,
            };
            gzHeader_hcrc_undefined = {
                isText: true,
                os: 1,
                time: 1,
                xflags: 1,
                extra: arrayBufferExtra,
                extraLen: arrayBufferExtra.byteLength,
                name: arrayBufferFileName,
                comment: arrayBufferComment,
                hcrc: undefined,
                done: true,
            };

            gzHeader_done_empty = {
                isText: true,
                os: 1,
                time: 1,
                xflags: 1,
                extra: arrayBufferExtra,
                extraLen: arrayBufferExtra.byteLength,
                name: arrayBufferFileName,
                comment: arrayBufferComment,
                hcrc: false,
            };
            gzHeader_done_null = {
                isText: true,
                os: 1,
                time: 1,
                xflags: 1,
                extra: arrayBufferExtra,
                extraLen: arrayBufferExtra.byteLength,
                name: arrayBufferFileName,
                comment: arrayBufferComment,
                hcrc: false,
                done: undefined,
            };
            gzHeader_done_undefined = {
                isText: true,
                os: 1,
                time: 1,
                xflags: 1,
                extra: arrayBufferExtra,
                extraLen: arrayBufferExtra.byteLength,
                name: arrayBufferFileName,
                comment: arrayBufferComment,
                hcrc: false,
                done: undefined,
            };
            done();
        })

        /**
         * @tc.number     : ACTS_ZipTest_01
         * @tc.name       : actsZipTest01
         * @tc.desc       : test deflateInit2
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest01', 0, async (done: Function) => {
            console.info("==================ACTS_ZipTest_01 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zStream: zlib.ZStream = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1
            };
            let zip = zlib.createZipSync()
            await zip.deflateInit2(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED, zlib.CompressMethod.DEFLATED, 15,
                zlib.MemLevel.MEM_LEVEL_DEFAULT, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then((data) => {
                    console.info('deflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK)
                    expect(zlib.CompressMethod.DEFLATED).assertEqual(8);
                }).catch((errData: base.BusinessError) => {
                    console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                    expect(errData).assertFail()
                })
            done();
            console.info("==================ACTS_ZipTest_01 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_02
         * @tc.name       : actsZipTest02
         * @tc.desc       : test deflateInit
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest02', 0, async (done: Function) => {
            console.info("==================ACTS_ZipTest_02 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i);
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync()
            await zip.deflateInit({ nextIn: arrayBufferIn, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1 },
                zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data) => {
                    console.info('deflateInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK)
                }).catch((errData: base.BusinessError) => {
                    console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                    expect(errData).assertFail()
                })
            done();
            console.info("==================ACTS_ZipTest_02 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_03
         * @tc.name       : actsZipTest03
         * @tc.desc       : test deflateParams
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest03', 0, async (done: Function) => {
            console.info("==================ACTS_ZipTest_03 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zStream: zlib.ZStream = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1
            };
            let zip = zlib.createZipSync()
            await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data) => {
                console.info('deflateInit success')
                expect(data).assertEqual(0)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            await zip.deflateParams(zStream, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then((data) => {
                    console.info('deflateParams success')
                    expect(data).assertEqual(0)
                }).catch((errData: base.BusinessError) => {
                    console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                    expect(errData).assertFail()
                })
            done();
            console.info("==================ACTS_ZipTest_03 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_04
         * @tc.name       : actsZipTest04
         * @tc.desc       : test deflatePrime
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest04', 0, async (done: Function) => {
            console.info("==================ACTS_ZipTest_04 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zStream: zlib.ZStream = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1
            };
            let zip = zlib.createZipSync();
            await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data) => {
                console.info('deflateInit success')
                expect(data).assertEqual(0)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            await zip.deflatePrime({ nextOut: arrayBufferOut }, 5, 2).then((data) => {
                console.info('deflatePrime success')
                expect(data).assertEqual(0)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            done();
            console.info("==================ACTS_ZipTest_04 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_05
         * @tc.name       : actsZipTest05
         * @tc.desc       : test deflateTune
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest05', 0, async (done: Function) => {
            console.info("==================ACTS_ZipTest_05 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zStream: zlib.ZStream = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1
            };
            let zip = zlib.createZipSync();
            await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data) => {
                console.info('deflateInit success')
                expect(data).assertEqual(0)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            await zip.deflateTune({ nextOut: arrayBufferOut }, 2, 2, 2, 2).then((data) => {
                console.info('deflateTune success:')
                expect(data).assertEqual(0)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            done();
            console.info("==================ACTS_ZipTest_05 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_06
         * @tc.name       : actsZipTest06
         * @tc.desc       : test deflateSetDictionary and deflateGetDictionary
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest06', 0, async (done: Function) => {
            console.info("==================ACTS_ZipTest_06 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zStream: zlib.ZStream = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1
            };
            let zip = zlib.createZipSync();
            await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data) => {
                console.info('deflateInit success')
                expect(data).assertEqual(0)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            await zip.deflateSetDictionary({ nextOut: arrayBufferOut }, arrayBufferOut).then((data) => {
                console.info('deflateSetDictionary success')
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            await zip.deflateGetDictionary({ nextOut: arrayBufferOut }, arrayBufferOut).then((data) => {
                console.info('deflateGetDictionary success')
                expect(data.status).assertEqual(0)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            done();
            console.info("==================ACTS_ZipTest_06 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_07
         * @tc.name       : actsZipTest07
         * @tc.desc       : test deflateReset
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest07', 0, async (done: Function) => {
            console.info("==================ACTS_ZipTest_07 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zStream: zlib.ZStream = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1
            };
            let zip = zlib.createZipSync();
            await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data) => {
                console.info('deflateInit success')
                expect(data).assertEqual(0)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            await zip.deflateReset({ nextOut: arrayBufferOut }).then((data) => {
                console.info('deflateReset success')
                expect(data).assertEqual(0)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            done();
            console.info("==================ACTS_ZipTest_07 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_08
         * @tc.name       : actsZipTest08
         * @tc.desc       : test deflateResetKeep
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest08', 0, async (done: Function) => {
            console.info("==================actsZipTest08 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zStream: zlib.ZStream = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1
            };
            let zip = zlib.createZipSync();
            await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data) => {
                console.info('deflateInit success')
                expect(data).assertEqual(0)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            await zip.deflateResetKeep({ nextOut: arrayBufferOut }).then((data) => {
                console.info('deflateResetKeep success')
                expect(data).assertEqual(0)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            done();
            console.info("==================actsZipTest08 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_09
         * @tc.name       : actsZipTest09
         * @tc.desc       : test deflateBound
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest09', 0, async (done: Function) => {
            console.info("==================actsZipTest09 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zStream: zlib.ZStream = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1
            };
            let zip = zlib.createZipSync();
            await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data) => {
                console.info('deflateInit success')
                expect(data).assertEqual(0)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            await zip.deflateBound({ nextOut: arrayBufferOut }, 12).then((data) => {
                console.info('deflateBound success')
                expect(data).assertEqual(25)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            done();
            console.info("==================actsZipTest09 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_10
         * @tc.name       : actsZipTest10
         * @tc.desc       : test deflatePending
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest10', 0, async (done: Function) => {
            console.info("==================actsZipTest10 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zStream: zlib.ZStream = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1
            };
            let zip = zlib.createZipSync();
            await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data) => {
                console.info('deflateInit success')
                expect(data).assertEqual(0)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            await zip.deflatePending({ nextOut: arrayBufferOut }).then((data) => {
                console.info('deflatePending success')
                expect(data.status).assertEqual(0);
                expect(data.pending).assertEqual(0);
                expect(data.bits).assertEqual(0);
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            done();
            console.info("==================actsZipTest10 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_11
         * @tc.name       : actsZipTest11
         * @tc.desc       : test deflateCopy
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest11', 0, async (done: Function) => {
            console.info("==================actsZipTest11 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zStream: zlib.ZStream = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1
            };
            let zip = zlib.createZipSync();
            await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data) => {
                console.info('deflateInit success')
                expect(data).assertEqual(0)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            await zip.deflateCopy(zip).then((data) => {
                console.info('deflateCopy success')
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            done();
            console.info("==================actsZipTest11 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_12
         * @tc.name       : actsZipTest12
         * @tc.desc       : test deflateSetHeader
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest12', 0, async (done: Function) => {
            console.info("==================actsZipTest12 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zStream: zlib.ZStream = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1
            };
            let zip = zlib.createZipSync()
            await zip.deflateInit2(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED, zlib.CompressMethod.DEFLATED, 28,
                zlib.MemLevel.MEM_LEVEL_DEFAULT, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then((data) => {
                    console.info('deflateInit2 success');
                    expect(data).assertEqual(0)
                }).catch((errData: base.BusinessError) => {
                    console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                    expect(errData).assertFail()
                })
            await zip.deflateSetHeader({ nextIn: arrayBufferIn, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1 },
                {
                    isText: true, os: 1, time: 1, xflags: 1, extra: arrayBufferIn, extraLen: 12, name: arrayBufferIn,
                    comment: arrayBufferOut, hcrc: true, done: true
                }).then((data) => {
                    console.info('deflateSetHeader success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK)
                }).catch((errData: base.BusinessError) => {
                    console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                    expect(errData).assertFail()
                })
            done();
            console.info("==================actsZipTest12 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_13
         * @tc.name       : actsZipTest13
         * @tc.desc       : test deflate and inflate
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest13', 0, async (done: Function) => {
            console.info("==================actsZipTest13 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zStream: zlib.ZStream = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1
            };
            let zip = zlib.createZipSync();
            await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data) => {
                console.info('deflateInit success')
                expect(data).assertEqual(0)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail()
            })
            await zip.deflate({ availableOut: 8 }, zlib.CompressFlushMode.FINISH).then((data) => {
                console.info('deflate success')
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail()
            })
            await zip.deflateEnd({ nextOut: arrayBufferOut }).then(data => {
                console.info('deflateEnd success')
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            await zip.inflateInit({ nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1 }
            ).then(data => {
                console.info('inflateInit success');
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            await zip.inflate({ availableIn: 8, availableOut: 8 }, zlib.CompressFlushMode.NO_FLUSH).then((data) => {
                console.info('inflate success')
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            await zip.inflateEnd({ nextOut: arrayBufferOut }).then((data) => {
                console.info('inflateEnd success')
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            done();
            console.info("==================actsZipTest13 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_14
         * @tc.name       : actsZipTest14
         * @tc.desc       : test getZStream
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest14', 0, async (done: Function) => {
            console.info("==================actsZipTest14 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            await zlib.createZip().then(data => {
                console.info('createZip success');
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            await zip.getZStream().then(data => {
                console.info('getZStream success');
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            await zip.inflateInit({ nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1 }
            ).then(data => {
                console.info('inflateInit success');
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            done();
            console.info("==================actsZipTest14 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_15
         * @tc.name       : actsZipTest15
         * @tc.desc       : test inflateCopy
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest15', 0, async (done: Function) => {
            console.info("==================actsZipTest15 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            await zip.inflateInit({ nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut, availableOut: 1, totalOut: 2, dataType: 1, adler: 2 }
            ).then(data => {
                console.info('inflateInit success');
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            await zip.inflateCopy(zip).then((data) => {
                console.info('inflateCopy success')
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            done();
            console.info("==================actsZipTest15 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_16
         * @tc.name       : actsZipTest16
         * @tc.desc       : test inflateValidate
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest16', 0, async (done: Function) => {
            console.info("==================actsZipTest16 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            await zip.inflateInit({ nextIn: arrayBufferIn, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1 }
            ).then(data => {
                console.info('inflateInit success')
                expect(data).assertEqual(zlib.ReturnStatus.OK);
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            await zip.inflateValidate({ availableIn: 1 }, 1).then(data => {
                console.info('inflateValidate success')
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            done();
            console.info("==================actsZipTest16 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_17
         * @tc.name       : actsZipTest17
         * @tc.desc       : test deflateReset
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest17', 0, async (done: Function) => {
            console.info("==================actsZipTest17 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zStream: zlib.ZStream = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1
            };
            let zip = zlib.createZipSync();
            await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data) => {
                expect(data).assertEqual(0)
            }).catch((errData: base.BusinessError) => {
                expect(errData).assertFail()
            })

            try {
                await zip.deflateReset(null).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateReset(undefined).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateReset(ZStreamNextInNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateReset(ZStreamNextInUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateReset(ZStreamNextInZero).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateReset(ZStreamNextInUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateReset(ZStreamAvailableInNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateReset(ZStreamAvailableInUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateReset(ZStreamAvailableInNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateReset(ZStreamAvailableInUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateReset(ZStreamTotalInNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateReset(ZStreamTotalInUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateReset(ZStreamTotalInNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateReset(ZStreamTotalInUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateReset(ZStreamNextOutNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateReset(ZStreamNextOutUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateReset(ZStreamNextOutZero).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateReset(ZStreamNextOutUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateReset(ZStreamAvailableOutNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateReset(ZStreamAvailableOutUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateReset(ZStreamAvailableOutNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateReset(ZStreamAvailableOutUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateReset(ZStreamTotalOutNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateReset(ZStreamTotalOutUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateReset(ZStreamTotalOutNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateReset(ZStreamTotalOutUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateReset(ZStreamDataTypeNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateReset(ZStreamDataTypeUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateReset(ZStreamDataTypeNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateReset(ZStreamDataTypeUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateReset(ZStreamAdlerNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateReset(ZStreamAdlerUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateReset(ZStreamAdlerNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateReset(ZStreamAdlerUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            done();
            console.info("==================actsZipTest17 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_18
         * @tc.name       : actsZipTest18
         * @tc.desc       : test inflateSyncPoint
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest18', 0, async (done: Function) => {
            console.info("==================actsZipTest18 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            await zip.inflateInit({ nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1 }
            ).then(data => {
                console.info('inflateInit success');
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            await zip.inflateSyncPoint({ availableIn: 1 }).then(data => {
                console.info('inflateSyncPoint success');
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            done();
            console.info("==================actsZipTest18 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_19
         * @tc.name       : actsZipTest19
         * @tc.desc       : test inflateSync
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest19', 0, async (done: Function) => {
            console.info("==================actsZipTest19 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            await zip.inflateInit({ nextIn: arrayBufferIn, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1 }
            ).then(data => {
                console.info('inflateInit success');
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            await zip.inflateSync({ nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1 }).then(data => {
                console.info('inflateSync success');
                expect(data).assertFail()
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800005);
            })
            done();
            console.info("==================actsZipTest19 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_20
         * @tc.name       : actsZipTest20
         * @tc.desc       : test inflateResetKeep
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest20', 0, async (done: Function) => {
            console.info("==================actsZipTest20 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            await zip.inflateInit({ nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1 }
            ).then(data => {
                console.info('inflateInit success');
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            await zip.inflateResetKeep({ availableIn: 1 }).then(data => {
                console.info('inflateResetKeep success');
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            done();
            console.info("==================actsZipTest20 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_21
         * @tc.name       : actsZipTest21
         * @tc.desc       : test inflateReset2
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest21', 0, async (done: Function) => {
            console.info("==================actsZipTest21 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            await zip.inflateInit({ nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1 }
            ).then(data => {
                console.info('inflateInit success');
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            await zip.inflateReset2({ availableOut: 8 }, 15).then(data => {
                console.info('inflateReset2 success');
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            done();
            console.info("==================actsZipTest21 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_22
         * @tc.name       : actsZipTest22
         * @tc.desc       : test inflateReset
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest22', 0, async (done: Function) => {
            console.info("==================actsZipTest22 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            await zip.inflateInit({ nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1 }
            ).then(data => {
                console.info('inflateInit success');
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            await zip.inflateReset({ availableIn: 1, availableOut: 8 }).then(data => {
                console.info('inflateReset success');
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            done();
            console.info("==================actsZipTest22 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_23
         * @tc.name       : actsZipTest23
         * @tc.desc       : test inflatePrime
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest23', 0, async (done: Function) => {
            console.info("==================actsZipTest23 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            await zip.inflateInit({ nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1 }
            ).then(data => {
                console.info('inflateInit success');
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            await zip.inflatePrime({ nextOut: arrayBufferOut }, 5, 2).then(data => {
                console.info('inflatePrime success');
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })
            done();
            console.info("==================actsZipTest23 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_24
         * @tc.name       : actsZipTest24
         * @tc.desc       : test inflateGetHeader
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest24', 0, async (done: Function) => {
            console.info("==================actsZipTest24 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            await zip.inflateInit2({ nextIn: arrayBufferIn, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1 }, 28
            ).then(data => {
                console.info('inflateInit2 success');
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
            })
            await zip.inflateGetHeader({ availableIn: 1, availableOut: 1 },
                {
                    isText: true, os: 1, time: 1, xflags: 1, extra: arrayBufferIn, extraLen: 12,
                    name: arrayBufferIn, comment: arrayBufferOut, hcrc: true, done: true
                }).then(data => {
                    console.info('inflateGetHeader success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK)
                }).catch((errData: base.BusinessError) => {
                    console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                    expect(errData).assertFail();
                })
            done();
            console.info("==================actsZipTest24 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_25
         * @tc.name       : actsZipTest25
         * @tc.desc       : test inflateGetDictionary
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest25', 0, async (done: Function) => {
            console.info("==================actsZipTest25 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            await zip.inflateInit2({ nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1 }, 28
            ).then(data => {
                console.info('inflateInit2 success');
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
            })
            await zip.inflateGetDictionary({ nextOut: arrayBufferOut }, arrayBufferOut).then((data) => {
                console.info('inflateGetDictionary success:')
                expect(data.status).assertEqual(0);
                expect(data.dictionaryLength).assertEqual(0);
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
            })
            done();
            console.info("==================actsZipTest25 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_26
         * @tc.name       : actsZipTest26
         * @tc.desc       : test zlibVersion
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest26', 0, async (done: Function) => {
            console.info("==================actsZipTest26 start==================");
            let zip = zlib.createZipSync();
            await zip.zlibVersion().then((data) => {
                console.info('zlibVersion success')
                expect(typeof (data)).assertEqual("string");
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
            })
            done();
            console.info("==================actsZipTest26 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_27
         * @tc.name       : actsZipTest27
         * @tc.desc       : test zlibCompileFlags
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest27', 0, async (done: Function) => {
            console.info("==================actsZipTest27 start==================");
            let zip = zlib.createZipSync();
            await zip.zlibCompileFlags().then((data) => {
                console.info('zlibCompileFlags success')
                expect(data == 85 || data == 169).assertTrue();
            }).catch((errData: base.BusinessError) => {
                console.info('zlibCompileFlags fail')
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
            })
            done();
            console.info("==================actsZipTest27 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_28
         * @tc.name       : actsZipTest28
         * @tc.desc       : test compress
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest28', 0, async (done: Function) => {
            console.info("==================actsZipTest28 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            await zip.compress(arrayBufferOut, arrayBufferIn).then((data) => {
                console.info('compress success:');
                expect(data.status).assertEqual(0);
                expect(data.destLen).assertEqual(20);
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
            })
            done();
            console.info("==================actsZipTest28 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_29
         * @tc.name       : actsZipTest29
         * @tc.desc       : test uncompress
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest29', 0, async (done: Function) => {
            console.info("==================actsZipTest29 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            await zip.compress(arrayBufferOut, arrayBufferIn, 12).then((data) => {
                console.info('compress success');
                expect(data.status).assertEqual(0);
                expect(data.destLen).assertEqual(20);
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
            })
            await zip.uncompress(arrayBufferIn, arrayBufferOut, 20).then((data) => {
                console.info('uncompress success');
                expect(data.status).assertEqual(0);
                expect(data.destLen).assertEqual(12);
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
            })
            done();
            console.info("==================actsZipTest29 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_30
         * @tc.name       : actsZipTest30
         * @tc.desc       : test compress2 and uncompress2
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest30', 0, async (done: Function) => {
            console.info("==================actsZipTest30 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            await zip.compress2(arrayBufferOut, arrayBufferIn, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data) => {
                console.info('compress2 success');
                expect(data.status).assertEqual(0);
                expect(data.destLen).assertEqual(20);
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
            })
            await zip.uncompress2(arrayBufferIn, arrayBufferOut, 20).then((data) => {
                console.info('uncompress2 success');
                expect(data.status).assertEqual(0);
                expect(data.destLength).assertEqual(12);
                expect(data.sourceLength).assertEqual(20);
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
            })
            done();
            console.info("==================actsZipTest30 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_31
         * @tc.name       : actsZipTest31
         * @tc.desc       : test compressBound
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest31', 0, async (done: Function) => {
            console.info("==================actsZipTest31 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            await zip.compressBound(str.length).then((data) => {
                console.info('compressBound success')
                expect(data).assertEqual(25);
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
            })
            done();
            console.info("==================actsZipTest31 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_32
         * @tc.name       : actsZipTest32
         * @tc.desc       : test inflateBack
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest32', 0, async (done: Function) => {
            console.info("==================actsZipTest32 start==================");
            let readIn: (inDesc: object) => ArrayBuffer = (inDesc: object): ArrayBuffer => {
                console.info("inDesc = ", JSON.stringify(inDesc));
                let buffer = new ArrayBuffer(26)
                let array = new Uint8Array(buffer);
                array.set([31, 139, 8, 0, 0, 0, 0, 0, 0, 10, 243, 72, 205, 201, 201, 231, 2, 0, 22, 53, 150, 49, 6, 0, 0, 0]);
                return buffer;
            }

            let writeOut: (outDesc: object, buffer: ArrayBuffer, length: number) => number = (outDesc: object, buffer: ArrayBuffer, length: number): number => {
                console.info("outDesc = ", outDesc);
                console.info("buffer = ", buffer);
                console.info("length = ", length);
                let array = new Uint8Array(buffer);
                let dataString = "";
                for (let i = 0; i < length; i++) {
                    dataString += String.fromCharCode(array[i]);
                }
                console.info('writeOut ', dataString);
                return 0;
            }

            let have = 0;
            let first = 1;
            let arrayBuffer = new ArrayBuffer(26);
            let next = new Uint8Array(arrayBuffer);
            let last = 0;
            let index = 0;
            let flags = 0;
            let NEXT2: () => number = (): number => {
                let o6: object = new Object()
                if (!have) {
                    arrayBuffer = readIn(o6)
                    next = new Uint8Array(arrayBuffer);
                    console.info('readIn next = ', next.length)
                    have = next.length;
                }
                if (have) {
                    have--;
                    last = next[index];
                    index++;
                }
                else {
                    last = -1;
                }
                return last;
            }

            let inflateBackTest: () => void = (async () => {
                try {
                    have = 0;
                    first = 1;
                    arrayBuffer = new ArrayBuffer(26);
                    next = new Uint8Array(arrayBuffer);
                    last = 0;
                    index = 0;
                    flags = 0;
                    let sr = zlib.createZipSync();
                    let buffer = new ArrayBuffer(1024)
                    await sr.inflateBackInit({}, 15, buffer).then((result) => {
                        console.info('inflateBackInit Call result res', result)
                        expect(result).assertEqual(0);
                    })
                    let ret = 0;
                    for (; ;) {
                        if (NEXT2() == -1) {
                            ret = 0;
                            console.info('inflateBackTest Call result NEXT2() == -1')
                            break;
                        }
                        console.info('have =  last = ', have, last)
                        if (last != 31 || (NEXT2() != 139 && last >= 157 && last <= 157)) {
                            ret = first ? -3 : -1;
                            console.info('inflateBackTest Call result last != 31 || (NEXT2() != 139 && last != 157)')
                            break;
                        }
                        first = 0;
                        ret = -5;
                        if (NEXT2() != 8) {
                            if (last < 0) {
                                console.info('inflateBackTest Call result 1 last == -1')
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
                            console.info('inflateBackTest Call result 2 last == -1')
                            break;
                        }
                        console.info('index =  have = ', next[index], have)
                        let newArrayBuffer = new ArrayBuffer(have);
                        let newNext = new Uint8Array(newArrayBuffer);
                        for (let i = 0; i < have; i++) {
                            newNext[i] = next[26 - have + i];
                        }
                        console.info('newArrayBuffer.length = ', newArrayBuffer.byteLength)
                        console.info('newNext.length = ', newNext.length)
                        let zStream: zlib.ZStream = {
                            nextIn: newArrayBuffer,
                            availableIn: have,
                        };
                        await sr.inflateBack(
                            zStream,
                            readIn,
                            { fileName: 'test.gz' },
                            writeOut,
                            { fileName: 'test.gz' }).then((result) => {
                                ret = result;
                                console.info('inflateBack Call result res', result)
                                expect(result).assertEqual(1);
                            })
                        if (ret == 1) {
                            console.info('inflateBackTest Call result success')
                            break;
                        }
                    }
                    await sr.inflateBackEnd({}).then((result) => {
                        console.info('inflateBackEnd Call result res', result)
                        expect(result).assertEqual(0);
                    })
                }
                catch (errData) {
                    console.error(`errData is message:${errData}`);
                    expect(errData).assertFail();
                }
            })
            inflateBackTest();
            done();
            console.info("==================actsZipTest32 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_33
         * @tc.name       : actsZipTest33
         * @tc.desc       : test deflateInit2
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest33', 0, async (done: Function) => {
            console.info("==================actsZipTest33 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.deflateInit2({}, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED, 6, 15, zlib.MemLevel.MEM_LEVEL_DEFAULT,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then((data) => {
                        console.info('deflateInit2 success');
                        expect(data).assertFail();
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.deflateInit2({}, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED, 6, null, zlib.MemLevel.MEM_LEVEL_DEFAULT,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then((data) => {
                        console.info('deflateInit2 success');
                        expect(data).assertFail();
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401);
            }
            done();
            console.info("==================actsZipTest33 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_34
         * @tc.name       : actsZipTest34
         * @tc.desc       : test deflateInit
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest34', 0, async (done: Function) => {
            console.info("==================actsZipTest34 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.deflateInit({}, 10).then((data) => {
                    console.info('deflateInit success');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.deflateInit(null, null).then((data) => {
                    console.info('deflateInit success');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401);
            }
            done();
            console.info("==================actsZipTest34 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_35
         * @tc.name       : actsZipTest35
         * @tc.desc       : test compress
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest35', 0, async (done: Function) => {
            console.info("==================actsZipTest35 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(10);
            let zip = zlib.createZipSync();
            try {
                await zip.compress(arrayBufferOut, arrayBufferIn, 12).then((data) => {
                    console.info('compress success:');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800007);
            }
            try {
                await zip.compress(arrayBufferOut, null, null).then((data) => {
                    console.info('compress success:');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401);
            }
            done();
            console.info("==================actsZipTest35 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_36
         * @tc.name       : actsZipTest36
         * @tc.desc       : test compress2
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest36', 0, async (done: Function) => {
            console.info("==================actsZipTest36 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(10);
            let zip = zlib.createZipSync();
            try {
                await zip.compress2(arrayBufferOut, arrayBufferIn, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION).then((data) => {
                    console.info('compress2 success:');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800007);
            }
            try {
                await zip.compress2(arrayBufferOut, arrayBufferIn, null).then((data) => {
                    console.info('compress2 success:');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401);
            }
            done();
            console.info("==================actsZipTest36 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_37
         * @tc.name       : actsZipTest37
         * @tc.desc       : test compressBound
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest37', 0, async (done: Function) => {
            console.info("==================actsZipTest37 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.compressBound(null).then((data) => {
                    console.info('compressBound success:');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401);
            }
            done();
            console.info("==================actsZipTest37 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_38
         * @tc.name       : actsZipTest38
         * @tc.desc       : test uncompress
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest38', 0, async (done: Function) => {
            console.info("==================actsZipTest38 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let zip = zlib.createZipSync();
            let arrayBufferOut = new ArrayBuffer(100);
            try {
                await zip.uncompress(arrayBufferOut, arrayBufferIn, 12).then((data) => {
                    console.info('ucompress success:');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800005);
            }
            try {
                await zip.uncompress(arrayBufferOut, null, null).then((data) => {
                    console.info('ucompress success:');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401);
            }
            done();
            console.info("==================actsZipTest38 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_39
         * @tc.name       : actsZipTest39
         * @tc.desc       : test uncompress2
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest39', 0, async (done: Function) => {
            console.info("==================actsZipTest39 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.uncompress2(arrayBufferOut, arrayBufferIn, 12).then((data) => {
                    console.info('uncompress2 success:');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800005);
            }
            try {
                await zip.uncompress2(arrayBufferOut, null, null).then((data) => {
                    console.info('uncompress2 success:');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401);
            }
            done();
            console.info("==================actsZipTest39 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_40
         * @tc.name       : actsZipTest40
         * @tc.desc       : test inflateValidate
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest40', 0, async (done: Function) => {
            console.info("==================actsZipTest40 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.inflateValidate({ nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1 },
                    null).then(data => {
                        console.info('inflateValidate success')
                        expect(data).assertFail()
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401);
            }
            try {
                await zip.inflateValidate({ nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1 },
                    1).then(data => {
                        console.info('inflateValidate success')
                        expect(data).assertFail()
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800004);
            }
            done();
            console.info("==================actsZipTest40 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_41
         * @tc.name       : actsZipTest41
         * @tc.desc       : test deflateResetKeep
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest41', 0, async (done: Function) => {
            console.info("==================actsZipTest41 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zStream: zlib.ZStream = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1
            };
            let zip = zlib.createZipSync();
            await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data) => {
                expect(data).assertEqual(0)
            }).catch((errData: base.BusinessError) => {
                expect(errData).assertFail()
            })

            try {
                await zip.deflateResetKeep(null).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateResetKeep(undefined).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateResetKeep(ZStreamNextInNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateResetKeep(ZStreamNextInUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateResetKeep(ZStreamNextInZero).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateResetKeep(ZStreamNextInUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateResetKeep(ZStreamAvailableInNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateResetKeep(ZStreamAvailableInUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateResetKeep(ZStreamAvailableInNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateResetKeep(ZStreamAvailableInUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateResetKeep(ZStreamTotalInNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateResetKeep(ZStreamTotalInUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateResetKeep(ZStreamTotalInNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateResetKeep(ZStreamTotalInUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateResetKeep(ZStreamNextOutNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateResetKeep(ZStreamNextOutUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateResetKeep(ZStreamNextOutZero).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateResetKeep(ZStreamNextOutUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateResetKeep(ZStreamAvailableOutNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateResetKeep(ZStreamAvailableOutUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateResetKeep(ZStreamAvailableOutNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateResetKeep(ZStreamAvailableOutUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateResetKeep(ZStreamTotalOutNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateResetKeep(ZStreamTotalOutUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateResetKeep(ZStreamTotalOutNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateResetKeep(ZStreamTotalOutUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateResetKeep(ZStreamDataTypeNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateResetKeep(ZStreamDataTypeUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateResetKeep(ZStreamDataTypeNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateResetKeep(ZStreamDataTypeUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateResetKeep(ZStreamAdlerNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateResetKeep(ZStreamAdlerUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateResetKeep(ZStreamAdlerNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateResetKeep(ZStreamAdlerUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            done();
            console.info("==================actsZipTest41 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_42
         * @tc.name       : actsZipTest42
         * @tc.desc       : test inflateSyncPoint
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest42', 0, async (done: Function) => {
            console.info("==================actsZipTest42 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.inflateSyncPoint(null).then(data => {
                    console.info('inflateSyncPoint success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401);
            }
            try {
                await zip.inflateSyncPoint({ nextIn: arrayBufferOut, availableIn: 0, nextOut: arrayBufferIn, availableOut: 0 }).then(data => {
                    console.info('inflateSyncPoint success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800004);
            }
            done();
            console.info("==================actsZipTest42 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_43
         * @tc.name       : actsZipTest43
         * @tc.desc       : test inflateSync
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest43', 0, async (done: Function) => {
            console.info("==================actsZipTest43 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.inflateSync(null).then(data => {
                    console.info('inflateSync success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401);
            }
            try {
                await zip.inflateSync({ nextIn: arrayBufferOut, availableIn: 0, nextOut: arrayBufferIn, availableOut: 0 }).then(data => {
                    console.info('inflateSync success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800004);
            }
            done();
            console.info("==================actsZipTest43 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_44
         * @tc.name       : actsZipTest44
         * @tc.desc       : test inflateSetDictionary
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest44', 0, async (done: Function) => {
            console.info("==================actsZipTest44 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.inflateSetDictionary({ nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferIn, availableOut: 1 }, null).then(data => {
                    console.info('inflateSetDictionary success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401);
            }
            try {
                await zip.inflateSetDictionary({ nextIn: arrayBufferOut, availableIn: 2, nextOut: arrayBufferIn, availableOut: 2 }, arrayBufferOut).then(data => {
                    console.info('inflateSetDictionary success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800004);
            }
            done();
            console.info("==================actsZipTest44 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_45
         * @tc.name       : actsZipTest45
         * @tc.desc       : test inflateResetKeep
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest45', 0, async (done: Function) => {
            console.info("==================actsZipTest45 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.inflateResetKeep(null).then(data => {
                    console.info('inflateResetKeep success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401);
            }
            try {
                await zip.inflateResetKeep({ nextIn: arrayBufferOut, availableIn: 2, nextOut: arrayBufferIn, availableOut: 2 }).then(data => {
                    console.info('inflateResetKeep success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800004);
            }
            done();
            console.info("==================actsZipTest45 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_46
         * @tc.name       : actsZipTest46
         * @tc.desc       : test inflateReset
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest46', 0, async (done: Function) => {
            console.info("==================actsZipTest46 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.inflateReset(null).then(data => {
                    console.info('inflateReset success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401);
            }
            try {
                await zip.inflateReset({ nextIn: arrayBufferOut, availableIn: 2, nextOut: arrayBufferIn, availableOut: 2 }).then(data => {
                    console.info('inflateReset success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800004);
            }
            done();
            console.info("==================actsZipTest46 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_47
         * @tc.name       : actsZipTest47
         * @tc.desc       : test inflateReset2
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest47', 0, async (done: Function) => {
            console.info("==================actsZipTest47 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.inflateReset2({ nextIn: null, availableIn: 1, nextOut: arrayBufferIn, availableOut: 1 }, null).then(data => {
                    console.info('inflateReset2 success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401);
            }
            try {
                await zip.inflateReset2({ nextIn: arrayBufferOut, availableIn: 2, nextOut: arrayBufferIn, availableOut: 2 }, 10).then(data => {
                    console.info('inflateReset2 success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800004);
            }
            done();
            console.info("==================actsZipTest47 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_48
         * @tc.name       : actsZipTest48
         * @tc.desc       : test inflatePrime
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest48', 0, async (done: Function) => {
            console.info("==================actsZipTest48 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.inflatePrime({ nextIn: null, availableIn: 1, nextOut: arrayBufferIn, availableOut: 1 }, null, null).then(data => {
                    console.info('inflatePrime success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401);
            }
            try {
                await zip.inflatePrime({ nextIn: arrayBufferOut, availableIn: 2, nextOut: arrayBufferIn, availableOut: 2 }, 10, 10).then(data => {
                    console.info('inflatePrime success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800004);
            }
            done();
            console.info("==================actsZipTest48 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_49
         * @tc.name       : actsZipTest49
         * @tc.desc       : test inflateMark
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest49', 0, async (done: Function) => {
            console.info("==================actsZipTest49 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.inflateMark(null).then(data => {
                    console.info('inflateMark success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401);
            }
            done();
            console.info("==================actsZipTest49 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_50
         * @tc.name       : actsZipTest50
         * @tc.desc       : test inflateInit2
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest50', 0, async (done: Function) => {
            console.info("==================actsZipTest50 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.inflateInit2({ nextIn: arrayBufferOut, availableIn: 2, nextOut: arrayBufferIn, availableOut: 2 }, null).then(data => {
                    console.info('inflateInit2 success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401)
            }
            try {
                await zip.inflateInit2({}, 2).then(data => {
                    console.info('inflateInit2 success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800004);
            }
            done();
            console.info("==================actsZipTest50 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_51
         * @tc.name       : actsZipTest51
         * @tc.desc       : test inflateInit
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest51', 0, async (done: Function) => {
            console.info("==================actsZipTest51 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.inflateInit(null).then(data => {
                    console.info('inflateInit success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401)
            }
            done();
            console.info("==================actsZipTest51 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_52
         * @tc.name       : actsZipTest52
         * @tc.desc       : test inflateGetHeader
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest52', 0, async (done: Function) => {
            console.info("==================actsZipTest52 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.inflateGetHeader({ nextIn: null, availableIn: 2, nextOut: arrayBufferIn, availableOut: 2 }, null).then(data => {
                    console.info('inflateGetHeader success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401)
            }
            try {
                await zip.inflateGetHeader({ nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1 }, { isText: true }).then(data => {
                    console.info('inflateGetHeader success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800004);
            }
            done();
            console.info("==================actsZipTest52 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_53
         * @tc.name       : actsZipTest53
         * @tc.desc       : test inflateGetDictionary
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest53', 0, async (done: Function) => {
            console.info("==================actsZipTest53 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.inflateGetDictionary({ nextIn: null, availableIn: 2, nextOut: arrayBufferIn, availableOut: 2 }, null).then(data => {
                    console.info('inflateGetDictionary success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401)
            }
            try {
                await zip.inflateGetDictionary({ nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferIn, availableOut: 1 }, arrayBufferIn).then(data => {
                    console.info('inflateGetDictionary success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800004);
            }
            done();
            console.info("==================actsZipTest53 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_54
         * @tc.name       : actsZipTest54
         * @tc.desc       : test inflateEnd
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest54', 0, async (done: Function) => {
            console.info("==================actsZipTest54 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.inflateEnd(null).then(data => {
                    console.info('inflateEnd success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401)
            }
            try {
                await zip.inflateEnd({ nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferIn, availableOut: 1 }).then(data => {
                    console.info('inflateEnd success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800004);
            }
            done();
            console.info("==================actsZipTest54 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_55
         * @tc.name       : actsZipTest55
         * @tc.desc       : test inflateCopy
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest55', 0, async (done: Function) => {
            console.info("==================actsZipTest55 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.inflateCopy(null).then(data => {
                    console.info('inflateCopy success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401)
            }
            try {
                await zip.inflateCopy(zip).then(data => {
                    console.info('inflateCopy success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800004);
            }
            done();
            console.info("==================actsZipTest55 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_56
         * @tc.name       : actsZipTest56
         * @tc.desc       : test inflate
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest56', 0, async (done: Function) => {
            console.info("==================actsZipTest55 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.inflate(null, zlib.CompressFlushMode.FINISH).then(data => {
                    console.info('inflate success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401)
            }
            try {
                await zip.inflate({}, zlib.CompressFlushMode.FINISH).then(data => {
                    console.info('inflate success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800004);
            }
            done();
            console.info("==================actsZipTest56 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_57
         * @tc.name       : actsZipTest57
         * @tc.desc       : test deflate
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest57', 0, async (done: Function) => {
            console.info("==================actsZipTest57 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.deflate(null, zlib.CompressFlushMode.FINISH).then(data => {
                    console.info('deflate success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401)
            }
            try {
                await zip.deflate({}, zlib.CompressFlushMode.FINISH).then(data => {
                    console.info('deflate success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800004);
            }
            done();
            console.info("==================actsZipTest57 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_58
         * @tc.name       : actsZipTest58
         * @tc.desc       : test deflateBound
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest58', 0, async (done: Function) => {
            console.info("==================actsZipTest58 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.deflateBound(null, 12).then(data => {
                    console.info('deflateBound success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401)
            }
            done();
            console.info("==================actsZipTest58 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_59
         * @tc.name       : actsZipTest59
         * @tc.desc       : test deflateSetHeader
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest59', 0, async (done: Function) => {
            console.info("==================actsZipTest59 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.deflateSetHeader(null, {}).then(data => {
                    console.info('deflateSetHeader success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401)
            }
            try {
                await zip.deflateSetHeader({ nextIn: arrayBufferIn, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1 }, {}).then(data => {
                    console.info('deflateSetHeader success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800004);
            }
            done();
            console.info("==================actsZipTest59 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_60
         * @tc.name       : actsZipTest60
         * @tc.desc       : test inflateCodesUsed
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest60', 0, async (done: Function) => {
            console.info("==================actsZipTest60 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.inflateCodesUsed(null).then(data => {
                    console.info('inflateCodesUsed success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401)
            }
            done();
            console.info("==================actsZipTest60 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_61
         * @tc.name       : actsZipTest61
         * @tc.desc       : test deflateCopy
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest61', 0, async (done: Function) => {
            console.info("==================actsZipTest61 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.deflateCopy(null).then(data => {
                    console.info('deflateCopy success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401)
            }
            try {
                await zip.deflateCopy(zip).then(data => {
                    console.info('deflateCopy success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800004);
            }
            done();
            console.info("==================actsZipTest61 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_62
         * @tc.name       : actsZipTest62
         * @tc.desc       : test deflateSetDictionary
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest62', 0, async (done: Function) => {
            console.info("==================actsZipTest62 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.deflateSetDictionary(null, arrayBufferIn).then(data => {
                    console.info('deflateSetDictionary success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401)
            }
            try {
                await zip.deflateSetDictionary({ nextIn: arrayBufferIn, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1 }, arrayBufferIn).then(data => {
                    console.info('deflateSetDictionary success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800004);
            }
            done();
            console.info("==================actsZipTest62 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_63
         * @tc.name       : actsZipTest63
         * @tc.desc       : test deflateGetDictionary
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest63', 0, async (done: Function) => {
            console.info("==================actsZipTest63 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.deflateGetDictionary(null, arrayBufferIn).then(data => {
                    console.info('deflateGetDictionary success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401)
            }
            try {
                await zip.deflateGetDictionary({ nextIn: arrayBufferIn, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1 }, arrayBufferIn).then(data => {
                    console.info('deflateGetDictionary success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800004);
            }
            done();
            console.info("==================actsZipTest63 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_64
         * @tc.name       : actsZipTest64
         * @tc.desc       : test deflateTune
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest64', 0, async (done: Function) => {
            console.info("==================actsZipTest64 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.deflateTune(null, 1, 2, 34, null).then(data => {
                    console.info('deflateTune success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401)
            }
            try {
                await zip.deflateTune({ nextIn: arrayBufferIn, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1 }, 1, 2, 3, 4).then(data => {
                    console.info('deflateTune success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800004);
            }
            done();
            console.info("==================actsZipTest64 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_65
         * @tc.name       : actsZipTest65
         * @tc.desc       : test deflateReset
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest65', 0, async (done: Function) => {
            console.info("==================actsZipTest65 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.deflateReset(null).then(data => {
                    console.info('deflateReset success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401)
            }
            try {
                await zip.deflateReset({ nextIn: arrayBufferIn, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1 }).then(data => {
                    console.info('deflateReset success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800004);
            }
            done();
            console.info("==================actsZipTest65 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_66
         * @tc.name       : actsZipTest66
         * @tc.desc       : test deflateResetKeep
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest66', 0, async (done: Function) => {
            console.info("==================actsZipTest66 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.deflateResetKeep(null).then(data => {
                    console.info('deflateResetKeep success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401)
            }
            try {
                await zip.deflateResetKeep({ nextIn: arrayBufferIn, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1 }).then(data => {
                    console.info('deflateResetKeep success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800004);
            }
            done();
            console.info("==================actsZipTest66 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_67
         * @tc.name       : actsZipTest67
         * @tc.desc       : test deflatePending
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest67', 0, async (done: Function) => {
            console.info("==================actsZipTest67 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.deflatePending(null).then(data => {
                    console.info('deflatePending success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401)
            }
            try {
                await zip.deflatePending({ nextIn: arrayBufferIn, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1 }).then(data => {
                    console.info('deflatePending success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800004);
            }
            done();
            console.info("==================actsZipTest67 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_68
         * @tc.name       : actsZipTest68
         * @tc.desc       : test deflateParams
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest68', 0, async (done: Function) => {
            console.info("==================actsZipTest68 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.deflateParams({}, null, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                    console.info('deflateParams success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401)
            }
            try {
                await zip.deflateParams({}, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                    console.info('deflateParams success')
                    expect(data).assertFail()
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800004);
            }
            done();
            console.info("==================actsZipTest68 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_69
         * @tc.name       : actsZipTest69
         * @tc.desc       : test deflatePrime
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest69', 0, async (done: Function) => {
            console.info("==================actsZipTest69 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.deflatePrime({}, null, 1).then(data => {
                    console.info('deflatePrime success')
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401)
            }
            try {
                await zip.deflatePrime({}, 1, 1).then(data => {
                    console.info('deflatePrime success')
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800004);
            }
            done();
            console.info("==================actsZipTest69 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_70
         * @tc.name       : actsZipTest70
         * @tc.desc       : test inflateCodesUsed
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest70', 0, async (done: Function) => {
            console.info("==================actsZipTest70 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            await zip.inflateInit({ nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1 }
            ).then(data => {
                console.info('inflateInit success');
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
            })
            await zip.inflateCodesUsed({ nextIn: arrayBufferIn, availableIn: 1, nextOut: arrayBufferOut, availableOut: 8 }).then(data => {
                console.info('inflateCodesUsed success');
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
            })
            done();
            console.info("==================actsZipTest70 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_71
         * @tc.name       : actsZipTest71
         * @tc.desc       : test inflateMark
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest71', 0, async (done: Function) => {
            console.info("==================actsZipTest71 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zStream: zlib.ZStream = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1
            };
            let zip = zlib.createZipSync();
            await zip.inflateInit({ nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1 }
            ).then(data => {
                console.info('inflateInit success');
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
            })
            await zip.inflateMark({ nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1 }).then(data => {
                console.info('inflateMark success');
                expect(data).assertEqual(-65536);
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
            })
            done();
            console.info("==================actsZipTest71 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_72
         * @tc.name       : actsZipTest72
         * @tc.desc       : test inflate
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest72', 0, async (done: Function) => {
            console.info("==================actsZipTest72 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.inflateInit({ nextIn: arrayBufferOut, availableIn: 2 }).then(data => {
                    console.info('inflateInit success')
                    expect(data).assertEqual(0)
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
            }
            await zip.inflate({ nextOut: arrayBufferIn, availableOut: 20 }, zlib.CompressFlushMode.NO_FLUSH).then((data) => {
                console.info('inflate success')
                expect(data).assertFail();
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(17800005);
                expect(zlib.CompressFlushMode.NO_FLUSH).assertEqual(0);
                expect(zlib.CompressFlushMode.PARTIAL_FLUSH).assertEqual(1);
            })
            done();
            console.info("==================actsZipTest72 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_73
         * @tc.name       : actsZipTest73
         * @tc.desc       : test inflate
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest73', 0, async (done: Function) => {
            console.info("==================actsZipTest73 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            await zip.compress(arrayBufferOut, arrayBufferIn, 20).then((data) => {
                console.info('compress success');
                expect(data.status).assertEqual(0);
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
            })
            await zip.uncompress(arrayBufferIn, arrayBufferOut, 20).then((data) => {
                console.info('uncompress success', data.status);
                expect().assertFail();
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800007);
            })
            done();
            console.info("==================actsZipTest73 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_74
         * @tc.name       : actsZipTest74
         * @tc.desc       : test inflateSync
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest74', 0, async (done: Function) => {
            console.info("==================actsZipTest74 start==================");
            let str = 'hello, hello!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            await zip.deflateInit({}, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION).then((data) => {
                console.info('deflateInit success')
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
            })
            await zip.deflate({ nextIn: arrayBufferIn, availableIn: 3, nextOut: arrayBufferOut, availableOut: 100 }, zlib.CompressFlushMode.FULL_FLUSH).then((data) => {
                console.info('deflate success')
                expect(data).assertEqual(zlib.ReturnStatus.OK)
                expect(zlib.CompressFlushMode.FINISH).assertEqual(4);
                expect(zlib.CompressFlushMode.BLOCK).assertEqual(5);
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
            })
            await zip.deflate({ availableIn: 11 }, zlib.CompressFlushMode.FINISH).then((data) => {
                console.info('deflate success')
                expect(data).assertEqual(zlib.ReturnStatus.STREAM_END);
                expect(zlib.CompressFlushMode.SYNC_FLUSH).assertEqual(2);
                expect(zlib.CompressFlushMode.FULL_FLUSH).assertEqual(3);
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
            })
            await zip.deflateEnd({}).then(data => {
                console.info('deflateEnd success')
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
            })
            try {
                await zip.inflateInit({ nextIn: arrayBufferOut, availableIn: 2 }).then(data => {
                    console.info('inflateInit2 success')
                    expect(data).assertEqual(zlib.ReturnStatus.OK)
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
            }
            await zip.inflate({ nextOut: arrayBufferIn, availableOut: 28 }, zlib.CompressFlushMode.NO_FLUSH).then((data) => {
                console.info('inflate success')
                expect(data).assertEqual(zlib.ReturnStatus.OK)
                expect(zlib.CompressFlushMode.TREES).assertEqual(6);
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
            })
            await zip.inflateSync({ availableIn: 26 }).then(data => {
                console.info('inflateSync success');
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
            })
            await zip.inflateEnd({ nextOut: arrayBufferOut }).then((data) => {
                console.info('inflateEnd success')
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
            })
            done();
            console.info("==================actsZipTest74 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_75
         * @tc.name       : actsZipTest75
         * @tc.desc       : test inflateSetDictionary
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest75', 0, async (done: Function) => {
            console.info("==================actsZipTest75 start==================");
            let str = 'hello, hello!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            let dictionary = 'hello'
            let dictionarybuf = new ArrayBuffer(dictionary.length);
            let dictionarybufdata = new Uint8Array(dictionarybuf);
            for (let i = 0, j = dictionary.length; i < j; i++) {
                dictionarybufdata[i] = str.charCodeAt(i);
            }
            await zip.deflateInit({}, zlib.CompressLevel.COMPRESS_LEVEL_BEST_COMPRESSION).then((data) => {
                console.info('deflateInit success')
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            })
            await zip.deflateSetDictionary({}, dictionarybuf).then((data) => {
                console.info('deflateSetDictionary success')
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            })
            await zip.deflate({ nextIn: arrayBufferIn, availableIn: 14, nextOut: arrayBufferOut, availableOut: 100 },
                zlib.CompressFlushMode.FINISH).then((data) => {
                    console.info('deflate success')
                    expect(data).assertEqual(zlib.ReturnStatus.STREAM_END)
                    expect(zlib.ReturnStatus.STREAM_END).assertEqual(1);
                    expect(zlib.ReturnStatus.NEED_DICT).assertEqual(2);
                }).catch((errData: base.BusinessError) => {
                    console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                    expect(errData).assertFail();
                })
            await zip.deflateEnd({}).then(data => {
                console.info('deflateEnd success')
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            })
            try {
                await zip.inflateInit({ nextIn: arrayBufferOut, availableIn: 100 }).then(data => {
                    console.info('inflateInit success')
                    expect(data).assertEqual(zlib.ReturnStatus.OK)
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail()
            }
            await zip.inflate({ nextOut: arrayBufferIn, availableOut: 28 }, zlib.CompressFlushMode.NO_FLUSH).then((data) => {
                console.info('inflate success')
                expect(data).assertEqual(2)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail()
            })
            await zip.inflateSetDictionary({}, dictionarybuf).then((data) => {
                console.info('inflateSetDictionary success')
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            })
            await zip.inflateEnd({ nextOut: arrayBufferOut }).then((data) => {
                console.info('inflateEnd success')
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            })
            done();
            console.info("==================actsZipTest75 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_76
         * @tc.name       : actsZipTest76
         * @tc.desc       : test deflateEnd
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest76', 0, async (done: Function) => {
            console.info("==================actsZipTest76 start==================");
            let zip = zlib.createZipSync();
            try {
                await zip.deflateEnd(null).then(data => {
                    console.info('deflateEnd success')
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401);
            }
            done();
            console.info("==================actsZipTest76 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_77
         * @tc.name       : actsZipTest77
         * @tc.desc       : test inflateBackEnd
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest77', 0, async (done: Function) => {
            console.info("==================actsZipTest77 start==================");
            let zip = zlib.createZipSync();
            try {
                await zip.inflateBackInit({}, null, null).then(data => {
                    console.info('inflateBackInit success')
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401);
            }
            try {
                await zip.inflateBackEnd({}).then(data => {
                    console.info('inflateBackInit success')
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBackEnd(null).then(data => {
                    console.info('inflateBackInit success')
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401);
            }
            done();
            console.info("==================actsZipTest77 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_78
         * @tc.name       : actsZipTest78
         * @tc.desc       : test inflateBack
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 2
         */
        it('actsZipTest78', 0, async (done: Function) => {
            console.info("==================actsZipTest78 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.inflateBack({}, null, null, null, null).then(data => {
                    console.info('inflateBack success')
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflateBackInit({}, 15, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success')
                    expect(data).assertEqual(zlib.ReturnStatus.OK)
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
            }

            try {
                await zip.inflateBack({}, null, null, null, null).then(data => {
                    console.info('inflateBack success')
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(401);
            }
            done();
            console.info("==================actsZipTest78 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_79
         * @tc.name       : actsZipTest79
         * @tc.desc       : test inflateBackInit
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest79', 0, async (done: Function) => {
            console.info("==================actsZipTest79 start==================");
            let zip = zlib.createZipSync();
            let buffer = new ArrayBuffer(1024)
            try {
                await zip.inflateBackInit({}, -1, buffer).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            try {
                await zip.inflateBackInit({}, 20, buffer).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            done();
            console.info("==================actsZipTest79 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_80
         * @tc.name       : actsZipTest80
         * @tc.desc       : test deflatePrime
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest80', 0, async (done: Function) => {
            console.info("==================actsZipTest80 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.deflatePrime({ nextOut: arrayBufferOut }, -1, 2).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            try {
                await zip.deflatePrime({ nextOut: arrayBufferOut }, 17, 2).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            done();
            console.info("==================actsZipTest80 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_81
         * @tc.name       : actsZipTest81
         * @tc.desc       : test compress
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest81', 0, async (done: Function) => {
            console.info("==================actsZipTest81 start==================");
            let arrayBufferIn = new ArrayBuffer(0);
            let arrayBufferOut = new ArrayBuffer(0);
            let zip = zlib.createZipSync();
            try {
                await zip.compress(arrayBufferOut, arrayBufferIn).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800007);
            }
            done();
            console.info("==================actsZipTest81 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_82
         * @tc.name       : actsZipTest82
         * @tc.desc       : test compress2
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest82', 0, async (done: Function) => {
            console.info("==================actsZipTest82 start==================");
            let arrayBufferIn = new ArrayBuffer(0);
            let arrayBufferOut = new ArrayBuffer(0);
            let zip = zlib.createZipSync();
            try {
                await zip.compress2(arrayBufferOut, arrayBufferIn, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED)
                    .then(() => {
                        expect().assertFail();
                    })
            } catch (errData) {
                expect(errData.code).assertEqual(17800007);
            }
            done();
            console.info("==================actsZipTest82 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_83
         * @tc.name       : actsZipTest83
         * @tc.desc       : test uncompress
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest83', 0, async (done: Function) => {
            console.info("==================actsZipTest83 start==================");
            let arrayBufferIn = new ArrayBuffer(0);
            let arrayBufferOut = new ArrayBuffer(0);
            let zip = zlib.createZipSync();
            try {
                await zip.uncompress(arrayBufferIn, arrayBufferOut, 20).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800007);
            }
            done();
            console.info("==================actsZipTest83 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_84
         * @tc.name       : actsZipTest84
         * @tc.desc       : test uncompress2
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest84', 0, async (done: Function) => {
            console.info("==================actsZipTest84 start==================");
            let arrayBufferIn = new ArrayBuffer(0);
            let arrayBufferOut = new ArrayBuffer(0);
            let zip = zlib.createZipSync();
            try {
                await zip.uncompress2(arrayBufferIn, arrayBufferOut, 20).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800007);
            }
            done();
            console.info("==================actsZipTest84 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_85
         * @tc.name       : actsZipTest85
         * @tc.desc       : test deflatePending
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest85', 0, async (done: Function) => {
            console.info("==================actsZipTest85 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zStream: zlib.ZStream = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1
            };
            let zip = zlib.createZipSync();
            await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data) => {
                console.info('deflateInit success')
                expect(data).assertEqual(0)
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail()
            })

            try {
                await zip.deflatePending(null).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflatePending(undefined).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflatePending(ZStreamNextInNull).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflatePending(ZStreamNextInUndefined).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflatePending(ZStreamNextInZero).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflatePending(ZStreamNextInUnset).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflatePending(ZStreamAvailableInNull).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflatePending(ZStreamAvailableInUndefined).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflatePending(ZStreamAvailableInNegative).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflatePending(ZStreamAvailableInUnset).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflatePending(ZStreamTotalInNull).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflatePending(ZStreamTotalInUndefined).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflatePending(ZStreamTotalInNegative).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflatePending(ZStreamTotalInUnset).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflatePending(ZStreamNextOutNull).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflatePending(ZStreamNextOutUndefined).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflatePending(ZStreamNextOutZero).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflatePending(ZStreamNextOutUnset).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflatePending(ZStreamAvailableOutNull).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflatePending(ZStreamAvailableOutUndefined).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflatePending(ZStreamAvailableOutNegative).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflatePending(ZStreamAvailableOutUnset).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflatePending(ZStreamTotalOutNull).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflatePending(ZStreamTotalOutUndefined).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflatePending(ZStreamTotalOutNegative).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflatePending(ZStreamTotalOutUnset).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflatePending(ZStreamDataTypeNull).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflatePending(ZStreamDataTypeUndefined).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflatePending(ZStreamDataTypeNegative).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflatePending(ZStreamDataTypeUnset).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflatePending(ZStreamAdlerNull).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflatePending(ZStreamAdlerUndefined).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflatePending(ZStreamAdlerNegative).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflatePending(ZStreamAdlerUnset).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            done();
            console.info("==================actsZipTest85 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_86
         * @tc.name       : actsZipTest86
         * @tc.desc       : test inflateInit2
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest86', 0, async (done: Function) => {
            console.info("==================actsZipTest86 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(0);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({ nextOut: arrayBufferOut }, 17, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflatePrime({ nextOut: arrayBufferOut }, -1, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK)
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({ nextOut: arrayBufferOut }, 5, -1).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK)
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({ availableOut: 8 }, -1).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, -1).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, null).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, undefined).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.inflateReset2({ availableOut: 8 }, null).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.inflateReset2({ availableOut: 8 }, undefined).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.inflateReset2({ availableOut: 8 }, undefined).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.inflatePrime({ nextOut: arrayBufferOut }, null, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.inflatePrime({ nextOut: arrayBufferOut }, undefined, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.inflatePrime({ nextOut: arrayBufferOut }, 5, null).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.inflatePrime({ nextOut: arrayBufferOut }, 5, undefined).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(401);
            }
            done();
            console.info("==================actsZipTest86 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_87
         * @tc.name       : actsZipTest87
         * @tc.desc       : test inflateBackInit
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest87', 0, async (done: Function) => {
            console.info("==================actsZipTest87 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let arrayBuffer = new ArrayBuffer(0);
            let zip = zlib.createZipSync();
            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, -1, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 16, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, null, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, undefined, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 10, arrayBuffer).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 10, null).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 10, undefined).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(401);
            }
            done();
            console.info("==================actsZipTest87 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_88
         * @tc.name       : actsZipTest88
         * @tc.desc       : test inflateBackInit
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest88', 0, async (done: Function) => {
            console.info("==================actsZipTest88 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let arrayBuffer = new ArrayBuffer(0);
            let zip = zlib.createZipSync();
            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut, availableOut: 1, totalOut: 2,
                    dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK)
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut, availableOut: 1, totalOut: 2,
                    dataType: 1, adler: 2
                }, -1, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(401)
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut, availableOut: 1, totalOut: 2,
                    dataType: 1, adler: 2
                }, 17, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(401)
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut, availableOut: 1, totalOut: 2,
                    dataType: 1, adler: 2
                }, null, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(401)
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut, availableOut: 1, totalOut: 2,
                    dataType: 1, adler: 2
                }, undefined, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(401)
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut, availableOut: 1, totalOut: 2,
                    dataType: 1, adler: 2
                }, 10, -1).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK)
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut, availableOut: 1, totalOut: 2,
                    dataType: 1, adler: 2
                }, 10, null).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(401)
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut, availableOut: 1, totalOut: 2,
                    dataType: 1, adler: 2
                }, 10, undefined).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(401)
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut, availableOut: 1, totalOut: 2,
                    dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, null, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertFail();
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(401)
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut, availableOut: 1, totalOut: 2,
                    dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, undefined, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertFail();
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(401)
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut, availableOut: 1, totalOut: 2,
                    dataType: 1, adler: 2
                }, null, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertFail();
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(401)
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut, availableOut: 1, totalOut: 2,
                    dataType: 1, adler: 2
                }, undefined, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertFail();
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(401)
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut, availableOut: 1, totalOut: 2,
                    dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, null,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertFail();
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(401)
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut, availableOut: 1, totalOut: 2,
                    dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, undefined,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertFail();
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(401)
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut, availableOut: 1, totalOut: 2,
                    dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    null, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertFail();
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(401)
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut, availableOut: 1, totalOut: 2,
                    dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    undefined, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertFail();
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(401)
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut, availableOut: 1, totalOut: 2,
                    dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, null).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertFail();
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(401)
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut, availableOut: 1, totalOut: 2,
                    dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, undefined).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertFail();
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertEqual(401)
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut, availableOut: 1, totalOut: 2,
                    dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK)
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData.code).assertFail();
            }
            done();
            console.info("==================actsZipTest88 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_89
         * @tc.name       : actsZipTest89
         * @tc.desc       : test inflateInit2
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest89', 0, async (done: Function) => {
            console.info("==================actsZipTest89 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let arrayBuffer = new ArrayBuffer(0);
            let zip = zlib.createZipSync();
            try {
                await zip.inflateInit2({
                    nextIn: arrayBuffer, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: null, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: undefined, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: -1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: null, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: undefined, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: -1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: null, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: undefined, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBuffer,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: null,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: undefined,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, availableOut: 1, totalOut: 2, dataType: 1,
                    adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: -1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: null, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: undefined, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: -2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: null, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: undefined, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: -1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: null, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: undefined, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: 1, adler: -2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: 1, adler: null
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: 1, adler: undefined
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: 1
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }
            done();
            console.info("==================actsZipTest89 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_90
         * @tc.name       : actsZipTest90
         * @tc.desc       : test inflateReset2
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest90', 0, async (done: Function) => {
            console.info("==================actsZipTest90 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let arrayBuffer = new ArrayBuffer(0);
            let zip = zlib.createZipSync();
            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({
                    nextIn: arrayBuffer, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({
                    nextIn: null, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({
                    nextIn: undefined, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({
                    availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({
                    nextIn: arrayBufferIn, availableIn: -1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({
                    nextIn: arrayBufferIn, availableIn: null, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({
                    nextIn: arrayBufferIn, availableIn: undefined, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({
                    nextIn: arrayBufferIn, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: -1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: null, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: undefined, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({
                    nextIn: arrayBufferIn, availableIn: 2, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBuffer,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: null,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: undefined,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, availableOut: 1, totalOut: 2, dataType: 1,
                    adler: 2
                }, 8).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: -1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: null, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: undefined, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: -2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: null, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: undefined, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: -1, adler: 2
                }, 8).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: null, adler: 2
                }, 8).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: undefined, adler: 2
                }, 8).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, adler: 2
                }, 8).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: 1, adler: -2
                }, 8).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: 1, adler: null
                }, 8).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: 1, adler: undefined
                }, 8).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateReset2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: 1
                }, 8).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }
            done();
            console.info("==================actsZipTest90 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_91
         * @tc.name       : actsZipTest91
         * @tc.desc       : test inflateReset2
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest91', 0, async (done: Function) => {
            console.info("==================actsZipTest91 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let arrayBuffer = new ArrayBuffer(0);
            let zip = zlib.createZipSync();
            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({
                    nextIn: arrayBuffer, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({
                    nextIn: null, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({
                    nextIn: undefined, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({
                    availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({
                    nextIn: arrayBufferIn, availableIn: -1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({
                    nextIn: arrayBufferIn, availableIn: null, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({
                    nextIn: arrayBufferIn, availableIn: undefined, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({
                    nextIn: arrayBufferIn, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: -1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: null, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: undefined, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBuffer,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: null,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: undefined,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, availableOut: 1, totalOut: 2, dataType: 1,
                    adler: 2
                }, 8, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: -1, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: null, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: undefined, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: -2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: null, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: undefined, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: -1, adler: 2
                }, 8, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: null, adler: 2
                }, 8, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: undefined, adler: 2
                }, 8, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, adler: 2
                }, 8, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateInit2({
                    nextIn: arrayBufferIn, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8).then(data => {
                    console.info('inflateInit2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: 1, adler: -2
                }, 8, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: 1, adler: null
                }, 8, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: 1, adler: undefined
                }, 8, 2).then(data => {
                    console.info('inflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: 1
                }, 8, 2).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }
            done();
            console.info("==================actsZipTest91 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_92
         * @tc.name       : actsZipTest92
         * @tc.desc       : test inflateBackInit
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest92', 0, async (done: Function) => {
            console.info("==================actsZipTest92 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let arrayBuffer = new ArrayBuffer(0);
            let zip = zlib.createZipSync();
            try {
                await zip.inflateBackInit({
                    nextIn: arrayBuffer, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateBackInit({
                    nextIn: null, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateBackInit({
                    nextIn: undefined, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateBackInit({
                    availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: -1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: null, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: undefined, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: -1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: null, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: undefined, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: 2, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBuffer,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: null,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: undefined,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, availableOut: 1, totalOut: 2, dataType: 1,
                    adler: 2
                }, 8, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: -1, totalOut: 2, dataType: 1, adler: 2
                }, 8, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: null, totalOut: 2, dataType: 1, adler: 2
                }, 8, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: undefined, totalOut: 2, dataType: 1, adler: 2
                }, 8, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    totalOut: 2, dataType: 1, adler: 2
                }, 8, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: -2, dataType: 1, adler: 2
                }, 8, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: null, dataType: 1, adler: 2
                }, 8, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: undefined, dataType: 1, adler: 2
                }, 8, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, dataType: 1, adler: 2
                }, 8, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: -1, adler: 2
                }, 8, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: null, adler: 2
                }, 8, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: undefined, adler: 2
                }, 8, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, adler: 2
                }, 8, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: 1, adler: -2
                }, 8, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: 1, adler: null
                }, 8, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: 1, adler: undefined
                }, 8, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.inflateBackInit({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: 1
                }, 8, arrayBufferOut).then(data => {
                    console.info('inflateBackInit success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }
            done();
            console.info("==================actsZipTest92 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_93
         * @tc.name       : actsZipTest93
         * @tc.desc       : test deflateInit2
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest93', 0, async (done: Function) => {
            console.info("==================actsZipTest93 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let arrayBuffer = new ArrayBuffer(0);
            let zip = zlib.createZipSync();
            try {
                await zip.deflateInit2({
                    nextIn: arrayBuffer, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: null, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: undefined, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: -1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: null, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: undefined, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: -1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: null, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: undefined, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBuffer,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: null,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: undefined,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, availableOut: 1, totalOut: 2, dataType: 1,
                    adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: -1, totalOut: 2, dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: null, totalOut: 2, dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: undefined, totalOut: 2, dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    totalOut: 2, dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: -2, dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: null, dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: undefined, dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: -1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: null, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: undefined, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: 1, adler: -2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: 1, adler: null
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: 1, adler: undefined
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: 1
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }
            done();
            console.info("==================actsZipTest93 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_94
         * @tc.name       : actsZipTest94
         * @tc.desc       : test inflateReset2
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest94', 0, async (done: Function) => {
            console.info("==================actsZipTest94 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let arrayBuffer = new ArrayBuffer(0);
            let zip = zlib.createZipSync();
            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBuffer, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: null, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: undefined, availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    availableIn: 1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: -1, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: null, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: undefined, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, totalIn: 1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: -1, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: null, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: undefined, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, nextOut: arrayBufferOut,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBuffer,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: null,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: undefined,
                    availableOut: 1, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, availableOut: 1, totalOut: 2, dataType: 1,
                    adler: 2
                }, 8, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: -1, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: null, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: undefined, totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    totalOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: -2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: null, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: undefined, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, dataType: 1, adler: 2
                }, 8, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: -1, adler: 2
                }, 8, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: null, adler: 2
                }, 8, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: undefined, adler: 2
                }, 8, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, adler: 2
                }, 8, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflateInit2({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: 1, adler: 2
                }, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressMethod.DEFLATED, 8,
                    zlib.MemLevel.MEM_LEVEL_MIN, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        console.info('deflateInit2 success');
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: 1, adler: -2
                }, 8, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: 1, adler: null
                }, 8, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: 1, adler: undefined
                }, 8, 2).then(data => {
                    console.info('deflatePrime success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }

            try {
                await zip.deflatePrime({
                    nextIn: arrayBufferIn, availableIn: 2, totalIn: 5, nextOut: arrayBufferOut,
                    availableOut: 2, totalOut: 2, dataType: 1
                }, 8, 2).then(data => {
                    console.info('inflateReset2 success');
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
                expect(errData).assertFail();
            }
            done();
            console.info("==================actsZipTest94 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_95
         * @tc.name       : actsZipTest95
         * @tc.desc       : test deflateParams
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest95', 0, async (done: Function) => {
            console.info("==================actsZipTest95 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zStream: zlib.ZStream = {
                nextIn: arrayBufferIn,
                availableIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1
            };
            let zip = zlib.createZipSync()
            await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data) => {
                expect(data).assertEqual(0)
            }).catch((errData: base.BusinessError) => {
                expect(errData).assertFail()
            })

            try {
                await zip.deflateParams(null, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(() => {
                        expect().assertFail();
                    })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateParams(undefined, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(() => {
                        expect().assertFail();
                    })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateParams(ZStreamComplete, null, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY)
                    .then(() => {
                        expect().assertFail();
                    })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateParams(ZStreamComplete, undefined, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY)
                    .then(() => {
                        expect().assertFail();
                    })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateParams(ZStreamComplete, -2, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.deflateParams(ZStreamComplete, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION, null).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateParams(ZStreamComplete, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION, undefined)
                    .then(() => {
                        expect().assertFail();
                    })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateParams(ZStreamComplete, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION, -1).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.deflateParams(ZStreamNextInNull, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateParams(ZStreamNextInUndefined, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateParams(ZStreamNextInZero, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateParams(ZStreamNextInUnset, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateParams(ZStreamAvailableInNull, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateParams(ZStreamAvailableInUndefined, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateParams(ZStreamAvailableInNegative, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateParams(ZStreamAvailableInUnset, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateParams(ZStreamTotalInNull, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateParams(ZStreamTotalInUndefined, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateParams(ZStreamTotalInNegative, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateParams(ZStreamTotalInUnset, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateParams(ZStreamNextOutNull, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateParams(ZStreamNextOutUndefined, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateParams(ZStreamNextOutZero, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateParams(ZStreamNextOutUnset, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateParams(ZStreamAvailableOutNull, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateParams(ZStreamAvailableOutUndefined, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateParams(ZStreamAvailableOutNegative, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateParams(ZStreamAvailableOutUnset, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateParams(ZStreamTotalOutNull, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateParams(ZStreamTotalOutUndefined, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateParams(ZStreamTotalOutNegative, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateParams(ZStreamTotalOutUnset, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateParams(ZStreamDataTypeNull, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateParams(ZStreamDataTypeUndefined, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateParams(ZStreamDataTypeNegative, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateParams(ZStreamDataTypeUnset, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateParams(ZStreamAdlerNull, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateParams(ZStreamAdlerUndefined, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateParams(ZStreamAdlerNegative, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateParams(ZStreamAdlerUnset, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
                        expect(data).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }

            done();
            console.info("==================actsZipTest95 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_96
         * @tc.name       : actsZipTest96
         * @tc.desc       : test inflateCopy
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest96', 0, async (done: Function) => {
            console.info("==================actsZipTest96 start==================");

            let zip = zlib.createZipSync();
            await zip.inflateInit(ZStreamComplete).then(data => {
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                expect(errData).assertFail()
            })

            try {
                await zip.inflateCopy(zip).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateCopy(null).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            try {
                await zip.inflateCopy(undefined).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            done();
            console.info("==================actsZipTest96 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_97
         * @tc.name       : actsZipTest97
         * @tc.desc       : test inflateReset
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest97', 0, async (done: Function) => {
            console.info("==================actsZipTest97 start==================");

            let zip = zlib.createZipSync();
            await zip.inflateInit(ZStreamComplete).then(data => {
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                expect(errData).assertFail()
            })

            try {
                await zip.inflateReset(null).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            try {
                await zip.inflateReset(undefined).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.inflateReset(ZStreamNextInUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateReset(ZStreamNextInNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateReset(ZStreamNextInUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateReset(ZStreamNextInZero).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateReset(ZStreamAvailableInUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateReset(ZStreamAvailableInNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateReset(ZStreamAvailableInUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateReset(ZStreamAvailableInNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateReset(ZStreamTotalInUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateReset(ZStreamTotalInNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateReset(ZStreamTotalInUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateReset(ZStreamTotalInNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateReset(ZStreamNextOutUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateReset(ZStreamNextOutNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateReset(ZStreamNextOutUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateReset(ZStreamNextOutZero).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateReset(ZStreamAvailableOutUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateReset(ZStreamAvailableOutNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateReset(ZStreamAvailableOutUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateReset(ZStreamAvailableOutNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateReset(ZStreamTotalOutUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateReset(ZStreamTotalOutNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateReset(ZStreamTotalOutUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateReset(ZStreamTotalOutNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateReset(ZStreamDataTypeUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateReset(ZStreamDataTypeNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateReset(ZStreamDataTypeUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateReset(ZStreamDataTypeNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateReset(ZStreamAdlerUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateReset(ZStreamAdlerNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateReset(ZStreamAdlerUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateReset(ZStreamAdlerNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            done();
            console.info("==================actsZipTest97 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_98
         * @tc.name       : actsZipTest98
         * @tc.desc       : test inflateGetHeader
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest98', 0, async (done: Function) => {
            console.info("==================actsZipTest98 start==================");

            let zip = zlib.createZipSync();
            await zip.inflateInit2(ZStreamComplete, 28).then(data => {
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                expect(errData).assertFail();
            })

            try {
                await zip.inflateGetHeader(null, gzHeader_complete).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            try {
                await zip.inflateGetHeader(undefined, gzHeader_complete).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.inflateGetHeader(ZStreamNextInUnset, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamNextInNull, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamNextInUndefined, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamNextInZero, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateGetHeader(ZStreamAvailableInUnset, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamAvailableInNull, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamAvailableInUndefined, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamAvailableInNegative, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateGetHeader(ZStreamTotalInUnset, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamTotalInNull, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamTotalInUndefined, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamTotalInNegative, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateGetHeader(ZStreamNextOutUnset, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamNextOutNull, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamNextOutUndefined, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamNextOutZero, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateGetHeader(ZStreamAvailableOutUnset, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamAvailableOutNull, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamAvailableOutUndefined, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamAvailableOutNegative, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateGetHeader(ZStreamTotalOutUnset, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamTotalOutNull, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamTotalOutUndefined, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamTotalOutNegative, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateGetHeader(ZStreamDataTypeUnset, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamDataTypeNull, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamDataTypeUndefined, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamDataTypeNegative, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateGetHeader(ZStreamAdlerUnset, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamAdlerNull, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamAdlerUndefined, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamAdlerNegative, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateGetHeader(ZStreamComplete, null).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            try {
                await zip.inflateGetHeader(ZStreamComplete, undefined).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_isText_empty).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_isText_null).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_isText_undefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_os_empty).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_os_null).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_os_undefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_os_negative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_time_empty).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_time_null).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_time_undefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_time_negative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_xflags_empty).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_xflags_null).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_xflags_undefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_xflags_negative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_extra_empty).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_extra_null).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_extra_undefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_extra_zero).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_extraLen_empty).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_extraLen_null).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_extraLen_undefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_extraLen_negative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_name_empty).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_name_null).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_name_undefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_name_zero).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_comment_empty).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_comment_null).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_comment_undefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_comment_zero).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_hcrc_empty).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_hcrc_null).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_hcrc_undefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_done_empty).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_done_null).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetHeader(ZStreamComplete, gzHeader_done_undefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            done();
            console.info("==================actsZipTest98 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_99
         * @tc.name       : actsZipTest99
         * @tc.desc       : test inflateGetDictionary
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest99', 0, async (done: Function) => {
            console.info("==================actsZipTest99 start==================");
            let zip = zlib.createZipSync();
            await zip.inflateInit2(ZStreamComplete, 28).then(data => {
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                expect(errData).assertFail();
            })

            let arrayBufferOut = new ArrayBuffer(100);
            let arrayBufferZero = new ArrayBuffer(0);

            try {
                await zip.inflateGetDictionary(null, arrayBufferOut).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            try {
                await zip.inflateGetDictionary(undefined, arrayBufferOut).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.inflateGetDictionary(ZStreamNextInUnset, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetDictionary(ZStreamNextInNull, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetDictionary(ZStreamNextInUndefined, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetDictionary(ZStreamNextInZero, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateGetDictionary(ZStreamAvailableInUnset, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetDictionary(ZStreamAvailableInNull, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetDictionary(ZStreamAvailableInUndefined, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetDictionary(ZStreamAvailableInNegative, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateGetDictionary(ZStreamTotalInUnset, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetDictionary(ZStreamTotalInNull, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetDictionary(ZStreamTotalInUndefined, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetDictionary(ZStreamTotalInNegative, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateGetDictionary(ZStreamNextOutUnset, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetDictionary(ZStreamNextOutNull, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetDictionary(ZStreamNextOutUndefined, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetDictionary(ZStreamNextOutZero, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateGetDictionary(ZStreamAvailableOutUnset, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetDictionary(ZStreamAvailableOutNull, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetDictionary(ZStreamAvailableOutUndefined, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetDictionary(ZStreamAvailableOutNegative, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateGetDictionary(ZStreamTotalOutUnset, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetDictionary(ZStreamTotalOutNull, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetDictionary(ZStreamTotalOutUndefined, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetDictionary(ZStreamTotalOutNegative, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateGetDictionary(ZStreamDataTypeUnset, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetDictionary(ZStreamDataTypeNull, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetDictionary(ZStreamDataTypeUndefined, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetDictionary(ZStreamDataTypeNegative, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateGetDictionary(ZStreamAdlerUnset, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetDictionary(ZStreamAdlerNull, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetDictionary(ZStreamAdlerUndefined, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateGetDictionary(ZStreamAdlerNegative, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateGetDictionary(ZStreamComplete, null).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            try {
                await zip.inflateGetDictionary(ZStreamComplete, undefined).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            try {
                await zip.inflateGetDictionary(ZStreamComplete, arrayBufferZero).then((data) => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            done();
            console.info("==================actsZipTest99 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_100
         * @tc.name       : actsZipTest100
         * @tc.desc       : test inflateBack
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest100', 0, async (done: Function) => {
            console.info("==================actsZipTest100 start==================");

            let zip = zlib.createZipSync();
            let readIn: (inDesc: object) => ArrayBuffer = (inDesc: object): ArrayBuffer => {
                return new ArrayBuffer(1);
            }
            let writeOut: (outDesc: object, buffer: ArrayBuffer, length: number) => number =
                (outDesc: object, buffer: ArrayBuffer, length: number): number => {
                    return 0;
                }
            let inDesc = new Object({
                fileName: 'test.gz'
            });
            let outDesc = new Object({
                fileName: 'test.gz'
            });

            try {
                await zip.inflateBack(null, readIn, inDesc, writeOut, outDesc).then((result) => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            try {
                await zip.inflateBack(undefined, readIn, inDesc, writeOut, outDesc).then((result) => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.inflateBack(ZStreamComplete, null, inDesc, writeOut, outDesc).then((result) => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBack(ZStreamComplete, undefined, inDesc, writeOut, outDesc).then((result) => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflateBack(ZStreamComplete, readIn, null, writeOut, outDesc).then((result) => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBack(ZStreamComplete, readIn, undefined, writeOut, outDesc).then((result) => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflateBack(ZStreamComplete, readIn, inDesc, null, outDesc).then((result) => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBack(ZStreamComplete, readIn, inDesc, undefined, outDesc).then((result) => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflateBack(ZStreamComplete, readIn, inDesc, writeOut, null).then((result) => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBack(ZStreamComplete, readIn, inDesc, writeOut, undefined).then((result) => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflateBack(ZStreamNextInUnset, readIn, inDesc, writeOut, outDesc).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBack(ZStreamNextInNull, readIn, inDesc, writeOut, outDesc).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBack(ZStreamNextInUndefined, readIn, inDesc, writeOut, outDesc).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBack(ZStreamNextInZero, readIn, inDesc, writeOut, outDesc).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflateBack(ZStreamAvailableInUnset, readIn, inDesc, writeOut, outDesc).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBack(ZStreamAvailableInNull, readIn, inDesc, writeOut, outDesc).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBack(ZStreamAvailableInUndefined, readIn, inDesc, writeOut, outDesc).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBack(ZStreamAvailableInNegative, readIn, inDesc, writeOut, outDesc).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflateBack(ZStreamTotalInUnset, readIn, inDesc, writeOut, outDesc).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBack(ZStreamTotalInNull, readIn, inDesc, writeOut, outDesc).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBack(ZStreamTotalInUndefined, readIn, inDesc, writeOut, outDesc).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBack(ZStreamTotalInNegative, readIn, inDesc, writeOut, outDesc).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflateBack(ZStreamNextOutUnset, readIn, inDesc, writeOut, outDesc).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBack(ZStreamNextOutNull, readIn, inDesc, writeOut, outDesc).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBack(ZStreamNextOutUndefined, readIn, inDesc, writeOut, outDesc).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBack(ZStreamNextOutZero, readIn, inDesc, writeOut, outDesc).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflateBack(ZStreamAvailableOutUnset, readIn, inDesc, writeOut, outDesc).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBack(ZStreamAvailableOutNull, readIn, inDesc, writeOut, outDesc).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBack(ZStreamAvailableOutUndefined, readIn, inDesc, writeOut, outDesc).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBack(ZStreamAvailableOutNegative, readIn, inDesc, writeOut, outDesc).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflateBack(ZStreamTotalOutUnset, readIn, inDesc, writeOut, outDesc).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBack(ZStreamTotalOutNull, readIn, inDesc, writeOut, outDesc).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBack(ZStreamTotalOutUndefined, readIn, inDesc, writeOut, outDesc).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBack(ZStreamTotalOutNegative, readIn, inDesc, writeOut, outDesc).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflateBack(ZStreamDataTypeUnset, readIn, inDesc, writeOut, outDesc).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBack(ZStreamDataTypeNull, readIn, inDesc, writeOut, outDesc).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBack(ZStreamDataTypeUndefined, readIn, inDesc, writeOut, outDesc).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBack(ZStreamDataTypeNegative, readIn, inDesc, writeOut, outDesc).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflateBack(ZStreamAdlerUnset, readIn, inDesc, writeOut, outDesc).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBack(ZStreamAdlerNull, readIn, inDesc, writeOut, outDesc).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBack(ZStreamAdlerUndefined, readIn, inDesc, writeOut, outDesc).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBack(ZStreamAdlerNegative, readIn, inDesc, writeOut, outDesc).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            done();
            console.info("==================actsZipTest100 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_101
         * @tc.name       : actsZipTest101
         * @tc.desc       : test inflateMark
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest101', 0, async (done: Function) => {
            console.info("==================actsZipTest101 start==================");

            let zip = zlib.createZipSync();

            try {
                await zip.inflateMark(null).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            try {
                await zip.inflateMark(undefined).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.inflateMark(ZStreamNextInUnset).then(data => {
                    expect(data).assertEqual(-65536);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateMark(ZStreamNextInNull).then(data => {
                    expect(data).assertEqual(-65536);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateMark(ZStreamNextInUndefined).then(data => {
                    expect(data).assertEqual(-65536);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateMark(ZStreamNextInZero).then(data => {
                    expect(data).assertEqual(-65536);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateMark(ZStreamAvailableInUnset).then(data => {
                    expect(data).assertEqual(-65536);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateMark(ZStreamAvailableInNull).then(data => {
                    expect(data).assertEqual(-65536);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateMark(ZStreamAvailableInUndefined).then(data => {
                    expect(data).assertEqual(-65536);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateMark(ZStreamAvailableInNegative).then(data => {
                    expect(data).assertEqual(-65536);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateMark(ZStreamTotalInUnset).then(data => {
                    expect(data).assertEqual(-65536);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateMark(ZStreamTotalInNull).then(data => {
                    expect(data).assertEqual(-65536);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateMark(ZStreamTotalInUndefined).then(data => {
                    expect(data).assertEqual(-65536);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateMark(ZStreamTotalInNegative).then(data => {
                    expect(data).assertEqual(-65536);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateMark(ZStreamNextOutUnset).then(data => {
                    expect(data).assertEqual(-65536);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateMark(ZStreamNextOutNull).then(data => {
                    expect(data).assertEqual(-65536);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateMark(ZStreamNextOutUndefined).then(data => {
                    expect(data).assertEqual(-65536);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateMark(ZStreamNextOutZero).then(data => {
                    expect(data).assertEqual(-65536);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateMark(ZStreamAvailableOutUnset).then(data => {
                    expect(data).assertEqual(-65536);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateMark(ZStreamAvailableOutNull).then(data => {
                    expect(data).assertEqual(-65536);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateMark(ZStreamAvailableOutUndefined).then(data => {
                    expect(data).assertEqual(-65536);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateMark(ZStreamAvailableOutNegative).then(data => {
                    expect(data).assertEqual(-65536);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateMark(ZStreamTotalOutUnset).then(data => {
                    expect(data).assertEqual(-65536);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateMark(ZStreamTotalOutNull).then(data => {
                    expect(data).assertEqual(-65536);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateMark(ZStreamTotalOutUndefined).then(data => {
                    expect(data).assertEqual(-65536);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateMark(ZStreamTotalOutNegative).then(data => {
                    expect(data).assertEqual(-65536);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateMark(ZStreamDataTypeUnset).then(data => {
                    expect(data).assertEqual(-65536);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateMark(ZStreamDataTypeNull).then(data => {
                    expect(data).assertEqual(-65536);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateMark(ZStreamDataTypeUndefined).then(data => {
                    expect(data).assertEqual(-65536);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateMark(ZStreamDataTypeNegative).then(data => {
                    expect(data).assertEqual(-65536);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateMark(ZStreamAdlerUnset).then(data => {
                    expect(data).assertEqual(-65536);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateMark(ZStreamAdlerNull).then(data => {
                    expect(data).assertEqual(-65536);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateMark(ZStreamAdlerUndefined).then(data => {
                    expect(data).assertEqual(-65536);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateMark(ZStreamAdlerNegative).then(data => {
                    expect(data).assertEqual(-65536);
                })
            } catch (errData) {
                expect().assertFail();
            }

            done();
            console.info("==================actsZipTest101 end==================");
        })


        /**
         * @tc.number     : ACTS_ZipTest_102
         * @tc.name       : actsZipTest102
         * @tc.desc       : test inflateInit
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest102', 0, async (done: Function) => {
            console.info("==================actsZipTest102 start==================");

            let zip = zlib.createZipSync();

            try {
                await zip.inflateInit(null).then(data => {
                    expect(data).assertFail()
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401)
            }
            try {
                await zip.inflateInit(undefined).then((data) => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.inflateInit(ZStreamNextInUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateInit(ZStreamNextInNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateInit(ZStreamNextInUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateInit(ZStreamNextInZero).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateInit(ZStreamAvailableInUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateInit(ZStreamAvailableInNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateInit(ZStreamAvailableInUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateInit(ZStreamAvailableInNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateInit(ZStreamTotalInUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateInit(ZStreamTotalInNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateInit(ZStreamTotalInUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateInit(ZStreamTotalInNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateInit(ZStreamNextOutUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateInit(ZStreamNextOutNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateInit(ZStreamNextOutUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateInit(ZStreamNextOutZero).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateInit(ZStreamAvailableOutUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateInit(ZStreamAvailableOutNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateInit(ZStreamAvailableOutUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateInit(ZStreamAvailableOutNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateInit(ZStreamTotalOutUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateInit(ZStreamTotalOutNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateInit(ZStreamTotalOutUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateInit(ZStreamTotalOutNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateInit(ZStreamDataTypeUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateInit(ZStreamDataTypeNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateInit(ZStreamDataTypeUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateInit(ZStreamDataTypeNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateInit(ZStreamAdlerUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateInit(ZStreamAdlerNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateInit(ZStreamAdlerUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateInit(ZStreamAdlerNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            done();
            console.info("==================actsZipTest102 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_103
         * @tc.name       : actsZipTest103
         * @tc.desc       : test inflateEnd
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest103', 0, async (done: Function) => {
            console.info("==================actsZipTest103 start==================");

            let zip = zlib.createZipSync();

            try {
                await zip.inflateEnd(null).then(data => {
                    expect(data).assertFail()
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401)
            }
            try {
                await zip.inflateEnd(undefined).then((data) => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.inflateEnd(ZStreamNextInUnset).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateEnd(ZStreamNextInNull).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateEnd(ZStreamNextInUndefined).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateEnd(ZStreamNextInZero).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflateEnd(ZStreamAvailableInUnset).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateEnd(ZStreamAvailableInNull).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateEnd(ZStreamAvailableInUndefined).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateEnd(ZStreamAvailableInNegative).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflateEnd(ZStreamTotalInUnset).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateEnd(ZStreamTotalInNull).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateEnd(ZStreamTotalInUndefined).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateEnd(ZStreamTotalInNegative).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflateEnd(ZStreamNextOutUnset).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateEnd(ZStreamNextOutNull).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateEnd(ZStreamNextOutUndefined).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateEnd(ZStreamNextOutZero).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflateEnd(ZStreamAvailableOutUnset).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateEnd(ZStreamAvailableOutNull).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateEnd(ZStreamAvailableOutUndefined).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateEnd(ZStreamAvailableOutNegative).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflateEnd(ZStreamTotalOutUnset).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateEnd(ZStreamTotalOutNull).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateEnd(ZStreamTotalOutUndefined).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateEnd(ZStreamTotalOutNegative).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflateEnd(ZStreamDataTypeUnset).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateEnd(ZStreamDataTypeNull).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateEnd(ZStreamDataTypeUndefined).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateEnd(ZStreamDataTypeNegative).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflateEnd(ZStreamAdlerUnset).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateEnd(ZStreamAdlerNull).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateEnd(ZStreamAdlerUndefined).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateEnd(ZStreamAdlerNegative).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            done();
            console.info("==================actsZipTest103 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_104
         * @tc.name       : actsZipTest104
         * @tc.desc       : test inflateCodesUsed
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest104', 0, async (done: Function) => {
            console.info("==================actsZipTest104 start==================");

            let zip = zlib.createZipSync();

            try {
                await zip.inflateCodesUsed(null).then(data => {
                    expect(data).assertFail()
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401)
            }
            try {
                await zip.inflateCodesUsed(undefined).then((data) => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.inflateCodesUsed(ZStreamNextInUnset).then(data => {
                    expect(data).assertEqual(4294967295);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateCodesUsed(ZStreamNextInNull).then(data => {
                    expect(data).assertEqual(4294967295);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateCodesUsed(ZStreamNextInUndefined).then(data => {
                    expect(data).assertEqual(4294967295);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateCodesUsed(ZStreamNextInZero).then(data => {
                    expect(data).assertEqual(4294967295);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateCodesUsed(ZStreamAvailableInUnset).then(data => {
                    expect(data).assertEqual(4294967295);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateCodesUsed(ZStreamAvailableInNull).then(data => {
                    expect(data).assertEqual(4294967295);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateCodesUsed(ZStreamAvailableInUndefined).then(data => {
                    expect(data).assertEqual(4294967295);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateCodesUsed(ZStreamAvailableInNegative).then(data => {
                    expect(data).assertEqual(4294967295);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateCodesUsed(ZStreamTotalInUnset).then(data => {
                    expect(data).assertEqual(4294967295);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateCodesUsed(ZStreamTotalInNull).then(data => {
                    expect(data).assertEqual(4294967295);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateCodesUsed(ZStreamTotalInUndefined).then(data => {
                    expect(data).assertEqual(4294967295);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateCodesUsed(ZStreamTotalInNegative).then(data => {
                    expect(data).assertEqual(4294967295);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateCodesUsed(ZStreamNextOutUnset).then(data => {
                    expect(data).assertEqual(4294967295);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateCodesUsed(ZStreamNextOutNull).then(data => {
                    expect(data).assertEqual(4294967295);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateCodesUsed(ZStreamNextOutUndefined).then(data => {
                    expect(data).assertEqual(4294967295);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateCodesUsed(ZStreamNextOutZero).then(data => {
                    expect(data).assertEqual(4294967295);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateCodesUsed(ZStreamAvailableOutUnset).then(data => {
                    expect(data).assertEqual(4294967295);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateCodesUsed(ZStreamAvailableOutNull).then(data => {
                    expect(data).assertEqual(4294967295);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateCodesUsed(ZStreamAvailableOutUndefined).then(data => {
                    expect(data).assertEqual(4294967295);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateCodesUsed(ZStreamAvailableOutNegative).then(data => {
                    expect(data).assertEqual(4294967295);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateCodesUsed(ZStreamTotalOutUnset).then(data => {
                    expect(data).assertEqual(4294967295);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateCodesUsed(ZStreamTotalOutNull).then(data => {
                    expect(data).assertEqual(4294967295);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateCodesUsed(ZStreamTotalOutUndefined).then(data => {
                    expect(data).assertEqual(4294967295);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateCodesUsed(ZStreamTotalOutNegative).then(data => {
                    expect(data).assertEqual(4294967295);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateCodesUsed(ZStreamDataTypeUnset).then(data => {
                    expect(data).assertEqual(4294967295);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateCodesUsed(ZStreamDataTypeNull).then(data => {
                    expect(data).assertEqual(4294967295);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateCodesUsed(ZStreamDataTypeUndefined).then(data => {
                    expect(data).assertEqual(4294967295);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateCodesUsed(ZStreamDataTypeNegative).then(data => {
                    expect(data).assertEqual(4294967295);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateCodesUsed(ZStreamAdlerUnset).then(data => {
                    expect(data).assertEqual(4294967295);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateCodesUsed(ZStreamAdlerNull).then(data => {
                    expect(data).assertEqual(4294967295);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateCodesUsed(ZStreamAdlerUndefined).then(data => {
                    expect(data).assertEqual(4294967295);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await zip.inflateCodesUsed(ZStreamAdlerNegative).then(data => {
                    expect(data).assertEqual(4294967295);
                })
            } catch (errData) {
                expect().assertFail();
            }

            done();
            console.info("==================actsZipTest104 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_105
         * @tc.name       : actsZipTest105
         * @tc.desc       : test inflateBackEnd
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest105', 0, async (done: Function) => {
            console.info("==================actsZipTest105 start==================");
            let zip = zlib.createZipSync();

            try {
                await zip.inflateBackEnd(null).then(data => {
                    expect(data).assertFail()
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401)
            }
            try {
                await zip.inflateBackEnd(undefined).then((data) => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.inflateBackEnd(ZStreamNextInUnset).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBackEnd(ZStreamNextInNull).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBackEnd(ZStreamNextInUndefined).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBackEnd(ZStreamNextInZero).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflateBackEnd(ZStreamAvailableInUnset).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBackEnd(ZStreamAvailableInNull).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBackEnd(ZStreamAvailableInUndefined).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBackEnd(ZStreamAvailableInNegative).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflateBackEnd(ZStreamTotalInUnset).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBackEnd(ZStreamTotalInNull).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBackEnd(ZStreamTotalInUndefined).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBackEnd(ZStreamTotalInNegative).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflateBackEnd(ZStreamNextOutUnset).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBackEnd(ZStreamNextOutNull).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBackEnd(ZStreamNextOutUndefined).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBackEnd(ZStreamNextOutZero).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflateBackEnd(ZStreamAvailableOutUnset).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBackEnd(ZStreamAvailableOutNull).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBackEnd(ZStreamAvailableOutUndefined).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBackEnd(ZStreamAvailableOutNegative).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflateBackEnd(ZStreamTotalOutUnset).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBackEnd(ZStreamTotalOutNull).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBackEnd(ZStreamTotalOutUndefined).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBackEnd(ZStreamTotalOutNegative).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflateBackEnd(ZStreamDataTypeUnset).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBackEnd(ZStreamDataTypeNull).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBackEnd(ZStreamDataTypeUndefined).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBackEnd(ZStreamDataTypeNegative).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflateBackEnd(ZStreamAdlerUnset).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBackEnd(ZStreamAdlerNull).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBackEnd(ZStreamAdlerUndefined).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            try {
                await zip.inflateBackEnd(ZStreamAdlerNegative).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            done();
            console.info("==================actsZipTest105 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_106
         * @tc.name       : actsZipTest106
         * @tc.desc       : test compress
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest106', 0, async (done: Function) => {
            console.info("==================actsZipTest106 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i);
            }
            let arrayBufferOut = new ArrayBuffer(10);
            let zip = zlib.createZipSync();

            try {
                await zip.compress(null, arrayBufferIn, 1).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.compress(undefined, arrayBufferIn, 1).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.compress(new ArrayBuffer(0), arrayBufferIn, 1).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800007);
            }

            try {
                await zip.compress(arrayBufferOut, null, 1).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.compress(arrayBufferOut, undefined, 1).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.compress(arrayBufferOut, new ArrayBuffer(0), 1).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800007);
            }

            try {
                await zip.compress(arrayBufferOut, arrayBufferIn, null).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800007);
            }

            try {
                await zip.compress(arrayBufferOut, arrayBufferIn, undefined).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                ;
                expect(errData.code).assertEqual(17800007);
            }

            try {
                await zip.compress(arrayBufferOut, arrayBufferIn, -1).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.compress(arrayBufferOut, arrayBufferIn).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800007);
            }

            done();
            console.info("==================actsZipTest106 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_107
         * @tc.name       : actsZipTest107
         * @tc.desc       : test compress2
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest107', 0, async (done: Function) => {
            console.info("==================actsZipTest107 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i);
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();

            try {
                await zip.compress2(null, arrayBufferIn, 1, 1).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.compress2(undefined, arrayBufferIn, 1, 1).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.compress2(new ArrayBuffer(0), arrayBufferIn, 1, 1).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800007);
            }

            try {
                await zip.compress2(arrayBufferOut, null, 1, 1).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.compress2(arrayBufferOut, undefined, 1, 1).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.compress2(arrayBufferOut, new ArrayBuffer(0), 1, 1).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800007);
            }

            try {
                await zip.compress2(arrayBufferOut, arrayBufferIn, null, 1).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.compress2(arrayBufferOut, arrayBufferIn, undefined, 1).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                ;
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.compress2(arrayBufferOut, arrayBufferIn, -2, 1).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.compress2(arrayBufferOut, arrayBufferIn, 1, null).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.compress2(arrayBufferOut, arrayBufferIn, 1, undefined).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                ;
                expect().assertFail();
            }

            try {
                await zip.compress2(arrayBufferOut, arrayBufferIn, 1, -1).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.compress2(arrayBufferOut, arrayBufferIn, 1).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            done();
            console.info("==================actsZipTest107 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_108
         * @tc.name       : actsZipTest108
         * @tc.desc       : test uncompress
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest108', 0, async (done: Function) => {
            console.info("==================actsZipTest108 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i);
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.compress(arrayBufferOut, arrayBufferIn, 12).then((data) => {
                    expect(data.status).assertEqual(0);
                    expect(data.destLen).assertEqual(20);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.uncompress(null, arrayBufferIn, 1).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.uncompress(undefined, arrayBufferIn, 1).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.uncompress(new ArrayBuffer(0), arrayBufferIn, 1).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800007);
            }

            try {
                await zip.uncompress(arrayBufferOut, null, 1).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.uncompress(arrayBufferOut, undefined, 1).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.uncompress(arrayBufferOut, new ArrayBuffer(0), 1).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800007);
            }

            try {
                await zip.uncompress(arrayBufferIn, arrayBufferOut, null).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.uncompress(arrayBufferIn, arrayBufferOut, undefined).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                ;
                expect().assertFail();
            }

            try {
                await zip.uncompress(arrayBufferIn, arrayBufferOut, -1).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.uncompress(arrayBufferIn, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            done();
            console.info("==================actsZipTest108 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_109
         * @tc.name       : actsZipTest109
         * @tc.desc       : test uncompress2
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest109', 0, async (done: Function) => {
            console.info("==================actsZipTest109 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i);
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();

            try {
                await zip.compress2(arrayBufferOut, arrayBufferIn, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED)
                    .then((data) => {
                        expect(data.status).assertEqual(0);
                        expect(data.destLen).assertEqual(20);
                    })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.uncompress2(null, arrayBufferIn, 1).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.uncompress2(undefined, arrayBufferIn, 1).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.uncompress2(new ArrayBuffer(0), arrayBufferIn, 1).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800007);
            }

            try {
                await zip.uncompress2(arrayBufferOut, null, 1).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.uncompress2(arrayBufferOut, undefined, 1).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.uncompress2(arrayBufferOut, new ArrayBuffer(0), 1).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800007);
            }

            try {
                await zip.uncompress2(arrayBufferIn, arrayBufferOut, null).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.uncompress2(arrayBufferIn, arrayBufferOut, undefined).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                ;
                expect().assertFail();
            }

            try {
                await zip.uncompress2(arrayBufferIn, arrayBufferOut, -1).then(data => {
                    expect(data).assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.uncompress2(arrayBufferIn, arrayBufferOut).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            done();
            console.info("==================actsZipTest109 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_110
         * @tc.name       : actsZipTest110
         * @tc.desc       : test compressBound
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest110', 0, async (done: Function) => {
            console.info("==================actsZipTest110 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i);
            }
            let zip = zlib.createZipSync();

            try {
                await zip.compressBound(null).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.compressBound(undefined).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.compressBound(-1).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            done();
            console.info("==================actsZipTest110 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_111
         * @tc.name       : actsZipTest111
         * @tc.desc       : test inflateValidate
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest111', 0, async (done: Function) => {
            console.info("==================actsZipTest111 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i);
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();

            await zip.inflateInit({
                nextIn: arrayBufferIn, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1
            }
            ).then(data => {
                expect(data).assertEqual(zlib.ReturnStatus.OK);
            }).catch((errData: base.BusinessError) => {
                expect(errData).assertFail();
            })

            try {
                await zip.inflateValidate(ZStreamNextInNull, 1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateValidate(ZStreamNextInUndefined, 1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateValidate(ZStreamNextInZero, 1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateValidate(ZStreamNextInUnset, 1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateValidate(ZStreamAvailableInNull, 1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateValidate(ZStreamAvailableInUndefined, 1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateValidate(ZStreamAvailableInNegative, 1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateValidate(ZStreamAvailableInUnset, 1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateValidate(ZStreamTotalInNull, 1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateValidate(ZStreamTotalInUndefined, 1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateValidate(ZStreamTotalInNegative, 1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateValidate(ZStreamTotalInUnset, 1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateValidate(ZStreamNextOutNull, 1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateValidate(ZStreamNextOutUndefined, 1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateValidate(ZStreamNextOutZero, 1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateValidate(ZStreamNextOutUnset, 1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateValidate(ZStreamAvailableOutNull, 1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateValidate(ZStreamAvailableOutUndefined, 1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateValidate(ZStreamAvailableOutNegative, 1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateValidate(ZStreamAvailableOutUnset, 1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateValidate(ZStreamTotalOutNull, 1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateValidate(ZStreamTotalOutUndefined, 1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateValidate(ZStreamTotalOutNegative, 1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateValidate(ZStreamTotalOutUnset, 1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateValidate(ZStreamDataTypeNull, 1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateValidate(ZStreamDataTypeUndefined, 1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateValidate(ZStreamDataTypeNegative, 1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateValidate(ZStreamDataTypeUnset, 1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateValidate(ZStreamAdlerNull, 1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateValidate(ZStreamAdlerUndefined, 1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateValidate(ZStreamAdlerNegative, 1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateValidate(ZStreamAdlerUnset, 1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateValidate(ZStreamComplete, null).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.inflateValidate(ZStreamComplete, undefined).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.inflateValidate(ZStreamComplete, -1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            done();
            console.info("==================actsZipTest111 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_112
         * @tc.name       : actsZipTest112
         * @tc.desc       : test inflateSyncPoint
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest112', 0, async (done: Function) => {
            console.info("==================actsZipTest112 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();

            await zip.inflateInit({
                nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1
            }
            ).then(data => {
                expect(data).assertEqual(zlib.ReturnStatus.OK);
            }).catch((errData: base.BusinessError) => {
                expect(errData).assertFail();
            })

            try {
                await zip.inflateSyncPoint(ZStreamNextInNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSyncPoint(ZStreamNextInUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSyncPoint(ZStreamNextInZero).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSyncPoint(ZStreamNextInUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSyncPoint(ZStreamAvailableInNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSyncPoint(ZStreamAvailableInUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSyncPoint(ZStreamAvailableInNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSyncPoint(ZStreamAvailableInUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSyncPoint(ZStreamTotalInNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSyncPoint(ZStreamTotalInUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSyncPoint(ZStreamTotalInNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSyncPoint(ZStreamTotalInUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSyncPoint(ZStreamNextOutNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSyncPoint(ZStreamNextOutUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSyncPoint(ZStreamNextOutZero).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSyncPoint(ZStreamNextOutUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSyncPoint(ZStreamAvailableOutNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSyncPoint(ZStreamAvailableOutUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSyncPoint(ZStreamAvailableOutNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSyncPoint(ZStreamAvailableOutUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSyncPoint(ZStreamTotalOutNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSyncPoint(ZStreamTotalOutUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSyncPoint(ZStreamTotalOutNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSyncPoint(ZStreamTotalOutUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSyncPoint(ZStreamDataTypeNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSyncPoint(ZStreamDataTypeUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSyncPoint(ZStreamDataTypeNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSyncPoint(ZStreamDataTypeUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSyncPoint(ZStreamAdlerNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSyncPoint(ZStreamAdlerUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSyncPoint(ZStreamAdlerNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSyncPoint(ZStreamAdlerUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            done();
            console.info("==================actsZipTest112 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_113
         * @tc.name       : actsZipTest113
         * @tc.desc       : test inflateSync
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest113', 0, async (done: Function) => {
            console.info("==================actsZipTest113 start==================");
            let str = 'hello, hello!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            await zip.deflateInit({}, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION).then((data) => {
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                expect(errData).assertFail();
            })
            await zip.deflate({
                nextIn: arrayBufferIn, availableIn: 3, nextOut: arrayBufferOut, availableOut: 100
            }, zlib.CompressFlushMode.FULL_FLUSH).then((data) => {
                expect(data).assertEqual(zlib.ReturnStatus.OK)
                expect(zlib.CompressFlushMode.FINISH).assertEqual(4);
                expect(zlib.CompressFlushMode.BLOCK).assertEqual(5);
            }).catch((errData: base.BusinessError) => {
                expect(errData).assertFail();
            })
            await zip.deflate({
                availableIn: 11
            }, zlib.CompressFlushMode.FINISH).then((data) => {
                expect(data).assertEqual(zlib.ReturnStatus.STREAM_END);
                expect(zlib.CompressFlushMode.SYNC_FLUSH).assertEqual(2);
                expect(zlib.CompressFlushMode.FULL_FLUSH).assertEqual(3);
            }).catch((errData: base.BusinessError) => {
                expect(errData).assertFail();
            })
            await zip.deflateEnd({}).then(data => {
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                expect(errData).assertFail();
            })
            try {
                await zip.inflateInit({
                    nextIn: arrayBufferOut, availableIn: 2
                }).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK)
                })
            } catch (errData) {
                expect(errData).assertFail();
            }
            await zip.inflate({
                nextOut: arrayBufferIn, availableOut: 28
            }, zlib.CompressFlushMode.NO_FLUSH).then((data) => {
                expect(data).assertEqual(zlib.ReturnStatus.OK)
                expect(zlib.CompressFlushMode.TREES).assertEqual(6);
            }).catch((errData: base.BusinessError) => {
                expect(errData).assertFail();
            })

            try {
                await zip.inflateSync(ZStreamNextInNull).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800005);
            }

            try {
                await zip.inflateSync(ZStreamNextInUndefined).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800005);
            }
            ZStreamNextInZero = {
                nextIn: new ArrayBuffer(0),
                availableIn: 0,
                totalIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1,
                totalOut: 2,
                dataType: 1,
                adler: 2
            };
            try {
                await zip.inflateSync(ZStreamNextInZero).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800007);
            }
            ZStreamNextInUnset = {
                availableIn: 0,
                totalIn: 1,
                nextOut: arrayBufferOut,
                availableOut: 1,
                totalOut: 2,
                dataType: 1,
                adler: 2
            };
            try {
                await zip.inflateSync(ZStreamNextInUnset).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800007);
            }

            try {
                await zip.inflateSync(ZStreamAvailableInNull).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800007);
            }

            try {
                await zip.inflateSync(ZStreamAvailableInUndefined).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800007);
            }

            try {
                await zip.inflateSync(ZStreamAvailableInNegative).then((data) => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSync(ZStreamAvailableInUnset).then((data) => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSync(ZStreamTotalInNull).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800005);
            }

            try {
                await zip.inflateSync(ZStreamTotalInUndefined).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800005);
            }

            try {
                await zip.inflateSync(ZStreamTotalInNegative).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800005);
            }

            try {
                await zip.inflateSync(ZStreamTotalInUnset).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800005);
            }

            try {
                await zip.inflateSync(ZStreamNextOutNull).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800005);
            }

            try {
                await zip.inflateSync(ZStreamNextOutUndefined).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800005);
            }

            try {
                await zip.inflateSync(ZStreamNextOutZero).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800005);
            }

            try {
                await zip.inflateSync(ZStreamNextOutUnset).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800005);
            }

            try {
                await zip.inflateSync(ZStreamAvailableOutNull).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800005);
            }

            try {
                await zip.inflateSync(ZStreamAvailableOutUndefined).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800005);
            }

            try {
                await zip.inflateSync(ZStreamAvailableOutNegative).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800005);
            }

            try {
                await zip.inflateSync(ZStreamAvailableOutUnset).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800005);
            }

            try {
                await zip.inflateSync(ZStreamTotalOutNull).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800005);
            }

            try {
                await zip.inflateSync(ZStreamTotalOutUndefined).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800005);
            }

            try {
                await zip.inflateSync(ZStreamTotalOutNegative).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800005);
            }

            try {
                await zip.inflateSync(ZStreamTotalOutUnset).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800005);
            }

            try {
                await zip.inflateSync(ZStreamDataTypeNull).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800005);
            }

            try {
                await zip.inflateSync(ZStreamDataTypeUndefined).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800005);
            }

            try {
                await zip.inflateSync(ZStreamDataTypeNegative).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800005);
            }

            try {
                await zip.inflateSync(ZStreamDataTypeUnset).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800005);
            }

            try {
                await zip.inflateSync(ZStreamAdlerNull).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800005);
            }

            try {
                await zip.inflateSync(ZStreamAdlerUndefined).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800005);
            }

            try {
                await zip.inflateSync(ZStreamAdlerNegative).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800005);
            }

            try {
                await zip.inflateSync(ZStreamAdlerUnset).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800005);
            }

            done();
            console.info("==================actsZipTest113 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_114
         * @tc.name       : actsZipTest114
         * @tc.desc       : test inflateResetKeep
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest114', 0, async (done: Function) => {
            console.info("==================actsZipTest114 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();

            await zip.inflateInit({
                nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1
            }
            ).then(data => {
                expect(data).assertEqual(zlib.ReturnStatus.OK);
            }).catch((errData: base.BusinessError) => {
                expect(errData).assertFail();
            })

            try {
                await zip.inflateResetKeep(ZStreamNextInNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateResetKeep(ZStreamNextInUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData).assertFail();
            }

            try {
                await zip.inflateResetKeep(ZStreamNextInZero).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateResetKeep(ZStreamNextInUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateResetKeep(ZStreamAvailableInNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateResetKeep(ZStreamAvailableInUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateResetKeep(ZStreamAvailableInNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateResetKeep(ZStreamAvailableInUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateResetKeep(ZStreamTotalInNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateResetKeep(ZStreamTotalInUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateResetKeep(ZStreamTotalInNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateResetKeep(ZStreamTotalInUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateResetKeep(ZStreamNextOutNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateResetKeep(ZStreamNextOutUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateResetKeep(ZStreamNextOutZero).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateResetKeep(ZStreamNextOutUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateResetKeep(ZStreamAvailableOutNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateResetKeep(ZStreamAvailableOutUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateResetKeep(ZStreamAvailableOutNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateResetKeep(ZStreamAvailableOutUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateResetKeep(ZStreamTotalOutNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateResetKeep(ZStreamTotalOutUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateResetKeep(ZStreamTotalOutNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateResetKeep(ZStreamTotalOutUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateResetKeep(ZStreamDataTypeNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateResetKeep(ZStreamDataTypeUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateResetKeep(ZStreamDataTypeNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateResetKeep(ZStreamDataTypeUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateResetKeep(ZStreamAdlerNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateResetKeep(ZStreamAdlerUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateResetKeep(ZStreamAdlerNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateResetKeep(ZStreamAdlerUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            done();
            console.info("==================actsZipTest114 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_115
         * @tc.name       : actsZipTest115
         * @tc.desc       : test inflateSetDictionary
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest115', 0, async (done: Function) => {
            console.info("==================actsZipTest115 start==================");
            let str = 'hello, hello!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            let dictionary = 'hello'
            let dictionarybuf = new ArrayBuffer(dictionary.length);
            let dictionarybufdata = new Uint8Array(dictionarybuf);
            for (let i = 0, j = dictionary.length; i < j; i++) {
                dictionarybufdata[i] = str.charCodeAt(i);
            }
            await zip.deflateInit({}, zlib.CompressLevel.COMPRESS_LEVEL_BEST_COMPRESSION).then((data) => {
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                expect(errData).assertFail();
            })
            await zip.deflateSetDictionary({}, dictionarybuf).then((data) => {
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                expect(errData).assertFail();
            })
            await zip.deflate({
                nextIn: arrayBufferIn, availableIn: 14, nextOut: arrayBufferOut, availableOut: 100
            },
                zlib.CompressFlushMode.FINISH).then((data) => {
                    expect(data).assertEqual(zlib.ReturnStatus.STREAM_END)
                    expect(zlib.ReturnStatus.STREAM_END).assertEqual(1);
                    expect(zlib.ReturnStatus.NEED_DICT).assertEqual(2);
                }).catch((errData: base.BusinessError) => {
                    expect(errData).assertFail();
                })
            await zip.deflateEnd({}).then(data => {
                expect(data).assertEqual(zlib.ReturnStatus.OK)
            }).catch((errData: base.BusinessError) => {
                expect(errData).assertFail();
            })
            try {
                await zip.inflateInit({
                    nextIn: arrayBufferOut, availableIn: 100
                }).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK)
                })
            } catch (errData) {
                expect(errData).assertFail()
            }
            await zip.inflate({
                nextOut: arrayBufferIn, availableOut: 28
            }, zlib.CompressFlushMode.NO_FLUSH).then((data) => {
                expect(data).assertEqual(2)
            }).catch((errData: base.BusinessError) => {
                expect(errData).assertFail()
            })

            try {
                await zip.inflateSetDictionary(ZStreamNextInNull, dictionarybuf).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSetDictionary(ZStreamNextInUndefined, dictionarybuf).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSetDictionary(ZStreamNextInZero, dictionarybuf).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSetDictionary(ZStreamNextInUnset, dictionarybuf).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSetDictionary(ZStreamAvailableInNull, dictionarybuf).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSetDictionary(ZStreamAvailableInUndefined, dictionarybuf).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSetDictionary(ZStreamAvailableInNegative, dictionarybuf).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSetDictionary(ZStreamAvailableInUnset, dictionarybuf).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSetDictionary(ZStreamTotalInNull, dictionarybuf).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSetDictionary(ZStreamTotalInUndefined, dictionarybuf).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSetDictionary(ZStreamTotalInNegative, dictionarybuf).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSetDictionary(ZStreamTotalInUnset, dictionarybuf).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSetDictionary(ZStreamNextOutNull, dictionarybuf).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSetDictionary(ZStreamNextOutUndefined, dictionarybuf).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSetDictionary(ZStreamNextOutZero, dictionarybuf).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSetDictionary(ZStreamNextOutUnset, dictionarybuf).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSetDictionary(ZStreamAvailableOutNull, dictionarybuf).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSetDictionary(ZStreamAvailableOutUndefined, dictionarybuf).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSetDictionary(ZStreamAvailableOutNegative, dictionarybuf).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSetDictionary(ZStreamAvailableOutUnset, dictionarybuf).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSetDictionary(ZStreamTotalOutNull, dictionarybuf).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSetDictionary(ZStreamTotalOutUndefined, dictionarybuf).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSetDictionary(ZStreamTotalOutNegative, dictionarybuf).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSetDictionary(ZStreamTotalOutUnset, dictionarybuf).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSetDictionary(ZStreamDataTypeNull, dictionarybuf).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSetDictionary(ZStreamDataTypeUndefined, dictionarybuf).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSetDictionary(ZStreamDataTypeNegative, dictionarybuf).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSetDictionary(ZStreamDataTypeUnset, dictionarybuf).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSetDictionary(ZStreamAdlerNull, dictionarybuf).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSetDictionary(ZStreamAdlerUndefined, dictionarybuf).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSetDictionary(ZStreamAdlerNegative, dictionarybuf).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSetDictionary(ZStreamAdlerUnset, dictionarybuf).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.inflateSetDictionary(ZStreamComplete, null).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.inflateSetDictionary(ZStreamComplete, undefined).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.inflateSetDictionary(ZStreamComplete, new ArrayBuffer(0)).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800005);
            }

            done();
            console.info("==================actsZipTest115 end==================");
        })

        /**
         * @tc.number     : ACTS_ZipTest_116
         * @tc.name       : actsZipTest116
         * @tc.desc       : test inflate
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest116', 0, async (done: Function) => {
            console.info("==================actsZipTest116 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let zip = zlib.createZipSync();
            try {
                await zip.inflate(null, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.inflate(undefined, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.inflate(ZStreamNextInNull, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflate(ZStreamNextInUndefined, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflate(ZStreamNextInZero, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflate(ZStreamNextInUnset, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflate(ZStreamAvailableInNull, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflate(ZStreamAvailableInUndefined, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflate(ZStreamAvailableInNegative, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflate(ZStreamAvailableInUnset, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflate(ZStreamTotalInNull, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflate(ZStreamTotalInUndefined, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflate(ZStreamTotalInNegative, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflate(ZStreamTotalInUnset, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflate(ZStreamNextOutNull, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflate(ZStreamNextOutUndefined, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflate(ZStreamNextOutZero, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflate(ZStreamNextOutUnset, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflate(ZStreamAvailableOutNull, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflate(ZStreamAvailableOutUndefined, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflate(ZStreamAvailableOutNegative, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflate(ZStreamAvailableOutUnset, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflate(ZStreamTotalOutNull, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflate(ZStreamTotalOutUndefined, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflate(ZStreamTotalOutNegative, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflate(ZStreamTotalOutUnset, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflate(ZStreamDataTypeNull, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflate(ZStreamDataTypeUndefined, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflate(ZStreamDataTypeNegative, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflate(ZStreamDataTypeUnset, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflate(ZStreamAdlerNull, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflate(ZStreamAdlerUndefined, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflate(ZStreamAdlerNegative, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflate(ZStreamAdlerUnset, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            try {
                await zip.inflate(ZStreamComplete, null).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401)
            }

            try {
                await zip.inflate(ZStreamComplete, undefined).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.inflate(ZStreamComplete, -1).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            console.info("==================actsZipTest116 end==================");
            done();
        })

        /**
         * @tc.number     : ACTS_ZipTest_117
         * @tc.name       : actsZipTest117
         * @tc.desc       : test deflateInit
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest117', 0, async (done: Function) => {
            console.info("==================actsZipTest117 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let zip = zlib.createZipSync();
            try {
                await zip.deflateInit(null, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateInit(undefined, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateInit(ZStreamNextInNull, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateInit(ZStreamNextInUndefined, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateInit(ZStreamNextInZero, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateInit(ZStreamNextInUnset, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateInit(ZStreamAvailableInNull, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateInit(ZStreamAvailableInUndefined, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateInit(ZStreamAvailableInNegative, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateInit(ZStreamAvailableInUnset, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateInit(ZStreamTotalInNull, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateInit(ZStreamTotalInUndefined, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateInit(ZStreamTotalInNegative, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateInit(ZStreamTotalInUnset, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateInit(ZStreamNextOutNull, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateInit(ZStreamNextOutUndefined, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateInit(ZStreamNextOutZero, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateInit(ZStreamNextOutUnset, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateInit(ZStreamAvailableOutNull, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateInit(ZStreamAvailableOutUndefined, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateInit(ZStreamAvailableOutNegative, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateInit(ZStreamAvailableOutUnset, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateInit(ZStreamTotalOutNull, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateInit(ZStreamTotalOutUndefined, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateInit(ZStreamTotalOutNegative, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateInit(ZStreamTotalOutUnset, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateInit(ZStreamDataTypeNull, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateInit(ZStreamDataTypeUndefined, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateInit(ZStreamDataTypeNegative, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateInit(ZStreamDataTypeUnset, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateInit(ZStreamAdlerNull, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateInit(ZStreamAdlerUndefined, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateInit(ZStreamAdlerNegative, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateInit(ZStreamAdlerUnset, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateInit(ZStreamComplete, null).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateInit(ZStreamComplete, undefined).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateInit(ZStreamComplete, -2).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            console.info("==================actsZipTest117 end==================");
            done();
        })

        /**
         * @tc.number     : ACTS_ZipTest_118
         * @tc.name       : actsZipTest118
         * @tc.desc       : test deflate
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest118', 0, async (done: Function) => {
            console.info("==================actsZipTest118 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();
            try {
                await zip.deflateInit(ZStreamComplete, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflate({
                    nextIn: undefined,
                    availableIn: 1,
                    totalIn: 1,
                    nextOut: arrayBufferOut,
                    availableOut: 0,
                    totalOut: 2,
                    dataType: 1,
                    adler: 2
                }, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800007);
            }

            try {
                await zip.deflate(null, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflate(undefined, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamNextInNull, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamNextInUndefined, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamNextInZero, zlib.CompressFlushMode.FINISH).then((data) => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamNextInUnset, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamAvailableInNull, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamAvailableInUndefined, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamAvailableInNegative, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamAvailableInUnset, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamTotalInNull, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamTotalInUndefined, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamTotalInNegative, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamTotalInUnset, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamNextOutNull, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamNextOutUndefined, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamNextOutZero, zlib.CompressFlushMode.NO_FLUSH).then((data) => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamNextOutUnset, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamAvailableOutNull, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamAvailableOutUndefined, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamAvailableOutNegative, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamAvailableOutUnset, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamTotalOutNull, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamTotalOutUndefined, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamTotalOutNegative, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamTotalOutUnset, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamDataTypeNull, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamDataTypeUndefined, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamDataTypeNegative, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamDataTypeUnset, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamAdlerNull, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamAdlerUndefined, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamAdlerNegative, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamAdlerUnset, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflate(ZStreamComplete, null).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflate(ZStreamComplete, undefined).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflate(ZStreamComplete, -1).then((data) => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            console.info("==================actsZipTest118 end==================");
            done();
        })

        /**
         * @tc.number     : ACTS_ZipTest_119
         * @tc.name       : actsZipTest119
         * @tc.desc       : test deflateEnd
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest119', 0, async (done: Function) => {
            console.info("==================actsZipTest119 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd({
                    nextIn: undefined,
                    availableIn: 1,
                    totalIn: 1,
                    nextOut: arrayBufferOut,
                    availableOut: 0,
                    totalOut: 2,
                    dataType: 1,
                    adler: 2
                }).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(null).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateEnd(undefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(ZStreamNextInNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(ZStreamNextInUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(ZStreamNextInZero).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(ZStreamNextInUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(ZStreamAvailableInNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(ZStreamAvailableInUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(ZStreamAvailableInNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(ZStreamAvailableInUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(ZStreamTotalInNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(ZStreamTotalInUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(ZStreamTotalInNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(ZStreamTotalInUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(ZStreamNextOutNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(ZStreamNextOutUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(ZStreamNextOutZero).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(ZStreamNextOutUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(ZStreamAvailableOutNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(ZStreamAvailableOutUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(ZStreamAvailableOutNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(ZStreamAvailableOutUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(ZStreamTotalOutNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(ZStreamTotalOutUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(ZStreamTotalOutNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(ZStreamTotalOutUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(ZStreamDataTypeNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(ZStreamDataTypeUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(ZStreamDataTypeNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(ZStreamDataTypeUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(ZStreamAdlerNull).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(ZStreamAdlerUndefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(ZStreamAdlerNegative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            await DoDeflateInit(zip);
            try {
                await zip.deflateEnd(ZStreamAdlerUnset).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            console.info("==================actsZipTest119 end==================");
            done();
        })


        /**
         * @tc.number     : ACTS_ZipTest_120
         * @tc.name       : actsZipTest120
         * @tc.desc       : test deflateBound
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest120', 0, async (done: Function) => {
            console.info("==================actsZipTest120 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();

            await DoDeflateInit(zip);
            try {
                await zip.deflateBound({
                    nextIn: undefined,
                    availableIn: 1,
                    totalIn: 1,
                    nextOut: arrayBufferOut,
                    availableOut: 0,
                    totalOut: 2,
                    dataType: 1,
                    adler: 2
                }, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(null, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {

                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateBound(undefined, zlib.CompressFlushMode.NO_FLUSH).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateBound(ZStreamNextInNull, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(ZStreamNextInUndefined, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(ZStreamNextInZero, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(ZStreamNextInUnset, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(ZStreamAvailableInNull, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(ZStreamAvailableInUndefined, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(ZStreamAvailableInNegative, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(ZStreamAvailableInUnset, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(ZStreamTotalInNull, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(ZStreamTotalInUndefined, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(ZStreamTotalInNegative, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(ZStreamTotalInUnset, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(ZStreamNextOutNull, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(ZStreamNextOutUndefined, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(ZStreamNextOutZero, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(ZStreamNextOutUnset, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(ZStreamAvailableOutNull, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(ZStreamAvailableOutUndefined, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(ZStreamAvailableOutNegative, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(ZStreamAvailableOutUnset, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(ZStreamTotalOutNull, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(ZStreamTotalOutUndefined, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(ZStreamTotalOutNegative, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(ZStreamTotalOutUnset, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(ZStreamDataTypeNull, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(ZStreamDataTypeUndefined, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(ZStreamDataTypeNegative, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(ZStreamDataTypeUnset, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(ZStreamAdlerNull, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(ZStreamAdlerUndefined, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(ZStreamAdlerNegative, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(ZStreamAdlerUnset, zlib.CompressFlushMode.NO_FLUSH).then(data => {
                    expect(data).assertEqual(13);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateBound(ZStreamComplete, null).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            ;
            try {
                await zip.deflateBound(ZStreamComplete, undefined).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateBound(ZStreamComplete, -1).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            console.info("==================actsZipTest120 end==================");
            done();
        })


        /**
         * @tc.number     : ACTS_ZipTest_121
         * @tc.name       : actsZipTest121
         * @tc.desc       : test deflateSetHeader
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest121', 0, async (done: Function) => {
            console.info("==================actsZipTest121 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();

            await zip.deflateInit2(ZStreamComplete, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED, zlib.CompressMethod.DEFLATED, 28,
                zlib.MemLevel.MEM_LEVEL_DEFAULT, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY);
            try {
                await zip.deflateSetHeader({
                    nextIn: undefined,
                    availableIn: 1,
                    totalIn: 1,
                    nextOut: arrayBufferOut,
                    availableOut: 0,
                    totalOut: 2,
                    dataType: 1,
                    adler: 2
                }, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(null, gzHeader_complete).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateSetHeader(undefined, gzHeader_complete).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateSetHeader(ZStreamNextInNull, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamNextInUndefined, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamNextInZero, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamNextInUnset, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamAvailableInNull, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamAvailableInUndefined, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamAvailableInNegative, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamAvailableInUnset, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamTotalInNull, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamTotalInUndefined, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamTotalInNegative, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamTotalInUnset, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamNextOutNull, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamNextOutUndefined, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamNextOutZero, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamNextOutUnset, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamAvailableOutNull, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamAvailableOutUndefined, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamAvailableOutNegative, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamAvailableOutUnset, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamTotalOutNull, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamTotalOutUndefined, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamTotalOutNegative, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamTotalOutUnset, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamDataTypeNull, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamDataTypeUndefined, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamDataTypeNegative, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamDataTypeUnset, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamAdlerNull, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamAdlerUndefined, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamAdlerNegative, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamAdlerUnset, gzHeader_complete).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_isText_empty).then((data) => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_isText_null).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_isText_undefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_os_empty).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_os_null).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_os_undefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_os_negative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_time_empty).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_time_null).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_time_undefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_time_negative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_xflags_empty).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_xflags_null).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_xflags_undefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_xflags_negative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_extra_empty).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_extra_null).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_extra_undefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_extra_zero).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_extraLen_empty).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_extraLen_null).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_extraLen_undefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_extraLen_negative).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_name_empty).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_name_null).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_name_undefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_name_zero).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_comment_empty).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_comment_null).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_comment_undefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_comment_zero).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_hcrc_empty).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_hcrc_null).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_hcrc_undefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_done_empty).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_done_null).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetHeader(ZStreamComplete, gzHeader_done_undefined).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            console.info("==================actsZipTest121 end==================");
            done();
        })


        /**
         * @tc.number     : ACTS_ZipTest_122
         * @tc.name       : actsZipTest122
         * @tc.desc       : test deflateCopy
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest122', 0, async (done: Function) => {
            console.info("==================actsZipTest122 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let zip = zlib.createZipSync();

            try {
                await zip.deflateCopy(null).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateCopy(undefined).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            console.info("==================actsZipTest122 end==================");
            done();
        })

        /**
         * @tc.number     : ACTS_ZipTest_123
         * @tc.name       : actsZipTest123
         * @tc.desc       : test deflateSetDictionary
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest123', 0, async (done: Function) => {
            console.info("==================actsZipTest123 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();

            try {
                await zip.deflateInit(ZStreamComplete, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary({
                    nextIn: undefined,
                    availableIn: 1,
                    totalIn: 1,
                    nextOut: arrayBufferOut,
                    availableOut: 0,
                    totalOut: 2,
                    dataType: 1,
                    adler: 2
                }, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(null, arrayBufferIn).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateSetDictionary(undefined, arrayBufferIn).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateSetDictionary(ZStreamNextInNull, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(ZStreamNextInUndefined, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(ZStreamNextInZero, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(ZStreamNextInUnset, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(ZStreamAvailableInNull, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(ZStreamAvailableInUndefined, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(ZStreamAvailableInNegative, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(ZStreamAvailableInUnset, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(ZStreamTotalInNull, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(ZStreamTotalInUndefined, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(ZStreamTotalInNegative, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(ZStreamTotalInUnset, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(ZStreamNextOutNull, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(ZStreamNextOutUndefined, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(ZStreamNextOutZero, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(ZStreamNextOutUnset, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(ZStreamAvailableOutNull, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(ZStreamAvailableOutUndefined, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(ZStreamAvailableOutNegative, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(ZStreamAvailableOutUnset, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(ZStreamTotalOutNull, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(ZStreamTotalOutUndefined, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(ZStreamTotalOutNegative, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(ZStreamTotalOutUnset, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(ZStreamDataTypeNull, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(ZStreamDataTypeUndefined, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(ZStreamDataTypeNegative, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(ZStreamDataTypeUnset, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(ZStreamAdlerNull, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(ZStreamAdlerUndefined, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(ZStreamAdlerNegative, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(ZStreamAdlerUnset, arrayBufferIn).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateSetDictionary(ZStreamComplete, null).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateSetDictionary(ZStreamComplete, undefined).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateSetDictionary(ZStreamComplete, new ArrayBuffer(0)).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }

            console.info("==================actsZipTest123 end==================");
            done();
        })

        /**
         * @tc.number     : ACTS_ZipTest_124
         * @tc.name       : actsZipTest124
         * @tc.desc       : test deflateGetDictionary
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest124', 0, async (done: Function) => {
            console.info("==================actsZipTest124 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();

            try {
                await zip.deflateInit(ZStreamComplete, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary({
                    nextIn: undefined,
                    availableIn: 1,
                    totalIn: 1,
                    nextOut: arrayBufferOut,
                    availableOut: 0,
                    totalOut: 2,
                    dataType: 1,
                    adler: 2
                }, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(null, arrayBufferIn).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateGetDictionary(undefined, arrayBufferIn).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateGetDictionary(ZStreamNextInNull, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(ZStreamNextInUndefined, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(ZStreamNextInZero, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(ZStreamNextInUnset, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(ZStreamAvailableInNull, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(ZStreamAvailableInUndefined, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(ZStreamAvailableInNegative, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(ZStreamAvailableInUnset, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(ZStreamTotalInNull, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(ZStreamTotalInUndefined, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(ZStreamTotalInNegative, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(ZStreamTotalInUnset, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(ZStreamNextOutNull, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(ZStreamNextOutUndefined, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(ZStreamNextOutZero, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(ZStreamNextOutUnset, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(ZStreamAvailableOutNull, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(ZStreamAvailableOutUndefined, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(ZStreamAvailableOutNegative, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(ZStreamAvailableOutUnset, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(ZStreamTotalOutNull, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(ZStreamTotalOutUndefined, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(ZStreamTotalOutNegative, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(ZStreamTotalOutUnset, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(ZStreamDataTypeNull, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(ZStreamDataTypeUndefined, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(ZStreamDataTypeNegative, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(ZStreamDataTypeUnset, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(ZStreamAdlerNull, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(ZStreamAdlerUndefined, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(ZStreamAdlerNegative, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(ZStreamAdlerUnset, arrayBufferIn).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateGetDictionary(ZStreamComplete, null).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateGetDictionary(ZStreamComplete, undefined).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateGetDictionary(ZStreamComplete, new ArrayBuffer(0)).then(data => {
                    expect(data.status).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            console.info("==================actsZipTest124 end==================");
            done();
        })


        /**
         * @tc.number     : ACTS_ZipTest_125
         * @tc.name       : actsZipTest125
         * @tc.desc       : test deflateTune
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('actsZipTest125', 0, async (done: Function) => {
            console.info("==================actsZipTest125 start==================");
            let str = 'hello world!';
            let arrayBufferIn = new ArrayBuffer(str.length);
            let byteArray = new Uint8Array(arrayBufferIn);
            for (let i = 0, j = str.length; i < j; i++) {
                byteArray[i] = str.charCodeAt(i)
            }
            let arrayBufferOut = new ArrayBuffer(100);
            let zip = zlib.createZipSync();

            try {
                await zip.deflateInit(ZStreamComplete, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune({
                    nextIn: undefined,
                    availableIn: 1,
                    totalIn: 1,
                    nextOut: arrayBufferOut,
                    availableOut: 0,
                    totalOut: 2,
                    dataType: 1,
                    adler: 2
                }, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(null, 1, 2, 3, 4).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateTune(undefined, 1, 2, 3, 4).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateTune(ZStreamNextInNull, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamNextInUndefined, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamNextInZero, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamNextInUnset, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamAvailableInNull, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamAvailableInUndefined, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamAvailableInNegative, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamAvailableInUnset, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamTotalInNull, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamTotalInUndefined, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamTotalInNegative, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamTotalInUnset, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamNextOutNull, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamNextOutUndefined, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamNextOutZero, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamNextOutUnset, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamAvailableOutNull, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamAvailableOutUndefined, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamAvailableOutNegative, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamAvailableOutUnset, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamTotalOutNull, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamTotalOutUndefined, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamTotalOutNegative, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamTotalOutUnset, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamDataTypeNull, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamDataTypeUndefined, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamDataTypeNegative, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamDataTypeUnset, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamAdlerNull, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamAdlerUndefined, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamAdlerNegative, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamAdlerUnset, 1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamComplete, null, 2, 3, 4).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateTune(ZStreamComplete, undefined, 2, 3, 4).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateTune(ZStreamComplete, -1, 2, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamComplete, 1, null, 3, 4).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateTune(ZStreamComplete, 1, undefined, 3, 4).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateTune(ZStreamComplete, 1, -1, 3, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamComplete, 1, 2, null, 4).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateTune(ZStreamComplete, 1, 2, undefined, 4).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateTune(ZStreamComplete, 1, 2, -1, 4).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await zip.deflateTune(ZStreamComplete, 1, 2, 3, null).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateTune(ZStreamComplete, 1, 2, 3, undefined).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zip.deflateTune(ZStreamComplete, 1, 2, 3, -1).then(data => {
                    expect(data).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }

            console.info("==================actsZipTest125 end==================");
            done();
        })
    })
}
