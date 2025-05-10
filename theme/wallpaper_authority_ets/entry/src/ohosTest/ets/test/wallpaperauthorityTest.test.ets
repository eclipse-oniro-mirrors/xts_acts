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
import wallpaper from '@ohos.wallpaper';
import image from '@ohos.multimedia.image';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import fileio from '@ohos.fileio';

const WALLPAPER_SYSTEM = 0;
const WALLPAPER_LOCKSCREEN = 1;
let imageSourceSystem = '/data/storage/el2/base/haps/wp.png';
let imageSourceLockscreen = '/data/storage/el2/base/haps/wp.png';

export default function wallpaperAuthorityJSUnit() {
    describe('wallpaperAuthorityJSUnit', () => {

        beforeAll(async (done: Function) => {
        const color = new ArrayBuffer(96);
        let opts:image.InitializationOptions={editable:true,pixelFormat:3,size:{height:6,width:6}};
        let pixelMap: image.PixelMap= await image.createPixelMap(color,opts);
        const imagePackerApi=image.createImagePacker();
        let packOpts:image.PackingOption={format:"image/png",quality:98};
        await imagePackerApi.packing(pixelMap,packOpts,async(err:BusinessError,data)=>{
            if (err){
            console.info(`====>packing error:${JSON.stringify(err)}`)
            }else{
            let fd =await fileio.openSync(imageSourceSystem,0o2|0o100,0o666);
            let ret =await fileio.writeSync(fd,data);
            await fileio.close(fd)
            console.log(`====>file write ret:${ret}`)
            done();
            }
        })
        });

        /*
         * @tc.number    testGetColorsCallbackSystem101
         * @tc.name      Test getColors() to obtains the wallpaper colors for the wallpaper of the specified type.
         * @tc.desc      Function test
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('testGetColorsCallbackSystem101', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testGetColorsCallbackSystem101 start-----------------');
            await wallpaper.setWallpaper(imageSourceLockscreen, wallpaper.WallpaperType.WALLPAPER_SYSTEM);
            wallpaper.getColors(WALLPAPER_SYSTEM, (err, RgbaColors) => {
                try {
                    if (err) {
                        console.info('====>testGetColorsCallbackSystem101  fail: ' + JSON.stringify(err));
                        expect(null).assertFail();
                        done();
                    }
                    console.info('====>testGetColorsCallbackSystem101  succesful RgbaColors: ' + JSON.stringify(RgbaColors));
                    expect(Number.isInteger(RgbaColors[0].red)).assertTrue();
                    expect(Number.isInteger(RgbaColors[0].green)).assertTrue();
                    expect(Number.isInteger(RgbaColors[0].blue)).assertTrue();
                    expect(Number.isInteger(RgbaColors[0].alpha)).assertTrue();
                    done();
                } catch (err) {
                    console.info('====>testGetColorsCallbackSystem101  catch err: ' + JSON.stringify(err));
                    done();
                };
            });
            console.info('--------------testGetColorsCallbackSystem101 end-----------------');
        });

        /*
        * @tc.number  testGetColorsPromiseSystem101
        * @tc.name    Test getColors() to obtains the wallpaper colors for the wallpaper of the specified type.
        * @tc.desc    Function test
        * @tc.size    : MediumTest
        * @tc.type    : Function
        * @tc.level   0
        */
        it('testGetColorsPromiseSystem101', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testGetColorsPromiseSystem101 start-----------------');
            await wallpaper.setWallpaper(imageSourceLockscreen, wallpaper.WallpaperType.WALLPAPER_SYSTEM);
            await wallpaper.getColors(WALLPAPER_SYSTEM).then((RgbaColors) => {
                console.info('====>testGetColorsPromiseSystem101  succesful RgbaColors: ' + JSON.stringify(RgbaColors));
                expect(Number.isInteger(RgbaColors[0].red)).assertTrue();
                expect(Number.isInteger(RgbaColors[0].green)).assertTrue();
                expect(Number.isInteger(RgbaColors[0].blue)).assertTrue();
                expect(Number.isInteger(RgbaColors[0].alpha)).assertTrue();
                done();
            }).catch((error: BusinessError) => {
                console.info('====>testGetColorsPromiseSystem101 fail: ' + JSON.stringify(error));
                expect().assertFail();
                done();
            });
            console.info('--------------testGetColorsPromiseSystem101 end-----------------');
        });

        /*
         * @tc.number  testGetColorsCallbackLock102
         * @tc.name    Test getColors() to obtains the wallpaper colors for the wallpaper of the specified type.
         * @tc.desc    Function test
         * @tc.size    : MediumTest
         * @tc.type    : Function
         * @tc.level   0
         */
        it('testGetColorsCallbackLock102', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testGetColorsCallbackLock102 start-----------------');
            await wallpaper.setWallpaper(imageSourceLockscreen, wallpaper.WallpaperType.WALLPAPER_LOCKSCREEN);
            wallpaper.getColors(WALLPAPER_LOCKSCREEN, (err, RgbaColors) => {
                try {
                    if (err) {
                        console.info('====>testGetColorsCallbackLock102  fail: ' + JSON.stringify(err));
                        expect(null).assertFail();
                        done();
                    }
                    console.info('====>testGetColorsCallbackLock102  succesful RgbaColors: ' + JSON.stringify(RgbaColors));
                    expect(Number.isInteger(RgbaColors[0].red)).assertTrue();
                    expect(Number.isInteger(RgbaColors[0].green)).assertTrue();
                    expect(Number.isInteger(RgbaColors[0].blue)).assertTrue();
                    expect(Number.isInteger(RgbaColors[0].alpha)).assertTrue();
                    done();
                } catch (err) {
                    console.info('====>testGetColorsCallbackLock102  catch err: ' + JSON.stringify(err));
                    done();
                };
            });
            console.info('--------------testGetColorsCallbackLock102 end-----------------');
        });

        /*
        * @tc.number  testGetColorsPromiseLock102
        * @tc.name    Test getColors() to obtains the wallpaper colors for the wallpaper of the specified type.
        * @tc.desc    Function test
        * @tc.size    : MediumTest
        * @tc.type    : Function
        * @tc.level   0
        */
        it('testGetColorsPromiseLock102', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testGetColorsPromiseLock102 start-----------------');
            await wallpaper.setWallpaper(imageSourceLockscreen, wallpaper.WallpaperType.WALLPAPER_LOCKSCREEN);
            await wallpaper.getColors(WALLPAPER_LOCKSCREEN).then((RgbaColors) => {
                console.info('====>testGetColorsPromiseLock102  succesful RgbaColors: ' + JSON.stringify(RgbaColors));
                expect(Number.isInteger(RgbaColors[0].red)).assertTrue();
                expect(Number.isInteger(RgbaColors[0].green)).assertTrue();
                expect(Number.isInteger(RgbaColors[0].blue)).assertTrue();
                expect(Number.isInteger(RgbaColors[0].alpha)).assertTrue();
                done();
            }).catch((error: BusinessError) => {
                console.info('====>testGetColorsPromiseLock102 fail: ' + JSON.stringify(error));
                expect().assertFail();
                done();
            });
            console.info('--------------testGetColorsPromiseLock102 end-----------------');
        })

        /*
        * @tc.number  testResetCallbackSystem101
        * @tc.name    Test reset() to removes a wallpaper of the specified type and reset the default one.
        * @tc.desc    Function test
        * @tc.size    : MediumTest
        * @tc.type    : Function
        * @tc.level   0
        */
        it('testResetCallbackSystem101', Level.LEVEL0, async (done: Function) => {
            console.info('--------------testResetCallbackSystem101 start-----------------');
            wallpaper.reset(WALLPAPER_SYSTEM, (err, data) => {
                try {
                    if (err) {
                        console.info('====>testResetCallbackSystem101 fail: ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    console.info('====>testResetCallbackSystem101 successful data: ' + JSON.stringify(data));
                    expect(true).assertTrue();
                    done();
                } catch (err) {
                    console.info('====>testResetCallbackSystem101 catch err : ' + JSON.stringify(err));
                    done();
                }
            })
            console.info('--------------testResetCallbackSystem101 end-----------------');
        });

        /*
        * @tc.number  testResetPromiseSystem101
        * @tc.name    Test reset() to removes a wallpaper of the specified type and reset the default one.
        * @tc.desc    Function test
        * @tc.size    : MediumTest
        * @tc.type    : Function
        * @tc.level   0
        */
        it('testResetPromiseSystem101', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testResetPromiseSystem101 start-----------------');
            await wallpaper.reset(WALLPAPER_SYSTEM).then((data) => {
                console.info('====>testResetPromiseSystem101 successful data : ' + JSON.stringify(data));
                expect(true).assertTrue();
                done();
            }).catch((error: BusinessError) => {
                console.info('====>testResetPromiseSystem101 err : ' + JSON.stringify(error));
                expect().assertFail();
                done();
            });
            console.info('--------------testResetPromiseSystem101 end-----------------');
        });

        /*
        * @tc.number  testResetCallbackLock102
        * @tc.name    Test reset() to removes a wallpaper of the specified type and reset the default one.
        * @tc.desc    Function test
        * @tc.size    : MediumTest
        * @tc.type    : Function
        * @tc.level   0
        */
        it('testResetCallbackLock102', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testResetCallbackLock102 start-----------------');
            wallpaper.reset(WALLPAPER_LOCKSCREEN, (err, data) => {
                try {
                    if (err) {
                        console.info('====>testResetCallbackLock102 fail: ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    console.info('====>testResetCallbackLock102 successful data: ' + JSON.stringify(data));
                    expect(true).assertTrue();
                    done();
                } catch (err) {
                    console.info('====>testResetCallbackLock102 catch err : ' + JSON.stringify(err));
                    done();
                }
            })
            console.info('--------------testResetCallbackLock102 end-----------------');
        });

        /*
        * @tc.number  testResetPromiseLock102
        * @tc.name    Test reset() to removes a wallpaper of the specified type and reset the default one.
        * @tc.desc    Function test
        * @tc.size    : MediumTest
        * @tc.type    : Function
        * @tc.level   0
        */
        it('testResetPromiseLock102', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testResetPromiseLock102 start-----------------');
            await wallpaper.reset(WALLPAPER_LOCKSCREEN).then((data) => {
                console.info('====>testResetPromiseLock102 successful data : ' + JSON.stringify(data));
                expect(true).assertTrue();
                done();
            }).catch((error: BusinessError) => {
                console.info('====>testResetPromiseLock102 err : ' + JSON.stringify(error));
                expect().assertFail();
                done();
            });
            console.info('--------------testResetPromiseLock102 end-----------------');
        });

        /*
        * @tc.number  testSetWallpaperURLPromiseLock104
        * @tc.name    Test setPixelMap() to sets a wallpaper of the specified type based on the uri path from a
                    JPEG or PNG file or the pixel map of a PNG file.
        * @tc.desc    Function test
        * @tc.size    : MediumTest
        * @tc.type    : Function
        * @tc.level   0
        */
        it('testSetWallpaperURLPromiseLock104', Level.LEVEL0, async (done: Function) => {
            console.info('--------------------testSetWallpaperURLPromiseLock104 start------------------' );
            await wallpaper.setWallpaper(imageSourceLockscreen, WALLPAPER_LOCKSCREEN).then((data) => {
                console.info('====>testSetWallpaperURLPromiseLock104 successful data : ' + data);
                expect(true).assertTrue();
                done();
            }).catch((error: BusinessError) => {
                console.info('====>testSetWallpaperURLPromiseLock104 fail: ' + error);
                expect().assertFail();
                done();
            });
            console.info('--------------------testSetWallpaperURLPromiseLock104 end------------------' );
        });

        /*
        * @tc.number  testSetWallpaperURLCallbackSystem103
        * @tc.name    Test setWallpaper() to sets a wallpaper of the specified type based on the uri path from a
                    JPEG or PNG file or the pixel map of a PNG file.
        * @tc.desc    Function test
        * @tc.size    : MediumTest
        * @tc.type    : Function
        * @tc.level   0
        */
        it('testSetWallpaperURLCallbackSystem103', Level.LEVEL2, async (done: Function) => {
            console.info('--------------------testSetWallpaperURLCallbackSystem103 start------------------' );
            wallpaper.setWallpaper(imageSourceSystem, WALLPAPER_SYSTEM, (err, data) => {
                try{
                    if (err) {
                        console.info('====->testSetWallpaperURLCallbackSystem103 err : ' + err);
                        expect().assertFail();
                        done();
                    }
                    console.info('====>testSetWallpaperURLCallbackSystem103 successful data: ' + data);
                    expect(true).assertTrue();
                    done();
                }catch(error){
                    console.info('testSetWallpaperURLCallbackSystem103 catch error: ' + error);
                    done();
                }
            });
            console.info('--------------------testSetWallpaperURLCallbackSystem103 end------------------' );
        });

        /*
        * @tc.number  testSetWallpaperURLPromiseSystem103
        * @tc.name    Test setWallpaper() to sets a wallpaper of the specified type based on the uri path from a
                    JPEG or PNG file or the pixel map of a PNG file.
        * @tc.desc    Function test
        * @tc.size    : MediumTest
        * @tc.type    : Function
        * @tc.level   0
        */
        it('testSetWallpaperURLPromiseSystem103', Level.LEVEL2, async (done: Function) => {
            console.info('--------------------testSetWallpaperURLPromiseSystem103 start------------------' );
            await wallpaper.setWallpaper(imageSourceLockscreen, WALLPAPER_LOCKSCREEN).then((data) => {
                console.info('====>testSetWallpaperURLPromiseSystem103 successful data : ' + data);
                expect(true).assertTrue();
                done();
            }).catch((error: BusinessError) => {
                console.info('====>testSetWallpaperURLPromiseSystem103 fail: ' + error);
                expect().assertFail();
                done();
            });
            console.info('--------------------testSetWallpaperURLPromiseSystem103 end------------------' );
        });

        /*
        * @tc.number  testSetWallpaperURLCallbackLock104
        * @tc.name    Test setWallpaper() to sets a wallpaper of the specified type based on the uri path from a
                    JPEG or PNG file or the pixel map of a PNG file.
        * @tc.desc    Function test
        * @tc.size    : MediumTest
        * @tc.type    : Function
        * @tc.level   0
        */
        it('testSetWallpaperURLCallbackLock104', Level.LEVEL2, async (done: Function) => {
            console.info('--------------------testSetWallpaperURLCallbackLock104 start------------------' );
            wallpaper.setWallpaper(imageSourceSystem, WALLPAPER_LOCKSCREEN, (err, data) => {
                try{
                    if (err) {
                        console.info('====->testSetWallpaperURLCallbackLock104 err : ' + err);
                        expect().assertFail();
                        done();
                    }
                    console.info('====>testSetWallpaperURLCallbackLock104 successful data: ' + data);
                    expect(true).assertTrue();
                    done();
                }catch(error){
                    console.info('testSetWallpaperURLCallbackLock104 catch error: ' + error);
                    done();
                }
            });
            console.info('--------------------testSetWallpaperURLCallbackLock104 end------------------' );
        });

        /*
        * @tc.number  testOnCallback101
        * @tc.name    Test on_colorChange to registers a listener for wallpaper color changes to
                    receive notifications about the changes.
        * @tc.desc    Function test
        * @tc.size    : MediumTest
        * @tc.type    : Function
        * @tc.level   0
        */
        it('testOnCallback101', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testOnCallback101 start-----------------');
            let wallpaperPath = "/data/storage/el2/base/haps/wp.png";
            await wallpaper.reset(wallpaper.WallpaperType.WALLPAPER_LOCKSCREEN)
            try {
                wallpaper.on('colorChange', async (colors, wallpaperType) => {
                    try {
                        console.info('====>testOnCallback101 colors: ' + JSON.stringify(colors));
                        console.info('====>testOnCallback101 wallpaperType: ' + JSON.stringify(wallpaperType));
                        expect(colors != null).assertTrue();
                        expect(wallpaperType != null).assertTrue();
                        wallpaper.off('colorChange')
                        console.info('====>testOnCallback101 off');
                        done();
                    } catch (err) {
                        console.info('====>testOnCallback101 setWallpaper or other err : ' + JSON.stringify(err));
                        done();
                    }
                });
            } catch (err) {
                console.info('====>testOnCallback101 catch err : ' + JSON.stringify(err));
                done();
            }
            await wallpaper.setWallpaper(wallpaperPath, wallpaper.WallpaperType.WALLPAPER_LOCKSCREEN)
            console.info('====>testOnCallback10 setWallpaper successful');
            console.info('--------------testOnCallback101 end-----------------');
        });

        /*
        * @tc.number  testOffCallback101
        * @tc.name    Test on_colorChange to registers a listener for wallpaper color changes to
                    receive notifications about the changes.
        * @tc.desc    Function test
        * @tc.size    : MediumTest
        * @tc.type    : Function
        * @tc.level   0
        */
        it('testOffCallback101', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testOffCallback101 start-----------------');
            let wallpaperPath = "/data/storage/el2/base/haps/wp.png";
            let callbackTimes = 0;
            await wallpaper.reset(wallpaper.WallpaperType.WALLPAPER_SYSTEM)
            try {
                wallpaper.on('colorChange', async (colors, wallpaperType) => {
                    try {
                        console.info('====>testOffCallback101 colors: ' + JSON.stringify(colors));
                        console.info('====>testOffCallback101 wallpaperType: ' + JSON.stringify(wallpaperType));
                        callbackTimes = callbackTimes + 1;
                        console.info('====>testOffCallback101 on callbackTime: ' + callbackTimes);
                        expect(callbackTimes == 1).assertTrue();
                        wallpaper.off('colorChange');
                        await wallpaper.reset(wallpaper.WallpaperType.WALLPAPER_LOCKSCREEN)
                        await wallpaper.setWallpaper(wallpaperPath, wallpaper.WallpaperType.WALLPAPER_LOCKSCREEN)
                        console.info('====>testOffCallback101 setWallpaper successful');
                        console.info('--------------testOffCallback101 end-----------------');
                        done();
                    } catch (err) {
                        console.info('====>testOffCallback101 setWallpaper or other err : ' + JSON.stringify(err));
                        done();
                    }
                });
            } catch (err) {
                console.info('====>testOffCallback101 catch err : ' + JSON.stringify(err));
                done();
            }
            await wallpaper.setWallpaper(wallpaperPath, wallpaper.WallpaperType.WALLPAPER_SYSTEM)
        });

        /*
        * @tc.number  testGetFileCallback101
        * @tc.name    Obtains a file of the wallpaper of the specified type.
        * @tc.desc    Function test
        * @tc.size    : MediumTest
        * @tc.type    : Function
        * @tc.level   0
        */
        it('testGetFileCallback101', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testGetFileCallback101 start-----------------');
            wallpaper.getFile(WALLPAPER_SYSTEM, (err, data) => {
                try {
                    if (err) {
                        console.info('====>testGetFileCallback101 fail: ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    console.info('====>testGetFileCallback101 successful data: ' + JSON.stringify(data));
                    expect(Number.isInteger(data)).assertTrue();
                    done();
                } catch (err) {
                    console.info('====>testGetFileCallback101 catch err : ' + JSON.stringify(err));
                    done();
                }
            });
            console.info('--------------testGetFileCallback101 end-----------------');
        });

        /*
        * @tc.number  testGetFilePromise101
        * @tc.name    Obtains a file of the wallpaper of the specified type.
        * @tc.desc    Function test
        * @tc.size    : MediumTest
        * @tc.type    : Function
        * @tc.level   0
        */
        it('testGetFilePromise101', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testGetFilePromise101 start-----------------');
            await wallpaper.setWallpaper(imageSourceLockscreen, wallpaper.WallpaperType.WALLPAPER_LOCKSCREEN);
            await wallpaper.getFile(WALLPAPER_LOCKSCREEN).then((data) => {
                console.info('====>testGetFilePromise101 successful data : ' + JSON.stringify(data));
                expect(Number.isInteger(data)).assertTrue();
                done();
            }).catch((error: BusinessError) => {
                console.info('====>testGetFilePromise101 err : ' + JSON.stringify(error));
                expect().assertFail();
                done();
            });
            console.info('--------------testGetFilePromise101 end-----------------');
        });


    });
};
