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

        /**
         * @tc.name   testGetColorsCallbackSystem101
         * @tc.number testGetColorsCallbackSystem101
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
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
                    expect(RgbaColors[0] !== null).assertTrue();
                    done();
                } catch (err) {
                    console.info('====>testGetColorsCallbackSystem101  catch err: ' + JSON.stringify(err));
                    done();
                };
            });
            console.info('--------------testGetColorsCallbackSystem101 end-----------------');
        });

        /**
         * @tc.name   testGetColorsPromiseSystem101
         * @tc.number testGetColorsPromiseSystem101
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testGetColorsPromiseSystem101', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testGetColorsPromiseSystem101 start-----------------');
            await wallpaper.setWallpaper(imageSourceLockscreen, wallpaper.WallpaperType.WALLPAPER_SYSTEM);
            await wallpaper.getColors(wallpaper.WallpaperType.WALLPAPER_SYSTEM).then((RgbaColors) => {
                console.info('====>testGetColorsPromiseSystem101  succesful RgbaColors: ' + JSON.stringify(RgbaColors));
                expect(Number.isInteger(RgbaColors[0].red)).assertTrue();
                expect(Number.isInteger(RgbaColors[0].green)).assertTrue();
                expect(Number.isInteger(RgbaColors[0].blue)).assertTrue();
                expect(Number.isInteger(RgbaColors[0].alpha)).assertTrue();
                expect(RgbaColors[0] !== null).assertTrue();
                done();
            }).catch((error: BusinessError) => {
                console.info('====>testGetColorsPromiseSystem101 fail: ' + JSON.stringify(error));
                expect().assertFail();
                done();
            });
            console.info('--------------testGetColorsPromiseSystem101 end-----------------');
        });

        /**
         * @tc.name   testGetColorsCallbackLock102
         * @tc.number testGetColorsCallbackLock102
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
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

        /**
         * @tc.name   testGetColorsPromiseLock102
         * @tc.number testGetColorsPromiseLock102
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testGetColorsPromiseLock102', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testGetColorsPromiseLock102 start-----------------');
            await wallpaper.setWallpaper(imageSourceLockscreen, wallpaper.WallpaperType.WALLPAPER_LOCKSCREEN);
            await wallpaper.getColors(wallpaper.WallpaperType.WALLPAPER_LOCKSCREEN).then((RgbaColors) => {
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

        /**
         * @tc.name   testResetCallbackSystem101
         * @tc.number testResetCallbackSystem101
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testResetCallbackSystem101', Level.LEVEL0, async (done: Function) => {
            console.info('--------------testResetCallbackSystem101 start-----------------');
            wallpaper.reset(wallpaper.WallpaperType.WALLPAPER_SYSTEM, (err, data) => {
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

        /**
         * @tc.name   testResetPromiseSystem101
         * @tc.number testResetPromiseSystem101
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
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

        /**
         * @tc.name   testResetCallbackLock102
         * @tc.number testResetCallbackLock102
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testResetCallbackLock102', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testResetCallbackLock102 start-----------------');
            wallpaper.reset(wallpaper.WallpaperType.WALLPAPER_LOCKSCREEN, (err, data) => {
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

        /**
         * @tc.name   testResetPromiseLock102
         * @tc.number testResetPromiseLock102
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
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

        /**
         * @tc.name   testSetWallpaperURLPromiseLock104
         * @tc.number testSetWallpaperURLPromiseLock104
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
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

        /**
         * @tc.name   testSetWallpaperURLCallbackSystem103
         * @tc.number testSetWallpaperURLCallbackSystem103
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
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

        /**
         * @tc.name   testSetWallpaperURLPromiseSystem103
         * @tc.number testSetWallpaperURLPromiseSystem103
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
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

        /**
         * @tc.name   testSetWallpaperURLCallbackLock104
         * @tc.number testSetWallpaperURLCallbackLock104
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
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

        /**
         * @tc.name   testOnCallback101
         * @tc.number testOnCallback101
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
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

        /**
         * @tc.name   testOffCallback101
         * @tc.number testOffCallback101
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
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
                        wallpaper.off('colorChange', () => {});
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

        /**
         * @tc.name   testGetFileCallback101
         * @tc.number testGetFileCallback101
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
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

        /**
         * @tc.name   testGetFilePromise101
         * @tc.number testGetFilePromise101
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
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

        /**
         * @tc.name   testIsChangePermittedCallback102
         * @tc.number testIsChangePermittedCallback102
         * @tc.desc   Test isChangePermitted() to checks whether to allow the application to change the
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testIsChangePermittedCallback102', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testIsChangePermittedCallback102 start-----------------');
            wallpaper.isChangePermitted((err, data) => {
                try {
                    if (err) {
                        console.info('====>testIsChangePermittedCallback102 fail: ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    console.info('====>testIsChangePermittedCallback102 successful data: ' + JSON.stringify(data));
                    expect(data).assertEqual(true);
                    done();
                } catch (err) {
                    console.info('====>testIsChangePermittedCallback102 catch err : ' + JSON.stringify(err));
                    done();
                }
            })
            console.info('--------------testIsChangePermittedCallback102 end-----------------');
        });

        /**
         * @tc.name   testIsChangePermittedPromise102
         * @tc.number testIsChangePermittedPromise102
         * @tc.desc   Test isChangePermitted() to checks whether to allow the application to change the
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testIsChangePermittedPromise102', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testIsChangePermittedPromise102 start-----------------');
            await wallpaper.isChangePermitted().then((data) => {
                console.info('====>testIsChangePermittedPromise102 successful data : ' + JSON.stringify(data));
                expect(data).assertEqual(true);
                done();
            }).catch((error: BusinessError) => {
                console.info('====>testIsChangePermittedPromise102 err : ' + JSON.stringify(error));
                expect().assertFail();
                done();
            });
            console.info('--------------testIsChangePermittedPromise102 end-----------------');
        });

        /**
         * @tc.name   testIsOperationAllowedCallback102
         * @tc.number testIsOperationAllowedCallback102
         * @tc.desc   Test isOperationAllowed() to checks whether a user is allowed to set wallpapers.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testIsOperationAllowedCallback102', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testIsOperationAllowedCallback102 start-----------------');
            wallpaper.isOperationAllowed((err, data) => {
                try {
                    if (err) {
                        console.info('====>testIsOperationAllowedCallback102 fail: ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    console.info('====>testIsOperationAllowedCallback102 successful data: ' + JSON.stringify(data));
                    expect(data).assertEqual(true);
                    done();
                } catch (err) {
                    console.info('====>testIsOperationAllowedCallback102 catch err : ' + JSON.stringify(err));
                    done();
                }
            })
            console.info('--------------testIsOperationAllowedCallback102 end-----------------');
        });

        /**
         * @tc.name   testIsOperationAllowedPromise102
         * @tc.number testIsOperationAllowedPromise102
         * @tc.desc   Test isOperationAllowed() to checks whether a user is allowed to set wallpapers.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testIsOperationAllowedPromise102', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testIsOperationAllowedPromise102 start-----------------');
            await wallpaper.isOperationAllowed().then((data) => {
                console.info('====>testIsOperationAllowedPromise102 successful data : ' + JSON.stringify(data));
                expect(data).assertEqual(true);
                done();
            }).catch((error: BusinessError) => {
                console.info('====>testIsOperationAllowedPromise102 err : ' + JSON.stringify(error));
                expect().assertFail();
                done();
            });
            console.info('--------------testIsOperationAllowedPromise102 end-----------------');
        });

        /**
         * @tc.name   testSetWallpaperURLCallbackSystem1031
         * @tc.number testSetWallpaperURLCallbackSystem1031
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetWallpaperURLCallbackSystem1031', Level.LEVEL3, async (done: Function) => {
            console.info('====>------testSetWallpaperURLCallbackSystem1031 start------------' );
            wallpaper.setWallpaper(null, WALLPAPER_SYSTEM, (err, data) => {
                try{
                    if (err) {
                        console.info(`====>testSetWallpaperURLCallbackSystem1031 err.code: ${err.code}  err.message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                        done();
                    } else {
                        console.info('====>testSetWallpaperURLCallbackSystem1031 successful data: ' + data);
                        expect().assertFail();
                        done();
                    }  
                } catch (error) {
                    console.info(`====>testSetWallpaperURLCallbackSystem1031 err.code: ${error.code}  err.message: ${error.message}`);
                    expect().assertFail();
                    done();
                }
            });
            console.info('====>-------testSetWallpaperURLCallbackSystem1031 end-----------' );
        });

        /**
         * @tc.name   testSetWallpaperURLCallbackSystem1032
         * @tc.number testSetWallpaperURLCallbackSystem1032
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetWallpaperURLCallbackSystem1032', Level.LEVEL3, async (done: Function) => {
            console.info('====>------testSetWallpaperURLCallbackSystem1032 start------------' );
            wallpaper.setWallpaper(undefined, WALLPAPER_SYSTEM, (err, data) => {
                try{
                    if (err) {
                        console.info(`====>testSetWallpaperURLCallbackSystem1032 err.code: ${err.code}  err.message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                        done();
                    } else {
                        console.info('====>testSetWallpaperURLCallbackSystem1032 successful data: ' + data);
                        expect().assertFail();
                        done();
                    }  
                } catch (error) {
                    console.info(`====>testSetWallpaperURLCallbackSystem1032 err.code: ${error.code}  err.message: ${error.message}`);
                    expect().assertFail();
                    done();
                }
            });
            console.info('====>-------testSetWallpaperURLCallbackSystem1032 end-----------' );
        });

        /**
         * @tc.name   testSetWallpaperURLCallbackSystem1033
         * @tc.number testSetWallpaperURLCallbackSystem1033
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetWallpaperURLCallbackSystem1033', Level.LEVEL3, async (done: Function) => {
            console.info('====>------testSetWallpaperURLCallbackSystem1033 start------------' );
            let path = '';
            wallpaper.setWallpaper(path, WALLPAPER_SYSTEM, (err, data) => {
                try{
                    if (err) {
                        console.info(`====>testSetWallpaperURLCallbackSystem1033 err.code: ${err.code}  err.message: ${err.message}`);
                        expect(err.code).assertEqual(undefined);
                        done();
                    } else {
                        console.info('====>testSetWallpaperURLCallbackSystem1033 successful data: ' + data);
                        expect().assertFail();
                        done();
                    }  
                } catch (error) {
                    console.info(`====>testSetWallpaperURLCallbackSystem1033 err.code: ${error.code}  err.message: ${error.message}`);
                    expect().assertFail();
                    done();
                }
            });
            console.info('====>-------testSetWallpaperURLCallbackSystem1033 end-----------' );
        });

        /**
         * @tc.name   testSetWallpaperURLPromiseSystem1031
         * @tc.number testSetWallpaperURLPromiseSystem1031
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetWallpaperURLPromiseSystem1031', Level.LEVEL3, async (done: Function) => {
            console.info('====>------testSetWallpaperURLPromiseSystem1031 start------------' );
            await wallpaper.setWallpaper(null, WALLPAPER_LOCKSCREEN).then((data) => {
                console.info('====>testSetWallpaperURLPromiseSystem1031 successful data : ' + data);
                expect().assertFail();
                done();
            }).catch((error: BusinessError) => {
                console.info(`====>testSetWallpaperURLPromiseSystem1031 err.code: ${error.code}  err.message: ${error.message}`);
                expect(error.code).assertEqual(401);
                done();
            });
            console.info('====>-------testSetWallpaperURLPromiseSystem1031 end-----------' );
        });

        /**
         * @tc.name   testSetWallpaperURLPromiseSystem1032
         * @tc.number testSetWallpaperURLPromiseSystem1032
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetWallpaperURLPromiseSystem1032', Level.LEVEL3, async (done: Function) => {
            console.info('====>------testSetWallpaperURLPromiseSystem1032 start------------' );
            await wallpaper.setWallpaper(undefined, WALLPAPER_LOCKSCREEN).then((data) => {
                console.info('====>testSetWallpaperURLPromiseSystem1032 successful data : ' + data);
                expect().assertFail();
                done();
            }).catch((error: BusinessError) => {
                console.info(`====>testSetWallpaperURLPromiseSystem1032 err.code: ${error.code}  err.message: ${error.message}`);
                expect(error.code).assertEqual(401);
                done();
            });
            console.info('====>-------testSetWallpaperURLPromiseSystem1032 end-----------' );
        });

        /**
         * @tc.name   testSetWallpaperURLPromiseSystem1033
         * @tc.number testSetWallpaperURLPromiseSystem1033
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetWallpaperURLPromiseSystem1033', Level.LEVEL3, async (done: Function) => {
            console.info('====>------testSetWallpaperURLPromiseSystem1033 start------------' );
            let path = '';
            await wallpaper.setWallpaper(path, WALLPAPER_LOCKSCREEN).then((data) => {
                console.info('====>testSetWallpaperURLPromiseSystem1033 successful data : ' + data);
                expect().assertFail();
                done();
            }).catch((error: BusinessError) => {
                console.info(`====>testSetWallpaperURLPromiseSystem1033 err.code: ${error.code}  err.message: ${error.message}`);
                expect(error.code).assertEqual(undefined);
                done();
            });
            console.info('====>-------testSetWallpaperURLPromiseSystem1033 end-----------' );
        });
    });
};
