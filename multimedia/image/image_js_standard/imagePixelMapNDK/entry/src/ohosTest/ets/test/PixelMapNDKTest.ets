/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import image from "@ohos.multimedia.image";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import fileio from "@ohos.fileio";
import ndkTest from 'libentry.so';
import { BusinessError } from "@kit.BasicServicesKit";

let fdNumber:number;

// interface pixelMapProperty {
//     width: number;
//     height: number;
//     pixelFormat: number
// }
async function getFd(fileName: string) {
    let context = await getContext();
    let filePath = context.filesDir + '/' + fileName;
    console.info('getFd filePath: ' + filePath);
    await fileio.open(filePath).then((data) => {
        fdNumber = data;
        console.info("image case open fd success " + fdNumber);
    }, (err:BusinessError) => {
        console.info("image cese open fd fail" + err);
    }).catch((err:BusinessError) => {
        console.info("image case open fd err " + err);
    });
}

async function PixelMapConvertNativeAndNapi(done:Function, testNum: string, picName: string, pixelformat: number) {
    try {
        await getFd(picName);
        console.info(testNum + " getFd result fdNumber: " + fdNumber);
        let res: image.PixelMap = ndkTest.JsNativeToNapi(fdNumber, pixelformat);
        console.info(testNum + ' JsNativeToNapi result: ' + res);
        console.info(testNum + ' after ndkTest.JsNativeToNapi');
        if (res == undefined) {
            console.info("PixelMapConvertNativeAndNapi undefined");
            expect(res == undefined).assertFail();
            done();
            return;
        } else {
            console.info(testNum + ' before ndkTest.JsNapiToNative_ReturnProperty');
            let res_Property: ndkTest.pixelMapProperty = ndkTest.JsNapiToNative_ReturnProperty(res);
            console.info(testNum + ' after ndkTest.JsNapiToNative_ReturnProperty');
            console.info('PixelMapConvertNativeAndNapi Native success Height: ' + res_Property.height +
                ' Width: ' +
            res_Property.width + ' pixelFormat: ' + res_Property.pixelFormat);
            let imageInfo = res.getImageInfoSync();
            console.info('PixelMapConvertNativeAndNapi imageInfo success Height: ' + imageInfo.size.height +
                ' Width: ' +
            imageInfo.size.width + ' pixelFormat: ' + imageInfo.pixelFormat);
            expect((res_Property.width == imageInfo.size.width) &&
                (res_Property.height == imageInfo.size.height) &&
                (res_Property.pixelFormat == imageInfo.pixelFormat)).assertTrue();
            done();
            return;
        }
    } catch (err) {
        console.info(testNum + " error message: " + err.message);
        console.info("PixelMapConvertNativeAndNapi failed testNum: " + testNum + " picName: " + picName);
        expect().assertFail();
        done();
    }
}

export default function PixelMapNDKTest() {
    describe('PixelMapNDKTest', () => {
        let filePath: string;
        let fdNumber: number;
        beforeAll(() => {
            console.info('beforeAll case');
        });
        beforeEach(() => {
            console.info('beforeEach case');
        });
        afterEach(() => {
            console.info('afterEach case');
        });
        afterAll(() => {
            console.info('afterAll case');
        });



        it('SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_JPG_0100', 0, async (done: Function) => {
            console.info('SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_JPG_0100 before PixelMapConvertNativeAndNapi');
            await PixelMapConvertNativeAndNapi(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_JPG_0100",
                "test.jpg", 3);
        });
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_JPG_0200', 0, async (done: Function) => {
            await PixelMapConvertNativeAndNapi(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_JPG_0200",
                "test.jpg", 8);
        });
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_JPG_0300', 0, async (done: Function) => {
            await PixelMapConvertNativeAndNapi(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_JPG_0300",
                "test.jpg", 9);
        });
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_WEBP_0100', 0, async (done: Function) => {
            await PixelMapConvertNativeAndNapi(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_WEBP_0100",
                "test.webp", 3);
        });
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_WEBP_0200', 0, async (done: Function) => {
            await PixelMapConvertNativeAndNapi(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_WEBP_0200",
                "test.webp", 8);
        });
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_WEBP_0300', 0, async (done: Function) => {
            await PixelMapConvertNativeAndNapi(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_WEBP_0300",
                "test.webp", 9);
        });
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_PNG_0100', 0, async (done: Function) => {
            await PixelMapConvertNativeAndNapi(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_PNG_0100",
                "test.png", 3);
        });
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_PNG_0200', 0, async (done: Function) => {
            await PixelMapConvertNativeAndNapi(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_PNG_0200",
                "test.png", 8);
        });
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_PNG_0300', 0, async (done: Function) => {
            await PixelMapConvertNativeAndNapi(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_PNG_0300",
                "test.png", 9);
        });
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_GIF_0100', 0, async (done: Function) => {
            await PixelMapConvertNativeAndNapi(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_GIF_0100",
                "test.gif", 3);
        });
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_GIF_0200', 0, async (done: Function) => {
            await PixelMapConvertNativeAndNapi(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_GIF_0200",
                "test.gif", 8);
        });
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_GIF_0300', 0, async (done: Function) => {
            await PixelMapConvertNativeAndNapi(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_GIF_0300",
                "test.gif", 9);
        });
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_ICO_0100', 0, async (done: Function) => {
            await PixelMapConvertNativeAndNapi(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_ICO_0100",
                "test.ico", 3);
        });
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_ICO_0200', 0, async (done: Function) => {
            await PixelMapConvertNativeAndNapi(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_ICO_0200",
                "test.ico", 8);
        });
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_ICO_0300', 0, async (done: Function) => {
            await PixelMapConvertNativeAndNapi(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_ICO_0300",
                "test.ico", 9);
        });
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_SVG_0100', 0, async (done: Function) => {
            await PixelMapConvertNativeAndNapi(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_SVG_0100",
                "test.svg", 3);
        });
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_BMP_0100', 0, async (done: Function) => {
            await PixelMapConvertNativeAndNapi(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_BMP_0100",
                "test.bmp", 3);
        });
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_BMP_0200', 0, async (done: Function) => {
            await PixelMapConvertNativeAndNapi(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_BMP_0200",
                "test.bmp", 8);
        });
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_BMP_0300', 0, async (done: Function) => {
            await PixelMapConvertNativeAndNapi(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_BMP_0300",
                "test.bmp", 9);
        });
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_DNG_0100', 0, async (done: Function) => {
            await PixelMapConvertNativeAndNapi(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_DNG_0100",
                "test_PixelMapNDKJs.dng", 3);
        });
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_DNG_0200', 0, async (done: Function) => {
            await PixelMapConvertNativeAndNapi(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_DNG_0200",
                "test_PixelMapNDKJs.dng", 8);
        });
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_DNG_0300', 0, async (done: Function) => {
            await PixelMapConvertNativeAndNapi(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_ConvertPixelmapToNapi_DNG_0300",
                "test_PixelMapNDKJs.dng", 9);
        });
    })
}