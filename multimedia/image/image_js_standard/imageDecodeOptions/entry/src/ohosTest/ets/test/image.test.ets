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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import featureAbility from "@ohos.ability.featureAbility";
import { BusinessError } from '@ohos.base';


let filePath: ESObject;
let fdNumber: number;
let globalpixelmap: PixelMap;

async function getFd(fileName:string) {
  let context: ESObject = await AppStorage.get('thisContext');
  filePath = context.filesDir + "/" + fileName;
  console.info("image case filePath is " + filePath);
  await fileio
    .open(filePath)
    .then(
      (data) => {
        fdNumber = data;
        console.info("image case open fd success " + fdNumber);
      },
      (err: BusinessError) => {
        console.info("image cese open fd fail" + err);
      }
    )
    .catch((err: BusinessError) => {
      console.info("image case open fd err " + err);
    });
}

interface Options {
  sampleSize: number,
  editable: boolean,
  desiredSize: Size,
  rotate: number,
  desiredPixelFormat: number,
  desiredRegion: DesiredRegion,
  index: number,
}

interface DesiredRegion {
  size: Size,
  x: number,
  y: number
}

interface Size {
  width: number,
  height: number
}


export default function imageDecodeOptions() {
    describe("imageDecodeOptions", () => {


        beforeAll(async () => {
            console.info("beforeAll case");
        });

        beforeEach(() => {
            console.info("beforeEach case");
        });

        afterEach(async () => {
            if (globalpixelmap != undefined) {
                console.info("globalpixelmap release start");
                try {
                    await globalpixelmap.release();
                } catch (error) {
                    console.info("globalpixelmap release fail");
                }
            }
            console.info("afterEach case");
        });

        afterAll(async () => {
            console.info("afterAll case");
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_JPG_0100
         * @tc.name      : createPixelMap(decodingOptions)-pixelformat:RGBA_8888-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_JPG_0100", 0, async (done: Function) => {
            try {
                await getFd("test.jpg");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(
                        "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_JPG_0100 create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions: Options = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_JPG_0100 createPixelMap error  " +
                                    JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            console.info(
                                "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_JPG_0100 success "
                            );
                            expect(pixelmap != undefined).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_JPG_0100 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_JPG_0200
         * @tc.name      : createPixelMap(decodingOptions)-pixelformat:RGB_565-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_JPG_0200", 0, async (done: Function) => {
            try {
                await getFd("test.jpg");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(
                        "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_JPG_0200 create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions: Options = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: 2,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_JPG_0200 createPixelMap error  " +
                                    JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            console.info(
                                "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_JPG_0200 success "
                            );
                            expect(pixelmap != undefined).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_JPG_0200 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_JPG_0300
         * @tc.name      : createPixelMap(decodingOptions)-pixelformat:unknown-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return null
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_JPG_0300", 0, async (done: Function) => {
            try {
                await getFd("test.jpg");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(
                        "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_JPG_0300 create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions: Options = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: 0,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_JPG_0300 createPixelMap error  " +
                                    JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            console.info(
                                "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_JPG_0300 success "
                            );
                            expect(pixelmap != undefined).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_JPG_0300 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0100
         * @tc.name      : createPixelMap(decodingOptions: index 1})-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0100", 0, async (done: Function) => {
            try {
                await getFd("test.jpg");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(
                        "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0100 create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions: Options = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: 0,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                        index: 1,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0100 success ");
                            console.info(
                                "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0100 createPixelMap error " +
                                    JSON.stringify(err)
                            );
                            expect(true).assertTrue();
                            done();
                        } else {
                            console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0100 fail  " + pixelmap);
                            expect(false).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0100 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0200
         * @tc.name      : createPixelMap(decodingOptions:index -1})-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0200", 0, async (done: Function) => {
            try {
                await getFd("test.jpg");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(
                        "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0200 create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions: Options = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: 0,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                        index: -1,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0200 success ");
                            console.info(
                                "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0200 createPixelMap error " +
                                    JSON.stringify(err)
                            );
                            expect(true).assertTrue();
                            done();
                        } else {
                            console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0200 fail  " + pixelmap);
                            expect(false).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0200 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_SAMPLESIZE_0100
         * @tc.name      : createPixelMap(decodingOptions:sampleSize -1})-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_SAMPLESIZE_0100", 0, async (done: Function) => {
            try {
                await getFd("test.jpg");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(
                        "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_SAMPLESIZE_0100 create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions: Options = {
                        sampleSize: -1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: 0,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_SAMPLESIZE_0100 success ");
                            console.info(
                                "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_SAMPLESIZE_0100 createPixelMap error " +
                                    JSON.stringify(err)
                            );
                            expect(true).assertTrue();
                            done();
                        } else {
                            console.info(
                                "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_SAMPLESIZE_0100 fail  " + pixelmap
                            );
                            expect(false).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_SAMPLESIZE_0100 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0100
         * @tc.name      : createPixelMap(decodingOptions:rotate -10})-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0100", 0, async (done: Function) => {
            try {
                await getFd("test.jpg");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(
                        "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0100 create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions: Options = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: -10,
                        desiredPixelFormat: 2,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0100 success ");
                            console.info(
                                "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0100 createPixelMap error " +
                                    JSON.stringify(err)
                            );
                            expect(true).assertTrue();
                            done();
                        } else {
                            console.info(
                                "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0100 fail  " + pixelmap
                            );
                            expect(false).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0100 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_UNSUPPORTED_PIXELFORMAT_0100
         * @tc.name      : createPixelMap(decodingOptions:unsupported pixelformat)-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_UNSUPPORTED_PIXELFORMAT_0100", 0, async (done: Function) => {
            try {
                await getFd("test.jpg");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(
                        "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_UNSUPPORTED_PIXELFORMAT_0100 create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions: Options = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: 60,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_UNSUPPORTED_PIXELFORMAT_0100 success "
                            );
                            console.info(
                                "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_UNSUPPORTED_PIXELFORMAT_0100 createPixelMap error " +
                                    JSON.stringify(err)
                            );
                            expect(true).assertTrue();
                            done();
                        } else {
                            console.info(
                                "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_UNSUPPORTED_PIXELFORMAT_0100 fail  " +
                                    pixelmap
                            );
                            expect(false).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info(
                    "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_UNSUPPORTED_PIXELFORMAT_0100 error: " + error
                );
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_0100
         * @tc.name      : createPixelMap(decodingOptions:editable false})-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_0100", 0, async (done: Function) => {
            try {
                await getFd("test.jpg");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(
                        "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_0100 create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions: Options = {
                        sampleSize: 1,
                        editable: false,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: 2,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_0100 createPixelMap error " +
                                    JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_0100 success ");
                            expect(pixelmap != undefined).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_0100 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0100
         * @tc.name      : createPixelMap(decodingOptions:desiredSize>imagesize)-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0100", 0, async (done: Function) => {
            try {
                await getFd("test.jpg");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(
                        "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0100 create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions: Options = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 10000, height: 10000 },
                        rotate: 10,
                        desiredPixelFormat: 2,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0100 createPixelMap error " +
                                    JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0100 success ");
                            expect(pixelmap != undefined).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0100 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0200
         * @tc.name      : createPixelMap(decodingOptions:desiredRegion>imagesize)-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0200", 0, async (done: Function) => {
            try {
                await getFd("test.jpg");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(
                        "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0200 create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions: Options = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: 2,
                        desiredRegion: { size: { height: 10000, width: 10000 }, x: 0, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0200 createPixelMap err " +
                                    JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            pixelmap
                                .getImageInfo()
                                .then((imageInfo) => {
                                    expect(imageInfo.size.height == 2).assertTrue();
                                    expect(imageInfo.size.width == 1).assertTrue();
                                    console.info(
                                        "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0200 success "
                                    );
                                    console.info("imageInfo height :" + imageInfo.size.height);
                                    console.info("imageInfo width : " + imageInfo.size.width);
                                    done();
                                })
                                .catch((err: BusinessError) => {
                                    console.info(
                                        "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0200 getimageInfo err " +
                                            JSON.stringify(err)
                                    );
                                });
                        }
                    });
                }
            } catch (error) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0200 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0100
         * @tc.name      : createPixelMapdecodingOptions:x -1 y -1)-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0100", 0, async (done: Function) => {
            try {
                await getFd("test.jpg");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0100 create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions: Options = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: 2,
                        desiredRegion: { size: { height: 1, width: 2 }, x: -1, y: -1 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0100 success ");
                            console.info(
                                "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0100 createPixelMap error " +
                                    JSON.stringify(err)
                            );
                            expect(true).assertTrue();
                            done();
                        } else {
                            console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0100 fail  " + pixelmap);
                            expect(false).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0100 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0200
         * @tc.name      : createPixelMap(decodingOptions:x > image.height y > image.width)-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0200", 0, async (done: Function) => {
            try {
                await getFd("test.jpg");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0200 create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions: Options = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: 2,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 10000, y: 10000 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0200 success ");
                            console.info(
                                "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0200 createPixelMap error " +
                                    JSON.stringify(err)
                            );
                            expect(true).assertTrue();
                            done();
                        } else {
                            console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0200 fail  " + pixelmap);
                            expect(false).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0200 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0200
         * @tc.name      : createPixelMap(decodingOptions:rotate>360)-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0200", 0, async (done: Function) => {
            try {
                await getFd("test.jpg");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(
                        "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0200 create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions: Options = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 500,
                        desiredPixelFormat: 2,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 1, y: 2 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0200 success ");
                            console.info(
                                "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0200 createPixelMap error " +
                                    JSON.stringify(err)
                            );
                            expect(true).assertTrue();
                            done();
                        } else {
                            console.info(
                                "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0200 fail  " + pixelmap
                            );
                            expect(false).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0200 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PROMISE_0100
         * @tc.name      : createPixelMap-promise-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PROMISE_0100", 0, async (done: Function) => {
            try {
                await getFd("test.jpg");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(
                        "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PROMISE_0100 create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi
                        .createPixelMap()
                        .then((pixelmap) => {
                            globalpixelmap = pixelmap;
                            console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PROMISE_0100 success ");
                            expect(pixelmap != undefined).assertTrue();
                            done();
                        })
                        .catch((error:BusinessError) => {
                            console.log("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PROMISE_0100 error: " + error);
                            expect().assertFail();
                            done();
                        });
                }
            } catch (error) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PROMISE_0100 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CALLBACK_0100
         * @tc.name      : createPixelMap-callback-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return null
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CALLBACK_0100", 0, async (done: Function) => {
            try {
                await getFd("test.jpg");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(
                        "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CALLBACK_0100 create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.createPixelMap((err, pixelmap) => {
                        globalpixelmap = pixelmap;
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CALLBACK_0100 success ");
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    });
                }
            } catch (error) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CALLBACK_0100 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0100
         * @tc.name      : createPixelMap(decodingOptions)-pixelformat:RGBA_8888-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0100", 0, async (done: Function) => {
            await getFd("moving_test.gif");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(
                    "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0100 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 3,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0100 createPixelMap error " +
                                JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0100 success ");
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0200
         * @tc.name      : createPixelMap(decodingOptions)-pixelformat:RGBA_565-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return null
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0200", 0, async (done: Function) => {
            await getFd("moving_test.gif");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(
                    "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0200 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0200 createPixelMap error " +
                                JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0200 success ");
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0300
         * @tc.name      : createPixelMap(decodingOptions)-pixelformat:unkonwn-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0300", 0, async (done: Function) => {
            await getFd("moving_test.gif");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(
                    "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0300 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 0,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0300 createPixelMap error " +
                                JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0300 success ");
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0300
         * @tc.name      : createPixelMap(decodingOptions:index 1})-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return null
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0300", 0, async (done: Function) => {
            await getFd("moving_test.gif");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0300 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 0,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 1,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0300 createPixelMap error " +
                                JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0300 success ");
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0400
         * @tc.name      : createPixelMap(decodingOptions:index -1})-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return null
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0400", 0, async (done: Function) => {
            await getFd("moving_test.gif");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0400 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 0,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: -1,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0400 success ");
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0400 createPixelMap error " +
                                JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0400 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_SAMPLESIZE_0200
         * @tc.name      : createPixelMap(decodingOptions:sampleSize -1})-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_SAMPLESIZE_0200", 0, async (done: Function) => {
            await getFd("moving_test.gif");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(
                    "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_SAMPLESIZE_0200 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: -1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 0,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_SAMPLESIZE_0200 success ");
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_SAMPLESIZE_0200 createPixelMap error " +
                                JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_SAMPLESIZE_0200 fail  " + pixelmap
                        );
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0300
         * @tc.name      : createPixelMap(decodingOptions:rotate -10})-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0300", 0, async (done: Function) => {
            await getFd("moving_test.gif");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0300 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: -10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0300 success ");
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0300 createPixelMap error " +
                                JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0300 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_UNSUPPORTED_PIXELFORMAT_0200
         * @tc.name      : createPixelMap(decodingOptions:unsupported pixelformat)-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_UNSUPPORTED_PIXELFORMAT_0200", 0, async (done: Function) => {
            await getFd("moving_test.gif");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(
                    "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_UNSUPPORTED_PIXELFORMAT_0200 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 60,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_UNSUPPORTED_PIXELFORMAT_0200 success "
                        );
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_UNSUPPORTED_PIXELFORMAT_0200 createPixelMap error " +
                                JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_UNSUPPORTED_PIXELFORMAT_0200 fail  " +
                                pixelmap
                        );
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_0200
         * @tc.name      : createPixelMap(decodingOptions:editable false})-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_0200", 0, async (done: Function) => {
            await getFd("moving_test.gif");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(
                    "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_0200 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: false,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_0200 createPixelMap error  " +
                                JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_0200 success ");
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0300
         * @tc.name      : createPixelMap(decodingOptions:desiredSize>imagesize)-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0300", 0, async (done: Function) => {
            await getFd("moving_test.gif");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0300 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 10000, height: 10000 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0300 createPixelMap error  " +
                                JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0300 success ");
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0400
         * @tc.name      : createPixelMap(decodingOptions:desiredRegion>imagesize)-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0400", 0, async (done: Function) => {
            await getFd("moving_test.gif");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(" SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0400 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 10000, width: 10000 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0400 createPixelMap error " +
                                JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        pixelmap
                            .getImageInfo()
                            .then((imageInfo) => {
                                expect(imageInfo.size.height == 2).assertTrue();
                                expect(imageInfo.size.width == 1).assertTrue();
                                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0400 success ");
                                console.info("imageInfo height :" + imageInfo.size.height);
                                console.info("imageInfo width : " + imageInfo.size.width);
                                done();
                            })
                            .catch((err: BusinessError) => {
                                console.info(
                                    "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0400 getimageInfo err " +
                                        JSON.stringify(err)
                                );
                            });
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0300
         * @tc.name      : createPixelMapdecodingOptions:x -1 y -1)-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0300", 0, async (done: Function) => {
            await getFd("moving_test.gif");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0300 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: -1, y: -1 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0300 success ");
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0300createPixelMap error " +
                                JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0300 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0400
         * @tc.name      : createPixelMap(decodingOptions:x > image.height y > image.width)-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0400", 0, async (done: Function) => {
            await getFd("moving_test.gif");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0400 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 10000, y: 10000 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0400 success ");
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0400 createPixelMap error " +
                                JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0400 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0400
         * @tc.name      : createPixelMap(decodingOptions:rotate>360)-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0400", 0, async (done: Function) => {
            await getFd("moving_test.gif");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0400 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 500,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 1, y: 2 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0400 success ");
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0400 createPixelMap error " +
                                JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0400 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PROMISE_0200
         * @tc.name      : createPixelMap-promise-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PROMISE_0200", 0, async (done: Function) => {
            await getFd("moving_test.gif");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PROMISE_0200 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi
                    .createPixelMap()
                    .then((pixelmap) => {
                        globalpixelmap = pixelmap;
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PROMISE_0200 success ");
                        expect(pixelmap !== undefined).assertTrue();
                        done();
                    })
                    .catch((error:BusinessError) => {
                        console.log("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PROMISE_0200 error: " + error);
                        expect().assertFail();
                        done();
                    });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CALLBACK_0200
         * @tc.name      : createPixelMap-callback-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return null
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CALLBACK_0200", 0, async (done: Function) => {
            await getFd("moving_test.gif");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CALLBACK_0200 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.createPixelMap((err, pixelmap) => {
                    console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CALLBACK_0200 success ");
                    expect(pixelmap !== undefined).assertTrue();
                    done();
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0400
         * @tc.name      : createPixelMap(decodingOptions)-pixelformat:RGBA_8888-bmp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0400", 0, async (done: Function) => {
            await getFd("test.bmp");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(
                    "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0400 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 3,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0400 createPixelMap error  " +
                                JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0400 success ");
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0500
         * @tc.name      : createPixelMap(decodingOptions)-pixelformat:RGB_565-bmp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0500", 0, async (done: Function) => {
            await getFd("test.bmp");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(
                    "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0500 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0500 createPixelMap error  " +
                                JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0500 success ");
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0600
         * @tc.name      : createPixelMap(decodingOptions)-pixelformat:unkonwn-bmp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0600", 0, async (done: Function) => {
            await getFd("test.bmp");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(
                    "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0600 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 0,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0600 createPixelMap error  " +
                                JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0600 success ");
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0500
         * @tc.name      : createPixelMap(decodingOptions: index 1})-bmp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0500", 0, async (done: Function) => {
            await getFd("test.bmp");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0500 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 0,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 1,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0500 success ");
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0500 createPixelMap error " +
                                JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0500 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0600
         * @tc.name      : createPixelMap(decodingOptions:index -1})-bmp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0600", 0, async (done: Function) => {
            await getFd("test.bmp");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0600 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 0,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: -1,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0600 success ");
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0600 createPixelMap error " +
                                JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0600 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_SAMPLESIZE_0300
         * @tc.name      : createPixelMap(decodingOptions:sampleSize -1})-bmp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_SAMPLESIZE_0300", 0, async (done: Function) => {
            await getFd("test.bmp");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(
                    "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_SAMPLESIZE_0300 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: -1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 0,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_SAMPLESIZE_0300 success ");
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_SAMPLESIZE_0300 createPixelMap error " +
                                JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_SAMPLESIZE_0300 fail  " + pixelmap
                        );
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0500
         * @tc.name      : createPixelMap(decodingOptions:rotate -10})-bmp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0500", 0, async (done: Function) => {
            await getFd("test.bmp");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0500 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: -10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0500 success ");
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0500 createPixelMap error " +
                                JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0500 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_UNSUPPORTED_PIXELFORMAT_0300
         * @tc.name      : createPixelMap(decodingOptions:unsupported pixelformat)-bmp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_UNSUPPORTED_PIXELFORMAT_0300", 0, async (done: Function) => {
            await getFd("test.bmp");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(
                    "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_UNSUPPORTED_PIXELFORMAT_0300 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 60,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_UNSUPPORTED_PIXELFORMAT_0300 success "
                        );
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_UNSUPPORTED_PIXELFORMAT_0300 createPixelMap error " +
                                JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_UNSUPPORTED_PIXELFORMAT_0300 fail  " +
                                pixelmap
                        );
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_0300
         * @tc.name      : createPixelMap(decodingOptions:editable false})-bmp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_0300", 0, async (done: Function) => {
            await getFd("test.bmp");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(
                    "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_0300 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: false,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_0300 createPixelMap error  " +
                                JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_0300 success ");
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0500
         * @tc.name      : createPixelMap(decodingOptions:desiredSize>imagesize)-bmp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0500", 0, async (done: Function) => {
            await getFd("test.bmp");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0500 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1500, height: 1500 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0500 createPixelMap error  " +
                                JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0500 success ");
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0600
         * @tc.name      : createPixelMap(decodingOptions:desiredRegion>imagesize)-bmp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0600", 0, async (done: Function) => {
            await getFd("test.bmp");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(" SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0600 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 10000, width: 10000 }, x: 0, y: 0 },
                    index: 0,
                };

                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0600 createPixelMap error  " +
                                JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        pixelmap
                            .getImageInfo()
                            .then((imageInfo) => {
                                expect(imageInfo.size.height == 2).assertTrue();
                                expect(imageInfo.size.width == 1).assertTrue();
                                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0600 success ");
                                console.info("imageInfo height :" + imageInfo.size.height);
                                console.info("imageInfo width : " + imageInfo.size.width);
                                done();
                            })
                            .catch((err: BusinessError) => {
                                console.info(
                                    "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0600 getimageInfo err " +
                                        JSON.stringify(err)
                                );
                            });
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0500
         * @tc.name      : createPixelMapdecodingOptions:x -1 y -1)-bmp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0500", 0, async (done: Function) => {
            await getFd("test.bmp");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0500 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: -1, y: -1 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0500 success ");
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0500 createPixelMap error " +
                                JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0500 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0600
         * @tc.name      : createPixelMap(decodingOptions:x > image.height y > image.width)-bmp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0600", 0, async (done: Function) => {
            await getFd("test.bmp");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0600 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 10000, y: 10000 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0600 success ");
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0600 createPixelMap error " +
                                JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0600 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0600
         * @tc.name      : createPixelMap(decodingOptions:rotate>360)-bmp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0600", 0, async (done: Function) => {
            await getFd("test.bmp");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0600 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 500,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 1, y: 2 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0600 success ");
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0600 createPixelMap error " +
                                JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0600 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0700
         * @tc.name      : createPixelMap(decodingOptions)-pixelformat:RGBA_8888-png
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0700", 0, async (done: Function) => {
            await getFd("test.png");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(
                    "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0700 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 3,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0700 createPixelMap error  " +
                                JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0700 success ");
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0800
         * @tc.name      : createPixelMap(decodingOptions)-pixelformat:RGB_565-png
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0800", 0, async (done: Function) => {
            await getFd("test.png");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(
                    "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0800 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0800 createPixelMap error  " +
                                JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0800 success ");
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0900
         * @tc.name      : createPixelMap(decodingOptions)-pixelformat:unkonwn-png
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0900", 0, async (done: Function) => {
            await getFd("test.png");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(
                    "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0900 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 0,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0900 createPixelMap error  " +
                                JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_0900 success ");
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0700
         * @tc.name      : createPixelMap(decodingOptions: index 1})-png
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0700", 0, async (done: Function) => {
            await getFd("test.png");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0700 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 0,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 1,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0700 success ");
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0700 createPixelMap error " +
                                JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0700 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0800
         * @tc.name      : createPixelMap(decodingOptions:index -1})-png
         * @tc.desc      : 1.create imagesource
         *                 2.set decodingOptions
         *                 3.call createPixelMap
         *                 4.set index=-1,options
         *                 5.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0800", 0, async (done: Function) => {
            await getFd("test.png");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0800 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 0,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: -1,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0800 success ");
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0800 createPixelMap error " +
                                JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_0800 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_SAMPLESIZE_0400
         * @tc.name      : createPixelMap(decodingOptions:sampleSize -1})-png
         * @tc.desc      : 1.create imagesource
         *                 2.set decodingOptions
         *                 3.call createPixelMap
         *                 4.set index=-1,options
         *                 5.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_SAMPLESIZE_0400", 0, async (done: Function) => {
            await getFd("test.png");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(
                    "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_SAMPLESIZE_0400 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: -1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 0,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_SAMPLESIZE_0400 success ");
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_SAMPLESIZE_0400 createPixelMap error " +
                                JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_SAMPLESIZE_0400 fail  " + pixelmap
                        );
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0700
         * @tc.name      : createPixelMap(decodingOptions:rotate -10})-png
         * @tc.desc      : 1.create imagesource
         *                 2.set decodingOptions
         *                 3.call createPixelMap
         *                 4.set index=-1,options
         *                 5.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0700", 0, async (done: Function) => {
            await getFd("test.png");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0700 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: -10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0700 success ");
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0700 createPixelMap error " +
                                JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0700 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_UNSUPPORTED_PIXELFORMAT_0400
         * @tc.name      : createPixelMap(decodingOptions:unsupported pixelformat)-png
         * @tc.desc      : 1.create imagesource
         *                 2.set decodingOptions
         *                 3.call createPixelMap
         *                 4.set index=-1,options
         *                 5.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_UNSUPPORTED_PIXELFORMAT_0400", 0, async (done: Function) => {
            await getFd("test.png");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(
                    "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_UNSUPPORTED_PIXELFORMAT_0400 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 60,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_UNSUPPORTED_PIXELFORMAT_0400 success "
                        );
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_UNSUPPORTED_PIXELFORMAT_0400 createPixelMap error " +
                                JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_UNSUPPORTED_PIXELFORMAT_0400 fail  " +
                                pixelmap
                        );
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_0400
         * @tc.name      : createPixelMap(decodingOptions:editable false})-png
         * @tc.desc      : 1.create imagesource
         *                 2.set decodingOptions
         *                 3.call createPixelMap
         *                 4.set index=-1,options
         *                 5.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_0400", 0, async (done: Function) => {
            await getFd("test.png");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(
                    "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_0400 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: false,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_0400 createPixelMap error  " +
                                JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_0400 success ");
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0700
         * @tc.name      : createPixelMap(decodingOptions:desiredSize>imagesize)-png
         * @tc.desc      : 1.create imagesource
         *                 2.set decodingOptions
         *                 3.call createPixelMap
         *                 4.set index=-1,options
         *                 5.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0700", 0, async (done: Function) => {
            await getFd("test.png");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0700 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1500, height: 1500 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0700 createPixelMap error  " +
                                JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0700 success ");
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0800
         * @tc.name      : createPixelMap(decodingOptions:desiredRegion>imagesize)-png
         * @tc.desc      : 1.create imagesource
         *                 2.set decodingOptions
         *                 3.call createPixelMap
         *                 4.set index=-1,options
         *                 5.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0800", 0, async (done: Function) => {
            await getFd("test.png");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(" SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0800 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 10000, width: 10000 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0800 createPixelMap error  " +
                                JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        pixelmap
                            .getImageInfo()
                            .then((imageInfo) => {
                                expect(imageInfo.size.height == 2).assertTrue();
                                expect(imageInfo.size.width == 1).assertTrue();
                                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0800 success ");
                                console.info("imageInfo height :" + imageInfo.size.height);
                                console.info("imageInfo width : " + imageInfo.size.width);
                                done();
                            })
                            .catch((err: BusinessError) => {
                                console.info(
                                    "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_0800 getimageInfo err " +
                                        JSON.stringify(err)
                                );
                            });
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0700
         * @tc.name      : createPixelMapdecodingOptions:x -1 y -1)-png
         * @tc.desc      : 1.create imagesource
         *                 2.set decodingOptions
         *                 3.call createPixelMap
         *                 4.set index=-1,options
         *                 5.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0700", 0, async (done: Function) => {
            await getFd("test.png");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0700 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: -1, y: -1 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0700 success ");
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0700 createPixelMap error " +
                                JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0700 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0800
         * @tc.name      : createPixelMap(decodingOptions:x > image.height y > image.width)-png
         * @tc.desc      : 1.create imagesource
         *                 2.set decodingOptions
         *                 3.call createPixelMap
         *                 4.set index=-1,options
         *                 5.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0800", 0, async (done: Function) => {
            await getFd("test.png");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0800 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 10000, y: 10000 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0800 success ");
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0800 createPixelMap error " +
                                JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_XY_0800 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0800
         * @tc.name      : createPixelMap(decodingOptions:rotate>360)-png
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0800", 0, async (done: Function) => {
            await getFd("test.png");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0800 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 500,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 1, y: 2 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0800 success ");
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0800 createPixelMap error " +
                                JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0800 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_UNSUPPORTED_IMAGE_FORMAT_0100
         * @tc.name      : createPixelMap-unsupported image format
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_UNSUPPORTED_IMAGE_FORMAT_0100", 0, async (done: Function) => {
            await getFd("test.tiff");
            const imageSourceApi = image.createImageSource(fdNumber);
            let decodingOptions: Options = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 3,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0,
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (err) {
                    console.info(
                        "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_UNSUPPORTED_IMAGE_FORMAT_0100 success "
                    );
                    console.info(
                        "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_UNSUPPORTED_IMAGE_FORMAT_0100 createPixelMap error " +
                            JSON.stringify(err)
                    );
                    expect(pixelmap == undefined).assertTrue();
                    done();
                } else {
                    console.info(
                        "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_UNSUPPORTED_IMAGE_FORMAT_0100 fail  " + pixelmap
                    );
                    expect(false).assertTrue();
                    done();
                }
            });
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0900
         * @tc.name      : Decode the image to generate a bitmap
         * @tc.desc      : 1.create imagesource
         *                 2.create pixelmap
         *                 3.call getimageinfo
         *                 4.Judging the length and width are opposite to the original
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0900", 0, async (done: Function) => {
            await getFd("test.jpg");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0900 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions: Options = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 90,
                    desiredPixelFormat: 3,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0900 createPixelMap error  " +
                                JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        pixelmap.getImageInfo((error, imageInfo) => {
                            if (error) {
                                console.info(
                                    "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0900 getimageInfo err " +
                                        JSON.stringify(error)
                                );
                                expect(false).assertTrue();
                                done();
                            } else {
                                if (imageInfo != undefined) {
                                    console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0900 success");
                                    expect(imageInfo.size.height == 2).assertTrue();
                                    expect(imageInfo.size.width == 1).assertTrue();
                                    done();
                                } else {
                                    console.info(
                                        "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_0900 imageInfo is empty"
                                    );
                                    expect(false).assertTrue();
                                    done();
                                }
                            }
                        });
                    }
                });
            }
        });

        /**
         * @tc.number   : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CropAndScaleStrategy_0100
         * @tc.name     : CreatePixelMap(decodingOptions)
         * @tc.desc     : 1.create imagesource
                          2.set desiredSize and desiredRegion DecodeOptions
                          3.create PixelMap
                          4.callback return undefined
         * @tc.size     : MEDIUM
         * @tc.type     : Functional
         * @tc.level    : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CropAndScaleStrategy_0100", 0, async (done: Function) => {
            try {
                await getFd("jpeg_test_1440x1920.jpg");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(
                        "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CropAndScaleStrategy_0100 create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let desiredSize: image.Size = { width: 960, height: 1440 };
                    let desiredRegionSize: image.Size = { width: 800, height: 800 };
                    let decodingOptions: image.DecodingOptions = {
                        desiredSize: desiredSize,
                        desiredRegion: { size: desiredRegionSize, x: 0, y: 0},
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CropAndScaleStrategy_0100 createPixelMap error  " +
                                                                                                                 JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            console.info(
                                "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CropAndScaleStrategy_0100 success"
                            );
                            expect(pixelmap != undefined).assertTrue();
                            let imageInfo = pixelmap.getImageInfoSync()
                            expect(imageInfo.size.width == desiredSize.width && imageInfo.size.height == desiredSize.height).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
               console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CropAndScaleStrategy_0100 error: " + error);
               expect(false).assertTrue();
               done(); 
            }
        });

        /**
        * @tc.number   : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CropAndScaleStrategy_0200
        * @tc.name     : CreatePixelMap(decodingOptions)
        * @tc.desc     : 1.create imagesource
                        2.set desiredSize and desiredRegion DecodeOptions
                        3.create PixelMap
                        4.callback return undefined
        * @tc.size     : MEDIUM
        * @tc.type     : Functional
        * @tc.level    : Level 1
        */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CropAndScaleStrategy_0200", 0, async (done: Function) => {
            try {
                await getFd("jpeg_test_1440x1920.jpg");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(
                        "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CropAndScaleStrategy_0200 create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let desiredSize: image.Size = { width: 960, height: 1440 };
                    let desiredRegionSize: image.Size = { width: 800, height: 800 };
                    let decodingOptions: image.DecodingOptions = {
                        desiredSize: desiredSize,
                        desiredRegion: { size: desiredRegionSize, x: 0, y: 0},
                        cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CropAndScaleStrategy_0200 createPixelMap error" +
                                    JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            console.info(
                                "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CropAndScaleStrategy_0200 success"
                            );
                            expect(pixelmap != undefined).assertTrue();
                            let imageInfo = pixelmap.getImageInfoSync()
                            expect(imageInfo.size.width == desiredRegionSize.width && imageInfo.size.height == desiredRegionSize.height).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CropAndScaleStrategy_0200 error: " + error);
                expect(false).assertTrue();
                done(); 
            }
        });

        /**
        * @tc.number   : SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CropAndScaleStrategy_0300
        * @tc.name     : CreatePixelMap(decodingOptions)
        * @tc.desc     : 1.create imagesource
                        2.set desiredSize and desiredRegion DecodeOptions
                        3.create PixelMap
                        4.callback return undefined
        * @tc.size     : MEDIUM
        * @tc.type     : Functional
        * @tc.level    : Level 1
        */
        it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CropAndScaleStrategy_0300", 0, async (done: Function) => {
            try {
                await getFd("jpeg_test_1440x1920.jpg");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(
                        "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CropAndScaleStrategy_0300 create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let desiredSize: image.Size = { width: 960, height: 1440 };
                    let desiredRegionSize: image.Size = { width: 800, height: 800 };
                    let decodingOptions: image.DecodingOptions = {
                        desiredSize: desiredSize,
                        desiredRegion: { size: desiredRegionSize, x: 0, y: 0},
                        cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CropAndScaleStrategy_0300 createPixelMap error  " +
                                    JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            console.info(
                                "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CropAndScaleStrategy_0300 success"
                            );
                            expect(pixelmap != undefined).assertTrue();
                            let imageInfo = pixelmap.getImageInfoSync()
                            expect(imageInfo.size.width == desiredSize.width && imageInfo.size.height == desiredSize.height).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CropAndScaleStrategy_0300 error: " + error);
                expect(false).assertTrue();
                done(); 
            }
        });
    });
}
