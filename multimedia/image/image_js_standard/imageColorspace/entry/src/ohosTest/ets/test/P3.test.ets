/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import fileio from "@ohos.fileio";
import colorSpaceManager from "@ohos.graphics.colorSpaceManager";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import { testImg } from "./testImg";
import { testP3 } from "./testImg2";
import featureAbility from "@ohos.ability.featureAbility";
import { BusinessError } from '@ohos.base';

let filePath: string;
let fdNumber:ESObject;
let globalpixelmap:PixelMap;
let globalImagesource:image.ImageSource;


async function getFd(fileName:string) {
    let context = await getContext();
        filePath = context.filesDir + "/" + fileName;
        console.info("image case filePath is " + filePath);

    await fileio
        .open(filePath)
        .then((data) => {
            fdNumber = data;
            console.info("image case open fd success " + fdNumber);
        })
        .catch((err:BusinessError) => {
            console.info("image case open fd err " + err);
        });
}

function GenPicSource(org:ESObject) {
    let data:ESObject;
    data = org.buffer;
    return image.createImageSource(data);
}

function Logger(caseName:string):ESObject {
    return {
        myName: caseName,
        log:  (msg:string)=> {
            console.info(caseName + " " + msg);
        },
    };
}
async function setColor(done:Function, testNum:string, imageSource:ESObject, colorSpaceName:ESObject) {
    let logger:ESObject = Logger(testNum);
    try {
        logger.log("ImageSource " + (imageSource != undefined));
        if (imageSource != undefined) {
            globalImagesource = imageSource;
            let pixelMap:PixelMap = await imageSource.createPixelMap();
            globalpixelmap = pixelMap;
            logger.log("PixelMap " + pixelMap);
            let csm = colorSpaceManager.create(colorSpaceName);
            logger.log("colorSpaceManager.ColorSpace: " + colorSpaceName);
            pixelMap.setColorSpace(csm);
            let csm1 = pixelMap.getColorSpace();
            logger.log("getColorSpace " + csm1);
            let csmn = csm1.getColorSpaceName();
            logger.log("getColorSpaceName " + csmn);
            expect(csmn == colorSpaceName).assertTrue();
            done();
        } else {
            logger.log("createimageSource fail");
            expect(false).assertTrue();
            done();
        }
    } catch (error) {
        expect(false).assertTrue();
        logger.log("failed " + error);
        done();
    }
}

export default function ImageP3() {
    describe("ImageP3", ()=> {
        const COLORSPACENAME = colorSpaceManager.ColorSpace.SRGB;



        beforeAll(async ()=> {
            console.info("beforeAll case");
        });

        beforeEach(()=> {
            console.info("beforeEach case");
        });

        afterEach(async ()=> {
            if (globalpixelmap != undefined) {
                console.info("globalpixelmap release start");
                try {
                    await globalpixelmap.release();
                } catch (error) {
                    console.info("globalpixelmap release fail");
                }
            }
            if (globalImagesource != undefined) {
                console.info("globalImagesource release start");
                try {
                    await globalImagesource.release();
                } catch (error) {
                    console.info("globalImagesource release fail");
                }
            }
            console.info("afterEach case");
        });

        afterAll(async ()=> {
            console.info("afterAll case");
        });

        

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETCOLORSPACE_0100
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_GETCOLORSPACE_0100
         * @tc.desc      : 1.create imagesource
         *                 2.createPixelMap
         *                 3.getColorSpace and getColorSpaceName
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETCOLORSPACE_0100", 0, async (done:Function)=> {
            let logger:ESObject = Logger("SUB_MULTIMEDIA_IMAGE_GETCOLORSPACE_0100");
            try {
                let imageSource = GenPicSource(testImg);
                if (imageSource != undefined) {
                    globalImagesource = imageSource;
                    let pixelMap = await imageSource.createPixelMap();
                    globalpixelmap = pixelMap;
                    let csm = pixelMap.getColorSpace();
                    logger.log("getColorSpace csm " + csm);
                    let csmn = csm.getColorSpaceName();
                    logger.log("getColorSpaceName " + csmn);
                    expect(csmn == COLORSPACENAME).assertTrue();
                    done();
                } else {
                    logger.log("createimageSource fail");
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                expect(false).assertTrue();
                logger.log("failed " + error);
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SETCOLORSPACE_0100
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_SETCOLORSPACE_0100
         * @tc.desc      : 1.create imagesource
         *                 2.createPixelMap
         *                 3.setColorSpace
         *                 4.getColorSpace and getColorSpaceName
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_SETCOLORSPACE_0100", 0, (done:Function)=> {
            let imageSource = image.createImageSource(testP3.buffer);
            setColor(
                done,
                "SUB_MULTIMEDIA_IMAGE_SETCOLORSPACE_0100",
                imageSource,
                colorSpaceManager.ColorSpace.SRGB
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SETCOLORSPACE_0200
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_SETCOLORSPACE_0200
         * @tc.desc      : 1.create imagesource
         *                 2.createPixelMap
         *                 3.setColorSpace
         *                 4.getColorSpace and getColorSpaceName
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_SETCOLORSPACE_0200", 1, (done:Function)=> {
            let imageSource = image.createImageSource(testImg.buffer);
            setColor(
                done,
                "SUB_MULTIMEDIA_IMAGE_SETCOLORSPACE_0200",
                imageSource,
                colorSpaceManager.ColorSpace.DISPLAY_P3
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SETCOLORSPACE_0300
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_SETCOLORSPACE_0300
         * @tc.desc      : 1.create imagesource
         *                 2.createPixelMap
         *                 3.setColorSpace
         *                 4.getColorSpace and getColorSpaceName
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_SETCOLORSPACE_0300", 1, async (done:Function)=> {
            await getFd("colorspace.jpg");
            let imageSource = image.createImageSource(fdNumber);
            setColor(
                done,
                "SUB_MULTIMEDIA_IMAGE_SETCOLORSPACE_0300",
                imageSource,
                colorSpaceManager.ColorSpace.DISPLAY_P3
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SETCOLORSPACE_0400
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_SETCOLORSPACE_0400
         * @tc.desc      : 1.create imagesource
         *                 2.createPixelMap
         *                 3.setColorSpace
         *                 4.getColorSpace and getColorSpaceName
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_SETCOLORSPACE_0400", 1, async (done:Function)=> {
            await getFd("DisplayP3.png");
            let imageSource = image.createImageSource(fdNumber);
            setColor(
                done,
                "SUB_MULTIMEDIA_IMAGE_SETCOLORSPACE_0400",
                imageSource,
                colorSpaceManager.ColorSpace.SRGB
            );
        });
    });
}
