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

const WALLPAPER_SYSTEM = 0;
const WALLPAPER_LOCKSCREEN = 1;
let imageSourceSystem = '/data/storage/el2/base/haps/wp.png';
let imageSourceLockscreen = '/data/storage/el2/base/haps/wp.png';

export default function wallpaperNoPermissionJSUnit() {
    describe('wallpaperNoPermissionTest', () => {

        /**
         * @tc.name   testResetCallbackSystemNoPermission101
         * @tc.number testResetCallbackSystemNoPermission101
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testResetCallbackSystemNoPermission101', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testResetCallbackSystemNoPermission101 start-----------------');
            wallpaper.reset(WALLPAPER_SYSTEM, (err, data) => {
                try {
                    if (err) {
                        console.info('====>testResetCallbackSystemNoPermission101 NoPermission check: ' + JSON.stringify(err));
                        expect(err.code).assertEqual(undefined);
                        done();
                    }else {
                        console.info('====>testResetCallbackSystemNoPermission101 error: ' + JSON.stringify(data));
                        expect().assertFail();
                        done();
                    }
                } catch (err) {
                    console.info('====>testResetCallbackSystemNoPermission101 catch err : ' + JSON.stringify(err));
                    done();
                    console.info('--------------testResetCallbackSystemNoPermission101 end-----------------');
                }
            })
        });

        /**
         * @tc.name   testResetPromiseSystemNoPermission101
         * @tc.number testResetPromiseSystemNoPermission101
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testResetPromiseSystemNoPermission101', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testResetPromiseSystemNoPermission101 start-----------------');
            try{
                console.info('====>testResetPromiseSystemNoPermission101 NoPermission check');
                await wallpaper.reset(WALLPAPER_SYSTEM);
                expect().assertFail();
                done();
            }catch(err){
                console.info('====>testResetPromiseSystemNoPermission101 err : ' + JSON.stringify(err));
                expect(err.code).assertEqual(undefined);
                expect(err.message).assertContain("async call failed");
                done();
                console.info('--------------testResetPromiseSystemNoPermission101 end-----------------');
            }
        });

        /**
         * @tc.name   testResetCallbackLockNoPermission102
         * @tc.number testResetCallbackLockNoPermission102
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testResetCallbackLockNoPermission102', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testResetCallbackLockNoPermission102 start-----------------');
            wallpaper.reset(WALLPAPER_LOCKSCREEN, (err, data) => {
                try {
                    if (err) {
                        console.info('====>testResetCallbackLockNoPermission102 NoPermission check: ' + JSON.stringify(err));
                        expect(err.code).assertEqual(undefined);
                        done();
                    }else {
                        console.info('====>testResetCallbackLockNoPermission102 error: ' + JSON.stringify(data));
                        expect().assertFail();
                        done();
                    }
                } catch (err) {
                    console.info('====>testResetCallbackLockNoPermission102 catch err : ' + JSON.stringify(err));
                    done();
                    console.info('--------------testResetCallbackLockNoPermission102 end-----------------');
                }
            })
        });

        /**
         * @tc.name   testResetPromiseLockNoPermission102
         * @tc.number testResetPromiseLockNoPermission102
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testResetPromiseLockNoPermission102', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testResetPromiseLockNoPermission102 start-----------------');
            try{
                console.info('====>testResetPromiseLockNoPermission102 NoPermission check');
                await wallpaper.reset(WALLPAPER_LOCKSCREEN);
                expect().assertFail();
                done();
            }catch(err){
                console.info('====>testResetPromiseLockNoPermission102 err : ' + JSON.stringify(err));
                expect(err.code).assertEqual(undefined);
                expect(err.message).assertContain("async call failed");
                done();
                console.info('--------------testResetPromiseLockNoPermission102 end-----------------');
            }
        });

        /**
         * @tc.name   testSetWallpaperURLPromiseLockNoPermission104
         * @tc.number testSetWallpaperURLPromiseLockNoPermission104
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testSetWallpaperURLPromiseLockNoPermission104', Level.LEVEL2, async (done: Function) => {
            console.info('--------------------testSetWallpaperURLPromiseLockNoPermission104 start------------------' );
            try{
                console.info('====>testSetWallpaperURLPromiseLockNoPermission104 NoPermission check');
                await wallpaper.setWallpaper(imageSourceLockscreen, WALLPAPER_LOCKSCREEN);
                expect().assertFail();
                done();
            }catch(err){
                console.info('====>testSetWallpaperURLPromiseLockNoPermission104 err : ' + JSON.stringify(err));
                expect(err.code).assertEqual(undefined);
                expect(err.message).assertContain("async call failed");
                done();
                console.info('--------------testSetWallpaperURLPromiseLockNoPermission104 end-----------------');
            }
        });

        /**
         * @tc.name   testSetWallpaperURLCallbackSystemNoPermission103
         * @tc.number testSetWallpaperURLCallbackSystemNoPermission103
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testSetWallpaperURLCallbackSystemNoPermission103', Level.LEVEL2, async (done: Function) => {
            console.info('--------------------testSetWallpaperURLCallbackSystemNoPermission103 start------------------' );
            wallpaper.setWallpaper(imageSourceSystem, WALLPAPER_SYSTEM, (err, data) => {
                try{
                    if (err) {
                        console.info('====->testSetWallpaperURLCallbackSystemNoPermission103 NoPermission check: ' + err);
                        expect(err.code).assertEqual(undefined);
                        done();
                    }else{
                        console.info('====>testSetWallpaperURLCallbackSystemNoPermission103 fail: ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                }catch(error){
                    console.info('testSetWallpaperURLCallbackSystemNoPermission103 catch error: ' + error);
                    done();
                    console.info('--------------------testSetWallpaperURLCallbackSystemNoPermission103 end------------------' );
                }
            });
        });

        /**
         * @tc.name   testSetWallpaperURLPromiseSystemNoPermission103
         * @tc.number testSetWallpaperURLPromiseSystemNoPermission103
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testSetWallpaperURLPromiseSystemNoPermission103', Level.LEVEL2, async (done: Function) => {
            console.info('--------------------testSetWallpaperURLPromiseSystemNoPermission103 start------------------' );
            try{
                console.info('====>testSetWallpaperURLPromiseSystemNoPermission103 NoPermission check');
                await wallpaper.setWallpaper(imageSourceLockscreen, WALLPAPER_SYSTEM);
                expect().assertFail();
                done();
            }catch(err){
                console.info('====>testSetWallpaperURLPromiseSystemNoPermission103 err : ' + JSON.stringify(err));
                expect(err.code).assertEqual(undefined);
                expect(err.message).assertContain("async call failed");
                done();
                console.info('--------------testSetWallpaperURLPromiseSystemNoPermission103 end-----------------');
            }
        });

        /**
         * @tc.name   testSetWallpaperURLCallbackLockNoPermission104
         * @tc.number testSetWallpaperURLCallbackLockNoPermission104
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testSetWallpaperURLCallbackLockNoPermission104', Level.LEVEL2, async (done: Function) => {
            console.info('--------------------testSetWallpaperURLCallbackLockNoPermission104 start------------------' );
            wallpaper.setWallpaper(imageSourceSystem, WALLPAPER_LOCKSCREEN, (err, data) => {
                try{
                    if (err) {
                        console.info('====->testSetWallpaperURLCallbackLockNoPermission104 NoPermission check: ' + err);
                        expect(err.code).assertEqual(undefined);
                        done();
                    }else{
                        console.info('====>testSetWallpaperURLCallbackLockNoPermission104 fail: ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                }catch(error){
                    console.info('testSetWallpaperURLCallbackLockNoPermission104 catch error: ' + error);
                    done();
                    console.info('--------------------testSetWallpaperURLCallbackLockNoPermission104 end------------------' );
                }
            });
        });

        /**
         * @tc.name   testGetFileCallbackNoPermission101
         * @tc.number testGetFileCallbackNoPermission101
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testGetFileCallbackNoPermission101', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testGetFileCallbackNoPermission101 start-----------------');
            wallpaper.getFile(wallpaper.WallpaperType.WALLPAPER_SYSTEM, (err, data) => {
                try {
                    if (err) {
                        console.info('====>testGetFileCallbackNoPermission101 NoPermission check: ' + JSON.stringify(err));
                        expect(err.code).assertEqual(undefined);
                        done();
                    }else{
                        console.info('====>testGetFileCallbackNoPermission101 fail: ' + JSON.stringify(data));
                        expect().assertFail();
                        done();
                    }
                } catch (err) {
                    console.info('====>testGetFileCallbackNoPermission101 catch err : ' + JSON.stringify(err));
                    done();
                }
            });
            console.info('--------------testGetFileCallbackNoPermission101 end-----------------');
        });

        /**
         * @tc.name   testGetFilePromiseNoPermission101
         * @tc.number testGetFilePromiseNoPermission101
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testGetFilePromiseNoPermission101', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testGetFilePromiseNoPermission101 start-----------------');
            try{
                console.info('====>testGetFilePromiseNoPermission101 NoPermission check');
                await wallpaper.getFile(wallpaper.WallpaperType.WALLPAPER_LOCKSCREEN);
                expect().assertFail();
                done();
            }catch(err){
                console.info('====>testGetFilePromiseNoPermission101 err : ' + JSON.stringify(err));
                expect(err.code).assertEqual(undefined);
                expect(err.message).assertContain("async call failed");
                done();
                console.info('--------------testGetFilePromiseNoPermission101 end-----------------');
            }
        });

        /**
         * @tc.name   testGetFileCallbackNoPermission102
         * @tc.number testGetFileCallbackNoPermission102
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testGetFileCallbackNoPermission102', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testGetFileCallbackNoPermission102 start-----------------');
            wallpaper.getFile(wallpaper.WallpaperType.WALLPAPER_LOCKSCREEN, (err, data) => {
                try {
                    if (err) {
                        console.info('====>testGetFileCallbackNoPermission102 NoPermission check: ' + JSON.stringify(err));
                        expect(err.code).assertEqual(undefined);
                        done();
                    }else{
                        console.info('====>testGetFileCallbackNoPermission102 fail: ' + JSON.stringify(data));
                        expect().assertFail();
                        done();
                    }
                } catch (err) {
                    console.info('====>testGetFileCallbackNoPermission102 catch err : ' + JSON.stringify(err));
                    done();
                }
            });
            console.info('--------------testGetFileCallbackNoPermission102 end-----------------');
        });

        /**
         * @tc.name   testGetFilePromiseNoPermission102
         * @tc.number testGetFilePromiseNoPermission102
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testGetFilePromiseNoPermission102', Level.LEVEL2, async (done: Function) => {
            console.info('--------------testGetFilePromiseNoPermission102 start-----------------');
            try{
                console.info('====>testGetFilePromiseNoPermission102 NoPermission check');
                await wallpaper.getFile(wallpaper.WallpaperType.WALLPAPER_SYSTEM);
                expect().assertFail();
                done();
            }catch(err){
                console.info('====>testGetFilePromiseNoPermission102 err : ' + JSON.stringify(err));
                expect(err.code).assertEqual(undefined);
                expect(err.message).assertContain("async call failed");
                done();
                console.info('--------------testGetFilePromiseNoPermission102 end-----------------');
            }
        });

    });
};
