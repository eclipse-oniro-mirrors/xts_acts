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

const WALLPAPER_SYSTEM = 0;
const WALLPAPER_LOCKSCREEN = 1;
let imageSourceSystem = '/data/storage/el2/base/haps/wp.png';
let imageSourceLockscreen = '/data/storage/el2/base/haps/wp.png';

export default function wallpaperJSUnit() {
    describe('WallpaperJsunitTest', () => {

        /**
         * @tc.name   testWALLPAPER_SYSTEM
         * @tc.number testWALLPAPER_SYSTEM
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testWALLPAPER_SYSTEM', Level.LEVEL1, async (done: Function) => {
            console.info('--------------testWALLPAPER_SYSTEM start-----------------');
            console.info('wallpaperXTS ===> testWALLPAPER_SYSTEM : ' +
            JSON.stringify(wallpaper.WallpaperType.WALLPAPER_SYSTEM));
            expect(wallpaper.WallpaperType.WALLPAPER_SYSTEM == 0).assertTrue();
            done();
            console.info('--------------testWALLPAPER_SYSTEM end-----------------');
        });

        /**
         * @tc.name   testWALLPAPER_LOCKSCREEN
         * @tc.number testWALLPAPER_LOCKSCREEN
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testWALLPAPER_LOCKSCREEN', Level.LEVEL1, async (done: Function) => {
            console.info('--------------testWALLPAPER_LOCKSCREEN start-----------------');
            console.info('wallpaperXTS ===> testWALLPAPER_LOCKSCREEN : ' +
            JSON.stringify(wallpaper.WallpaperType.WALLPAPER_LOCKSCREEN));
            expect(wallpaper.WallpaperType.WALLPAPER_LOCKSCREEN == 1).assertTrue();
            done();
            console.info('--------------testWALLPAPER_LOCKSCREEN end-----------------');
        });

        /**
         * @tc.name   testGetIdCallbackSystem101
         * @tc.number testGetIdCallbackSystem101
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testGetIdCallbackSystem101', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testGetIdCallbackSystem101 start-----------------');
            wallpaper.getId(wallpaper.WallpaperType.WALLPAPER_SYSTEM, (err, data) => {
                try {
                    if (err) {
                        console.info('====>testGetIdCallbackSystem101 err : ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    console.info('====>testGetIdCallbackSystem101 successful data: ' + JSON.stringify(data));
                    expect(Number.isInteger(data)).assertTrue();
                    done();
                } catch (err) {
                    console.info('====>testGetIdCallbackSystem101 catch err : ' + JSON.stringify(err));
                    done();
                }
            });
            console.info('--------------testGetIdCallbackSystem101 end-----------------');
        });

        /**
         * @tc.name   testGetIdPromiseSystem101
         * @tc.number testGetIdPromiseSystem101
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testGetIdPromiseSystem101', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testGetIdCallbackSystem101 start-----------------');
            await wallpaper.getId(wallpaper.WallpaperType.WALLPAPER_SYSTEM).then((data) => {
                console.info('====>testGetIdCallbackSystem101 data : ' + JSON.stringify(data));
                expect(Number.isInteger(data)).assertTrue();
                done();
            }).catch((error: BusinessError) => {
                console.info('====>testGetIdCallbackSystem101 fail: ' + JSON.stringify(error));
                expect().assertFail();
                done();
            });
            console.info('--------------testGetIdCallbackSystem101 end-----------------');
        })

        /**
         * @tc.name   testGetIdCallbackLock102
         * @tc.number testGetIdCallbackLock102
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testGetIdCallbackLock102', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testGetIdCallbackLock102 start-----------------');
            wallpaper.getId(wallpaper.WallpaperType.WALLPAPER_LOCKSCREEN, (err, data) => {
                try {
                    if (err) {
                        console.info('====>testGetIdCallbackLock102 err : ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    console.info('====>testGetIdCallbackLock102 successful data: ' + JSON.stringify(data));
                    expect(Number.isInteger(data)).assertTrue();
                    done();
                } catch (err) {
                    console.info('====>testGetIdCallbackLock102 catch err : ' + JSON.stringify(err));
                    done();
                }
            });
            console.info('--------------testGetIdCallbackLock102 end-----------------');
        });

        /**
         * @tc.name   testGetIdPromiseLock102
         * @tc.number testGetIdPromiseLock102
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testGetIdPromiseLock102', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testGetIdPromiseLock102 start-----------------');
            await wallpaper.getId(wallpaper.WallpaperType.WALLPAPER_LOCKSCREEN).then((data) => {
                console.info('====>testGetIdPromiseLock102 data : ' + JSON.stringify(data));
                expect(Number.isInteger(data)).assertTrue();
                done();
            }).catch((error: BusinessError) => {
                console.info('====>testGetIdPromiseLock102 fail: ' + JSON.stringify(error));
                expect().assertFail();
                done();
            });
            console.info('--------------testGetIdPromiseLock102 end-----------------');
        });



        /**
         * @tc.name   testGetMinHeightCallback101
         * @tc.number testGetMinHeightCallback101
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testGetMinHeightCallback101', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testGetMinHeightCallback101 start-----------------');
            wallpaper.getMinHeight((err, data) => {
                try {
                    if (err) {
                        console.info('====>testGetMinHeightCallback101 fail: ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    console.info('====>testGetMinHeightCallback101 successful data: ' + JSON.stringify(data));
                    expect(Number.isInteger(data)).assertTrue();
                    done();
                } catch (err) {
                    console.info('====>testGetMinHeightCallback101 catch err : ' + JSON.stringify(err));
                    done();
                }
            });
            console.info('--------------testGetMinHeightCallback101 end-----------------');
        });

        /**
         * @tc.name   testGetMinHeightPromise101
         * @tc.number testGetMinHeightPromise101
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testGetMinHeightPromise101', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testGetMinHeightPromise101 start-----------------');
            await wallpaper.getMinHeight().then((data) => {
                console.info('====>testGetMinHeightPromise101 successful data : ' + JSON.stringify(data));
                expect(Number.isInteger(data)).assertTrue();
                done();
            }).catch((error: BusinessError) => {
                console.info('====>testGetMinHeightPromise101 err : ' + JSON.stringify(error));
                expect().assertFail();
                done();
            });
            console.info('--------------testGetMinHeightPromise101 end-----------------');
        });

        /**
         * @tc.name   testGetMinWidthCallback101
         * @tc.number testGetMinWidthCallback101
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testGetMinWidthCallback101', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testGetMinWidthCallback101 start-----------------');
            wallpaper.getMinWidth((err, data) => {
                try {
                    if (err) {
                        console.info('====>testGetMinWidthCallback101 fail: ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    console.info('====>testGetMinWidthCallback101 successful data: ' + JSON.stringify(data));
                    expect(Number.isInteger(data)).assertTrue();
                    done();
                } catch (err) {
                    console.info('====>testGetMinWidthCallback101 catch err : ' + JSON.stringify(err));
                    done();
                }
            });
            console.info('--------------testGetMinWidthCallback101 end-----------------');
        });

        /**
         * @tc.name   testGetMinWidthPromise101
         * @tc.number testGetMinWidthPromise101
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testGetMinWidthPromise101', Level.LEVEL0, async (done: Function) => {
            console.info('--------------testGetMinWidthPromise101 start-----------------');
            await wallpaper.getMinWidth().then((data) => {
                console.info('====>testGetMinWidthPromise101 successful data : ' + JSON.stringify(data));
                expect(Number.isInteger(data)).assertTrue();
                done();
            }).catch((error: BusinessError) => {
                console.info('====>testGetMinWidthPromise101 err : ' + JSON.stringify(error));
                expect().assertFail();
                done();
            });
            console.info('--------------testGetMinWidthPromise101 end-----------------');
        });

        /**
         * @tc.name   testIsChangePermittedCallback101
         * @tc.number testIsChangePermittedCallback101
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testIsChangePermittedCallback101', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testIsChangePermittedCallback101 start-----------------');
            wallpaper.isChangePermitted((err, data) => {
                try {
                    if (err) {
                        console.info('====>testIsChangePermittedCallback101 fail: ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    console.info('====>testIsChangePermittedCallback101 successful data: ' + JSON.stringify(data));
                    expect(typeof data == "boolean").assertTrue();
                    expect(data).assertEqual(false);
                    done();
                } catch (err) {
                    console.info('====>testIsChangePermittedCallback101 catch err : ' + JSON.stringify(err));
                    done();
                }
            })
            console.info('--------------testIsChangePermittedCallback101 end-----------------');
        });

        /**
         * @tc.name   testIsChangePermittedPromise101
         * @tc.number testIsChangePermittedPromise101
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testIsChangePermittedPromise101', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testIsChangePermittedPromise101 start-----------------');
            await wallpaper.isChangePermitted().then((data) => {
                console.info('====>testIsChangePermittedPromise101 successful data : ' + JSON.stringify(data));
                expect(typeof data == "boolean").assertTrue();
                expect(data).assertEqual(false);
                done();
            }).catch((error: BusinessError) => {
                console.info('====>testIsChangePermittedPromise101 err : ' + JSON.stringify(error));
                expect().assertFail();
                done();
            });
            console.info('--------------testIsChangePermittedPromise101 end-----------------');
        });

        /**
         * @tc.name   testIsOperationAllowedCallback101
         * @tc.number testIsOperationAllowedCallback101
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testIsOperationAllowedCallback101', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testIsOperationAllowedCallback101 start-----------------');
            wallpaper.isOperationAllowed((err, data) => {
                try {
                    if (err) {
                        console.info('====>testIsOperationAllowedCallback101 fail: ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    console.info('====>testIsOperationAllowedCallback101 successful data: ' + JSON.stringify(data));
                    expect(typeof data == "boolean").assertTrue();
                    expect(data).assertEqual(false);
                    done();
                } catch (err) {
                    console.info('====>testIsOperationAllowedCallback101 catch err : ' + JSON.stringify(err));
                    done();
                }
            })
            console.info('--------------testIsOperationAllowedCallback101 end-----------------');
        });

        /**
         * @tc.name   testIsOperationAllowedPromise101
         * @tc.number testIsOperationAllowedPromise101
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testIsOperationAllowedPromise101', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testIsOperationAllowedPromise101 start-----------------');
            await wallpaper.isOperationAllowed().then((data) => {
                console.info('====>testIsOperationAllowedPromise101 successful data : ' + JSON.stringify(data));
                expect(typeof data == "boolean").assertTrue();
                expect(data).assertEqual(false);
                done();
            }).catch((error: BusinessError) => {
                console.info('====>testIsOperationAllowedPromise101 err : ' + JSON.stringify(error));
                expect().assertFail();
                done();
            });
            console.info('--------------testIsOperationAllowedPromise101 end-----------------');
        });



    });
};
